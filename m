Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E9DD5E36C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qe3D6/waK6yGsH/6w6u8B/iFXC3a9D8n7XBymP2hiqs=; b=hkcRlGwia2JlNwxl5+muvZoDjW
	X6QN0N5RDlar4irxIEqnRAmosszWjmJlK/stfmO0PSFZlnytLa5DqzpgOqYxjqIg8mQm3MUOMhLTB
	6l9x4qX2mHz1XZPRnU1xN2KeR+xh+gA2p7YKF6jr4aDEVO7qE3ietYiDWV8gPxhQRYuq7wlMTxLxa
	v6xOfVcmkcWEPimZuSYi2NuuQXXMKySK2cim2/6LFQmpGx5FJvcRQL7L+TfNwV6G1trzc4rzokPJs
	lOAoBkptrmyqttgxpfvMk7rxk6kldEs6C/mNP8VFux9jiESSu4+OhgzB3sULZZwgGOCqoUXf38MQl
	l7mptPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9lhm-0000000DPhh-3QYP;
	Sat, 09 Nov 2024 13:40:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9lg1-0000000DPZl-3bzY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 13:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C12C5C012F;
	Sat,  9 Nov 2024 13:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A25C4CECE;
	Sat,  9 Nov 2024 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731159534;
	bh=xK1EstYJfmUBR3r7y6GFUc08EvB9qxw1bqmlRdrQcF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ADeTmWjwb3WD427+fGGhLNAluQKlEQ2wdBBtW0j+yy9VeySlBj1L9qsNqx/UIA/R1
	 9eZfcOswmFCsgukKcl4ouBL5YZi49BlXlXygckbhYWV4JxHZ/3FFlJoYRB7Ctu/T1R
	 DfT2L045tlyctq1Y350RXrTQJHSWLWt6vJPcmWea/e1a9McHAj0aeq6uCiW13rHi6I
	 DBH4eyucf1I+R53eTWVE6A0KxS78RYW69HiZAWj33wxHUurnjM8y4VIcBdDQulDshI
	 YB4FdLmSBYIig1+vuu2JHxQok6o8KT/51vGjkli65JI9MyFmCpYRZFU/LvSQPcm2RK
	 61uieIB7cpVYQ==
Date: Sat, 9 Nov 2024 13:38:46 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com,
 benjamin.gaignard@linaro.org, lee@kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: trigger: stm32-timer-trigger: Add check for
 clk_enable()
Message-ID: <20241109133846.53d7ef06@jic23-huawei>
In-Reply-To: <20241108200900.44727-1-jiashengjiangcool@gmail.com>
References: <20241108200900.44727-1-jiashengjiangcool@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_053858_031133_BAFF56AA 
X-CRM114-Status: GOOD (  23.65  )
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

On Fri,  8 Nov 2024 20:09:00 +0000
Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:

> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Hi,

In principle this is fine, but I'd rather we made use of guard()
/ scoped_guard() rather than adding the explicit unlocks.

If you do that as a precursor patch in appropriate places
in the driver then this will be a little cleaner.

Note I'll not be taking this until next cycle now anyway.

Jonathan

> ---
> Changelog:
> 
> v1 -> v2:
> 
> 1. Remove unsuitable dev_err_probe().
> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 32 ++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 0684329956d9..e1e077122f73 100644
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
> @@ -153,7 +153,11 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>  	mutex_lock(&priv->lock);
>  	if (!priv->enabled) {
>  		priv->enabled = true;
> -		clk_enable(priv->clk);
> +		ret = clk_enable(priv->clk);
> +		if (ret) {
> +			mutex_unlock(&priv->lock);

as below guard() for when the mutex is locked is cleaner.

> +			return ret;
> +		}
>  	}
>  
>  	regmap_write(priv->regmap, TIM_PSC, prescaler);
> @@ -307,7 +311,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
>  	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
>  	struct iio_trigger *trig = to_iio_trigger(dev);
>  	u32 mask, shift, master_mode_max;
> -	int i;
> +	int i, ret;
>  
>  	if (stm32_timer_is_trgo2_name(trig->name)) {
>  		mask = TIM_CR2_MMS2;
> @@ -326,7 +330,11 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
>  			if (!priv->enabled) {
>  				/* Clock should be enabled first */
>  				priv->enabled = true;
> -				clk_enable(priv->clk);
> +				ret = clk_enable(priv->clk);
> +				if (ret) {
> +					mutex_unlock(&priv->lock);
As below. Prefer use of guard() so we don't have to handle the unlock manually.
> +					return ret;
> +				}
>  			}
>  			regmap_update_bits(priv->regmap, TIM_CR2, mask,
>  					   i << shift);
> @@ -482,6 +490,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				   int val, int val2, long mask)
>  {
>  	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
> +	int ret;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> @@ -496,7 +505,11 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  		if (val) {
>  			if (!priv->enabled) {
>  				priv->enabled = true;
> -				clk_enable(priv->clk);
> +				ret = clk_enable(priv->clk);
> +				if (ret) {
> +					mutex_unlock(&priv->lock);
Add include of cleanup.h and swithch the place where the mutex is locked to
guard(mutex)(&priv->lock);
then remember to drop the explicit unlocks.


> +					return ret;
> +				}
>  			}
>  			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>  		} else {
> @@ -601,7 +614,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>  				 unsigned int mode)
>  {
>  	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
> -	int sms = stm32_enable_mode2sms(mode);
> +	int sms = stm32_enable_mode2sms(mode), ret;
>  
>  	if (sms < 0)
>  		return sms;
> @@ -611,7 +624,12 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>  	 */
>  	mutex_lock(&priv->lock);

Perhaps scoped_guard() is  appropriate here.

>  	if (sms == 6 && !priv->enabled) {
> -		clk_enable(priv->clk);
> +		ret = clk_enable(priv->clk);
> +		if (ret) {
> +			mutex_unlock(&priv->lock);
> +			return ret;
> +		}
> +
>  		priv->enabled = true;
>  	}
>  	mutex_unlock(&priv->lock);


