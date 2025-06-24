Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE478C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D24anWOYuNH3iAxzn4+kDNN3XAlce9lKjGm5qn4Lqds=; b=eC/9Wh+FDDvzeWhTsajX+oZm0J
	rFK0sSbr6krwz50w9gOBjq9jd9kCpHH0IyMkN/p2edQqMVlFJ27sgcE48CeXkoqFRiU+Pnnfs27mu
	InxL5Sm6esw7Zi0CTAyBfcVGWDAZscs9FR9bkaPWEcteNX4KGB6S5Of6wU1xW/qy9I9lnanyLTvPa
	/90IloKCCEUT74bjAZ47Te6Lt9+ajS95f5q0LUdzIM9G7dLJ+59dxsUuwcWWiNBNmEi3FY9sB7jvT
	c5mTtKGO2fcd3rn8F2IysqY9C7PkeIxsMZhkNq5StnX0hoR2GsfoBZ2fNOjBWELT9YJd21zCjoWpf
	/SGG9FqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7Xg-00000006Ocn-3O3b;
	Tue, 24 Jun 2025 17:34:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5GQ-000000062U6-1zIp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777726; x=1782313726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/z69PibqywpVDUupVFU5et9XVf8qDTlwUsinAZCZ8UM=;
  b=Fm8R0HCulFPUEIKiIaTdB1QVVhlFV+0/4wYusE/StVgA7pm8cg1fL6bU
   HzpMfjjp4mE/DOHWDC2XHu0XWO/KpXh/aA8z/1qgZ8jHYktH+hk1RdlFL
   CI3yeEbGqd4T9dbr35HxSwRL8DmQKuBahRo0EWQKinYJ2hG/UmR+4gYL4
   1pwrgaBX2DWDcqLHdRQNiwPzZhgj1+ZbyXKeTss/qqmrsN/SPLaozaj2B
   3Ue3ns7/iZI/JWqt9p4gj6w5Jm60M/UO6hObwCpkWzMYIWjBhtjbjGcO0
   qmG+EXMbN0Fd/PvxWXj03HxAJ5dwt3J2hl95y+Lugp3myvSV/H9x4amOn
   g==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: Q0O/25CwQsu2txuQI1HkOw==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688174"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:36 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:36 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 04/32] clk: at91: clk-peripheral: switch to clk_parent_data
Date: Tue, 24 Jun 2025 08:08:01 -0700
Message-ID: <94aa65af65553f4251bcc9ca6420c8feafc27324.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080846_578696_FC1A9CBE 
X-CRM114-Status: GOOD (  13.20  )
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

Use struct clk_parent_data instead of parent_hw.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove the SoC specific changes those will
be added in a later commit. And adjust commit message]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-peripheral.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h            |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index c173a44c800a..ed97b3c0a66b 100644
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
@@ -448,7 +448,7 @@ struct clk_hw * __init
 at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 				    const struct clk_pcr_layout *layout,
 				    const char *name, const char *parent_name,
-				    struct clk_hw *parent_hw,
+				    struct clk_parent_data *parent_data,
 				    u32 id, const struct clk_range *range,
 				    int chg_pid, unsigned long flags)
 {
@@ -457,7 +457,7 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !(parent_name || parent_hw))
+	if (!name || !(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
@@ -465,8 +465,8 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
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
index b43f6652417f..b6f2aca1e1fd 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -226,13 +226,13 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 
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
 
-- 
2.43.0


