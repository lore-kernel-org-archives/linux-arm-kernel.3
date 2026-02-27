Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FED9FD5306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SJK6V06fHepDB6IZe3xDlSYp8WlDKEiERjlKiOby/s=; b=mvPEugl1Wzu1Z/Ag2FJREw+OLH
	ojPm4RVXonHVqBsU06AWdCEL0+GWShURBgKLJMvrAXzyH+dWHQsMq7odWBc0b2TgQ/CculAteu5VY
	5mhUFxQnHGSejawWqVkkcOuPbO987Im9J2Gu9jVs+NKQByhE5HV8h/1xtEEAqVeNlJ/BseSoNRVz8
	Mc1jkOhDLk9kOnEhnp4YMxoeGLMsiERSUeQ0z5AKoedCGmvV9AEyNf2Ot+69+0EqlTu9G5f6pWcJa
	plPjwzLXvONjH/rYZtdA+cR+/ndwfCm0qAr6e9FeIkaaIwubDWqXF/RM2Fb5LB3+3KtRI8odgAneZ
	BJWW3vfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsKM-00000007tNA-1wi3;
	Fri, 27 Feb 2026 07:31:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsKG-00000007tKR-216f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772177513; x=1803713513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uw38JxW9SQFg5yvRQWMgdAVRw8MAPa94R0JCVi5ZRg4=;
  b=rvpeM9sBcojQyAgDGUZnifqTMjPO7MEBHe9ru0IM0XOgvJN/MsvvCXGY
   2NtCbAQhTORR/7GCn8MtOT7RMMapkcO6pW5yMgXRBpwyrTeH7MfOAjl1M
   STwtThi0EBQY6rC5nG30WgzyOsKShRZPP2Dkq1Gg8HcacXI8B5q4hjOAL
   FFum8htW3jXrjsjhLj0fzsC2Nj2wsLSz26zXtl+jxWgtuo0MK70PjnN6l
   gk4zrjqyImPNpn5b0Fm6DB0Bba7Y69JEYQXLJ8XwvslvJDwfSOjck9SNl
   KbLSKypqApE7ubXj9t+krT9snIKyg3JFS8aZxarEh3EERMC/O1dcXykKT
   g==;
X-CSE-ConnectionGUID: pqQRGmnkTLWZUXpRkz7jXw==
X-CSE-MsgGUID: 2g0Dt5UPR0SRgo8urMj53A==
X-IronPort-AV: E=Sophos;i="6.21,313,1763449200"; 
   d="scan'208";a="285335714"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2026 00:31:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Feb 2026 00:31:35 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 00:31:31 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: [PATCH 3/3] watchdog: at91sam9_wdt: Rename AT91_WDT_WDDIS to AT91_WDT_WDDIS_LEGACY
Date: Fri, 27 Feb 2026 13:01:16 +0530
Message-ID: <20260227073116.30447-4-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227073116.30447-1-balakrishnan.s@microchip.com>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_233152_527011_99C902A1 
X-CRM114-Status: GOOD (  11.76  )
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

Replace AT91_WDT_WDDIS with AT91_WDT_WDDIS_LEGACY to match the updated
bit definition naming.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/at91sam9_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index aba66b8e9d03..88a4c1ec99bd 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -162,20 +162,20 @@ static int at91_wdt_init(struct platform_device *pdev, struct at91wdt *wdt)
 
 	tmp = wdt_read(wdt, AT91_WDT_MR);
 	if ((tmp & mask) != (wdt->mr & mask)) {
 		if (tmp == WDT_MR_RESET) {
 			wdt_write(wdt, AT91_WDT_MR, wdt->mr);
 			tmp = wdt_read(wdt, AT91_WDT_MR);
 		}
 	}
 
-	if (tmp & AT91_WDT_WDDIS) {
-		if (wdt->mr & AT91_WDT_WDDIS)
+	if (tmp & AT91_WDT_WDDIS_LEGACY) {
+		if (wdt->mr & AT91_WDT_WDDIS_LEGACY)
 			return 0;
 		dev_err(dev, "watchdog is disabled\n");
 		return -EINVAL;
 	}
 
 	value = tmp & AT91_WDT_WDV;
 	delta = (tmp & AT91_WDT_WDD) >> 16;
 
 	if (delta < value)
@@ -297,20 +297,20 @@ static int of_at91wdt_init(struct device_node *np, struct at91wdt *wdt)
 	} else {
 		wdt->mr |= AT91_WDT_WDRSTEN;
 	}
 
 	if (!of_property_read_string(np, "atmel,reset-type", &tmp) &&
 	    !strcmp(tmp, "proc"))
 		wdt->mr |= AT91_WDT_WDRPROC;
 
 	if (of_property_read_bool(np, "atmel,disable")) {
-		wdt->mr |= AT91_WDT_WDDIS;
-		wdt->mr_mask &= AT91_WDT_WDDIS;
+		wdt->mr |= AT91_WDT_WDDIS_LEGACY;
+		wdt->mr_mask &= AT91_WDT_WDDIS_LEGACY;
 	}
 
 	if (of_property_read_bool(np, "atmel,idle-halt"))
 		wdt->mr |= AT91_WDT_WDIDLEHLT;
 
 	if (of_property_read_bool(np, "atmel,dbg-halt"))
 		wdt->mr |= AT91_WDT_WDDBGHLT;
 
 	wdt->mr |= max | ((max - min) << 16);
-- 
2.34.1


