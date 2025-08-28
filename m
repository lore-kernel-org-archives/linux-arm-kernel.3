Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59268C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jymxJss5AlAGCE4UCXb1bxMUHtmCqjit6NMZ7PTXarY=; b=PiYmeBW2yzPbO3qVv3wglVAQbZ
	csY6PdKecV+hfXvleiTWa52gBar690l6ZSrXy0qYBJ8G8mOTDv8xYft+2h8Hkt4gRGEbRyaFcwYe7
	3QEjfzXWC98LqmXWgkyZqUqw/g2OTdNH4WS6aKZWna1ciQ9iHE18amaClh1+iGe+2qlArw8dKefP4
	kO0P14nlEs3tqpXJw+u6p+c+LfVnAuwciBiKxH8aCtG734phTMK9BBsrl+/nW1ZH0QOYr+Lmr1liP
	8vWSPCr/kNMLYBydpG9cDssqxVAuOEjWlP6f0XPH6IyUKWXUxhqUnWLG2m1ngs18a4t7HIEVtKbS9
	b7Q/xTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZU5-000000014rt-3or9;
	Thu, 28 Aug 2025 10:03:57 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYU2-00000000tKG-1ojc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:59:52 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250828085948epoutp01b5696fa9dbd3cc2a0a3a44d898ed8bbe~f4qdrRkS71200712007epoutp01s
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:59:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250828085948epoutp01b5696fa9dbd3cc2a0a3a44d898ed8bbe~f4qdrRkS71200712007epoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371588;
	bh=jymxJss5AlAGCE4UCXb1bxMUHtmCqjit6NMZ7PTXarY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyAkmAPnpGmMtUxc6a7/80yzB6IYT9RgQFZEn2XFnsGmKsS2ZVrtVwAEp/BezIvE3
	 pmd6m1PJ4sZCIWvwxELlMzkXyHnXiZImAnW3S+s1eocRe/1B+ofLb7KSVwsffsTO4Y
	 5c/1rv9mwAfu7zJcLKAz33dGhOLJEKpAbC9q4x4A=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250828085947epcas5p1bfb7344389959e93574fddc9818be2ee~f4qdFrs6C2857728577epcas5p1h;
	Thu, 28 Aug 2025 08:59:47 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cCFhf55S0z3hhTG; Thu, 28 Aug
	2025 08:59:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250828085946epcas5p1752330d70434b840893b01a201324711~f4qbjE72I2857728577epcas5p1U;
	Thu, 28 Aug 2025 08:59:46 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085943epsmtip299870217aedfc50b0102bf0ec410898d~f4qY0lHaF0304903049epsmtip2Y;
	Thu, 28 Aug 2025 08:59:43 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 6/7] media: imx-mipi-csis: Add support for Telsa FSD
 CSIS.
Date: Thu, 28 Aug 2025 14:29:10 +0530
Message-ID: <20250828085911.81266-7-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085946epcas5p1752330d70434b840893b01a201324711
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085946epcas5p1752330d70434b840893b01a201324711
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085946epcas5p1752330d70434b840893b01a201324711@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_015950_806444_6A683C27 
X-CRM114-Status: GOOD (  26.56  )
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

The Telsa FSD SoC features a newer version(v4.3) of the CSI-2 receiver
IP, similar to the one found in the i.MX7 and i.MX8MM, with the
following differences.

- Ability to select any one VC for streaming from the four available
VCs.
- Built-in DMA support, which is implemented by the fsd-csis driver.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 256 +++++++++++++++++++--
 1 file changed, 231 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index b7ab441cc78a..07ce312a2ed5 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -35,6 +35,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #define CSIS_DRIVER_NAME			"imx-mipi-csis"
 
@@ -45,6 +47,9 @@
 #define MIPI_CSIS_DEF_PIX_WIDTH			640
 #define MIPI_CSIS_DEF_PIX_HEIGHT		480
 
