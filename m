Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6386BFD5307
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXXluKRBMP4Vwjfjm+Za6LqAZ8LJA358S/qpWs4fJAU=; b=RML9RYBUsQD2u9Bwf+0G4JG+S5
	iwizP3bFew3VPOmPc0+x9TLqf2xyHsoI+RHc4Q4Vc/2Jt3/p4uniaH72LdFh2pjpk04yBdI4pjnli
	G2OHh093idLXG0WLDJ2l9bc3GJYMx7ZZ7mqwPsqEfejNMcjhxUmzdtKvbwAxmXVLDlhqPpKUuNuaQ
	Gb1np+JTUDdeW2+72H03sRUks3JDvINsFJ9iE556R3xw/czlr/AzQI0JrIgvl+TcanLngVQKBcrT+
	gs6Qkr/VFvOxosdbBI++vfDT1dINzfFpD0a7prqT4KtUSknhKS33MSTGaLIErglnmGJfyScnZaR9J
	WwJECjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsKG-00000007tLA-3U54;
	Fri, 27 Feb 2026 07:31:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsKD-00000007tKA-2o35
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772177509; x=1803713509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8+V5iNchIOiwDg9bEpu4sW6lSMdgs6cI02ZreEZunDc=;
  b=ioowzAOCV5joefWkdGcaDfNcuZ+adf9xMT9HUJ7neZoOQew4GIgblpZZ
   AGi5lmgrYmQJBnHJ1zqr1Hgx10W8MaEr5rKPWPmDhXpAssKnVb/eBEQ/2
   VHJfwDTjvYSQIqhOIAfQZg6h1m2Wn0r98MpYtWz3PwkGD5/R+BgY2zWsZ
   M1CHq9V22+Od5Zcjd3uBY4CYQkeyGGrdGCrPvdIi8NQOpUW6oZ1mA6hRm
   shq4AuIilyeXzfYgB+eS/rEfbdPZIVzHjJDosl0vPOMCSEZypBLmZaBfv
   DmwlgTRvI6p28hBSpab1V1SNU+wfeoBnoXA+dU7OIAlkTgo9NXmJ8Zu+h
   A==;
X-CSE-ConnectionGUID: /AVa6bwHSqe24h8Jh3J90Q==
X-CSE-MsgGUID: rzaaIrPIRAWfh/6g1hOVTQ==
X-IronPort-AV: E=Sophos;i="6.21,313,1763449200"; 
   d="scan'208";a="54383808"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 00:31:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 00:31:25 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 00:31:21 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrei Simion <andrei.simion@microchip.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>
Subject: [PATCH 1/3] watchdog: at91sam9_wdt.h: Cleanup the header file
Date: Fri, 27 Feb 2026 13:01:14 +0530
Message-ID: <20260227073116.30447-2-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227073116.30447-1-balakrishnan.s@microchip.com>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_233149_779937_56B8A196 
X-CRM114-Status: GOOD (  10.94  )
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

From: Andrei Simion <andrei.simion@microchip.com>

This patch reorganizes the header file by renaming the registers using
a general pattern also this patch simplifies the watchdog disable logic
in the at91sam9_wdt.h header by differentiating between modern
(SAM9X60, SAMA7G5, SAM9X7) and legacy (SAMA5, AT91SAM9261) chips based
on the watchdog disable bit.
For modern chips, the disable bit is at bit 12, while for legacy chips
it is at bit 15.

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
[Remove Kconfig-based WDDIS selection and define explicit legacy and
modern masks]
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/at91sam9_wdt.h | 65 ++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
index 298d545df1a1..1e0aeecb489f 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -3,59 +3,58 @@
  * drivers/watchdog/at91sam9_wdt.h
  *
  * Copyright (C) 2007 Andrew Victor
  * Copyright (C) 2007 Atmel Corporation.
  * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
  *
  * Watchdog Timer (WDT) - System peripherals regsters.
  * Based on AT91SAM9261 datasheet revision D.
  * Based on SAM9X60 datasheet.
+ * Based on SAMA7G5 datasheet.
+ * Based on SAM9X75 datasheet.
  *
  */
 
 #ifndef AT91_WDT_H
 #define AT91_WDT_H
 
 #include <linux/bits.h>
 
-#define AT91_WDT_CR		0x00			/* Watchdog Control Register */
-#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
-#define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
-
-#define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
-#define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
-#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
-#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
-#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
+#define AT91_WDT_CR		0x00		/* Watchdog Control Register */
+#define  AT91_WDT_WDRSTT	BIT(0)		/* Restart */
+#define  AT91_WDT_KEY		(0xa5UL << 24)	/* KEY Password */
+#define AT91_WDT_MR		0x04		/* Watchdog Mode Register */
+#define  AT91_WDT_WDV		(0xfffUL << 0)	/* Counter Value */
 #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
-#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
-#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
-#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
-#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
-#define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
-#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
-#define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
-#define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
-
+#define  AT91_WDT_WDRSTEN	BIT(13)
+#define  AT91_WDT_WDRPROC	BIT(14)
+#define  AT91_WDT_WDD		(0xfffUL << 16)
+#define  AT91_WDT_WDDBGHLT	BIT(28)
+#define  AT91_WDT_WDIDLEHLT	BIT(29)
 #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
 #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
 #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
 
-/* Watchdog Timer Value Register */
-#define AT91_SAM9X60_VR		0x08
+#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
+#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
 
-/* Watchdog Window Level Register */
-#define AT91_SAM9X60_WLR	0x0c
-/* Watchdog Period Value */
-#define  AT91_SAM9X60_COUNTER	(0xfffUL << 0)
-#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
+#define AT91_WDT_VR		0x08	/* Watchdog Timer Value Register */
+#define AT91_WDT_ISR		0x1c	/* Interrupt Status Register */
+#define AT91_WDT_IER		0x14	/* Interrupt Enable Register */
+#define AT91_WDT_IDR		0x18	/* Interrupt Disable Register */
+#define AT91_WDT_WLR		0x0c	/* Watchdog Window Level Register */
+#define AT91_WDT_PERIODRST	BIT(4)	/* Period Reset */
+#define AT91_WDT_RPTHRST	BIT(5)		/* Minimum Restart Period */
+#define  AT91_WDT_PERINT	BIT(0)	/* Period Interrupt Enable */
+#define  AT91_WDT_COUNTER	(0xfffUL << 0)	/* Watchdog Period Value */
+#define  AT91_WDT_SET_COUNTER(x)	((x) & AT91_WDT_COUNTER)
 
-/* Interrupt Enable Register */
-#define AT91_SAM9X60_IER	0x14
-/* Period Interrupt Enable */
-#define  AT91_SAM9X60_PERINT	BIT(0)
-/* Interrupt Disable Register */
-#define AT91_SAM9X60_IDR	0x18
-/* Interrupt Status Register */
-#define AT91_SAM9X60_ISR	0x1c
+/*
+ * WDDIS bit differs by SoC:
+ *   - SAMA5, AT91SAM9261: bit 15
+ *   - SAM9X60, SAMA7G5, SAM9X75: bit 12
+ * Select at runtime via compatible string.
+ */
+#define AT91_WDT_WDDIS_LEGACY   BIT(15)
+#define AT91_WDT_WDDIS_MODERN   BIT(12)
 
 #endif
-- 
2.34.1


