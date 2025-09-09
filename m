Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DB4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfNUAxkNsuuAN03GM3tZzXL3YoU+fCY73Ujv3LJ2G+g=; b=XAeX/7hBAMkmTsn7mQkBwVvmXb
	C0QGXh2mhHAPg2lB5xd6xu+FYhKgY7g3UASsCMhd8ZNef4l5ERvkKqOVRM/P4IV587iXzF8MFxcI/
	Si4FA/UNCTtgLTTZGcloYzTEnuabSYsJEf3ys+JsQErG46qX0ufNZoBXWJJCYAjW0fPLy27+fE85d
	xrUD/UbuLruIzEQtTdWvnenGR3PGP+SxRX81UVwzxDTGTm5lNJzHznrSLkrZHFfdPpA68UfKyC1Mb
	euy/Qblsy0TYAnN5gE9ijdlsIB4jDtYyDpnG7Rn+Cm36r2RRcF1Krmd+8UurAOGdNvp3Ke+woX2ub
	tPmC0q8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuj4-000000060Ez-1Xtw;
	Tue, 09 Sep 2025 09:33:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsnL-00000005AMC-0Z3x;
	Tue, 09 Sep 2025 07:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5624044CA1;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D885C4CEF5;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402978;
	bh=eOXxHeTvjKv0CA0uVr+x06ld7tUBMbROfdkDUJSVBdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DyCQOyQdgsfjremiekroOGSRGrhElKd4Eb+dOYVWHJWksUVENk5Ls1We+oiFf322A
	 OcJWAT2wpMuQ04inVppIlnVKFalJ/Xidfb6VSep6jLzQeMgCSYOIbN6ctQNRY0SIhw
	 4RDPbPkDx4G3OANvQ+4h46J4TTmRCFTAQ9QmbcdcLDhfxRmmPzstOJrkSGDon5TLse
	 rgepuBQrDXVHdt+5DmoIyotRLZzx8Pz77QuuMafDWjhFrLbyx3JiGoTucM81M/zPny
	 7aFHJcallOiobwa9E6TorH2VjK4bBOtFgoM1NViGjG2/w2ReEHaRY9vLNcSQ+xDiLA
	 pKY2KMB5FCQpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B13CCAC58C;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 09 Sep 2025 15:29:12 +0800
Subject: [PATCH v4 2/2] clk: amlogic: add video-related clocks for S4 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com>
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
In-Reply-To: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757402973; l=7142;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=hxUpNyutlY08PsI4fM0HrJ0LK2pJdLtd3LRl8Z/JKsE=;
 b=piwS9s3BANi/UZtaoaH1gL63mepZecjIs8aHH2ZVulh6L1UjpvphHMnahn9RD2L5IdzFjEE8R
 dX40+D+rm0PDe1Lc1vgs0FK/In/kobGJO5Z4b7rNF2DMHEKHKNXFz9z
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002939_234991_AEB4BCD1 
X-CRM114-Status: GOOD (  12.13  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add video encoder, demodulator and CVBS clocks.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/s4-peripherals.c | 203 +++++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 6d69b132d1e1..b855e8f1fc04 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -44,6 +44,7 @@
 #define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
 #define CLKCTRL_VAPBCLK_CTRL                       0x0fc
 #define CLKCTRL_HDCP22_CTRL                        0x100
+#define CLKCTRL_CDAC_CLK_CTRL                      0x108
 #define CLKCTRL_VDEC_CLK_CTRL                      0x140
 #define CLKCTRL_VDEC2_CLK_CTRL                     0x144
 #define CLKCTRL_VDEC3_CLK_CTRL                     0x148
@@ -1126,6 +1127,22 @@ static struct clk_regmap s4_cts_encp_sel = {
 	},
 };
 
+static struct clk_regmap s4_cts_encl_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = CLKCTRL_VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 12,
+		.table = s4_cts_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_encl_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = s4_cts_parents,
+		.num_parents = ARRAY_SIZE(s4_cts_parents),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_regmap s4_cts_vdac_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VIID_CLK_DIV,
@@ -1205,6 +1222,22 @@ static struct clk_regmap s4_cts_encp = {
 	},
 };
 