+/* CSIS V4_3 SYSREG macros */
+#define FSD_NO_CSI_PER_PHY_V4_3			4
+#define FSD_CSIS_RESETEN_DPHY_MASK_V4_3(phy)	BIT_MASK(phy)
 /* Register map definition */
 
 /* CSIS version */
@@ -53,19 +58,22 @@
 #define MIPI_CSIS_VERSION_IMX8MP		0x03060301
 
 /* CSIS common control */
-#define MIPI_CSIS_CMN_CTRL			0x04
-#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)	BIT((n) + 16)
-#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE	(0 << 10)
-#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	(1 << 10)
-#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
-#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
-#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
-#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
-#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
+#define MIPI_CSIS_CMN_CTRL				0x04
+#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)		BIT((n) + 16)
+#define MIPI_CSIS_CMN_CTRL_DESKEW_ENABLE		BIT(12)
+#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE		(0 << 10)
+#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT		(1 << 10)
+#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_VC_AND_DT	(3 << 10)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)		((n) << 8)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK		(3 << 8)
+#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL		BIT(2)
+#define MIPI_CSIS_CMN_CTRL_SW_RESET			BIT(1)
+#define MIPI_CSIS_CMN_CTRL_CSI_EN			BIT(0)
 
 /* CSIS clock control */
 #define MIPI_CSIS_CLK_CTRL			0x08
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(n, x)	((x) << ((n) * 4 + 16))
+#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN(n)	(1 << ((n) + 4))
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK	(0xf << 4)
 #define MIPI_CSIS_CLK_CTRL_WCLK_SRC(n)		BIT(n)
 
@@ -107,6 +115,12 @@
 #define MIPI_CSIS_INT_SRC_ERR_ID		BIT(0)
 #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
 
+/* CSIS Interrupt mask1 */
+#define MIPI_CSIS_INT_MSK1			0x18
+
+/* CSIS Interrupt source1 */
+#define MIPI_CSIS_INT_SRC1			0x1C
+
 /* D-PHY status control */
 #define MIPI_CSIS_DPHY_STATUS			0x20
 #define MIPI_CSIS_DPHY_STATUS_ULPS_DAT		BIT(8)
@@ -120,8 +134,9 @@
 #define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE_MASK	GENMASK(31, 24)
 #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(n)	((n) << 22)
 #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE_MASK	GENMASK(23, 22)
-#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_CLK	BIT(6)
-#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_DAT	BIT(5)
+#define MIPI_CSIS_DPHY_CMN_CTRL_S_BYTE_CLK_EN	BIT(21)
+#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_CLK	BIT(6)
+#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_DAT	BIT(5)
 #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_DAT	BIT(1)
 #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_CLK	BIT(0)
 #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE		(0x1f << 0)
@@ -167,7 +182,10 @@
 /* D-PHY Slave Control register Low */
 #define MIPI_CSIS_DPHY_SCTRL_L			0x38
 /* D-PHY Slave Control register High */
-#define MIPI_CSIS_DPHY_SCTRL_H			0x3c
+#define MIPI_CSIS_DPHY_SCTRL_H					0x3c
+#define MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_MAX_SKEW_CODE_CTRL	(0x24 << 2)
+#define MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_MAX_SKEW_CODE_CTRL_MASK GENMASK(7, 2)
+#define MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_EN			BIT(1)
 
 /* ISP Configuration register */
 #define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
@@ -222,6 +240,12 @@
 
 #define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
 
+/* VC Passing register */
+#define MIPI_CSIS_VC_PASSING_REG	0x120
+#define MIPI_CSIS_VC_PASSING(n)		((n) << 8)
+#define MIPI_CSIS_VC_PASSING_MASK	GENMASK(9, 8)
+#define MIPI_CSIS_VC_PASSING_EN		BIT(7)
+
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
@@ -303,6 +327,7 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 
 #define MIPI_CSIS_NUM_EVENTS		ARRAY_SIZE(mipi_csis_events)
 #define MIPI_CSIS_NUM_ERROR_EVENTS	(MIPI_CSIS_NUM_EVENTS - 20)
