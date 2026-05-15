Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E10CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FJiroEWmUvevD6DVWbU92g4IhmKKCN0Hib4Sh7A7HQ4=; b=zkdeEzPAGjemYB
	mlTYAwbnzUVmm/YcuaVEPQ4GQxPKfn5AhkcXmtPKM2warPZt6QePa8eipFGuPLddVOOeTXZuXxjQi
	5sX9/u7blKV4JJKmsI5ev8GmGIXn9/HnO5LK0rNJCLXZjSKgyCypNQF8BTqsNoNhF8mT5YJL7DrZI
	EmPPe/97TBpsetxnYDO9Z1GsjzMcqbIOXc2Zv5kD+AGiak7+fkoYvUpuPwIMA1jrbBFA3tziwDq1a
	XMlO9klCP/LnmOjHOzyC9Qabv3PXThBo+WkGd66JTXJ88Qd6Kv0i08nf6ob7aZKLByBTkfrEsx8RN
	WfX/Z7efxDgM0cyll+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXe-00000008irl-1Gip;
	Fri, 15 May 2026 15:33:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXW-00000008iea-0kV5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FJiroEWmUvevD6DVWbU92g4IhmKKCN0Hib4Sh7A7HQ4=; b=E4FmbB5t3mFrq88bTjiaLbmU0R
	E3Yx74nCG0tssoxy2kcYK1PzMWVh1+yIj4iwW3XSLdpJ9/h4QBLWACNlzwdskI/P7EhQyDuFQGogw
	cirWKeh5rklZ9h3akWgwPdPS7o/s7+pqQcx87PT2Z6dY4Q/tHNeV/9uh3XIy9RDUBdLiRnNOdlFhl
	WHh7noK0oD25C8zpcY54s8qQ/B9sNFyGF2Nd9TpI2zqv1c20bdnxbtKe4MpnM9KuzgSVCjaBjukc2
	mg/assn2Qz+ZEYuZjo0W6S8qIML7RdpdRh4fMuhVZVbhcxMadHtSe4noUs+m+vNzOoAmTPY+OGy9j
	wnJ0FAdw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuXS-00000005ZuC-0Txs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:33:25 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuWk-0005OF-Ox; Fri, 15 May 2026 17:32:38 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: [PATCH v6 00/28] media: platform: rga: Add RGA3 support
Date: Fri, 15 May 2026 17:32:26 +0200
Message-Id: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Ry26DMBAF0F9BXtftePwCVv2PqgtjD4kXgdQ8l
 CrKv9cQRSCV5Vg+d6Q7dzZQijSwurizRHMcYt/lwbwVzJ9ddyIeQ54ZAmoBIPhwnXg6OclLB0A
 gykYgsPz9mqiNtzXq6zvP5ziMffpdk2exvL5C7BYyCw5cGhdKrS0owM8rdadpTH0Xb++B2JI04
 6YR5E5j1lVZOWMrZVsrDrV8aQMC97tl1tY2aCUY21BzqNWmJeqdVllTBeSFN0Jqdaj1phWWO60
 X3dhWBxBVKM0//XhWmuhnykcZn71uN6mLtQ6BZg2N/eUyhXG5APcBvEalvFWuzt3loMYNxH3+E
 8e6uFCI7qOj25i3PP4AAw6X+gICAAA=
X-Change-ID: 20251001-spu-rga3-8a00e018b120
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Michael Olbrich <m.olbrich@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_163322_669318_1CF676CE 
X-CRM114-Status: GOOD (  31.65  )
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
contains one RGA2-Enhanced core (which is already implemented by the
rockchip rga driver) and two independent RGA3 cores. They feature
a similar functionality of scaling, cropping and rotating of up to two input
images into one output image. Key differences of the RGA3 are:

- supports 10bit YUV output formats
- supports 8x8 tiles and FBCD as inputs and outputs
- supports BT2020 color space conversion
- max output resolution of (8192-64)x(8192-64)
- MMU can map up to 32G DDR RAM
- fully planar formats (3 planes) are not supported
- max scale up/down factor of 8 (RGA2 allows up to 16)

This patch set adds support for one RGA3 core in the existing
rga m2m driver. The feature set of the PR is limited to scaling,
format and color space conversions between common 8bit RGB/YUV formats.
This already allows a practical usage of the RGA3.

During testing it has been noted that the scaling of the hardware is
slightly incorrect. A test conversion of 128x128 RGBA to 256x256 RGBA
causes a slight shift to the bottom right. The shift is suddle, as it seems
that the image is shifted by about 2px down and right and then cropped to
it's final size (probably caused by the source sampling).
The same behavior has been observed when using the vendor driver
with the librga library.

Furthermore comparing the RGA3 conversion with the GStreamer
videoconvertscale element, the chroma-site is different. A quick testing
didn't reveal a chroma-site that creates the same image with the
GStreamer Element. Also when converting from YUV to RGB the RGB values
differ by 1 or 2. This doesn't seem to be a colorspace conversion issue
but rather a slightly different precision on the calculation.

This was tested on a Radxa Rock 5T. Around 80 fps were measured when
scaling and converting from RGBA 480x360 to NV12 3840x2160 in a single
gstreamer pipeline. Format conversions were tested with a single
gstreamer pipeline converting a fixed input to a given input format.
Afterwards it's piped through the RGA3 and the result is converted back
to rgba and compared against a given hash value (generated after
comparing the output manually to the input).

The patchset also fixes the failing v4l2-compliance tests due to the
missing colorimetry propagation from output to capture:

  v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
  ...
  	Card type        : rga2
  ...
  Total for rockchip-rga device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

  v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
  ...
	Card type        : rga3
  ...
  Total for rockchip-rga device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

