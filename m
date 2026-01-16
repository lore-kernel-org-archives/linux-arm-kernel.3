Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011E9C98303
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaYI636QetKTxjfjMJkgX5U9xHWtagg2k4fM5+JJD5o=; b=G0qxUmW9CDQX5BFjPs42fadXOV
	5Ku7MJtnTg2W3Lei0qVOhLr5ZhBP1Z9FdiIeQypU2GOGIrh8mY5kceQ0FkIKbCOHoMWhohYjK+XVt
	E7Y05TJrY47zAB8hKUrvf+v6KOqpdx959aGhJbY5tVGZhpg/XNktZpWwUvAbFbhP1JnJPeAjWSCkB
	HEfzRWQjYQ2ZVAoIs0PgTxbaXMONELY4wxaI2iVk3ikzGnsewiGH/3il5oKqAuxs76kM1VQJhasE4
	cMRn8HGqZFkFPTo6Zr3+O7Zm+Wpj6SWgi6XTdg/7OATQ0vTL5ax4ChGqjhVxGUfA5BPJcnigBCRIY
	4AfvGZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6W-0000000Ek4F-0bKJ;
	Fri, 16 Jan 2026 20:07:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6J-0000000Ejt3-3fc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594040; x=1800130040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ct+wfuFTOZqeIGPQXmVjdzHQAKJ9Gsz1qeWAD28gdQ=;
  b=SWqh4goiiXDEVodw/sjCXiaCjeUxNHVUBNW5JmegosKEaEQrtmgPTGjH
   UUHZQl4PTHLPGCfMKjtRpSdkFymMdO8TcjZX6d4gFIofCzbM93CdxETXA
   vSykxvXja9h+htKNUQF8avwo4UapVY8LeM+Ys4zwvFJebaDrC+Wj7ZFE1
   PKwjxnT8XTLg+Ti25/37y++67xbSswdfnsWHi5jiYo7nnEk9+9HTZuFn4
   qrAXBhjwKzLarOqdfM4vkdn783l+drZCCGHsz7wdCV09MQu+JydD8muRP
   lmdO8zzHheBphncD1Ivmt2K/ABvRkRS3JY+TAI/mN1wHYNfHHY7NImAvy
   Q==;
X-CSE-ConnectionGUID: +9RSiAtvRY+RhxWEUm06Wg==
X-CSE-MsgGUID: JUjBWKdnRFqBvmy/zMCTnw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="283397054"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:05 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 15/31] clk: at91: clk-audio-pll: add support for parent_hw
Date: Fri, 16 Jan 2026 13:07:08 -0700
Message-ID: <7b75764e380508c6c2c11a405bda60a801e2f494.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120719_922533_E85EB901 
X-CRM114-Status: GOOD (  15.30  )
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

Add support for parent_hw in audio pll clock drivers.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-audio-pll were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-audio-pll.c | 28 ++++++++++++++++++++--------
 drivers/clk/at91/dt-compat.c     |  6 +++---
 drivers/clk/at91/pmc.h           |  6 +++---
 drivers/clk/at91/sama5d2.c       |  6 +++---
 4 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index bf9b635ac9d6..4ab462cf5094 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -454,7 +454,8 @@ static const struct clk_ops audio_pll_pmc_ops = {
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
-				 const char *parent_name)
+				 const char *parent_name,
+				 struct clk_parent_data *parent_data)
 {
 	struct clk_audio_frac *frac_ck;
 	struct clk_init_data init = {};
@@ -466,7 +467,10 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_frac_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
@@ -484,10 +488,11 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
-				const char *parent_name)
+				const char *parent_name,
+				struct clk_parent_data *parent_data)
 {
 	struct clk_audio_pad *apad_ck;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	apad_ck = kzalloc(sizeof(*apad_ck), GFP_KERNEL);
@@ -496,7 +501,10 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_pad_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		CLK_SET_RATE_PARENT;
@@ -515,10 +523,11 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
-				const char *parent_name)
+				const char *parent_name,
+				struct clk_parent_data *parent_data)
 {
 	struct clk_audio_pmc *apmc_ck;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	apmc_ck = kzalloc(sizeof(*apmc_ck), GFP_KERNEL);
@@ -527,7 +536,10 @@ at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_pmc_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		CLK_SET_RATE_PARENT;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 2c5faa3b1cfd..22bcaa3b28dd 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -43,7 +43,7 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name);
+	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
@@ -69,7 +69,7 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name);
+	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
@@ -95,7 +95,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name);
+	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 0b1c21eae4fb..f4b2a07db0d5 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -160,15 +160,15 @@ struct clk_hw *of_clk_hw_pmc_get(struct of_phandle_args *clkspec, void *data);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
-				 const char *parent_name);
+				 const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
-				const char *parent_name);
+				const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
-				const char *parent_name);
+				const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index bc62b9ed4ea0..d2af421abddc 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -227,19 +227,19 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	sama5d2_pmc->chws[PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_audio_pll_frac(regmap, "audiopll_fracck",
-					      "mainck");
+					      "mainck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = at91_clk_register_audio_pll_pad(regmap, "audiopll_padck",
-					     "audiopll_fracck");
+					     "audiopll_fracck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_AUDIOPINCK] = hw;
 
 	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck",
-					     "audiopll_fracck");
+					     "audiopll_fracck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.43.0


