Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eXGXqOEwJam6RDotBdgvQyDYf1RStbagw5W5iQEwz+4=; b=cBAY+K9gYYXfQt
	WBizz+8QYXoLbOdBvmOvPMn97HMlkAQNSe4h/F2GxWrYkw5QVDUiBCPSyzYopf+0mX8MrzMhy5LzW
	BCJE2IMf0L5FVV6fcewscXHmf7m6NgQMrTWnVqATXW8jt3gf4KYX+gS6M110wVJE1VWtxOZkrdsd4
	x3O199rSS7wR0/kH2XhgsOIeExE3OBHuk7yrdwqLTU/D+DEG/XuO9TKK5dJ7MpzMKNFUbjggf/P9p
	G0In2JYIZTBUA2WovB5+Tx8lwI0bda2QeagaISFOeSEgpFevVg+qWSivHslIWZE6adLDUTOybt36/
	/k3/UZ0momwEpCOkCGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOb-0000000AEZU-16k8;
	Thu, 02 Oct 2025 10:18:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOV-0000000AEW0-2ZW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:18:42 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5812717D8;
	Thu,  2 Oct 2025 12:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400227;
	bh=JV44VMPqvK73HOS1UcH+czOLDoOFnvxChA2VJXVSlM0=;
	h=From:Subject:Date:To:Cc:From;
	b=jMUt/yBbhH1ViWXSystcpqBeiDFxP9G/T6AsvC5NcTuSDdaIndBPfImrFLpayKRDm
	 Je3G8OY2zZ1DESh+S77Ht9U+JBhMc776SFBp6k8STqxj2OaRyW0sEPY8E7rvl9RsML
	 7VN9GPQaCb2ym+FV59nzsYqkwZXw4B9If9jNfrH4=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v12 00/15] Add Arm Mali-C55 Image Signal Processor Driver
Date: Thu, 02 Oct 2025 11:18:19 +0100
Message-Id: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGtR3mgC/22QzW7DIBCEX8XiXKJd/hx86ntUPWBYN0j+SYBai
 aK8e4nbKq3aA4fd5RvNzJVlSpEy65orS7TGHJe5DiieGuYPbn4jHkNdMAFCgxGKe615L700vSA
 Me8/qz2OiIZ43mZfXOg9pmXg5JHIPVqNFJRXYndKIABx5cPMuezeOl+cYyOVl7heXws4v05dqo
 tN79VQ+pVnvMvF6nWLpGiBB1IKwSEY5CQNJYw34vRZWtcIEqRyCJPYzStdsZlpATudCc479SPz
 okpuoUMp8dWMMrtQauN9LHNpBew99t2p2T3aIuSzpsvW1ImyuflVTlxy4VoMMCq2xFv5muwuti
 A+4xW8YK9x7AaRMfcL9A99utw9IxiA9twEAAA==
X-Change-ID: 20250624-c55-b3c36b2e1d8c
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=43883;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=JV44VMPqvK73HOS1UcH+czOLDoOFnvxChA2VJXVSlM0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF3qVIKfdgLTyIazjr2MgOMndjnQhOPuD/88
 9YHtv6kQc2JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5RdwAKCRDISVd6bEV1
 MjI5D/9nGjGmDmMlQCw9zgbx9jwDJRcOGmTWtV504886EvLGxm9u2iHq4Kt++LCOABx71YGZ9QB
 EK7QZdF8SEotTg1Hj1GBppbw0RP7kD/th6xWncJCZ4tdPROS6InNATTIqh5HTxIdXcCVFlOhcw6
 ex+UOFaAVw5HEKyKVDMYxz1Iyh2RTdoklm9aDsiqpiEW4wzwTmpbSFoO2u53EuUwtYCE63EOSRV
 d546po7p/cjuvB85a+CwYSVsb035wHgjWZ9sIjXIP5wTXtRCHkwH44DApjbtKGyiwsdmOaOdwkE
 eTfXFGZdP/5wD4/0plwsqS8VKIOhOvSMwnP3lCUOp+TqSXVc7dx2a2lVS/a4j5kqvCF2aGT4xIx
 YPwiYVnAJACupvRRs8OmAmvqMlI6wS7A9BtESz61JeMteWJJnrQMp0jzFf62oOX5mDl6M+LiAS/
 TwMiFvxxe/OEH8Qk9Y7r9ZBU0A8umTTxY708IvBFLYR38kjCr/Hj4YfMVwkGw2SdnMWhmlykYve
 vuhGQu40B1WOVSQ8RQtXvJZeVWxB0KI91aV8oLwZvC/Q8tPLrBGyG+Y78Ljl4AtnX0WIaEVUSG2
 +r6FcWqetpPcwGiTgBj8DI/GpvFSaZ9WkD3QK49SpCah1cxtXIXj7efpdtuuGYvK5qP2aoFTEfM
 5/fdJn11+6BeazA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031840_108089_E0A74BA8 
