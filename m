Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E37EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MK4CNI1qjxwtC9HF+fRdS0FwRfppyU32/LlmE1q202M=; b=uJOZ2HJ1ZZmmlUwDqZh4NDxQ2C
	sEzOzr5C/2tuKX7EPqobPH8MNy7nibzsYw6Bqug73afR5azp+NDp3CZN3YHvJLLwUdHlO8ZJvnXpm
	AjMLJNBOFMNIZgA2QrlISW/KnGvwTVDbzVBnNZTvy46H8VthZ4gURMSuVTdt95hgAFI6xjshiZwfa
	Ybtqv6ZxDaYbK4NtD10dfSnt9p6HCLenCDyOeOL9poBATOEbMBFNfChjviUUVw6bCd22X8G8Z8Mb7
	kqxJdg8zCkDRVO0nM934FPle00OlQMdzIoL5YQZYys3QmmvAQiS7fP9iSKTUdtMIZ+cM8HwO7MVEW
	4y5cJKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZz0t-0000000D5BW-3hzM;
	Thu, 10 Jul 2025 21:41:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYZ-0000000Ct05-1Ens
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MK4CNI1qjxwtC9HF+fRdS0FwRfppyU32/LlmE1q202M=; b=minjiEiJiPakoJrs6allkjzVcp
	Fi9MVvrxgc/s5Lg9vImrLpoLpcVDCpsiwXANOG0ew/6FwwhyA3F9O21i6Crf8O1mGgcUAlafPvMD1
	D6qd1Sf9ZmZIfb1rGMtZ4TDMvKqbFI4LROXHLziEZnUwJf5SawhomZ0pvr/IFVRHvcoZnJW47cK6K
	+rQasDYzn3YvUf5iPMfkb8mN5y356dQJS5OdqALVj59vZEgdJyD3sptzNKjp4gjZjBsLzoAUb390c
	EsZW2AAAq/IHSaKMDtsb/+4TWBYBzf3lngZBLMLZ2GJu63Axgt9pziXApCCFv8X8Spsip33loz/0X
	oA0N2ucg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYW-000000098nE-0Y9j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178065; x=1783714065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YbFiBSQEyNsg4Tz2KUNUu1qOnS5RcKyYzosOASOh0uk=;
  b=EEtkBRYDIEs3qQj+O7/n4eTdt161PNsAHyY2ACHqjzz54/JsVPKPLZpb
   HYaTdfXjbRBXsm19X7Km1TcceRJBlOBiGGNxbY5RpUKxZmE+1qozg8es9
   AbCdqO1ZHnL15DYUG/5MdojUnhZIiTr29C5QzObTou4brWQYiHxj1HywJ
   zL8aSSm/Gsk0vLKjxThHDQm0rD3qqtITw5b/QTa1s7IiMcqhIKHqJxI8l
   l3ijdbPWq68FvIK5cNWrGyPbLdWDNVvQvzbbywaSIvH3u+XxeUv6i58SD
   CDbfFcDHeNos+nHtyx64lOvGz0K2sVy/M1Vj6Q5KDlZfS9sXlUoHbaZAl
   A==;
X-CSE-ConnectionGUID: qOQSLemoQZOGUxBCHa7nXg==
X-CSE-MsgGUID: 6pn2MI4sQe+bNBXBAvLrPw==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="275215673"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:32 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:32 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
Subject: [PATCH v3 15/32] clk: at91: clk-audio-pll: add support for parent_hw
Date: Thu, 10 Jul 2025 13:07:08 -0700
Message-ID: <bb2fe895daeeb0815452213a437bf2c9e3f6ebcf.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210744_622355_772E3011 
X-CRM114-Status: GOOD (  15.68  )
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
index 0feaf8497b60..519d71652619 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -157,15 +157,15 @@ struct clk_hw *of_clk_hw_pmc_get(struct of_phandle_args *clkspec, void *data);
 
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


