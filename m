Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A066EC88E46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpwPKMXS1eEDAjHhSFyaR025wrGTDdaEoymFHMm4v9s=; b=jCcEZmBXUeyYjk4O/l4y99oFO+
	cNRxLf1Nk30D/1cuggrVierA82rCxSNnGasm9/AzW99NJ+G16u3ihfO6hHRlWglBeU+ljpUnAc8H3
	9nwaolgCUJcXA5Y8FLOE2gzBWHpWR8BjMBm2XgvmES5G9JM8ymlpiG7y+Rw1qmWQ54bpw23A+nsID
	g+1mLHqzV6SCRX1IS3JAf+pWG7NR411t5e/m3o3vbk7u1+5TvajkAAI4EC7Nw3/76KPog036IwxUa
	9WDR4/6kqnUONW4km+4K1pmgBiFiVN19y0QYhakjb+YUx9qrUA2MNbF52oFplQxPh7Aj3bfn13ClH
	q5cgohbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4axx-0000000Dr8Y-411U;
	Thu, 10 Sep 2026 09:21:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4axj-0000000Dqgx-1O0N;
	Thu, 10 Sep 2026 09:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032053;
	bh=sqJwfG+YalrOjRoK+Gfc7gM7SkpGIZzCbiNm29+2HH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ph7MS1xKK0uE2uNMDWcK95bH/+gvhOa/gZI1WpxlXit+ZAVon+fkSnikIvw9ohlZo
	 KrsWb+R5OT/lQ2pRiONfcqHUIBPwruCihOfVKCIzW44NcaxNttAlDRBXiEtkMxlqdA
	 ubf0M6aMkhxLAzab/Hn8F2BLMSXAqI1XalKqvk8O31bNVh/EmeJCkHxJzsgun9Q0tQ
	 S/fuW+cLV7IrQby3vL9mtyTDA2e++9lVBlw2JoI7FYK84RjlvOKKSvJDse/vIjQ+Hr
	 WpWG9hIYD3pmiwJrIqyadmU2n+IJWJ8YFidR0TqMOgkZa6l61nqek7AnGDy/2yY1XC
	 0EB3ycNh/bBKg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 792F417E125C;
	Thu, 10 Sep 2026 11:20:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mani@kernel.org
Cc: chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v4 12/12] phy: phy-mtk-dp: Add support for MT8196 eDP PHY
Date: Thu, 10 Sep 2026 11:20:38 +0200
Message-ID: <20260910092038.48291-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_022055_537139_94B12826 
X-CRM114-Status: GOOD (  13.38  )
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

The MT8196 SoC features an updated PHY IP compared to the older
ones, and there is one that is specific to Embedded DisplayPort.

Add support for the eDP PHY found in the MediaTek MT8196 SoC and
all of its variants.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 66 ++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 30f9fa6e6b9b..6d06e1c39e3b 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2022, BayLibre Inc.
  * Copyright (c) 2022, MediaTek Inc.
  *
- * Major refactoring
+ * Major refactoring and new SoCs support
  * Copyright (c) 2026, Collabora Ltd.
  *                     AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
@@ -43,6 +43,7 @@
 #define TPLL_SSC_EN			BIT(3)
 
 /* DP_PHYD_BIT_RATE */
+#define PHYD_DIG_RG_BIT_RATE_V2		GENMASK(3, 0)
 #define PHYD_DIG_RG_BIT_RATE		GENMASK(1, 0)
 
 /* DP_PHYD_SW_RST */
@@ -63,6 +64,7 @@
 
 /* DP_PHYD_TX_CTL_0 */
 #define PHYD_TX_LN_EN			GENMASK(7, 4)
+#define PHYD_TX_LN_EN_V2		GENMASK(3, 0)
 
 /* DP_PHYD_DRIVING_FORCE */
 #define PHYD_DP_TX_FORCE_VOLT_SWING_EN	BIT(0)
@@ -129,6 +131,16 @@
 #define MT8195_DRIVING_PARAM_7_DEFAULT	BUILD_DRIVING_PARAM_12(0, 6, 12, 0)
 #define MT8195_DRIVING_PARAM_8_DEFAULT	BUILD_DRIVING_PARAM_23(8, 0)
 
