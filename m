Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C789FCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 02:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bRlceZO1C6R5p58rYRLtXjrtmiq3B0PMRv5qsrWzJ4=; b=RfZNnckZBue2z0Lijoa4JLqeov
	vHxTxxonuCHUrxi02bRwiV0klnUc10FOmAgZIUf6JITR6Y4TY3b380FrAbUPcoZ8ZF9ojNeOVQghJ
	+yUoo0Ix+qq+Y2QnnjJL0yP4rFX/QcMW5ZY+EI6YlgaCTSE2H2Zx32ntiy+aof8YtWxaHfWa/KQWR
	VyBpdLL4of2vGhbQHxDdnRP+0RUD/QeryU3eg5uOlhK68dRnaj/k1lNEGFBiPdlLGaZApsBE9prWQ
	VrPEgzzIxshLdMNgAo3rgl6Fw5lUWUQ+uP7mFHmjKuMyopEKdn67Q9yvdnJxNgtqiAc5KXLyal6NN
	gLEHzK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKoka-0000000FIJj-0mDb;
	Mon, 17 Nov 2025 02:13:52 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKokX-0000000FIG0-18fC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 02:13:51 +0000
Message-ID: <a292bf98-74e2-405c-bb7c-3686959cdb10@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763345612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9bRlceZO1C6R5p58rYRLtXjrtmiq3B0PMRv5qsrWzJ4=;
	b=lQ5JiOely5tHyGp2pAH8z5p5pbcr3zVr7pDjZVelZ51U+TMw9mXWes4IPp64XMDa273P1K
	QDdFxm+S0bKeuiHP5f56NS+ckIz8eWbHpVyAmtzT9rB02m+tC73zNxxQEq3I2QhKjHqM0b
	LUEqj65XO5k4hBvudXphSzjc8TZnGF0=
Date: Mon, 17 Nov 2025 10:13:24 +0800
MIME-Version: 1.0
Subject: Re: [PATCH V2] clocksource/drivers/rda: Add sched_clock_register for
 RDA8810PL SoC
To: mani@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-kernel@vger.kernel.org, enlin.mu@unisoc.com
References: <20251107063347.3692-1-enlin.mu@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "enlin.mu" <enlin.mu@linux.dev>
In-Reply-To: <20251107063347.3692-1-enlin.mu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_181349_822665_6A301F19 
X-CRM114-Status: GOOD (  17.41  )
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

Hi Everyone

Who can help review this patch?

thanks

On 2025/11/7 14:33, Enlin Mu wrote:
> From: Enlin Mu <enlin.mu@unisoc.com>
> 
> The current system log timestamp accuracy is tick, which can not
> meet the usage requirements and needs to reach nanoseconds.
> Therefore, the sched_clock_register funciton needs to be add.
> 
> Signed-off-by: Enlin Mu <enlin.mu@unisoc.com>
> ---
>   drivers/clocksource/timer-rda.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-rda.c b/drivers/clocksource/timer-rda.c
> index fd1199c189bf..0be8e05970e2 100644
> --- a/drivers/clocksource/timer-rda.c
> +++ b/drivers/clocksource/timer-rda.c
> @@ -13,6 +13,7 @@
>   
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
> +#include <linux/sched_clock.h>
>   
>   #include "timer-of.h"
>   
> @@ -153,7 +154,7 @@ static struct timer_of rda_ostimer_of = {
>   	},
>   };
>   
> -static u64 rda_hwtimer_read(struct clocksource *cs)
> +static u64 rda_hwtimer_clocksource_read(void)
>   {
>   	void __iomem *base = timer_of_base(&rda_ostimer_of);
>   	u32 lo, hi;
> @@ -167,6 +168,11 @@ static u64 rda_hwtimer_read(struct clocksource *cs)
>   	return ((u64)hi << 32) | lo;
>   }
>   
> +static u64 rda_hwtimer_read(struct clocksource *cs)
> +{
> +	return rda_hwtimer_clocksource_read();
> +}
> +
>   static struct clocksource rda_hwtimer_clocksource = {
>   	.name           = "rda-timer",
>   	.rating         = 400,
> @@ -185,6 +191,7 @@ static int __init rda_timer_init(struct device_node *np)
>   		return ret;
>   
>   	clocksource_register_hz(&rda_hwtimer_clocksource, rate);
> +	sched_clock_register(rda_hwtimer_clocksource_read, 64, rate);
>   
>   	clockevents_config_and_register(&rda_ostimer_of.clkevt, rate,
>   					0x2, UINT_MAX);


