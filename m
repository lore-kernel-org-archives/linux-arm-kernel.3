Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE8C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxFINP6vTZRbAdV8FEtOJkF25zLnQN9+elubnP7e0b8=; b=whvnGipTF3edSs48cboC3eyKJc
	P4HHkY/hadcCXwIp7/fbyFwi//LZ6/oxlyYuKrmzi5obuFEhWaShkQPVKzakSE4Hfixu0+jooK8Vx
	VQHN6k3oUONE9O+6ej/4wpFDxVlBXWxp1yrgEw+ys1d0ras7ypx7uqysIIEDF3aYhZAjZ093p+B4x
	64I8JsXwW9zUk7JfFFVZyiL1URwTxDvK9tkqyC3mmk+7brkew/7NT/FZ1F2VVkUppDzLm23w6erNI
	7kdM5qZrk/Ftx8xuV22S7zmUS6hxcndETuff2Gq8WboMykcAP1XPdZf6v3fN5iyia5Ov5akcBz1G+
	5hrtBTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOzZ-0000000D529-3KeB;
	Fri, 07 Mar 2025 04:07:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOSL-0000000CzXf-28dQ;
	Fri, 07 Mar 2025 03:33:02 +0000
X-UUID: da844dc6fb0411ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mxFINP6vTZRbAdV8FEtOJkF25zLnQN9+elubnP7e0b8=;
	b=aFeLjXmfCbXSShDWBfovHhnsR7vg8dYbd9VRlgIS0gYYQXL/z6b/iciBBnUo3LYk7TXRd6dbyfzFglsD3UxhWaf0MzAbjOj2IWA7TDgrsrsHF+aYU5FYkcDplr82bW0SiMAmfHp/VHNZRCEOP/OMQ3dzEHUEZom/jdZKz43wW1A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:699eaa0a-6e7a-4d6d-a705-be2e1fa32b32,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b6e307c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: da844dc6fb0411ef83f2a1c9db70dae0-20250306
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1282449325; Thu, 06 Mar 2025 20:32:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:49 +0800
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
Subject: [PATCH 18/26] clk: mediatek: Add MT8196 disp0 clock support
Date: Fri, 7 Mar 2025 11:27:14 +0800
Message-ID: <20250307032942.10447-19-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307032942.10447-1-guangjie.song@mediatek.com>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193301_558229_921005AB 
X-CRM114-Status: GOOD (  14.59  )
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

Add MT8196 disp0 clock controller which provides clock gate control in
display system. This is integrated with mtk-mmsys driver which will
populate device by platform_device_register_data to start disp0 clock
driver.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/clk/mediatek/Kconfig            |   7 +
 drivers/clk/mediatek/Makefile           |   1 +
 drivers/clk/mediatek/clk-mt8196-disp0.c | 247 ++++++++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp0.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 042de08e0bb1..dcb660d45bcf 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1045,6 +1045,13 @@ config COMMON_CLK_MT8196_MFGCFG
 	help
 	  This driver supports MediaTek MT8196 mfgcfg clocks.
 
