Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337B1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B0VCno+/KYk0WATMZR9ALJp9vN4cHeF4E6A24Ks5Zmk=; b=y8fy2iEOVOI6/T5jaz1MKSpcu+
	CdDqeOuPSTDGolKYG8OfqkOtfKMN8f9jJPOWfdP9+W8VY+Ig2+UXCsDCm0RGjGo6OpAnF8YvlRvDe
	8TP+sb83tYL7azUpiDeRLvCfAxnigP9AAOBsUnxEhQHo2rqR1YtZA3QhY+++M7bZAZ9+2g6kHEIye
	8bTvLwVtG22cUYDJlbUaCUcuoP21G2V7oLux+ZnMHc4nc2Jsvmwf9MbtzLpVVWnDNL1sIHXLOiFA2
	yyIErFLEZJhutaWJxXTYh+xvBsrG1328iB2benTv4MOH8kvAeHwGSD0IK3UFgnMJ35wLNujgSIseC
	sWM5uGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOueH-00000006ECe-0G50;
	Tue, 10 Jun 2025 08:48:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuc7-00000006Dtz-1d1Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749545147; x=1781081147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CBoEIbibXehI8+FpDHDg4a7tKFvTVVVf5mh6WK6oyMs=;
  b=hg9ctzwZRjT+NHNcZVfnzcLPvI9YjpAuQU1hQY9+wQsxMWyyiRbKLiNL
   h1BLrjo/ka/pgyiVAU5HMFEOOX4ZzVQ3IDXFZ5rGzNJ3ZmJ6dMZ8Ly7nn
   UaOW+bD5+jvoDBsARhOk2n8OX/FwEIAyTNy0Wc0ENZOhjMR1kC0P5bUAH
   ZlhBK0HL1UdbRgIMIwvDnZCl9ozmhKQrZO6ozOJPGkjO7OGplwOD8EPSz
   0p+/oa7xbY+tjSxJzANTvSy7aDaAXI2zj6R0V2B9W/2SlTflJb6HYgLl0
   k2yXJrFvHvcR0GVxxcm/yXkIGvvRSl/CSyBAdywZcZGtDZ6MQ8RwIFXu2
   A==;
X-CSE-ConnectionGUID: sMirRGKoSbKszKIj10evvQ==
X-CSE-MsgGUID: BC6P4IJZRNmtkQ3xmqVQbw==
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="210101719"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2025 01:45:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 10 Jun 2025 01:45:10 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 10 Jun 2025 01:45:06 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Subject: [PATCH] clk: at91: sam9x7: update pll clk ranges
Date: Tue, 10 Jun 2025 14:15:03 +0530
Message-ID: <20250610084503.69749-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_014547_657339_EA5F7CF1 
X-CRM114-Status: GOOD (  10.90  )
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
datasheet to be coherent in the driver. This patch apparently solves
issues in obtaining the right sdio frequency.

Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
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
2.45.2


