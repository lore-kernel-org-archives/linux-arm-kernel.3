Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01154C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys+Z3XZrVwmpLpc6Hy5rZdPiEPv1YQZi+/Nfmbq4RRA=; b=4xNrZ4DArLjw2yeopEjnIsfkNV
	lt9jpapeSKZTomuvKJLa6mMOuoMiMR8XkhUgO6yQfp/LagFvDx50IYprqnaTxvfG6Erd+6BsIgewD
	YPYbYO1SYJqSIFSYmD07aFVUt4kABSlM2bcWJcvR7iUt3fylzk+Tzddeh29sPARJkuAvpWO2HGlje
	KG5c7WyRSyezJl9wBI/9VJm6Q0qTrBaEfoZ36Z1EyzwhMtl5MY9BUKKF6Qfqbs1eW2M0IcUwT2SdU
	dmQrd93ZvBVta2wMe2RqhysWamkfLmmZQLsZi+tWs45sD0Yerb91YVMMUdUjIVk32tttyXhOOEOH/
	8n2B6R7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOwO-0000000D4VR-1zbv;
	Fri, 07 Mar 2025 04:04:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOSK-0000000CzX0-2E2W;
	Fri, 07 Mar 2025 03:33:01 +0000
X-UUID: ddec1412fb0411ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ys+Z3XZrVwmpLpc6Hy5rZdPiEPv1YQZi+/Nfmbq4RRA=;
	b=hZcS4kQhKQih5OtonnbKW5DN3itMJNcPb7E6Fu+i1JRjksqLpMCy4ozX+USnXgwHsJXhm+zlbl5E0UdMteXvyUttdzIL37y69evsQjEhjxQEa+7TuX95UL54abDENX4GY6Fr+4UwoSOTP/uKXHrPIJ/o20P2eBKDhwHra020S2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:11d8c5ef-13e8-454c-8838-e06a4bbf318f,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:cf28cc49-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ddec1412fb0411ef83f2a1c9db70dae0-20250306
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 487367685; Thu, 06 Mar 2025 20:32:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:55 +0800
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
Subject: [PATCH 24/26] clk: mediatek: Add MT8196 ufssys clock support
Date: Fri, 7 Mar 2025 11:27:20 +0800
Message-ID: <20250307032942.10447-25-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307032942.10447-1-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193300_570204_025EA636 
X-CRM114-Status: GOOD (  16.08  )
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

Add MT8196 ufssys clock controller which provides clock gate control
for ufs.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/clk/mediatek/Kconfig             |   7 ++
 drivers/clk/mediatek/Makefile            |   1 +
 drivers/clk/mediatek/clk-mt8196-ufs_ao.c | 107 +++++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ufs_ao.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2aafba083835..5fc24f52762a 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1059,6 +1059,13 @@ config COMMON_CLK_MT8196_PEXTPSYS
 	help
 	  This driver supports MediaTek MT8196 pextpsys clocks.
 
+config COMMON_CLK_MT8196_UFSSYS
+	tristate "Clock driver for MediaTek MT8196 ufssys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 ufssys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 3058e7855ff3..e5b4a3a61ef7 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o clk-mt8196-vdisp_ao.o \
 					 clk-mt8196-ovl0.o clk-mt8196-ovl1.o
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
+obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-ufs_ao.c b/drivers/clk/mediatek/clk-mt8196-ufs_ao.c
new file mode 100644
index 000000000000..107522759bd2
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-ufs_ao.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Guangjie Song <guangjie.song@mediatek.com>
+ */
+#include <dt-bindings/clock/mt8196-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs ufsao0_cg_regs = {
+	.set_ofs = 0x108,
+	.clr_ofs = 0x10c,
+	.sta_ofs = 0x104,
+};
+
+static const struct mtk_gate_regs ufsao1_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x4,
+};
+
+#define GATE_UFSAO0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ufsao0_cg_regs,		\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_UFSAO0_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_UFSAO1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ufsao1_cg_regs,		\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_UFSAO1_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+static const struct mtk_gate ufsao_clks[] = {
+	/* UFSAO0 */
+	GATE_UFSAO0(CLK_UFSAO_UFSHCI_UFS, "ufsao_ufshci_ufs", "ck_ck", 0),
+	GATE_UFSAO0_V(CLK_UFSAO_UFSHCI_UFS_UFS, "ufsao_ufshci_ufs_ufs", "ufsao_ufshci_ufs"),
+	GATE_UFSAO0(CLK_UFSAO_UFSHCI_AES, "ufsao_ufshci_aes", "ck_aes_ufsfde_ck", 1),
+	GATE_UFSAO0_V(CLK_UFSAO_UFSHCI_AES_UFS, "ufsao_ufshci_aes_ufs", "ufsao_ufshci_aes"),
+	/* UFSAO1 */
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_TX_SYM, "ufsao_unipro_tx_sym", "ck_f26m_ck", 0),
+	GATE_UFSAO1_V(CLK_UFSAO_UNIPRO_TX_SYM_UFS, "ufsao_unipro_tx_sym_ufs",
+		      "ufsao_unipro_tx_sym"),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_RX_SYM0, "ufsao_unipro_rx_sym0", "ck_f26m_ck", 1),
+	GATE_UFSAO1_V(CLK_UFSAO_UNIPRO_RX_SYM0_UFS, "ufsao_unipro_rx_sym0_ufs",
+		      "ufsao_unipro_rx_sym0"),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_RX_SYM1, "ufsao_unipro_rx_sym1", "ck_f26m_ck", 2),
+	GATE_UFSAO1_V(CLK_UFSAO_UNIPRO_RX_SYM1_UFS, "ufsao_unipro_rx_sym1_ufs",
+		      "ufsao_unipro_rx_sym1"),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_SYS, "ufsao_unipro_sys", "ck_ck", 3),
+	GATE_UFSAO1_V(CLK_UFSAO_UNIPRO_SYS_UFS, "ufsao_unipro_sys_ufs", "ufsao_unipro_sys"),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_SAP, "ufsao_unipro_sap", "ck_f26m_ck", 4),
+	GATE_UFSAO1_V(CLK_UFSAO_UNIPRO_SAP_UFS, "ufsao_unipro_sap_ufs", "ufsao_unipro_sap"),
+	GATE_UFSAO1(CLK_UFSAO_PHY_SAP, "ufsao_phy_sap", "ck_f26m_ck", 8),
+	GATE_UFSAO1_V(CLK_UFSAO_PHY_SAP_UFS, "ufsao_phy_sap_ufs", "ufsao_phy_sap"),
+};
+
+static const struct mtk_clk_desc ufsao_mcd = {
+	.clks = ufsao_clks,
+	.num_clks = ARRAY_SIZE(ufsao_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8196_ufs_ao[] = {
+	{ .compatible = "mediatek,mt8196-ufscfg_ao", .data = &ufsao_mcd, },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8196_ufs_ao_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8196-ufs_ao",
+		.of_match_table = of_match_clk_mt8196_ufs_ao,
+	},
+};
+
+module_platform_driver(clk_mt8196_ufs_ao_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


