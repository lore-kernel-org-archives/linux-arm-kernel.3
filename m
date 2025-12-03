Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF163D15DAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o0XJQvJ2KeySKz7UT8fzIRr1+kds54zA5LtalYMjbuE=; b=MloFo1G3O1kPLD
	MzFywYdHq6VYhQFMPIvXbjNxnD5IuDoh5ymGnx0VKCPsJXasWa4l/rTKftbLq2CNbPXMd9czfk5Zl
	AuNsDDdgPndxvu8gV8HBAjSs0D4+tsoYAyE9JkpGCJsS3YQB4yFxmnNe0as1UU6ab+pSSGJ+6ldB0
	fdzeja9R8JYFJ81pgjTrJbqhyyNJTf/Y/VIPLdm9f2EwKMR+i3Lo9hfmn3eZDgtPyFUG/masMKm9r
	uzyT20UtFZ3yaPdZDIlZTd4Zspa/5OCVbOGpv7c2NTLjLPceD+w183e3U4sqD2bzaW3R/pX/x2ntu
	28k3i3G0D6Z3RFagpLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAm-00000006j9H-1gvO;
	Wed, 03 Dec 2025 15:53:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAg-00000006j1t-3jol
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 15:53:40 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAc-0007dW-EV; Wed, 03 Dec 2025 16:53:34 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: [PATCH v2 00/22] media: platform: rga: Add RGA3 support
Date: Wed, 03 Dec 2025 16:52:22 +0100
Message-Id: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALZcMGkC/0XOQQ6CMBCF4auQrq1OKwhh5T0Mi9qOOAsKtoVgj
 Hd3gBiWr5l8/T8iYiCMos4+IuBEkXrPQx8yYZ/GtyjJ8RYadKEAlIzDKENrzrIyAAiquisNgs+
 HgA+aV+rW8H5STH14r/Kkltc/Uu7IpCTI88W4qihKyEFfB/TtmELvaT46FM13owO+Ro5Lm7+3c
 eqCKn1ZUeq7bnRpKZHWgS10ntsyNzUXMHQ3EaXlG0p11qEjc/I4J/7l+wO0swA+CgEAAA==
X-Change-ID: 20251001-spu-rga3-8a00e018b120
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Michael Olbrich <m.olbrich@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_075338_943853_503E8FEF 
X-CRM114-Status: GOOD (  21.19  )
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

This series adds support for the Raster Graphic Acceleration 3 (RGA3)
peripheral, which is included in the RK3588 SoC. The RK3588
contains one RGA2 core (which is already implemented by the rockchip rga
driver) and two independent RGA3 cores. RGA2 and RGA3 feature
a similar functionality of scaling, cropping and rotating of up to two input
images into one output image. Key differences of the RGA3 are:

- supports 10bit YUV output formats
- supports 8x8 tiles and FBCD as inputs and outputs
- supports BT2020 color space conversion
- max output resolution of (8192-64)x(8192-64)
- MMU can map up to 32G DDR RAM
- fully planar formats (3 planes) are not supported
- max scale up/down factor of 8

This patch set adds support for one RGA3 core in the existing
rga m2m driver. The feature set of the PR is limited to scaling and
format conversions between common 8bit RGB/YUV formats.
Also the color space conversion is fixed to BT601F.
This already allows a practical usage of the RGA3.

This was tested on a Radxa Rock 5T. Around 80 fps were measured when
scaling and converting from RGBA 480x360 to NV12 3840x2160 in a single
gstreamer pipeline. Format conversions were tested with a single
gstreamer pipeline converting a fixed input to a given input format.
Afterwards it's piped through the RGA3 and the result is converted back
to rgba and compared against a given hash value (generated after
comparing the output manually to the input).

The v4l2-compliance tests still complain about
the failing colorspace propagation for the RGA2.
For the RGA3 they complain about the ycbcr_enc
not being adopted with S_FMT, which is by design,
as the RGA3 currently has the BT601 full range
transfer hard coded:

  v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
  ...
  	Card type        : rga2
  ...
  		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
  	test VIDIOC_S_FMT: FAIL
  ...
  Total for rockchip-rga device /dev/video0: 47, Succeeded: 46, Failed: 1, Warnings: 0
  
  v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
  ...
  	Card type        : rga3
  ...
  		fail: v4l2-test-formats.cpp(920): fmt_out.g_ycbcr_enc() != ycbcr_enc
  	test VIDIOC_S_FMT: FAIL
  ...
  Total for rockchip-rga device /dev/video1: 47, Succeeded: 46, Failed: 1, Warnings: 0

