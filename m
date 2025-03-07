Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC0C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 03:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfod4X9YZQ4yJyamGFaP1t/ZVMJywi8k1TblKiB7oCQ=; b=FWPmx/f3ffie0/23PdkVyjrmie
	+g7chx84nf5im77BTU5DLaZowz6ywe+AaGz/UnbH00u8k2t5dhubZyjvbjt1wQuVXbqwRy182ceRU
	Zdb6vjC8Z8/KPCDKwVuCWiGEaAi/e4vQRNPXFeT91rW4jcRdiNEJ34r/cX9Qnsc6wJHV92EgfuyGU
	oaTCR80sLG7uNWoVST/71lxlWZGE0+BlVyBc8kqHnUoEodr7jbektbmaxnnA6KhiB/2WHgGkU+1Xf
	r6akQ8OSPabl+2Nczgw5NgG4RAnFJKFkamyO9dbJfoILIl5nRQOqJ/9S5/exPp1q5H6DyGyxMCykx
	rMAQdx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOre-0000000D3xh-08ku;
	Fri, 07 Mar 2025 03:59:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOSH-0000000CzVp-43BS;
	Fri, 07 Mar 2025 03:32:59 +0000
X-UUID: d8da11d6fb0411efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sfod4X9YZQ4yJyamGFaP1t/ZVMJywi8k1TblKiB7oCQ=;
	b=lYy5dTM8oQG65LK4YUQxFuK2sd77Q+vmb6TMjNrrav1KBzA/WS1dS+vjaa2FkQ8239kVSsHEKX3PGs1DagjEITY6OxrKG/7u1Hv0NKI/bppHvTTkpNpR0rdIkMsRc8QRqy07msxPGQabzrN9H3ogJF9ZIRH3NFp26i8VN505+/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:22808b6a-bb6f-4a01-968d-a37d9a81d8a7,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:94e307c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d8da11d6fb0411efa1e849db4cc18d44-20250306
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1145744271; Thu, 06 Mar 2025 20:32:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:47 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>, Guangjie Song
	<guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 15/26] clk: mediatek: Add MT8196 mcu clock support
Date: Fri, 7 Mar 2025 11:27:11 +0800
Message-ID: <20250307032942.10447-16-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307032942.10447-1-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193258_008306_101F5135 
X-CRM114-Status: GOOD (  19.10  )
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

Add MT8196 mcu clock controller which provides pll control for mcu.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |   7 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8196-mcu.c | 167 ++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mcu.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index bc373e9ab589..4473feebae40 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1024,6 +1024,13 @@ config COMMON_CLK_MT8196_IMP_IIC_WRAP
 	help
 	  This driver supports MediaTek MT8196 i2c clocks.
 
+config COMMON_CLK_MT8196_MCUSYS
+	tristate "Clock driver for MediaTek MT8196 mcusys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 mcusys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index beea4d8eeebe..1f6717569609 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -155,6 +155,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-apmixedsys
 				   clk-mt8196-peri_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8196_ADSP) += clk-mt8196-adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
+obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-mcu.c b/drivers/clk/mediatek/clk-mt8196-mcu.c
new file mode 100644
index 000000000000..19d13156794c
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-mcu.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Guangjie Song <guangjie.song@mediatek.com>
+ */
+#include <dt-bindings/clock/mt8196-clk.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-pll.h"
+
+#define ARMPLL_LL_CON0	0x008
+#define ARMPLL_LL_CON1	0x00c
+#define ARMPLL_LL_CON2	0x010
+#define ARMPLL_LL_CON3	0x014
+#define ARMPLL_BL_CON0	0x008
+#define ARMPLL_BL_CON1	0x00c
+#define ARMPLL_BL_CON2	0x010
+#define ARMPLL_BL_CON3	0x014
+#define ARMPLL_B_CON0	0x008
+#define ARMPLL_B_CON1	0x00c
+#define ARMPLL_B_CON2	0x010
+#define ARMPLL_B_CON3	0x014
+#define CCIPLL_CON0	0x008
+#define CCIPLL_CON1	0x00c
+#define CCIPLL_CON2	0x010
+#define CCIPLL_CON3	0x014
+#define PTPPLL_CON0	0x008
+#define PTPPLL_CON1	0x00c
+#define PTPPLL_CON2	0x010
+#define PTPPLL_CON3	0x014
+
+#define MT8196_PLL_FMAX		(3800UL * MHZ)
+#define MT8196_PLL_FMIN		(1500UL * MHZ)
+#define MT8196_INTEGER_BITS	8
+
+#define PLL(_id, _name, _reg, _en_reg, _en_mask, _pll_en_bit,	\
+	    _flags, _rst_bar_mask,				\
+	    _pd_reg, _pd_shift, _tuner_reg,			\
+	    _tuner_en_reg, _tuner_en_bit,			\
+	    _pcw_reg, _pcw_shift, _pcwbits) {			\
+		.id = _id,					\
+		.name = _name,					\
+		.reg = _reg,					\
+		.en_reg = _en_reg,				\
+		.en_mask = _en_mask,				\
+		.pll_en_bit = _pll_en_bit,			\
+		.flags = (_flags) | CLK_FENC_ENABLE,		\
+		.rst_bar_mask = _rst_bar_mask,			\
+		.fmax = MT8196_PLL_FMAX,			\
+		.fmin = MT8196_PLL_FMIN,			\
+		.pd_reg = _pd_reg,				\
+		.pd_shift = _pd_shift,				\
+		.tuner_reg = _tuner_reg,			\
+		.tuner_en_reg = _tuner_en_reg,			\
+		.tuner_en_bit = _tuner_en_bit,			\
+		.pcw_reg = _pcw_reg,				\
+		.pcw_shift = _pcw_shift,			\
+		.pcwbits = _pcwbits,				\
+		.pcwibits = MT8196_INTEGER_BITS,		\
+	}
+
+static const struct mtk_pll_data cpu_bl_plls[] = {
+	PLL(CLK_CPBL_ARMPLL_BL, "armpll-bl", ARMPLL_BL_CON0,
+	    ARMPLL_BL_CON0, 0, 0, PLL_AO, BIT(0),
+	    ARMPLL_BL_CON1, 24, 0, 0, 0,
+	    ARMPLL_BL_CON1, 0, 22),
+};
+
+static const struct mtk_pll_data cpu_b_plls[] = {
+	PLL(CLK_CPB_ARMPLL_B, "armpll-b", ARMPLL_B_CON0,
+	    ARMPLL_B_CON0, 0, 0, PLL_AO, BIT(0),
+	    ARMPLL_B_CON1, 24, 0, 0, 0,
+	    ARMPLL_B_CON1, 0, 22),
+};
+
+static const struct mtk_pll_data cpu_ll_plls[] = {
+	PLL(CLK_CPLL_ARMPLL_LL, "armpll-ll", ARMPLL_LL_CON0,
+	    ARMPLL_LL_CON0, 0, 0, PLL_AO, BIT(0),
+	    ARMPLL_LL_CON1, 24, 0, 0, 0,
+	    ARMPLL_LL_CON1, 0, 22),
+};
+
+static const struct mtk_pll_data cci_plls[] = {
+	PLL(CLK_CCIPLL, "ccipll", CCIPLL_CON0,
+	    CCIPLL_CON0, 0, 0, PLL_AO, BIT(0),
+	    CCIPLL_CON1, 24, 0, 0, 0,
+	    CCIPLL_CON1, 0, 22),
+};
+
+static const struct mtk_pll_data ptp_plls[] = {
+	PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0,
+	    PTPPLL_CON0, 0, 0, PLL_AO, BIT(0),
+	    PTPPLL_CON1, 24, 0, 0, 0,
+	    PTPPLL_CON1, 0, 22),
+};
+
+static const struct of_device_id of_match_clk_mt8196_mcu[] = {
+	{ .compatible = "mediatek,mt8196-armpll_bl_pll_ctrl", .data = &cpu_bl_plls, },
+	{ .compatible = "mediatek,mt8196-armpll_b_pll_ctrl", .data = &cpu_b_plls, },
+	{ .compatible = "mediatek,mt8196-armpll_ll_pll_ctrl", .data = &cpu_ll_plls, },
+	{ .compatible = "mediatek,mt8196-ccipll_pll_ctrl", .data = &cci_plls, },
+	{ .compatible = "mediatek,mt8196-ptppll_pll_ctrl", .data = &ptp_plls, },
+	{ /* sentinel */ }
+};
+
+static int clk_mt8196_mcu_probe(struct platform_device *pdev)
+{
+	const struct mtk_pll_data *plls;
+	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int num_plls = 1;
+	int r;
+
+	plls = of_device_get_match_data(&pdev->dev);
+	if (!plls)
+		return -EINVAL;
+
+	clk_data = mtk_alloc_clk_data(num_plls);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_plls(node, plls, num_plls, clk_data);
+	if (r) {
+		mtk_free_clk_data(clk_data);
+		return r;
+	}
+
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r) {
+		mtk_clk_unregister_plls(plls, num_plls, clk_data);
+		mtk_free_clk_data(clk_data);
+		return r;
+	}
+
+	return 0;
+}
+
+static void clk_mt8196_mcu_remove(struct platform_device *pdev)
+{
+	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+	int num_plls = 1;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(plls, num_plls, clk_data);
+	mtk_free_clk_data(clk_data);
+}
+
+static struct platform_driver clk_mt8196_mcu_drv = {
+	.probe = clk_mt8196_mcu_probe,
+	.remove = clk_mt8196_mcu_remove,
+	.driver = {
+		.name = "clk-mt8196-mcu",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_clk_mt8196_mcu,
+	},
+};
+
+module_platform_driver(clk_mt8196_mcu_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


