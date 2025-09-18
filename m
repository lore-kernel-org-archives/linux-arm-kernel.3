Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B664ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y0sNVd3GAHSHUm5Ibv3CkKxAFhrKvaisyceuNyVelE=; b=NPBLifqJ2w1WNrq9oRSVOBf8hL
	mWqUwgOuk31+YNee7pPLlbiLf89UbiqC2/Mbe9xAklMddifDC+EqSUyu9FvlUseIlMzEVCIY1+kgO
	pJ6jRa89foQr2ZDFBbH6a+WtJ1xrbmW8ADfMn6eCdOzOHmO6aVoVmZzQG5NwRGkXMYzy/01hZ9wqL
	5dGQTx77M/2QP3GptyxLsukcXNqggmjiBu3rSdZgRGrGNmU2XacDk7hON9YJ/8dh0KOMZKggGQlTy
	vCRjz5WT7U2gbtZ4VGbCcxDTorl8SVG05kqgfIZfXIuCEmpECw4yOTfaajrBTJnj5JHtpIot1Xbzh
	QHjYS8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM00-00000001Ct6-3U6k;
	Thu, 18 Sep 2025 21:17:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzT-00000001CH9-0q3C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230192; x=1789766192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fdvDSnlhCekCN9FzIZPS7s3nu6PC8FPbHxM35J6ZGKU=;
  b=tc/KGIXZ1MGT61wL/K3Y0Btl5iwNybebggP9ROAjagsMAaDr/+Gt00vR
   le07Ln14j5DQKFvOemSoDunLYVLYO/VKt+v1f2bIdsdeRKrCayg+XAjK/
   pfrRATunczVo2H8NfC1GfLn/Tu2vHG+7wi4gjzX1qs6VjEvRpb5gW3BS8
   rcmPj22nZWcEmhK3kxdgFop1N5Y7LBl6O/dp7BCo9un5OIrUe4iDDvZkg
   7vr5SVofzMNZRV9k4GEmMMtbl46A9H4rmyFKzLfCNXpRN/yuT4WzkDUWP
   gwoapEXx053NajPw64kon5w17nYNnG/Ps5wnCaa5gy+5m/1kXfAC4OSBd
   g==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: Dml2vJ7aQV6a8e9MD778wQ==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071389"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:53 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:53 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 15/31] clk: at91: clk-audio-pll: add support for parent_hw
Date: Thu, 18 Sep 2025 14:15:57 -0700
Message-ID: <3b706a9f568c08a35f054ac574f47be6037de889.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141631_287730_CB7824FC 
X-CRM114-Status: GOOD (  16.05  )
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
index a92da64c12e1..da9b2e699dcc 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -450,7 +450,8 @@ static const struct clk_ops audio_pll_pmc_ops = {
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
-				 const char *parent_name)
+				 const char *parent_name,
+				 struct clk_parent_data *parent_data)
 {
 	struct clk_audio_frac *frac_ck;
 	struct clk_init_data init = {};
@@ -462,7 +463,10 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_frac_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
@@ -480,10 +484,11 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
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
@@ -492,7 +497,10 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
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
@@ -511,10 +519,11 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
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
@@ -523,7 +532,10 @@ at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
 
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
index b983e44b742a..37ef6f63de26 100644
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


