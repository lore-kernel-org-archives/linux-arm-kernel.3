Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8162BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW4l1KCamTF3zxtO3y7a8yB970VQAYRYvWIZ2V33hYQ=; b=TGOHMoGDZsOo/jp0A/F5r/hp9H
	27iCYne4ZOJHR+Q5HrQX4zWqc5xvB+ctDZiJpaYbduqBJif20pcdWdyLZbUrdWVBkV9V8K6zGGS6M
	uPXmx+ckiqQOWCmOOKWFT0IqBDdjKZeuEUCZKoihCp6d7LoROL+76AIHkKRIgUXzcHvJn+7WHIBXo
	xZkjUKRUTZ2tZnmn+aRXAhDZ2YMUTrg9JrgWSQVn8qli3IlVP6y7x+6y2bSzj6uoPEs61eys6N4T/
	i7ej5/nqYKYQGHRVN5yT7VYXzaJosK7AWuzqu8BIyYdovb6v80OkFdkh8/SXCaB/ZrXVWGR5KjwFC
	3Jgy6D0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WjD-00000007YYH-14oG;
	Tue, 15 Sep 2026 17:13:55 +0000
Received: from guitar.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WjA-00000007YV6-3YPc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:13:54 +0000
Received: from localhost (unknown [10.0.8.3])
	by mail.tkos.co.il (Postfix) with ESMTP id B59B344054B;
	Tue, 15 Sep 2026 20:13:12 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1789492392;
	bh=xH4ZlU5k/yRo7phBWr9/5nBvSCsCwNfWIrWpnRpJgJg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ar/Cq8k36IJgv6PUzoBa+JCDGGB8TRvR+AUBaqrhYWuakCpVpI5rNVZRkroTAnMIu
	 g8quLhD8xDf75Z4awqyBVohrAp5UxjuT3WKY4nN3VHFDPK+A0bKWXXdqr0LIlkuSu/
	 a5yWppr4iVRZTq9i8XjTpudaIE8J3Up2VoihLaqdM1p8A0y9TFMnAvOqwTMNTjt9Ip
	 /9BMd40eVG2NwXi/MKWKz02tGaboiTEJ25wWbHZwdOPzcJ9eEqg166rl40OJHITysb
	 fwB6WMQvb8FT8LToObgltXV5Or3tG0urcKLBvpdQxM8gaKwc3eGQBL+NqZudJxSQW/
	 HfZmmF501HvbA==
From: Baruch Siach <baruch@tkos.co.il>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: daniel.lezcano@kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  tglx@kernel.org,  lkml@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/digicolor: Fix clk reference leak
 on request_irq failure
In-Reply-To: <20260915045242.1726702-1-vulab@iscas.ac.cn> (Wentao Liang's
	message of "Tue, 15 Sep 2026 04:52:42 +0000")
References: <20260915045242.1726702-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Tue, 15 Sep 2026 20:13:44 +0300
Message-ID: <87o6dy30af.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_101353_121920_6D74EABE 
X-CRM114-Status: GOOD (  15.71  )
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

Hi Wentao Liang,

On Tue, Sep 15 2026, Wentao Liang wrote:
> digicolor_timer_init() obtains the timer clock with of_clk_get() and
> enables it, but the request_irq() failure path returns without releasing
> the clock reference, leaking both the enable/prepare state and the
> reference itself.
>
> Disable and put the clock before returning on the request_irq() failure
> path. The success path keeps the clock enabled for the lifetime of the
> timer and is left untouched.
>
> Fixes: 9b8bb7736b78 ("clocksource: Driver for Conexant Digicolor SoC timer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  drivers/clocksource/timer-digicolor.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clocksource/timer-digicolor.c b/drivers/clocksource/timer-digicolor.c
> index 559aa96089c3..46e0c329957a 100644
> --- a/drivers/clocksource/timer-digicolor.c
> +++ b/drivers/clocksource/timer-digicolor.c
> @@ -190,6 +190,8 @@ static int __init digicolor_timer_init(struct device_node *node)
>  			  &dc_timer_dev.ce);
>  	if (ret) {
>  		pr_warn("request of timer irq %d failed (%d)\n", irq, ret);
> +		clk_disable_unprepare(clk);
> +		clk_put(clk);
>  		return ret;
>  	}

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

