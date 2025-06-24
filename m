Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAB4C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQ07hXg37gJxNbeIsq7DdEguyRE06FxHWimt6slIaik=; b=kyPb/X1GsHikU2kwXNbcYXU0ZW
	43vMrGSSJs8YPKqF5VOCCGqUvbaBBqBiyF1wdOWGFUNS2vvBDSAWhj2TfzVEwTOjHl2/i24n3gbp7
	hcowbQ1yhA12lsg9nOb4aKqL9qv0ALqmt5g9TjtsaAetApKXnvu3UomZ1eGbrYdF3MFHi7zaCCEV4
	S+h49hRvBBn9Pc6PzvtCxzQiN8bfKMqv+0Y4vhAAPdbvc0DRG7w+prLwkK5aTGZ4BgT5l47hGHigr
	v404twRTfZ+47wojSr9kDakfcwKC2Y32RiQ3CKYj3PC/1tYJxObrGnlhxR6dWmERRSiqgoG+z08x8
	Q6kvFh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7nR-00000006QIM-3TD3;
	Tue, 24 Jun 2025 17:51:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5GU-000000062UL-1awo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777730; x=1782313730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wcQCCQ4uaXtZbvFd2XYJ6W0tmvuYiFFyHsqGjqUUthA=;
  b=LKQhzouGYVECoIuARctFY4bbkoPOasd6ObtmETouLefhF7y7rbpHUl4b
   LvxkDJe+t30X/V6OTfE0CJaLaXc2IPxD56n5SW+zIgqS53Tp05x20MiUC
   ZIcf66LMhjQgUg2ob7e7W8TLbmglMW/o5W2OcyTOak7MumtNUUJS5xQl3
   SloouTlZclcztlTec+UO7WpvOvE8uEYYNJZzF1Pj8ZSOlP9hrstIcOn1T
   g2OpDHW9dsBpCD4QD90g2SmhIar5vAWej0kJH5pkypUTn0dRVBV+S9IXM
   f9H4sGyJC2XE9LC4anQ6nCfoih8E7mO69Yb6y3aH1nXbOHgSCm1r6NobW
   A==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: qwvEBGcpT7WaoKH9MHFjVw==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:46 -0700
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
Subject: [PATCH v2 11/32] clk: at91: clk-system: use clk_parent_data
Date: Tue, 24 Jun 2025 08:08:08 -0700
Message-ID: <59b77d6860468d607020741bbd2050fd01730c6f.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080850_487147_9E04F932 
X-CRM114-Status: GOOD (  13.16  )
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
[ryan.wanner@microchip.com: Remove SoC specific changes.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-system.c | 8 ++++----
 drivers/clk/at91/pmc.h        | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.43.0


