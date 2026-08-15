Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65184C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cM0n/v9CSNZPkVilOS4eP+dgGE0SWqCb+AKZIBou57Q=; b=qg8KJJmIX27Qi2smgZsRkQR9Qt
	k5tyBJwNdaH5IdMD1cchRtZSsZtjlb9hzWrOn7Hv/nHRAKNQsrdhjIA7Rwx7rWM6BOjGtP1Zux164
	GpYaz/mn0HTv1b9bIXdWz3579Xj0O75Jr9Ewr0QROzm6S7L4QuVeoUGEMU1WIh+4r87Vc0kws4jzh
	dh/U+NgIe2XhSicCReB/IycozRKGRCwtpYWTdNz4ALFpFdj8Mj5xXF4coBmGNV/nbn2HEiseCL/+y
	3T2LNYNxFEGo8h8yp9c7nbl/aQqrpjN6Cc+tLjkKduGQzyZKAK5IVsLjrHHsCQdOSqhe8t2C8Suo9
	s9zBANQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJJJ-000000045RL-16yL;
	Sat, 15 Aug 2026 18:40:49 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJJ5-000000045Pc-2o7V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:40:37 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51c10ed63c0so442511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786819234; cv=none;
        d=google.com; s=arc-20260327;
        b=SVn8TkxSp6gB5RMsGRqirQRysEIUq+3d9EFysYa9vxCQ3OG08PaRO3a3sTGGtwvLxt
         LRmtI5kZrgcxX5XiNtCW94IHYVb7gmG1vB9VpR2HNWWjt+7xJBqZv1WeI32zu25lSp+s
         WQ6Hz5rWZws048dFHqGjkW//HMezgzFc0OTePNH0CP+F1oRKiHdggZshCgVne+iFr3zl
         iwQ+f1W3bNzohWSty0OoJbFvhmmbQL7d9LvQj6MN64XQoQfLMhuSyuZ0fWPyUy5rLX0w
         VfNzFnhv0hiA8Km7zHI9kOaaoxb9n1Oy7s90f4qpW1yBClEqs7Iu8Ilnnc647K7HRXWF
         cS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cM0n/v9CSNZPkVilOS4eP+dgGE0SWqCb+AKZIBou57Q=;
        fh=fpb8uAx4LhBQ9OpHsWJtOwq+1eLHaFOM5eqjUOl0L2w=;
        b=HFXQKXRgGxqJa4M60eiYB4YYnKTG0BiuMovAmGzEP9HhPd1zMtOh/SO/qLEWB4I6v1
         EzkNWA20WFmpGIaQo2RKSl0o8gHk2x/lgEmJ28RTZuowfrTPBrYnhu/MWtKKArZBS7iV
         +bMqn0FFqR4c1YOGfVKMeS634+0ygavsIYxl7SuMJtoJ+wgXGeqwBRr9Z1uyvu1CoAmk
         PlKvAczOKQoZcvImb6BNDLIvkgEK9vrdySYF3DMIADClPrLckagMXzbf9dL6UOdkw0kt
         hI3VuG9eS+kDRUwGnE8xK2dg3IoqHVYsvFSvwkPsphdqNDOjiXwr9YX45MpweoywyvBN
         0Ddw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786819234; x=1787424034; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cM0n/v9CSNZPkVilOS4eP+dgGE0SWqCb+AKZIBou57Q=;
        b=RvvM1L8gG3UxnPkdSg0Mk2iAa5swAnS4LhTlJdH3oYtwd0BpBKFsiDTKBv/qjL4KeC
         oLeHDQ48Fjit/nH5T1/LxWNpOOy0MDPzRvkMUQ1LSntwsoemP7vV4KGRRr3WIpfdZdPp
         EFkLlKBwsng36aWwrc0NIvV2WdTPy2s0LmmuQFz8x3cvaY2pAeAWf+2BPvBgniJOAOts
         iQwP/pP515NtJWERdBBOrCJG2bENJGQOeJwJ6oAJIKhzMj6jj+Q03hMRQW4bNv8Ool6K
         IUbokScd8B7bto1sluAGHHZgEL+sUTSSIDcbjXMEYpx1/EB/SplP7b6ACgJUqlXkSScr
         su4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786819234; x=1787424034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cM0n/v9CSNZPkVilOS4eP+dgGE0SWqCb+AKZIBou57Q=;
        b=ULsfJ2G9kqDeXfEOsnU2+5LZjZ1h8ExkzoXCGupHv4qj+inE/lDh+d/RgOE9e0PEkN
         PCl2UAUhp4LPPFmnY607yxpSNzTcWflL41Youq7Z1T2AD3CxSWmyaUA0iODy3gjWYK8p
         C3S3BvBjnC7awGBPh//7245kAk+/Ixhu/P8C+raolsf8vYhskUHt3YCeBis1UnVoCrEf
         YtHlJJTFMEzhPmm1cIqiJHvulOMKT8I+wBlFkL4btqZDN3fy3trnJqfcODtg5/0LUyLs
         nwM+JM6G6lPiEK28QtxtEjAgKSYMTfMLULXigWSrLWlPnuiaMMlW3E69ox7+hrKZhTQ1
         9fFQ==
