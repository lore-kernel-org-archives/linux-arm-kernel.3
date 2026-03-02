Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6A7E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wi0Tbf5c79frK5mw3jkzSVA9/07UDUjKjaWt1OzQ+A4=; b=vqWKVdSVOVIUPuJViawxb2AQ+T
	3I+rlIiKzZA+DB3AXvbaxqQ8Q/rWj0g1WxEnO1aFmGXwG3Fp7QYFZLFsLJ86nB74gHsHuQSWeB7et
	23C/85BKygnWSjT/m08X+WvI/Z2sZSz81B1xG1NskILdA+HNtLMhL4msAiQw7g7xwACpHMtEc/UN4
	xBj4oO60czz0RUTc2HdonH5axkmYtWKfQ0e96Ju/4FFy37+53xi6ZGsunYBycByuzsHWzpw71QRiQ
	5PaLCW0d6lIZkNimCfCwS/dfc4+lGyuWjCcxqgqY+5AX9k0dX+TCQ6aihTEtrWQ+JLDgR1lfYaai+
	dU27m9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1X5-0000000Cplg-170F;
	Mon, 02 Mar 2026 11:33:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1X3-0000000Cpkw-1k6x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772451229; x=1803987229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi6mDeLUYAi34DWMvp/7dxXLg8jcp1nz+M4Ea+q5TZo=;
  b=p3oGAeajx9R7jVmOJ4PAW1Iby0b1JQtPUhvWLcHQ+KcPWwl2fpHeLWhv
   x2D+nzlwK1t5u7ZegKzFndKs/FcoABeK860srvhe0eu/9UrkMCfxnGt45
   djjPQVtOvdsikrQWFFL6G899RowyebIAmdHKwVElvPY0UxiyiTCzCNWvp
   rL+RoVGauVBVGdfrpZ/J676wg2tA627E6Owf5ZmJ8biLkm/fvrIYYv7wW
   yI5kwbUvo2TxWIPQ6BsFWdHy7dzR1bDq9BfUwqJFYtKA0Ry2DlSZ0EFE7
   3PX3/u5fquTpoySS/oW8MxFu8svmlR5qCuBViJsgwHyqW/udZSqDnXcmS
   Q==;
X-CSE-ConnectionGUID: R6kAG1m/QI27bcgiSIY67w==
X-CSE-MsgGUID: fBBBJlpLRx+h9sHU7QGuEw==
X-IronPort-AV: E=Sophos;i="6.21,319,1763449200"; 
   d="scan'208";a="61522905"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Mar 2026 04:33:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Mar 2026 04:33:19 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 04:33:15 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-watchdog@vger.kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<alexandre.belloni@bootlin.com>, <andrei.simion@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH 1/2] watchdog: sama5d4_wdt: Fix WDDIS detection on SAM9X60 and SAMA7G5
Date: Mon, 2 Mar 2026 17:03:09 +0530
Message-ID: <20260302113310.133989-2-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302113310.133989-1-balakrishnan.s@microchip.com>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_033349_486721_941726AB 
X-CRM114-Status: GOOD (  20.12  )
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

The driver hardcoded AT91_WDT_WDDIS (bit 15) in wdt_enabled and the
probe initial state readout. SAM9X60 and SAMA7G5 use bit 12
(AT91_SAM9X60_WDDIS), causing incorrect WDDIS detection.

Introduce a per-device wddis_mask field to select the correct WDDIS
bit based on the compatible string.

Fixes: 266da53c35fc ("watchdog: sama5d4: readout initial state")
Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/sama5d4_wdt.c | 48 +++++++++++++++-------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index 13e72918338a..704b786cc2ec 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -24,37 +24,41 @@
 #define WDT_DEFAULT_TIMEOUT	MAX_WDT_TIMEOUT
 
 #define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
 
 struct sama5d4_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*reg_base;
 	u32			mr;
 	u32			ir;
+	u32			wddis_mask;
 	unsigned long		last_ping;
 	bool			need_irq;
 	bool			sam9x60_support;
 };
 
 static int wdt_timeout;
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
 module_param(wdt_timeout, int, 0);
 MODULE_PARM_DESC(wdt_timeout,
 	"Watchdog timeout in seconds. (default = "
 	__MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
 
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout,
 	"Watchdog cannot be stopped once started (default="
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-#define wdt_enabled (!(wdt->mr & AT91_WDT_WDDIS))
+static inline bool wdt_enabled(struct sama5d4_wdt *wdt)
+{
+	return !(wdt->mr & wdt->wddis_mask);
+}
 
 #define wdt_read(wdt, field) \
 	readl_relaxed((wdt)->reg_base + (field))
 
 /* 4 slow clock periods is 4/32768 = 122.07µs*/
 #define WDT_DELAY	usecs_to_jiffies(123)
 
 static void wdt_write(struct sama5d4_wdt *wdt, u32 field, u32 val)
 {
@@ -75,55 +79,49 @@ static void wdt_write_nosleep(struct sama5d4_wdt *wdt, u32 field, u32 val)
 		udelay(123);
 	writel_relaxed(val, wdt->reg_base + field);
 	wdt->last_ping = jiffies;
 }
 
 static int sama5d4_wdt_start(struct watchdog_device *wdd)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 
-	if (wdt->sam9x60_support) {
+	if (wdt->sam9x60_support)
 		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
-		wdt->mr &= ~AT91_SAM9X60_WDDIS;
-	} else {
-		wdt->mr &= ~AT91_WDT_WDDIS;
-	}
+	wdt->mr &= ~wdt->wddis_mask;
 	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
 
 	return 0;
 }
 
 static int sama5d4_wdt_stop(struct watchdog_device *wdd)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 
