Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA64C98301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QY3bsyke3nbHDGRyXVvZjJvBR46V8coL1wMemKhw2dw=; b=EImdRBv7+WASBR+CjnFP10+Rfu
	PleWB9D/9eFMESEYCjaKuFNCTPKdHulhol3LUv01X9Pqa1lXZW1SEFU0UamF8NBU2j4Y1x6KAGU7B
	woEcPvKykZKbB9jGhNtBBXWGtO4oyaFm8iZpBZCaH924EXEZ8x8Z/AnQ7Kcau/z+1t8nkx564jdnI
	ByxIOx+/L1Q4Un+8xrS24jGt1JfLuXX2tqm2W04abCgXWfBXeVlCEwbvZQGVV4CBz91pR4/z/rfly
	P8L3aBd/yvM89ZMbuKZVhBj2PgG5/DbTKSMladRVLaz2xbA9lii7BYcCuwkRsMrWqDnkROgdxRxtd
	3pmxOeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq7E-0000000EkxP-3q0X;
	Fri, 16 Jan 2026 20:08:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6a-0000000EkAp-3OX4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594055; x=1800130055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RwuCeJAoS6L7ZHwLftG1bOzhbbKscMkg3opGOon6QHo=;
  b=QPrV1p5bHv7l4nL5WYEndrcIoKHX3umc7a+f+yiUF851k2aBXi7AUjM+
   QQe8MYiRyGz9BHDRFSp9s9jqyGQ1+zdFrgzqfGF6Dh+Rkbfmj+vaE7AvO
   Lnof6F8QQjz4oJQjRdbdeKHGdR5Hg+QTyNzrnsyV9/PD83RGeQfwL4IS4
   /X9yf6jG+GCKPU4AQ/y83t800DWQiUtkRWalPyKzH/yuT00W9HitjeEDo
   hl0K2CPpSvthN5KLirhjCO+G1Whg2mzR7l+d9i4WjXaximTqJ1nWITV6m
   gplAkq2DFqRGzdp4GrlSry9E7hZ8ZRLbP5oXXwJC/XBkoa0DYaSEVy8cw
   g==;
X-CSE-ConnectionGUID: 3LvvvroxTJyR6T9mab+TNA==
X-CSE-MsgGUID: uBHpHoHlSb+hcYTZXMj5Eg==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="51290364"
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
Subject: [PATCH v5 05/31] clk: at91: clk-peripheral: switch to clk_parent_data
Date: Fri, 16 Jan 2026 13:06:58 -0700
Message-ID: <c3ecf1983df013da6e1c295f1fa6faf40b2919f9.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120738_065787_FD87C3EC 
X-CRM114-Status: GOOD (  14.00  )
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

Use struct clk_parent_data instead of parent_hw for peripheral clocks.
The clk_parent_data is a more modern approach to the clock parent
registration.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X7 SoCs to the use the
structs.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-peripheral.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h            |  4 ++--
 drivers/clk/at91/sam9x7.c         |  2 +-
 drivers/clk/at91/sama7d65.c       |  2 +-
 drivers/clk/at91/sama7g5.c        |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index e700f40fd87f..497724811141 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -97,7 +97,7 @@ static const struct clk_ops peripheral_ops = {
 
 struct clk_hw * __init
 at91_clk_register_peripheral(struct regmap *regmap, const char *name,
-			     const char *parent_name, struct clk_hw *parent_hw,
+			     const char *parent_name, struct clk_parent_data *parent_data,
 			     u32 id)
 {
 	struct clk_peripheral *periph;
@@ -105,7 +105,7 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !(parent_name || parent_hw) || id > PERIPHERAL_ID_MAX)
+	if (!name || !(parent_name || parent_data) || id > PERIPHERAL_ID_MAX)
 		return ERR_PTR(-EINVAL);
 
 	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
@@ -114,8 +114,8 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &peripheral_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -458,7 +458,7 @@ struct clk_hw * __init
 at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 				    const struct clk_pcr_layout *layout,
 				    const char *name, const char *parent_name,
-				    struct clk_hw *parent_hw,
+				    struct clk_parent_data *parent_data,
 				    u32 id, const struct clk_range *range,
 				    int chg_pid, unsigned long flags)
 {
@@ -467,7 +467,7 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !(parent_name || parent_hw))
+	if (!name || !(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
@@ -475,8 +475,8 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 577a6db65ed0..950a4e570ebe 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -229,13 +229,13 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 
 struct clk_hw * __init
 at91_clk_register_peripheral(struct regmap *regmap, const char *name,
-			     const char *parent_name, struct clk_hw *parent_hw,
+			     const char *parent_name, struct clk_parent_data *parent_data,
 			     u32 id);
 struct clk_hw * __init
 at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 				    const struct clk_pcr_layout *layout,
 				    const char *name, const char *parent_name,
-				    struct clk_hw *parent_hw,
+				    struct clk_parent_data *parent_data,
 				    u32 id, const struct clk_range *range,
 				    int chg_pid, unsigned long flags);
 
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 6ec4d09e0b56..a764f2fe0f23 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -930,7 +930,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x7_pcr_layout,
 							 sam9x7_periphck[i].n,
-							 NULL, sam9x7_pmc->chws[PMC_MCK],
+							 NULL, &AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]),
 							 sam9x7_periphck[i].id,
 							 &range, INT_MIN,
 							 sam9x7_periphck[i].f);
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index fd4bf70323ab..7d99823ec5dc 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1310,7 +1310,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 							 &sama7d65_pcr_layout,
 							 sama7d65_periphck[i].n,
 							 NULL,
-							 sama7d65_mckx[sama7d65_periphck[i].p].hw,
+							 &AT91_CLK_PD_HW(sama7d65_mckx[sama7d65_periphck[i].p].hw),
 							 sama7d65_periphck[i].id,
 							 &sama7d65_periphck[i].r,
 							 sama7d65_periphck[i].chgp ? 0 :
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index c6550044cba1..e4c18b8a5c20 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1183,7 +1183,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						&sama7g5_pcr_layout,
 						sama7g5_periphck[i].n,
 						NULL,
-						sama7g5_mckx[sama7g5_periphck[i].p].hw,
+						&AT91_CLK_PD_HW(sama7g5_mckx[sama7g5_periphck[i].p].hw),
 						sama7g5_periphck[i].id,
 						&sama7g5_periphck[i].r,
 						sama7g5_periphck[i].chgp ? 0 :
-- 
2.43.0


