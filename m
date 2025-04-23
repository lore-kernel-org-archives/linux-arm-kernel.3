Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B658DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uTiOtsGQr8AmpKIzbWpZfUlVXSDf9JMKNvaukSmfWMA=; b=0Z+MVA0+qXqmJ/
	LmxJf7XoifYK5TEJlf+FUHsJRGACX2v8lzt08cI2q2rxaYsGLNC2G481KMh67jY7hzJHUnaZ5JfYU
	rV1hrXV9KlLuEQEaGz6B28ww8RWGleZZO9qWk4Lj1lAiIfnOmqJsBLRiu3P6QvunjePQbFD1xnhAK
	Frq05kZQCxVQp+3sL94FLcKsKM0jVV/tnkZBvl9J43UlCs5Yg9hpHV9Xkc8adnQCARal+1xKIwEDy
	sSBz3YIwcE6fvL6YRzFevRpOAnZEQ5C4Sfr0gcVLV9zMUWTIkkGGM5tT2HhLqk2Gzn+vsz+G7LvIy
	YgU0ubCWbhJU5LUfDQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fIc-0000000BfvT-0uLx;
	Wed, 23 Apr 2025 18:58:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dm3-0000000BFWV-0rqc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:20:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso92502f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428837; x=1746033637; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTiOtsGQr8AmpKIzbWpZfUlVXSDf9JMKNvaukSmfWMA=;
        b=ZHZ3tdPa0LxEpm4CLc/7lWdsDP05sLs5rP1z50LExsYuNENfS7RMo4QyFabbIHRwlR
         8DArRUJvtPMwz5xzmlXEeOTrG4xL3qp9DHSCooq9EDjR1CQsklkXI9wdt2/Z3PerLA3X
         qZgSHTu9JTKJqVnHGuO76ohUSNAeNgcPTMAW9OqUF1cFygUPog86AQs9ZbXcgJLT0d+R
         Q71QuWwyEaWTAziZSR170KlQcWNsOFTCPNJ3bo7QDZGUFPCvsF0RBp/u7qMuapN/cXo5
         eFz/umC5Bnc/8dXkAiiZM0nSiDg+KJw9exH+qF7987mP88M+rfZjHFZVu52NlWaghzbF
         qgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428837; x=1746033637;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTiOtsGQr8AmpKIzbWpZfUlVXSDf9JMKNvaukSmfWMA=;
        b=rNitOYegIHKvXfJROgHeG8flF2DAAXTfQ+0PCx3melofg9qVmK98ySxIjo6uELV6q/
         +/KO0EeZ3tSBIbs8It56IooEdhlRC13zGx3MqDqax6wTOzTBYflotBZ7wqo5UDNEjkQ/
         LqctxuTAY0Vza2kyOTSBNxv3yh6ANfeXA4eSHUZeCTfBBUmiLCNJjFdOZg+aUZ2+B8Ze
         ZievPEoWJ7M2kXyN+TMW0/7ue1GYtFGr2n/dQ0Wdp0MStnFeAmbQMKW+cS4+pSkAZtQr
         3Twdcutk0kCyWiYUUnCKJaul7bXYx8hZ7JVG1OJJZiscnL77Pxmcv5jLIMgnlh72oR0p
         EnMA==
X-Forwarded-Encrypted: i=1; AJvYcCVYj20IvVWTsnG73Apqj0oZ2WuMpwiB1XNjvOCN6PAZprIsiS8Hw9KJNeHgRTjrwAlXgLdkQCRJlhkrsV3m+Z6+@lists.infradead.org
X-Gm-Message-State: AOJu0Yye2lKTM+IbJRcTZdI/bVSA2b+InEgiCXlRg6FMUF6zOHfN95a7
	tcjAb2CO6axI3ouwuFKozU+rmFcJ2xwjQhWdy0H7cqcGlg+Y9N8WVgh/SZJ7cx8=
X-Gm-Gg: ASbGncsoIs00G4Fkj792QcWvQu8m8VnnFhkG5lQmSJt88+F1Zh012u/fnUp/xcr9+EJ
	qe0BBmrfNPfW5uIJFkWsn2P5+pDQa2I7Qw4LH5o6UTZgQp9pA4dJkSjXs4csEi6Qz4lrbDivN9M
	32lRK+AH10rvP2MnpXV13JMIr7G0YHxEqWd8IsX/2E0UCFUOeEFZvyQ7sHCl7zhN/aN+qf/0F7h
	RzcUVXzV7KKPcxyRsRskgy2HJsYRuJ2EKtk3YQcm4bNlihAHRV+CM0MWWan4TVflhacZui+3H3o
	J2cLlI2xZvrX+RANs++r/0p5keePPWfT
X-Google-Smtp-Source: AGHT+IHEwGLKMb6K3hx8eZVU9LboQJDiZ7lIb9o/9dn+E2cEj2qAUuHa62rtr/Jl9/iTDEnr+wF8Cg==
X-Received: by 2002:a05:6000:420d:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-3a0672927f4mr3493131f8f.24.1745428837252;
        Wed, 23 Apr 2025 10:20:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 0/5] Raspberry Pi HEVC decoder driver
Date: Wed, 23 Apr 2025 18:20:17 +0100
Message-Id: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIhCWgC/23NQQ6CMBCF4auQrq1ppxTBlfcwLmg7yCyApjWNh
 HB3C9GVLP+XzDcLixgII7sWCwuYKNI05lCngtm+HZ/IyeVmIKCUIIEP6KjlwRPvMVnu0HJltMG
 LajplHMuHPmBH7x29P3L3FF9TmPcfSW7rlwNxxCXJBRdorBUluhLwFtroDYYwezrbaWAbmuAHa
 QGiOoQgQ1WjtLJ1LbSBf2hd1w+g1eYyAwEAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_102039_434131_CEB7859D 
