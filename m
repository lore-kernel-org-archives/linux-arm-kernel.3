Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2165C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUzZZKdRA/nrtwrVMsRSl600s/LtFe+i4gqc1g40AFI=; b=cjxaO842aCPFUYcwBDjSD1gDAg
	w+A3i2nyKP01hA/Z2EN7j56ZTfmLrUTlDyDAssdVw7zUco1YO600WTmktHy/+n51JjsL0cwExaX/2
	8yDf0WgI7zV3AXIN3iXipJuYcUTZ8+flgKDVXxqqWHI16taIcsDKT9+5ch9RYK+xs9Lqo1/wQvW/2
	U2nFbE5Dq7d7zaAaux0iVQodwAnyjYz1V1YFq02uFN2ZPavUafUybb31W7kGvARrp/kmwgcjfVEcH
	pVxSUMDZe+2Y7hYjkcEMBvUIrweQIlcCI15h3DGOVlunVzAC/KvVFWK4cUSWZyektSnJepD4/8BXm
	Qyx9V5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSHL-00000008mjE-2Sjf;
	Wed, 26 Mar 2025 15:02:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvP-00000008iWG-4B5s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso47708115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000010; x=1743604810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUzZZKdRA/nrtwrVMsRSl600s/LtFe+i4gqc1g40AFI=;
        b=N3rY9tMSfUH2AG54PG1EGkB4C2lZXQqmZnmdgmSZxFaxHpFhNeJJSsvEPl34sT7XO2
         iz5cA7kA+UAqjb3kxgemVvp/uA+by29zNY1B7nCxr9AYt9Cw01d9ImPJetwzN9V8/C3z
         PYfh5D8gvCzOQNcwGjCiBZ2mwWkzDwjOuaFMjfV4yhebjB/+3iM7eEcdfJQ4HYtr0fv4
         TldZj2K1ppRwtWpE5kJvcZ5v6jVd8ua3SRRgMdnTdNiggBOztm/aJLGRJwmYYQ9QyCaq
         yBPYM4M6jiI/2kjNxDh0fZQOWTG7LsH4dobMvb1rJ6sLl17WaG4IYn1ZopYTXOWlo+B1
         GSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000010; x=1743604810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUzZZKdRA/nrtwrVMsRSl600s/LtFe+i4gqc1g40AFI=;
        b=fShlQw0HYRDl5/K8OXra47Xx6p2mCcvd52YN6In+8K71164h5O8zEoN62o3wcmZ4Ii
         vkv66mMp3jhnpKSb+lhYm/+43SBfcAFohTf6UQh/rkD58gWPqNWSqYU4ml2P4DPO/B1K
         oNjxmUhrNMx1T+DWPVyo2ZqG8Gh1SXR4DzamdbYUBjyys68TBMt+N0lRPmdezmfD7tLf
         oq47jY5p8ZDy+2bM49tcy0Gs0wEiHVfWjJOGtke8KmW5r2lKutBWGVZhzpPkWA2a5nIA
         GzjEGmcUg6QWn11DyqcH5G1+x13NM+PJwXvGGfRX2XHkyLjEksllhgaxemRr1TswbnVt
         Z0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVVIG/2OZP7mpxtQR9Ph5mWfSbgnv5mBJGxSTnbb0G66Fw1aMvy4PRZoFoktGf0Pu+QLmQmm3Hs0SWeQq/tRG0X@lists.infradead.org
X-Gm-Message-State: AOJu0YzmT9GoKgbuDRu1t0CDmO8WAo8jAd9aXyG2cDKzP5iVfb2cPHZu
	pkmOCQPH/hb8fAXO0NEiLVC0SLuby1N96kIgT3SbZomhLPpxz0ra
X-Gm-Gg: ASbGncu+Baq8v0IB/6BNPf5IBYmWOO74ltpT9NaxRzenzKVuoNDsMw/X/uJ6KlYQDim
	56AqP9BVNta8PTA/tumhfFjeMyKW4gZIr8mCa381DEQlYEQjkHIrs1SzVc1UiRiS20gASfyGWP0
	wgQ0vlDn2Klo5ehZamyqMLtJIe+rxcFLe4MdOT4Pz38RnTXVNItQ8kSeQfh5STdFVWosANkmhuD
	WLig4ljR5QBbBy6Qs55yC2ZLpepNO7+E6EJ6+bceJm0IOvRh66+UcrNyFEdwgDkRy7hl5Wl5AhJ
	S9DRZyYLoLrt57pvgmlKzOvzmoj45eYA1PELuw3U2a5+8a1exLcoHn0lth3GZiK9qgra
X-Google-Smtp-Source: AGHT+IFEK+jlhPNvUrwlDVkGSbJqrzn40ggqtTSLr7IlAExJnoyHZvyqsCwFub0v2F1dz21J46ontg==
X-Received: by 2002:a05:6000:2cd:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-3997f92d09bmr17718923f8f.42.1743000010107;
        Wed, 26 Mar 2025 07:40:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 10/15] clk: renesas: rzv2h: Add support for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:40 +0000
