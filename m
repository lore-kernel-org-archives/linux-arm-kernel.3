Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A752AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HO4yv2R+rvihTrZ5uiVKi9gKumZEXfwy0Q38NmiUDMc=; b=UDtKDETg+uLiNS+jq8QcU3uosE
	A47OoyW7e00YmjHPrM9KW1It0scm2DW8cywIIIUhAatTrlkWzmr9sizI4DR0FGBofGA5uqK2K0dmm
	sTLLmb7ReKRuzGvpu95UMkNPHwu6Tnv57sncD8GhAqKF2kVMimSZ5Yy2Wl6QYgEyUOcfg7dx07OTv
	ibvvCXILI8BIEkBiLVuKv0P4AcogiZatt0Ugf1+XltvaOHCyioqu+4lZah+f7JLJUJa6sxc8YHLwU
	qFfTLIhYpvvNi6o3c1uFlweoqVSlxokEkqNildy5kfKChmyZa4JVqMdtXs8aB+J5ZXiBAih+uH/VL
	EH9WVlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzie-0000000D9fZ-49BW;
	Thu, 10 Jul 2025 22:26:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYq-0000000Ct55-3xlD
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HO4yv2R+rvihTrZ5uiVKi9gKumZEXfwy0Q38NmiUDMc=; b=jiYESXVX7yYT9ibFYglTEjwEaq
	ec1c71KPPy0+CCRcV7ourVk7zzQzs5B9h06ayKEs94W94rzrX4Jb/1HeWoa7/atiJt8YuurdG3grZ
	+8nKSQMJTLmGZTPeiA05tSfKHTEIGV0euXCPg1H7dytmfPJe1+BYdwPhzzFLWW8GnuHsFXu3RCrCT
	8IL9mmjR+UREkkFlF3YOnTiVt+bwlTQAo1EK45fbe+Heg80ShVXtldYZprt77Hb2sWrs7O+mTqhot
	j8xkh+5l9WvppmeiG5tSLhwpoA+9j6zDXU6/yFpchQaxOOJQo9D2ATxD2Oc+7qnwWRK5kbaAkr0KH
	u1jGn5nQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYn-000000098pc-15r3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178081; x=1783714081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dmzN3tRvPXgb2oYN28OMYdlKH9V2K993WYw3DJZgQsc=;
  b=jt2v1sLea6LSn8/lRgwNmQM1XNyIl8gES/c580ESypeabJAGzbrOAp0i
   qlfCp/jIKy95gMR6lpzQpGDKc6nnKrc9cx0ZZMY1jcreXTN3gagHzEIhK
   Ii8UzS0cKLoPA6pCQGqwtQ1qcxEF5nBdxJv7S+WA3OQTNqv5E5yJeO9xN
   u9SiaMQY1+ktsvy1CT01iBbdU1D7QXOiHTnOZwfYlV5EM6c52rGHvh+Gf
   WAnBwh7ztMyZMZ4eVZUe2GdHb+P6NrtDAt8unAm1uAdvFATkVmheqYuoG
   qjQg5gpNr5AT7aJEP5pSf5AqZ0q30cKAUIA4KF+r5A7IQ5s6SHCLR13bU
   A==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: 6JFHviJmS2WLjHH68bd+dg==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448162"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:53 -0700
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
Subject: [PATCH v3 07/32] clk: at91: clk-utmi: use clk_parent_data
Date: Thu, 10 Jul 2025 13:07:00 -0700
Message-ID: <04739269232f6c7ffbe9308a2b993e6b6eb883c8.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210802_148238_D98DA119 
X-CRM114-Status: GOOD (  17.34  )
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
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-utmi.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h      |  4 ++--
 drivers/clk/at91/sama7g5.c  | 25 +++++++++++++++----------
 3 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index b991180beea1..38ffe4d712a5 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -144,7 +144,7 @@ static struct clk_hw * __init
 at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 				struct regmap *regmap_sfr,
 				const char *name, const char *parent_name,
-				struct clk_hw *parent_hw,
+				struct clk_parent_data *parent_data,
 				const struct clk_ops *ops, unsigned long flags)
 {
 	struct clk_utmi *utmi;
@@ -152,7 +152,7 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (!(parent_name || parent_hw))
+	if (!(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	utmi = kzalloc(sizeof(*utmi), GFP_KERNEL);
@@ -161,8 +161,8 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 
 	init.name = name;
 	init.ops = ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -185,10 +185,10 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
 		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw)
+		       struct clk_parent_data *parent_data)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, regmap_sfr, name,
-			parent_name, parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
+			parent_name, parent_data, &utmi_ops, CLK_SET_RATE_GATE);
 }
 
 static int clk_utmi_sama7g5_prepare(struct clk_hw *hw)
@@ -287,8 +287,8 @@ static const struct clk_ops sama7g5_utmi_ops = {
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap_pmc, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw)
+			       const char *parent_name, struct clk_parent_data *parent_data)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, NULL, name,
-			parent_name, parent_hw, &sama7g5_utmi_ops, 0);
+			parent_name, parent_data, &sama7g5_utmi_ops, 0);
 }
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index e32a5e85d08f..d9a04fddb0b1 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -299,10 +299,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
 		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw);
+		       struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw);
+			       const char *parent_name, struct clk_parent_data *parent_data);
 
 #endif /* __PMC_H_ */
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index f816a5551277..c4723b875a1d 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -975,30 +975,33 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
 	struct regmap *regmap;
-	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
 	struct clk_parent_data parent_data[2];
 	struct clk_hw *parent_hws[10];
+	struct clk *main_xtal;
 	bool bypass;
 	int i, j;
 
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
+	if (!td_slck_hw || !md_slck_hw)
+		return;
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	main_xtal = of_clk_get(np, main_xtal_index);
+	if (IS_ERR(main_xtal))
 		return;
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
-		return;
+		goto put_main_xtal;
 
 	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
 					nck(sama7g5_systemck),
 					nck(sama7g5_periphck),
 					nck(sama7g5_gck), 8);
 	if (!sama7g5_pmc)
-		return;
+		goto put_main_xtal;
 
 	alloc_mem = kmalloc(sizeof(void *) *
 			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
@@ -1039,19 +1042,18 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
 					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
-					hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
 					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
 									  main_xtal_index);
-					hw = main_xtal_hw;
+					parent_rate = clk_get_rate(main_xtal);
 					break;
 				default:
 					/* Should not happen. */
 					break;
 				}
 
-				parent_rate = clk_hw_get_rate(hw);
 				if (!parent_rate)
 					return;
 
@@ -1135,7 +1137,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
 	}
 
-	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL, main_xtal_hw);
+	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
+					    &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index));
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -1233,7 +1236,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7g5_pmc);
 
-	return;
+	goto put_main_xtal;
 
 err_free:
 	if (alloc_mem) {
@@ -1243,6 +1246,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	}
 
 	kfree(sama7g5_pmc);
+put_main_xtal:
+	clk_put(main_xtal);
 }
 
 /* Some clks are used for a clocksource */
-- 
2.43.0


