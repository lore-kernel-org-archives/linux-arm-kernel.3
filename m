Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D12AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxjQDLdx0UG7gRjGuFA0+lUdD8dcgO/jR8OOL1qmwZk=; b=qnYpej+ry7+T6EY4+4geH7AHqu
	3p+PZiSK6u9a7sDYPpYHhJVXFdmgwGDyykmHEtsuLTCwt3wu9pqWKxhTFVOdUz/QgpBCIxZbBiJJY
	4AYSiDWZ6Yv+yl9RgkFHdzNivov07r+gy5y2/1G31E44CKoOf9Rxar33E7DwrbhYQS2n18N9yrFZQ
	5YFM/U4Juwdu7Wdk0Egk1EF1pPa/uM2u+oVA9S+QYOyIX0cmmogzddQbpbIxYHqorRlUo7Hs16W4E
	No3TGOPSLmvO6BXBFfOXBBQEUktNnp2jWBbVnmkfybUN6Y2xriFQ7RKHhT5B73V3LTa0pwxCIxVYp
	Uq7cyPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5g3S-0000000FSiN-2cyC;
	Fri, 18 Apr 2025 07:22:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fbO-0000000FLe1-1Fq0;
	Fri, 18 Apr 2025 06:53:32 +0000
X-UUID: d3b73ace1c2111f083f2a1c9db70dae0-20250417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cxjQDLdx0UG7gRjGuFA0+lUdD8dcgO/jR8OOL1qmwZk=;
	b=RI29SC/NHo58iR/64b2d8HqYZudnXkTinpMrNfri0k8p9uMUmuA5itqSQJ/T75EWSl0QanjhClN1MyFzP5b+JSgGk2NMuvaqO/5qAyrsvnMnffoj3MoBVMg/Hfh1Ag8t/GApAvravmjwsHgjszL02qgx6razUEuyyl19XBIRdZ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:75d15b0b-8289-4ee0-88fb-cf14b29411be,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:8499b9c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d3b73ace1c2111f083f2a1c9db70dae0-20250417
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <bincai.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 480833019; Thu, 17 Apr 2025 23:53:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 14:53:23 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 14:53:22 +0800
From: Bincai Liu <bincai.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, CK Hu
	<ck.hu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	Bincai Liu <bincai.liu@mediatek.com>
Subject: [PATCH 5/5] drm/mediatek: Add eDP phy driver for mt8196
Date: Fri, 18 Apr 2025 14:52:32 +0800
Message-ID: <20250418065313.8972-6-bincai.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418065313.8972-1-bincai.liu@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_235330_350611_76E8264A 
X-CRM114-Status: GOOD (  18.68  )
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

Add code to support eDP phy for mt8196.

Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
---
 drivers/phy/mediatek/Makefile      |   1 +
 drivers/phy/mediatek/phy-mtk-edp.c | 262 +++++++++++++++++++++++++++++
 2 files changed, 263 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-edp.c

diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index 1b8088df71e8..49d9ea42497a 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
+obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-edp.o
 obj-$(CONFIG_PHY_MTK_PCIE)		+= phy-mtk-pcie.o
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
diff --git a/drivers/phy/mediatek/phy-mtk-edp.c b/drivers/phy/mediatek/phy-mtk-edp.c
new file mode 100644
index 000000000000..fadcbda55b70
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-edp.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2022 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define PHYD_OFFSET			0x0000
+#define PHYD_DIG_LAN0_OFFSET		0x1000
+#define PHYD_DIG_LAN1_OFFSET		0x1100
+#define PHYD_DIG_LAN2_OFFSET		0x1200
+#define PHYD_DIG_LAN3_OFFSET		0x1300
+#define PHYD_DIG_GLB_OFFSET		0x1400
+
+#define DP_PHY_DIG_PLL_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x10)
+#define FORCE_PWORE_STATE_FLDMASK		GENMASK(2, 0)
+#define FORCE_PWORE_STATE_VALUE			0x7
+
+#define IPMUX_CONTROL			(PHYD_DIG_GLB_OFFSET + 0x98)
+#define EDPTX_DSI_PHYD_SEL_FLDMASK		0x1
+#define EDPTX_DSI_PHYD_SEL_FLDMASK_POS		0
+
+#define DP_PHY_DIG_TX_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x74)
+#define TX_LN_EN_FLDMASK			0xf
+
+#define mtk_edp_PHY_DIG_PLL_CTL_1	(PHYD_DIG_GLB_OFFSET + 0x14)
+#define TPLL_SSC_EN				BIT(8)
+
+#define mtk_edp_PHY_DIG_BIT_RATE		(PHYD_DIG_GLB_OFFSET + 0x3C)
+#define BIT_RATE_RBR				0x1
+#define BIT_RATE_HBR				0x4
+#define BIT_RATE_HBR2				0x7
+#define BIT_RATE_HBR3				0x9
+
+#define mtk_edp_PHY_DIG_SW_RST		(PHYD_DIG_GLB_OFFSET + 0x38)
+#define DP_GLB_SW_RST_PHYD			BIT(0)
+#define DP_GLB_SW_RST_PHYD_MASK			BIT(0)
+
+#define DRIVING_FORCE			0x30
+#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK	0x6
+#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK_POS	1
+#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK		0x18
+#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK_POS	3
+
+struct mtk_edp_phy {
+	struct regmap *regs;
+};
+
+enum DPTX_LANE_NUM {
+	DPTX_LANE0 = 0x0,
+	DPTX_LANE1 = 0x1,
+	DPTX_LANE2 = 0x2,
+	DPTX_LANE3 = 0x3,
+	DPTX_LANE_MAX,
+};
+
+enum DPTX_LANE_COUNT {
+	DPTX_LANE_COUNT1 = 0x1,
+	DPTX_LANE_COUNT2 = 0x2,
+	DPTX_LANE_COUNT4 = 0x4,
+};
+
+static void mtk_edptx_phyd_reset_swing_pre(struct mtk_edp_phy *edp_phy)
+{
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN2_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN3_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+}
+
+static int mtk_edp_phy_init(struct phy *phy)
+{
+	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
+
+	regmap_update_bits(edp_phy->regs, IPMUX_CONTROL, 0,
+			   EDPTX_DSI_PHYD_SEL_FLDMASK);
+
+	regmap_update_bits(edp_phy->regs, DP_PHY_DIG_PLL_CTL_0,
+			   FORCE_PWORE_STATE_VALUE,
+			   FORCE_PWORE_STATE_FLDMASK);
+
+	return 0;
+}
+
+static int mtk_edp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	if (opts->dp.set_rate) {
+		switch (opts->dp.link_rate) {
+		case 1620:
+			val = BIT_RATE_RBR;
+			break;
+		case 2700:
+			val = BIT_RATE_HBR;
+			break;
+		case 5400:
+			val = BIT_RATE_HBR2;
+			break;
+		case 8100:
+			val = BIT_RATE_HBR3;
+			break;
+		default:
+			dev_err(&phy->dev,
+				"Implementation error, unknown linkrate %x\n",
+				opts->dp.link_rate);
+			return -EINVAL;
+		}
+		regmap_write(edp_phy->regs, mtk_edp_PHY_DIG_BIT_RATE, val);
+	}
+
+	if (opts->dp.set_lanes) {
+		for (val = 0; val < 4; val++) {
+			regmap_update_bits(edp_phy->regs, DP_PHY_DIG_TX_CTL_0,
+					   ((1 << (val + 1)) - 1),
+					   TX_LN_EN_FLDMASK);
+		}
+	}
+
+	if (opts->dp.set_voltages) {
+		switch (opts->dp.lanes) {
+		case DPTX_LANE_COUNT1:
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE0] << 1 |
+					   opts->dp.pre[DPTX_LANE0] << 3);
+		break;
+		case DPTX_LANE_COUNT2:
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE0] << 1 |
+					   opts->dp.pre[DPTX_LANE0] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE1] << 1 |
+					   opts->dp.pre[DPTX_LANE1] << 3);
+		break;
+		case DPTX_LANE_COUNT4:
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE0] << 1 |
+					   opts->dp.pre[DPTX_LANE0] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE1] << 1 |
+					   opts->dp.pre[DPTX_LANE1] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN2_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE2] << 1 |
+					   opts->dp.pre[DPTX_LANE2] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN3_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE3] << 1 |
+					   opts->dp.pre[DPTX_LANE3] << 3);
+		break;
+		default:
+			dev_err(&phy->dev, "Wrong lanes config: %x\n",
+				opts->dp.lanes);
+			return -EINVAL;
+		}
+	}
+
+	regmap_update_bits(edp_phy->regs, mtk_edp_PHY_DIG_PLL_CTL_1,
+			   TPLL_SSC_EN, opts->dp.ssc ? 0 : TPLL_SSC_EN);
+
+	return 0;
+}
+
+static int mtk_edp_phy_reset(struct phy *phy)
+{
+	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
+
+	regmap_update_bits(edp_phy->regs, mtk_edp_PHY_DIG_SW_RST,
+			   0, DP_GLB_SW_RST_PHYD_MASK);
+	usleep_range(50, 200);
+	regmap_update_bits(edp_phy->regs, mtk_edp_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, DP_GLB_SW_RST_PHYD_MASK);
+	regmap_update_bits(edp_phy->regs, DP_PHY_DIG_TX_CTL_0,
+			   0x0, TX_LN_EN_FLDMASK);
+	mtk_edptx_phyd_reset_swing_pre(edp_phy);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_edp_phy_dev_ops = {
+	.init = mtk_edp_phy_init,
+	.configure = mtk_edp_phy_configure,
+	.reset = mtk_edp_phy_reset,
+	.owner = THIS_MODULE,
+};
+
+static int mtk_edp_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_edp_phy *edp_phy;
+	struct phy *phy;
+	struct regmap *regs;
+
+	regs = *(struct regmap **)dev->platform_data;
+	if (!regs)
+		return dev_err_probe(dev, -EINVAL,
+				     "No data passed, requires struct regmap**\n");
+
+	edp_phy = devm_kzalloc(dev, sizeof(*edp_phy), GFP_KERNEL);
+	if (!edp_phy)
+		return -ENOMEM;
+
+	edp_phy->regs = regs;
+	phy = devm_phy_create(dev, NULL, &mtk_edp_phy_dev_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "Failed to create DP PHY\n");
+
+	phy_set_drvdata(phy, edp_phy);
+	if (!dev->of_node)
+		phy_create_lookup(phy, "edp", dev_name(dev));
+
+	return 0;
+}
+
+struct platform_driver mtk_edp_phy_driver = {
+	.probe = mtk_edp_phy_probe,
+	.driver = {
+		.name = "mediatek-edp-phy",
+	},
+};
+
+module_platform_driver(mtk_edp_phy_driver);
+
+MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
+MODULE_DESCRIPTION("MediaTek DP PHY Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


