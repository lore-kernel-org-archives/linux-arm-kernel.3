Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB59C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuUn5KCVPHpY2jgYe4qMjqkUhJOOyhDWSnHDJCQQD0I=; b=1twi8Ip8EFsQuz/NcOFtSOMYQ2
	XnDlAbTK3n8NnbkJDxq29/dfAtytU3Wl1XDq2n6Eh4oZaaWvoYn1Af2g56VrBy/FxUbZSrV/fA7UH
	lPrF8a8Y2oCA+a6TumANJdtZ5f/nivybFD2ermf9jJwCjv2msyryLZlTIFNHLKCzfLZ6w7XYabcCV
	pLqy2mPUPVmEpmnOp2jyymrx8GOKOyPKu7bv49IfBOrLWBVNSICG1SF7Hx9zXOgm9ixGfrUzj/rsA
	oE/25jc2Yj3OQcFUvAGqXkGlvi4RIxyQQ+8tc5FOVpLq4A2/YIrRm5LV4xLO0v2u9FujUs5Z7RphA
	2hZyW9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqP5v-0000000D5oh-2Q1n;
	Fri, 07 Mar 2025 04:13:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOSP-0000000Cza3-48NY;
	Fri, 07 Mar 2025 03:33:07 +0000
X-UUID: df0e54eafb0411efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nuUn5KCVPHpY2jgYe4qMjqkUhJOOyhDWSnHDJCQQD0I=;
	b=FAV6QtIAhnhrb8LOVj+XIpAWeLxrQAUe+Wgj+8c4yk9yPgsm8ethdHMNWidmDEpU+miFk+s3zU4GlXp+Zf6DCYNKPJy533Yoe1Bu3JJCXbGHNAyz8VrWfxoFun8X0vQb0EDOIA0umB6UYqQf8PfXblfjBpg1Km5cqtdYdokZFqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:81f45f25-efe8-49f7-9501-6d7808289c71,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:496f108c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: df0e54eafb0411efa1e849db4cc18d44-20250306
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 221399356; Thu, 06 Mar 2025 20:33:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:57 +0800
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
Subject: [PATCH 26/26] clk: mediatek: Add MT8196 vencsys clock support
Date: Fri, 7 Mar 2025 11:27:22 +0800
Message-ID: <20250307032942.10447-27-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307032942.10447-1-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193306_031206_4413005D 
X-CRM114-Status: GOOD (  14.88  )
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

Add MT8196 vencsys clock controller which provides clock gate control
for video encoder.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |   7 +
 drivers/clk/mediatek/Makefile          |   1 +
 drivers/clk/mediatek/clk-mt8196-venc.c | 413 +++++++++++++++++++++++++
 3 files changed, 421 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-venc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0c508a8a9959..3184b2186561 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1073,6 +1073,13 @@ config COMMON_CLK_MT8196_VDECSYS
 	help
 	  This driver supports MediaTek MT8196 vdecsys clocks.
 
