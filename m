Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BECC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JgJeZDn7ZvyZjVJ49eIV1jPrYZKZix1jR7/vn3KVKI=; b=18a+qMXU2l8CNgEx5LtSxFi+Tr
	dMWc3PpTrwB/EAZp0uGxxeyiu42nR5Pf+l/k97iHQ/3a71wuDEudZwzHIkbsqY08/uTVyIMPYQufO
	mEab2RIoFStu8/usc/MNqRaYzlBZf80zP7KXYvkfUcCZi3lkKcTMhKxh1wPsFr6uGgAbZ4HSPnLDa
	bimnt/ofMThQA+f50MBE6N6VgkOfcFaUYKqVagw/JBCwEYVcXyqFOkBdFYc6VLPySLH5+VeHG9aN1
	7Y9ATBc0zkZWgBEcKRyjwj+cBGh6lEq5zTQFLNYPqlUGm7ADTiGafdO7jLMWlZqWj7SocB1E4a/97
	kDxXjM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7iw-00000006PoU-1Al4;
	Tue, 24 Jun 2025 17:46:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5GS-000000062V2-3HsZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777728; x=1782313728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NFlza7NMXYr7yoaM4juKHHENgegAA1/AX4WT/TjqqEs=;
  b=e2HNTDCA+L1vubDwWniBh3LJHZT5+cPTuEhDl23/abJjR6X+NicVPj+x
   xnTPHEWKgZjeKCQerhi7rmoDCMydGdnzJGP0BCYbRRKiP53VFzdHCOT/y
   e1qhbbVAqiXshnCHSp60QQJBYI+oe2duS8zVEBeefmOFV9Y3JKB8Ap/Hq
   TdJoh367tKULj+gUX8DWYsDmocaJFbvtdQyjAwe0dcPnKS6mL4a90+Cqa
   44y+bYgKwPehUFOfHEAw23xLts4EC5uKC3wmoD7xd8SdbEHXs7/unQTA/
   p/j3Wsi6dho1k0IRjBK7s0WnsceSuCTI45aC1XivnLFG0zWB3CUcgdd7v
   w==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: elByiUfvT9SJiDW4RZv8kg==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688180"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:45 -0700
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
Subject: [PATCH v2 08/32] clk: at91: clk-programmable: use clk_parent_data
Date: Tue, 24 Jun 2025 08:08:05 -0700
Message-ID: <44cbeb6ac133a44e0c09da82434cda10c894a66a.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080848_885798_3E3F0D4A 
X-CRM114-Status: GOOD (  13.17  )
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
[ryan.wanner@microchip.com: Remove SoC specific changes those will be
added in a separate commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-programmable.c | 8 ++++----
 drivers/clk/at91/pmc.h              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.43.0


