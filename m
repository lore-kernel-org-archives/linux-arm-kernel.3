Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D31D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXs8kYOZriK1GsWYowwWBlQ8tNmmdH5RpvvE2Nxubxw=; b=KUk3UZS+IZ/gMBVJoLqDt7yTDz
	1BoGhRV/M1TI0+9lDWgl4uCobgiA8v0eu0lQyPK4dg2arW6fClbnejJmtmvbM+3nlk9LaAi6D9doG
	whjYQDUPFUoIgqzVyZHuQ5RdxXQfJlSLrnlXhB1lsY3E9LmX3x4gusNx2B7dDwVcvvcLR6OuDRiUt
	4uVoC8JYKs+2XiH/laPF+Z43eoykJtolevfcMRpdNYptFHb29/YYhCeSZHX6jzW+PCwd6oTWFe+r5
	9WkPMxOwJ2E+fGw9stRr99+QAjKQ/7NJvTVkUSNIqfkuqbiB7MoTyR2GIoBKbVBjFRw2GjIVxGt5p
	XKejaZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeJt-0000000EViO-290K;
	Wed, 20 Nov 2024 06:36:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeHJ-0000000EVCl-0dgM;
	Wed, 20 Nov 2024 06:33:30 +0000
X-UUID: 5818af16a70911ef82ff63e91e7eb18c-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qXs8kYOZriK1GsWYowwWBlQ8tNmmdH5RpvvE2Nxubxw=;
	b=dkuMiVFy4SWRHKJUiOPvJ5GPIetAhbCeGjvO2MWQyb2P8fkKSR3tg0P2sHDSdMN1WJwcZhlL1fWYW9WbXFvr4FvOf5oKDkQ7jRV/N5WAISEbcS46MPtssAwNHo/4QVRlvx/aFrWw82i1hH3azqDWFXv6+5Uuy2Jritum52/vM5A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:7479fd2d-fc49-4744-9693-3c7c160a6603,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:464815b,CLOUDID:dce580a0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:1,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5818af16a70911ef82ff63e91e7eb18c-20241119
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 999039225; Tue, 19 Nov 2024 23:33:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:33:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:33:21 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Friday Yang
	<friday.yang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 2/2] reset: mediatek: Add reset controller driver for SMI
Date: Wed, 20 Nov 2024 14:32:56 +0800
Message-ID: <20241120063305.8135-3-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241120063305.8135-1-friday.yang@mediatek.com>
References: <20241120063305.8135-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_223329_195879_689F7CC3 
X-CRM114-Status: GOOD (  22.69  )
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

From: "Friday Yang" <friday.yang@mediatek.com>

In order to avoid the bus glitch issue, add a reset-controller
driver for performing reset management of SMI LARBs on MediaTek
platform.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/reset/Kconfig              |   9 ++
 drivers/reset/Makefile             |   1 +
 drivers/reset/reset-mediatek-smi.c | 156 +++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/reset/reset-mediatek-smi.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db248..07e606e530fc 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -153,6 +153,15 @@ config RESET_MCHP_SPARX5
 	help
 	  This driver supports switch core reset for the Microchip Sparx5 SoC.

+config RESET_MTK_SMI
+	bool "MediaTek SMI Reset Driver"
+	depends on MTK_SMI || COMPILE_TEST
+	help
+	  This option enables the reset controller driver for MediaTek SMI.
+	  This reset driver is responsible for managing the reset signals
+	  for SMI larbs. Say Y if you want to control reset signals for
+	  MediaTek SMI larbs. Otherwise, say N.
+
 config RESET_NPCM
 	bool "NPCM BMC Reset Driver" if COMPILE_TEST
 	default ARCH_NPCM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e2632..1f5ba5696872 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
+obj-$(CONFIG_RESET_MTK_SMI) += reset-mediatek-smi.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
 obj-$(CONFIG_RESET_NUVOTON_MA35D1) += reset-ma35d1.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
