Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A4C98303
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtHTuqgsW4uLX3gcBxHUqgDx+5DSUw3ihBAycRSRg3M=; b=qb5gDC5Q6Zs+0/GKVDz1fCWg1A
	N1GTFZdDhRSI5qsf3W0+OFGM78nDlI08KnYYRgDxnDyWf+CuSH1FZQ7LQgANMsNFfnmfAcxE9t9+p
	pNHbLYjeUI1gLu1jcbcM5eDoZ8Y4BbD8dam7Bf3j6gc0a1QHWnoL3DpIPatks7ZIpTmp+K65ME4xr
	Uv/RDY7B3TCpZcV+62dJNu8KLw17IZGhcyGcugYVLqymIAyLVhl4FjZBo+Xz6v3xgnazkxVrX6qmu
	/icrwYxUXDedAv5TUZoSQ78wt+JOhVC5XRxB+F5p97I4Yttdkzvl6R6iCZjiNvc2pvVoVKvu5+vYu
	HS/YB0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq7F-0000000Ekxz-0udQ;
	Fri, 16 Jan 2026 20:08:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6a-0000000EkAK-1jQj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594054; x=1800130054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=53DNaidMA1vaVQPCMvqJAIB1kyJdHBWN47UGR13FwEI=;
  b=RKyE+NnPitFtJQJEbwMveNWGjc3YEzSMqmu8pKiBWorV3WDDrIQ+9zkJ
   WoGH56Lt55hBJvvtK3nrnMNjK6BTZSpdy1emX3NMinXijyntWedJEpr54
   qyRzK2t3h8pnuXz7dTyDBMZfzuEFgeAiM9c8S20qsIS6sh4+PmQahFKgp
   VR/PPVnleQzASQjgk7QR7TaWJvyTtXcuYVPQGZkb3XUGoN3jo8GyNI18P
   dmRhMMnTK++DqkeVRtd5Ckm1GfUNC+o2QF7fJ+BMHY6pLftPJfAVPDiZ4
   DEErk6BjO7CCdxV7Z5lvFtfXMVh8HF2bWlnQgw+I26lIJiRStYHxDZHRl
   A==;
X-CSE-ConnectionGUID: 3LvvvroxTJyR6T9mab+TNA==
X-CSE-MsgGUID: fVrDNjIaRxO4fFS0CxjTTw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="51290358"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2026 13:07:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Jan 2026 13:07:04 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:04 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 04/31] clk: at91: clk-sam9x60-pll: use clk_parent_data
Date: Fri, 16 Jan 2026 13:06:57 -0700
Message-ID: <ca2a4b7196e1c8a479577ca4673f2125ff41292e.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120738_050370_B9D63E60 
X-CRM114-Status: GOOD (  19.88  )
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
 drivers/clk/at91/sama7d65.c        | 28 +++++++++++++++++-----------
 drivers/clk/at91/sama7g5.c         | 29 ++++++++++++++++++-----------
 6 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index 3b965057ba0d..bccd674bc616 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -637,19 +637,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
 
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
@@ -657,10 +657,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
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
@@ -691,7 +688,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 		 * its rate leading to enabling this PLL with unsupported
 		 * rate. This will lead to PLL not being locked at all.
 		 */
-		parent_rate = clk_hw_get_rate(parent_hw);
 		if (!parent_rate) {
 			hw = ERR_PTR(-EINVAL);
 			goto free;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 63c028b7b54c..577a6db65ed0 100644
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
index c48c91da914e..6ec4d09e0b56 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -752,6 +752,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
+	static struct clk_parent_data parent_data;
 	struct clk_hw *parent_hws[9];
 	int i, j;
 
@@ -804,7 +805,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sam9x7_plls[i][j].n)
 				continue;
@@ -813,21 +814,26 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
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
index ec2ef1a0249a..fd4bf70323ab 100644
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
@@ -1106,11 +1106,15 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	bool bypass;
 	int i, j;
 
+	i = of_property_match_string(np, "clock-names", "main_xtal");
+	if (i < 0)
+		return;
+	main_xtal_name = of_clk_get_parent_name(np, i);
+
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!td_slck_hw || !md_slck_hw)
 		return;
 
 	regmap = device_node_to_regmap(np);
@@ -1137,10 +1141,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	parent_data.name = main_xtal_name;
-	parent_data.fw_name = main_xtal_name;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
-						 &parent_data, bypass);
+						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
@@ -1154,7 +1156,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sama7d65_plls[i][j].n)
 				continue;
@@ -1163,20 +1165,24 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
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
index 713f5dfe7be2..c6550044cba1 100644
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
@@ -983,11 +983,15 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	bool bypass;
 	int i, j;
 
+	i = of_property_match_string(np, "clock-names", "main_xtal");
+	if (i < 0)
+		return;
+	main_xtal_name = of_clk_get_parent_name(np, i);
+
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!td_slck_hw || !md_slck_hw)
 		return;
 
 	regmap = device_node_to_regmap(np);
@@ -1014,10 +1018,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	parent_data.name = main_xtal_name;
-	parent_data.fw_name = main_xtal_name;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
-						 &parent_data, bypass);
+						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
@@ -1031,7 +1033,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sama7g5_plls[i][j].n)
 				continue;
@@ -1040,20 +1042,25 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
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