X-Gm-Message-State: AOJu0YwQuaVjLpbiCxodSEJMJNhKPm1BGBXCNoW4JydkNpd6A6L+kF/f
	iBJ+ycI3yS4lBZNdFBSLVVmmkRuWDZ2mpEVGNbgBmzhzKKeADhCLBwPBPKtg7TNFujOwoMe90nn
	VpSuCrWAWDx0h4Ykf/+qmiDBEYgQ1ZqutKzEwp1bm8INcI0Y+mB0TB/BluOg=
X-Gm-Gg: AR+sD12xdjgLszCcqhPdTpXRW2lxVaSPsHVkhSqEwsw2zUeCnOT8LmBVIbAY5doUIDn
	Wd2wKwWO1NdR2StpV0j5NG1nycLw/vulGXiOBcdI/01xSwjLqdHBqT7P/zSBGmC0HtvlEy4LrKz
	kqlntRNCvXNRu0iOFyiWq0ETI0kQucPII37pJhaleMJAvR76sP8DL5Yuh7/qJtPozLZ9s+Cyz9Z
	K2lBvOgG0NcUn5AJS376hd5DqZ4NeuzkkmcL9K0VWDMkjY8ss8PJUg06nBxPsIRbCH5WYFPg9B/
	7Se0OIf2gYjllEPdOQTSIXK95/nU/411D9IoBTK/tU3jAw==
X-Received: by 2002:ac8:6f12:0:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-52d8463bf0dmr5192551cf.4.1786819233616; Sat, 15 Aug 2026
 11:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260815082048.4043217-1-irogers@google.com> <20260815172712.50119-1-irogers@google.com>
In-Reply-To: <20260815172712.50119-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Sat, 15 Aug 2026 11:40:21 -0700
X-Gm-Features: AcwNN1UYlMmOx40Qfkx7nmmfd_CnoRWUIPJvxm0HW-dAz61-gmhbNaolDhGzeG8
Message-ID: <CAP-5=fU2iOANQkoviXOJp=wt-a2A0xfCJSJB0nBs=gq1-PVp4A@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] perf: Add Raspberry Pi AXI PMU driver
To: irogers@google.com, florian.fainelli@broadcom.com, 
	linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_114035_757693_E9CC5259 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Aug 15, 2026 at 10:27=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> Motivation & Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> Currently, Linux lacks a standard perf-API compatible driver for the
> Broadcom AXI performance counter blocks on Raspberry Pi platforms.

The patches now have no Sashiko reported issues except for the
deliberate backward compatibility #ifdef to support earlier than Linux
6.13 builds (I believe Raspberry Pi OS is currently using the LTS
v6.12 kernel and when they switch to v6.18 this can be removed):
https://sashiko.dev/#/patchset/20260815172712.50119-1-irogers%40google.com

If you are testing the patches the easiest way (imo) is to build them
outside the Linux tree doing something like:

# Remove the non-perf driver
$ sudo rmmod raspberrypi_axi_monitor

In a directory have rpi_axi_pmu.c (from the patches) and a Makefile with:
```
obj-m +=3D rpi_axi_pmu.o

KDIR ?=3D /lib/modules/$(shell uname -r)/build
PWD  :=3D $(shell pwd)

default:
        $(MAKE) -C $(KDIR) M=3D$(PWD) modules

clean:
        $(MAKE) -C $(KDIR) M=3D$(PWD) clean
```
then run make and `sudo insmod rpi_axi_pmu.ko`.

