Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71343EB48F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcdr2eQOxwLJvKRo4UXY2FOvY6D82jvV/S9e0gItB3U=; b=UDnOPvIiNhJeWGiqqMLX8utori
	VIRqyQ0/trIniZH4Fo2N+TYJz2ZHaxSCjjjqaOF2qyhRWWssGqEMQzlbboLyrJ6C9qm6gFfbewEuu
	yPltOgW4Ps8N6v3x3PHZTJv5uGtOQyfRSzXKR8txWHD2F0+IYTljVQg0zPN6fziP1geePO25dfBnZ
	YSQptvQibkC01L8b5f+y8kqo+q47yFkHJ78s1TQMqZqKblIkDWhdmYGtDuJRfCIHyooYdWI8I/aN4
	DB68RDtCniDdiCzDo2YostlhbvWWxTAYKf2dU/fIDyhOCLMkESF2sJctxMfw4R0k6jUlgRzFy5qgV
	kaEFfpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTWc-00000001tGV-0uN9;
	Thu, 12 Feb 2026 10:02:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTWZ-00000001tEi-3SXL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 10:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770890535; x=1802426535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x7tYcKwCteLHiZwyHz4dHbxN0Th4mJJiCosWKhhKNhE=;
  b=af0fjgRGzS9zTVIRO+2kQQThqtWZmSZO5Oxi3ex3EGTdmeFXAWAmplwV
   Wv5l1yXW5cieRtrZzR+CxW4+fmVngrNfwmIEpyOkNz0YUY/cbtcjp1PBA
   EvJZ3C8aswVaCqtYycl7L7tfGCTcQMoz6UvYzqgETAIVCZNoJLA7ScK9+
   7YYlBMu8tkV7JVgrxb8u7JO866+bl/sl23ibd76x/ydHcs6PxNRnyAXuA
   KXFnsPRNozk4/OnQ6J4bfJvKoKc1DMpm7YTjdhFoQrOfoxo+rVxWO5sXw
   f1DcfR/MsR9NMfCsWL66r9t7xk3RnxF5F0esCkbwIn3N8tUN/kEECEx/g
   A==;
X-CSE-ConnectionGUID: J0RxFlJXSD2hBRyc9bDFXw==
X-CSE-MsgGUID: uurT8fWXRIWhSFHG2x9hgQ==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="52580034"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:02:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Thu, 12 Feb 2026 03:02:11 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 12 Feb 2026 03:02:08 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 1/4] clk: at91: sam9x7: Remove gmac peripheral and generic clock entries with ID 67
Date: Thu, 12 Feb 2026 12:01:44 +0200
Message-ID: <20260212100147.5007-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212100147.5007-1-mihai.sain@microchip.com>
References: <20260212100147.5007-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_020215_949022_A2C51514 
X-CRM114-Status: GOOD (  10.60  )
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

According with datasheet table 12.1 the instance ID 67 is reserved.
This change drops the gmactsu_clk and gmac_gclk entries from
the SAM9X7 clock description tables.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..d9603f1124d0 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -420,7 +420,6 @@ static const struct {
 	{ .n = "lvdsc_clk",	.id = 56, },
 	{ .n = "pit64b1_clk",	.id = 58, },
 	{ .n = "puf_clk",	.id = 59, },
-	{ .n = "gmactsu_clk",	.id = 67, },
 };
 
 /*
@@ -702,15 +701,6 @@ static const struct {
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
 	},
-
-	{
-		.n = "gmac_gclk",
-		.id = 67,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
-		.pp_mux_table = { 6, 8, },
-		.pp_count = 2,
-		.pp_chg_id = INT_MIN,
-	},
 };
 
 static void __init sam9x7_pmc_setup(struct device_node *np)
-- 
2.53.0