-	if (wdt->sam9x60_support) {
+	if (wdt->sam9x60_support)
 		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
-		wdt->mr |= AT91_SAM9X60_WDDIS;
-	} else {
-		wdt->mr |= AT91_WDT_WDDIS;
-	}
+	wdt->mr |= wdt->wddis_mask;
 	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
 
 	return 0;
 }
 
 static int sama5d4_wdt_ping(struct watchdog_device *wdd)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 
 	wdt_write(wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
 
 	return 0;
 }
 
 static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
-				 unsigned int timeout)
+				    unsigned int timeout)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 	u32 value = WDT_SEC2TICKS(timeout);
 
 	if (wdt->sam9x60_support) {
 		wdt_write(wdt, AT91_SAM9X60_WLR,
 			  AT91_SAM9X60_SET_COUNTER(value));
 
 		wdd->timeout = timeout;
@@ -134,20 +132,20 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
 	wdt->mr |= AT91_WDT_SET_WDV(value);
 
 	/*
 	 * WDDIS has to be 0 when updating WDD/WDV. The datasheet states: When
 	 * setting the WDDIS bit, and while it is set, the fields WDV and WDD
 	 * must not be modified.
 	 * If the watchdog is enabled, then the timeout can be updated. Else,
 	 * wait that the user enables it.
 	 */
-	if (wdt_enabled)
-		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~AT91_WDT_WDDIS);
+	if (wdt_enabled(wdt))
+		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~wdt->wddis_mask);
 
 	wdd->timeout = timeout;
 
 	return 0;
 }
 
 static const struct watchdog_info sama5d4_wdt_info = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
 	.identity = "Atmel SAMA5D4 Watchdog",
@@ -178,22 +176,19 @@ static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
 	}
 
 	return IRQ_HANDLED;
 }
 
 static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
 {
 	const char *tmp;
 
-	if (wdt->sam9x60_support)
-		wdt->mr = AT91_SAM9X60_WDDIS;
-	else
-		wdt->mr = AT91_WDT_WDDIS;
+	wdt->mr = wdt->wddis_mask;
 
 	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
 	    !strcmp(tmp, "software"))
 		wdt->need_irq = true;
 
 	if (of_property_read_bool(np, "atmel,idle-halt"))
 		wdt->mr |= AT91_WDT_WDIDLEHLT;
 
 	if (of_property_read_bool(np, "atmel,dbg-halt"))
@@ -207,27 +202,23 @@ static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
 	u32 reg, val;
 
 	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
 	/*
 	 * When booting and resuming, the bootloader may have changed the
 	 * watchdog configuration.
 	 * If the watchdog is already running, we can safely update it.
 	 * Else, we have to disable it properly.
 	 */
-	if (!wdt_enabled) {
+	if (!wdt_enabled(wdt)) {
 		reg = wdt_read(wdt, AT91_WDT_MR);
-		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
-			wdt_write_nosleep(wdt, AT91_WDT_MR,
-					  reg | AT91_SAM9X60_WDDIS);
-		else if (!wdt->sam9x60_support &&
-			 (!(reg & AT91_WDT_WDDIS)))
+		if (!(reg & wdt->wddis_mask))
 			wdt_write_nosleep(wdt, AT91_WDT_MR,
-					  reg | AT91_WDT_WDDIS);
+					  reg | wdt->wddis_mask);
 	}
 
 	if (wdt->sam9x60_support) {
 		if (wdt->need_irq)
 			wdt->ir = AT91_SAM9X60_PERINT;
 		else
 			wdt->mr |= AT91_SAM9X60_PERIODRST;
 
 		wdt_write(wdt, AT91_SAM9X60_IER, wdt->ir);
@@ -267,18 +258,21 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	wdd->ops = &sama5d4_wdt_ops;
 	wdd->min_timeout = MIN_WDT_TIMEOUT;
 	wdd->max_timeout = MAX_WDT_TIMEOUT;
 	wdt->last_ping = jiffies;
 
 	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
 	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
 		wdt->sam9x60_support = true;
 
+	wdt->wddis_mask = wdt->sam9x60_support ? AT91_SAM9X60_WDDIS
+						: AT91_WDT_WDDIS;
+
 	watchdog_set_drvdata(wdd, wdt);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
 	wdt->reg_base = regs;
 
 	ret = of_sama5d4_wdt_init(dev->of_node, wdt);
@@ -300,20 +294,20 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(dev, "cannot register interrupt handler\n");
 			return ret;
 		}
 	}
 
 	watchdog_init_timeout(wdd, wdt_timeout, dev);
 
 	reg = wdt_read(wdt, AT91_WDT_MR);
-	if (!(reg & AT91_WDT_WDDIS)) {
-		wdt->mr &= ~AT91_WDT_WDDIS;
+	if (!(reg & wdt->wddis_mask)) {
+		wdt->mr &= ~wdt->wddis_mask;
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	}
 
 	ret = sama5d4_wdt_init(wdt);
 	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(wdd, nowayout);
 
-- 
2.34.1


