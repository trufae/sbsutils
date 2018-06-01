BINS := sblaunch sburlschemes sbopenurl sbbundleids

CFLAGS+=-I$(PWD)/priv/PrivateFrameworks/SpringBoardServices.framework/
CFLAGS+=$(PWD)/priv/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices.tbd

# -framework SpringBoardServices

all: $(BINS)
%: %.c ent.plist
	xcrun --sdk iphoneos gcc $(CFLAGS) -arch arm64 -arch armv7 -o $@ $< -std=gnu99 -framework CoreFoundation
	xcrun --sdk iphoneos codesign -f -s - --entitlements ent.plist $@
clean:
	rm -f $(BINS)

