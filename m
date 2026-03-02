Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07382EA4E09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crFdN56rHBOSnUuDgnkJFYDo/gXmmtU8J/jgcFR9SXo=; b=PpqjDsXBqAWZFg2LUxTAAJVe84
	DKsG2k4/VrtlBFmKdLUPr70LYE5Mybjqn9hZZtSZfQ+HZg2SclxMeT4QRbgUXvwmkmUHFZKkUWPbS
	bOABSOKE8qVxmevJQG7Iy3FLGrE7QE9x/+HoviSLZlBdybcKgknn0sQt316p2tRebb8GMmyDCLwpe
	Ld0H/uUd8zsMzjTic8TO/YStyX/O5tt6WVoXygFjj9+DixumjRzYI7UWuFZsdTHN/NFKoGVKQdKPi
	Qlv80ML0BMEhUPB4+sHrkghxoOWZVnL0T5rXGJ0ORdkvdiKGgpWE+o9cWwC2RPkoQPDpFy+9Wd/Bd
	0peuTTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4Jz-0000000DF0J-06Rr;
	Mon, 02 Mar 2026 14:32:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4Ju-0000000DEzQ-1d4i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:32:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61D1B1A1F34;
	Mon,  2 Mar 2026 14:32:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 355495FE89;
	Mon,  2 Mar 2026 14:32:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 495681036957F;
	Mon,  2 Mar 2026 15:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772461940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=crFdN56rHBOSnUuDgnkJFYDo/gXmmtU8J/jgcFR9SXo=;
	b=CI9pZs5TE1aVKq8tU8SQq5Jz4KyuJAFCyhf7y6ExAE/HaXjb0mbX1jscduPmv+9867GhfA
	4AyrBPw6BBBksk2WczzTcYVKFRWCuXikDgG6AjwACOLhITCi+jrBzMwCjSf+J1nlGbIKcg
	ltMeiBZZVcpY79thkEWxvdxfUfeK1N7e+OnktmKhXEaTKJVpY/YZN2g90rWBVFnoOUz1b+
	Nwf8sBDWRqKGjov8bA7Zj9F/OnhJK0NPXT7FlcdTim6fCv9vJZuN1Ey/DLxqCQViMnknEg
	xiMt1pNrpZBfN8xx198fuiWTUIEqW1S/4n0OsHRwpZ+Cn7IwHi7GTQQUd6OQnw==
Date: Mon, 2 Mar 2026 15:32:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net, andrei.simion@microchip.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: Re: [PATCH 1/2] watchdog: sama5d4_wdt: Fix WDDIS detection on
 SAM9X60 and SAMA7G5
Message-ID: <202603021432151ded59a4@mail.local>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
 <20260302113310.133989-2-balakrishnan.s@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302113310.133989-2-balakrishnan.s@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_063227_063284_5B98C458 
X-CRM114-Status: GOOD (  30.15  )
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

