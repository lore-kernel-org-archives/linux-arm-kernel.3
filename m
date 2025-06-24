Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638CDC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EveziHqkUJ7XjPFw9rywnF/TYRL6s3dziqGP5c8wGg4=; b=MWeAcS2ZULFUI4QKPsCkslS1we
	7n2dQ/8gydFd1ExMYdkLmjAQtHu3cv0uASgr3eMbb7X+i7tAGDT32hp5jwQ+7NtQQSgLBIyZdZ5Nl
	SyGhDTdEWRoebQnARE8xG1/s8pJGHB1cQWcPOOP/LvDI/cEzxagF/qME5ADi2sQVCWoGXfhEllmQr
	0rQXbdlhazDaivFMQtl2nQeScmUShiordOsy2mtBIOJsjkYj3wpHeQR0Hlv0HdkwXbwtOzsrAQMAW
	oL6bOrMSXatbKQn/lrboyfb6HmerFlKzuxBcBgXhC6RejMwnqWUaCmVKmPvlo9hGCTDH2gbhiIjK9
	WEk2PQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8Yx-00000006WvL-0Ahc;
	Tue, 24 Jun 2025 18:40:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5HE-000000062m2-3bFg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777776; x=1782313776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4m0mSB0qMTXb2csR88OxbItjA7gFCwW1bRUmBS2WlCg=;
  b=v519jOTZa/t1swqDmWDXp7yegSPUJa4dfafnbYDjwVTzf+21Bm3hjtDG
   mzVQN6fgMkjoECk43GFDYxzBQgGwmG5/OAQOMgpWKilIZng6pQzqvKxZ4
   i8xvppmzy9Nr6kNRgKXZOg/CeLkQI5ekpz6hlcwAFZj1Q1afVFk6AmxZC
   Fq61XFRUyc8eP88dH1vakz6VYHVxzsd3TK2TOBnTypASv48+QoMfcNN0i
   ZDa+ENk2WtDoAoXFaMN/4RhV4UK/5nw+SPir3ehX8d4H2c0IXwE+ewBpE
   5VEjgsdQiOFTxMscSaR/IEY5Kx0Cynt/pKsVs9I8ScqWNSIhebmY868XL
   Q==;
X-CSE-ConnectionGUID: aaR+vTR6QzCaLHJjoz8HzA==
X-CSE-MsgGUID: KA0Z3Rr4SrCGEgboNrq4RA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="43755112"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:38 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:38 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 15/32] clk: at91: clk-h32mx: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:12 -0700
Message-ID: <5e9bfd1ee862b83410cc6579e47cb291ee6aeaf7.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080936_958355_45A575DD 
X-CRM114-Status: GOOD (  15.73  )
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

Add support for parent_hw in h32mx clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-h32mx were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-h32mx.c | 11 +++++++----
 drivers/clk/at91/dt-compat.c |  2 +-
 drivers/clk/at91/pmc.h       |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index 1e6c12eeda10..4b709f9bd831 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -83,10 +83,10 @@ static const struct clk_ops h32mx_ops = {
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name)
+			const char *parent_name, struct clk_parent_data *parent_data)
 {
 	struct clk_sama5d4_h32mx *h32mxclk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	h32mxclk = kzalloc(sizeof(*h32mxclk), GFP_KERNEL);
@@ -95,8 +95,11 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &h32mx_ops;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
+	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
 	h32mxclk->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 3285e3110b58..ccdeba3a1130 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -201,7 +201,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_h32mx(regmap, name, parent_name);
+	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index df2deb134a8d..fe42700df6db 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -177,7 +177,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name);
+			const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
-- 
2.43.0


