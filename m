Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386EFD4976C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coTfCe4E/7EEBOzGQYEOP4Dd1hRlPcIszUHgSsDloAo=; b=0kXtlF2bC7uOcFhBuIHxKQ0hWl
	3N6L1fGYlreYQB60QajtHKrEu/9TFBR1PPpdWne4bmU62+0bBfs4yvlswhoV3MKw7j31bG1SIIgm5
	dJAup+EkAFb+lvMzcSHOyEpuTMJDSIjr6ovuJTbl3/ikBT3d9WmtW5rprK2yRi9L9BQv1o2WNS6y8
	KbS2lONTjC9aXQTyrjs/7cFnrskW4emStbX7wxplnDa3WPGYBGrdJAp3E71OOnw+Fg/M6rkjLj0x6
	2u/CwXe3Tqj9unvXTl4VdDS0WHMcSPsVD6L2yaxLVUxcWsNe3hG1JIjmgxGhUFunl4ysRoCCJK9Ny
	s0FGfjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHjV0-00000003S7x-3QoC;
	Sun, 01 Dec 2024 12:56:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHjU1-00000003S0L-3Hoq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 12:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BFA05C578F;
	Sun,  1 Dec 2024 12:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29958C4CECF;
	Sun,  1 Dec 2024 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733057728;
	bh=+wExzTFQM8nAve73xnTS4Dc8Iv9ma5WmvnqKO14ZKkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EjKm+X5TsDeRu2LYkynq7HbezMY9D1Jk2/dOPBpl6uEJBT1tzmMNhIhhegG+hJv9u
	 DAlafUYOu0MoHnwTMutTGPsYZIWDeyxBl3jZ+wugs3WZlf8bfSnedW8Hfu2WhhnP3m
	 ydKWaRVxMLcnw5rRpW808yU0ijQ0lwjfbxHIxiVQ2zEpecJoJibgbL6uVhEvA5mh48
	 88Gx67Fa/PI26uGXTcEa6klm4/OUi+JKGe4OOkXcVoxdvU855bxs6YSyua9HY+6liM
	 Ya8cgOu1xCPZem0yE9MDAc/GBg/VB3pDI8SevKl6WqwEmWU+MRc34/mMGfhNt0apLz
	 fbFYs6Bhf9UkA==
Date: Sun, 1 Dec 2024 12:55:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: dlechner@baylibre.com, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com,
 benjamin.gaignard@linaro.org, lee@kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] iio: trigger: stm32-timer-trigger: Add check for
 clk_enable()
Message-ID: <20241201125518.29373281@jic23-huawei>
In-Reply-To: <20241123220149.30655-1-jiashengjiangcool@gmail.com>
References: <20241123220149.30655-1-jiashengjiangcool@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_045529_935493_5241D063 
X-CRM114-Status: GOOD (  25.72  )
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

On Sat, 23 Nov 2024 22:01:49 +0000
Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:

> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Applied.

thanks,

Jonathan

> ---
> Changelog:
> 
> v4 -> v5:
> 
> 1. Add a default in the switch.
> 
> v3 -> v4:
> 
> 1. Place braces around the case body.
> 
> v2 -> v3:
> 
> 1. Use guard() to simplify the resulting code.
> 
> v1 -> v2:
> 
> 1. Remove unsuitable dev_err_probe().
> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 49 ++++++++++++++---------
>  1 file changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 0684329956d9..67528ec7d0a5 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -119,7 +119,7 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  			     unsigned int frequency)
>  {
>  	unsigned long long prd, div;
> -	int prescaler = 0;
> +	int prescaler = 0, ret;
>  	u32 ccer;
>  
>  	/* Period and prescaler values depends of clock rate */
> @@ -150,10 +150,12 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  	if (ccer & TIM_CCER_CCXE)
>  		return -EBUSY;
>  
> -	mutex_lock(&priv->lock);
> +	guard(mutex)(&priv->lock);
>  	if (!priv->enabled) {
>  		priv->enabled = true;
> -		clk_enable(priv->clk);
> +		ret = clk_enable(priv->clk);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	regmap_write(priv->regmap, TIM_PSC, prescaler);
> @@ -173,7 +175,6 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  
>  	/* Enable controller */
>  	regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> -	mutex_unlock(&priv->lock);
>  
>  	return 0;
>  }
> @@ -307,7 +308,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
>  	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
>  	struct iio_trigger *trig = to_iio_trigger(dev);
>  	u32 mask, shift, master_mode_max;
> -	int i;
> +	int i, ret;
>  
>  	if (stm32_timer_is_trgo2_name(trig->name)) {
>  		mask = TIM_CR2_MMS2;
> @@ -322,15 +323,16 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
>  	for (i = 0; i <= master_mode_max; i++) {
>  		if (!strncmp(master_mode_table[i], buf,
>  			     strlen(master_mode_table[i]))) {
> -			mutex_lock(&priv->lock);
> +			guard(mutex)(&priv->lock);
>  			if (!priv->enabled) {
>  				/* Clock should be enabled first */
>  				priv->enabled = true;
> -				clk_enable(priv->clk);
> +				ret = clk_enable(priv->clk);
> +				if (ret)
> +					return ret;
>  			}
>  			regmap_update_bits(priv->regmap, TIM_CR2, mask,
>  					   i << shift);
> -			mutex_unlock(&priv->lock);
>  			return len;
>  		}
>  	}
> @@ -482,6 +484,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				   int val, int val2, long mask)
>  {
>  	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
> +	int ret;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> @@ -491,12 +494,14 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  		/* fixed scale */
>  		return -EINVAL;
>  
> -	case IIO_CHAN_INFO_ENABLE:
> -		mutex_lock(&priv->lock);
> +	case IIO_CHAN_INFO_ENABLE: {
> +		guard(mutex)(&priv->lock);
>  		if (val) {
>  			if (!priv->enabled) {
>  				priv->enabled = true;
> -				clk_enable(priv->clk);
> +				ret = clk_enable(priv->clk);
> +				if (ret)
> +					return ret;
>  			}
>  			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>  		} else {
> @@ -506,11 +511,12 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				clk_disable(priv->clk);
>  			}
>  		}
> -		mutex_unlock(&priv->lock);
> +
>  		return 0;
>  	}
> -
> -	return -EINVAL;
> +	default:
> +		return -EINVAL;
> +	}
>  }
>  
>  static int stm32_counter_validate_trigger(struct iio_dev *indio_dev,
> @@ -601,7 +607,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>  				 unsigned int mode)
>  {
>  	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
> -	int sms = stm32_enable_mode2sms(mode);
> +	int sms = stm32_enable_mode2sms(mode), ret;
>  
>  	if (sms < 0)
>  		return sms;
> @@ -609,12 +615,15 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>  	 * Triggered mode sets CEN bit automatically by hardware. So, first
>  	 * enable counter clock, so it can use it. Keeps it in sync with CEN.
>  	 */
> -	mutex_lock(&priv->lock);
> -	if (sms == 6 && !priv->enabled) {
> -		clk_enable(priv->clk);
> -		priv->enabled = true;
> +	scoped_guard(mutex, &priv->lock) {
> +		if (sms == 6 && !priv->enabled) {
> +			ret = clk_enable(priv->clk);
> +			if (ret)
> +				return ret;
> +
> +			priv->enabled = true;
> +		}
>  	}
> -	mutex_unlock(&priv->lock);
>  
>  	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
>  


