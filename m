Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF99CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1DpSlCSCIf/4VuxXpEwme3Bb0kZcoVfYTYNfqgk34s=; b=2J13SGVpgWSf9YAq6JDqm7hPpe
	oP6j/G3l9LRM1dT0n/TQ4Oe5A2cIn0tiq+i/UqGCZ/oqnQOd9Omi9bBnNaQvzA5Td0S7LD/vbkvWt
	wXXX1oN8Ny6TdJR4CGkK4JcMsjWLwSTFQSskDbaqlp1JGkmmRtQZrl/A1T2iujRCIFBxkT0uwSuIs
	Mt5zp79E4nwAm5FNVB1+BF+vWH7r52rxnJZBL74/OHFX9xIXam1l2RXuN+JeBC2HEN1UX9Mo7d2FN
	y5cLpVuPuMISbt9wolhwjEk2Mi5KqaprrhxNDQ9NHes9MPC5vQp5P4KKLrJf8IHc6LIAPlYWjgTIk
	nQXvBzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzX-00000001COd-3zq5;
	Thu, 18 Sep 2025 21:16:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzN-00000001CBI-0otC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230186; x=1789766186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c4Gn9p0qYQJUQcD3GCxEYQYm9cnkaiQMPpmWCJHuy3c=;
  b=apU/eSLiKxiXuXHweIkkjdAkAb83X7UEVY7LMe1GgZ8P/4EcRdQhNGLY
   HOLVmRgg4mjK4PV0EOWqyd6gAzrIeb9uF++aJN+Cjb9oOGGwMwcpeJ2p1
   nCNmFsEqn4ClTnuwlbv2yj0UgaIKTOvQ+wNB4yE0wcOa4croyLQtCtl8p
   L4fS0xZqW27UqGnwFD1UbtT8r52uoEKjLIQaVgoNurD7btG1FNG2eYoK7
   ju6LTKyYHIotynu8UsgfYP7A1Wq+8fe39JnG5nr6Ez7Y3o3g9b8ousS61
   msxok5Xapv+B9V9/PU1WGe8Epv245KUUEBm07mcBiYkp1njhl8KuvJq1h
   A==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: IKJ+PEi9TmWU1HZZ0Omi+w==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071378"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:51 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:51 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 04/31] clk: at91: clk-sam9x60-pll: use clk_parent_data
Date: Thu, 18 Sep 2025 14:15:46 -0700
Message-ID: <259824455f5325b35d0fb85163866a81ff24304e.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141625_250461_23FF05EE 
X-CRM114-Status: GOOD (  19.55  )
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

Get the main_xtal name via of_clk_get_parent_name() to consistently get
the correct name for the main_xtal.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
 drivers/clk/at91/pmc.h             |  5 +++--
 drivers/clk/at91/sam9x60.c         |  8 +++++---
 drivers/clk/at91/sam9x7.c          | 16 +++++++++++-----
 drivers/clk/at91/sama7d65.c        | 25 ++++++++++++++-----------
 drivers/clk/at91/sama7g5.c         | 26 +++++++++++++++-----------
 6 files changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index 3dc75a394ce1..9895881c67d7 100644
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
index 16c2559889aa..d3fc38cf90eb 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -258,8 +258,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
 
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
index 18baf4a256f4..bee35c65aceb 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -242,7 +242,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc->chws[PMC_MAIN] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
-					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
+					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
+					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
 					   0, &plla_characteristics,
 					   &pll_frac_layout,
 					   /*
@@ -268,8 +269,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
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
index cb5849da494f..c80306715d90 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -752,6 +752,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
+	static struct clk_parent_data parent_data;
 	struct clk_hw *parent_hws[9];
 	int i, j;
 
@@ -799,7 +800,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sam9x7_plls[i][j].n)
 				continue;
@@ -808,21 +809,26 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sam9x7_plls[i][j].p) {
 				case SAM9X7_PLL_PARENT_MAINCK:
-					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck");
+					hw = sam9x7_pmc->chws[PMC_MAIN];
 					break;
 				case SAM9X7_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
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
index ec2ef1a0249a..6229b7dfbea1 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1093,7 +1093,7 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
 
 static void __init sama7d65_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name = "main_xtal";
+	const char *main_xtal_name;
 	struct pmc_data *sama7d65_pmc;
 	const char *parent_names[11];
 	void **alloc_mem = NULL;
@@ -1108,10 +1108,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
+	i = of_property_match_string(np, "clock-names", "main_xtal");
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!td_slck_hw || !md_slck_hw || !i)
 		return;
+	main_xtal_name = of_clk_get_parent_name(np, i);
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -1137,10 +1138,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	parent_data.name = main_xtal_name;
-	parent_data.fw_name = main_xtal_name;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
-						 &parent_data, bypass);
+						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
@@ -1154,7 +1153,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sama7d65_plls[i][j].n)
 				continue;
@@ -1163,20 +1162,24 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7d65_plls[i][j].p) {
 				case SAMA7D65_PLL_PARENT_MAINCK:
-					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck");
+					hw = sama7d65_pmc->chws[PMC_MAIN];
 					break;
 				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
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
index 713f5dfe7be2..654c9f43fcf8 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -971,7 +971,7 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
 
 static void __init sama7g5_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name = "main_xtal";
+	const char *main_xtal_name;
 	struct pmc_data *sama7g5_pmc;
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
@@ -985,10 +985,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
+	i = of_property_match_string(np, "clock-names", "main_xtal");
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!td_slck_hw || !md_slck_hw || !i)
 		return;
+	main_xtal_name = of_clk_get_parent_name(np, i);
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -1014,10 +1015,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	parent_data.name = main_xtal_name;
-	parent_data.fw_name = main_xtal_name;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
-						 &parent_data, bypass);
+						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
@@ -1031,7 +1030,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sama7g5_plls[i][j].n)
 				continue;
@@ -1040,20 +1039,25 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck");
+					hw = sama7g5_pmc->chws[PMC_MAIN];
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
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