+#define MIPI_CSIS_INT_SRC_NUM_EVENTS_V4_3	17
 
 #define MIPI_CSIS_MAX_CLOCKS	4
 
@@ -316,6 +341,7 @@ enum mipi_csis_clk {
 enum mipi_csis_version {
 	MIPI_CSIS_V3_3,
 	MIPI_CSIS_V3_6_3,
+	MIPI_CSIS_V4_3,
 };
 
 struct mipi_csis_info {
@@ -329,6 +355,8 @@ struct mipi_csis_info {
 struct mipi_csis_device {
 	struct device *dev;
 	void __iomem *regs;
+	struct regmap *sysreg_map;
+	unsigned int phy_rst_off;
 	struct clk_bulk_data *clks;
 	struct reset_control *mrst;
 	struct regulator *mipi_phy_regulator;
@@ -391,6 +419,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.output = MEDIA_BUS_FMT_RGB888_1X24,
 		.data_type = MIPI_CSI2_DT_RGB888,
 		.width = 24,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.output = MEDIA_BUS_FMT_RGB888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+		.width = 24,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -547,7 +580,11 @@ static inline void mipi_csis_write(struct mipi_csis_device *csis, u32 reg,
 static void mipi_csis_enable_interrupts(struct mipi_csis_device *csis, bool on)
 {
 	mipi_csis_write(csis, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
-	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
+
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		mipi_csis_write(csis, MIPI_CSIS_INT_MSK1, on ? 0xffffffff : 0);
+	else
+		mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
 }
 
 static void mipi_csis_sw_reset(struct mipi_csis_device *csis)
@@ -576,6 +613,8 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
 		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
 	}
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		val |= MIPI_CSIS_DPHY_CMN_CTRL_S_BYTE_CLK_EN;
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
 }
 
@@ -587,8 +626,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 
 	/* Color format */
 	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(csis->vc));
-	val &= ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK |
-		 MIPI_CSIS_ISPCFG_DATAFORMAT_MASK);
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		val &= ~(MIPI_CSIS_ISPCFG_DATAFORMAT_MASK | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK);
+	else
+		val &= ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_DATAFORMAT_MASK
+		| MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK);
 
 	/*
 	 * YUV 4:2:2 can be transferred with 8 or 16 bits per clock sample
@@ -632,7 +674,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 
 	lane_rate = link_freq * 2;
 
-	if (lane_rate < 80000000 || lane_rate > 1500000000) {
+	if (lane_rate < 80000000 || lane_rate > 1600000000) {
 		dev_dbg(csis->dev, "Out-of-bound lane rate %u\n", lane_rate);
 		return -EINVAL;
 	}
@@ -674,8 +716,12 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK;
 	val |= MIPI_CSIS_CMN_CTRL_LANE_NUMBER(lanes - 1);
-	if (csis->info->version == MIPI_CSIS_V3_3)
+	if (csis->info->version == MIPI_CSIS_V3_3) {
 		val |= MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT;
+	} else if (csis->info->version == MIPI_CSIS_V4_3) {
+		val |= MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_VC_AND_DT;
+		val |= MIPI_CSIS_CMN_CTRL_DESKEW_ENABLE;
+	}
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
 
 	__mipi_csis_set_format(csis, format, csis_fmt);
@@ -684,15 +730,23 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
 			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
 
-	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(csis->vc),
-			MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0) |
-			MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0) |
-			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		val = MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0x20);
+	else
+		val = MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0)
+			| MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0)
+			| MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(csis->vc), val);
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
-	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(csis->vc);
-	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(csis->vc, 15);
-	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
+	if (csis->info->version == MIPI_CSIS_V4_3) {
+		val |= MIPI_CSIS_CLK_CTRL_CLKGATE_EN(csis->vc);
+		val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(csis->vc, 0x07);
+	} else {
+		val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(csis->vc);
+		val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(csis->vc, 15);
+		val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
+	}
 	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
 
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,
@@ -712,6 +766,25 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
 }
 
+static int mipi_csis_get_sysreg(struct mipi_csis_device *csis)
+{
+	unsigned int args;
+
+	if (csis->info->version != MIPI_CSIS_V4_3)
+		return 0;
+
+	csis->sysreg_map = syscon_regmap_lookup_by_phandle_args
+				(csis->dev->of_node, "tesla,syscon-csis", 1,
+				 &args);
+
+	if (IS_ERR(csis->sysreg_map))
+		return PTR_ERR(csis->sysreg_map);
+
+	csis->phy_rst_off = args;
+
+	return 0;
+}
+
 static int mipi_csis_clk_enable(struct mipi_csis_device *csis)
 {
 	return clk_bulk_prepare_enable(csis->info->num_clocks, csis->clks);
@@ -756,11 +829,71 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 	return ret;
 }
 
+static void mipi_csis_dphy_reset_release_v4_3(struct mipi_csis_device *csis)
+{
+	unsigned int idx = 0, val = 0x0;
+
+	/* There are 4 CSIs per each D-PHY i/f */
+	idx = csis->vc;
+
+	regmap_read(csis->sysreg_map, csis->phy_rst_off, &val);
+
+	val &= ~FSD_CSIS_RESETEN_DPHY_MASK_V4_3(idx);
+	regmap_write(csis->sysreg_map, csis->phy_rst_off, val);
+
+	usleep_range(500, 1000);
+
+	val |= FSD_CSIS_RESETEN_DPHY_MASK_V4_3(idx);
+	regmap_write(csis->sysreg_map, csis->phy_rst_off, val);
+}
+
+static void mipi_csis_dphy_init_v4_3(struct mipi_csis_device *csis)
+{
+	u32 val = 0;
+
+	mipi_csis_dphy_reset_release_v4_3(csis);
+
+	val = readl(csis->regs + MIPI_CSIS_DPHY_SCTRL_H);
+
+	val |= MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_EN;
+	val |= MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_MAX_SKEW_CODE_CTRL;
+	writel(val, csis->regs + MIPI_CSIS_DPHY_SCTRL_H);
+}
+
+static void mipi_csis_set_vc_passing(struct mipi_csis_device *csis)
+{
+	u32 val;
+	unsigned int vc = csis->vc;
+
+	val = readl(csis->regs + MIPI_CSIS_VC_PASSING_REG);
+
+	val &= ~MIPI_CSIS_VC_PASSING_MASK;
+	val |= MIPI_CSIS_VC_PASSING(vc);
+	val |= MIPI_CSIS_VC_PASSING_EN;
+	writel(val, csis->regs + MIPI_CSIS_VC_PASSING_REG);
+}
+
+static void mipi_csis_get_irq_status(struct mipi_csis_device *csis,
+				     unsigned int *sts)
+{
+	*sts = readl(csis->regs + MIPI_CSIS_INT_SRC1);
+}
+
+static void mipi_csis_clear_irq_status(struct mipi_csis_device *csis,
+				       unsigned int *sts)
+{
+	writel(*sts, csis->regs + MIPI_CSIS_INT_SRC1);
+}
+
 static void mipi_csis_start_stream(struct mipi_csis_device *csis,
 				   const struct v4l2_mbus_framefmt *format,
 				   const struct csis_pix_format *csis_fmt)
 {
 	mipi_csis_sw_reset(csis);
+	if (csis->info->version == MIPI_CSIS_V4_3) {
+		mipi_csis_dphy_init_v4_3(csis);
+		mipi_csis_set_vc_passing(csis);
+	}
 	mipi_csis_set_params(csis, format, csis_fmt);
 	mipi_csis_system_enable(csis, true);
 	mipi_csis_enable_interrupts(csis, true);
@@ -784,6 +917,31 @@ static void mipi_csis_queue_event_sof(struct mipi_csis_device *csis)
 	v4l2_event_queue(csis->sd.devnode, &event);
 }
 
