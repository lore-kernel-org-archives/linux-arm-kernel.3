Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D11CC44509
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc4IQqFE6rHWqa2K8VM4Mo3EVkKFaEzQLLo0nXh38bI=; b=MxncE4uiECMfWxPy5aV2BwrHvH
	rjpJlO1Ucc38FT7ii5nxJQ7hlihvsHm09B/hXx7y0YwlEdIT/1wUKZn0ihieAieGL65al7PmbGlcA
	dnH8kyBNZeX/zUgGktplJ+GEigJGwkDD9CeIcQ++Boyh/hoq40YktHTvTAfMKhzMAMuA/hM8uNX5+
	Ms9XUuxXkpw9vgMU/do51nnoZgV5v8PDmfdKFy8wGCkIt8w0Pod2a+f6EXRmptIW8HK1wPOmNrez9
	mgNADs/efbWtgdyDUr1DQH1GmiZygXplF0WUtR7fT9ZI1K3LdgsQS4cqABGqVVDipPrZLVYdj2+ye
	8BbGMomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7x0-0000000FMGe-0wR4;
	Tue, 07 Jul 2026 15:43:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7wm-0000000FM08-3mIV;
	Tue, 07 Jul 2026 15:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783438974;
	bh=JM/48W88p073Zim9xY8jYQ61aqxveCjR1wWV4NkHB7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WKGSWEIMbL27otAZWaErsz7u8iogp/+YqKWF6jCAdS+UJPJCVaZi2BOieLDEFfYAL
	 z08W+cW+sP2u1fhncznLmE0m76YBnC2pIMTZFEOZOJvjJ2d/TfhamrX0K4kBAd8sFz
	 HFwNYhd/A5SOsRWKrAq4/bzttAeAVjojnmq1LFJ6BEXc8XsAXoLjzxAIiAuZQRFyf6
	 lC8Qq8UQB6C+nnWSMyLrPRx7kj/MtrJF0cjL600qwiVqpuF4t/n9LsZZGQd1Iu+e6p
	 OzTV/lobCw9R5SpNrvRMAfH2FwO8ClC1O/mA1Q76CyHirP/tgAlzn/WSaXPjBMdhhl
	 +cdL0T9y3jMzw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E12717E013E;
	Tue, 07 Jul 2026 17:42:54 +0200 (CEST)
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
Subject: [PATCH v3 07/12] phy: phy-mtk-dp: Support setting volt swing and preemphasis values
Date: Tue,  7 Jul 2026 17:42:40 +0200
Message-ID: <20260707154245.198361-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084259_945467_D41D1C12 
X-CRM114-Status: GOOD (  14.95  )
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

Add support for honoring the set_voltages request to set the
voltage swing and preemphasis values in the .configure() callback.

For proper hardware cleanup, reset both in the .reset() callback.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 44 ++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 2c8bc0b37486..c87e9fa710a4 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -54,6 +54,11 @@
 /* DP_PHYD_TX_CTL_0 */
 #define PHYD_TX_LN_EN			GENMASK(7, 4)
 
+/* DP_PHYD_DRIVING_FORCE */
+#define PHYD_DP_TX_FORCE_VOLT_SWING_EN	BIT(0)
+#define PHYD_DP_TX_FORCE_VOLT_SWING_VAL	GENMASK(2, 1)
+#define PHYD_DP_TX_FORCE_PRE_EMPH_VAL	GENMASK(4, 3)
+
 #define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
 #define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(BIT(10) | BIT(12))
 #define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
@@ -107,6 +112,7 @@ enum mtk_dp_phya_ana_glb_regidx {
 };
 
 enum mtk_dp_phyd_dig_lane_regidx {
+	DP_PHYD_LAN_DRIVING_FORCE,
 	DP_PHYD_LAN_DRIVING_PARAM_0,
 	DP_PHYD_LAN_MAX
 };
@@ -127,6 +133,7 @@ static const u8 mt8195_phy_ana_glb_regs[DP_PHYA_GLOBAL_MAX] = {
 };
 
 static const u8 mt8195_phy_dig_lane_regs[DP_PHYD_LAN_MAX] = {
+	[DP_PHYD_LAN_DRIVING_FORCE] = 0x18,
 	[DP_PHYD_LAN_DRIVING_PARAM_0] = 0x2c,
 };
 
@@ -244,6 +251,30 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 				   PHYD_TX_LN_EN, val);
 	}
 
+	if (opts->dp.set_voltages) {
+		const u32 reg_drv_force = pdata->regs_dig_lane[DP_PHYD_LAN_DRIVING_FORCE];
+
+		if (opts->dp.lanes > 4) {
+			dev_err(&phy->dev, "Wrong lanes config %u\n", opts->dp.lanes);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < opts->dp.lanes; i++) {
+			const u32 off_dig_lane = pdata->off_dig_lane[i];
+			u32 val;
+
+			val = FIELD_PREP(PHYD_DP_TX_FORCE_VOLT_SWING_VAL, opts->dp.voltage[i]);
+			val |= FIELD_PREP(PHYD_DP_TX_FORCE_PRE_EMPH_VAL, opts->dp.pre[i]);
+			val |= PHYD_DP_TX_FORCE_VOLT_SWING_EN;
+
+			regmap_update_bits(dp_phy->regmap, off_dig_lane + reg_drv_force,
+					   PHYD_DP_TX_FORCE_VOLT_SWING_EN |
+					   PHYD_DP_TX_FORCE_VOLT_SWING_VAL |
+					   PHYD_DP_TX_FORCE_PRE_EMPH_VAL,
+					   val);
+		}
+	}
+
 	regmap_update_bits(dp_phy->regmap,
 			   pdata->off_dig_glb + pdata->regs_dig_glb[DP_PHYD_PLL_CTL_1],
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
@@ -352,7 +383,8 @@ static int mtk_dp_phy_reset(struct phy *phy)
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
 	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
 	const u32 reg_rst = pdata->regs_dig_glb[DP_PHYD_SW_RST];
-	int ret;
+	const u32 reg_drv_force = pdata->regs_dig_lane[DP_PHYD_LAN_DRIVING_FORCE];
+	int i, ret;
 
 	/* Clearing bits sets reset state */
 	regmap_clear_bits(dp_phy->regmap, pdata->off_dig_glb + reg_rst, DP_GLB_SW_RST_PHYD);
@@ -368,6 +400,16 @@ static int mtk_dp_phy_reset(struct phy *phy)
 	if (ret)
 		dev_err(dp_phy->dev, "Could not disable lanes during reset!\n");
 
+	/* Reset Voltage Swing and Preemphasis values */
+	for (i = 0; i < MTK_DP_PHY_MAX_LANES; i++) {
+		const u32 off_dig_lane = pdata->off_dig_lane[i];
+
+		regmap_clear_bits(dp_phy->regmap, off_dig_lane + reg_drv_force,
+				   PHYD_DP_TX_FORCE_VOLT_SWING_EN |
+				   PHYD_DP_TX_FORCE_VOLT_SWING_VAL |
+				   PHYD_DP_TX_FORCE_PRE_EMPH_VAL);
+	}
+
 	return 0;
 }
 
-- 
2.54.0