Message-ID: <20250326143945.82142-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074012_039644_3C59CD88 
X-CRM114-Status: GOOD (  21.07  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The clock structure for RZ/V2N is almost identical to RZ/V2H(P) SoC
with less IP blocks compared to RZ/V2H(P). For eg: CRU2/3 are present
only on the RZ/V2H(P) SoC.

Add minimal clock and reset entries required to boot the Renesas
RZ/V2N EVK and binds it with the RZ/V2H CPG family driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig         |   5 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g056-cpg.c | 152 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |   6 ++
 drivers/clk/renesas/rzv2h-cpg.h     |   1 +
 5 files changed, 165 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 5a4bc3f94d49..50c20119d12a 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -41,6 +41,7 @@ config CLK_RENESAS
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G047 if ARCH_R9A09G047
+	select CLK_R9A09G056 if ARCH_R9A09G056
 	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_SH73A0 if ARCH_SH73A0
 
@@ -199,6 +200,10 @@ config CLK_R9A09G047
        bool "RZ/G3E clock support" if COMPILE_TEST
        select CLK_RZV2H
 
+config CLK_R9A09G056
+       bool "RZ/V2N clock support" if COMPILE_TEST
+       select CLK_RZV2H
+
 config CLK_R9A09G057
        bool "RZ/V2H(P) clock support" if COMPILE_TEST
        select CLK_RZV2H
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 2d6e746939c4..f9075bca6e95 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
+obj-$(CONFIG_CLK_R9A09G056)		+= r9a09g056-cpg.o
 obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
new file mode 100644
index 000000000000..e2712a25c43a
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2N CPG driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/renesas,r9a09g056-cpg.h>
+
+#include "rzv2h-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A09G056_GBETH_1_CLK_PTP_REF_I,
+
+	/* External Input Clocks */
+	CLK_AUDIO_EXTAL,
+	CLK_RTXIN,
+	CLK_QEXTAL,
+
+	/* PLL Clocks */
+	CLK_PLLCM33,
+	CLK_PLLCLN,
+	CLK_PLLDTY,
+	CLK_PLLCA55,
+
+	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV16,
+	CLK_PLLCLN_DIV2,
+	CLK_PLLCLN_DIV8,
+	CLK_PLLDTY_ACPU,
+	CLK_PLLDTY_ACPU_DIV4,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct clk_div_table dtable_1_8[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
+static const struct clk_div_table dtable_2_64[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{3, 16},
+	{4, 64},
+	{0, 0},
+};
+
+static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
+	DEF_INPUT("rtxin", CLK_RTXIN),
+	DEF_INPUT("qextal", CLK_QEXTAL),
+
+	/* PLL Clocks */
+	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+
+	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
+	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
+
+	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+
+	/* Core Clocks */
+	DEF_FIXED("sys_0_pclk", R9A09G056_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
+	DEF_DDIV("ca55_0_coreclk0", R9A09G056_CA55_0_CORE_CLK0, CLK_PLLCA55,
+		 CDDIV1_DIVCTL0, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk1", R9A09G056_CA55_0_CORE_CLK1, CLK_PLLCA55,
+		 CDDIV1_DIVCTL1, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk2", R9A09G056_CA55_0_CORE_CLK2, CLK_PLLCA55,
+		 CDDIV1_DIVCTL2, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk3", R9A09G056_CA55_0_CORE_CLK3, CLK_PLLCA55,
+		 CDDIV1_DIVCTL3, dtable_1_8),
+	DEF_FIXED("iotop_0_shclk", R9A09G056_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+};
+
+static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
+	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
+						BUS_MSTOP(3, BIT(5))),
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
+						BUS_MSTOP(3, BIT(14))),
+	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
+						BUS_MSTOP(8, BIT(4))),
+};
+
+static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
+	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
+	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
+	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
+	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
+	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+};
+
+const struct rzv2h_cpg_info r9a09g056_cpg_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r9a09g056_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g056_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r9a09g056_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g056_mod_clks),
+	.num_hw_mod_clks = 25 * 16,
+
+	/* Resets */
+	.resets = r9a09g056_resets,
+	.num_resets = ARRAY_SIZE(r9a09g056_resets),
+
+	.num_mstop_bits = 192,
+};
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 88ab26a077ae..34a3145d72eb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1373,6 +1373,12 @@ static const struct of_device_id rzv2h_cpg_match[] = {
 		.data = &r9a09g047_cpg_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R9A09G056
+	{
+		.compatible = "renesas,r9a09g056-cpg",
+		.data = &r9a09g056_cpg_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R9A09G057
 	{
 		.compatible = "renesas,r9a09g057-cpg",
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index a7aa1da181e5..8a2466f10deb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -326,6 +326,7 @@ struct rzv2h_cpg_info {
 };
 
 extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
+extern const struct rzv2h_cpg_info r9a09g056_cpg_info;
 extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
 
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.49.0


