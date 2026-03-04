Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EB9EF8FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gS58PCHhXUeCg/x3ti+fIcb8brC8qNHD9Cm+Y/vehio=; b=EDexpm837N+QJg
	M6Mst3g3gbbvG6XVLBXA+LlAGKIqAmMIAjpbNQPldWoWpUYMIo3EMcP/rN7U2lyYI52ldSj9V1tGo
	1zSCb797J/DEqeu1clNTIZ6bgC0ZvhbV9HQCPeWBSYs5TJSuq+P1doHIveHv3E+tCp3k3lSqUWamm
	lqJ/ZRFknUOkJQ3VC5y3y/CQAciXk9tyiRwoHgKbj7NT5KyHai/sOmfCgtjqwrqtlhX1S/QjORqjW
	Of2MCN2xXcV2W3q4Oro+0xrZPLViqo3faFJfvEip3bBvL0/FBc5QCp39crdczc7PixZsAQH+blnEe
	QYBgG6AF8cWHIxSyo5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqq-0000000HJ2c-2fRt;
	Wed, 04 Mar 2026 14:05:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqn-0000000HIxu-3hlG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:05:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-483abed83b6so58303325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 06:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633120; x=1773237920; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gS58PCHhXUeCg/x3ti+fIcb8brC8qNHD9Cm+Y/vehio=;
        b=oUyyftJa3COrVQNZGorM8GnD+3KEQc32UY/GAn9m77WKELOCmHLKbBn5qvBN80x51K
         9fqz/VwEPccKEOe1VZoidBEuUpccPiIcqrBOAq4PVdQKu0b/hy6gNwmeoaxko3EnEhUg
         OAKDc5AWUTN7fCrOoTaUj0kf30UZ8DZydHn3dgnrAkiPEi9+X+xuKkC7c079P33o7NAD
         +0YJZmaONuxhIf0kgKFPyBEoXjAVuyxfLbA21FW0bpPKqI03y2tlmXdt2UBOgLDtpFND
         ndCPF5Mz23p5v+rgv26ELlb8Vcl7kAyRK78Cbr9Ia40AjhQaBYmMGEpdbWFUv32c1+8f
         mdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633120; x=1773237920;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gS58PCHhXUeCg/x3ti+fIcb8brC8qNHD9Cm+Y/vehio=;
        b=ZwYHgRs10zh1YpMCJGtRZLon8Q0GvHxslaTsKpdA2cNQbxibUJi5ljP4X3mYbqh9+D
         U7sPHkOP5TmvIr/3gm2bfcB76r8Zv3sxyut1lO4Mii09oPfCJC2sMuhq8O+mcuvPO+dn
         BBs2Nlvl8kgL9FqUOeywgyWUcQ+QqANfSdmKWvUhcrAH5y94fBp2TUCKQ6NOJv41cJHK
         KsJJtigLKHPxMdq0BBS6PWH5aF3J3Qo8x4oE3nb8pGXlzg0IfTLulZKAnypRYQjP6g0M
         DC5ETMtGd8vn6607oehTHHf798ruGa4dRtf9hudvThugx7Wd7bdjOhlv/+ZSdX0BqOoA
         HIOA==
X-Forwarded-Encrypted: i=1; AJvYcCUrqPuk994STSyHzPqMbIQumz9Yw4cAioZvAHCx1FV3ubu+ceFo9RPALrrMNhNgLvV8aDg3JBX/ohI8VA3+hPS4@lists.infradead.org
X-Gm-Message-State: AOJu0YzoU26KJXwExVsy3U12dSqG7ssL0C+n3j/3yosI0ENN8VkOLAYx
	G55SCOFtiql1ciPdMinmFMaupcjUra3RVyqS0KX90IuBeSwwcW07ZDosebWIgEys2Qg=
X-Gm-Gg: ATEYQzwpN0ajAoV5TommEy4B88AlBDhzRaXnf5DJDzPi+Q/L/VxBd7gPcNSwPgPnoCz
	EicGinBVMX9CjhtcVYuyz0KWYw2ebRGv7K4nIkdRL+PVBiQ2VcnJuBlrzsBGpp8IaN4RMe/fQpv
	b+DfiKxrFh2b0EcQ9eRPIUl5jmpO5eQtcCsH9I6U+373ej4mWrYeiMGi/xnim3PIK0kCBlZQaEb
	jay3BCNGSoUXTTv2vGO+VEHlq4XSR5ABG0W27CXmqSME7qd+KsdPCrzJBmhWCleZIWVLDF1HwMd
	JWedcHFGQDOUQ2NAbGCA/ZMlgD+Uy4j0PIHKxEfr82UQ2ccurUaOXT8FfMwV7bmUuE93bkckTyD
	xInltf7AxaX3+IDD8Cr/ILsuYa8KUcsmQrVRxxeSszDjp6fGkXOBvdAKtRbnXCAjjqUghHe85wv
	AGqbMtdURQmnE8Pw==
