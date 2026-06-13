Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989CBCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56MO/PWG6Ib9yUFU34ThnLS9zPVnZVEboAJqbyCYvEA=; b=kOhEJZZmIbg1AFWynbX31KjkHC
	VjkIgDPfYI2mHSwKOLqY6lTMi+IMqaRQ4i9vFcsM137uSKpWr/TrXJ8W6/+23EsRbjHBOxPuDMfJt
	xX2D4BhFtOmDcnMXsQ+ngoltw8I/paSedIrGoHgdMHNxwaU4454aEGYgtbzEYcuIIh7bnVaxJOnwK
	S3NhcS8OemnuEWuRRgGEYEoWXRS+njl1f3ooQvaWh+nByLijvU+Kr5zpglzHb3p3j4R4RrCF9DVhl
	giTSrpjwy6kHCk+t792rXkGtsYlp0r1m4ZXabix6Gjh7q/SGRl+XPsta8M21T2txXeENczfBnQobo
	rhOi5P4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLKG-0000000CAco-1IAR;
	Sat, 13 Jun 2026 10:10:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLKE-0000000CAcd-2DnB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 10:10:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C95743263;
	Sat, 13 Jun 2026 10:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635D01F000E9;
	Sat, 13 Jun 2026 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781345450;
	bh=56MO/PWG6Ib9yUFU34ThnLS9zPVnZVEboAJqbyCYvEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hOVO8/m0hHnWg8qAspMgvmR4pQMkWX/m9xr62Nfgk48m/5xvnislE17EhHGh8K6Jh
	 1zt/RXuS5APwl8xBw5WTTgoli/a8FR17H8urDmsBVbc/tZ47LbdU3WYdO7MR1qFGsc
	 tpreSli1keARbtaD3/MW7BWEQw7HGdDfhbNVdD6DrdbdJsnW1driRnpUK8YSUB8TPO
	 S9p6o6KaV054JhdWC1RcLeK+uKCfNHvDTxcZbeEmZTLA/haSFo1vwxLap2dppAIPzD
	 1R66nk2TsIXDHPJO3PjrJWZPbxzM0/e/jj4AHSt4Ipp1Rt5N2fLb3DDJkGkQ/dstEZ
	 y5obb0p+8BpYg==
Message-ID: <d94f5548-9621-4e9b-afba-1835d95799d2@kernel.org>
Date: Sat, 13 Jun 2026 13:10:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: spear: Initialize completion before
 requesting IRQ
To: Maxwell Doose <m32285159@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Hartmut Knaack <knaack.h@gmx.de>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Sangyun Kim <sangyun.kim@snu.ac.kr>,
 Kyungwook Boo <bookyungwook@gmail.com>, Jaeyoung Chung <jjy600901@snu.ac.kr>
References: <20260613005812.160572-1-m32285159@gmail.com>
 <20260613005812.160572-3-m32285159@gmail.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260613005812.160572-3-m32285159@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/13/26 03:58, Maxwell Doose wrote:
> In the report from Jaeyoung Chung:
> 
> "spear_adc_probe() in drivers/iio/adc/spear_adc.c registers its
> interrupt handler with devm_request_irq() before it initializes
> st->completion with init_completion(). If an interrupt arrives after
> devm_request_irq() and before init_completion(), the handler calls
> complete() on an uninitialized completion, causing a kernel panic.
> 
> The probe path, in spear_adc_probe():
> 
>      iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
>      ...
>      retval = devm_request_irq(&pdev->dev, irq, spear_adc_isr, 0,
>                                LPC32XXAD_NAME, st);           /* register handler */
>      ...
>      init_completion(&st->completion);                       /* initialize completion */
> 
> spear_adc_isr() calls complete():
> 
>      complete(&st->completion);
> 
> If the device raises an interrupt before init_completion() runs,
> complete() acquires the uninitialized wait.lock and walks the zeroed
> task_list in swake_up_locked(). The zeroed task_list makes list_empty()
> return false, so swake_up_locked() dereferences a NULL list entry,
> triggering a KASAN wild-memory-access."
> 
> Fix the chance of a spurious IRQ causing an uninitialized pointer
> dereference by moving init_completion() above devm_request_irq().
> 
> Fixes: b586e5d9eee0 ("staging:iio:adc:spear rename device specific state structure to _state")
> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
> Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
> Closes: https://lore.kernel.org/linux-iio/20260610115700.774689-1-jjy600901@snu.ac.kr/
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
>   drivers/iio/adc/spear_adc.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/spear_adc.c b/drivers/iio/adc/spear_adc.c
> index 4be722406bb5..ab02a14682ed 100644
> --- a/drivers/iio/adc/spear_adc.c
> +++ b/drivers/iio/adc/spear_adc.c
> @@ -283,6 +283,7 @@ static int spear_adc_probe(struct platform_device *pdev)
>   	st = iio_priv(indio_dev);
>   	st->dev = dev;
>   
> +	init_completion(&st->completion);
>   	mutex_init(&st->lock);
>   
>   	/*
> @@ -329,8 +330,6 @@ static int spear_adc_probe(struct platform_device *pdev)
>   
>   	spear_adc_configure(st);
>   
> -	init_completion(&st->completion);
> -
>   	indio_dev->name = SPEAR_ADC_MOD_NAME;
>   	indio_dev->info = &spear_adc_info;
>   	indio_dev->modes = INDIO_DIRECT_MODE;

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir

