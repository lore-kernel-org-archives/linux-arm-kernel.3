Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A85DE9B368
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ite0ZnEcDPJTp0yi5bIAJqPb1BgR0y74CpiH0LsTCg=; b=tBn9Sh6L+EulPcxXcioYMY/siU
	AXVR0EgtPHV+5SPBqXPq0931u3Go12juRnKp+kcQahJZuUjbRwkQLk7+a9BSFpcC9aWbA9fMDqwmJ
	51s4e8KnvIc1knzSrYDL/W+ttpTWJUAVahMTjwYHiXsef08eqpovQ+0JHgi7VAcpFmpsLE5dHMWk6
	cKx7XRwuLypde3AXdyyzJjNE/KLNXq13l1qa6SYPbC8Q7VdsYCHH45kng6Kno9xwUSvP8qOAhn7lQ
	SeedRB/BDrOAjJ8Eg3shrcXjVdAV56dweeSJVP6ObfIjhegTk32QaXR7Q55jgcXkm1qJGlpCcOGwf
	UVY8jk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Wx-0000000Cpii-3x48;
	Mon, 02 Mar 2026 11:33:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Wu-0000000CphI-30aA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772451221; x=1803987221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VPkfhe4C3hHwMYweD5UGKLva5GXNQHDs6Rbi8s6IllE=;
  b=NFX3R/mAIaNsBIhs3aFR9vfyFBpBSbieOXNeikwOwtKA7dhVYK51GjC0
   r8x2lFOgRgMl1KDtoV0eI2SJu20Nul2t0LfFvWygooPtt1GipS2+Ja1w5
   RDurQHhQCqV+g1jY4snrQyCdeiqyFxMjW36r9tZrhsy7ZUkbP66rIQ2Pz
   FAgCdXIpl5rvaqbE7jvVrI9o96Zu9WUj42J4P8smgGpGuQi5X7Zk3DFm1
   j4olFwq5+MjkKLQQokvupT/yKqicFPu9So/c54A/gQZxBp5qJNfX1ya8O
   KTLFDCO2DCFUwZkYNHZTRivGQh2ipvVjM5Gk3hfvg71jtc594WlF3TLMt
   Q==;
X-CSE-ConnectionGUID: Btinl9WeT2+oaoBxEtKcig==
X-CSE-MsgGUID: CTSiwOYrQgG3sQtNUzjZZQ==
X-IronPort-AV: E=Sophos;i="6.21,319,1763449200"; 
   d="scan'208";a="54070301"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:33:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 04:33:23 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 04:33:19 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-watchdog@vger.kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<alexandre.belloni@bootlin.com>, <andrei.simion@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
Subject: [PATCH 2/2] watchdog: at91sam9_wdt.h: Document WDDIS bit position per SoC family
Date: Mon, 2 Mar 2026 17:03:10 +0530
Message-ID: <20260302113310.133989-3-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302113310.133989-1-balakrishnan.s@microchip.com>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_033340_764234_FCE1377D 
X-CRM114-Status: GOOD (  10.82  )
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

AT91_WDT_WDDIS (bit 15) applies to SAMA5/AT91SAM9261 and
AT91_SAM9X60_WDDIS (bit 12) to SAM9X60/SAMA7G5/SAM9X75. Update
comments to reflect this and add SAMA7G5 and SAM9X75 datasheet
references to the file header.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/at91sam9_wdt.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
index 298d545df1a1..2020694f8f6f 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -3,40 +3,42 @@
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
 
 #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
 #define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
 #define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
 
 #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
 #define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
 #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
 #define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
 #define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
 #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
-#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
+#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable (SAM9X60, SAMA7G5, SAM9X75) */
 #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
 #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
-#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
+#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable (SAMA5, AT91SAM9261) */
 #define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
 #define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
 #define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
 #define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
 
 #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
 #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
 #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
 
-- 
2.34.1