On 02/03/2026 17:03:09+0530, Balakrishnan Sambath wrote:
> The driver hardcoded AT91_WDT_WDDIS (bit 15) in wdt_enabled and the
> probe initial state readout. SAM9X60 and SAMA7G5 use bit 12
> (AT91_SAM9X60_WDDIS), causing incorrect WDDIS detection.
> 
> Introduce a per-device wddis_mask field to select the correct WDDIS
> bit based on the compatible string.
> 
> Fixes: 266da53c35fc ("watchdog: sama5d4: readout initial state")
> Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/watchdog/sama5d4_wdt.c | 48 +++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 13e72918338a..704b786cc2ec 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -24,37 +24,41 @@
>  #define WDT_DEFAULT_TIMEOUT	MAX_WDT_TIMEOUT
>  
>  #define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
>  
>  struct sama5d4_wdt {
>  	struct watchdog_device	wdd;
>  	void __iomem		*reg_base;
>  	u32			mr;
>  	u32			ir;
> +	u32			wddis_mask;
>  	unsigned long		last_ping;
>  	bool			need_irq;
>  	bool			sam9x60_support;
>  };
>  
>  static int wdt_timeout;
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  
>  module_param(wdt_timeout, int, 0);
>  MODULE_PARM_DESC(wdt_timeout,
>  	"Watchdog timeout in seconds. (default = "
>  	__MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
>  
>  module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout,
>  	"Watchdog cannot be stopped once started (default="
>  	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> -#define wdt_enabled (!(wdt->mr & AT91_WDT_WDDIS))
> +static inline bool wdt_enabled(struct sama5d4_wdt *wdt)
> +{
> +	return !(wdt->mr & wdt->wddis_mask);
> +}
>  
>  #define wdt_read(wdt, field) \
>  	readl_relaxed((wdt)->reg_base + (field))
>  
>  /* 4 slow clock periods is 4/32768 = 122.07µs*/
>  #define WDT_DELAY	usecs_to_jiffies(123)
>  
>  static void wdt_write(struct sama5d4_wdt *wdt, u32 field, u32 val)
>  {
> @@ -75,55 +79,49 @@ static void wdt_write_nosleep(struct sama5d4_wdt *wdt, u32 field, u32 val)
>  		udelay(123);
>  	writel_relaxed(val, wdt->reg_base + field);
>  	wdt->last_ping = jiffies;
>  }
>  
>  static int sama5d4_wdt_start(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	if (wdt->sam9x60_support) {
> +	if (wdt->sam9x60_support)
>  		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
> -		wdt->mr &= ~AT91_SAM9X60_WDDIS;
> -	} else {
> -		wdt->mr &= ~AT91_WDT_WDDIS;
> -	}
> +	wdt->mr &= ~wdt->wddis_mask;
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
>  }
>  
>  static int sama5d4_wdt_stop(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	if (wdt->sam9x60_support) {
> +	if (wdt->sam9x60_support)
>  		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
> -		wdt->mr |= AT91_SAM9X60_WDDIS;
> -	} else {
> -		wdt->mr |= AT91_WDT_WDDIS;
> -	}
> +	wdt->mr |= wdt->wddis_mask;
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
>  }
>  
>  static int sama5d4_wdt_ping(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
>  	wdt_write(wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
>  
>  	return 0;
>  }
>  
>  static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
> -				 unsigned int timeout)
> +				    unsigned int timeout)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  	u32 value = WDT_SEC2TICKS(timeout);
>  
>  	if (wdt->sam9x60_support) {
>  		wdt_write(wdt, AT91_SAM9X60_WLR,
>  			  AT91_SAM9X60_SET_COUNTER(value));
>  
>  		wdd->timeout = timeout;
> @@ -134,20 +132,20 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
>  	wdt->mr |= AT91_WDT_SET_WDV(value);
>  
>  	/*
>  	 * WDDIS has to be 0 when updating WDD/WDV. The datasheet states: When
>  	 * setting the WDDIS bit, and while it is set, the fields WDV and WDD
>  	 * must not be modified.
>  	 * If the watchdog is enabled, then the timeout can be updated. Else,
>  	 * wait that the user enables it.
>  	 */
> -	if (wdt_enabled)
> -		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~AT91_WDT_WDDIS);
> +	if (wdt_enabled(wdt))
> +		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~wdt->wddis_mask);
>  
>  	wdd->timeout = timeout;
>  
>  	return 0;
>  }
>  
>  static const struct watchdog_info sama5d4_wdt_info = {
>  	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
>  	.identity = "Atmel SAMA5D4 Watchdog",
> @@ -178,22 +176,19 @@ static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
>  	}
>  
>  	return IRQ_HANDLED;
>  }
>  
>  static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
>  {
>  	const char *tmp;
>  
> -	if (wdt->sam9x60_support)
> -		wdt->mr = AT91_SAM9X60_WDDIS;
> -	else
> -		wdt->mr = AT91_WDT_WDDIS;
> +	wdt->mr = wdt->wddis_mask;
>  
>  	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
>  	    !strcmp(tmp, "software"))
>  		wdt->need_irq = true;
>  
>  	if (of_property_read_bool(np, "atmel,idle-halt"))
>  		wdt->mr |= AT91_WDT_WDIDLEHLT;
>  
>  	if (of_property_read_bool(np, "atmel,dbg-halt"))
> @@ -207,27 +202,23 @@ static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
>  	u32 reg, val;
>  
>  	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
>  	/*
>  	 * When booting and resuming, the bootloader may have changed the
>  	 * watchdog configuration.
>  	 * If the watchdog is already running, we can safely update it.
>  	 * Else, we have to disable it properly.
>  	 */
> -	if (!wdt_enabled) {
> +	if (!wdt_enabled(wdt)) {
>  		reg = wdt_read(wdt, AT91_WDT_MR);
> -		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
> -			wdt_write_nosleep(wdt, AT91_WDT_MR,
> -					  reg | AT91_SAM9X60_WDDIS);
> -		else if (!wdt->sam9x60_support &&
> -			 (!(reg & AT91_WDT_WDDIS)))
> +		if (!(reg & wdt->wddis_mask))
>  			wdt_write_nosleep(wdt, AT91_WDT_MR,
> -					  reg | AT91_WDT_WDDIS);
> +					  reg | wdt->wddis_mask);
>  	}
>  
>  	if (wdt->sam9x60_support) {
>  		if (wdt->need_irq)
>  			wdt->ir = AT91_SAM9X60_PERINT;
>  		else
>  			wdt->mr |= AT91_SAM9X60_PERIODRST;
>  
>  		wdt_write(wdt, AT91_SAM9X60_IER, wdt->ir);
> @@ -267,18 +258,21 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  	wdd->ops = &sama5d4_wdt_ops;
>  	wdd->min_timeout = MIN_WDT_TIMEOUT;
>  	wdd->max_timeout = MAX_WDT_TIMEOUT;
>  	wdt->last_ping = jiffies;
>  
>  	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
>  	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
>  		wdt->sam9x60_support = true;
>  
> +	wdt->wddis_mask = wdt->sam9x60_support ? AT91_SAM9X60_WDDIS
> +						: AT91_WDT_WDDIS;
> +
>  	watchdog_set_drvdata(wdd, wdt);
>  
>  	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
>  
>  	wdt->reg_base = regs;
>  
>  	ret = of_sama5d4_wdt_init(dev->of_node, wdt);
> @@ -300,20 +294,20 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  		if (ret) {
>  			dev_err(dev, "cannot register interrupt handler\n");
>  			return ret;
>  		}
>  	}
>  
>  	watchdog_init_timeout(wdd, wdt_timeout, dev);
>  
>  	reg = wdt_read(wdt, AT91_WDT_MR);
> -	if (!(reg & AT91_WDT_WDDIS)) {
> -		wdt->mr &= ~AT91_WDT_WDDIS;
> +	if (!(reg & wdt->wddis_mask)) {
> +		wdt->mr &= ~wdt->wddis_mask;
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  	}
>  
>  	ret = sama5d4_wdt_init(wdt);
>  	if (ret)
>  		return ret;
>  
>  	watchdog_set_nowayout(wdd, nowayout);
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