X-CRM114-Status: GOOD (  14.58  )
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

Hello all

Quick note at the top, this series now uses the v4l2 generic ISP support
series that was recently posted [1] so is based on top of that set.

Dan

---
Changes in v12:
- Dropped the patches adding the .pipeline_started() and .pipeline_stopped()
  operations and the helpers that worked with them to reduce the dependencies
  for the series, with the intention of merging them on top later.
- Dropped the patches adding the RAW14 and RAW16 info, as they have since
  been added.

---------

Original cover message:

This patchset introduces a driver for Arm's Mali-C55 Image Signal Processor.
The driver uses the V4L2 / media controller API and implements both of the ISP's
capture pipelines allowing a range of output formats plus downscaling and
cropping. The capture pipelines are named "Full resolution" and "Downscale" and
so abbreviated FR and DS throughout the driver.

The driver exposes 4 V4L2 subdevices:

- mali-c55 isp: input data formatting
- mali-c55 tpg: test pattern generator (modeled as a camera sensor entity)
- mali-c55 resizer fr: downscale / crop and format setting for the FR pipe
- mali-c55 resizer ds: downscale / crop and format setting for the DS pipe

Along with 4 V4L2 Video devices:

- mali-c55 fr: Capture device for the full resolution pipe
- mali-c55 ds: Capture device for the downscale pipe
- mali-c55 3a stats: Capture device for statistics to support 3A algorithms
- mali-c55 3a params: Output device for parameter buffers to configure the ISP

Support is implemented in the parameters video device code for many of the ISP'S
hardware blocks, but not yet all of them. The buffer format is (as far as I am
aware anyway) a novel design that we intend to be extensible so that support for
the C55's remaining hardware blocks can be added later.

Patches 1, 4, 5, 6 and 7 have already had versions 1-4 on the mailing list...I
decided to post the additional work on the driver as extra patches rather than
merge them all into the existing series as it's already a lot of code to review
and I hoped that that might make it a little easier...if I'm wrong and that's
not liked I can just squash them into a much smaller series.

Previous versions:

v11: https://lore.kernel.org/r/20250714-c55-v11-0-bc20e460e42a@ideasonboard.com
v10: https://lore.kernel.org/r/20250624-c55-v10-0-54f3d4196990@ideasonboard.com
v9: https://lore.kernel.org/linux-media/20250519143409.451100-1-dan.scally@ideasonboard.com/#t
v8: https://lore.kernel.org/linux-media/20241106100534.768400-1-dan.scally@ideasonboard.com/
v7: https://lore.kernel.org/linux-media/20240906153406.650105-1-dan.scally@ideasonboard.com/
v6: https://lore.kernel.org/linux-media/20240709132906.3198927-1-dan.scally@ideasonboard.com/
v5: https://lore.kernel.org/linux-media/20240529152858.183799-1-dan.scally@ideasonboard.com/
v4: https://lore.kernel.org/linux-media/20240418090825.624747-1-dan.scally@ideasonboard.com/
v3: https://lore.kernel.org/linux-media/20240305164832.2055437-1-dan.scally@ideasonboard.com/
v2: https://lore.kernel.org/linux-media/20240214141906.245685-1-dan.scally@ideasonboard.com/
v1: https://lore.kernel.org/linux-media/20240131164709.810587-1-dan.scally@ideasonboard.com/

The rest of this message comprises the v4l2-compliance report for the driver.
The tool reports 4 failures, which are because height and width are set to 0 for
MEDIA_BUS_FMT_METADATA_FIXED in the ISP subdev, but this is as directed by the
documentation [2] so I suspect that v4l2-compliance needs amending.

[1] https://lore.kernel.org/linux-media/20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com/
[2] Documentation/userspace-api/media/v4l-subdev-formats.rst

v4l2-compliance 1.29.0-5246, 64 bits, 64-bit time_t
v4l2-compliance SHA: 201ccf743cde 2024-09-06 07:16:29