On a Raspberry Pi 4 and earlier you should be able to test counters like:
```
$ sudo perf stat -e rpi_axi_pmu/h264_rtrans/,rpi_axi_pmu/h264_wtrans/
-a -- ffmpeg -vcodec h264_v4l2m2m -i test.mp4 -f null -
ffmpeg version 5.1.9-0+deb12u1+rpt1 Copyright (c) 2000-2026 the FFmpeg
developers
  built with gcc 12 (Debian 12.2.0-14+deb12u1)
  configuration: --prefix=3D/usr --extra-version=3D0+deb12u1+rpt1
--toolchain=3Dhardened --incdir=3D/usr/include/aarch64-linux-gnu
--enable-gpl --disable-stripping --disable-mmal --enable-gnutls
--enable-ladspa --enable-libaom --enable-libass --enable-libbluray
--enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2
--enable-libdav1d --enable-libflite --enable-libfontconfig
--enable-libfreetype --enable-libfribidi --enable-libglslang
--enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame
--enable-libmysofa --enable-libopenjpeg --enable-libopenmpt
--enable-libopus --enable-libpulse --enable-librabbitmq
--enable-librist --enable-librubberband --enable-libshine
--enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libsrt
--enable-libssh --enable-libsvtav1 --enable-libtheora
--enable-libtwolame --enable-libvidstab --enable-libvorbis
--enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2
--enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi
--enable-lv2 --enable-omx --enable-openal --enable-opencl
--enable-opengl --enable-sand --enable-sdl2 --disable-sndio
--enable-libjxl --enable-neon --enable-v4l2-request --enable-libudev
--enable-epoxy --libdir=3D/usr/lib/aarch64-linux-gnu --arch=3Darm64
--enable-pocketsphinx --enable-librsvg --enable-libdc1394
--enable-libdrm --enable-vout-drm --enable-libiec61883
--enable-chromaprint --enable-frei0r --enable-libx264
--enable-libplacebo --enable-librav1e --enable-shared
  libavutil      57. 28.100 / 57. 28.100
  libavcodec     59. 37.100 / 59. 37.100
  libavformat    59. 27.100 / 59. 27.100
  libavdevice    59.  7.100 / 59.  7.100
  libavfilter     8. 44.100 /  8. 44.100
  libswscale      6.  7.100 /  6.  7.100
  libswresample   4.  7.100 /  4.  7.100
  libpostproc    56.  6.100 / 56.  6.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'test.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf59.27.100
  Duration: 00:00:05.00, start: 0.000000, bitrate: 204 kb/s
  Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661),
yuv420p(tv, smpte170m, progressive), 640x480, 202 kb/s, SAR 1:1 DAR
4:3, 30 fps, 30 tbr, 15360 tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
      encoder         : Lavc59.37.100 h264_v4l2m2m
[h264_v4l2m2m @ 0x559bdbefb0] Using device /dev/video10
[h264_v4l2m2m @ 0x559bdbefb0] driver 'bcm2835-codec' on card
'bcm2835-codec-decode' in mplane mode
[h264_v4l2m2m @ 0x559bdbefb0] requesting formats: output=3DH264 capture=3DY=
U12
Stream mapping:
  Stream #0:0 -> #0:0 (h264 (h264_v4l2m2m) -> wrapped_avframe (native))
Press [q] to stop, [?] for help
Output #0, null, to 'pipe:':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf59.27.100
  Stream #0:0(und): Video: wrapped_avframe, yuv420p(tv,
smpte170m/bt470m/bt709, progressive), 640x480 [SAR 1:1 DAR 4:3],
q=3D2-31, 200 kb/s, 30 fps, 30 tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
      encoder         : Lavc59.37.100 wrapped_avframe
frame=3D  150 fps=3D0.0 q=3D-0.0 Lsize=3DN/A time=3D00:00:05.00 bitrate=3DN=
/A
speed=3D12.9x
video:69kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB
muxing overhead: unknown

 Performance counter stats for 'system wide':

       429,721,472 Bytes rpi_axi_pmu/h264_rtrans/
       163,431,488 Bytes rpi_axi_pmu/h264_wtrans/

       2.152513625 seconds time elapsed
```

and on a Raspberry Pi 5 like:
```
$ sudo perf stat -e
rpi_axi_pmu/a76_dsu_l3_rtrans/,rpi_axi_pmu/a76_dsu_l3_wtrans/,rpi_axi_pmu/d=
ma_l2_wtrans/
-a -- sh -c 'dd if=3D/dev/zero of=3D/dev/shm/test_ram bs=3D1M count=3D1000 =
&&
rm /dev/shm/test_ram'
1000+0 records in
1000+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 0.255655 s, 4.1 GB/s

 Performance counter stats for 'system wide':

             2,656 Bytes rpi_axi_pmu/a76_dsu_l3_rtrans/
             1,152 Bytes rpi_axi_pmu/a76_dsu_l3_wtrans/
               576 Bytes rpi_axi_pmu/dma_l2_wtrans/

       0.279860667 seconds time elapsed
```

Thanks,
Ian