+static irqreturn_t mipi_csis_irq_handler_v4_3(int irq, void *dev_id)
+{
+	struct mipi_csis_device *csis = dev_id;
+	unsigned long flags;
+	u32 status;
+	unsigned int i;
+
+	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
+
+	spin_lock_irqsave(&csis->slock, flags);
+	if ((status & MIPI_CSIS_INT_SRC_ERRORS)) {
+		for (i = 0; i < MIPI_CSIS_INT_SRC_NUM_EVENTS_V4_3; i++) {
+			struct mipi_csis_event *event = &csis->events[i];
+
+			if (status & event->mask)
+				event->counter++;
+		}
+	}
+	spin_unlock_irqrestore(&csis->slock, flags);
+
+	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
+
+	return IRQ_NONE;
+}
+
 static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 {
 	struct mipi_csis_device *csis = dev_id;
@@ -1000,7 +1158,6 @@ static void mipi_csis_debugfs_exit(struct mipi_csis_device *csis)
 /* -----------------------------------------------------------------------------
  * V4L2 subdev operations
  */
-
 static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 {
 	return container_of(sdev, struct mipi_csis_device, sd);
@@ -1064,6 +1221,39 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static void mipi_csis_read_vc_frame_counter(struct mipi_csis_device *csis,
+					    u32 *current_frame_counter)
+{
+	unsigned int vc = csis->vc;
+	*current_frame_counter = readl(csis->regs + MIPI_CSIS_FRAME_COUNTER_CH(vc));
+}
+
+static long mipi_csis_command(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
+{
+	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
+	long ret = 0;
+
+	switch (cmd) {
+	case 1:
+		mipi_csis_system_enable(csis, true);
+		break;
+	case 2:
+		mipi_csis_get_irq_status(csis, arg);
+		break;
+	case 3:
+		mipi_csis_clear_irq_status(csis, arg);
+		break;
+	case 5:
+		mipi_csis_read_vc_frame_counter(csis, arg);
+		break;
+	default:
+		dev_err(csis->dev, "Invalid command\n");
+		ret = -1;
+	}
+
+	return ret;
+}
+
 static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum *code)
@@ -1171,6 +1361,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				    struct v4l2_mbus_frame_desc *fd)
 {
+	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
 	const struct csis_pix_format *csis_fmt;
 	const struct v4l2_mbus_framefmt *fmt;
@@ -1247,6 +1438,7 @@ static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
 	.log_status	= mipi_csis_log_status,
 	.subscribe_event =  mipi_csis_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+	.command = mipi_csis_command,
 };
 
 static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
@@ -1314,6 +1506,7 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	struct v4l2_subdev *remote_sd;
+	int ret;
 
 	dev_dbg(csis->dev, "link setup %s -> %s", remote_pad->entity->name,
 		local_pad->entity->name);
@@ -1563,6 +1756,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	ret = mipi_csis_get_sysreg(csis);
+	if (ret < 0)
+		return ret;
+
 	ret = mipi_csis_phy_init(csis);
 	if (ret < 0)
 		return ret;
@@ -1661,6 +1858,15 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.irq_flag = 0,
 			.irq_handler = mipi_csis_irq_handler,
 		},
+	}, {
+		.compatible = "tesla,fsd-mipi-csi2",
+		.data = &(const struct mipi_csis_info){
+			.version = MIPI_CSIS_V4_3,
+			.num_clocks = 2,
+			.clk_names = { "aclk", "pclk"},
+			.irq_flag = IRQF_SHARED,
+			.irq_handler = mipi_csis_irq_handler_v4_3,
+		},
 	},
 	{ /* sentinel */ },
 };
-- 
2.49.0


