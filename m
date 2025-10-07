Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F63BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Lywfh8dFEgeiI0AlBvqMipltG4uPxUHUenoHPUapuc=; b=Ks+SntxOvFLw71
	3v6mmgjy6Qm1z458/dL1sDZL6nWXlNnAsd65UeQcj/97U+oySnqYYFhHAJf3GSqdHWzhqxsx2osRM
	EvVMJC4vb0uRmJRGXcscMSafVfOdYuJsJlaK3gfuFK/4/5sdhAkJ3l24ipGl79klU/Lokx+zyhoD6
	r8R5hy3Pxd1lYcz1fkLjMvebKpyt98r9S5yFon8OsUB2zt7aOgdM0/JZe6HV+Xnm6N9OpEDjo2FdZ
	bVF/gQCW/rKhlSBo+6GsldSfrte9TkkOUcJGpvRdFzq2pnje+HW6RNM//VFky4JxpCuaF/FlFjsmh
	FVvYWJZQ9Z8nJs4gkjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637u-00000001YOK-2SiK;
	Tue, 07 Oct 2025 08:32:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637r-00000001YK5-2IXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:32:52 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637o-0002Hb-2P; Tue, 07 Oct 2025 10:32:48 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: [PATCH 00/16] media: platform: rga: Add RGA3 support
Date: Tue, 07 Oct 2025 10:31:53 +0200
Message-Id: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPnP5GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwND3eKCUt2i9ERjXYtEA4NUA0OLJEMjAyWg8oKi1LTMCrBR0bG1tQA
 JWi1/WgAAAA==
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
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013251_595962_EF36B7B1 
X-CRM114-Status: GOOD (  13.35  )
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
peripheral, which is included in the RK3588 SoC. Unlike the RGA2 it
can use the existing rockchip-iommu-v2 driver to handle iommu mappings.
Also the RK3588 contains two independent RGA3 cores.

Only scaling and format conversions between common 8bit RGB/YUV formats
are implemented. Also the color space conversion is fixed to BT601F.
This already allows a practical usage of the RGA3.

This was tested on a Radxa Rock 5T. With the increased clock speeds in
the devicetree around 160 fps were measured when scaling and converting
from RGBA 480x360 to NV12 3840x2160. Without the clock speed scaling a
default clock division factor of 2 is used and only around 80 fps are
reached with one core. The v4l2-compliance tests only complain about
the already failing colorspace propagation:

  v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
  ...
  		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
  	test VIDIOC_S_FMT: FAIL
  ...
  Total for rockchip-rga device /dev/video0: 47, Succeeded: 46, Failed: 1, Warnings: 0

  v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
  ...
  		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
  	test VIDIOC_S_FMT: FAIL
  ...
  Total for rockchip-rga device /dev/video1: 47, Succeeded: 46, Failed: 1, Warnings: 0

  v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
  ...
  		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
  	test VIDIOC_S_FMT: FAIL
  ...
  Total for rockchip-rga device /dev/video2: 47, Succeeded: 46, Failed: 1, Warnings: 0

Each RGA core is a separate /dev/video device. To distinguish the RGA2
core from the RGA3 cores the Card type is set accordingly. Combining all
cores into a single device and scheduling tasks to the best core might
be a future improvement, if it is desired by upstream to handle the
scheduling and selection in kernel space.

Patch 1-2 are general cleanups
Patch 3-12 prepare the rga driver for the RGA3
Patch 13 documments the RGA3 compatible value
Patch 14 adds the RGA3 cores to the rk3588 dtsi
Patch 15 increases the RGA3 core clock speeds
Patch 16 adds RGA3 support to the rga driver

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Sven Püschel (16):
      media: rockchip: rga: use clk_bulk api
      media: rockchip: rga: use stride for offset calculation
      media: rockchip: rga: align stride to 16 bytes
      media: rockchip: rga: move hw specific parts to a dedicated struct
      media: rockchip: rga: use card type to specify rga type
      media: rockchip: rga: change offset to dma_addresses
      media: rockchip: rga: support external iommus
      media: rockchip: rga: remove size from rga_frame
      media: rockchip: rga: remove stride from rga_frame
      media: rockchip: rga: move rga_fmt to rga-hw.h
      media: rockchip: rga: add iommu restore function
      media: rockchip: rga: handle error interrupt
      media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
      arm64: dts: rockchip: add rga3 dt nodes
      arm64: dts: rockchip: increase rga3 clock speed
      media: rockchip: rga: add rga3 support

 .../devicetree/bindings/media/rockchip-rga.yaml    |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  50 +++
 drivers/media/platform/rockchip/rga/Makefile       |   2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |  78 ++--
 drivers/media/platform/rockchip/rga/rga-hw.c       | 356 ++++++++++++---
 drivers/media/platform/rockchip/rga/rga-hw.h       |  15 +-
 drivers/media/platform/rockchip/rga/rga.c          | 404 ++++++-----------
 drivers/media/platform/rockchip/rga/rga.h          |  74 ++--
 drivers/media/platform/rockchip/rga/rga3-hw.c      | 490 +++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga3-hw.h      | 186 ++++++++
 10 files changed, 1246 insertions(+), 410 deletions(-)
---
base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
change-id: 20251001-spu-rga3-8a00e018b120

Best regards,
-- 
Sven Püschel <s.pueschel@pengutronix.de>