diff --git a/drivers/reset/reset-mediatek-smi.c b/drivers/reset/reset-mediatek-smi.c
new file mode 100644
index 000000000000..0a2ffd9db670
--- /dev/null
+++ b/drivers/reset/reset-mediatek-smi.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Reset driver for MediaTek SMI module
+ *
+ * Copyright (C) 2024 MediaTek Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/mt8188-resets.h>
+
+#define to_mtk_smi_reset_data(_rcdev)	\
+	container_of(_rcdev, struct mtk_smi_reset_data, rcdev)
+
+struct mtk_smi_larb_reset {
+	unsigned int	offset;
+	unsigned int	value;
+};
+
+static const struct mtk_smi_larb_reset rst_signal_mt8188[] = {
+	[MT8188_SMI_RST_LARB10]		= { 0xC, BIT(0) },
+	[MT8188_SMI_RST_LARB11A]	= { 0xC, BIT(0) },
+	[MT8188_SMI_RST_LARB11C]	= { 0xC, BIT(0) },
+	[MT8188_SMI_RST_LARB12]		= { 0xC, BIT(8) },
+	[MT8188_SMI_RST_LARB11B]	= { 0xC, BIT(0) },
+	[MT8188_SMI_RST_LARB15]		= { 0xC, BIT(0) },
+	[MT8188_SMI_RST_LARB16B]	= { 0xA0, BIT(4) },
+	[MT8188_SMI_RST_LARB17B]	= { 0xA0, BIT(4) },
+	[MT8188_SMI_RST_LARB16A]	= { 0xA0, BIT(4) },
+	[MT8188_SMI_RST_LARB17A]	= { 0xA0, BIT(4) },
+};
+
+struct mtk_smi_larb_plat {
+	const struct mtk_smi_larb_reset	*reset_signal;
+	const unsigned int		larb_reset_nr;
+};
+
+struct mtk_smi_reset_data {
+	const struct mtk_smi_larb_plat	*larb_plat;
+	struct reset_controller_dev	rcdev;
+	void __iomem			*base;
+};
+
+static const struct mtk_smi_larb_plat mtk_smi_larb_mt8188 = {
+	.reset_signal = rst_signal_mt8188,
+	.larb_reset_nr = ARRAY_SIZE(rst_signal_mt8188),
+};
+
+static int mtk_smi_larb_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct mtk_smi_reset_data *data = to_mtk_smi_reset_data(rcdev);
+	const struct mtk_smi_larb_plat *larb_plat = data->larb_plat;
+	const struct mtk_smi_larb_reset *larb_rst = larb_plat->reset_signal + id;
+	unsigned int val, offset = larb_rst->offset;
+	void __iomem *base = data->base;
+
+	val = readl(base + offset);
+	val |= larb_rst->value;
+	writel(val, base + offset);
+
+	return 0;
+}
+
+static int mtk_smi_larb_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct mtk_smi_reset_data *data = to_mtk_smi_reset_data(rcdev);
+	const struct mtk_smi_larb_plat *larb_plat = data->larb_plat;
+	const struct mtk_smi_larb_reset *larb_rst = larb_plat->reset_signal + id;
+	unsigned int val, offset = larb_rst->offset;
+	void __iomem *base = data->base;
+
+	val = readl(base + offset);
+	val &= ~larb_rst->value;
+	writel(val, base + offset);
+
+	return 0;
+}
+
+static int mtk_smi_larb_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	mtk_smi_larb_reset_assert(rcdev, id);
+
+	return mtk_smi_larb_reset_deassert(rcdev, id);
+}
+
+static const struct reset_control_ops mtk_smi_reset_ops = {
+	.reset		= mtk_smi_larb_reset,
+	.assert		= mtk_smi_larb_reset_assert,
+	.deassert	= mtk_smi_larb_reset_deassert,
+};
+
+static int mtk_smi_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mtk_smi_larb_plat *larb_plat = of_device_get_match_data(dev);
+	struct device_node *np = dev->of_node, *reset_node;
+	struct mtk_smi_reset_data *data;
+	struct resource res;
+	void __iomem *base;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	reset_node = of_parse_phandle(np, "mediatek,larb-rst", 0);
+	if (!reset_node)
+		return -EINVAL;
+
+	if (of_address_to_resource(reset_node, 0, &res)) {
+		of_node_put(reset_node);
+		return -EINVAL;
+	}
+
+	base = devm_ioremap_resource(dev, &res);
+	if (IS_ERR(base)) {
+		of_node_put(reset_node);
+		return PTR_ERR(base);
+	}
+
+	of_node_put(reset_node);
+	data->larb_plat = larb_plat;
+	data->base = base;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &mtk_smi_reset_ops;
+	data->rcdev.of_node = np;
+	data->rcdev.nr_resets = larb_plat->larb_reset_nr;
+	data->rcdev.dev = dev;
+	platform_set_drvdata(pdev, data);
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static const struct of_device_id mtk_smi_larb_reset_of_match[] = {
+	{ .compatible = "mediatek,mt8188-smi-reset", .data = &mtk_smi_larb_mt8188 },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mtk_smi_larb_reset_of_match);
+
+static struct platform_driver mtk_smi_reset_driver = {
+	.probe = mtk_smi_reset_probe,
+	.driver = {
+		.name = "mediatek-smi-reset",
+		.of_match_table = mtk_smi_larb_reset_of_match,
+	},
+};
+module_platform_driver(mtk_smi_reset_driver);
+
+MODULE_AUTHOR("Friday.Yang@mediatek.com");
+MODULE_DESCRIPTION("MediaTek SMI Reset Driver");
+MODULE_LICENSE("GPL");
--
2.46.0


