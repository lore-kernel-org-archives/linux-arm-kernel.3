Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DA9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZtqQiEthDD351ktJ9T7EQGqWqtqIX6SWhuBjcO017Q=; b=ZkrFv+kdWqcBtnzf1Panx2ISOu
	POVHlDSIK5APJspqnPkiHQafTCsbdEKHyyezfNEkdPcTJwUvhBlPcCTTHufxxOfc9LbMu7J37uIJT
	kGkaK+MIQ0pLecPQ3TWcV+gvgPuGcGajEGzOzKshB4Bi/v325hlEoSuQPUhaSHRnkMCs/05dVAncG
	1yn2oO9Ka7HFzcSMubPztrDNntWr0fzKOGRhPq9Y6fyq7z+q6NKce79MKQaZim8b9EWxG1ZP5pcCD
	xdUEd/4KOr8u6b2hPA8yHz7+ERIwihcT2cCpyiFg2KXrJHEZWCfg0hm+LvjABN8dZ2/ZAeNytZVlA
	JHnAD+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZze3-0000000D9Gv-1x8M;
	Thu, 10 Jul 2025 22:21:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYn-0000000Ct4Z-2iTi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qZtqQiEthDD351ktJ9T7EQGqWqtqIX6SWhuBjcO017Q=; b=Y+SFoSaJhkas0lBx8WYe6a8Sak
	xWvarEQzNlJfyr54msBH5CwcuxvC4fO/CbzhR04wdd8MALEJRGzrqo4JitIqGncENqWJiLzGXRTuz
	x7+heZe6xRUJqieSbLdqD8CJRFrI2a59s8JmPSE4vtc81sp4cH1hIQw6cUz3NGwO6gcOS6J4s+a3e
	BQBILKzuuowg2P3v7BtQp+eu8GoaTGRG0mHSwntX5GzIZJPH62gKayZjVAys5G/xM//fHIfkd7B50
	rQLk6nZ37K3z9++FFnJkE4BSxYP1OZ3VAHASfZ17tWWxejPz40Sllr+pujD8WyvdnieLOChUamMLu
	yDRzLgcA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYj-000000098pc-2D3P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178077; x=1783714077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8/Md0BwKBjCsRcOlU/WyJlpKcNB62CjfuSp/4MCxNTY=;
  b=H3SAGJyGhletDw/U32hWJyzYYa6crZThOioo329sT2dhJinTOHjihW3l
   Sge17b/BqvYtJkpuVH/I0B2PcnHcRmPFsNZ/B1ViKMFsq0Qaa2dgaYGCA
   sMnnCIj3cX3oqC4w9+gfHYAY+KK5kFtn0y/svS/pBczmigIyrKOCzvBqn
   +4DJyYSW6veyDTISU58hqO8/F4WYtrE/xRSPOMril6iBeGRnBQtPzflfS
   WCqcBSLwV58/yA75wj2xdxjbqPsuke9Q6xJfx/4eM/6G3kCTZbcFhPi76
   mOmlppqlFyZ2D4fryko9DDF5+Z3yGeCF8CcT+8EPVATJJEgV3GZ4iwhQm
   w==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: axyoHaiwRnWELi/BhztRrg==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448158"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:51 -0700
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
	<robh@kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 03/32] clk: at91: sam9x75: switch to parent_hw and parent_data
