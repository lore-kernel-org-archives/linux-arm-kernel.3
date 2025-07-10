Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28B5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxfauICdUugkNE7FToZHBUy4gYY8OxiV4x9yqc1lMpE=; b=EONyNAX736A+xnOBooxcmMEyos
	0YbSEbOIR4zc1a+58f+RantoqJOzebuupGkbyBZNqQD9360Cm4w8lIAryAfQgIkMRDmYTAvEIS5tP
	WebaXMixAXz33vo1f3rjnjww8zEQE1kM26DE4lJbKhr22CCHR+VnucWtsoJwQR9d43MvdSdV0zDns
	Wp1VwGl7J9zHIw3G6FxHUNe2SDF4kAJ9IFBbbJdYqBl8XdMutsmToJRoVQqUBS4z6ITaVeKIf8VPh
	quLyjQ8MAviN00VcYFu/yiiZm/t88+gK2bky/KUuyYeRusZyHHbQUUz6WivnNNGW9UsHj/oDWvcQE
	W3oEUGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzbk-0000000D90A-31Do;
	Thu, 10 Jul 2025 22:19:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYn-0000000Ct4Y-2UOH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KxfauICdUugkNE7FToZHBUy4gYY8OxiV4x9yqc1lMpE=; b=liF82+uEYceZHa8f9wOhI/oqNt
	ifPUKg4Q7b7dyxlq39EI9Au972uybuMe2rEQ5hQtpRzWgBOEv2vwKrtfslqSoT6fsWs/XssWTferI
	9iWRa47E0ZfIcrmFNbDeepnqcMSLYqu/Nsd24Zic467AhTBZRjO2KtGONV0QOdRUCqxUXiELLX+nN
	c9WW6LrFazlLXXDXiS8LmI5et6bgjj6+BN6Su7Te8ul3Eu/MMd60FyfsHr1kvTw3d2j3Anca00KZS
	O3o9cXLldBXNlxxH6Uq1I0x5BjMsTkQcHjkGCKIKyPUujFqlz8Wn3Du44Z5VKyvD3HBWwxTrTrMLc
	TIuAscCw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYj-000000098p4-2IDq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178077; x=1783714077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z0TDK4z2qLFTFK3rDE5YH+zmBThIKQJQpe3KbvS0/xc=;
  b=iuSJRxZuW0F4XZ2hXzTRPbd01OKctbL93nP/0RvQhdUqA2VP2bdKTB98
   rAuVPwh10MjzX8tDwLWszz12N55+NyITGpp+OQ61A0ZZW4Q8CCO+/4XoZ
   lJ5c8MUIR9f7Xb2ipc475zFidOPrs5zfGwgjfNwAgXAjiFaeI2yrUQrNv
   +Nsv3RIwQhnEqsCx40x+A0Rjm9dEB1ppdw5rbb7p+89An/iRe/OY3YFh6
   TZAUYqBXLGLgGDqFyOZM8WwLvTu3uIDh3feLywF5160jue+XwM2CoF9VP
   /+4MZv9rVb330W5yGDAwiiVpQXau+4gSjGcjMlMFu7ycKZpX/tPHdKmiL
   g==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: /3H9VE9lSUaNKaW5iDl8DA==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448159"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:30 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:30 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
