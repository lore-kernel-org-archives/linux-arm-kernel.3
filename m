Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5CAE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9mCInXtyMw6Ii8icFjDbFXwLQukobV0UkYxW9aDSMtk=; b=AHSu3uDkfggpdVVd/hF+Lmvl7/
	eprOV5+sDiehAN6w4Y73yVEsP543FNZXKu9UZimXxkIwhRuprxp2KOqEPgRINCQSTMfAh7nJx9pwj
	cgiVt/5ofAd9UdVn/CQAro25R7XQs+GjB7P+9YRSohdMjEdfvOZuiOu/K9w6R417IJb65yWNaV0Bx
	toiJLZQEK90OsX0rzI8Ysna3ZZshGmglgO1QN+GekADpgPbo/5WCEyAnTcHoP8yioIh58+b9SY/1Q
	JIau3XdDtPHjHImp4sEg+xMFr4IIX09WxZ61rlgzMaDi70FomkaXkc2KmkNMLVdiERNI5u6AaqF/y
	eoFAPH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsect-00000009ch4-1CZh;
	Wed, 18 Feb 2026 10:17:47 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsecq-00000009cgT-18Jn;
	Wed, 18 Feb 2026 10:17:45 +0000
Received: from localhost.localdomain (2a02-842B-8136-0001-B865-661d-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 25F6340244;
	Wed, 18 Feb 2026 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771409845;
	bh=UIj7l7+c+Oryy69k5j23cX4NqnuYzH9LjKdMAwbHPXU=;
	h=From:To:Cc:Subject:Date;
	b=KX9YCSzZMzK2IVeM4+7eF93Vv4Uk2sxtI1Qq7uhSYQ2mHQBEcMxkpmZHTQvy6AnSY
	 TXSeJtQgOaNqPi/AKGORxFVD6BPlG3Z/fJFn3br8BV1W95vU3bMgDXn4qyyljvvQ3c
	 cOHcXCKFjC8+0kNxflZgo6k0KSAM+BjaPj3Rnbe4=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] drivers: clk: meson: Add Amlogic T7 fix pll support
Date: Wed, 18 Feb 2026 11:17:06 +0100
Message-ID: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_021744_608506_A91D5256 
X-CRM114-Status: GOOD (  10.97  )
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

Add PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/t7-pll.c | 257 +++++++++++++++++++++++++++++++++++++
 1 file changed, 257 insertions(+)

diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
index 0a622f45fa36..3dd3aca50b7c 100644
--- a/drivers/clk/meson/t7-pll.c
+++ b/drivers/clk/meson/t7-pll.c
@@ -71,6 +71,15 @@
 #define MCLK_PLL_CNTL4		0x10
 #define MCLK_PLL_STS		0x14
 
+#define FPLL_CTRL0		0x00
+#define FPLL_CTRL1		0x04
+#define FPLL_CTRL2		0x08
+#define FPLL_CTRL3		0x0c
+#define FPLL_CTRL4		0x10
+#define FPLL_CTRL5		0x14
+#define FPLL_CTRL6		0x18
+#define FPLL_STS		0x1c
+
 static const struct pll_mult_range t7_media_pll_mult_range = {
 	.min = 125,
 	.max = 250,
@@ -1047,6 +1056,253 @@ static const struct meson_clkc_data t7_mclk_data = {
 	},
 };
 
+static struct clk_regmap t7_fpll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = FPLL_CTRL1,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fpll_dco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fpll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = FPLL_CTRL0,
+		.shift = 16,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fpll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fpll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv2_div = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv2_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv2p5_div = {
+	.mult = 2,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2p5_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fpll.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv2p5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2p5",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv2p5_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv3_div = {
+	.mult = 1,
+	.div = 3,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv3_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv3 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 20,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv3",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv3_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv4_div = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv4_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv4 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 21,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv4",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv4_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv5_div = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv5_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 22,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv5",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv5_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv7_div = {
+	.mult = 1,
+	.div = 7,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv7_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv7 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 23,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv7",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv7_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_hw *t7_fpll_hw_clks[] = {
+	[CLKID_FPLL_DCO]	= &t7_fpll_dco.hw,
+	[CLKID_FPLL]		= &t7_fpll.hw,
+	[CLKID_FDIV2_DIV]	= &t7_fdiv2_div.hw,
+	[CLKID_FDIV2]		= &t7_fdiv2.hw,
+	[CLKID_FDIV2P5_DIV]	= &t7_fdiv2p5_div.hw,
+	[CLKID_FDIV2P5]		= &t7_fdiv2p5.hw,
+	[CLKID_FDIV3_DIV]	= &t7_fdiv3_div.hw,
+	[CLKID_FDIV3]		= &t7_fdiv3.hw,
+	[CLKID_FDIV4_DIV]	= &t7_fdiv4_div.hw,
+	[CLKID_FDIV4]		= &t7_fdiv4.hw,
+	[CLKID_FDIV5_DIV]	= &t7_fdiv5_div.hw,
+	[CLKID_FDIV5]		= &t7_fdiv5.hw,
+	[CLKID_FDIV7_DIV]	= &t7_fdiv7_div.hw,
+	[CLKID_FDIV7]		= &t7_fdiv7.hw,
+};
+
+static const struct meson_clkc_data t7_fpll_data = {
+	.hw_clks = {
+		.hws = t7_fpll_hw_clks,
+		.num = ARRAY_SIZE(t7_fpll_hw_clks),
+	},
+};
+
 static const struct of_device_id t7_pll_clkc_match_table[] = {
 	{ .compatible = "amlogic,t7-gp0-pll",	.data = &t7_gp0_data, },
 	{ .compatible = "amlogic,t7-gp1-pll",	.data = &t7_gp1_data, },
@@ -1055,6 +1311,7 @@ static const struct of_device_id t7_pll_clkc_match_table[] = {
 	{ .compatible = "amlogic,t7-mpll",	.data = &t7_mpll_data, },
 	{ .compatible = "amlogic,t7-hdmi-pll",	.data = &t7_hdmi_data, },
 	{ .compatible = "amlogic,t7-mclk-pll",	.data = &t7_mclk_data, },
+	{ .compatible = "amlogic,t7-fpll",	.data = &t7_fpll_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, t7_pll_clkc_match_table);
-- 
2.49.0


