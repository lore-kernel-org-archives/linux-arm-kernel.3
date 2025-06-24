Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CEAC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkxMubFLqkhCiDQyXSLT8G/M0a9qZI0xJ45EQ4pIyUA=; b=06eRzExq+0eYmc6xz5J1gsgGv4
	iCxVJF9WuRBMoz0pI8JgmWS9kdcEYzRZG2x4JbB2gKl7Po1Y4Xfzs8TzhoYXaMGdH5T0thgiuTi3E
	q8x9JirG0p7SfaIBJFIbOCN+NImUs6vX7eC2B9eProeW6tARpG20TLaHo04JdCC8+RkLQffWR7bQK
	3yKqs/afJIa8bnD2B41xmFWJrk3/UaNxuGxNy0P75KzVs1M7ofqs+9xzUpqDKR+WRbGhhQbcRtdc7
	ROvVs2qSmUn8+m5RyaLBcQYYm2Qk8w62XoR1tWWKZ77IE1r8UcgJxXJb+6IFFrmUZMBBaG4YLO0dH
	1bQSJZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7eS-00000006PSX-2lhN;
	Tue, 24 Jun 2025 17:41:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5GR-000000062U6-3gOh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777727; x=1782313727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZDB97x4hn7BJDJn8U5FbCjOYcfLmkYwWAj8cLLlw6do=;
  b=RmQ6ABp8GTipeUEcvptm3gvKo462/PsYR29GewxUzSd9y7KDj79WlL0r
   ioC+FmN2Vw3UpJPZHk9wpRuFs6vILxyBM6wHFNpbF+VB7Dev7+gvFt+6l
   fGLpeQ2Yi8MGSqL0SsI6Ap/hvgLWuO1JlZIUcaz+/Usz0sxt+MNCx4NRd
   6OuSrd/vcRf9NOkdd5xKyqIs5gTQVjUjw2HNSjH+a7p92ecQ4Ecvx9LdY
   qj5MNSY5tS7EGauiKHoWEM79I5+gH/pZe0AMpWWvBjzrfrfzSibWgHL76
   WGYYNQQkGtg2T+RsLG63KuWaHAQIrLHs92id7KSrai58BAZCW5dgKem7U
   A==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: a6+NAS7ZQ2u5sHoJeOp1aw==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688178"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:37 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:37 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 07/32] clk: at91: clk-master: use clk_parent_data
Date: Tue, 24 Jun 2025 08:08:04 -0700
Message-ID: <361fa7d7f1f9579a38a27b7623cfa5c8c92f54d5.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080848_032161_14D37077 
X-CRM114-Status: GOOD (  12.43  )
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
[ryan.wanner@microchip.com: Remove SoC specific changes as they will be
added later. Adjust commit message to reflect the removal of the SoC
specific changes.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-master.c | 24 ++++++++++++------------
 drivers/clk/at91/pmc.h        |  6 +++---
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 7a544e429d34..cc4f3beb51e5 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -473,7 +473,7 @@ static struct clk_hw * __init
 at91_clk_register_master_internal(struct regmap *regmap,
 		const char *name, int num_parents,
 		const char **parent_names,
-		struct clk_hw **parent_hws,
+		struct clk_parent_data *parent_data,
 		const struct clk_master_layout *layout,
 		const struct clk_master_characteristics *characteristics,
 		const struct clk_ops *ops, spinlock_t *lock, u32 flags)
@@ -485,7 +485,7 @@ at91_clk_register_master_internal(struct regmap *regmap,
 	unsigned long irqflags;
 	int ret;
 
-	if (!name || !num_parents || !(parent_names || parent_hws) || !lock)
+	if (!name || !num_parents || !(parent_names || parent_data) || !lock)
 		return ERR_PTR(-EINVAL);
 
 	master = kzalloc(sizeof(*master), GFP_KERNEL);
@@ -494,8 +494,8 @@ at91_clk_register_master_internal(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
@@ -531,13 +531,13 @@ struct clk_hw * __init
 at91_clk_register_master_pres(struct regmap *regmap,
 		const char *name, int num_parents,
 		const char **parent_names,
-		struct clk_hw **parent_hws,
+		struct clk_parent_data *parent_data,
 		const struct clk_master_layout *layout,
 		const struct clk_master_characteristics *characteristics,
 		spinlock_t *lock)
 {
 	return at91_clk_register_master_internal(regmap, name, num_parents,
-						 parent_names, parent_hws, layout,
+						 parent_names, parent_data, layout,
 						 characteristics,
 						 &master_pres_ops,
 						 lock, CLK_SET_RATE_GATE);
@@ -546,7 +546,7 @@ at91_clk_register_master_pres(struct regmap *regmap,
 struct clk_hw * __init
 at91_clk_register_master_div(struct regmap *regmap,
 		const char *name, const char *parent_name,
-		struct clk_hw *parent_hw, const struct clk_master_layout *layout,
+		struct clk_parent_data *parent_data, const struct clk_master_layout *layout,
 		const struct clk_master_characteristics *characteristics,
 		spinlock_t *lock, u32 flags, u32 safe_div)
 {
@@ -560,7 +560,7 @@ at91_clk_register_master_div(struct regmap *regmap,
 
 	hw = at91_clk_register_master_internal(regmap, name, 1,
 					       parent_name ? &parent_name : NULL,
-					       parent_hw ? &parent_hw : NULL, layout,
+					       parent_data, layout,
 					       characteristics, ops,
 					       lock, flags);
 
@@ -812,7 +812,7 @@ struct clk_hw * __init
 at91_clk_sama7g5_register_master(struct regmap *regmap,
 				 const char *name, int num_parents,
 				 const char **parent_names,
-				 struct clk_hw **parent_hws,
+				 struct clk_parent_data *parent_data,
 				 u32 *mux_table,
 				 spinlock_t *lock, u8 id,
 				 bool critical, int chg_pid)
@@ -824,7 +824,7 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 	unsigned int val;
 	int ret;
 
-	if (!name || !num_parents || !(parent_names || parent_hws) || !mux_table ||
+	if (!name || !num_parents || !(parent_names || parent_data) || !mux_table ||
 	    !lock || id > MASTER_MAX_ID)
 		return ERR_PTR(-EINVAL);
 
@@ -834,8 +834,8 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &sama7g5_master_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index d9a04fddb0b1..54d472276fc9 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -204,14 +204,14 @@ at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_register_master_pres(struct regmap *regmap, const char *name,
 			      int num_parents, const char **parent_names,
-			      struct clk_hw **parent_hws,
+			      struct clk_parent_data *parent_data,
 			      const struct clk_master_layout *layout,
 			      const struct clk_master_characteristics *characteristics,
 			      spinlock_t *lock);
 
 struct clk_hw * __init
 at91_clk_register_master_div(struct regmap *regmap, const char *name,
-			     const char *parent_names, struct clk_hw *parent_hw,
+			     const char *parent_names, struct clk_parent_data *parent_data,
 			     const struct clk_master_layout *layout,
 			     const struct clk_master_characteristics *characteristics,
 			     spinlock_t *lock, u32 flags, u32 safe_div);
@@ -220,7 +220,7 @@ struct clk_hw * __init
 at91_clk_sama7g5_register_master(struct regmap *regmap,
 				 const char *name, int num_parents,
 				 const char **parent_names,
-				 struct clk_hw **parent_hws, u32 *mux_table,
+				 struct clk_parent_data *parent_data, u32 *mux_table,
 				 spinlock_t *lock, u8 id, bool critical,
 				 int chg_pid);
 
-- 
2.43.0


