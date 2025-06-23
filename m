Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3965C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXzKRmZ/5hkwGiyeafLz0STNY4HsO+dVFrXy3PpwUbI=; b=LZU2/Pf7WZmWhrIX7424tEMRGy
	BwJM0Ym//v5gZA+F1t4XxvYJ7pb9gmGxFaUyGO/0yHHf1vSFrkfWFRteQIvUYb8puMZSq+3Bc4FL0
	4kuEVWV8hLmJlSQx1FB5pTNM+q4nh4ISm+RmReveJ94sjJfnJEWBfCmFQE6iTUDyc1RfDm3Wud+fM
	LHWCrF+HlwOajwzviinXeuaFd8ms0AA5GVPQxke1p1aaTFN9fPr2aCc8Rcj7H6ThGS1Bpg9YMudmO
	lcb8to5Y13KZGVXea2yA1hU64V+qaTLrJ/nuUbUqRMdxL7S35s9Q7Nlp3tl9KGwE508CmHG7kTJlQ
	H6Fy/X/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfn1-00000002a1i-1YOl;
	Mon, 23 Jun 2025 11:56:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRv-00000002M9Z-2SoJ;
	Mon, 23 Jun 2025 10:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XXzKRmZ/5hkwGiyeafLz0STNY4HsO+dVFrXy3PpwUbI=; b=GI8A3lvOfitmDytutwyfaGagXp
	msu7PpuqNIxktyon7/TATLlr9ljd3Qyd4nC3HWnrpOyVj/3RkGyA1yBtwet/a/K2hGTWm92rS/PeR
	LUz0JpXi5LXr1LyWTN+vlVuFBr7oSMu8xcJ+BPQ8dgHPxb5dDzZHpZDuT17/i2Af0QamDeKa3CkW5
	k8X3k0qHgXZCPqXWjWt6ditQlrZ4UUTRAif6zn9YuK6vv5nkzuALMhIDa0LpaP3vPxgADTKXTlhgy
	mGSK4hklZfRsuk7nJNtXl2grSAoR5Hv7fAtm+Pn8L0qZpCTat76wLnU9nJmVch65UbM13rD2D5mle
	Jpm87lIg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRs-00000005BXX-3zVO;
	Mon, 23 Jun 2025 10:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750674647;
	bh=WPbiKU4UmisefgWlCdumuilVqbKg0Ayb/7S0PUCT5Bs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jTM+ApzDwLMEEfu6DsS1CwLDy+NPnpdQny9FJ6RRtq/MW0JpQ4AdIkagW13QtHlXd
	 PMp/wYQBLvG/lgSJ2WsyLBabpJni+K6RXd5J0ZzWjB7cU/zSM5+FryvC+T0Llhl61Z
	 ii68YNy3hYOcIp37J7gPLlVRj7z1RN3NLVrWlPlOQFnv346/RCXwNEqWL49lCpbew3
	 T/qbTABK2cJKwouTdVefOuXjTIfK4V+Q4N8wdPD5KXT1LL4xVZudKf1f9bZiMUv4wJ
	 Sg5Sanmgh5SzHglpyLM5CRccMNpkAz6xHUNNke1jq1hLveyie6NSYHXQLSkGi7yDR2
	 QsxuTI0pfBIGw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e046:b666:1d47:e832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4006917E05BD;
	Mon, 23 Jun 2025 12:30:46 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 16/30] clk: mediatek: Add MT8196 pextpsys clock support
Date: Mon, 23 Jun 2025 12:29:26 +0200
Message-Id: <20250623102940.214269-17-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623102940.214269-1-laura.nao@collabora.com>
References: <20250623102940.214269-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_113049_172490_4D49207E 
X-CRM114-Status: GOOD (  15.36  )
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

Add support for the MT8196 pextpsys clock controller, which provides
clock gate control for PCIe.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig            |  7 ++
 drivers/clk/mediatek/Makefile           |  1 +
 drivers/clk/mediatek/clk-mt8196-pextp.c | 95 +++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-pextp.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 848624792a23..cd12e7ff3e12 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1068,6 +1068,13 @@ config COMMON_CLK_MT8196
 	help
 	  This driver supports MediaTek MT8196 basic clocks.
 
