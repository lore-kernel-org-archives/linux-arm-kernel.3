Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FF7C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UC5JFD7QrnVYkwRUDVj+4ZL24sITqts7XrUZnZ7x/Q4=; b=h9gjdcx/jz14hkKBL4PvMN9o2d
	mzxKDdM5n0/t9EuaSBPXPFwrIN8+NYYG2o2VAByK3haIil2jKHe6IngxN/Nrsval5jk7oZEF65s5C
	D8NRcdKSpu8DMweXUwip+YsfwUhe9+yOjfxqWirm/q6t3aKUoaZLgQ5E+OG9Qt83430WxmyuqZ8d4
	OeFGCmIuoG91q3jHSf8rym8Hbga4bsCNer7xjdR9uwdNq28PINHMq5lm13AASS/YbaeJN0q7J1EmB
	ACRieo/Wph+KfE/2QbB8Y+Nt2oZTPDNSa+0vLpRlJGS3biukoEkTFnHJpBa/yM5qqw7f7tOLZ0NXj
	ZKTA3dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFvs-00000001qpz-1qWj;
	Mon, 14 Jul 2025 09:57:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFb8-00000001nXG-38As
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752485746; x=1784021746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GJVLDfxtNl/j4ZoNgtsTJXDQzR2Jxyppvp7EVZRz2DA=;
  b=cNW+MnIRP/nsbMiKoJ5M2Wjssd8ZOFsk9XniU4YQuOAaHXX18YDdCRS5
   mK9yIB0kk1BWmWa2ZvY7XQvpdiCvdEzpoIGMyHOqdb9ohpD2sZ5ZCfiSL
   aaYUcP7hoMrsF6Px7j1HuTqWHwJJ+Ryul4JL8Ud9lTDBZMKFhLl0iCypY
   2K9S0JxKztfQqv7Wy2J3thDsDM+agBQvEFUPkZ76FBCAsHQIXD3JqZHMO
   Z/6rvCq0shDT+okCoG+iTL2QBz/SvfRLyl9PPMUMH8w7lQZS1tQM2hN6T
   9w3MMZF79hBfC3jG7iUdmTmP/jwb7nDchDCWCefPz7aXMlJ6YAGStk85L
   A==;
X-CSE-ConnectionGUID: mtYVE3x4Sj+UnhzZ7qysFg==
X-CSE-MsgGUID: kFUKkyxyQiu7IpGMbzwELg==
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="44552087"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jul 2025 02:35:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Jul 2025 02:35:19 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Jul 2025 02:35:16 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Subject: [PATCH v2] clk: at91: sam9x7: update pll clk ranges
Date: Mon, 14 Jul 2025 15:05:12 +0530
Message-ID: <20250714093512.29944-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_023547_052216_976F922E 
X-CRM114-Status: GOOD (  12.41  )
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

Update the min, max ranges of the PLL clocks according to the latest
datasheet to be coherent in the driver. This patch solves the issues in
configuring the clocks related to peripherals with the desired frequency
within the range.

Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
Changes in v2:
- Adjusted the commit description to be generic.
---
 drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index cbb8b220f16b..ffab32b047a0 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
 
 /* Fractional PLL core output range. */
 static const struct clk_range plla_core_outputs[] = {
-	{ .min = 375000000, .max = 1600000000 },
+	{ .min = 800000000, .max = 1600000000 },
 };
 
 static const struct clk_range upll_core_outputs[] = {
-	{ .min = 600000000, .max = 1200000000 },
+	{ .min = 600000000, .max = 960000000 },
 };
 
 static const struct clk_range lvdspll_core_outputs[] = {
-	{ .min = 400000000, .max = 800000000 },
+	{ .min = 600000000, .max = 1200000000 },
 };
 
 static const struct clk_range audiopll_core_outputs[] = {
-	{ .min = 400000000, .max = 800000000 },
+	{ .min = 600000000, .max = 1200000000 },
 };
 
 static const struct clk_range plladiv2_core_outputs[] = {
-	{ .min = 375000000, .max = 1600000000 },
+	{ .min = 800000000, .max = 1600000000 },
 };
 
 /* Fractional PLL output range. */
 static const struct clk_range plla_outputs[] = {
-	{ .min = 732421, .max = 800000000 },
+	{ .min = 400000000, .max = 800000000 },
 };
 
 static const struct clk_range upll_outputs[] = {
-	{ .min = 300000000, .max = 600000000 },
+	{ .min = 300000000, .max = 480000000 },
 };
 
 static const struct clk_range lvdspll_outputs[] = {
-	{ .min = 10000000, .max = 800000000 },
+	{ .min = 175000000, .max = 550000000 },
 };
 
 static const struct clk_range audiopll_outputs[] = {
-	{ .min = 10000000, .max = 800000000 },
+	{ .min = 0, .max = 300000000 },
 };
 
 static const struct clk_range plladiv2_outputs[] = {
-	{ .min = 366210, .max = 400000000 },
+	{ .min = 200000000, .max = 400000000 },
 };
 
 /* PLL characteristics. */
-- 
2.34.1


