Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC11C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 03:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lke6nTx8Kn+xmKD6dSCYG3ajKAm3MT4NJU3X/4qY93E=; b=DV/qVCeZwOTscIu8dfe8r5jc60
	iFSKtD1gOVp2REBBvdIiL8iHWtb/gJvxN1Mj7VIwVE0RcfIxAQnlmegOscxn8Ivaj1Gt0y6cGfpXv
	5v0s/mM3a7iiCMl7g96WLy4uvW5yfLO6rjHoKpPDmMXtoLEPEFC0KLEWiK6FHxBppWg2eZXkdjZiC
	Dbgkv+tmTyZj2DRsHzRPtsZ/jdZ9VLHX3GepYFuPD4wkqIeGWaBvCs0K5j4igI9Px1tyOmZXENe8V
	3ZEeiY01a4D4UtF/2Gisokk6lv4KUlmlSTdoLjY+RNny4tvgDhFb2wLsoqnJJu+e3Tj+Ts1ReL2/c
	gMFZbdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOd5-0000000D1vq-0HRu;
	Fri, 07 Mar 2025 03:44:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOS7-0000000CzO3-3wme;
	Fri, 07 Mar 2025 03:32:49 +0000
X-UUID: d4d8596cfb0411ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lke6nTx8Kn+xmKD6dSCYG3ajKAm3MT4NJU3X/4qY93E=;
	b=enU4Ob++gu/SsJJf/zNC+/NGCMjyA5kJhAjyWlYMFNyv3RFt2gSNGoGJeRcn6eDLkoqoQDpXEAwavfD6y0Hy3fPIjGcefQHPsQNkQRXQucvpg7Bmf+s0P/jS3NxN+P369B7f5Ud2v+c4P/os4y4Sjf0Xb8X6xm8mWmm8ozC4stc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4006226b-d4b0-46b2-a7e1-650eef78c9b8,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:e1e207c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d4d8596cfb0411ef83f2a1c9db70dae0-20250306
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486747241; Thu, 06 Mar 2025 20:32:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:40 +0800
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
Subject: [PATCH 08/26] clk: mediatek: Add MT8196 apmixedsys_gp2 clock support
Date: Fri, 7 Mar 2025 11:27:04 +0800
Message-ID: <20250307032942.10447-9-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307032942.10447-1-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193247_989136_904C5500 
X-CRM114-Status: GOOD (  17.93  )
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

Add MT8196 apmixedsys_gp2 clock controller which provides pll generated
from SoC 26m

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/clk/mediatek/Makefile                 |   2 +-
 .../clk/mediatek/clk-mt8196-apmixedsys_gp2.c  | 154 ++++++++++++++++++
 2 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-apmixedsys_gp2.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 6144fdce3f9a..247bad396cfb 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -150,7 +150,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) += clk-mt8195-vdo0.o clk-mt8195-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) += clk-mt8195-vpp0.o clk-mt8195-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
-obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o
+obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-apmixedsys_gp2.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-apmixedsys_gp2.c b/drivers/clk/mediatek/clk-mt8196-apmixedsys_gp2.c
new file mode 100644
index 000000000000..dc895d103bfe
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-apmixedsys_gp2.c
@@ -0,0 +1,154 @@
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
+/* PLL REG */
+#define MAINPLL2_CON0	0x250
+#define MAINPLL2_CON1	0x254
+#define MAINPLL2_CON2	0x258
+#define MAINPLL2_CON3	0x25c
+#define UNIVPLL2_CON0	0x264
+#define UNIVPLL2_CON1	0x268
+#define UNIVPLL2_CON2	0x26c
+#define UNIVPLL2_CON3	0x270
+#define MMPLL2_CON0	0x278
+#define MMPLL2_CON1	0x27c
+#define MMPLL2_CON2	0x280
+#define MMPLL2_CON3	0x284
+#define IMGPLL_CON0	0x28c
+#define IMGPLL_CON1	0x290
+#define IMGPLL_CON2	0x294
+#define IMGPLL_CON3	0x298
+#define TVDPLL1_CON0	0x2a0
+#define TVDPLL1_CON1	0x2a4
+#define TVDPLL1_CON2	0x2a8
+#define TVDPLL1_CON3	0x2ac
+#define TVDPLL2_CON0	0x2b4
+#define TVDPLL2_CON1	0x2b8
+#define TVDPLL2_CON2	0x2bc
+#define TVDPLL2_CON3	0x2c0
+#define TVDPLL3_CON0	0x2c8
+#define TVDPLL3_CON1	0x2cc
+#define TVDPLL3_CON2	0x2d0
+#define TVDPLL3_CON3	0x2d4
+
+#define MT8196_PLL_FMAX		(3800UL * MHZ)
+#define MT8196_PLL_FMIN		(1500UL * MHZ)
+#define MT8196_INTEGER_BITS	8
+
+#define PLL_FENC(_id, _name, _reg, _fenc_sta_ofs, _fenc_sta_bit,\
+		 _flags, _pd_reg, _pd_shift,			\
+		 _pcw_reg, _pcw_shift, _pcwbits) {		\
+		.id = _id,					\
+		.name = _name,					\
+		.reg = _reg,					\
+		.fenc_sta_ofs = _fenc_sta_ofs,			\
+		.fenc_sta_bit = _fenc_sta_bit,			\
+		.flags = (_flags) | CLK_FENC_ENABLE,		\
+		.fmax = MT8196_PLL_FMAX,			\
+		.fmin = MT8196_PLL_FMIN,			\
+		.pd_reg = _pd_reg,				\
+		.pd_shift = _pd_shift,				\
+		.pcw_reg = _pcw_reg,				\
+		.pcw_shift = _pcw_shift,			\
+		.pcwbits = _pcwbits,				\
+		.pcwibits = MT8196_INTEGER_BITS,		\
+	}
+
+static const struct mtk_pll_data apmixed2_plls[] = {
+	PLL_FENC(CLK_APMIXED2_MAINPLL2, "mainpll2", MAINPLL2_CON0,
+		 0x03c, 6, 0,
+		 MAINPLL2_CON1, 24,
+		 MAINPLL2_CON1, 0, 22),
+	PLL_FENC(CLK_APMIXED2_UNIVPLL2, "univpll2", UNIVPLL2_CON0,
+		 0x03c, 5, 0,
+		 UNIVPLL2_CON1, 24,
+		 UNIVPLL2_CON1, 0, 22),
+	PLL_FENC(CLK_APMIXED2_MMPLL2, "mmpll2", MMPLL2_CON0,
+		 0x03c, 4, 0,
+		 MMPLL2_CON1, 24,
+		 MMPLL2_CON1, 0, 22),
+	PLL_FENC(CLK_APMIXED2_IMGPLL, "imgpll", IMGPLL_CON0,
+		 0x03c, 3, 0,
+		 IMGPLL_CON1, 24,
+		 IMGPLL_CON1, 0, 22),
+	PLL_FENC(CLK_APMIXED2_TVDPLL1, "tvdpll1", TVDPLL1_CON0,
+		 0x03c, 2, 0,
+		 TVDPLL1_CON1, 24,
+		 TVDPLL1_CON1, 0, 22),
+	PLL_FENC(CLK_APMIXED2_TVDPLL2, "tvdpll2", TVDPLL2_CON0,
+		 0x03c, 1, 0,
+		 TVDPLL2_CON1, 24,
+		 TVDPLL2_CON1, 0, 22),
+	PLL_FENC(CLK_APMIXED2_TVDPLL3, "tvdpll3", TVDPLL3_CON0,
+		 0x03c, 0, 0,
+		 TVDPLL3_CON1, 24,
+		 TVDPLL3_CON1, 0, 22),
+};
+
+static int clk_mt8196_apmixed2_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int num_plls = ARRAY_SIZE(apmixed2_plls);
+	int r;
+
+	clk_data = mtk_alloc_clk_data(num_plls);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_plls(node, apmixed2_plls, num_plls, clk_data);
+	if (r) {
+		mtk_free_clk_data(clk_data);
+		return r;
+	}
+
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r) {
+		mtk_clk_unregister_plls(apmixed2_plls, num_plls, clk_data);
+		mtk_free_clk_data(clk_data);
+		return r;
+	}
+
+	return 0;
+}
+
+static void clk_mt8196_apmixed2_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(apmixed2_plls, ARRAY_SIZE(apmixed2_plls), clk_data);
+	mtk_free_clk_data(clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8196_apmixed2[] = {
+	{ .compatible = "mediatek,mt8196-apmixedsys_gp2", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8196_apmixed2_drv = {
+	.probe = clk_mt8196_apmixed2_probe,
+	.remove = clk_mt8196_apmixed2_remove,
+	.driver = {
+		.name = "clk-mt8196-apmixed2",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_clk_mt8196_apmixed2,
+	},
+};
+
+module_platform_driver(clk_mt8196_apmixed2_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


