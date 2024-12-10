Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C3AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NzoGz8lZ3wcD+MzyZqd8AuVfAPUDkt9ogzgRwgjX1PY=; b=CDtrbhV9+/HMCk1TBgxRGM2O5h
	Q/HIM1zy/8xXYA4IHgbGreiLO8vh3+zKSCb0YQBlT8YDZXa3jJJbf7P5nKs36HpW7El/+t2ka9tU/
	2ew4hgoUTwlRijMnnucWiPSJhIp6hjGDXXnP4CJeeGNqkFyU+FEZzI5JSps15oxRiKTfq9fBdm5t/
	hrl3L7R/8Z1a90f3ZoCLFhwk1dWLw4d+v3WFD+4uwus/WGm9dqt9qfm0K9ZMVu2r/wU0wMWfsbgVD
	uhFkMjnaJUWybQLdTmHdjaJHIlwkONbDB2YkMLIOeVuIIaS0ssUAc8diR/wV4FWUfKOAgg90X+8OA
	styQObWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL68X-0000000CYOc-0xPo;
	Tue, 10 Dec 2024 19:43:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL65W-0000000CXii-0UAl;
	Tue, 10 Dec 2024 19:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733859603;
	bh=55zkoLi9qf/QlB8hGTmzKCb/q8gquP7VHyIjxmXT1cI=;
	h=From:To:Cc:Subject:Date:From;
	b=SPGNRBkBWg5/X7pdOzMwvAQ67nljcl6zcUY/Wt+WYYfyvl3X2SunZ+poRb7xuqCTo
	 drPYGHuZrefUuwJ/Xd2M1GWgyQHGzLTYxudpMsE8wjWGlUpnvaZQcRyCqX53GRLh/l
	 dFgDzpUZOq9blBEYCXVRVh4D+5Kuxby7nfdYlVB46JIwGVFwqpT5xi3hmV6qOYkpTK
	 wDbLjvViS80GFsd9Z39TU2UH5zI6bRLCRRJEavobe3RoedivfmySf+NtFxQfe9lbeg
	 sRiJ3Wd2mwS8We4/AkjrueAdD2s8G1tRtW8y0oV/KZkrhBW7d0xotYTa45fBYCG2c0
	 Iw9XR4ImzmAEg==
