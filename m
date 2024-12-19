Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F64E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc8yq26BIoFufnvmMd8jhmw4sJL+yowe8bF01NY8gr0=; b=EiV74Xf/skcpbby4pokGfmDAvi
	rHBHCbKl2R1aOv5RRlc4oO8hwis46hfHYm3U+sk0CN5pJQ5fOYULxJywddXhh10ynOwTkAKn1If5d
	/sNtk6KPv6HHukSDD8TeOya8w0LRhvZbvQdiKTcArANshv08u4zEGa6bJtz8VHnlJRCq50D0MHsAU
	uzrkvAtpDfP5/wMnRq6CPpxar+7R3B0TOFHN5ukFjN6A9xMM4ES193pdzl9U/dSrCzXgljw06ch6g
	NPwtTK/tx10rfkFZORg/SXPfhDsuwdyoRyhe/PoIO8CGfnbaIMQByLDJTbnHdsvRGobJ8JUw3XM+1
	9NLim8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOICI-000000028RM-0P0i;
	Thu, 19 Dec 2024 15:12:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIBB-000000028IW-2PDZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 15:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F9AF5C6757;
	Thu, 19 Dec 2024 15:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAA1C4CECE;
	Thu, 19 Dec 2024 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734621068;
	bh=adQ2VPRcjtI/vVkO75YJreXNfLf5pJL1trNq2V/W/Ns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Er9JUTVg4DvjSBY76AzsEe7pZLpem8q8ZDx0p1KiGyI8kaQLiD0aBZa7dpUbQ5QCb
	 0fwpnEX4fShYuAGYPtG4pZKh9BR/cLSjTR9w2wpNdalMJGDUit5yiPACqp9R+EsoO1
	 MltCrnMSaHC8HQmll+vXXibFTnqg0uP3ZgQET+axUVqYONSw0mye0gtgsltoxnaCYa
	 hRiA2ebZsY3jPxeLXQl0GtTQB//0VTB7jiMoUpsiytLLF3AivthFoD2H1aZ+QYPQwf
	 0vsiqShNhqiRjXue2jaLwCl2LyJlqmUeOpXZYhqoB4RpXu279r5M9Zp6XGDB4rNF7C
	 0f3wN5eT1nBsQ==
Date: Thu, 19 Dec 2024 15:10:56 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>, <wbg@kernel.org>,
 <ukleinek@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 3/9] iio: trigger: stm32-timer: add support for
 stm32mp25
Message-ID: <20241219151056.26e21aed@jic23-huawei>
In-Reply-To: <20241218090153.742869-4-fabrice.gasnier@foss.st.com>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
	<20241218090153.742869-4-fabrice.gasnier@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_071109_701898_3465F1A0 
X-CRM114-Status: GOOD (  27.92  )
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

On Wed, 18 Dec 2024 10:01:47 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> this new HW variant. Add TIM20 trigger definitions that can be used by
> the stm32 analog-to-digital converter. Use compatible data to identify
> it.
> As the counter framework is now superseding the deprecated IIO counter
> interface (IIO_COUNT), don't support it. Only register IIO trigger
> devices for ADC usage. So, make the valids_table a cfg option.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Looks good to me.  Looks like I can just pick this up for IIO?

Or is thOre a dependency I'm missing?

Just in case it goes another route.
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Jonathan
> ---
>  drivers/iio/trigger/stm32-timer-trigger.c     | 21 +++++++++++++++++--
>  include/linux/iio/timer/stm32-timer-trigger.h |  6 ++++++
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index bb60b2d7b2ec..8aaf3abf044e 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -38,6 +38,9 @@ static const void *triggers_table[][MAX_TRIGGERS] = {
>  	{ TIM15_TRGO,},
>  	{ TIM16_OC1,},
>  	{ TIM17_OC1,},
> +	{ }, /* timer 18 */
> +	{ }, /* timer 19 */
> +	{ TIM20_TRGO, TIM20_TRGO2, TIM20_OC1, TIM20_OC2, TIM20_OC3, },
>  };
>  
>  /* List the triggers accepted by each timer */
> @@ -781,7 +784,7 @@ static int stm32_timer_trigger_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  
>  	/* Create an IIO device only if we have triggers to be validated */
> -	if (*cfg->valids_table[index])
> +	if (cfg->valids_table && *cfg->valids_table[index])
>  		priv = stm32_setup_counter_device(dev);
>  	else
>  		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -794,7 +797,8 @@ static int stm32_timer_trigger_probe(struct platform_device *pdev)
>  	priv->clk = ddata->clk;
>  	priv->max_arr = ddata->max_arr;
>  	priv->triggers = triggers_table[index];
> -	priv->valids = cfg->valids_table[index];
> +	if (cfg->valids_table && *cfg->valids_table[index])
> +		priv->valids = cfg->valids_table[index];
>  	stm32_timer_detect_trgo2(priv);
>  	mutex_init(&priv->lock);
>  
> @@ -886,6 +890,16 @@ static const struct stm32_timer_trigger_cfg stm32h7_timer_trg_cfg = {
>  	.num_valids_table = ARRAY_SIZE(stm32h7_valids_table),
>  };
>  
> +static const struct stm32_timer_trigger_cfg stm32mp25_timer_trg_cfg = {
> +	/*
> +	 * valids_table not used: counter framework is now superseding the deprecated IIO
> +	 * counter interface (IIO_COUNT), so don't support it. num_valids_table is only
> +	 * kept here to register the IIO HW triggers. valids_table should be moved at some
> +	 * point to the stm32-timer-cnt driver instead.
> +	 */
> +	.num_valids_table = ARRAY_SIZE(triggers_table),
> +};
> +
>  static const struct of_device_id stm32_trig_of_match[] = {
>  	{
>  		.compatible = "st,stm32-timer-trigger",
> @@ -893,6 +907,9 @@ static const struct of_device_id stm32_trig_of_match[] = {
>  	}, {
>  		.compatible = "st,stm32h7-timer-trigger",
>  		.data = (void *)&stm32h7_timer_trg_cfg,
> +	}, {
> +		.compatible = "st,stm32mp25-timer-trigger",
> +		.data = (void *)&stm32mp25_timer_trg_cfg,
>  	},
>  	{ /* end node */ },
>  };
> diff --git a/include/linux/iio/timer/stm32-timer-trigger.h b/include/linux/iio/timer/stm32-timer-trigger.h
> index 37572e4dc73a..1ee237b56183 100644
> --- a/include/linux/iio/timer/stm32-timer-trigger.h
> +++ b/include/linux/iio/timer/stm32-timer-trigger.h
> @@ -72,6 +72,12 @@
>  
>  #define TIM17_OC1	"tim17_oc1"
>  
> +#define TIM20_OC1	"tim20_oc1"
> +#define TIM20_OC2	"tim20_oc2"
> +#define TIM20_OC3	"tim20_oc3"
> +#define TIM20_TRGO	"tim20_trgo"
> +#define TIM20_TRGO2	"tim20_trgo2"
> +
>  #if IS_REACHABLE(CONFIG_IIO_STM32_TIMER_TRIGGER)
>  bool is_stm32_timer_trigger(struct iio_trigger *trig);
>  #else