To distinguish the RGA2 core from the RGA3 cores the Card type is set
accordingly. Scheduling operations between both RGA3 cores to double
the possible frame rate might be a future improvement. Until then
additional RGA3 cores are disabled to only provide one video device to
the user space. This prevents a potential ABI breakage when multi core
support is implemented.

The DTS change at the end is just as a preview, as this series targets
media/next. After it's merged the DTS change will be sent as a new
patch not targeting media.

Patch 1 documments the RGA3 compatible value
Patch 2-3 extend v4l2 common functionality
Patch 4-6 are general cleanups
Patch 7-20 prepare the rga driver for the RGA3
Patch 21 adds RGA3 support to the rga driver
Patch 22 dtsi additions for the RGA3

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Changes in v2:
- Removed overclocking (assigning higher clock speeds in the dts)
- Disable the second RGA3 core
- Improved RGA3 feature documentation and code comments
- Don't write the whole command buffer in each frame
- Don't announce CIDs for the RGA3 and error out on s_selection
- Check the max scaling factor of 16 (RGA2) and 8 (RGA3)
- Move stride alignment and alpha checking to v4l2 common
- Register the interrupt as shared for an external IOMMU
- Add IOMMU patch as dependency to fix sporadic hangups
- Link to v1: https://lore.kernel.org/r/20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de

---
Michael Olbrich (1):
      media: rockchip: rga: share the interrupt when an external iommu is used

Sven Püschel (21):
      media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
      media: v4l2-common: add has_alpha to v4l2_format_info
      media: v4l2-common: add v4l2_fill_pixfmt_mp_aligned helper
      media: rockchip: rga: use clk_bulk api
      media: rockchip: rga: use stride for offset calculation
      media: rockchip: rga: remove redundant rga_frame variables
      media: rockchip: rga: move hw specific parts to a dedicated struct
      media: rockchip: rga: move cmdbuf to rga_ctx
      media: rockchip: rga: align stride to 4 bytes
      media: rockchip: rga: prepare cmdbuf on streamon
      media: rockchip: rga: check scaling factor
      media: rockchip: rga: use card type to specify rga type
      media: rockchip: rga: change offset to dma_addresses
      media: rockchip: rga: support external iommus
      media: rockchip: rga: remove size from rga_frame
      media: rockchip: rga: remove stride from rga_frame
      media: rockchip: rga: move rga_fmt to rga-hw.h
      media: rockchip: rga: add feature flags
      media: rockchip: rga: disable multi-core support
      media: rockchip: rga: add rga3 support
      arm64: dts: rockchip: add rga3 dt nodes

 .../devicetree/bindings/media/rockchip-rga.yaml    |   5 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  46 ++
 drivers/media/platform/rockchip/rga/Makefile       |   2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |  78 ++--
 drivers/media/platform/rockchip/rga/rga-hw.c       | 404 ++++++++++++----
 drivers/media/platform/rockchip/rga/rga-hw.h       |  18 +-
 drivers/media/platform/rockchip/rga/rga.c          | 518 ++++++++-------------
 drivers/media/platform/rockchip/rga/rga.h          |  82 ++--
 drivers/media/platform/rockchip/rga/rga3-hw.c      | 471 +++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga3-hw.h      | 190 ++++++++
 drivers/media/v4l2-core/v4l2-common.c              |  48 +-
 include/media/v4l2-common.h                        |   6 +
 12 files changed, 1375 insertions(+), 493 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251001-spu-rga3-8a00e018b120
prerequisite-change-id: 20251126-spu-iommudtefix-cd0c5244c74a:v1
prerequisite-patch-id: 10c6c977c0f71400931941b42da73adcaf63e810

Best regards,
-- 
Sven Püschel <s.pueschel@pengutronix.de>


