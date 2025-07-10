Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3063BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMGcnYMuWWwnUV5qV//pHpPJgQFtrSroJWLHl/hdDlc=; b=eHJOFHPz9vnu8AQ4Te97q+x7Hy
	FG/OimqKhQ02p3doMXUXMNn3WCAaUsB/sT4ylKmI6n11kVBLdLsJEW+sPqEO5bOILWAswGy3YuiuY
	MWIJdFME0ckVmTOyB1+H2mF3lLL+ZlXMUZ4rp5pfrlBjYFXyCecWcK74G2lSh5DpVIcKM0NuXd468
	+o+2/opLHO8L1uhZZZcWCZqcJVl0qlBW9idNTWmWTpoAYjZmncsGrvU8PfWumMJmPQ8xsLdNMclKq
	LkD/2gvAQfHy0gksRUqQb652r5Oe2WCIibdVUMvSn8fqT4mcuGVTr8WD3w/z3rdTpdqLYd6s9OIg4
	c+SoYl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzwS-0000000DAxR-2DA1;
	Thu, 10 Jul 2025 22:40:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYx-0000000Ct67-0k9M
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MMGcnYMuWWwnUV5qV//pHpPJgQFtrSroJWLHl/hdDlc=; b=gXYl0PQgvrRxzgJcW6x4v0ogQ3
	f4VH/khy5K/quKMtAdTbpRkDKOs01HHKjnqytm/CzgwjC1C8Tj7aV0FqKWDoe64hKSAsOTRwfwNsA
	GRwSj+NzzQmwuskDx64aGrqJ933LZ3N9DXSrfm3Y8jwn2Nx4hATkpjuW20LWVGGYt4d3Tp/MWETet
	X39stY91DfGgOLPBvfiSqM0JfQ1X3HWPKfhJL6O5kHERcLxlkxQT6iRxZhCoRrJiTni4UrvVJGWLN
	iq8P2WgrDJbLp4A5nhRsLiCdFVuQWlXSlvCC458WsIwvcmEZfDFH4FO3AHLjosyAyt4d2vsaxM83B
	CAY9v07Q==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYs-000000098pc-49Wq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178087; x=1783714087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZSsX88TvWmNlDb7PhUNT9gM/eUrNfnXej0MF1ubmUhs=;
  b=HiJBrbDeyT6ronMqKHsgSJHPswFsCp/2cZX7TPamuM5K7zZy8Zooxluu
   5XetxRNqwMWNx1kDOK7Nmg7aqH+NmHOMSZaBHYQPk0m39RDMCOqJYLXiS
   DziJmX9PK50K+SkslODtjvEZnVuJFPANRpdKGS60LY26kYbc8Tsczm12k
   Y3bwMJGA5A5uspPzGQ3B0G7YtY6bLTFm7w6kguRBnQMpgDRbKDLu5qvEv
   zevKbVwl9RldsR3cEDOFBFVgnddDFv6h8OTrqGRcIWabyKELenSSZRntT
   VjFZ0FwBC/8H4se5rgAXVLTKBe+EYRCh+cl+PPBkn369dJjASi2TDEk9d
   A==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: pL8TVHCpQROS6yhNofZrLw==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448168"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:55 -0700
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
Subject: [PATCH v3 12/32] clk: at91: clk-system: use clk_parent_data
Date: Thu, 10 Jul 2025 13:07:05 -0700
Message-ID: <dfc2cda8c89dbbc22c07d7e5962a3caefaca4549.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210808_588139_A5466527 
X-CRM114-Status: GOOD (  14.80  )
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
[ryan.wanner@microchip: Update SAM9X75 clk-system to use parent_data.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-system.c | 8 ++++----
 drivers/clk/at91/pmc.h        | 2 +-
 drivers/clk/at91/sam9x7.c     | 2 +-
 drivers/clk/at91/sama7g5.c    | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
index 90eed39d0785..55f8e46fe9c7 100644
--- a/drivers/clk/at91/clk-system.c
+++ b/drivers/clk/at91/clk-system.c
@@ -105,7 +105,7 @@ static const struct clk_ops system_ops = {
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
-			 const char *parent_name, struct clk_hw *parent_hw, u8 id,
+			 const char *parent_name, struct clk_parent_data *parent_data, u8 id,
 			 unsigned long flags)
 {
 	struct clk_system *sys;
@@ -113,7 +113,7 @@ at91_clk_register_system(struct regmap *regmap, const char *name,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (!(parent_name || parent_hw) || id > SYSTEM_MAX_ID)
+	if (!(parent_name || parent_data) || id > SYSTEM_MAX_ID)
 		return ERR_PTR(-EINVAL);
 
 	sys = kzalloc(sizeof(*sys), GFP_KERNEL);
@@ -122,8 +122,8 @@ at91_clk_register_system(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &system_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index c66ee44255d7..87ab1211576f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -280,7 +280,7 @@ at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
-			 const char *parent_name, struct clk_hw *parent_hw,
+			 const char *parent_name, struct clk_parent_data *parent_data,
 			 u8 id, unsigned long flags);
 
 struct clk_hw * __init
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index fdff799f0a22..56243f6f7e65 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -904,7 +904,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	sam9x7_systemck[3].parent_hw = sam9x7_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(sam9x7_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sam9x7_systemck[i].n,
-					      NULL, sam9x7_systemck[i].parent_hw,
+					      NULL, &AT91_CLK_PD_HW(sam9x7_systemck[i].parent_hw),
 					      sam9x7_systemck[i].id,
 					      sam9x7_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 505db97e989b..954202e0e8f9 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1162,7 +1162,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < ARRAY_SIZE(sama7g5_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama7g5_systemck[i].n,
-					      NULL, sama7g5_pmc->pchws[i],
+					      NULL, &AT91_CLK_PD_HW(sama7g5_pmc->pchws[i]),
 					      sama7g5_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0


