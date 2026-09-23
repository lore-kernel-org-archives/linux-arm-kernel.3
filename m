Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F278BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TJem5L7fvBgrw3jX18N931yk0ImTp48oMDaH6EVBC0=; b=1jYLS2Y/Yp78SvHSdS5zPWCy+q
	1tge6heM41oRefv7qi5U+/ttZItj0wW+qlpl/pgN8MHNe+rGVkORcUv/DCVQPZ/EGjQ+H8xyq6Spl
	IJGS+MMAEvR1uJNf3St2EhMl50KIQHGtQNdWnSdALRo0U9N4ErImrcX+QVFDzvOyLfiH0AvDbJ2QK
	AHUEfRINTb8cP/bwYAzq3w6o2Frb73VFX1N3S6ztXnX7ZOwwQNYV0C12+gPcJZ9iC0BkVfTQgpylO
	MEFvwZ4l6hJQI1VXBDNMswj6uk8Pe4Ea7p4rbASV2lhS8wnLxujbpWggBE7Z6SmDXt8DwB/EcIDth
	jsPJ3coA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KxF-000000081aQ-2PhD;
	Wed, 23 Sep 2026 11:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kx0-000000081Oz-1PUM;
	Wed, 23 Sep 2026 11:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2DF444020;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7420EC2BCFA;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790162145;
	bh=9V/M4QuDb1aTEKAcJYylTQN3hv5JlhRhajwreFSaOrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AP128hEAVEZfnKD89oVHKDOlVxOM2sjMKUyKyDCiPZh6q5F7Llj5OqjgmIiSITvth
	 4SnHV3vktJpYDvnzxexU8FSEYipROctIhtrkwntmc0a2L2/SYZW+Uw1jZucgahdzb6
	 nGAr0BQQH7IReZoDb01IaAZpGsdOFJhsr2paNGtOmBSjTDP48wYWqe+fAFVhvK8ebW
	 bvC6HzOGjd9mVz73/ixnsC1L2xFZ2D+JGXWFGqb+4D1d5sViGzrVl111oUfdLcIz1I
	 iDOlXmhMk8IakEjGoOIuvesTtB9+Ytygk8pF/aP7Q2UDK6qqDfv535JZxRzlJolGhH
	 CH5xegmVuJh6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56455C9830B;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 23 Sep 2026 19:14:49 +0800
Subject: [PATCH RFC 3/3] clk: meson: t7: Model PLL pre-divider as a divider
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-meson_refactor_n-v1-3-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
In-Reply-To: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790162143; l=10156;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=YqMo5icc69xckYBk4DLB/d4LRHXA7luoRj0+rYDAwok=;
 b=qvttVB6Wt2KwUtggaJdYIPBILVXCd2fyS/FGTvSDgbP/I6xP6IGz7a/ozA7UWV+8gM4OTCg+q
 +TAW7V5swB1Al3I4plkBLDEFqJ7bqjSEhE/oOn/o40mkh1IU/gxtdqw
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

Replace the dedicated PLL pre-divider with a standalone
divider clock. The PLL DCO now takes the pre-divider clock
as its parent instead of the input clock directly.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/t7-pll.c | 183 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 141 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
index 0a622f45fa36..049f0c879c45 100644
--- a/drivers/clk/meson/t7-pll.c
+++ b/drivers/clk/meson/t7-pll.c
@@ -71,6 +71,34 @@
 #define MCLK_PLL_CNTL4		0x10
 #define MCLK_PLL_STS		0x14
 
+static const struct clk_div_table t7_prediv_div_table[] = {
+	{ .val = 1, .div = 1 },
+	{ /* sentinel */ }
+};
+
+static struct clk_regmap t7_gp0_prediv = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = GP0PLL_CTRL0,
+		.shift = 10,
+		.width = 5,
+		.table = t7_prediv_div_table,
+		/*
+		 * The hardware reset value is 0. Allow it during clock registration
+		 * to avoid a warning from the common divider code.
+		 * set_rate() will program the valid divider value (1).
+		 */
+		.flags = CLK_DIVIDER_ALLOW_ZERO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_prediv",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "in0",
+		},
+		.num_parents = 1,
+	},
+};
+
 static const struct pll_mult_range t7_media_pll_mult_range = {
 	.min = 125,
 	.max = 250,
@@ -97,11 +125,6 @@ static struct clk_regmap t7_gp0_pll_dco = {
 			.shift   = 0,
 			.width   = 8,
 		},
-		.n = {
-			.reg_off = GP0PLL_CTRL0,
-			.shift   = 10,
-			.width   = 5,
-		},
 		.l = {
 			.reg_off = GP0PLL_STS,
 			.shift   = 31,
@@ -119,8 +142,8 @@ static struct clk_regmap t7_gp0_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "in0",
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_gp0_prediv.hw
 		},
 		.num_parents = 1,
 	},
