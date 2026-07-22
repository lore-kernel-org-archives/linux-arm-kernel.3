Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E8C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh/yNPDezdV0HMgSY5ouqiscRtqRQg3+qt8ontK4cK4=; b=CyI2zvPmT4oe5EqM8H7Tb+GHTa
	ASo/Fhwh1ocHXDi3RN6tHbb1h0R9+8gqycRfXXuV4yFwAUMWE42U904gaRA6a8Q0E9+xhI/rs8mfg
	6AuxSp3hQNXWcmKl+gPwSQpDDafuXqOev07RsIbcQSXfjsv08OV6es9YowV+716Kk983Q1QwjZzvR
	A7gWAYOYx4mSyx5ZPYWPg09eF6ToyFrkFS4qJKkq3WBQV+xQ0CxlIDa+5YivFA8ML1fjzNvz6EqsC
	3XmHzsABqMcL+FKHln/rq4no7CQX+QA+YjhB2qHUq4hQ/4QIxnCCE1cxI0i+V/6xlbgqHSnXZwXyl
	/ri23Smg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT7w-0000000BNxG-3OZz;
	Wed, 22 Jul 2026 09:20:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT7t-0000000BNvh-2xb1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:20:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 985651A1151;
	Wed, 22 Jul 2026 09:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D04460388;
	Wed, 22 Jul 2026 09:20:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 116EA11BD1850;
	Wed, 22 Jul 2026 11:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784712024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Oh/yNPDezdV0HMgSY5ouqiscRtqRQg3+qt8ontK4cK4=;
	b=jg8CsMPIN+1wrWNwqDxeAhM2ZQolv6JwzKWIOshRCM7YtLTWJFpKsh/G+z9DClpNhWbiIv
	I3DrzQiYum+NihlmMxEtzaiXCJild3PklhwhuONXfCCeLvoxtwz4mCdxlhSe3H8EGZxZqz
	2qLK5JCKsEz1emnk+/TPydmdVV//Unsh9w0a/cw0aQ2pHxfucu8drWPBWnl9FvqTL35JlI
	XfoT57nLiq1XFlUTGG2laCZJWKVKhQWjdz6Mimq+0hrJesPnmA63Cgw/ty7qBzFfLrsmoh
	1at+B8CDYkiIbKMd1bmFtbf1wlggbqOGtDEHgmaZQKnwhxISajdLBz2nLadhKQ==
Date: Wed, 22 Jul 2026 11:20:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/9] watchdog: sama5d4: Remove redundant dev_err()
Message-ID: <20260722092022e8d308ad@mail.local>
References: <20260722084218.79073-1-panchuang@vivo.com>
 <20260722084218.79073-9-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722084218.79073-9-panchuang@vivo.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_022029_880961_377017DA 
X-CRM114-Status: GOOD (  13.84  )
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

On 22/07/2026 16:42:16+0800, Pan Chuang wrote:
> Since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
> devm_request_irq() automatically logs detailed error messages on
> failure. Remove the now-redundant driver-specific dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/watchdog/sama5d4_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 704b786cc2ec..ecdd9aeab79c 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -291,10 +291,8 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  		ret = devm_request_irq(dev, irq, sama5d4_wdt_irq_handler,
>  				       IRQF_SHARED | IRQF_IRQPOLL |
>  				       IRQF_NO_SUSPEND, pdev->name, pdev);
> -		if (ret) {
> -			dev_err(dev, "cannot register interrupt handler\n");
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
>  	watchdog_init_timeout(wdd, wdt_timeout, dev);
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

