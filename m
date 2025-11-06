Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA944CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVGFMadnNoO+nDgrkyIQPMPQSd359vrxmaZsg8bmvnE=; b=KV5nWnd/kBjZR0wk7Lq3DCGKYj
	+iC2bisJu9ruXx6fAMjnP0MjafcSXre319XSpDPoYaB1QuToLvoZJDs7R1jwWRtG9/aeLV2GNKo//
	+afEmYillNXk5p+hfG3h/QCA7eCLBJPaT9oxUXLp8Dum7ZPA5JdSGNOun71JxCHtZQY1/BQcrcxTo
	JvXjOH29DL6hx+txVTVSAezOgvJ8Nm/r5So9t+ubglozghyVfPQvOnbPftx9+bkizHuZVIWU74kvP
	OVTc8wnucvVPZQ/HfEu3qFz7wPm1tgGlXsk5OiNgAF2ReJJMQkTcEdTdukU5vZKtx+yEGUNPjiIG1
	DeMRl++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLk-0000000FUOG-44n1;
	Thu, 06 Nov 2025 12:44:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLF-0000000FTZM-1Haw;
	Thu, 06 Nov 2025 12:43:58 +0000
X-UUID: 39daf63ebb0e11f0a52f393f94899d25-20251106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eVGFMadnNoO+nDgrkyIQPMPQSd359vrxmaZsg8bmvnE=;
	b=K54ZUfFroctUqg3a0MLeeEqpbqvSyDzQX+ime/zU1RD1nnTEa3c+5YRI3ELVbi0RePxgb9p8eX6YOf1U5KqRuKu3EP5L2F8Jf668V9sLneKzs7A6LILbROT4RKxgwScnr9J6FTTPpsMjkI8B33vfG5nO0lVy4fYJfYhCGe8YUgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f2dad701-2956-474a-be31-d64f8eb46e6e,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:da351d6b-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39daf63ebb0e11f0a52f393f94899d25-20251106
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 955932226; Thu, 06 Nov 2025 05:43:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 20:43:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 20:43:39 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <irving-ch.lin@mediatek.com>
Subject: [PATCH v3 16/21] clk: mediatek: Add MT8189 mmsys clock support
Date: Thu, 6 Nov 2025 20:42:01 +0800
Message-ID: <20251106124330.1145600-17-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_044353_424598_DA0573EA 
X-CRM114-Status: GOOD (  20.36  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

Add support for the MT8189 mmsys clock controller,
which provides clock gate control for multimedia systems.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig              |  12 ++
 drivers/clk/mediatek/Makefile             |   1 +
 drivers/clk/mediatek/clk-mt8189-dispsys.c | 211 ++++++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dispsys.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 316d010b503a..8b1f358457d8 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -917,6 +917,18 @@ config COMMON_CLK_MT8189_MFG
 	  the MT8189 chipset. Enabling this will allow the manufacturing mode of
 	  the chipset to function correctly with the appropriate clock settings.
 
+config COMMON_CLK_MT8189_MMSYS
+	tristate "Clock driver for MediaTek MT8189 mmsys"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock framework for MediaTek MT8189
+	  multimedia systems (mmsys). This driver is responsible for managing
+	  the clocks for various multimedia components within the SoC, such as
+	  video, audio, and image processing units. Enabling this option will
+	  ensure that these components receive the correct clock frequencies
+	  for proper operation.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 07f11760cf68..21a9e6264b84 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -133,6 +133,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189_IIC) += clk-mt8189-iic.o
 obj-$(CONFIG_COMMON_CLK_MT8189_IMG) += clk-mt8189-img.o
 obj-$(CONFIG_COMMON_CLK_MT8189_MDPSYS) += clk-mt8189-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8189_MFG) += clk-mt8189-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8189_MMSYS) += clk-mt8189-dispsys.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-dispsys.c b/drivers/clk/mediatek/clk-mt8189-dispsys.c