@@ -159,6 +182,25 @@ static const struct reg_sequence t7_gp1_init_regs[] = {
 	{ .reg = GP1PLL_CTRL3,  .def = 0x00000000 },
 };
 
+static struct clk_regmap t7_gp1_prediv = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = GP1PLL_CTRL0,
+		.shift = 16,
+		.width = 5,
+		.table = t7_prediv_div_table,
+		/* Same rationale as gp0_prediv. */
+		.flags = CLK_DIVIDER_ALLOW_ZERO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp1_prediv",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "in0",
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap t7_gp1_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -171,11 +213,6 @@ static struct clk_regmap t7_gp1_pll_dco = {
 			.shift   = 0,
 			.width   = 8,
 		},
-		.n = {
-			.reg_off = GP1PLL_CTRL0,
-			.shift   = 16,
-			.width   = 5,
-		},
 		.l = {
 			.reg_off = GP1PLL_STS,
 			.shift   = 31,
@@ -193,8 +230,8 @@ static struct clk_regmap t7_gp1_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gp1_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "in0",
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_gp1_prediv.hw
 		},
 		.num_parents = 1,
 	},
@@ -227,6 +264,25 @@ static const struct reg_sequence t7_hifi_init_regs[] = {
 	{ .reg = HIFIPLL_CTRL6, .def = 0x56540000 }
 };
 
+static struct clk_regmap t7_hifi_prediv = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HIFIPLL_CTRL0,
+		.shift = 10,
+		.width = 5,
+		.table = t7_prediv_div_table,
+		/* Same rationale as gp0_prediv. */
+		.flags = CLK_DIVIDER_ALLOW_ZERO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi_prediv",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "in0",
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap t7_hifi_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -239,11 +295,6 @@ static struct clk_regmap t7_hifi_pll_dco = {
 			.shift   = 0,
 			.width   = 8,
 		},
-		.n = {
-			.reg_off = HIFIPLL_CTRL0,
-			.shift   = 10,
-			.width   = 5,
-		},
 		.frac = {
 			.reg_off = HIFIPLL_CTRL1,
 			.shift   = 0,
@@ -267,8 +318,8 @@ static struct clk_regmap t7_hifi_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "in0",
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_hifi_prediv.hw
 		},
 		.num_parents = 1,
 	},
@@ -312,6 +363,25 @@ static const struct reg_sequence t7_pcie_pll_init_regs[] = {
 	{ .reg = PCIEPLL_CTRL2,	.def = 0x00001000 }
 };
 
+static struct clk_regmap t7_pcie_prediv = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = PCIEPLL_CTRL0,
+		.shift = 10,
+		.width = 5,
+		.table = t7_prediv_div_table,
+		/* Same rationale as gp0_prediv. */
+		.flags = CLK_DIVIDER_ALLOW_ZERO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "pcie_prediv",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "in0",
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap t7_pcie_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -324,11 +394,6 @@ static struct clk_regmap t7_pcie_pll_dco = {
 			.shift   = 0,
 			.width   = 8,
 		},
-		.n = {
-			.reg_off = PCIEPLL_CTRL0,
-			.shift   = 10,
-			.width   = 5,
-		},
 		.l = {
 			.reg_off = PCIEPLL_CTRL0,
 			.shift   = 31,
@@ -345,8 +410,8 @@ static struct clk_regmap t7_pcie_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_pll_dco",
 		.ops = &meson_clk_pcie_pll_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "in0",
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_pcie_prediv.hw
 		},
 		.num_parents = 1,
 	},
@@ -633,6 +698,25 @@ static const struct reg_sequence t7_hdmi_init_regs[] = {
 	{ .reg = HDMIPLL_CTRL6, .def = 0x56540000 }
 };
 
+static struct clk_regmap t7_hdmi_prediv = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HDMIPLL_CTRL0,
+		.shift = 10,
+		.width = 5,
+		.table = t7_prediv_div_table,
+		/* Same rationale as gp0_prediv. */
+		.flags = CLK_DIVIDER_ALLOW_ZERO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_prediv",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "in0",
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap t7_hdmi_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -645,11 +729,6 @@ static struct clk_regmap t7_hdmi_pll_dco = {
 			.shift   = 0,
 			.width   = 9,
 		},