+config COMMON_CLK_MT8196_MMSYS
+	tristate "Clock driver for MediaTek MT8196 mmsys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 mmsys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index ad2de9ee6d15..881061f1e259 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-disp0.c b/drivers/clk/mediatek/clk-mt8196-disp0.c
new file mode 100644
index 000000000000..07237a51358f
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-disp0.c
@@ -0,0 +1,247 @@
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
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mm0_vote_regs = {
+	.set_ofs = 0x0020,
+	.clr_ofs = 0x0024,
+	.sta_ofs = 0x2c10,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs mm1_vote_regs = {
+	.set_ofs = 0x0028,
+	.clr_ofs = 0x002c,
+	.sta_ofs = 0x2c14,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &mm0_cg_regs,		\
+		.shift = _shift,		\
+		.flags = CLK_OPS_PARENT_ENABLE,	\
+		.ops = &mtk_clk_gate_ops_setclr,\
+	}
+
+#define GATE_MM0_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_MM0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &mm0_cg_regs,			\
+		.vote_regs = &mm0_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote,		\
+		.dma_ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE		\
+	}
+
+#define GATE_MM1(_id, _name, _parent, _shift) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &mm1_cg_regs,		\
+		.shift = _shift,		\
+		.flags = CLK_OPS_PARENT_ENABLE,	\
+		.ops = &mtk_clk_gate_ops_setclr,\
+	}
+
+#define GATE_MM1_V(_id, _name, _parent) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &cg_regs_dummy,		\
+		.ops = &mtk_clk_dummy_ops,	\
+	}
+
+#define GATE_VOTE_MM1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.vote_comp = "mm-vote-regmap",		\
+		.regs = &mm1_cg_regs,			\
+		.vote_regs = &mm1_vote_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_vote,		\
+		.dma_ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_USE_VOTE |			\
+			 CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate mm_clks[] = {
+	/* MM0 */
+	GATE_VOTE_MM0(CLK_MM_CONFIG, "mm_config", "ck2_disp_ck", 0),
+	GATE_MM0_V(CLK_MM_CONFIG_DISP, "mm_config_disp", "mm_config"),
+	GATE_VOTE_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "ck2_disp_ck", 1),
+	GATE_MM0_V(CLK_MM_DISP_MUTEX0_DISP, "mm_disp_mutex0_disp", "mm_disp_mutex0"),
+	GATE_VOTE_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "ck2_disp_ck", 2),
+	GATE_MM0_V(CLK_MM_DISP_AAL0_PQ, "mm_disp_aal0_pq", "mm_disp_aal0"),
+	GATE_VOTE_MM0(CLK_MM_DISP_AAL1, "mm_disp_aal1", "ck2_disp_ck", 3),
+	GATE_MM0_V(CLK_MM_DISP_AAL1_PQ, "mm_disp_aal1_pq", "mm_disp_aal1"),
+	GATE_MM0(CLK_MM_DISP_C3D0, "mm_disp_c3d0", "ck2_disp_ck", 4),
+	GATE_MM0_V(CLK_MM_DISP_C3D0_PQ, "mm_disp_c3d0_pq", "mm_disp_c3d0"),
+	GATE_MM0(CLK_MM_DISP_C3D1, "mm_disp_c3d1", "ck2_disp_ck", 5),
+	GATE_MM0_V(CLK_MM_DISP_C3D1_PQ, "mm_disp_c3d1_pq", "mm_disp_c3d1"),
+	GATE_MM0(CLK_MM_DISP_C3D2, "mm_disp_c3d2", "ck2_disp_ck", 6),
+	GATE_MM0_V(CLK_MM_DISP_C3D2_PQ, "mm_disp_c3d2_pq", "mm_disp_c3d2"),
+	GATE_MM0(CLK_MM_DISP_C3D3, "mm_disp_c3d3", "ck2_disp_ck", 7),
+	GATE_MM0_V(CLK_MM_DISP_C3D3_PQ, "mm_disp_c3d3_pq", "mm_disp_c3d3"),
+	GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "ck2_disp_ck", 8),
+	GATE_MM0_V(CLK_MM_DISP_CCORR0_PQ, "mm_disp_ccorr0_pq", "mm_disp_ccorr0"),
+	GATE_MM0(CLK_MM_DISP_CCORR1, "mm_disp_ccorr1", "ck2_disp_ck", 9),
+	GATE_MM0_V(CLK_MM_DISP_CCORR1_PQ, "mm_disp_ccorr1_pq", "mm_disp_ccorr1"),
+	GATE_MM0(CLK_MM_DISP_CCORR2, "mm_disp_ccorr2", "ck2_disp_ck", 10),
+	GATE_MM0_V(CLK_MM_DISP_CCORR2_PQ, "mm_disp_ccorr2_pq", "mm_disp_ccorr2"),
+	GATE_MM0(CLK_MM_DISP_CCORR3, "mm_disp_ccorr3", "ck2_disp_ck", 11),
+	GATE_MM0_V(CLK_MM_DISP_CCORR3_PQ, "mm_disp_ccorr3_pq", "mm_disp_ccorr3"),
+	GATE_MM0(CLK_MM_DISP_CHIST0, "mm_disp_chist0", "ck2_disp_ck", 12),
+	GATE_MM0_V(CLK_MM_DISP_CHIST0_PQ, "mm_disp_chist0_pq", "mm_disp_chist0"),
+	GATE_MM0(CLK_MM_DISP_CHIST1, "mm_disp_chist1", "ck2_disp_ck", 13),
+	GATE_MM0_V(CLK_MM_DISP_CHIST1_PQ, "mm_disp_chist1_pq", "mm_disp_chist1"),
+	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "ck2_disp_ck", 14),
+	GATE_MM0_V(CLK_MM_DISP_COLOR0_PQ, "mm_disp_color0_pq", "mm_disp_color0"),
+	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "ck2_disp_ck", 15),
+	GATE_MM0_V(CLK_MM_DISP_COLOR1_PQ, "mm_disp_color1_pq", "mm_disp_color1"),
+	GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "ck2_disp_ck", 16),
+	GATE_MM0_V(CLK_MM_DISP_DITHER0_PQ, "mm_disp_dither0_pq", "mm_disp_dither0"),
+	GATE_MM0(CLK_MM_DISP_DITHER1, "mm_disp_dither1", "ck2_disp_ck", 17),
+	GATE_MM0_V(CLK_MM_DISP_DITHER1_PQ, "mm_disp_dither1_pq", "mm_disp_dither1"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC0, "mm_disp_dli_async0", "ck2_disp_ck", 18),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC0_DISP, "mm_disp_dli_async0_disp", "mm_disp_dli_async0"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC1, "mm_disp_dli_async1", "ck2_disp_ck", 19),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC1_DISP, "mm_disp_dli_async1_disp", "mm_disp_dli_async1"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC2, "mm_disp_dli_async2", "ck2_disp_ck", 20),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC2_DISP, "mm_disp_dli_async2_disp", "mm_disp_dli_async2"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC3, "mm_disp_dli_async3", "ck2_disp_ck", 21),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC3_DISP, "mm_disp_dli_async3_disp", "mm_disp_dli_async3"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC4, "mm_disp_dli_async4", "ck2_disp_ck", 22),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC4_DISP, "mm_disp_dli_async4_disp", "mm_disp_dli_async4"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC5, "mm_disp_dli_async5", "ck2_disp_ck", 23),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC5_DISP, "mm_disp_dli_async5_disp", "mm_disp_dli_async5"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC6, "mm_disp_dli_async6", "ck2_disp_ck", 24),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC6_DISP, "mm_disp_dli_async6_disp", "mm_disp_dli_async6"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC7, "mm_disp_dli_async7", "ck2_disp_ck", 25),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC7_DISP, "mm_disp_dli_async7_disp", "mm_disp_dli_async7"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC8, "mm_disp_dli_async8", "ck2_disp_ck", 26),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC8_DISP, "mm_disp_dli_async8_disp", "mm_disp_dli_async8"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC9, "mm_disp_dli_async9", "ck2_disp_ck", 27),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC9_DISP, "mm_disp_dli_async9_disp", "mm_disp_dli_async9"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC10, "mm_disp_dli_async10", "ck2_disp_ck", 28),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC10_DISP, "mm_disp_dli_async10_disp", "mm_disp_dli_async10"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC11, "mm_disp_dli_async11", "ck2_disp_ck", 29),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC11_DISP, "mm_disp_dli_async11_disp", "mm_disp_dli_async11"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC12, "mm_disp_dli_async12", "ck2_disp_ck", 30),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC12_DISP, "mm_disp_dli_async12_disp", "mm_disp_dli_async12"),
+	GATE_VOTE_MM0(CLK_MM_DISP_DLI_ASYNC13, "mm_disp_dli_async13", "ck2_disp_ck", 31),
+	GATE_MM0_V(CLK_MM_DISP_DLI_ASYNC13_DISP, "mm_disp_dli_async13_disp", "mm_disp_dli_async13"),
+	/* MM1 */
+	GATE_VOTE_MM1(CLK_MM_DISP_DLI_ASYNC14, "mm_disp_dli_async14", "ck2_disp_ck", 0),
+	GATE_MM1_V(CLK_MM_DISP_DLI_ASYNC14_DISP, "mm_disp_dli_async14_disp", "mm_disp_dli_async14"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLI_ASYNC15, "mm_disp_dli_async15", "ck2_disp_ck", 1),
+	GATE_MM1_V(CLK_MM_DISP_DLI_ASYNC15_DISP, "mm_disp_dli_async15_disp", "mm_disp_dli_async15"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC0, "mm_disp_dlo_async0", "ck2_disp_ck", 2),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC0_DISP, "mm_disp_dlo_async0_disp", "mm_disp_dlo_async0"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC1, "mm_disp_dlo_async1", "ck2_disp_ck", 3),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC1_DISP, "mm_disp_dlo_async1_disp", "mm_disp_dlo_async1"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC2, "mm_disp_dlo_async2", "ck2_disp_ck", 4),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC2_DISP, "mm_disp_dlo_async2_disp", "mm_disp_dlo_async2"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC3, "mm_disp_dlo_async3", "ck2_disp_ck", 5),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC3_DISP, "mm_disp_dlo_async3_disp", "mm_disp_dlo_async3"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC4, "mm_disp_dlo_async4", "ck2_disp_ck", 6),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC4_DISP, "mm_disp_dlo_async4_disp", "mm_disp_dlo_async4"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC5, "mm_disp_dlo_async5", "ck2_disp_ck", 7),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC5_DISP, "mm_disp_dlo_async5_disp", "mm_disp_dlo_async5"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC6, "mm_disp_dlo_async6", "ck2_disp_ck", 8),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC6_DISP, "mm_disp_dlo_async6_disp", "mm_disp_dlo_async6"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC7, "mm_disp_dlo_async7", "ck2_disp_ck", 9),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC7_DISP, "mm_disp_dlo_async7_disp", "mm_disp_dlo_async7"),
+	GATE_VOTE_MM1(CLK_MM_DISP_DLO_ASYNC8, "mm_disp_dlo_async8", "ck2_disp_ck", 10),
+	GATE_MM1_V(CLK_MM_DISP_DLO_ASYNC8_DISP, "mm_disp_dlo_async8_disp", "mm_disp_dlo_async8"),
+	GATE_MM1(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "ck2_disp_ck", 11),
+	GATE_MM1_V(CLK_MM_DISP_GAMMA0_PQ, "mm_disp_gamma0_pq", "mm_disp_gamma0"),
+	GATE_MM1(CLK_MM_DISP_GAMMA1, "mm_disp_gamma1", "ck2_disp_ck", 12),
+	GATE_MM1_V(CLK_MM_DISP_GAMMA1_PQ, "mm_disp_gamma1_pq", "mm_disp_gamma1"),
+	GATE_MM1(CLK_MM_MDP_AAL0, "mm_mdp_aal0", "ck2_disp_ck", 13),
+	GATE_MM1_V(CLK_MM_MDP_AAL0_PQ, "mm_mdp_aal0_pq", "mm_mdp_aal0"),
+	GATE_MM1(CLK_MM_MDP_AAL1, "mm_mdp_aal1", "ck2_disp_ck", 14),
+	GATE_MM1_V(CLK_MM_MDP_AAL1_PQ, "mm_mdp_aal1_pq", "mm_mdp_aal1"),
+	GATE_VOTE_MM1(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "ck2_disp_ck", 15),
+	GATE_MM1_V(CLK_MM_MDP_RDMA0_DISP, "mm_mdp_rdma0_disp", "mm_mdp_rdma0"),
+	GATE_VOTE_MM1(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "ck2_disp_ck", 16),
+	GATE_MM1_V(CLK_MM_DISP_POSTMASK0_DISP, "mm_disp_postmask0_disp", "mm_disp_postmask0"),
+	GATE_VOTE_MM1(CLK_MM_DISP_POSTMASK1, "mm_disp_postmask1", "ck2_disp_ck", 17),
+	GATE_MM1_V(CLK_MM_DISP_POSTMASK1_DISP, "mm_disp_postmask1_disp", "mm_disp_postmask1"),
+	GATE_VOTE_MM1(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "ck2_disp_ck", 18),
+	GATE_MM1_V(CLK_MM_MDP_RSZ0_DISP, "mm_mdp_rsz0_disp", "mm_mdp_rsz0"),
+	GATE_VOTE_MM1(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "ck2_disp_ck", 19),
+	GATE_MM1_V(CLK_MM_MDP_RSZ1_DISP, "mm_mdp_rsz1_disp", "mm_mdp_rsz1"),
+	GATE_VOTE_MM1(CLK_MM_DISP_SPR0, "mm_disp_spr0", "ck2_disp_ck", 20),
+	GATE_MM1_V(CLK_MM_DISP_SPR0_DISP, "mm_disp_spr0_disp", "mm_disp_spr0"),
+	GATE_MM1(CLK_MM_DISP_TDSHP0, "mm_disp_tdshp0", "ck2_disp_ck", 21),
+	GATE_MM1_V(CLK_MM_DISP_TDSHP0_PQ, "mm_disp_tdshp0_pq", "mm_disp_tdshp0"),
+	GATE_MM1(CLK_MM_DISP_TDSHP1, "mm_disp_tdshp1", "ck2_disp_ck", 22),
+	GATE_MM1_V(CLK_MM_DISP_TDSHP1_PQ, "mm_disp_tdshp1_pq", "mm_disp_tdshp1"),
+	GATE_VOTE_MM1(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "ck2_disp_ck", 23),
+	GATE_MM1_V(CLK_MM_DISP_WDMA0_DISP, "mm_disp_wdma0_disp", "mm_disp_wdma0"),
+	GATE_VOTE_MM1(CLK_MM_DISP_Y2R0, "mm_disp_y2r0", "ck2_disp_ck", 24),
+	GATE_MM1_V(CLK_MM_DISP_Y2R0_DISP, "mm_disp_y2r0_disp", "mm_disp_y2r0"),
+	GATE_VOTE_MM1(CLK_MM_SMI_SUB_COMM0, "mm_ssc", "ck2_disp_ck", 25),
+	GATE_MM1_V(CLK_MM_SMI_SUB_COMM0_SMI, "mm_ssc_smi", "mm_ssc"),
+	GATE_VOTE_MM1(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "ck2_disp_ck", 26),
+	GATE_MM1_V(CLK_MM_DISP_FAKE_ENG0_DISP, "mm_disp_fake_eng0_disp", "mm_disp_fake_eng0"),
+};
+
+static const struct mtk_clk_desc mm_mcd = {
+	.clks = mm_clks,
+	.num_clks = ARRAY_SIZE(mm_clks),
+};
+
+static const struct platform_device_id clk_mt8196_disp0_id_table[] = {
+	{ .name = "clk-mt8196-disp0", .driver_data = (kernel_ulong_t)&mm_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, clk_mt8196_disp0_id_table);
+
+static struct platform_driver clk_mt8196_disp0_drv = {
+	.probe = mtk_clk_pdev_probe,
+	.remove = mtk_clk_pdev_remove,
+	.driver = {
+		.name = "clk-mt8196-disp0",
+	},
+	.id_table = clk_mt8196_disp0_id_table,
+};
+
+module_platform_driver(clk_mt8196_disp0_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