Compliance test for mali-c55 device /dev/media0:

Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 8 Interfaces: 8 Pads: 15 Links: 16
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for mali-c55 device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/video0:

Driver Info:
	Driver name      : mali-c55
	Card type        : ARM Mali-C55 ISP
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x0300000f
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000d (13)
	Name             : mali-c55 fr
	Function         : V4L2 I/O
	Pad 0x0100000e   : 0: Sink
	  Link 0x0200001f: from remote pad 0x100000b of entity 'mali-c55 resizer fr' (Video Scaler): Data, Enabled

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
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

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

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mali-c55 device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/video1:

Driver Info:
	Driver name      : mali-c55
	Card type        : ARM Mali-C55 ISP
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0xac200000
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x2c200000
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000013
	Type             : V4L Video
Entity Info:
	ID               : 0x00000011 (17)
	Name             : mali-c55 3a params
	Function         : V4L2 I/O
	Pad 0x01000012   : 0: Source
	  Link 0x02000023: to remote pad 0x1000008 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
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
	test VIDIOC_G/S/ENUMOUTPUT: OK
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 1 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Output 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Output 0):
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

Codec ioctls (Output 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Output 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mali-c55 device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/video2:

Driver Info:
	Driver name      : mali-c55
	Card type        : ARM Mali-C55 ISP
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0x84a00000
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000017
	Type             : V4L Video
Entity Info:
	ID               : 0x00000015 (21)
	Name             : mali-c55 3a stats
	Function         : V4L2 I/O
	Pad 0x01000016   : 0: Sink
	  Link 0x02000021: from remote pad 0x1000007 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mali-c55 device /dev/video2: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rzv2h-ivc device /dev/video3:

Driver Info:
	Driver name      : rzv2h-ivc
	Card type        : Renesas Input Video Control
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0x84200002
		Video Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200002
		Video Output
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x0300002a
	Type             : V4L Video
Entity Info:
	ID               : 0x00000028 (40)
	Name             : rzv2h-ivc
	Function         : V4L2 I/O
	Pad 0x01000029   : 0: Source
	  Link 0x02000036: to remote pad 0x1000026 of entity 'rzv2h ivc block' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for rzv2h-ivc device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev0:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x0300002e
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : mali-c55 tpg
	Function         : Camera Sensor
	Pad 0x01000002   : 0: Source
	  Link 0x02000019: to remote pad 0x1000004 of entity 'mali-c55 isp' (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device ioctls (Source Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 6 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev0: 54, Succeeded: 54, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev1:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000030
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000003 (3)
	Name             : mali-c55 isp
	Function         : Image Signal Processor
	Pad 0x01000004   : 0: Sink, Must Connect
	  Link 0x02000019: from remote pad 0x1000002 of entity 'mali-c55 tpg' (Camera Sensor): Data
	  Link 0x0200002c: from remote pad 0x1000027 of entity 'rzv2h ivc block' (V4L2 I/O): Data, Enabled
	Pad 0x01000005   : 1: Source
	  Link 0x0200001b: to remote pad 0x100000a of entity 'mali-c55 resizer fr' (Video Scaler): Data, Enabled, Immutable
	Pad 0x01000006   : 2: Source
	  Link 0x0200001d: to remote pad 0x100000c of entity 'mali-c55 resizer fr' (Video Scaler): Data, Enabled, Immutable
	Pad 0x01000007   : 3: Source
	  Link 0x02000021: to remote pad 0x1000016 of entity 'mali-c55 3a stats' (V4L2 I/O): Data, Enabled
	Pad 0x01000008   : 4: Sink
	  Link 0x02000023: from remote pad 0x1000012 of entity 'mali-c55 3a params' (V4L2 I/O): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev1 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 4):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 1 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev1: 82, Succeeded: 78, Failed: 4, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev2:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000032
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000009 (9)
	Name             : mali-c55 resizer fr
	Function         : Video Scaler
	Pad 0x0100000a   : 0: Sink
	  Link 0x0200001b: from remote pad 0x1000005 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled, Immutable
	Pad 0x0100000b   : 1: Source
	  Link 0x0200001f: to remote pad 0x100000e of entity 'mali-c55 fr' (V4L2 I/O): Data, Enabled
	Pad 0x0100000c   : 2: Sink
	  Link 0x0200001d: from remote pad 0x1000006 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev2 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev2: 63, Succeeded: 63, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev3:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000034
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000025 (37)
	Name             : rzv2h ivc block
	Function         : V4L2 I/O
	Pad 0x01000026   : 0: Sink
	  Link 0x02000036: from remote pad 0x1000029 of entity 'rzv2h-ivc' (V4L2 I/O): Data, Enabled, Immutable
	Pad 0x01000027   : 1: Source
	  Link 0x0200002c: to remote pad 0x1000004 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev3 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev3: 61, Succeeded: 61, Failed: 0, Warnings: 0

Grand Total for mali-c55 device /dev/media0: 464, Succeeded: 460, Failed: 4, Warnings: 0

To: linux-media@vger.kernel.org
To: devicetree@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com
Cc: jacopo.mondi@ideasonboard.com
Cc: nayden.kanchev@arm.com
Cc: robh+dt@kernel.org
Cc: mchehab@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org
Cc: conor+dt@kernel.org
Cc: jerome.forissier@linaro.org
Cc: kieran.bingham@ideasonboard.com
Cc: laurent.pinchart@ideasonboard.com
Cc: sakari.ailus@iki.fi
Cc: dan.scally@ideasonboard.com

---

---
Daniel Scally (14):
      media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
      media: uapi: Add 20-bit bayer formats
      dt-bindings: media: Add bindings for ARM mali-c55
      media: uapi: Add controls for Mali-C55 ISP
      media: mali-c55: Add Mali-C55 ISP driver
      media: Documentation: Add Mali-C55 ISP Documentation
      MAINTAINERS: Add entry for mali-c55 driver
      media: Add MALI_C55_3A_STATS meta format
      media: uapi: Add 3a stats buffer for mali-c55
      media: platform: Add mali-c55 3a stats devnode
      Documentation: mali-c55: Add Statistics documentation
      media: uapi: Add parameters structs to mali-c55-config.h
      media: platform: Add mali-c55 parameters video node
      Documentation: mali-c55: Document the mali-c55 parameter setting

Jacopo Mondi (1):
      media: mali-c55: Add image formats for Mali-C55 parameters buffer

 Documentation/admin-guide/media/mali-c55-graph.dot |   19 +
 Documentation/admin-guide/media/mali-c55.rst       |  413 +++++++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../devicetree/bindings/media/arm,mali-c55.yaml    |   82 ++
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/drivers/mali-c55.rst       |   55 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-arm-mali-c55.rst             |   89 ++
 .../userspace-api/media/v4l/subdev-formats.rst     |  420 ++++++-
 MAINTAINERS                                        |   14 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/arm/Kconfig                 |    5 +
 drivers/media/platform/arm/Makefile                |    2 +
 drivers/media/platform/arm/mali-c55/Kconfig        |   18 +
 drivers/media/platform/arm/mali-c55/Makefile       |   11 +
 .../media/platform/arm/mali-c55/mali-c55-capture.c |  963 ++++++++++++++++
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  310 ++++++
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  921 ++++++++++++++++
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  665 +++++++++++
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  829 ++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  449 ++++++++
 .../media/platform/arm/mali-c55/mali-c55-resizer.c | 1156 ++++++++++++++++++++
 .../media/platform/arm/mali-c55/mali-c55-stats.c   |  325 ++++++
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c |  437 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/media-bus-format.h              |    9 +-
 include/uapi/linux/media/arm/mali-c55-config.h     |  794 ++++++++++++++
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |    4 +
 30 files changed, 7999 insertions(+), 4 deletions(-)
---
base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e
change-id: 20250624-c55-b3c36b2e1d8c
prerequisite-change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b:v5
prerequisite-patch-id: 63dcb795365bddbc4e96efc8a6953d1fe3c1c9c4
prerequisite-patch-id: a2f9f978ed00b6d6a0cf674dc74febded45cf991
prerequisite-patch-id: 002733e75605531c1f85a6b667a387ff608b0898
prerequisite-patch-id: b846f934b91bd338ae3a789c946a03665cc042e2
prerequisite-patch-id: 4f3f3e0a5b72e9226e6735caa20e97105564a999
prerequisite-patch-id: a0ba06f067cd27954bfdc2ac98909790ed250b1e
prerequisite-patch-id: 4cc969d952d5ee3eb44219360761e5cb18bcb080
prerequisite-patch-id: 0e1304715de9873b175d1df32e240ae97363d042

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


