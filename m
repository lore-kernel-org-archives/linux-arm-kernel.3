Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC5FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTiTdabjaML30d5Y5Gyjb/FGzqHFJAArnG48U72Dt08=; b=J2zW0Eg6D4VD/Gl92TwtAKYiWp
	HodEorgPGH8q9alcAmmsBbjmVZJvfkl72Ggr6juU+vCHEs2BwkCB/jHpE1oAjMNsxK2zcw95xjchw
	GsdngLE0Vpocd2HEx9zlsl6m3LYN20NGsxBtwkOUpXXNY3KnCN7egCUoUruaXo3pQAOMm7YRcCSra
	IU4YcqCEAT7wkxPZj04qSw9e7x5djTb44TaP+92m+RLnZxzZsFpjcpQkDSJOE/9hCj2gx3GHQrvon
	RhUKqYRnsNWepSyFvCF2CFxFbg9DbUZSq7E91iZLng03qYG5ySnTS2f4aF0QB6yQIbY1jTVK2A44q
	FeYjGm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7xW-0000000FMwr-46ey;
	Tue, 07 Jul 2026 15:43:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7ws-0000000FM42-3QhY;
	Tue, 07 Jul 2026 15:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783438979;
	bh=+l0JxPVMWizDtm7st0nxfuuabxoYFY3ab2cxUYpVGhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nIGWtEjKDxprqxhn4jWdJ9+N5r3huvsEt9hZDz5O0jQ5jIJpZEYlvhS48SRAWHIJd
	 omQy3NaiHkzj6yq7C39mY7ZsytQ+DDM+TIIOBAfwmJ+gW//JYj+WQJRZcvydXtUV3p
	 42lZK1/PzHW1KP569CoYuppW84qiK2wzdvYASXpXY7rMQJhQkbZaa2jP6+FJMKrEth
	 OcnELanv0uQTAyDLbp23kuAKakXkcnxAewX2XkkPl4D69EdJba5G3w/5zwylI4nFxM
	 gVe+xCQDX1ddpkZortmw8Xjxwnkvjeh1SZHe8f+RMVW+8LPgugNGJuGikkuYNqetpv
	 GJwEcf8iF3iGQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A56017E1078;
	Tue, 07 Jul 2026 17:42:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
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
	kernel@collabora.com
Subject: [PATCH v3 12/12] phy: phy-mtk-dp: Add support for MT8196 eDP PHY
Date: Tue,  7 Jul 2026 17:42:45 +0200
Message-ID: <20260707154245.198361-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084303_031625_A473C00E 
X-CRM114-Status: GOOD (  13.71  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 66 ++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index f5aadc5fdc42..5decc29c77cb 100644
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
@@ -805,8 +838,39 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
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
2.54.0