+config COMMON_CLK_MT8196_PEXTPSYS
+	tristate "Clock driver for MediaTek MT8196 pextpsys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 pextpsys clocks.
+
 config COMMON_CLK_MT8196_UFSSYS
 	tristate "Clock driver for MediaTek MT8196 ufssys"
 	depends on COMMON_CLK_MT8196
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index ee6a1bb5ce38..21e768f67283 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -163,6 +163,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o \
 				   clk-mt8196-topckgen2.o clk-mt8196-vlpckgen.o \
 				   clk-mt8196-peri_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
diff --git a/drivers/clk/mediatek/clk-mt8196-pextp.c b/drivers/clk/mediatek/clk-mt8196-pextp.c
new file mode 100644
index 000000000000..938100e4836b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-pextp.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ *                    Guangjie Song <guangjie.song@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    Laura Nao <laura.nao@collabora.com>
+ */
+#include <dt-bindings/clock/mediatek,mt8196-clock.h>
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
+static const struct mtk_gate pext_clks[] = {
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_TL, "pext_pm0_tl", "tl", 0),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_REF, "pext_pm0_ref", "clk26m", 1),
+	GATE_PEXT(CLK_PEXT_PEXTP_PHY_P0_MCU_BUS, "pext_pp0_mcu_bus", "clk26m", 6),
+	GATE_PEXT(CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF, "pext_pp0_pextp_ref", "clk26m", 7),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_AXI_250, "pext_pm0_axi_250", "ufs_pexpt0_mem_sub", 12),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_AHB_APB, "pext_pm0_ahb_apb", "ufs_pextp0_axi", 13),
+	GATE_PEXT(CLK_PEXT_PEXTP_MAC_P0_PL_P, "pext_pm0_pl_p", "clk26m", 14),
+	GATE_PEXT(CLK_PEXT_PEXTP_VLP_AO_P0_LP, "pext_pextp_vlp_ao_p0_lp", "clk26m", 19),
+};
+
+static const struct mtk_clk_desc pext_mcd = {
+	.clks = pext_clks,
+	.num_clks = ARRAY_SIZE(pext_clks),
+};
+
+static const struct mtk_gate pext1_clks[] = {
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P1_TL, "pext1_pm1_tl", "tl_p1", 0),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P1_REF, "pext1_pm1_ref", "clk26m", 1),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P2_TL, "pext1_pm2_tl", "tl_p2", 2),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P2_REF, "pext1_pm2_ref", "clk26m", 3),
+	GATE_PEXT(CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS, "pext1_pp1_mcu_bus", "clk26m", 8),
+	GATE_PEXT(CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF, "pext1_pp1_pextp_ref", "clk26m", 9),
+	GATE_PEXT(CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS, "pext1_pp2_mcu_bus", "clk26m", 10),
+	GATE_PEXT(CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF, "pext1_pp2_pextp_ref", "clk26m", 11),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P1_AXI_250, "pext1_pm1_axi_250",
+		   "pextp1_usb_axi", 16),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P1_AHB_APB, "pext1_pm1_ahb_apb",
+		   "pextp1_usb_mem_sub", 17),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P1_PL_P, "pext1_pm1_pl_p", "clk26m", 18),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P2_AXI_250, "pext1_pm2_axi_250",
+		   "pextp1_usb_axi", 19),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P2_AHB_APB, "pext1_pm2_ahb_apb",
+		   "pextp1_usb_mem_sub", 20),
+	GATE_PEXT(CLK_PEXT1_PEXTP_MAC_P2_PL_P, "pext1_pm2_pl_p", "clk26m", 21),
+	GATE_PEXT(CLK_PEXT1_PEXTP_VLP_AO_P1_LP, "pext1_pextp_vlp_ao_p1_lp", "clk26m", 26),
+	GATE_PEXT(CLK_PEXT1_PEXTP_VLP_AO_P2_LP, "pext1_pextp_vlp_ao_p2_lp", "clk26m", 27),
+};
+
+static const struct mtk_clk_desc pext1_mcd = {
+	.clks = pext1_clks,
+	.num_clks = ARRAY_SIZE(pext1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8196_pextp[] = {
+	{ .compatible = "mediatek,mt8196-pextp0cfg-ao", .data = &pext_mcd },
+	{ .compatible = "mediatek,mt8196-pextp1cfg-ao", .data = &pext1_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_pextp);
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
+MODULE_DESCRIPTION("MediaTek MT8196 PCIe transmit phy clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