Date: Thu, 10 Jul 2025 13:06:56 -0700
Message-ID: <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210758_428419_6BE05A36 
X-CRM114-Status: GOOD (  18.54  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Switch SAM9X75 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

The USBCLK will be updated in subsequent patches that update the clock
registration functions to use parent_hw and parent_data.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 308 +++++++++++++++++++++-----------------
 1 file changed, 173 insertions(+), 135 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index cbb8b220f16b..31184e11165a 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -33,10 +33,22 @@ enum pll_ids {
 	PLL_ID_UPLL,
 	PLL_ID_AUDIO,
 	PLL_ID_LVDS,
-	PLL_ID_PLLA_DIV2,
 	PLL_ID_MAX,
 };
 
+/*
+ * PLL component identifier
+ * @PLL_COMPID_FRAC: Fractional PLL component identifier
+ * @PLL_COMPID_DIV0: 1st PLL divider component identifier
+ * @PLL_COMPID_DIV1: 2nd PLL divider component identifier
+ */
+enum pll_component_id {
+	PLL_COMPID_FRAC,
+	PLL_COMPID_DIV0,
+	PLL_COMPID_DIV1,
+	PLL_COMPID_MAX,
+};
+
 /**
  * enum pll_type - PLL type identifiers
  * @PLL_TYPE_FRAC:	fractional PLL identifier
@@ -180,6 +192,18 @@ static const struct clk_pll_layout pll_divio_layout = {
 	.endiv_shift	= 30,
 };
 
+/*
+ * SAM9X7 PLL possible parents
+ * @SAM9X7_PLL_PARENT_MAINCK: MAINCK is PLL a parent
+ * @SAM9X7_PLL_PARENT_MAIN_XTAL: MAIN XTAL is a PLL parent
+ * @SAM9X7_PLL_PARENT_FRACCK: Frac PLL is a PLL parent (for PLL dividers)
+ */
+enum sam9x7_pll_parent {
+	SAM9X7_PLL_PARENT_MAINCK,
+	SAM9X7_PLL_PARENT_MAIN_XTAL,
+	SAM9X7_PLL_PARENT_FRACCK
+};
+
 /*
  * PLL clocks description
  * @n:		clock name
@@ -187,22 +211,24 @@ static const struct clk_pll_layout pll_divio_layout = {
  * @l:		clock layout
  * @t:		clock type
  * @c:		pll characteristics
+ * @hw:		pointer to clk_hw
  * @f:		clock flags
  * @eid:	export index in sam9x7->chws[] array
  */
-static const struct {
+static struct {
 	const char *n;
-	const char *p;
 	const struct clk_pll_layout *l;
 	u8 t;
 	const struct clk_pll_characteristics *c;
+	struct clk_hw *hw;
 	unsigned long f;
+	enum sam9x7_pll_parent p;
 	u8 eid;
-} sam9x7_plls[][3] = {
+} sam9x7_plls[][PLL_COMPID_MAX] = {
 	[PLL_ID_PLLA] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "plla_fracck",
-			.p = "mainck",
+			.p = SAM9X7_PLL_PARENT_MAINCK,
 			.l = &plla_frac_layout,
 			.t = PLL_TYPE_FRAC,
 			/*
@@ -213,9 +239,9 @@ static const struct {
 			.c = &plla_characteristics,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "plla_divpmcck",
-			.p = "plla_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled */
@@ -223,21 +249,35 @@ static const struct {
 			.eid = PMC_PLLACK,
 			.c = &plla_characteristics,
 		},
+
+		[PLL_COMPID_DIV1] = {
+			.n = "plla_div2pmcck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
+			.l = &plladiv2_divpmc_layout,
+			/*
+			 * This may feed critical parts of the system like timers.
+			 * It should not be disabled.
+			 */
+			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
+			.c = &plladiv2_characteristics,
+			.eid = PMC_PLLADIV2,
+			.t = PLL_TYPE_DIV,
+		},
 	},
 
 	[PLL_ID_UPLL] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "upll_fracck",
-			.p = "main_osc",
+			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
 			.l = &pll_frac_layout,
 			.t = PLL_TYPE_FRAC,
 			.f = CLK_SET_RATE_GATE,
 			.c = &upll_characteristics,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "upll_divpmcck",
-			.p = "upll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
@@ -248,18 +288,18 @@ static const struct {
 	},
 
 	[PLL_ID_AUDIO] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "audiopll_fracck",
-			.p = "main_osc",
+			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
 			.l = &pll_frac_layout,
 			.f = CLK_SET_RATE_GATE,
 			.c = &audiopll_characteristics,
 			.t = PLL_TYPE_FRAC,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "audiopll_divpmcck",
-			.p = "audiopll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
@@ -268,9 +308,9 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 		},
 
-		{
+		[PLL_COMPID_DIV1] = {
 			.n = "audiopll_diviock",
-			.p = "audiopll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divio_layout,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
@@ -281,18 +321,18 @@ static const struct {
 	},
 
 	[PLL_ID_LVDS] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "lvdspll_fracck",
-			.p = "main_osc",
+			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
 			.l = &pll_frac_layout,
 			.f = CLK_SET_RATE_GATE,
 			.c = &lvdspll_characteristics,
 			.t = PLL_TYPE_FRAC,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "lvdspll_divpmcck",
-			.p = "lvdspll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
@@ -301,22 +341,6 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 		},
 	},
-
-	[PLL_ID_PLLA_DIV2] = {
-		{
-			.n = "plla_div2pmcck",
-			.p = "plla_fracck",
-			.l = &plladiv2_divpmc_layout,
-			/*
-			 * This may feed critical parts of the system like timers.
-			 * It should not be disabled.
-			 */
-			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.c = &plladiv2_characteristics,
-			.eid = PMC_PLLADIV2,
-			.t = PLL_TYPE_DIV,
-		},
-	},
 };
 
 static const struct clk_programmable_layout sam9x7_programmable_layout = {
@@ -334,9 +358,9 @@ static const struct clk_pcr_layout sam9x7_pcr_layout = {
 	.pid_mask = GENMASK(6, 0),
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	u8 id;
 	unsigned long flags;
 } sam9x7_systemck[] = {
@@ -344,10 +368,10 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck",		.p = "masterck_div",	.id = 2,	.flags = CLK_IS_CRITICAL },
-	{ .n = "uhpck",		.p = "usbck",		.id = 6 },
-	{ .n = "pck0",		.p = "prog0",		.id = 8 },
-	{ .n = "pck1",		.p = "prog1",		.id = 9 },
+	{ .n = "ddrck",		.id = 2,	.flags = CLK_IS_CRITICAL },
+	{ .n = "uhpck",		.id = 6 },
+	{ .n = "pck0",		.id = 8 },
+	{ .n = "pck1",		.id = 9 },
 };
 
 /*
@@ -420,7 +444,8 @@ static const struct {
 /*
  * Generic clock description
  * @n:			clock name
- * @pp:			PLL parents
+ * @pp:			PLL parents (entry formed by PLL components identifiers
+ *			(see enum pll_component_id))
  * @pp_mux_table:	PLL parents mux table
  * @r:			clock output range
  * @pp_chg_id:		id in parent array of changeable PLL parent
@@ -429,7 +454,10 @@ static const struct {
  */
 static const struct {
 	const char *n;
-	const char *pp[8];
+	struct {
+			int pll_id;
+			int pll_compid;
+	} pp[8];
 	const char pp_mux_table[8];
 	struct clk_range r;
 	int pp_chg_id;
@@ -439,7 +467,7 @@ static const struct {
 	{
 		.n = "flex0_gclk",
 		.id = 5,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -448,7 +476,7 @@ static const struct {
 	{
 		.n = "flex1_gclk",
 		.id = 6,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -457,7 +485,7 @@ static const struct {
 	{
 		.n = "flex2_gclk",
 		.id = 7,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -466,7 +494,7 @@ static const struct {
 	{
 		.n = "flex3_gclk",
 		.id = 8,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -475,7 +503,7 @@ static const struct {
 	{
 		.n = "flex6_gclk",
 		.id = 9,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -484,7 +512,7 @@ static const struct {
 	{
 		.n = "flex7_gclk",
 		.id = 10,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -493,7 +521,7 @@ static const struct {
 	{
 		.n = "flex8_gclk",
 		.id = 11,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -503,7 +531,7 @@ static const struct {
 		.n = "sdmmc0_gclk",
 		.id = 12,
 		.r = { .max = 105000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -512,7 +540,7 @@ static const struct {
 	{
 		.n = "flex4_gclk",
 		.id = 13,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -521,7 +549,7 @@ static const struct {
 	{
 		.n = "flex5_gclk",
 		.id = 14,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -530,7 +558,7 @@ static const struct {
 	{
 		.n = "flex9_gclk",
 		.id = 15,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -539,7 +567,7 @@ static const struct {
 	{
 		.n = "flex10_gclk",
 		.id = 16,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -548,7 +576,7 @@ static const struct {
 	{
 		.n = "tcb0_gclk",
 		.id = 17,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -557,7 +585,7 @@ static const struct {
 	{
 		.n = "adc_gclk",
 		.id = 19,
-		.pp = { "upll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 5, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -567,7 +595,7 @@ static const struct {
 		.n = "lcd_gclk",
 		.id = 25,
 		.r = { .max = 75000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -577,7 +605,7 @@ static const struct {
 		.n = "sdmmc1_gclk",
 		.id = 26,
 		.r = { .max = 105000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -587,7 +615,7 @@ static const struct {
 		.n = "mcan0_gclk",
 		.id = 29,
 		.r = { .max = 80000000 },
-		.pp = { "upll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 5, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -597,7 +625,7 @@ static const struct {
 		.n = "mcan1_gclk",
 		.id = 30,
 		.r = { .max = 80000000 },
-		.pp = { "upll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 5, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -606,7 +634,7 @@ static const struct {
 	{
 		.n = "flex11_gclk",
 		.id = 32,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -615,7 +643,7 @@ static const struct {
 	{
 		.n = "flex12_gclk",
 		.id = 33,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -625,7 +653,7 @@ static const struct {
 		.n = "i2s_gclk",
 		.id = 34,
 		.r = { .max = 100000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -635,7 +663,7 @@ static const struct {
 		.n = "qspi_gclk",
 		.id = 35,
 		.r = { .max = 200000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -644,7 +672,7 @@ static const struct {
 	{
 		.n = "pit64b0_gclk",
 		.id = 37,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -654,7 +682,7 @@ static const struct {
 		.n = "classd_gclk",
 		.id = 42,
 		.r = { .max = 100000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -663,7 +691,7 @@ static const struct {
 	{
 		.n = "tcb1_gclk",
 		.id = 45,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -672,7 +700,7 @@ static const struct {
 	{
 		.n = "dbgu_gclk",
 		.id = 47,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -682,7 +710,7 @@ static const struct {
 		.n = "mipiphy_gclk",
 		.id = 55,
 		.r = { .max = 27000000 },
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -691,7 +719,7 @@ static const struct {
 	{
 		.n = "pit64b1_gclk",
 		.id = 58,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -700,7 +728,7 @@ static const struct {
 	{
 		.n = "gmac_gclk",
 		.id = 67,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -710,32 +738,24 @@ static const struct {
 static void __init sam9x7_pmc_setup(struct device_node *np)
 {
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *td_slck_name, *md_slck_name, *mainxtal_name;
+	const char *main_xtal_name = "main_xtal";
 	struct pmc_data *sam9x7_pmc;
 	const char *parent_names[9];
 	void **clk_mux_buffer = NULL;
 	int clk_mux_buffer_size = 0;
-	struct clk_hw *main_osc_hw;
 	struct regmap *regmap;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
+	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
+	static struct clk_parent_data parent_data;
+	struct clk_hw *parent_hws[9];
 	int i, j;
 
-	i = of_property_match_string(np, "clock-names", "td_slck");
-	if (i < 0)
-		return;
-
-	td_slck_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "md_slck");
-	if (i < 0)
-		return;
-
-	md_slck_name = of_clk_get_parent_name(np, i);
+	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
+	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
+	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
+	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
 		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -754,26 +774,27 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!clk_mux_buffer)
 		goto err_free;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   50000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   50000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
-	if (IS_ERR(hw))
+	parent_data.name = main_xtal_name;
+	parent_data.fw_name = main_xtal_name;
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL, &parent_data, 0);
+	if (IS_ERR(main_osc_hw))
 		goto err_free;
-	main_osc_hw = hw;
 
-	parent_names[0] = "main_rc_osc";
-	parent_names[1] = "main_osc";
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
+	parent_hws[0] = main_rc_hw;
+	parent_hws[1] = main_osc_hw;
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sam9x7_pmc->chws[PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
-		for (j = 0; j < 3; j++) {
+		for (j = 0; j < PLL_COMPID_MAX; j++) {
 			struct clk_hw *parent_hw;
 
 			if (!sam9x7_plls[i][j].n)
@@ -781,19 +802,23 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 
 			switch (sam9x7_plls[i][j].t) {
 			case PLL_TYPE_FRAC:
-				if (!strcmp(sam9x7_plls[i][j].p, "mainck"))
+				switch (sam9x7_plls[i][j].p) {
+				case SAM9X7_PLL_PARENT_MAINCK:
 					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
-				else if (!strcmp(sam9x7_plls[i][j].p, "main_osc"))
-					parent_hw = main_osc_hw;
-				else
-					parent_hw = __clk_get_hw(of_clk_get_by_name
-								 (np, sam9x7_plls[i][j].p));
+					break;
+				case SAM9X7_PLL_PARENT_MAIN_XTAL:
+					parent_hw = main_xtal_hw;
+					break;
+				default:
+					/* Should not happen. */
+					parent_hw = NULL;
+					break;
+				}
 
 				hw = sam9x60_clk_register_frac_pll(regmap,
 								   &pmc_pll_lock,
 								   sam9x7_plls[i][j].n,
-								   sam9x7_plls[i][j].p,
-								   parent_hw, i,
+								   NULL, parent_hw, i,
 								   sam9x7_plls[i][j].c,
 								   sam9x7_plls[i][j].l,
 								   sam9x7_plls[i][j].f);
@@ -803,7 +828,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 				hw = sam9x60_clk_register_div_pll(regmap,
 								  &pmc_pll_lock,
 								  sam9x7_plls[i][j].n,
-								  sam9x7_plls[i][j].p, NULL, i,
+								  NULL, sam9x7_plls[i][0].hw, i,
 								  sam9x7_plls[i][j].c,
 								  sam9x7_plls[i][j].l,
 								  sam9x7_plls[i][j].f, 0);
@@ -816,23 +841,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			if (IS_ERR(hw))
 				goto err_free;
 
+			sam9x7_plls[i][j].hw = hw;
 			if (sam9x7_plls[i][j].eid)
 				sam9x7_pmc->chws[sam9x7_plls[i][j].eid] = hw;
 		}
 	}
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plla_divpmcck";
-	parent_names[3] = "upll_divpmcck";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
+	parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL, &sam9x7_master_layout,
+					   NULL, parent_hws, &sam9x7_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL, &sam9x7_master_layout,
+					  NULL, hw, &sam9x7_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
 	if (IS_ERR(hw))
@@ -843,24 +869,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	parent_names[0] = "plla_divpmcck";
 	parent_names[1] = "upll_divpmcck";
 	parent_names[2] = "main_osc";
-	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
-	if (IS_ERR(hw))
+	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = td_slck_name;
-	parent_names[2] = "mainck";
-	parent_names[3] = "masterck_div";
-	parent_names[4] = "plla_divpmcck";
-	parent_names[5] = "upll_divpmcck";
-	parent_names[6] = "audiopll_divpmcck";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = td_slck_hw;
+	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
+	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
+	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
+	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
+	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 7, i,
+						    NULL, parent_hws, 7, i,
 						    &sam9x7_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -869,9 +895,14 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		sam9x7_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sam9x7_systemck[0].parent_hw = sam9x7_pmc->chws[PMC_MCK];
+	sam9x7_systemck[1].parent_hw = usbck_hw;
+	sam9x7_systemck[2].parent_hw = sam9x7_pmc->pchws[0];
+	sam9x7_systemck[3].parent_hw = sam9x7_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(sam9x7_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sam9x7_systemck[i].n,
-					      sam9x7_systemck[i].p, NULL,
+					      NULL, sam9x7_systemck[i].parent_hw,
 					      sam9x7_systemck[i].id,
 					      sam9x7_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -884,7 +915,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x7_pcr_layout,
 							 sam9x7_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL, sam9x7_pmc->chws[PMC_MCK],
 							 sam9x7_periphck[i].id,
 							 &range, INT_MIN,
 							 sam9x7_periphck[i].f);
@@ -894,12 +925,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
 	}
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = td_slck_name;
-	parent_names[2] = "mainck";
-	parent_names[3] = "masterck_div";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = td_slck_hw;
+	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
+	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
 	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
 		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
+		struct clk_hw *tmp_parent_hws[6];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -910,13 +942,19 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		PMC_INIT_TABLE(mux_table, 4);
 		PMC_FILL_TABLE(&mux_table[4], sam9x7_gck[i].pp_mux_table,
 			       sam9x7_gck[i].pp_count);
-		PMC_FILL_TABLE(&parent_names[4], sam9x7_gck[i].pp,
+		for (j = 0; j < sam9x7_gck[i].pp_count; j++) {
+			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
+			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
+
+			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;
+		}
+		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
 			       sam9x7_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sam9x7_pcr_layout,
 						 sam9x7_gck[i].n,
-						 parent_names, NULL, mux_table,
+						 NULL, parent_hws, mux_table,
 						 num_parents,
 						 sam9x7_gck[i].id,
 						 &sam9x7_gck[i].r,
-- 
2.43.0