X-CRM114-Status: GOOD (  25.98  )
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

Hi All

This has been in the pipeline for a while, but I've finally cleaned
up our HEVC decoder driver to be in a shape to at least get a first
review.
John Cox has done almost all of the work under contract to Raspberry
Pi, and I'm largely just doing the process of patch curation and
sending.

There are a couple of questions raised in frameworks.
The main one is that the codec has 2 independent phases to the decode,
CABAC and reconstruction. To keep the decoder operating optimally
means that two requests need to be in process at once, whilst the
current frameworks don't want to allow as there is an implicit
assumption of only a single job being active at once, and
completition returns both buffers and releases the media request.

The OUTPUT queue buffer is finished with and can be returned at the
end of phase 1, but the media request is still required for phase 2.
The frameworks currently force the driver to be returning both
together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
would complete the job without returning the buffer as we need,
however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
then we have a WARN in v4l2_m2m_job_finish.
Dropping the WARN as this series is currently doing isn't going to be
the right answer, but it isn't obvious what the right answer is.
Discussion required.

We also have a need to hold on to the media request for phase 2. John
had discussed this with Ezequiel (and others) a couple of years back,
and hence suggested a patch that adds media_request_{pin,unpin} to
grab references on the media request. Discussion required on that
or a better way of handling it.

I will apologise in advance for sending this V1 just before I head off
on the Christmas break, but will respond to things as soon as possible.

Thanks
  Dave

v4l2-compliance output:
$ ./v4l-utils/build/utils/v4l2-compliance/v4l2-compliance
v4l2-compliance 1.29.0-5324, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3116b579c38d 2025-02-05 14:42:29

Compliance test for rpi-hevc-dec device /dev/video0:

Driver Info:
	Driver name      : rpi-hevc-dec
	Card type        : rpi-hevc-dec
	Bus info         : platform:rpi-hevc-dec
	Driver version   : 6.13.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateless Decoder
Media Driver Info:
	Driver name      : rpi-hevc-dec
	Model            : rpi-hevc-dec
	Serial           : 
	Bus info         : platform:rpi-hevc-dec
	Media version    : 6.13.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.13.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : rpi-hevc-dec-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000004 of entity
'rpi-hevc-dec-proc' (Video Decoder): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
		fail: v4l2-test-controls.cpp(939): try_ext_ctrls
returned an error (22)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 3 Private Controls: 0
	Standard Compound Controls: 5 Private Compound Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK
	test blocking wait: OK

Total for rpi-hevc-dec device /dev/video0: 49, Succeeded: 48, Failed: 1,
Warnings: 0

I'm still working on getting Fluster running by adding support for SAND.
First stumbling block is finding all the points to add the new format -
pointers to an example would be very welcome. I have had it decoding with
Robert Mader's opaque DRM type and modifiers patches, but in a slightly
hacky manner.

Testing is mainly with a downstream patchset to FFmpeg. I'm told FFmpeg
currently has no stateless decode support, but we will be reviewing
works that have been in progress and our downstream patches to see
whether that can be pushed onwards.
Downstream tree is at
https://github.com/jc-kynesim/rpi-ffmpeg/tree/dev/5.1.6/sandm_1

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v3:
- Updated the dtbinding with SoC specific compatible strings (Rob).
- Reordered hevc_dec and v3d in bcm2711.dtsi to keep them in ascending
  register order (Stefan).
- Reordered hevc_dec in bcm2711-rpi.dtsi to keep them in alphabetical
  order (Stefan).
- Tested on top of Nicolas' revised version of Hans' patch set for
  manual request completion.
  https://lore.kernel.org/all/20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com/
- Link to v2: https://lore.kernel.org/r/20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com

Changes in v2:
- Rebased to use Hans' manual request completion scheme.
  https://lore.kernel.org/linux-media/cover.1724928939.git.hverkuil-cisco@xs4all.nl/
- Require all slices for a frame to be submitted in one request.
- Added the missing header file.
- Used the full macro name for pix format docs (Sakari)
- Dropped unneeded |- from dtbinding (Rob)
- Made reg and reg-names match in order (Rob)
- Removed clock-names from dtbinding (Rob)
- Driver changed to not request the clock by name
- Dropped clock-names from DTS file
- Minor fixes for compliance failures
  fail: v4l2-test-formats.cpp(958): fmt_cap.g_colorspace() != col
  fail: v4l2-test-buffers.cpp(901): q.create_bufs(node, 1, &fmt) != EINVAL
- v4l2-compliance output added to cover letter (Nicholas)
  I believe the "fail: v4l2-test-controls.cpp(939): try_ext_ctrls
  returned an error (22)" is expected as it is validating the SPS.
  Hantro and Cedrus certainly both appear to return errors in the same place
- Link to v1: https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com

---
Dave Stevenson (4):
      docs: uapi: media: Document Raspberry Pi NV12 column format
      media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
      media: dt-bindings: media: Add binding for the Raspberry Pi HEVC decoder
      arm: dts: bcm2711-rpi: Add HEVC decoder node

John Cox (1):
      media: platform: Add Raspberry Pi HEVC decoder driver

 .../bindings/media/raspberrypi,hevc-dec.yaml       |   70 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    4 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
 .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
 .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  450 ++++
 .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  189 ++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2542 ++++++++++++++++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.h    |   23 +
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  688 ++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/videodev2.h                     |    4 +
 19 files changed, 4774 insertions(+)
---
base-commit: 3f44deaa552e79966f7d07f4cd4cc2f5216a6999
change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