X-Received: by 2002:a05:600c:6487:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-485198284c2mr33119295e9.3.1772633119549;
        Wed, 04 Mar 2026 06:05:19 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:19 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v6 0/6] Raspberry Pi HEVC decoder driver
Date: Wed, 04 Mar 2026 14:05:13 +0000
Message-Id: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABk8qGkC/23Qu27DMAwF0F8JNFeFROphZ+p/FB30oGoNiQ2pE
 BoE/vfKQYMsGi8BngvyziqVTJWdT3dWqOWa12sP5u3EwuKu38Rz7JmBACVBAr9QzI6XLfOFWuC
 RAkevPVmcE/rI+uJWKOXfB/r51fOS689abo+OJo/pPwdixDXJBRfkQxCKogL6KK5unkq5bfk9r
 Bd2oA2ekBYgzBCCDpkZNYZpEtrDGMIXpACHEHZoShGTizKa5MeQekFWyCGkjtO0DclpJaW1Y0g
 /ISMA7BDSHZq9xxTkJE0c/Gjf9z8arx9x3gEAAA==
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
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060522_149893_17A7DF54 
X-CRM114-Status: GOOD (  23.75  )
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
up our HEVC decoder driver to be in a shape to upstream.
John Cox has done almost all of the work under contract to Raspberry
Pi, and I'm largely just doing the process of patch curation and
sending.

Thanks
  Dave

v4l2-compliance 1.33.0-5448, 64 bits, 64-bit time_t
v4l2-compliance SHA: bd0aabb96710 2026-02-09 17:38:28

Compliance test for rpi-hevc-dec device /dev/video0:

Driver Info:
	Driver name      : rpi-hevc-dec
	Card type        : rpi-hevc-dec
	Bus info         : platform:rpi-hevc-dec
	Driver version   : 6.19.0
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
	Media version    : 6.19.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : rpi-hevc-dec-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000004 of entity 'rpi-hevc-dec-proc' (Video Decoder): Data, Enabled, Immutable

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
		fail: v4l2-test-controls.cpp(942): try_ext_ctrls returned an error (22)
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

Total for rpi-hevc-dec device /dev/video0: 49, Succeeded: 48, Failed: 1, Warnings: 0

Testing is with a downstream patchset to FFmpeg. I'm told FFmpeg
currently has no stateless decode support, but we will be reviewing
works that have been in progress and our downstream patches to see
whether that can be pushed onwards.
Downstream tree is at
https://github.com/jc-kynesim/rpi-ffmpeg/tree/test/7.1.2/main

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9247
adds support for the new formats to GStreamer, and runs Fluster.
Using the JCT-VC-HEVC_V1 test suite we get 142 passes out of 147 tests.
PICSIZE_[ABCD]_Bossen_1 all fail due to the image sizes being greater than
the 4096x4096 limit of this driver.
TSUNEQBD_A_MAIN10_Technicolor_2 fails as the hardware doesn't support
having a different bit depth for luma and chroma.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v6:
- Fixed up assigned by unused variable (ctrl) in hevc_d_init_ctrls
  (reported by CI).
- Fixed up documentation links (reported by CI)
- Link to v5: https://lore.kernel.org/r/20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com

Changes in v5:
- Updated driver based on Nicolas' review comments of V4.
- Added NV12MT_COL128 to ./drivers/media/v4l2-core/v4l2-common.c. The
  10 bit format can't be represented with v4l2_format_info at present
  as it assumes a power of 2 block size.
- Switched to kzalloc_obj/kzalloc_objs as checkpatch now checks that.
- Link to v4: https://lore.kernel.org/r/20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com

Changes in v4:
- dt-bindings: Drop to just SoC compatibles and updated description (Krzysztof).
- dts: Corrected address in node name.
- NV12MT_COL128 format description added vertical alignment to a
  multiple of 8 (Nicolas)
- driver: Merged in driver updates based on Nicolas' review.
- driver: Added debug module parameter to avoid log spam due to some bitstreams.
- cover-letter: Added Fluster results.
- rebased and based on the updated version of 
  https://lore.kernel.org/linux-media/20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com/
- update v4l2-compliance output
- Link to v3: https://lore.kernel.org/r/20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com

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
      dt-bindings: media: Add the Raspberry Pi HEVC decoder
      arm: dts: bcm2711-rpi: Add HEVC decoder node

John Cox (2):
      docs: uapi: media: Clarify HEVC slice_param bit_size, data_byte_offset
      media: platform: Add Raspberry Pi HEVC decoder driver

 .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
 .../media/v4l/ext-ctrls-codec-stateless.rst        |    6 +-
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   46 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    4 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
 .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
 .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  325 +++
 .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  195 ++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2436 ++++++++++++++++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.h    |   22 +
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  429 ++++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  317 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  634 +++++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
 drivers/media/v4l2-core/v4l2-common.c              |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/videodev2.h                     |    4 +
 21 files changed, 4573 insertions(+), 2 deletions(-)
---
base-commit: 1512bd6430c7be7723724f31a74c3b8aaacf8a20
change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