+static struct clk_regmap s4_cts_encl = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = CLKCTRL_VID_CLK_CTRL2,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_encl",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_cts_encl_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_regmap s4_cts_vdac = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_VID_CLK_CTRL2,
@@ -2735,6 +2768,165 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
+/* CVBS DAC */
+static struct clk_regmap s4_cdac_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = CLKCTRL_CDAC_CLK_CTRL,
+		.mask = 0x3,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cdac_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .fw_name = "fclk_div5" },
+		},
+		.num_parents = 2,
+	},
+};
+
+static struct clk_regmap s4_cdac_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = CLKCTRL_CDAC_CLK_CTRL,
+		.shift = 0,
+		.width = 16,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cdac_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_cdac_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s4_cdac = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = CLKCTRL_CDAC_CLK_CTRL,
+		.bit_idx = 20,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cdac",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_cdac_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s4_demod_core_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = CLKCTRL_DEMOD_CLK_CTRL,
+		.mask = 0x3,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "demod_core_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal" },
+			{ .fw_name = "fclk_div7" },
+			{ .fw_name = "fclk_div4" }
+		},
+		.num_parents = 3,
+	},
+};
+
+static struct clk_regmap s4_demod_core_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = CLKCTRL_DEMOD_CLK_CTRL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "demod_core_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_demod_core_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s4_demod_core = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = CLKCTRL_DEMOD_CLK_CTRL,
+		.bit_idx = 8
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "demod_core",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_demod_core_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/* CVBS ADC */
+static struct clk_regmap s4_adc_extclk_in_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = CLKCTRL_DEMOD_CLK_CTRL,
+		.mask = 0x7,
+		.shift = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "adc_extclk_in_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal" },
+			{ .fw_name = "fclk_div4" },
+			{ .fw_name = "fclk_div3" },
+			{ .fw_name = "fclk_div5" },
+			{ .fw_name = "fclk_div7" },
+			{ .fw_name = "mpll2" },
+			{ .fw_name = "gp0_pll" },
+			{ .fw_name = "hifi_pll" }
+		},
+		.num_parents = 8,
+	},
+};
+
+static struct clk_regmap s4_adc_extclk_in_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = CLKCTRL_DEMOD_CLK_CTRL,
+		.shift = 16,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "adc_extclk_in_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_adc_extclk_in_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s4_adc_extclk_in = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = CLKCTRL_DEMOD_CLK_CTRL,
+		.bit_idx = 24
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "adc_extclk_in",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_adc_extclk_in_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
 
 #define S4_PCLK(_name, _reg, _bit, _flags) \
@@ -3028,6 +3220,17 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
 	[CLKID_HDCP22_SKPCLK_SEL]	= &s4_hdcp22_skpclk_sel.hw,
 	[CLKID_HDCP22_SKPCLK_DIV]	= &s4_hdcp22_skpclk_div.hw,
 	[CLKID_HDCP22_SKPCLK]		= &s4_hdcp22_skpclk.hw,
+	[CLKID_CTS_ENCL_SEL]		= &s4_cts_encl_sel.hw,
+	[CLKID_CTS_ENCL]		= &s4_cts_encl.hw,
+	[CLKID_CDAC_SEL]		= &s4_cdac_sel.hw,
+	[CLKID_CDAC_DIV]		= &s4_cdac_div.hw,
+	[CLKID_CDAC]			= &s4_cdac.hw,
+	[CLKID_DEMOD_CORE_SEL]		= &s4_demod_core_sel.hw,
+	[CLKID_DEMOD_CORE_DIV]		= &s4_demod_core_div.hw,
+	[CLKID_DEMOD_CORE]		= &s4_demod_core.hw,
+	[CLKID_ADC_EXTCLK_IN_SEL]	= &s4_adc_extclk_in_sel.hw,
+	[CLKID_ADC_EXTCLK_IN_DIV]	= &s4_adc_extclk_in_div.hw,
+	[CLKID_ADC_EXTCLK_IN]		= &s4_adc_extclk_in.hw,
 };
 
 static const struct meson_clkc_data s4_peripherals_clkc_data = {

-- 
2.42.0



