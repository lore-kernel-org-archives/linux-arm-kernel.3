Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7584C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6k2Ele+n6Bh2JygVSFpIqrZmlScAZcuF4Yn/RvRJmg=; b=aQ9kci1Uhpx2PlLD1Jzi0J+ky8
	WDxfodyYcUD0Zc1uoIzUPEUJtm8jlpEYiKOFMc3Y0zNx/BkdTrwI8CHaAF65OLowhDgezyoyH7LWb
	1yUQkpxSQTWBN4fsVuTkRjTuJCK60bq8NKo7m0GmTTRTCRW2zw5jKHUJEsSVtC0N3KVDMVHmc9cKp
	4Y63sJ6HrMiFDpASVtwcG3FmJGOBvgks1smJaPbgfrCgs0Hfqf6RoKC3tXFOuljPyHJexBxFj9G91
	pYJydaZ6SJc3g7ciaBe5ZXN4FrBGKsCchOL8ztyfyX4N0yoMbmSjZf9/YB5JwSAutvreAV7T/4BQx
	LWvGMpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzpZ-0000000DAHV-1LsP;
	Thu, 10 Jul 2025 22:33:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYt-0000000Ct5R-2F96
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z6k2Ele+n6Bh2JygVSFpIqrZmlScAZcuF4Yn/RvRJmg=; b=QB4moD4Yt/5sDDPM0+8MZRoA14
	niJ9j84KyAEhzShFNO0TRCImzfdmzncoGeKrER9Bkpu6JVWcPhEM2/uanqDVVf4iigqlhjhdBDs+v
	9P96ffzjY/Uv18zl57fdHE98kH5SMNLOpeMnjwhqtr8PeZYT6hKCk66r7Ma3t8q6+NongjmYVPwTh
	1H6pB+8J0Fd571Uxl0nEbzGBP3Nut2ab6G3LICwKEQqSSLVlznMrP5ADGbqZJ6fqdltTZ0QxK/ufd
	Jpp4MTYoWyS226aPQWymJyuofUSRh+EFgfHcSf57COaNwl0p1+b8DRN2Wnnd10ymiTKWFiNx4VkVa
	/V8Hp4tg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYq-000000098pc-1jsi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178084; x=1783714084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=81e/X2QBlq2Whf2rTF6L7i95+VHbQu22YQdNso4IWZs=;
  b=lk4YtT1Q0U+IZlO6yk5gXUx10CemJJO2DxN3iIXUZo7lDmUv4VsWz1fe
   lb7RlTC6eTzA7MR888EtJMfsGIKO6601QwFiSLDWlqHl973mxrgkrtHh6
   KN5Per3oW1z1UADPRs4wn+MmzqqYS3n37A544SWpXxUPWw7iSmjFuQezM
   bt0YKa1/Z6r5WrtPAhmgHg9S2s5QPPS1WxiQx6dA+rq9abB3gJ6iLFis3
   Pjdjr/TsAja1VNtWWNLeWaE2CyA/+REzP+nc2fjb2Vx9jMmw2bQUzEbDQ
   IKCHAX7eT+T4lSW+8NTURcvCAciLTKD8fOixJYEYJfPcBxOOT59f6u+X/
   Q==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: lgegiaGfTia1Q+t7ZPRpog==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448164"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:31 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:31 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
Subject: [PATCH v3 09/32] clk: at91: clk-programmable: use clk_parent_data
Date: Thu, 10 Jul 2025 13:07:02 -0700
Message-ID: <aa1bae53bf124b8e46ff413b12528071262febb3.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210804_850279_3B1A9EEE 
X-CRM114-Status: GOOD (  17.54  )
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
modern clk_parent_data structures.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add the clk-programmable changes to the
SAMA7D65 and SAM9X75 SoCs. Add td_slck_name variable and index for the
SAM9X75.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-programmable.c |  8 ++++----
 drivers/clk/at91/pmc.h              |  2 +-
 drivers/clk/at91/sam9x7.c           | 21 +++++++++++----------
 drivers/clk/at91/sama7d65.c         | 20 ++++++++++----------
 drivers/clk/at91/sama7g5.c          | 20 ++++++++++----------
 5 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 1195fb405503..275ca701f294 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -215,7 +215,7 @@ static const struct clk_ops programmable_ops = {
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap,
 			       const char *name, const char **parent_names,
-			       struct clk_hw **parent_hws, u8 num_parents, u8 id,
+			       struct clk_parent_data *parent_data, u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table)
 {
@@ -224,7 +224,7 @@ at91_clk_register_programmable(struct regmap *regmap,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (id > PROG_ID_MAX || !(parent_names || parent_hws))
+	if (id > PROG_ID_MAX || !(parent_names || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	prog = kzalloc(sizeof(*prog), GFP_KERNEL);
@@ -233,8 +233,8 @@ at91_clk_register_programmable(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &programmable_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 54d472276fc9..34036f2d0578 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -263,7 +263,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap, const char *name,
-			       const char **parent_names, struct clk_hw **parent_hws,
+			       const char **parent_names, struct clk_parent_data *parent_data,
 			       u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table);
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 945983f72140..86d624cd92b2 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -737,10 +737,11 @@ static const struct {
 
 static void __init sam9x7_pmc_setup(struct device_node *np)
 {
+	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
 	struct clk_range range = CLK_RANGE(0, 0);
 	const char *main_xtal_name = "main_xtal";
+	const char * const td_slck_name = "td_slck";
 	const char *const md_slck_name = "md_slck";
-	u8 md_slck_index = 1, main_xtal_index = 2;
 	struct pmc_data *sam9x7_pmc;
 	const char *parent_names[9];
 	void **clk_mux_buffer = NULL;
@@ -752,7 +753,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	struct clk_hw *parent_hws[9];
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
+	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, td_slck_name));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
 	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
@@ -880,20 +881,20 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
-	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
+	parent_data[4] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    NULL, parent_hws, 7, i,
+						    NULL, parent_data, 7, i,
 						    &sam9x7_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 174b2317081f..7463719260e0 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1262,22 +1262,22 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7d65_prog_mux_table);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 263cdfc0858c..a6824d0accb9 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1141,21 +1141,21 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7g5_prog_mux_table);
-- 
2.43.0


