Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E53C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVSsAwcRy1uonwMzmFb3HAht5GF4K+y7gUHhjcWsEHU=; b=Vm47zgP/TVJMRUyL4rIY/me1jv
	4x5ObLUAS+6cmC+MtxFfuBsy8feuPaIZKY9A2xEf+5tMQBY+GY44SmUDwoW/S3CCOO/mdsDSzVLYI
	G2VqOIubF8Ct6gXBS6J7lp5yIcK0PK1OaGQCwhUp6C2uOZuJa4twet+rG4wC+x8AaSUl/KpiDJ2qn
	c9YaBD94QPgU4wDO4WZvKzorDuuGErthD51PtKeQ6BUQinNw4C5Bu4TnFyo1YjqF3UdceQBzMqt76
	/+JRuA+8V3p3kOchzSevukrek1eg0NwGRgXLL7ZYc3+upce+zVPviJFMM2PgYF7WG17RCCxERooO+
	GNz0Kt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqYIH-0000000Fngq-0MQN;
	Sun, 02 Aug 2026 15:40:05 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqYIE-0000000Fnfz-1SGO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 15:40:04 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso1707709a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 08:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785685201; x=1786290001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVSsAwcRy1uonwMzmFb3HAht5GF4K+y7gUHhjcWsEHU=;
        b=S9vWlBoc5cUFQcf1okUZ3R9ESvRBBG25dyZ9AUeXONoxTwzv1GV6A9vzC02vJOOvF7
         e7URBGo+g6sNg2H+WEFp2xd3twe3ODpaGQvIsRPhjmDY0j12jaa+qf2remDpK6eeWwW5
         2LtHenkmXIaXiVz5ruTQGSZzYW6AezItHYA11KuVXkkwNj8mJCRYI6qusqtyFeZr2bxV
         GS0AxOoEr/HRBDE3Jxv/mWvfpOmE5aHNuxhhC9IQmD8d5W4ob95o0rIpE/hwtfcxG8sF
         nNGmPGcOS04sH9FDlUCpWWyPQbcmw3pOqVt0rDBJSABnp8lJpo3a/xWzKlG/D012qXSq
         9u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685201; x=1786290001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVSsAwcRy1uonwMzmFb3HAht5GF4K+y7gUHhjcWsEHU=;
        b=E53ijssAfN0E5y0/DfZkXJHHOKfXo+OORz6OrNjsP4vM4yN+FVNHow1y05ycDFqS6v
         pxz3TBbwPfSNlz9nBJRXy4+zQ3Kmwm5RUKIRCACZ+zv+MZwD+a91KtIIUTqY4Yr5BBsw
         FP0Nyqr+qlQWy8fVwmjJvLykJM7k7ge9KeZuHWMxjQp1kDsuaT9m2fjb+JVJZqIobv32
         0xckrGNnmg8AV+LeJwYhvfY3SBp8ys1cYz9b02LBZfgyyPTWI8w0qcTo6CkK+m+O0ILs
         4Oe1Hlv6gaS7/nqmDz35ej3WnA/vBO+a/CZLJePTWQw4TgNdIuxjnyvdXq27H9v/p/hi
         9XlA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3X+sJVNhIEgzbtWpJQ6l9vTEaMG3E5W80g3cpaTZ9AutXjWxQ+fH78eH2epc8CnE2DioU7b6cL0FsjOBBhWDH@lists.infradead.org
X-Gm-Message-State: AOJu0YxSFqenokBsJHYNczMpoHZFDDR+0N0ph3IpGcxt0zQxeYBQsYn8
	Q+f/tDiJrJRg9/aOkHpmsBquLuyE1CtP8ykPXVvHMsQSzTn/f/YoDYNLf/XSmG5y2jA=
