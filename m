Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlPpkCF+s4pGueW2oV2vFQsw4gtvEmLqE1Ue53tWAW8=; b=h6d496hmVN1KJR3K6Ywh0qvwnN
	Tp+9YQf92uwn1Rq4ltgoXjectYYseA/YtU8tmmzeUz1po18pX6gJKPSrLU2QcaZujxlOgDLY31IFk
	/c7i6/jt4F1RZgpKQPdCgx/+EbHN/dueqT5Gu1xK1I/g0AWB8E4Fd+Jdyu+mm0x1par4RCeiqg2pY
	d2AVWR63nDcpPjd06EFk+tEc0a5vaoNxFjCopU3WViStjowOd7wyCbWmWc0xJeLobf+G4NX6Lc6yL
	SDnSXwESN9nC1cTz8JTBHWqlOguWPB0XhNKJubGyCRY6BtPn4Ep8N33I3LO6fK/i0qAtel5Y150I6
	mG03FvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDp4-00000008sPi-1GB9;
	Mon, 13 Jul 2026 10:23:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDov-00000008sF0-2qOP;
	Mon, 13 Jul 2026 10:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783938207;
	bh=e6EW3G1noluvUbsf4mXKsPJ8a0ez3clxF+2eHH/FFqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvZvIn/K20LMUklJ5R2g85ND+bvgYQRUr6X1Kahvy6RsateTMQbNPTNdkySXFIOLq
	 DU5m0jIoWgPko7AfNhJwbfSVjqR358RAzxaSl/WiMxW3mX5wGA80IBZozpp3H7G7no
	 J2wykpuXVraFpr08UWD9eKtFS7eAulLmqW/qv7QWyLM79tKUIGwla3c8+oJEznEH0p
	 0jfLKtqNyk+KHVaSSOaUkTLPHfJ0jeagwlrS7/VWIzdJer5NXKukcxPcIvI8xddrBr
	 +xFZpAAzPZOXYTPGHtu3gJ3sqtPVipxwnm4vFVOrM8lB2gvBAS4hOo0l+nIQDgB9yp
	 jdtVet+n8d1XQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFF4F17E023C;
	Mon, 13 Jul 2026 12:23:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
Date: Mon, 13 Jul 2026 12:23:22 +0200
Message-ID: <20260713102322.21782-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713102322.21782-1-angelogioacchino.delregno@collabora.com>
References: <20260713102322.21782-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_032329_884581_AD665C8E 
X-CRM114-Status: GOOD (  20.85  )
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

Add support for the MIPI DSI PHY found in the MediaTek MT8196 SoC
and its variants.
This PHY has a different register layout and provides support for
more hardware features compared to the previous generation.

This initial driver only adds support for basic functionality that
is necessary to drive MIPI DSI displays as a D-PHY.

Feature additions like lane-swap, DPHY/CPHY switching, dual-port,
and others, may be done in the future.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/Makefile                 |   1 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8196.c    | 196 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |   1 +
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   2 +-
 4 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c

diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index 1b8088df71e8..ed0da708759b 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -21,4 +21,5 @@ obj-$(CONFIG_PHY_MTK_MIPI_CSI_0_5)	+= phy-mtk-mipi-csi-0-5.o
 phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
+phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8196.o
 obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c