+/* MT8196/MT6991: Logic State Change Point (LC TX C) */
+#define MT8196_DRIVING_PARAM_3_DEFAULT	BUILD_DRIVING_PARAM_0( 10, 12, 14, 17)
+#define MT8196_DRIVING_PARAM_4_DEFAULT	BUILD_DRIVING_PARAM_12(14, 17, 18, 18)
+#define MT8196_DRIVING_PARAM_5_DEFAULT	BUILD_DRIVING_PARAM_23(21, 24)
+
+/* MT8196/MT6991: Positive Edge (LC TX CP) */
+#define MT8196_DRIVING_PARAM_6_DEFAULT	BUILD_DRIVING_PARAM_0( 0, 2, 4, 7)
+#define MT8196_DRIVING_PARAM_7_DEFAULT	BUILD_DRIVING_PARAM_12(0, 3, 6, 0)
+#define MT8196_DRIVING_PARAM_8_DEFAULT	BUILD_DRIVING_PARAM_23(3, 0)
+
 enum mtk_dp_phya_ana_glb_regidx {
 	DP_PHYA_GLB_BIAS_GEN_0,
 	DP_PHYA_GLB_BIAS_GEN_1,
@@ -184,6 +196,11 @@ static const u8 mt8195_phy_dig_lane_regs[DP_PHYD_LAN_MAX] = {
 	[DP_PHYD_LAN_DRIVING_PARAM_0] = 0x2c,
 };
 
+static const u8 mt8196_phy_dig_lane_regs[DP_PHYD_LAN_MAX] = {
+	[DP_PHYD_LAN_DRIVING_FORCE] = 0x30,
+	[DP_PHYD_LAN_DRIVING_PARAM_0] = 0x34,
+};
+
 static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
 	[DP_PHYD_PLL_CTL_0] = 0x10,
 	[DP_PHYD_PLL_CTL_1] = 0x14,
@@ -193,6 +210,15 @@ static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
 	[DP_PHYD_TX_CTL_0] = 0x44,
 };
 
+static const u8 mt8196_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
+	[DP_PHYD_PLL_CTL_0] = 0x10,
+	[DP_PHYD_PLL_CTL_1] = 0x14,
+	[DP_PHYD_SW_RST] = 0x38,
+	[DP_PHYD_BIT_RATE] = 0x3c,
+	[DP_PHYD_AUX_RX_CTL] = 0x40,
+	[DP_PHYD_TX_CTL_0] = 0x74,
+};
+
 static const u8 mt8195_phy_dig_bitrate_val[DP_PHYD_BIT_RATE_MAX] = {
 	[DP_PHYD_BIT_RATE_RBR] = 0,
 	[DP_PHYD_BIT_RATE_HBR] = 1,
@@ -200,6 +226,13 @@ static const u8 mt8195_phy_dig_bitrate_val[DP_PHYD_BIT_RATE_MAX] = {
 	[DP_PHYD_BIT_RATE_HBR3] = 3
 };
 
+static const u8 mt8196_edp_phy_dig_bitrate_val[DP_PHYD_BIT_RATE_MAX] = {
+	[DP_PHYD_BIT_RATE_RBR] = 1,
+	[DP_PHYD_BIT_RATE_HBR] = 4,
+	[DP_PHYD_BIT_RATE_HBR2] = 7,
+	[DP_PHYD_BIT_RATE_HBR3] = 9
+};
+
 /**
  * struct mtk_dp_phya_imp_sel - Per-Lane Impedance Selection
  * @pmos: Impedance selection for P-Channel MOSFET
@@ -755,8 +788,39 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	},
 };
 
+static const struct mtk_dp_phy_pdata mt8196_edp_phy_data = {
+	.off_ana_glb = 0x400,
+	.off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
+	.off_dig_glb = 0x1400,
+	.off_dig_lane = (const u16[]) { 0x1000, 0x1100, 0x1200, 0x1300 },
+	.regs_ana_glb = mt8195_phy_ana_glb_regs,
+	.regs_ana_lane = mt8195_phy_ana_lane_regs,
+	.regs_dig_glb = mt8196_phy_dig_glb_regs,
+	.regs_dig_lane = mt8196_phy_dig_lane_regs,
+	.mask_dig_tx_ln = PHYD_TX_LN_EN_V2,
+	.val_dig_bitrate = mt8196_edp_phy_dig_bitrate_val,
+	.ana_bias_r = 15,
+	.ana_cktx_imp = 8,
+	.ana_lanes_imp = {
+		.pmos = 8,
+		.nmos = 8,
+	},
+	.driving_params = (const u32[]) {
+		[0] = 0,
+		[1] = 0,
+		[2] = 0,
+		[3] = MT8196_DRIVING_PARAM_3_DEFAULT,
+		[4] = MT8196_DRIVING_PARAM_4_DEFAULT,
+		[5] = MT8196_DRIVING_PARAM_5_DEFAULT,
+		[6] = MT8196_DRIVING_PARAM_6_DEFAULT,
+		[7] = MT8196_DRIVING_PARAM_7_DEFAULT,
+		[8] = MT8196_DRIVING_PARAM_8_DEFAULT
+	},
+};
+
 static const struct of_device_id mtk_dp_phy_of_match[] = {
 	{ .compatible = "mediatek,mt8195-dp-phy", .data = &mt8195_dp_phy_data },
+	{ .compatible = "mediatek,mt8196-edp-phy", .data = &mt8196_edp_phy_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_phy_of_match);
-- 
2.55.0