X-Gm-Gg: AR+sD10t5r4zjAv6gpeRApa6LREeKqsbgMB5WMuf0RJuE3FmnCWMEaukiQG3+6KeEe3
	S3Sp3A/+DkRgQ53SZd03tSkrZ3oIDsYFnCQv8uBFi01EbB+py/cHke6hvtlhmp/+AHBgdWmBEKp
	Ue5pPI9jlH6g0SjXzhlfoSFVTtERin9GJursGEaDzwi3lnraiYqHeKsJT9bvuOFOt686oxaHKVq
	IKaxXU/WoZa8/5tiVMjA8/dTJ9Oz8nHwT3rBvDRoVxoMMb/kA7z0zVKVJaTltBW7ZBhzXI/kiiY
	QYzSisU3gESmI2GALopXqTxC30pkHUf4hYnFSx3MuWac0iuWfW1Y+vZwKFfbfdsCqFeSNg7Gz8F
	5uTWRyirZe5luZeRayDt+M6rRCmhZOzXB60TAzZIX8UTdcKQOk0N9jVkK70iyJPXzEZmZsu5uy8
	4SU6DTnra3mDnLrGIwcJF/nPHn4Bg1CDNmGgkAlLGLXPaS5Cs3s0W1uNj4F/+mGXCQjYm4OKu7s
	bug8QemmEIJDxT00mPAbw+bH4/Ep1KyoiK/TvA=
X-Received: by 2002:a05:6830:700c:b0:7df:5fc:3fd5 with SMTP id 46e09a7af769-7f196b97f19mr12557105a34.1.1785685200962;
        Sun, 02 Aug 2026 08:40:00 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18ed3c81fsm5342440a34.5.2026.08.02.08.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 08:39:59 -0700 (PDT)
Message-ID: <750f615a-c00f-4e98-9bcf-8fa8704acfba@baylibre.com>
Date: Sun, 2 Aug 2026 10:39:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: xilinx-xadc: free IRQ before cancelling the
 unmask worker on unbind
To: Fan Wu <fanwu01@zju.edu.cn>, jic23@kernel.org
Cc: nuno.sa@analog.com, michal.simek@amd.com, bgolaszewski@baylibre.com,
 DileepKumar.Nagavarapu@amd.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260802082851.433476-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260802082851.433476-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_084002_396421_EF7FC294 
X-CRM114-Status: GOOD (  22.41  )
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

On 8/2/26 3:28 AM, Fan Wu wrote:
> The ZYNQ XADC interrupt handler xadc_zynq_interrupt_handler() arms the
> zynq_unmask_work delayed work via schedule_delayed_work() every time an
> alarm condition is observed, and that worker re-arms itself for as long
> as the alarm stays asserted.
> 
> In xadc_probe() the IRQ is requested with devm_request_irq() before the
> devm_add_action_or_reset() that registers xadc_cancel_delayed_work().
> Because devres release runs in LIFO order, on unbind the delayed work is
> cancelled before the IRQ is freed. The IRQ is still live at that point,
> so a pending alarm can make the handler run once more and re-arm
> zynq_unmask_work after it has been cancelled; that instance then runs
> after the xadc structure that embeds zynq_unmask_work has been freed, a
> use-after-free in xadc_zynq_unmask_worker().
> 
> Register the cancel-work devm action before requesting the IRQ so devres
> LIFO teardown frees (and synchronizes) the IRQ first, then cancels the
> delayed work. After free_irq() the handler can no longer re-arm the
> work, and the subsequent cancel_delayed_work_sync() drains any instance
> armed just before the IRQ was torn down.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: 2a9685d1a3b7 ("iio: adc: xilinx: use more devres helpers and remove remove()")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
> 
>  drivers/iio/adc/xilinx-xadc-core.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -1395,13 +1395,16 @@ static int xadc_probe(struct platform_device *pdev)
>  	}
> 
>  	if (irq > 0) {
> -		ret = devm_request_irq(dev, irq, xadc->ops->interrupt_handler,
> -				       0, dev_name(dev), indio_dev);
> +		/* devm LIFO: register the cancel-work action before the IRQ,
> +		 * so unbind frees the IRQ first, then drains the work.
> +		 */
> +		ret = devm_add_action_or_reset(dev, xadc_cancel_delayed_work,
> +					       &xadc->zynq_unmask_work);
>  		if (ret)
>  			return ret;
> 
> -		ret = devm_add_action_or_reset(dev, xadc_cancel_delayed_work,
> -					       &xadc->zynq_unmask_work);
> +		ret = devm_request_irq(dev, irq, xadc->ops->interrupt_handler,
> +				       0, dev_name(dev), indio_dev);
>  		if (ret)
>  			return ret;
>  	}
> --
> 2.43.0
> 

Makes sense.

Reviewed-by: David Lechner <dlechner@baylibre.com>