To distinguish the RGA2 core from the RGA3 cores the Card type is set
accordingly. Scheduling operations between both RGA3 cores to double
the possible frame rate might be a future improvement. Until then
additional RGA3 cores are disabled to only provide one video device to
the user space. This prevents a potential ABI breakage when multi core
support is implemented.

The DTS change at the end is just as a preview, as this series targets
media/next. After it's merged the DTS change will be sent as a new
patch not targeting media.

Patch 1 updates the dtb bindings doc to support the RGA3
Patch 2-5 extend v4l2 common functionality
Patch 6-10 are general cleanups
Patch 11-26 prepare the rga driver for the RGA3
Patch 27 adds RGA3 support to the rga driver
Patch 28 dtsi additions for the RGA3

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Changes in v6:
- avoid build failure by selecting VIDEOBUF2_DMA_CONTIG
- sorted nodes in dtsi addition
- reworked cmdbuf preparation/reuse to a dirty flag instead of streamon
- fix alignment multiplication edge cases in v4l2_format_plane_stride
- fix unintended parameter change when switching to v4l2_fill_pixfmt_mp_aligned call
- adjust dma_addrs variable type to match the changed struct type change
- dropped scaling limit from s_fmt
- scaling limit considers rotation
- scaling limit is checked when updating selection/rotation while streaming
- don't prevent setting a selection for the RGA3
- fixed flipped inline if branches in rga3_adjust_and_map_format
- Link to v5: https://patch.msgid.link/20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de

Changes in v5:
- Fixed cmdbuf allocation size being only a quarter
- Fixed streamon cmdbuf preparation to not set
  rotation/flipping which prevents changing it during streaming
- Link to v4: https://patch.msgid.link/20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de

Changes in v4:
- Add Nicolas to Cc for potential reviews and Sebastian for the nice
  RK3588 mainline status table
- Improved single memory plane y stride alignment adjustments
- Adjusted scaling inaccuracy description
- Dropped required iommu property from the binding yaml
- Fixed binding yaml indentation
- Link to v3: https://lore.kernel.org/r/20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de

Changes in v3:
- Add iommus property to the dtb bindings documentation
- Drop interrupt name from the dtsi
- Added v4l2_format_info for missing 2 byte RGB formats
- Fixed incorrect dt node reference in the binding patch commit message
- Removed now unused depth member of rga_frame
- Replaced RGA3 semi planar bool with v4l2_format_info check
- Calculated x_div/y_div variables instead of storing them
- Limited width/height to even values for YUV formats
- Support all 4 CSC modes: BT601L, BT601F, BT709L, BT2020L
- Note slightly incorrect scaling by the hardware
- Fix stride alignment to bytes
- Use early returns in rga-buf init/cleanup
- Fix incorrect devm_clk_bulk_get with devm_clk_bulk_get_all
- Don't enforce max scaling factor in try_fmt (only in s_fmt)
- Merge single register editing RGA3 functions into the other functions
- Link to v2: https://lore.kernel.org/r/20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de

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

To: Jacob Chen <jacob-chen@iotwrt.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Michael Olbrich (1):
      media: rockchip: rga: share the interrupt when an external iommu is used

Sven Püschel (27):
      media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
      media: v4l2-common: sort RGB formats in v4l2_format_info
      media: v4l2-common: add missing 1 and 2 byte RGB formats to v4l2_format_info
      media: v4l2-common: add has_alpha to v4l2_format_info
      media: v4l2-common: add v4l2_fill_pixfmt_mp_aligned helper
      media: rockchip: rga: fix too small buffer size
      media: rockchip: rga: use clk_bulk api
      media: rockchip: rga: use stride for offset calculation
      media: rockchip: rga: remove redundant rga_frame variables
      media: rockchip: rga: announce and sync colorimetry
      media: rockchip: rga: move hw specific parts to a dedicated struct
      media: rockchip: rga: avoid odd frame sizes for YUV formats
      media: rockchip: rga: calculate x_div/y_div using v4l2_format_info
      media: rockchip: rga: move cmdbuf to rga_ctx
      media: rockchip: rga: align stride to 4 bytes
      media: rockchip: rga: reuse cmdbuf contents
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

 .../devicetree/bindings/media/rockchip-rga.yaml    |  10 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  44 ++
 drivers/media/platform/rockchip/rga/Kconfig        |   1 +
 drivers/media/platform/rockchip/rga/Makefile       |   2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |  89 +++-
 drivers/media/platform/rockchip/rga/rga-hw.c       | 357 +++++++++----
 drivers/media/platform/rockchip/rga/rga-hw.h       |  16 +-
 drivers/media/platform/rockchip/rga/rga.c          | 576 ++++++++++-----------
 drivers/media/platform/rockchip/rga/rga.h          |  88 ++--
 drivers/media/platform/rockchip/rga/rga3-hw.c      | 507 ++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga3-hw.h      | 192 +++++++
 drivers/media/v4l2-core/v4l2-common.c              | 128 +++--
 include/media/v4l2-common.h                        |   6 +
 13 files changed, 1513 insertions(+), 503 deletions(-)
---
base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
change-id: 20251001-spu-rga3-8a00e018b120
prerequisite-change-id: 20251126-spu-iommudtefix-cd0c5244c74a:v2
prerequisite-patch-id: 10c6c977c0f71400931941b42da73adcaf63e810

Best regards,
--  
Sven Püschel <s.pueschel@pengutronix.de>