new file mode 100644
index 000000000000..687918024f95
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-dispsys.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Qiqi Wang <qiqi.wang@mediatek.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mediatek,mt8189-clk.h>
+
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x04,
+	.clr_ofs = 0x08,
+	.sta_ofs = 0x00,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x14,
+	.clr_ofs = 0x18,
+	.sta_ofs = 0x10,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mm0_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_MM1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mm1_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate mm_clks[] = {
+	/* MM0 */
+	GATE_MM0(CLK_MM_DISP_OVL0_4L, "mm_disp_ovl0_4l", "disp0_sel", 0),
+	GATE_MM0(CLK_MM_DISP_OVL1_4L, "mm_disp_ovl1_4l", "disp0_sel", 1),
+	GATE_MM0(CLK_MM_VPP_RSZ0, "mm_vpp_rsz0", "disp0_sel", 2),
+	GATE_MM0(CLK_MM_VPP_RSZ1, "mm_vpp_rsz1", "disp0_sel", 3),
+	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "disp0_sel", 4),
+	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "disp0_sel", 5),
+	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp0_sel", 6),
+	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "disp0_sel", 7),
+	GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp0_sel", 8),
+	GATE_MM0(CLK_MM_DISP_CCORR1, "mm_disp_ccorr1", "disp0_sel", 9),
+	GATE_MM0(CLK_MM_DISP_CCORR2, "mm_disp_ccorr2", "disp0_sel", 10),
+	GATE_MM0(CLK_MM_DISP_CCORR3, "mm_disp_ccorr3", "disp0_sel", 11),
+	GATE_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp0_sel", 12),
+	GATE_MM0(CLK_MM_DISP_AAL1, "mm_disp_aal1", "disp0_sel", 13),
+	GATE_MM0(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp0_sel", 14),
+	GATE_MM0(CLK_MM_DISP_GAMMA1, "mm_disp_gamma1", "disp0_sel", 15),
+	GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp0_sel", 16),
+	GATE_MM0(CLK_MM_DISP_DITHER1, "mm_disp_dither1", "disp0_sel", 17),
+	GATE_MM0(CLK_MM_DISP_DSC_WRAP0, "mm_disp_dsc_wrap0", "disp0_sel", 18),
+	GATE_MM0(CLK_MM_VPP_MERGE0, "mm_vpp_merge0", "disp0_sel", 19),
+	GATE_MM0(CLK_MMSYS_0_DISP_DVO, "mmsys_0_disp_dvo", "disp0_sel", 20),
+	GATE_MM0(CLK_MMSYS_0_DISP_DSI0, "mmsys_0_CLK0", "disp0_sel", 21),
+	GATE_MM0(CLK_MM_DP_INTF0, "mm_dp_intf0", "disp0_sel", 22),
+	GATE_MM0(CLK_MM_DPI0, "mm_dpi0", "disp0_sel", 23),
+	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp0_sel", 24),
+	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "disp0_sel", 25),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp0_sel", 26),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG1, "mm_disp_fake_eng1", "disp0_sel", 27),
+	GATE_MM0(CLK_MM_SMI_LARB, "mm_smi_larb", "disp0_sel", 28),
+	GATE_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "disp0_sel", 29),
+	GATE_MM0(CLK_MM_DIPSYS_CONFIG, "mm_dipsys_config", "disp0_sel", 30),
+	GATE_MM0(CLK_MM_DUMMY, "mm_dummy", "disp0_sel", 31),
+	/* MM1 */
+	GATE_MM1(CLK_MMSYS_1_DISP_DSI0, "mmsys_1_CLK0", "dsi_occ_sel", 0),
+	GATE_MM1(CLK_MMSYS_1_LVDS_ENCODER, "mmsys_1_lvds_encoder", "pll_dpix_sel", 1),
+	GATE_MM1(CLK_MMSYS_1_DPI0, "mmsys_1_dpi0", "pll_dpix_sel", 2),
+	GATE_MM1(CLK_MMSYS_1_DISP_DVO, "mmsys_1_disp_dvo", "edp_sel", 3),
+	GATE_MM1(CLK_MM_DP_INTF, "mm_dp_intf", "dp_sel", 4),
+	GATE_MM1(CLK_MMSYS_1_LVDS_ENCODER_CTS, "mmsys_1_lvds_encoder_cts", "vdstx_dg_cts_sel", 5),
+	GATE_MM1(CLK_MMSYS_1_DISP_DVO_AVT, "mmsys_1_disp_dvo_avt", "edp_favt_sel", 6),
+};
+
+static const struct mtk_clk_desc mm_mcd = {
+	.clks = mm_clks,
+	.num_clks = ARRAY_SIZE(mm_clks),
+};
+
+static const struct mtk_gate_regs gce_d_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_GCE_D(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &gce_d_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_no_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate gce_d_clks[] = {
+	GATE_GCE_D(CLK_GCE_D_TOP, "gce_d_top", "mminfra_gce_d", 16),
+};
+
+static const struct mtk_clk_desc gce_d_mcd = {
+	.clks = gce_d_clks,
+	.num_clks = ARRAY_SIZE(gce_d_clks),
+};
+
+static const struct mtk_gate_regs gce_m_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_GCE_M(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &gce_m_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_no_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate gce_m_clks[] = {
+	GATE_GCE_M(CLK_GCE_M_TOP, "gce_m_top", "mminfra_gce_m", 16),
+};
+
+static const struct mtk_clk_desc gce_m_mcd = {
+	.clks = gce_m_clks,
+	.num_clks = ARRAY_SIZE(gce_m_clks),
+};
+
+static const struct mtk_gate_regs mminfra_config0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mminfra_config1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+#define GATE_MMINFRA_CONFIG0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mminfra_config0_cg_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_MMINFRA_CONFIG1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mminfra_config1_cg_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate mminfra_config_clks[] = {
+	/* MMINFRA_CONFIG0 */
+	GATE_MMINFRA_CONFIG0(CLK_MMINFRA_GCE_D, "mminfra_gce_d", "mminfra_sel", 0),
+	GATE_MMINFRA_CONFIG0(CLK_MMINFRA_GCE_M, "mminfra_gce_m", "mminfra_sel", 1),
+	GATE_MMINFRA_CONFIG0(CLK_MMINFRA_SMI, "mminfra_smi", "mminfra_sel", 2),
+	/* MMINFRA_CONFIG1 */
+	GATE_MMINFRA_CONFIG1(CLK_MMINFRA_GCE_26M, "mminfra_gce_26m", "mminfra_sel", 17),
+};
+
+static const struct mtk_clk_desc mminfra_config_mcd = {
+	.clks = mminfra_config_clks,
+	.num_clks = ARRAY_SIZE(mminfra_config_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_dispsys[] = {
+	{ .compatible = "mediatek,mt8189-dispsys", .data = &mm_mcd },
+	{ .compatible = "mediatek,mt8189-gce-d", .data = &gce_d_mcd },
+	{ .compatible = "mediatek,mt8189-gce-m", .data = &gce_m_mcd },
+	{ .compatible = "mediatek,mt8189-mm-infra", .data = &mminfra_config_mcd },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8189_dispsys_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8189-dispsys",
+		.of_match_table = of_match_clk_mt8189_dispsys,
+	},
+};
+
+module_platform_driver(clk_mt8189_dispsys_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