Received: from shreeya.shreeya (unknown [110.226.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 986AF17E37EB;
	Tue, 10 Dec 2024 20:39:37 +0100 (CET)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	hverkuil@xs4all.nl,
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	shreeya.patel@collabora.com,
	dmitry.osipenko@collabora.com
Subject: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
Date: Wed, 11 Dec 2024 01:09:00 +0530
Message-Id: <20241210193904.883225-1-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_114006_330229_DFB3959B 
X-CRM114-Status: GOOD (  24.35  )
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

This series implements support for the Synopsys DesignWare
HDMI RX Controller, being compliant with standard HDMI 1.4b
and HDMI 2.0.

Features that are currently supported by the HDMI RX driver
have been tested on rock5b board using a HDMI to micro-HDMI cable.
It is recommended to use a good quality cable as there were
multiple issues seen during testing the driver.

Please note the below information :-
* HDMIRX driver now only works with the opensource TF-A.
* We have tested the working of OBS studio with HDMIRX driver and
there were no issues seen.
* We also tested and verified the support for interlaced video.

To test the HDMI RX Controller driver, following example commands can be used :-

root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev/video0 \
--set-fmt-video=width=1920,height=1080,pixelformat='BGR3' --stream-mmap=4 \
--stream-skip=3 --stream-count=100 --stream-to=/home/hdmiin4k.raw --stream-poll

root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvideo \
-s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv

CEC compliance test results :-

* https://gitlab.collabora.com/-/snippets/380
* https://gitlab.collabora.com/-/snippets/381

Following is the v4l2-compliance test result :-

root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video0 
v4l2-compliance 1.29.0-5278, 64 bits, 64-bit time_t
v4l2-compliance SHA: 791da13728d9 2024-11-25 10:01:57

Compliance test for snps_hdmirx device /dev/video0:

Driver Info:
	Driver name      : snps_hdmirx
	Card type        : snps_hdmirx
	Bus info         : platform:fdee0000.hdmi_receiver
	Driver version   : 6.12.0
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

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
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 4 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

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

Total for snps_hdmirx device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

---

Resending the patch series due to mail server timeout issue
when sending v5 patchset

Changes in v5 :-
- Fix the interrupt IRQ number in the dt-bindings and device tree
- Add alignment property to ensure hdmi-receiver-cma
  starts at a 64KB-aligned address
- Change the MODULE_DESCRIPTION
- Add VIDEO_SYNOPSYS_HDMIRX as prefix to the default edid config
- Drop the enabling of default edid in the Kconfig
- Replace the default EDID with hdmi-4k-300mhz EDID produced
  by v4l2-ctl tool for better compatibility with various HDMI
  cables and adapters
- Rework the write_edid and set_edid functions
- During format change, retrieve the current pixel format,
  color depth, and AVI infoframe details instead of only
  detecting the format
- Improve the logging mechanism and delays in the
  hdmirx_wait_signal_lock function
- Fix the 4K@60 capturing for RGB format
- Document what hdmirx_check_timing_valid function does
- Rework the hdmirx_get_detected_timings function
- Fix the NV16/24 size image value
- Add the implementation from Benjamin Hoff to expose the
  ITC type to v4l2
- Remove all the firmware related code

Changes in v4 :-
- Remove DTS changes included in the device tree patch
- Remove the hdmi rx pin info as it's already present
in the rk3588-base-pinctrl.dtsi
- Create a separate config option for selecting the EDID
and enable it by default
- Improve the comment related to DV timings and move it
to the side of hdmirx_get_detected_timings
- Add 100ms delay before pulling the HPD high
- Do not return the detected timings from VIDIOC_G_DV_TIMINGS
- Drop the bus info from hdmirx_querycap
- If *num_planes != 0 then return 0 in hdmirx_queue_setup
- Set queue->min_queued_buffers to 1
- Drop q->allow_cache_hints = 0; as it's always 0 by default
- Add a comment for q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
- Drop .read = vb2_fop_read as it's not supported by driver
- Remove redundant edid_init_data_600M
- Make HPD low when driver is loaded
- Add support for reading AVI Infoframe
- Remove msg_len checks from hdmirx_cec_transmit
- Add info about the CEC compliance test in the cover letter
- Add arbitration lost status
- Validate the physical address inside the EDID

Changes in v3 :-
- Use v4l2-common helpers in the HDMIRX driver
- Rename cma node and phandle names
- Elaborate the comment to explain 160MiB calculation
- Move &hdmi_receiver_cma to the rock5b dts file
- Add information about interlaced video testing in the
cover-letter

Changes in v2 :-
- Fix checkpatch --strict warnings
- Move the dt-binding include file changes in a separate patch
- Add a description for the hardware in the dt-bindings file
- Rename resets, vo1 grf and HPD properties
- Add a proper description for grf and vo1-grf phandles in the
bindings
- Rename the HDMI RX node name to hdmi-receiver
- Include gpio header file in binding example to fix the
dt_binding_check failure
- Move hdmirx_cma node to the rk3588.dtsi file
- Add an entry to MAINTAINERS file for the HDMIRX driver

Shreeya Patel (4):
  MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
  dt-bindings: media: Document bindings for HDMI RX Controller
  arm64: dts: rockchip: Add device tree support for HDMI RX Controller
  media: platform: synopsys: Add support for HDMI input driver

 .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
 MAINTAINERS                                   |    8 +
 .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   57 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/synopsys/Kconfig       |    3 +
 drivers/media/platform/synopsys/Makefile      |    2 +
 .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
 .../media/platform/synopsys/hdmirx/Makefile   |    4 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2662 +++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
 .../synopsys/hdmirx/snps_hdmirx_cec.c         |  283 ++
 .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
 14 files changed, 3633 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
 create mode 100644 drivers/media/platform/synopsys/Kconfig
 create mode 100644 drivers/media/platform/synopsys/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h

-- 
2.39.2


