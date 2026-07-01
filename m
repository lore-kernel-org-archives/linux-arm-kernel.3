Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5929CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaOQ0gXw+fSo/Zw1kG/qItnut778262iiJtDkhtyDSU=; b=Mgvm674DN1bmlfBhZaW4GGWnyt
	HCB0EpUlKkFP/AwxOf4ELVi9UIdlR6G5AFGGQw5A/Hw9gZoemPCQuV+syNERaCbEk2PIlcz1594/D
	Y6ksOOt8bZ4ytcNRfwAr/Qv1m6j9pkWqGuuBU7/wdTLv72N/EppALwvSqcXryMDdGEHWGfejxisQ4
	8SoN/z8EJo8/w6cqGKgzDMPvY4HeVYkKDpZJka7yVTynvQxcr8yRCFVqDlFvT/ep1EzbhV3zfjAMa
	Aik9P0mHUPfPkePi5WFPDTji39PsZ1cCxnSUzDVA4S0bOllDKKkz50DYJrbK2ERX5VtYyBpsHVJso
	ZCJZ4CpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuj6-000000027zf-15WG;
	Wed, 01 Jul 2026 13:11:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuiy-000000027gj-05gO;
	Wed, 01 Jul 2026 13:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782911490;
	bh=zDRp0gc07u7dHssZ9PgMsLDpVBlNq50qtWtj6ChvsG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qug4yfrqHeuTZ7NMqU/K/b52mWLjpSeFGlsD3uA8a2Rb0hi7K9bF8RyW+T3zJ49ea
	 1/fGu3IcB8Bb8OembQEiWefKbO9/SHW0/M7g/Tm4BrWVOVVTjKRbIs8nZDWeMFZK9I
	 ake/urCdImbYegJsO0NgDw11eLxDlP8ciqdsFEHb/MQQ4QieXZRjFziADYdEQvOyiP
	 3RoxG/59t4sCSLRzqxuG72eIheNL8sm4t3lz0k+idWi2QporCRgkPNvJ+eahoQpPH2
	 Kz2HVaNwr+GVHN+DRpwHx/eVlHknrAlNMFQ3jOtNGXlDFccXGmoMEPw8QghcyXjgzL
	 zus5cNMw+73qQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E96FD17E35CD;
	Wed,  1 Jul 2026 15:11:28 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 15:11:14 +0200
Subject: [PATCH 09/15] clk: mediatek: Add MT8189 vlpcfg clock support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-clocks-system-base-v1-9-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Irving-CH Lin <irving-ch.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782911477; l=6481;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=zDRp0gc07u7dHssZ9PgMsLDpVBlNq50qtWtj6ChvsG4=;
 b=FFEgQaeJBSuL/yvRxYAfiepsiufL0NWwJKx/Ei2SERzZ6p/OHRWt7XrYXoI44FyHo+GVYuMQD
 IHpRTRO/qcvDCh+w+hfKPYCwDMF+ObHUj8PB7BGgjtw2q8QfUsnQlfU
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_061132_348853_818AAC3D 
X-CRM114-Status: GOOD (  16.15  )
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

Add support for the MT8189 vlpcfg clock controller,
which provides clock gate control for vlp domain IPs.

Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/Makefile            |   2 +-
 drivers/clk/mediatek/clk-mt8189-vlpcfg.c | 115 +++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+), 1 deletion(-)

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
index 000000000000..81e2d44bd320
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026 MediaTek Inc.
+ *                    Qiqi Wang <qiqi.wang@mediatek.com>
+ *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
+ * Copyright (C) 2026 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
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
+	{ .compatible = "mediatek,mt8189-vlpcfg", .data = &vlpcfg_reg_mcd },
+	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_ao_reg_mcd },
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
+module_platform_driver(clk_mt8189_vlpcfg_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8189 vlpcfg clocks driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0


