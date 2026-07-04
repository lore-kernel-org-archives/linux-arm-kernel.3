Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D2EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 22:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSk99bNQi38fWFcd6rV95Svr9FLCDy5LtrAIjtlV66c=; b=uwK91umQRw2zE6aDkyIvI38TTD
	o2/7VD0ZHJJoEqX9iZ301PwPVg2h1TqSYc6ngzjgYMcQstT2YMlooY4dBgFPAXgS30vYSuDX1W8Bp
	rfmWRtYFSmSry098z7gg3jfewKbSgBs29x91nulxQ4/znQpDcptwNVJp/GJe3IqzMDVuHtVHiMgMX
	49U+EQz+OHrRuciZMRgZftyy4oPcGGWEU0/Mt7AyO+oqNEr5UfEf2wAJ7aGeq0F0667fIIwYj8At3
	lco3qTpXPzUWLHuDFX2w1sLsG6HeX/R/iDKTC1KONqW4H1SBlHhPbhMHJkOYuc8d1UN4Vd42f6n3v
	PnJ3R6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg8cD-00000008oNt-0ztz;
	Sat, 04 Jul 2026 22:13:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg8cA-00000008oNR-0SZB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 22:13:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 04CE11A0E47;
	Sat,  4 Jul 2026 22:13:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE05560337;
	Sat,  4 Jul 2026 22:13:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C56911BB91CF;
	Sun,  5 Jul 2026 00:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783203208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VSk99bNQi38fWFcd6rV95Svr9FLCDy5LtrAIjtlV66c=;
	b=y/BWodPJhhMktEJZCT3METSf75vFR1cumI6bWUNXVK3JEt7DJbO3F8nf/AMNyb1b8TBAhk
	rW4IdT83u7re/DB7LAmOtLo16G9dCoN9haa7dyUhI4nxrA1OvGtbb4TWJda4xP3iDB/yIw
	Mi+xJB6RlhE7g5mvnarcYPwpp+ulsLqsTyToj7SDJlec3vKE7MJEYduoXJX/JfmPl/JReN
	ny6FwKOZcjZwm4n/qoIT7/vQ/p3WerKYQyZTaNwvnIbJ1ctVvkYtOa4nD4LJUQ98EmO4Eq
	FAlo2TNIhjRY5/5xA5p5n2HOnFQHIknOGWBMQUdD5OljIOYUo7JopDzHSu0SVA==
Date: Sun, 5 Jul 2026 00:13:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: armada38x: do not advertise update interrupt (UIE)
 support
Message-ID: <20260704221324adb6d962@mail.local>
References: <20260704210710.658574-1-ioannis.fountzoulas@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704210710.658574-1-ioannis.fountzoulas@nokia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_151334_309317_AB571AFA 
X-CRM114-Status: GOOD (  28.33  )
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

On 04/07/2026 17:07:10-0400, Ioannis Fountzoulas wrote:
> Problem:
> chrony enables RTC update interrupts via the RTC_UIE_ON ioctl to track
> RTC drift. On the armada38x driver this request is served by the RTC
> core's native path, which arms a 1 second periodic timer that is
> re-programmed on the alarm and serviced by rtc_timer_do_work().
> If the RTC time is then stepped forward by a large amount while this
> timer is active, its scheduled expiry ends up far in the past compared
> to the freshly read time.
> 
> Why the CPU hangs:
> When rtc_timer_do_work() runs, it expires every timer whose expiry is
> not in the future, advancing periodic timers by one period each pass:
> 	while ((next = timerqueue_getnext(&rtc->timerqueue))) {
> 		if (next->expires > now)
> 			break;
> 		...
> 		timer->node.expires += timer->period;   /* += 1s */
> 		timerqueue_add(&rtc->timerqueue, &timer->node);
> 	}
> With a large forward step (seen when the RTC starts far in the past and
> chrony corrects it after the first NTP sync), the periodic UIE timer is
> overdue by the size of the jump, so this loop must run one iteration per
> elapsed second before it can exit.

This is not correct because the core ensures that UIE is disable before
changing the RTC time and enables it afterwards so the jump doesn't have
any impact on UIE. So what you need to explain is why UIE is not synced
with the RTC time after it has been set. My guess is RES-3124064 is the
culprit.

> It never yields in that time, so the workqueue worker pins the CPU and
> the watchdog reports a soft lockup / RCU stall, after which the
> board reboots:
> 	watchdog: BUG: soft lockup - CPU#1 stuck for 48s! [kworker/1:3:432]
> 	Kernel panic - not syncing: softlockup: hung tasks
> 	Workqueue: events rtc_timer_do_work
> 	 rtc_handle_legacy_irq from rtc_timer_do_work
> 	 rtc_timer_do_work from process_one_work
> 	 process_one_work from worker_thread
> 
> Fix:
> Clear RTC_FEATURE_UPDATE_INTERRUPT at probe time so the driver stops
> advertising native UIE. RTC_UIE_ON is then served by the poll-based UIE
> emulation in rtc-dev (CONFIG_RTC_INTF_DEV_UIE_EMUL), which delivers the
> 1 Hz update notifications chrony needs without ever queuing the runaway
> periodic timer.
> 
> Testing:
> Tested on a Marvell Armada 38x board (ARM Cortex-A9). Before the change,
> stepping the clock forward while UIE was enabled reproduced the soft
> lockup (about 1 in 4 boots). After the change, rtc_timer_do_work() runs
> zero loop iterations and returns immediately, chrony still receives
> update interrupts via emulation, and no lockups occur over repeated
> reboot cycles.
> 
> Signed-off-by: Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>
> ---
>  drivers/rtc/rtc-armada38x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> index 245290ae1a8d..da036d819649 100644
> --- a/drivers/rtc/rtc-armada38x.c
> +++ b/drivers/rtc/rtc-armada38x.c
> @@ -526,6 +526,14 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
>  	else
>  		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
>  
> +	/*
> +	 * A large forward step of the RTC time makes
> +	 * rtc_timer_do_work() replay one period per elapsed second and can
> +	 * loop long enough to trigger a soft lockup. Do not advertise
> +	 * native UIE; RTC_UIE_ON then uses the poll-based emulation.
> +	 */
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
> +
>  	/* Update RTC-MBUS bridge timing parameters */
>  	rtc->data->update_mbus_timing(rtc);
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