new file mode 100644
index 000000000000..273f236fa7e9
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: jitao.shi <jitao.shi@mediatek.com>
+ *
+ * Copyright (c) 2026 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include "phy-mtk-io.h"
+#include "phy-mtk-mipi-dsi.h"
+
+#define MIPITX_LANE_CON		0x0004
+#define RG_DSI_CPHY_T1DRV_EN		BIT(0)
+#define RG_DSI_ANA_CK_SEL		BIT(1)
+#define RG_DSI_PHY_CK_SEL		BIT(2)
+#define RG_DSI_CPHY_EN			BIT(3)
+#define RG_DSI_PHYCK_INV_EN		BIT(4)
+#define RG_DSI_PWR04_EN			BIT(5)
+#define RG_DSI_BG_LPF_EN		BIT(6)
+#define RG_DSI_BG_CORE_EN		BIT(7)
+#define RG_DSI_PAD_TIEL_SEL		BIT(8)
+
+#define MIPITX_VOLTAGE_SEL	0x0008
+#define RG_DSI_HSTX_LDO_REF_SEL		GENMASK(9, 6)
+#define RG_DSI_PRD_REF_SEL		GENMASK(5, 0)
+#define RG_DSI_PRD_REF_MINI		0
+#define RG_DSI_PRD_REF_DEF		4
+#define RG_DSI_PRD_REF_MAX		7
+
+#define MIPITX_PRESERVED	0x000c
+#define MIPITX_PRESERVED_DEF		0xffff0040
+#define MIPITX_PRESERVED_MINI		0xffff00f0
+
+#define MIPITX_PLL_PWR		0x0028
+#define AD_DSI_PLL_SDM_PWR_ON		BIT(0)
+#define AD_DSI_PLL_SDM_ISO_EN		BIT(1)
+#define MIPITX_PLL_CON0		0x002c
+#define MIPITX_PLL_CON1		0x0030
+#define RG_DSI_PLL_EN			BIT(0)
+#define RG_DSI_PLL_POSDIV		GENMASK(10, 8)
+#define MIPITX_PLL_CON2		0x0034
+#define MIPITX_PLL_CON3		0x0038
+#define MIPITX_PLL_CON4		0x003c
+#define RG_DSI_PLL_IBIAS		GENMASK(11, 10)
+
+#define MIPITX_D2_SW_CTL_EN	0x015c
+#define MIPITX_D0_SW_CTL_EN	0x025c
+#define MIPITX_CK_CKMODE_EN	0x0320
+#define DSI_CK_CKMODE_EN		BIT(0)
+#define MIPITX_CK_SW_CTL_EN	0x035c
+#define MIPITX_D1_SW_CTL_EN	0x045c
+#define MIPITX_D3_SW_CTL_EN	0x055c
+#define DSI_SW_CTL_EN			BIT(0)
+
+#define DSI_PHY_XTAL_CLK_HZ		26000000
+
+static int mtk_mipi_tx_pll_enable(struct clk_hw *hw)
+{
+	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
+	void __iomem *base = mipi_tx->regs;
+	u32 voltage = RG_DSI_PRD_REF_MINI;
+	u32 pres = MIPITX_PRESERVED_MINI;
+	unsigned long long pcw_calc;
+	unsigned int txdiv, txdiv0;
+	u32 pcw;
+
+	dev_dbg(mipi_tx->dev, "enable: %u bps\n", mipi_tx->data_rate);
+
+	if (mipi_tx->data_rate >= 2000000000) {
+		/* Select higher signaling voltage for fast data rates */
+		voltage = RG_DSI_PRD_REF_DEF;
+		pres = MIPITX_PRESERVED_DEF;
+		txdiv = 1;
+		txdiv0 = 0;
+	} else if (mipi_tx->data_rate >= 1000000000) {
+		txdiv = 2;
+		txdiv0 = 1;
+	} else if (mipi_tx->data_rate >= 500000000) {
+		txdiv = 4;
+		txdiv0 = 2;
+	} else if (mipi_tx->data_rate > 250000000) {
+		txdiv = 8;
+		txdiv0 = 3;
+	} else if (mipi_tx->data_rate >= 125000000) {
+		txdiv = 16;
+		txdiv0 = 4;
+	} else {
+		return -EINVAL;
+	}
+
+	pcw_calc = ((u64)(mipi_tx->data_rate / 2) * txdiv) << 24;
+	pcw_calc = div_u64(pcw_calc, DSI_PHY_XTAL_CLK_HZ);
+
+	if (pcw_calc > U32_MAX) {
+		dev_err(mipi_tx->dev, "Calculated PCW=%llu overflow!\n", pcw_calc);
+		return -EINVAL;
+	}
+	pcw = (u32)pcw_calc;
+
+	mtk_phy_update_field(base + MIPITX_VOLTAGE_SEL, RG_DSI_PRD_REF_SEL, voltage);
+	writel(pres, base + MIPITX_PRESERVED);
+
+	mtk_phy_set_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
+	mtk_phy_clear_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+	usleep_range(30, 60);
+
+	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
+	writel(pcw, base + MIPITX_PLL_CON0);
+	mtk_phy_update_field(base + MIPITX_PLL_CON1, RG_DSI_PLL_POSDIV, txdiv0);
+	usleep_range(30, 60);
+
+	mtk_phy_set_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+	usleep_range(30, 60);
+
+	return 0;
+}
+
+static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
+{
+	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
+	void __iomem *base = mipi_tx->regs;
+
+	mtk_phy_clear_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+
+	mtk_phy_set_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
+	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
+}
+
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
+{
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
+}
+
+static const struct clk_ops mtk_mipi_tx_pll_ops = {
+	.enable = mtk_mipi_tx_pll_enable,
+	.disable = mtk_mipi_tx_pll_disable,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
+	.set_rate = mtk_mipi_tx_pll_set_rate,
+	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
+};
+
+static void mtk_mipi_tx_power_on_signal(struct phy *phy)
+{
+	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
+	void __iomem *base = mipi_tx->regs;
+
+	/* BG_LPF_EN / BG_CORE_EN */
+	writel(RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN, base + MIPITX_LANE_CON);
+	/* Wait for MIPI core to enable */
+	usleep_range(30, 100);
+	writel(RG_DSI_BG_CORE_EN | RG_DSI_BG_LPF_EN, base + MIPITX_LANE_CON);
+
+	/* Switch OFF each Lane */
+	mtk_phy_clear_bits(base + MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
+
+	/*
+	 * The MIPI TX drive strength is in the range of 3000 ~ 6000 microamps:
+	 * RG_DSI_HSTX_LDO_REF_SEL expresses an offset from the minimum drive
+	 * strength (3000uA) and can add a maximum offset of 3000uA, reaching a
+	 * maximum drive strength of 3000+3000=6000uA.
+	 */
+	mtk_phy_update_field(base + MIPITX_VOLTAGE_SEL, RG_DSI_HSTX_LDO_REF_SEL,
+			     (mipi_tx->mipitx_drive - 3000) / 200);
+
+	mtk_phy_set_bits(base + MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
+}
+
+static void mtk_mipi_tx_power_off_signal(struct phy *phy)
+{
+	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
+	void __iomem *base = mipi_tx->regs;
+
+	/* Switch ON each lane one by one */
+	mtk_phy_set_bits(base + MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
+
+	writel(RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN, base + MIPITX_LANE_CON);
+	writel(RG_DSI_PAD_TIEL_SEL, base + MIPITX_LANE_CON);
+}
+
+const struct mtk_mipitx_data mt8196_mipitx_data = {
+	.mipi_tx_clk_ops = &mtk_mipi_tx_pll_ops,
+	.mipi_tx_enable_signal = mtk_mipi_tx_power_on_signal,
+	.mipi_tx_disable_signal = mtk_mipi_tx_power_off_signal,
+};
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 065ea626093a..46f0cb3ac096 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -183,6 +183,7 @@ static const struct of_device_id mtk_mipi_tx_match[] = {
 	{ .compatible = "mediatek,mt2701-mipi-tx", .data = &mt2701_mipitx_data },
 	{ .compatible = "mediatek,mt8173-mipi-tx", .data = &mt8173_mipitx_data },
 	{ .compatible = "mediatek,mt8183-mipi-tx", .data = &mt8183_mipitx_data },
+	{ .compatible = "mediatek,mt8196-mipi-tx", .data = &mt8196_mipitx_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 5d4876f1dc95..e6f967078e3b 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -42,5 +42,5 @@ unsigned long mtk_mipi_tx_pll_recalc_rate(struct clk_hw *hw,
 extern const struct mtk_mipitx_data mt2701_mipitx_data;
 extern const struct mtk_mipitx_data mt8173_mipitx_data;
 extern const struct mtk_mipitx_data mt8183_mipitx_data;
-
+extern const struct mtk_mipitx_data mt8196_mipitx_data;
 #endif
-- 
2.54.0