+config COMMON_CLK_MT8196_VENCSYS
+	tristate "Clock driver for MediaTek MT8196 vencsys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 vencsys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index b8bf3f5f8530..7bded296d0ca 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -163,6 +163,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o c
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8196_VDECSYS) += clk-mt8196-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8196_VENCSYS) += clk-mt8196-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-venc.c b/drivers/clk/mediatek/clk-mt8196-venc.c
new file mode 100644
index 000000000000..f8fcdf7b47df
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-venc.c
@@ -0,0 +1,413 @@
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
+static const struct mtk_gate_regs ven10_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs ven10_vote_regs = {
+	.set_ofs = 0x00b8,
+	.clr_ofs = 0x00bc,
+	.sta_ofs = 0x2c5c,
+};
+
+static const struct mtk_gate_regs ven11_cg_regs = {
+	.set_ofs = 0x10,
+	.clr_ofs = 0x14,
+	.sta_ofs = 0x10,
+};
+
+static const struct mtk_gate_regs ven11_vote_regs = {
+	.set_ofs = 0x00c0,
+	.clr_ofs = 0x00c4,
+	.sta_ofs = 0x2c60,
+};
+
+#define GATE_VEN10(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ven10_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr_inv,	\
+	}
+
+#define GATE_VEN10_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_VEN10_FLAGS(_id, _name, _parent, _shift, _flags) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ven10_cg_regs,			\
+		.vote_regs = &ven10_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote_inv,	\
+		.dma_ops = &mtk_clk_gate_ops_setclr_inv,\
+		.flags = (_flags) |			\
+			 CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_VOTE_VEN10(_id, _name, _parent, _shift)	\
+	GATE_VOTE_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_VEN11(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ven11_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_VEN11_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_VEN11(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ven11_cg_regs,			\
+		.vote_regs = &ven11_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote,		\
+		.dma_ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE		\
+	}
+
+static const struct mtk_gate ven1_clks[] = {
+	/* VEN10 */
+	GATE_VOTE_VEN10(CLK_VEN1_CKE0_LARB, "ven1_larb", "ck2_venc_ck", 0),
+	GATE_VEN10_V(CLK_VEN1_CKE0_LARB_VENC, "ven1_larb_venc", "ven1_larb"),
+	GATE_VEN10_V(CLK_VEN1_CKE0_LARB_JPGENC, "ven1_larb_jpgenc", "ven1_larb"),
+	GATE_VEN10_V(CLK_VEN1_CKE0_LARB_JPGDEC, "ven1_larb_jpgdec", "ven1_larb"),
+	GATE_VEN10_V(CLK_VEN1_CKE0_LARB_SMI, "ven1_larb_smi", "ven1_larb"),
+	GATE_VOTE_VEN10(CLK_VEN1_CKE1_VENC, "ven1_venc", "ck2_venc_ck", 4),
+	GATE_VEN10_V(CLK_VEN1_CKE1_VENC_VENC, "ven1_venc_venc", "ven1_venc"),
+	GATE_VEN10_V(CLK_VEN1_CKE1_VENC_SMI, "ven1_venc_smi", "ven1_venc"),
+	GATE_VEN10(CLK_VEN1_CKE2_JPGENC, "ven1_jpgenc", "ck2_venc_ck", 8),
+	GATE_VEN10_V(CLK_VEN1_CKE2_JPGENC_JPGENC, "ven1_jpgenc_jpgenc", "ven1_jpgenc"),
+	GATE_VEN10(CLK_VEN1_CKE3_JPGDEC, "ven1_jpgdec", "ck2_venc_ck", 12),
+	GATE_VEN10_V(CLK_VEN1_CKE3_JPGDEC_JPGDEC, "ven1_jpgdec_jpgdec", "ven1_jpgdec"),
+	GATE_VEN10(CLK_VEN1_CKE4_JPGDEC_C1, "ven1_jpgdec_c1", "ck2_venc_ck", 16),
+	GATE_VEN10_V(CLK_VEN1_CKE4_JPGDEC_C1_JPGDEC, "ven1_jpgdec_c1_jpgdec", "ven1_jpgdec_c1"),
+	GATE_VOTE_VEN10(CLK_VEN1_CKE5_GALS, "ven1_gals", "ck2_venc_ck", 28),
+	GATE_VEN10_V(CLK_VEN1_CKE5_GALS_VENC, "ven1_gals_venc", "ven1_gals"),
+	GATE_VEN10_V(CLK_VEN1_CKE5_GALS_JPGENC, "ven1_gals_jpgenc", "ven1_gals"),
+	GATE_VEN10_V(CLK_VEN1_CKE5_GALS_JPGDEC, "ven1_gals_jpgdec", "ven1_gals"),
+	GATE_VOTE_VEN10(CLK_VEN1_CKE29_VENC_ADAB_CTRL, "ven1_venc_adab_ctrl", "ck2_venc_ck", 29),
+	GATE_VEN10_V(CLK_VEN1_CKE29_VENC_ADAB_CTRL_VENC, "ven1_venc_adab_ctrl_venc",
+		     "ven1_venc_adab_ctrl"),
+	GATE_VOTE_VEN10_FLAGS(CLK_VEN1_CKE29_VENC_XPC_CTRL, "ven1_venc_xpc_ctrl",
+			      "ck2_venc_ck", 30, CLK_IGNORE_UNUSED),
+	GATE_VEN10_V(CLK_VEN1_CKE29_VENC_XPC_CTRL_VENC, "ven1_venc_xpc_ctrl_venc",
+		     "ven1_venc_xpc_ctrl"),
+	GATE_VEN10_V(CLK_VEN1_CKE29_VENC_XPC_CTRL_JPGENC, "ven1_venc_xpc_ctrl_jpgenc",
+		     "ven1_venc_xpc_ctrl"),
+	GATE_VEN10_V(CLK_VEN1_CKE29_VENC_XPC_CTRL_JPGDEC, "ven1_venc_xpc_ctrl_jpgdec",
+		     "ven1_venc_xpc_ctrl"),
+	GATE_VOTE_VEN10(CLK_VEN1_CKE6_GALS_SRAM, "ven1_gals_sram", "ck2_venc_ck", 31),
+	GATE_VEN10_V(CLK_VEN1_CKE6_GALS_SRAM_VENC, "ven1_gals_sram_venc", "ven1_gals_sram"),
+	/* VEN11 */
+	GATE_VOTE_VEN11(CLK_VEN1_RES_FLAT, "ven1_res_flat", "ck2_venc_ck", 0),
+	GATE_VEN11_V(CLK_VEN1_RES_FLAT_VENC, "ven1_res_flat_venc", "ven1_res_flat"),
+	GATE_VEN11_V(CLK_VEN1_RES_FLAT_JPGENC, "ven1_res_flat_jpgenc", "ven1_res_flat"),
+	GATE_VEN11_V(CLK_VEN1_RES_FLAT_JPGDEC, "ven1_res_flat_jpgdec", "ven1_res_flat"),
+};
+
+static const struct mtk_clk_desc ven1_mcd = {
+	.clks = ven1_clks,
+	.num_clks = ARRAY_SIZE(ven1_clks),
+	.need_runtime_pm = true,
+};
+
+static const struct mtk_gate_regs ven20_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs ven20_vote_regs = {
+	.set_ofs = 0x00c8,
+	.clr_ofs = 0x00cc,
+	.sta_ofs = 0x2c64,
+};
+
+static const struct mtk_gate_regs ven21_cg_regs = {
+	.set_ofs = 0x10,
+	.clr_ofs = 0x14,
+	.sta_ofs = 0x10,
+};
+
+static const struct mtk_gate_regs ven21_vote_regs = {
+	.set_ofs = 0x00d0,
+	.clr_ofs = 0x00d4,
+	.sta_ofs = 0x2c68,
+};
+
+#define GATE_VEN20(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ven20_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr_inv,	\
+	}
+
+#define GATE_VEN20_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_VEN20(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ven20_cg_regs,			\
+		.vote_regs = &ven20_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote_inv,	\
+		.dma_ops = &mtk_clk_gate_ops_setclr_inv,\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_VEN21(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ven21_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_VEN21_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_VEN21(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ven21_cg_regs,			\
+		.vote_regs = &ven21_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote,		\
+		.dma_ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE		\
+	}
+
+static const struct mtk_gate ven2_clks[] = {
+	/* VEN20 */
+	GATE_VOTE_VEN20(CLK_VEN2_CKE0_LARB, "ven2_larb", "ck2_venc_ck", 0),
+	GATE_VEN20_V(CLK_VEN2_CKE0_LARB_VENC, "ven2_larb_venc", "ven2_larb"),
+	GATE_VEN20_V(CLK_VEN2_CKE0_LARB_JPGENC, "ven2_larb_jpgenc", "ven2_larb"),
+	GATE_VEN20_V(CLK_VEN2_CKE0_LARB_JPGDEC, "ven2_larb_jpgdec", "ven2_larb"),
+	GATE_VEN20_V(CLK_VEN2_CKE0_LARB_SMI, "ven2_larb_smi", "ven2_larb"),
+	GATE_VOTE_VEN20(CLK_VEN2_CKE1_VENC, "ven2_venc", "ck2_venc_ck", 4),
+	GATE_VEN20_V(CLK_VEN2_CKE1_VENC_VENC, "ven2_venc_venc", "ven2_venc"),
+	GATE_VEN20_V(CLK_VEN2_CKE1_VENC_SMI, "ven2_venc_smi", "ven2_venc"),
+	GATE_VEN20(CLK_VEN2_CKE2_JPGENC, "ven2_jpgenc", "ck2_venc_ck", 8),
+	GATE_VEN20_V(CLK_VEN2_CKE2_JPGENC_JPGENC, "ven2_jpgenc_jpgenc", "ven2_jpgenc"),
+	GATE_VEN20(CLK_VEN2_CKE3_JPGDEC, "ven2_jpgdec", "ck2_venc_ck", 12),
+	GATE_VEN20_V(CLK_VEN2_CKE3_JPGDEC_JPGDEC, "ven2_jpgdec_jpgdec", "ven2_jpgdec"),
+	GATE_VOTE_VEN20(CLK_VEN2_CKE5_GALS, "ven2_gals", "ck2_venc_ck", 28),
+	GATE_VEN20_V(CLK_VEN2_CKE5_GALS_VENC, "ven2_gals_venc", "ven2_gals"),
+	GATE_VEN20_V(CLK_VEN2_CKE5_GALS_JPGENC, "ven2_gals_jpgenc", "ven2_gals"),
+	GATE_VEN20_V(CLK_VEN2_CKE5_GALS_JPGDEC, "ven2_gals_jpgdec", "ven2_gals"),
+	GATE_VOTE_VEN20(CLK_VEN2_CKE29_VENC_XPC_CTRL, "ven2_venc_xpc_ctrl", "ck2_venc_ck", 30),
+	GATE_VEN20_V(CLK_VEN2_CKE29_VENC_XPC_CTRL_VENC, "ven2_venc_xpc_ctrl_venc",
+		     "ven2_venc_xpc_ctrl"),
+	GATE_VEN20_V(CLK_VEN2_CKE29_VENC_XPC_CTRL_JPGENC, "ven2_venc_xpc_ctrl_jpgenc",
+		     "ven2_venc_xpc_ctrl"),
+	GATE_VEN20_V(CLK_VEN2_CKE29_VENC_XPC_CTRL_JPGDEC, "ven2_venc_xpc_ctrl_jpgdec",
+		     "ven2_venc_xpc_ctrl"),
+	GATE_VOTE_VEN20(CLK_VEN2_CKE6_GALS_SRAM, "ven2_gals_sram", "ck2_venc_ck", 31),
+	GATE_VEN20_V(CLK_VEN2_CKE6_GALS_SRAM_VENC, "ven2_gals_sram_venc", "ven2_gals_sram"),
+	/* VEN21 */
+	GATE_VOTE_VEN21(CLK_VEN2_RES_FLAT, "ven2_res_flat", "ck2_venc_ck", 0),
+	GATE_VEN21_V(CLK_VEN2_RES_FLAT_VENC, "ven2_res_flat_venc", "ven2_res_flat"),
+	GATE_VEN21_V(CLK_VEN2_RES_FLAT_JPGENC, "ven2_res_flat_jpgenc", "ven2_res_flat"),
+	GATE_VEN21_V(CLK_VEN2_RES_FLAT_JPGDEC, "ven2_res_flat_jpgdec", "ven2_res_flat"),
+};
+
+static const struct mtk_clk_desc ven2_mcd = {
+	.clks = ven2_clks,
+	.num_clks = ARRAY_SIZE(ven2_clks),
+	.need_runtime_pm = true,
+};
+
+static const struct mtk_gate_regs ven_c20_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs ven_c20_vote_regs = {
+	.set_ofs = 0x00d8,
+	.clr_ofs = 0x00dc,
+	.sta_ofs = 0x2c6c,
+};
+
+static const struct mtk_gate_regs ven_c21_cg_regs = {
+	.set_ofs = 0x10,
+	.clr_ofs = 0x14,
+	.sta_ofs = 0x10,
+};
+
+static const struct mtk_gate_regs ven_c21_vote_regs = {
+	.set_ofs = 0x00e0,
+	.clr_ofs = 0x00e4,
+	.sta_ofs = 0x2c70,
+};
+
+#define GATE_VEN_C20(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ven_c20_cg_regs,		\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr_inv,	\
+	}
+
+#define GATE_VEN_C20_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_VEN_C20(_id, _name, _parent, _shift) {\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ven_c20_cg_regs,		\
+		.vote_regs = &ven_c20_vote_regs,	\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote_inv,	\
+		.dma_ops = &mtk_clk_gate_ops_setclr_inv,\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_VEN_C21(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ven_c21_cg_regs,		\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_VEN_C21_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_VEN_C21(_id, _name, _parent, _shift) {\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ven_c21_cg_regs,		\
+		.vote_regs = &ven_c21_vote_regs,	\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote,		\
+		.dma_ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate ven_c2_clks[] = {
+	/* VEN_C20 */
+	GATE_VOTE_VEN_C20(CLK_VEN_C2_CKE0_LARB, "ven_c2_larb", "ck2_venc_ck", 0),
+	GATE_VEN_C20_V(CLK_VEN_C2_CKE0_LARB_VENC, "ven_c2_larb_venc", "ven_c2_larb"),
+	GATE_VEN_C20_V(CLK_VEN_C2_CKE0_LARB_SMI, "ven_c2_larb_smi", "ven_c2_larb"),
+	GATE_VOTE_VEN_C20(CLK_VEN_C2_CKE1_VENC, "ven_c2_venc", "ck2_venc_ck", 4),
+	GATE_VEN_C20_V(CLK_VEN_C2_CKE1_VENC_VENC, "ven_c2_venc_venc", "ven_c2_venc"),
+	GATE_VEN_C20_V(CLK_VEN_C2_CKE1_VENC_SMI, "ven_c2_venc_smi", "ven_c2_venc"),
+	GATE_VOTE_VEN_C20(CLK_VEN_C2_CKE5_GALS, "ven_c2_gals", "ck2_venc_ck", 28),
+	GATE_VEN_C20_V(CLK_VEN_C2_CKE5_GALS_VENC, "ven_c2_gals_venc", "ven_c2_gals"),
+	GATE_VOTE_VEN_C20(CLK_VEN_C2_CKE29_VENC_XPC_CTRL, "ven_c2_venc_xpc_ctrl",
+			  "ck2_venc_ck", 30),
+	GATE_VEN_C20_V(CLK_VEN_C2_CKE29_VENC_XPC_CTRL_VENC, "ven_c2_venc_xpc_ctrl_venc",
+		       "ven_c2_venc_xpc_ctrl"),
+	GATE_VOTE_VEN_C20(CLK_VEN_C2_CKE6_GALS_SRAM, "ven_c2_gals_sram", "ck2_venc_ck", 31),
+	GATE_VEN_C20_V(CLK_VEN_C2_CKE6_GALS_SRAM_VENC, "ven_c2_gals_sram_venc", "ven_c2_gals_sram"),
+	/* VEN_C21 */
+	GATE_VOTE_VEN_C21(CLK_VEN_C2_RES_FLAT, "ven_c2_res_flat", "ck2_venc_ck", 0),
+	GATE_VEN_C21_V(CLK_VEN_C2_RES_FLAT_VENC, "ven_c2_res_flat_venc", "ven_c2_res_flat"),
+};
+
+static const struct mtk_clk_desc ven_c2_mcd = {
+	.clks = ven_c2_clks,
+	.num_clks = ARRAY_SIZE(ven_c2_clks),
+	.need_runtime_pm = true,
+};
+
+static const struct of_device_id of_match_clk_mt8196_venc[] = {
+	{ .compatible = "mediatek,mt8196-vencsys", .data = &ven1_mcd, },
+	{ .compatible = "mediatek,mt8196-vencsys_c1", .data = &ven2_mcd, },
+	{ .compatible = "mediatek,mt8196-vencsys_c2", .data = &ven_c2_mcd, },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8196_venc_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8196-venc",
+		.of_match_table = of_match_clk_mt8196_venc,
+	},
+};
+
+module_platform_driver(clk_mt8196_venc_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


