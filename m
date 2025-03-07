Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC37C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4ULipxHDgIPRGdtGZE9B3RPzZ94o3QDt6j7De7+KtY=; b=GOIkJlPesPXX3O5xenxOtz6iQT
	zjwcxZFdn8sXk7MQpKOmKu4SnD39rNKCzOFh+jvqMkmYA0qNHK6YYc0bbjfBGj3lXfKyjk6qjNc9+
	WO+Xy85HdhHM1/tf8kuDjEyrhNYeBdjVYO/NXtxX33iLcihbTP5UbZE82Ucd1dxK4OnGXFooygMzg
	blr7+ZJTPVfhnVT5rbK+BW4ed61tDkh1FDyZSSA8qDoWnIkbmA7USyYRVcondH/FeJ9EQ2Mi4MOJL
	gpDkRkGdej2c9lehSLpXIGIv4982WV5auNdvgiUnexHmTYSobDwbmh7diN8Nw45nUb1Ce1FsXQAUm
	7gwIHd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqP2l-0000000D5SV-0kKP;
	Fri, 07 Mar 2025 04:10:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOSN-0000000CzYm-07KV;
	Fri, 07 Mar 2025 03:33:04 +0000
X-UUID: dd5f6a94fb0411efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T4ULipxHDgIPRGdtGZE9B3RPzZ94o3QDt6j7De7+KtY=;
	b=oG3zpd0MTY13ryFF+FaDInf5CPoL9XSRT1yLcmKdcTtRkEwZR3Alq+x1GqQXlGOTUL85wZAFNKcV41AJAhDBvIiHqZ8HcOiSRUEAtZB4lKtbk0WK7j68jg7Lr8ppxtA3LyU9jRQpYVa3xMQOUHVu3v7+mFxgs1OpxPfc3QJNR9Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f0863b85-f88d-4edd-88c5-ecffaa1f3a08,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:eae307c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dd5f6a94fb0411efa1e849db4cc18d44-20250306
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2047869628; Thu, 06 Mar 2025 20:32:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:54 +0800
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
Subject: [PATCH 23/26] clk: mediatek: Add MT8196 pextpsys clock support
Date: Fri, 7 Mar 2025 11:27:19 +0800
Message-ID: <20250307032942.10447-24-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307032942.10447-1-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193303_075913_5B348337 
X-CRM114-Status: GOOD (  16.10  )
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

Add MT8196 pextpsys clock controller which provides clock gate control
for pcie.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/clk/mediatek/Kconfig            |   7 +
 drivers/clk/mediatek/Makefile           |   1 +
 drivers/clk/mediatek/clk-mt8196-pextp.c | 162 ++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-pextp.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index dcb660d45bcf..2aafba083835 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1052,6 +1052,13 @@ config COMMON_CLK_MT8196_MMSYS
 	help
 	  This driver supports MediaTek MT8196 mmsys clocks.
 
+config COMMON_CLK_MT8196_PEXTPSYS
+	tristate "Clock driver for MediaTek MT8196 pextpsys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 pextpsys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 472462cd8711..3058e7855ff3 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -160,6 +160,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o clk-mt8196-vdisp_ao.o \
 					 clk-mt8196-ovl0.o clk-mt8196-ovl1.o
+obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-pextp.c b/drivers/clk/mediatek/clk-mt8196-pextp.c
new file mode 100644
index 000000000000..8b394e18d0eb
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-pextp.c
@@ -0,0 +1,162 @@
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
+static const struct mtk_gate_regs pext_cg_regs = {
+	.set_ofs = 0x18,
+	.clr_ofs = 0x1c,
+	.sta_ofs = 0x14,
+};
+
+#define GATE_PEXT(_id, _name, _parent, _shift) {\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &pext_cg_regs,		\
+		.shift = _shift,		\
+		.flags = CLK_OPS_PARENT_ENABLE,	\
+		.ops = &mtk_clk_gate_ops_setclr,\
+	}
+
+#define GATE_PEXT_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+static const struct mtk_gate pext_clks[] = {
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_TL, "pext_pm0_tl", "ck_tl_ck", 0),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_MAC_P0_TL_PCIE, "pext_pm0_tl_pcie", "pext_pm0_tl"),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_REF, "pext_pm0_ref", "ck_f26m_ck", 1),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_MAC_P0_REF_PCIE, "pext_pm0_ref_pcie", "pext_pm0_ref"),
+	GATE_PEXT(CLK_PEXT_PEXTP_PHY_P0_MCU_BUS, "pext_pp0_mcu_bus", "ck_f26m_ck", 6),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE, "pext_pp0_mcu_bus_pcie",
+		    "pext_pp0_mcu_bus"),
+	GATE_PEXT(CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF, "pext_pp0_pextp_ref", "ck_f26m_ck", 7),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE, "pext_pp0_pextp_ref_pcie",
+		    "pext_pp0_pextp_ref"),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_AXI_250, "pext_pm0_axi_250", "ck_pexpt0_mem_sub_ck", 12),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE, "pext_pm0_axi_250_pcie",
+		    "pext_pm0_axi_250"),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_AHB_APB, "pext_pm0_ahb_apb", "ck_pextp0_axi_ck", 13),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE, "pext_pm0_ahb_apb_pcie",
+		    "pext_pm0_ahb_apb"),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_PL_P, "pext_pm0_pl_p", "ck_f26m_ck", 14),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE, "pext_pm0_pl_p_pcie", "pext_pm0_pl_p"),
+	GATE_PEXT(CLK_PEXT_PEXTP_VLP_AO_P0_LP, "pext_pextp_vlp_ao_p0_lp", "ck_f26m_ck", 19),
+	GATE_PEXT_V(CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE, "pext_pextp_vlp_ao_p0_lp_pcie",
+		    "pext_pextp_vlp_ao_p0_lp"),
+};
+
+static const struct mtk_clk_desc pext_mcd = {
+	.clks = pext_clks,
+	.num_clks = ARRAY_SIZE(pext_clks),
+};
+
+static const struct mtk_gate_regs pext1_cg_regs = {
+	.set_ofs = 0x18,
+	.clr_ofs = 0x1c,
+	.sta_ofs = 0x14,
+};
+
+#define GATE_PEXT1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &pext1_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_PEXT1_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+static const struct mtk_gate pext1_clks[] = {
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P1_TL, "pext1_pm1_tl", "ck_tl_p1_ck", 0),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE, "pext1_pm1_tl_pcie", "pext1_pm1_tl"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P1_REF, "pext1_pm1_ref", "ck_f26m_ck", 1),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE, "pext1_pm1_ref_pcie", "pext1_pm1_ref"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P2_TL, "pext1_pm2_tl", "ck_tl_p2_ck", 2),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE, "pext1_pm2_tl_pcie", "pext1_pm2_tl"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P2_REF, "pext1_pm2_ref", "ck_f26m_ck", 3),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE, "pext1_pm2_ref_pcie", "pext1_pm2_ref"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS, "pext1_pp1_mcu_bus", "ck_f26m_ck", 8),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE, "pext1_pp1_mcu_bus_pcie",
+		     "pext1_pp1_mcu_bus"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF, "pext1_pp1_pextp_ref", "ck_f26m_ck", 9),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE, "pext1_pp1_pextp_ref_pcie",
+		     "pext1_pp1_pextp_ref"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS, "pext1_pp2_mcu_bus", "ck_f26m_ck", 10),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE, "pext1_pp2_mcu_bus_pcie",
+		     "pext1_pp2_mcu_bus"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF, "pext1_pp2_pextp_ref", "ck_f26m_ck", 11),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE, "pext1_pp2_pextp_ref_pcie",
+		     "pext1_pp2_pextp_ref"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P1_AXI_250, "pext1_pm1_axi_250",
+		   "ck_pextp1_usb_axi_ck", 16),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE, "pext1_pm1_axi_250_pcie",
+		     "pext1_pm1_axi_250"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P1_AHB_APB, "pext1_pm1_ahb_apb",
+		   "ck_pextp1_usb_mem_sub_ck", 17),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE, "pext1_pm1_ahb_apb_pcie",
+		     "pext1_pm1_ahb_apb"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P1_PL_P, "pext1_pm1_pl_p", "ck_f26m_ck", 18),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE, "pext1_pm1_pl_p_pcie", "pext1_pm1_pl_p"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P2_AXI_250, "pext1_pm2_axi_250",
+		   "ck_pextp1_usb_axi_ck", 19),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE, "pext1_pm2_axi_250_pcie",
+		     "pext1_pm2_axi_250"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P2_AHB_APB, "pext1_pm2_ahb_apb",
+		   "ck_pextp1_usb_mem_sub_ck", 20),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE, "pext1_pm2_ahb_apb_pcie",
+		     "pext1_pm2_ahb_apb"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_MAC_P2_PL_P, "pext1_pm2_pl_p", "ck_f26m_ck", 21),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE, "pext1_pm2_pl_p_pcie", "pext1_pm2_pl_p"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_VLP_AO_P1_LP, "pext1_pextp_vlp_ao_p1_lp", "ck_f26m_ck", 26),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE, "pext1_pextp_vlp_ao_p1_lp_pcie",
+		     "pext1_pextp_vlp_ao_p1_lp"),
+	GATE_PEXT1(CLK_PEXT1_PEXTP_VLP_AO_P2_LP, "pext1_pextp_vlp_ao_p2_lp", "ck_f26m_ck", 27),
+	GATE_PEXT1_V(CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE, "pext1_pextp_vlp_ao_p2_lp_pcie",
+		     "pext1_pextp_vlp_ao_p2_lp"),
+};
+
+static const struct mtk_clk_desc pext1_mcd = {
+	.clks = pext1_clks,
+	.num_clks = ARRAY_SIZE(pext1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8196_pextp[] = {
+	{ .compatible = "mediatek,mt8196-pextp0cfg_ao", .data = &pext_mcd, },
+	{ .compatible = "mediatek,mt8196-pextp1cfg_ao", .data = &pext1_mcd, },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8196_pextp_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8196-pextp",
+		.of_match_table = of_match_clk_mt8196_pextp,
+	},
+};
+
+module_platform_driver(clk_mt8196_pextp_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


