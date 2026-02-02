Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A79D73E86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYVS2FwjLMzFwOXu1fCj3+ov5FwmBxOp6FzH7JAvU3M=; b=Wp/tTdQenHfx2tt4zIQTmo1g3b
	1iPUQS7eQknKK9VnliAux297ndD6hsQD19J2QAwgX67I4madQ5buQcNeLbcRQbUzByh8aY7K/Qb/B
	NYmcLhC2BF7pxZyaG+RZIjM4hEXdT+lLxtNzmlBkx4S4wv2xaEfFwNdr7ia4JegBd+5IKSyZqBK85
	6g3jmWLu2wTmf1xIwkxI3JC5u4rncYvDwT+vd/oZTAmzWmoHemOK/dBLLHCjm9R2sVwq78R//nPE0
	R1gKEGf+4+MtqarnAE4Ufiw670Ncoy7k5mVJhdYGe3z80OZyE+X0WWbPmDe+mGG0R0g2TJJlqFr3D
	qBL/Vvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQy-00000004W4w-0OCP;
	Mon, 02 Feb 2026 06:29:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQb-00000004Vh1-1yRe;
	Mon, 02 Feb 2026 06:28:58 +0000
X-UUID: 6dd960c4000011f1a16f0188aa809bee-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wYVS2FwjLMzFwOXu1fCj3+ov5FwmBxOp6FzH7JAvU3M=;
	b=b/q19vmGwc2pi2qsoSKGskPxZs93JjZJz7u6Q7gXfvpskZa7uiBCoMilWM6a9i8s6lg4nBzeUeDE1dNqaCCA1b3ZZp45WLluNJIINsBFavlo0CvVHy9iG5CRi3XNJuvHYzfXcvJ5mhQjtLlplqSS/pP4IeWmkdCZp8e8B1fh1ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c91b4f62-db6d-43d7-a143-1ddf1a2939a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:e96734e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6dd960c4000011f1a16f0188aa809bee-20260201
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1857909323; Sun, 01 Feb 2026 23:28:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:28:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:28:43 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Cochran
	<richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH v5 06/18] clk: mediatek: Add MT8189 vlpcfg clock support
Date: Mon, 2 Feb 2026 14:28:13 +0800
Message-ID: <20260202062840.342707-7-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_222853_654071_E9CA64A2 
X-CRM114-Status: GOOD (  16.27  )
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

Add support for the MT8189 vlpcfg clock controller,
which provides clock gate control for vlp domain IPs.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Makefile            |   2 +-
 drivers/clk/mediatek/clk-mt8189-vlpcfg.c | 111 +++++++++++++++++++++++
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpcfg.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 3b25df9e7b50..d9279b237b7b 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -124,7 +124,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
-				   clk-mt8189-vlpckgen.o
+				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-vlpcfg.c b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
new file mode 100644
index 000000000000..2b9c3101f2b4
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
@@ -0,0 +1,111 @@
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
+static const struct mtk_gate_regs vlpcfg_ao_reg_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VLPCFG_AO_REG(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &vlpcfg_ao_reg_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate vlpcfg_ao_reg_clks[] = {
+	GATE_VLPCFG_AO_REG(CLK_VLPCFG_AO_APEINT_RX, "vlpcfg_ao_apeint_rx", "clk26m", 8),
+};
+
+static const struct mtk_clk_desc vlpcfg_ao_reg_mcd = {
+	.clks = vlpcfg_ao_reg_clks,
+	.num_clks = ARRAY_SIZE(vlpcfg_ao_reg_clks),
+};
+
+static const struct mtk_gate_regs vlpcfg_reg_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x4,
+};
+
+#define GATE_VLPCFG_REG_FLAGS(_id, _name, _parent, _shift, _flags)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vlpcfg_reg_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_no_setclr_inv, _flags)
+
+#define GATE_VLPCFG_REG(_id, _name, _parent, _shift)		\
+	GATE_VLPCFG_REG_FLAGS(_id, _name, _parent, _shift, 0)
+
+static const struct mtk_gate vlpcfg_reg_clks[] = {
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_SCP, "vlpcfg_scp",
+			      "vlp_scp_sel", 28, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_RG_R_APXGPT_26M, "vlpcfg_r_apxgpt_26m",
+			      "clk26m", 24, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_DPMSRCK_TEST, "vlpcfg_dpmsrck_test",
+			      "clk26m", 23, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_RG_DPMSRRTC_TEST, "vlpcfg_dpmsrrtc_test",
+			      "clk32k", 22, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_DPMSRULP_TEST, "vlpcfg_dpmsrulp_test",
+			      "osc_d10", 21, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_SPMI_P_MST, "vlpcfg_spmi_p",
+			      "vlp_spmi_p_sel", 20, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_SPMI_P_MST_32K, "vlpcfg_spmi_p_32k",
+			      "clk32k", 18, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_PMIF_SPMI_P_SYS, "vlpcfg_pmif_spmi_p_sys",
+			      "vlp_pwrap_ulposc_sel", 13, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_PMIF_SPMI_P_TMR, "vlpcfg_pmif_spmi_p_tmr",
+			      "vlp_pwrap_ulposc_sel", 12, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG(CLK_VLPCFG_REG_PMIF_SPMI_M_SYS, "vlpcfg_pmif_spmi_m_sys",
+			"vlp_pwrap_ulposc_sel", 11),
+	GATE_VLPCFG_REG(CLK_VLPCFG_REG_PMIF_SPMI_M_TMR, "vlpcfg_pmif_spmi_m_tmr",
+			"vlp_pwrap_ulposc_sel", 10),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_DVFSRC, "vlpcfg_dvfsrc",
+			      "vlp_dvfsrc_sel", 9, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_PWM_VLP, "vlpcfg_pwm_vlp",
+			      "vlp_pwm_vlp_sel", 8, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_SRCK, "vlpcfg_srck",
+			      "vlp_srck_sel", 7, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_SSPM_F26M, "vlpcfg_sspm_f26m",
+			      "vlp_sspm_f26m_sel", 4, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_SSPM_F32K, "vlpcfg_sspm_f32k",
+			      "clk32k", 3, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_SSPM_ULPOSC, "vlpcfg_sspm_ulposc",
+			      "vlp_sspm_ulposc_sel", 2, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_VLP_32K_COM, "vlpcfg_vlp_32k_com",
+			      "clk32k", 1, CLK_IS_CRITICAL),
+	GATE_VLPCFG_REG_FLAGS(CLK_VLPCFG_REG_VLP_26M_COM, "vlpcfg_vlp_26m_com",
+			      "clk26m", 0, CLK_IS_CRITICAL),
+};
+
+static const struct mtk_clk_desc vlpcfg_reg_mcd = {
+	.clks = vlpcfg_reg_clks,
+	.num_clks = ARRAY_SIZE(vlpcfg_reg_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_vlpcfg[] = {
+	{ .compatible = "mediatek,mt8189-vlp-ao", .data = &vlpcfg_ao_reg_mcd },
+	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_reg_mcd },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8189_vlpcfg_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-vlpcfg",
+		.of_match_table = of_match_clk_mt8189_vlpcfg,
+	},
+};
+
+module_platform_driver(clk_mt8189_vlpcfg_drv);
+MODULE_DESCRIPTION("MediaTek MT8189 vlpcfg clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