-		.n = {
-			.reg_off = HDMIPLL_CTRL0,
-			.shift   = 10,
-			.width   = 5,
-		},
 		.l = {
 			.reg_off = HDMIPLL_CTRL0,
 			.shift   = 31,
@@ -667,8 +746,8 @@ static struct clk_regmap t7_hdmi_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "in0", }
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_hdmi_prediv.hw
 		},
 		.num_parents = 1,
 	},
@@ -722,6 +801,25 @@ static const struct reg_sequence t7_mclk_init_regs[] = {
 	{ .reg = MCLK_PLL_CNTL4, .def = 0x00180303 },
 };
 
+static struct clk_regmap t7_mclk_prediv = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = MCLK_PLL_CNTL0,
+		.shift = 16,
+		.width = 5,
+		.table = t7_prediv_div_table,
+		/* Same rationale as gp0_prediv. */
+		.flags = CLK_DIVIDER_ALLOW_ZERO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "mclk_prediv",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "in0",
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap t7_mclk_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -734,11 +832,6 @@ static struct clk_regmap t7_mclk_pll_dco = {
 			.shift   = 0,
 			.width   = 8,
 		},
-		.n = {
-			.reg_off = MCLK_PLL_CNTL0,
-			.shift   = 16,
-			.width   = 5,
-		},
 		.l = {
 			.reg_off = MCLK_PLL_CNTL0,
 			.shift   = 31,
@@ -761,8 +854,8 @@ static struct clk_regmap t7_mclk_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mclk_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "in0",
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_mclk_prediv.hw
 		},
 		.num_parents = 1,
 	},
@@ -939,21 +1032,25 @@ static struct clk_regmap t7_mclk_1 = {
 };
 
 static struct clk_hw *t7_gp0_hw_clks[] = {
+	[CLKID_GP0_PREDIV]		= &t7_gp0_prediv.hw,
 	[CLKID_GP0_PLL_DCO]		= &t7_gp0_pll_dco.hw,
 	[CLKID_GP0_PLL]			= &t7_gp0_pll.hw,
 };
 
 static struct clk_hw *t7_gp1_hw_clks[] = {
+	[CLKID_GP1_PREDIV]		= &t7_gp1_prediv.hw,
 	[CLKID_GP1_PLL_DCO]		= &t7_gp1_pll_dco.hw,
 	[CLKID_GP1_PLL]			= &t7_gp1_pll.hw,
 };
 
 static struct clk_hw *t7_hifi_hw_clks[] = {
+	[CLKID_HIFI_PREDIV]		= &t7_hifi_prediv.hw,
 	[CLKID_HIFI_PLL_DCO]		= &t7_hifi_pll_dco.hw,
 	[CLKID_HIFI_PLL]		= &t7_hifi_pll.hw,
 };
 
 static struct clk_hw *t7_pcie_hw_clks[] = {
+	[CLKID_PCIE_PREDIV]		= &t7_pcie_prediv.hw,
 	[CLKID_PCIE_PLL_DCO]		= &t7_pcie_pll_dco.hw,
 	[CLKID_PCIE_PLL_DCO_DIV2]	= &t7_pcie_pll_dco_div2.hw,
 	[CLKID_PCIE_PLL_OD]		= &t7_pcie_pll_od.hw,
@@ -973,12 +1070,14 @@ static struct clk_hw *t7_mpll_hw_clks[] = {
 };
 
 static struct clk_hw *t7_hdmi_hw_clks[] = {
+	[CLKID_HDMI_PREDIV]		= &t7_hdmi_prediv.hw,
 	[CLKID_HDMI_PLL_DCO]		= &t7_hdmi_pll_dco.hw,
 	[CLKID_HDMI_PLL_OD]		= &t7_hdmi_pll_od.hw,
 	[CLKID_HDMI_PLL]		= &t7_hdmi_pll.hw,
 };
 
 static struct clk_hw *t7_mclk_hw_clks[] = {
+	[CLKID_MCLK_PREDIV]		= &t7_mclk_prediv.hw,
 	[CLKID_MCLK_PLL_DCO]		= &t7_mclk_pll_dco.hw,
 	[CLKID_MCLK_PRE]		= &t7_mclk_pre_od.hw,
 	[CLKID_MCLK_PLL]		= &t7_mclk_pll.hw,

-- 
2.47.1



