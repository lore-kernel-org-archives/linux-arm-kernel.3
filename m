Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D914C28B26
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyc2rShdmFd9ENy33C+zR1/iT3QbwocJwE3td0aE9jo=; b=sAAVbpjFG4xZdu/RfCed+1CC44
	HwU6qTm6kcTpaNVnOBEpXxH9olprzRs3/po2Z6pjUmH0rNlSkTrR+r1IpPc+7twPFEZLqtDC+rZaF
	/FCn58crVqQ1WLt6H9pAaqHKSz6oUWjhVTp3Aw16x/MLkRgjEm/x+1NhDY8VDrkEkoXqmHDVJicUt
	I+IqYjP9LfmY8RCp2fGaMEol5wgGT/Zrvr5EgcSy9zQ7hhXVNoBd0wIRSxDOOLVPJHCR9LG9Mqdl2
	He8eaK+i8diCASEnCJFuZzann1Iavln0VIClC2iJGC7tyIAR/xAvbGKRrZQSMwPDpiSYgn4ifQNDi
	hjvgco8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOxz-0000000D4mO-3YMj;
	Fri, 07 Mar 2025 04:05:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOSK-0000000CzXF-44LB;
	Fri, 07 Mar 2025 03:33:02 +0000
X-UUID: dc328b1afb0411efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fyc2rShdmFd9ENy33C+zR1/iT3QbwocJwE3td0aE9jo=;
	b=JZPyZKEpQm/LbyQF7hm4T3tREq/2xSH28JOkES9t6MupqUFIdD3IRfjhfGmJYCRqrm+QtHHtaZ+783vvu9SJ/FIIAILscuPR6yx9BpSUSfqc/787y+hXB+TDMZ3/HdR/85/+0L2xW3wFO9rmvK1ltesObH6GfCJ1ro/tXRNFy04=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d814c099-e868-49ce-b870-ba51c0ac4a72,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:036521ce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dc328b1afb0411efa1e849db4cc18d44-20250306
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1624183924; Thu, 06 Mar 2025 20:32:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:52 +0800
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
Subject: [PATCH 21/26] clk: mediatek: Add MT8196 ovl0 clock support
Date: Fri, 7 Mar 2025 11:27:17 +0800
Message-ID: <20250307032942.10447-22-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307032942.10447-1-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193301_016700_55ED8598 
X-CRM114-Status: GOOD (  14.62  )
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

Add MT8196 ovl0 clock controller which provides clock gate control in
display system. This is integrated with mtk-mmsys driver which will
populate device by platform_device_register_data to start ovl0 clock
driver.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |   3 +-
 drivers/clk/mediatek/clk-mt8196-ovl0.c | 256 +++++++++++++++++++++++++
 2 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl0.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index fab6a0944501..6766811e67d9 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -158,7 +158,8 @@ obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
-obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o clk-mt8196-vdisp_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o clk-mt8196-vdisp_ao.o \
+					 clk-mt8196-ovl0.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-ovl0.c b/drivers/clk/mediatek/clk-mt8196-ovl0.c
new file mode 100644
index 000000000000..5a9ae157ec35
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-ovl0.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Guangjie Song <guangjie.song@mediatek.com>
+ */
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8196-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+static const struct mtk_gate_regs ovl0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs ovl0_vote_regs = {
+	.set_ofs = 0x0060,
+	.clr_ofs = 0x0064,
+	.sta_ofs = 0x2c30,
+};
+
+static const struct mtk_gate_regs ovl1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs ovl1_vote_regs = {
+	.set_ofs = 0x0068,
+	.clr_ofs = 0x006c,
+	.sta_ofs = 0x2c34,
+};
+
+#define GATE_OVL0(_id, _name, _parent, _shift) {\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &ovl0_cg_regs,		\
+		.shift = _shift,		\
+		.flags = CLK_OPS_PARENT_ENABLE,	\
+		.ops = &mtk_clk_gate_ops_setclr,\
+	}
+
+#define GATE_OVL0_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_OVL0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ovl0_cg_regs,			\
+		.vote_regs = &ovl0_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote,		\
+		.dma_ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_OVL1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ovl1_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_OVL1_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_OVL1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &ovl1_cg_regs,			\
+		.vote_regs = &ovl1_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote,		\
+		.dma_ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate ovl_clks[] = {
+	/* OVL0 */
+	GATE_VOTE_OVL0(CLK_OVLSYS_CONFIG, "ovlsys_config", "ck2_disp_ck", 0),
+	GATE_OVL0_V(CLK_OVLSYS_CONFIG_DISP, "ovlsys_config_disp", "ovlsys_config"),
+	GATE_VOTE_OVL0(CLK_OVL_FAKE_ENG0, "ovl_fake_eng0", "ck2_disp_ck", 1),
+	GATE_OVL0_V(CLK_OVL_FAKE_ENG0_DISP, "ovl_fake_eng0_disp", "ovl_fake_eng0"),
+	GATE_VOTE_OVL0(CLK_OVL_FAKE_ENG1, "ovl_fake_eng1", "ck2_disp_ck", 2),
+	GATE_OVL0_V(CLK_OVL_FAKE_ENG1_DISP, "ovl_fake_eng1_disp", "ovl_fake_eng1"),
+	GATE_VOTE_OVL0(CLK_OVL_MUTEX0, "ovl_mutex0", "ck2_disp_ck", 3),
+	GATE_OVL0_V(CLK_OVL_MUTEX0_DISP, "ovl_mutex0_disp", "ovl_mutex0"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA0, "ovl_exdma0", "ck2_disp_ck", 4),
+	GATE_OVL0_V(CLK_OVL_EXDMA0_DISP, "ovl_exdma0_disp", "ovl_exdma0"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA1, "ovl_exdma1", "ck2_disp_ck", 5),
+	GATE_OVL0_V(CLK_OVL_EXDMA1_DISP, "ovl_exdma1_disp", "ovl_exdma1"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA2, "ovl_exdma2", "ck2_disp_ck", 6),
+	GATE_OVL0_V(CLK_OVL_EXDMA2_DISP, "ovl_exdma2_disp", "ovl_exdma2"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA3, "ovl_exdma3", "ck2_disp_ck", 7),
+	GATE_OVL0_V(CLK_OVL_EXDMA3_DISP, "ovl_exdma3_disp", "ovl_exdma3"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA4, "ovl_exdma4", "ck2_disp_ck", 8),
+	GATE_OVL0_V(CLK_OVL_EXDMA4_DISP, "ovl_exdma4_disp", "ovl_exdma4"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA5, "ovl_exdma5", "ck2_disp_ck", 9),
+	GATE_OVL0_V(CLK_OVL_EXDMA5_DISP, "ovl_exdma5_disp", "ovl_exdma5"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA6, "ovl_exdma6", "ck2_disp_ck", 10),
+	GATE_OVL0_V(CLK_OVL_EXDMA6_DISP, "ovl_exdma6_disp", "ovl_exdma6"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA7, "ovl_exdma7", "ck2_disp_ck", 11),
+	GATE_OVL0_V(CLK_OVL_EXDMA7_DISP, "ovl_exdma7_disp", "ovl_exdma7"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA8, "ovl_exdma8", "ck2_disp_ck", 12),
+	GATE_OVL0_V(CLK_OVL_EXDMA8_DISP, "ovl_exdma8_disp", "ovl_exdma8"),
+	GATE_VOTE_OVL0(CLK_OVL_EXDMA9, "ovl_exdma9", "ck2_disp_ck", 13),
+	GATE_OVL0_V(CLK_OVL_EXDMA9_DISP, "ovl_exdma9_disp", "ovl_exdma9"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER0, "ovl_blender0", "ck2_disp_ck", 14),
+	GATE_OVL0_V(CLK_OVL_BLENDER0_DISP, "ovl_blender0_disp", "ovl_blender0"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER1, "ovl_blender1", "ck2_disp_ck", 15),
+	GATE_OVL0_V(CLK_OVL_BLENDER1_DISP, "ovl_blender1_disp", "ovl_blender1"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER2, "ovl_blender2", "ck2_disp_ck", 16),
+	GATE_OVL0_V(CLK_OVL_BLENDER2_DISP, "ovl_blender2_disp", "ovl_blender2"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER3, "ovl_blender3", "ck2_disp_ck", 17),
+	GATE_OVL0_V(CLK_OVL_BLENDER3_DISP, "ovl_blender3_disp", "ovl_blender3"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER4, "ovl_blender4", "ck2_disp_ck", 18),
+	GATE_OVL0_V(CLK_OVL_BLENDER4_DISP, "ovl_blender4_disp", "ovl_blender4"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER5, "ovl_blender5", "ck2_disp_ck", 19),
+	GATE_OVL0_V(CLK_OVL_BLENDER5_DISP, "ovl_blender5_disp", "ovl_blender5"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER6, "ovl_blender6", "ck2_disp_ck", 20),
+	GATE_OVL0_V(CLK_OVL_BLENDER6_DISP, "ovl_blender6_disp", "ovl_blender6"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER7, "ovl_blender7", "ck2_disp_ck", 21),
+	GATE_OVL0_V(CLK_OVL_BLENDER7_DISP, "ovl_blender7_disp", "ovl_blender7"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER8, "ovl_blender8", "ck2_disp_ck", 22),
+	GATE_OVL0_V(CLK_OVL_BLENDER8_DISP, "ovl_blender8_disp", "ovl_blender8"),
+	GATE_VOTE_OVL0(CLK_OVL_BLENDER9, "ovl_blender9", "ck2_disp_ck", 23),
+	GATE_OVL0_V(CLK_OVL_BLENDER9_DISP, "ovl_blender9_disp", "ovl_blender9"),
+	GATE_VOTE_OVL0(CLK_OVL_OUTPROC0, "ovl_outproc0", "ck2_disp_ck", 24),
+	GATE_OVL0_V(CLK_OVL_OUTPROC0_DISP, "ovl_outproc0_disp", "ovl_outproc0"),
+	GATE_VOTE_OVL0(CLK_OVL_OUTPROC1, "ovl_outproc1", "ck2_disp_ck", 25),
+	GATE_OVL0_V(CLK_OVL_OUTPROC1_DISP, "ovl_outproc1_disp", "ovl_outproc1"),
+	GATE_VOTE_OVL0(CLK_OVL_OUTPROC2, "ovl_outproc2", "ck2_disp_ck", 26),
+	GATE_OVL0_V(CLK_OVL_OUTPROC2_DISP, "ovl_outproc2_disp", "ovl_outproc2"),
+	GATE_VOTE_OVL0(CLK_OVL_OUTPROC3, "ovl_outproc3", "ck2_disp_ck", 27),
+	GATE_OVL0_V(CLK_OVL_OUTPROC3_DISP, "ovl_outproc3_disp", "ovl_outproc3"),
+	GATE_VOTE_OVL0(CLK_OVL_OUTPROC4, "ovl_outproc4", "ck2_disp_ck", 28),
+	GATE_OVL0_V(CLK_OVL_OUTPROC4_DISP, "ovl_outproc4_disp", "ovl_outproc4"),
+	GATE_VOTE_OVL0(CLK_OVL_OUTPROC5, "ovl_outproc5", "ck2_disp_ck", 29),
+	GATE_OVL0_V(CLK_OVL_OUTPROC5_DISP, "ovl_outproc5_disp", "ovl_outproc5"),
+	GATE_VOTE_OVL0(CLK_OVL_MDP_RSZ0, "ovl_mdp_rsz0", "ck2_disp_ck", 30),
+	GATE_OVL0_V(CLK_OVL_MDP_RSZ0_DISP, "ovl_mdp_rsz0_disp", "ovl_mdp_rsz0"),
+	GATE_VOTE_OVL0(CLK_OVL_MDP_RSZ1, "ovl_mdp_rsz1", "ck2_disp_ck", 31),
+	GATE_OVL0_V(CLK_OVL_MDP_RSZ1_DISP, "ovl_mdp_rsz1_disp", "ovl_mdp_rsz1"),
+	/* OVL1 */
+	GATE_VOTE_OVL1(CLK_OVL_DISP_WDMA0, "ovl_disp_wdma0", "ck2_disp_ck", 0),
+	GATE_OVL1_V(CLK_OVL_DISP_WDMA0_DISP, "ovl_disp_wdma0_disp", "ovl_disp_wdma0"),
+	GATE_VOTE_OVL1(CLK_OVL_DISP_WDMA1, "ovl_disp_wdma1", "ck2_disp_ck", 1),
+	GATE_OVL1_V(CLK_OVL_DISP_WDMA1_DISP, "ovl_disp_wdma1_disp", "ovl_disp_wdma1"),
+	GATE_VOTE_OVL1(CLK_OVL_UFBC_WDMA0, "ovl_ufbc_wdma0", "ck2_disp_ck", 2),
+	GATE_OVL1_V(CLK_OVL_UFBC_WDMA0_DISP, "ovl_ufbc_wdma0_disp", "ovl_ufbc_wdma0"),
+	GATE_VOTE_OVL1(CLK_OVL_MDP_RDMA0, "ovl_mdp_rdma0", "ck2_disp_ck", 3),
+	GATE_OVL1_V(CLK_OVL_MDP_RDMA0_DISP, "ovl_mdp_rdma0_disp", "ovl_mdp_rdma0"),
+	GATE_VOTE_OVL1(CLK_OVL_MDP_RDMA1, "ovl_mdp_rdma1", "ck2_disp_ck", 4),
+	GATE_OVL1_V(CLK_OVL_MDP_RDMA1_DISP, "ovl_mdp_rdma1_disp", "ovl_mdp_rdma1"),
+	GATE_VOTE_OVL1(CLK_OVL_BWM0, "ovl_bwm0", "ck2_disp_ck", 5),
+	GATE_OVL1_V(CLK_OVL_BWM0_DISP, "ovl_bwm0_disp", "ovl_bwm0"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI0, "ovl_dli0", "ck2_disp_ck", 6),
+	GATE_OVL1_V(CLK_OVL_DLI0_DISP, "ovl_dli0_disp", "ovl_dli0"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI1, "ovl_dli1", "ck2_disp_ck", 7),
+	GATE_OVL1_V(CLK_OVL_DLI1_DISP, "ovl_dli1_disp", "ovl_dli1"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI2, "ovl_dli2", "ck2_disp_ck", 8),
+	GATE_OVL1_V(CLK_OVL_DLI2_DISP, "ovl_dli2_disp", "ovl_dli2"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI3, "ovl_dli3", "ck2_disp_ck", 9),
+	GATE_OVL1_V(CLK_OVL_DLI3_DISP, "ovl_dli3_disp", "ovl_dli3"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI4, "ovl_dli4", "ck2_disp_ck", 10),
+	GATE_OVL1_V(CLK_OVL_DLI4_DISP, "ovl_dli4_disp", "ovl_dli4"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI5, "ovl_dli5", "ck2_disp_ck", 11),
+	GATE_OVL1_V(CLK_OVL_DLI5_DISP, "ovl_dli5_disp", "ovl_dli5"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI6, "ovl_dli6", "ck2_disp_ck", 12),
+	GATE_OVL1_V(CLK_OVL_DLI6_DISP, "ovl_dli6_disp", "ovl_dli6"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI7, "ovl_dli7", "ck2_disp_ck", 13),
+	GATE_OVL1_V(CLK_OVL_DLI7_DISP, "ovl_dli7_disp", "ovl_dli7"),
+	GATE_VOTE_OVL1(CLK_OVL_DLI8, "ovl_dli8", "ck2_disp_ck", 14),
+	GATE_OVL1_V(CLK_OVL_DLI8_DISP, "ovl_dli8_disp", "ovl_dli8"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO0, "ovl_dlo0", "ck2_disp_ck", 15),
+	GATE_OVL1_V(CLK_OVL_DLO0_DISP, "ovl_dlo0_disp", "ovl_dlo0"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO1, "ovl_dlo1", "ck2_disp_ck", 16),
+	GATE_OVL1_V(CLK_OVL_DLO1_DISP, "ovl_dlo1_disp", "ovl_dlo1"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO2, "ovl_dlo2", "ck2_disp_ck", 17),
+	GATE_OVL1_V(CLK_OVL_DLO2_DISP, "ovl_dlo2_disp", "ovl_dlo2"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO3, "ovl_dlo3", "ck2_disp_ck", 18),
+	GATE_OVL1_V(CLK_OVL_DLO3_DISP, "ovl_dlo3_disp", "ovl_dlo3"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO4, "ovl_dlo4", "ck2_disp_ck", 19),
+	GATE_OVL1_V(CLK_OVL_DLO4_DISP, "ovl_dlo4_disp", "ovl_dlo4"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO5, "ovl_dlo5", "ck2_disp_ck", 20),
+	GATE_OVL1_V(CLK_OVL_DLO5_DISP, "ovl_dlo5_disp", "ovl_dlo5"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO6, "ovl_dlo6", "ck2_disp_ck", 21),
+	GATE_OVL1_V(CLK_OVL_DLO6_DISP, "ovl_dlo6_disp", "ovl_dlo6"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO7, "ovl_dlo7", "ck2_disp_ck", 22),
+	GATE_OVL1_V(CLK_OVL_DLO7_DISP, "ovl_dlo7_disp", "ovl_dlo7"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO8, "ovl_dlo8", "ck2_disp_ck", 23),
+	GATE_OVL1_V(CLK_OVL_DLO8_DISP, "ovl_dlo8_disp", "ovl_dlo8"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO9, "ovl_dlo9", "ck2_disp_ck", 24),
+	GATE_OVL1_V(CLK_OVL_DLO9_DISP, "ovl_dlo9_disp", "ovl_dlo9"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO10, "ovl_dlo10", "ck2_disp_ck", 25),
+	GATE_OVL1_V(CLK_OVL_DLO10_DISP, "ovl_dlo10_disp", "ovl_dlo10"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO11, "ovl_dlo11", "ck2_disp_ck", 26),
+	GATE_OVL1_V(CLK_OVL_DLO11_DISP, "ovl_dlo11_disp", "ovl_dlo11"),
+	GATE_VOTE_OVL1(CLK_OVL_DLO12, "ovl_dlo12", "ck2_disp_ck", 27),
+	GATE_OVL1_V(CLK_OVL_DLO12_DISP, "ovl_dlo12_disp", "ovl_dlo12"),
+	GATE_VOTE_OVL1(CLK_OVLSYS_RELAY0, "ovlsys_relay0", "ck2_disp_ck", 28),
+	GATE_OVL1_V(CLK_OVLSYS_RELAY0_DISP, "ovlsys_relay0_disp", "ovlsys_relay0"),
+	GATE_VOTE_OVL1(CLK_OVL_INLINEROT0, "ovl_inlinerot0", "ck2_disp_ck", 29),
+	GATE_OVL1_V(CLK_OVL_INLINEROT0_DISP, "ovl_inlinerot0_disp", "ovl_inlinerot0"),
+	GATE_VOTE_OVL1(CLK_OVL_SMI, "ovl_smi", "ck2_disp_ck", 30),
+	GATE_OVL1_V(CLK_OVL_SMI_SMI, "ovl_smi_smi", "ovl_smi"),
+};
+
+static const struct mtk_clk_desc ovl_mcd = {
+	.clks = ovl_clks,
+	.num_clks = ARRAY_SIZE(ovl_clks),
+};
+
+static const struct platform_device_id clk_mt8196_ovl0_id_table[] = {
+	{ .name = "clk-mt8196-ovl0", .driver_data = (kernel_ulong_t)&ovl_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, clk_mt8196_ovl0_id_table);
+
+static struct platform_driver clk_mt8196_ovl0_drv = {
+	.probe = mtk_clk_pdev_probe,
+	.remove = mtk_clk_pdev_remove,
+	.driver = {
+		.name = "clk-mt8196-ovl0",
+	},
+	.id_table = clk_mt8196_ovl0_id_table,
+};
+
+module_platform_driver(clk_mt8196_ovl0_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