Subject: [PATCH v3 04/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
Date: Thu, 10 Jul 2025 13:06:57 -0700
Message-ID: <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210758_217976_42FB7B9C 
X-CRM114-Status: GOOD (  18.02  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Use struct clk_parent_data instead of struct parent_hw as this leads
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures. As clk-sam9x60-pll need to know
parent's rate at initialization we pass it now from SoC specific drivers.
This will lead in the end at removing __clk_get_hw() in SoC specific
drivers (that will be solved by subsequent commits).

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
 drivers/clk/at91/pmc.h             |  5 +++--
 drivers/clk/at91/sam9x60.c         |  8 +++++---
 drivers/clk/at91/sam9x7.c          | 17 ++++++++++++-----
 drivers/clk/at91/sama7d65.c        | 16 +++++++++++-----
 drivers/clk/at91/sama7g5.c         | 17 ++++++++++++-----
 6 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index cefd9948e103..03a7d00dcc6d 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
 
 struct clk_hw * __init
 sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
-			      const char *name, const char *parent_name,
-			      struct clk_hw *parent_hw, u8 id,
+			      const char *name, const struct clk_parent_data *parent_data,
+			      unsigned long parent_rate, u8 id,
 			      const struct clk_pll_characteristics *characteristics,
 			      const struct clk_pll_layout *layout, u32 flags)
 {
 	struct sam9x60_frac *frac;
 	struct clk_hw *hw;
 	struct clk_init_data init = {};
-	unsigned long parent_rate, irqflags;
+	unsigned long irqflags;
 	unsigned int val;
 	int ret;
 
-	if (id > PLL_MAX_ID || !lock || !parent_hw)
+	if (id > PLL_MAX_ID || !lock || !parent_data)
 		return ERR_PTR(-EINVAL);
 
 	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
@@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	if (parent_name)
-		init.parent_names = &parent_name;
-	else
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	init.parent_data = (const struct clk_parent_data *)parent_data;
 	init.num_parents = 1;
 	if (flags & CLK_SET_RATE_GATE)
 		init.ops = &sam9x60_frac_pll_ops;
@@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 		 * its rate leading to enabling this PLL with unsupported
 		 * rate. This will lead to PLL not being locked at all.
 		 */
-		parent_rate = clk_hw_get_rate(parent_hw);
 		if (!parent_rate) {
 			hw = ERR_PTR(-EINVAL);
 			goto free;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 63d4c425bed5..b43f6652417f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
-			      const char *name, const char *parent_name,
-			      struct clk_hw *parent_hw, u8 id,
+			      const char *name,
+			      const struct clk_parent_data *parent_data,
+			      unsigned long parent_rate, u8 id,
 			      const struct clk_pll_characteristics *characteristics,
 			      const struct clk_pll_layout *layout, u32 flags);
 
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index db6db9e2073e..fd53e54abf88 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -240,7 +240,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc->chws[PMC_MAIN] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
-					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
+					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
+					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
 					   0, &plla_characteristics,
 					   &pll_frac_layout,
 					   /*
@@ -266,8 +267,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc->chws[PMC_PLLACK] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
-					   "main_osc", main_osc_hw, 1,
-					   &upll_characteristics,
+					   &AT91_CLK_PD_HW(main_osc_hw),
+					   clk_hw_get_rate(main_osc_hw),
+					   1, &upll_characteristics,
 					   &pll_frac_layout, CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 31184e11165a..edd5fd3a1fa5 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -739,6 +739,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 {
 	struct clk_range range = CLK_RANGE(0, 0);
 	const char *main_xtal_name = "main_xtal";
+	u8 main_xtal_index = 2;
 	struct pmc_data *sam9x7_pmc;
 	const char *parent_names[9];
 	void **clk_mux_buffer = NULL;
@@ -795,7 +796,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate = 0;
 
 			if (!sam9x7_plls[i][j].n)
 				continue;
@@ -804,21 +805,27 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sam9x7_plls[i][j].p) {
 				case SAM9X7_PLL_PARENT_MAINCK:
-					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck", -1);
+					hw = sam9x7_pmc->chws[PMC_MAIN];
 					break;
 				case SAM9X7_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
+								       main_xtal_index);
+					hw = main_xtal_hw;
 					break;
 				default:
 					/* Should not happen. */
-					parent_hw = NULL;
 					break;
 				}
 
+				parent_rate = clk_hw_get_rate(hw);
+				if (!parent_rate)
+					return;
+
 				hw = sam9x60_clk_register_frac_pll(regmap,
 								   &pmc_pll_lock,
 								   sam9x7_plls[i][j].n,
-								   NULL, parent_hw, i,
+								   &parent_data, parent_rate, i,
 								   sam9x7_plls[i][j].c,
 								   sam9x7_plls[i][j].l,
 								   sam9x7_plls[i][j].f);
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index b74813a288a8..17725c175d3b 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1090,6 +1090,7 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
 static void __init sama7d65_pmc_setup(struct device_node *np)
 {
 	const char *main_xtal_name = "main_xtal";
+	u8 main_xtal_index = 2;
 	struct pmc_data *sama7d65_pmc;
 	const char *parent_names[11];
 	void **alloc_mem = NULL;
@@ -1150,7 +1151,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate = 0;
 
 			if (!sama7d65_plls[i][j].n)
 				continue;
@@ -1159,20 +1160,25 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7d65_plls[i][j].p) {
 				case SAMA7D65_PLL_PARENT_MAINCK:
-					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck", -1);
+					hw = sama7d65_pmc->chws[PMC_MAIN];
 					break;
 				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
+								       main_xtal_index);
+					hw = main_xtal_hw;
 					break;
 				default:
 					/* Should not happen. */
-					parent_hw = NULL;
 					break;
 				}
+				parent_rate = clk_hw_get_rate(hw);
+				if (!parent_rate)
+					return;
 
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7d65_plls[i][j].n,
-					NULL, parent_hw, i,
+					&parent_data, parent_rate, i,
 					sama7d65_plls[i][j].c,
 					sama7d65_plls[i][j].l,
 					sama7d65_plls[i][j].f);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index bf6092fea217..733e4fc6a515 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -970,6 +970,7 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
 static void __init sama7g5_pmc_setup(struct device_node *np)
 {
 	const char *main_xtal_name = "main_xtal";
+	u8 main_xtal_index = 2;
 	struct pmc_data *sama7g5_pmc;
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
@@ -1029,7 +1030,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate = 0;
 
 			if (!sama7g5_plls[i][j].n)
 				continue;
@@ -1038,20 +1039,26 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck", -1);
+					hw = sama7g5_pmc->chws[PMC_MAIN];
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
+								       main_xtal_index);
+					hw = main_xtal_hw;
 					break;
 				default:
 					/* Should not happen. */
-					parent_hw = NULL;
 					break;
 				}
 
+				parent_rate = clk_hw_get_rate(hw);
+				if (!parent_rate)
+					return;
+
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7g5_plls[i][j].n,
-					NULL, parent_hw, i,
+					&parent_data, parent_rate, i,
 					sama7g5_plls[i][j].c,
 					sama7g5_plls[i][j].l,
 					sama7g5_plls[i][j].f);
-- 
2.43.0


