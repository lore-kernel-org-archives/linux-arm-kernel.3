Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70CBCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4PQXiBWNKYMhVB0OpQgu8imnyO9rnR1isf3ixF9lJA=; b=zfqfyFhFGUGkSrdnDO9IVf7PTe
	7B+tpPrr6//HQjM2Nd4vS55B/drLFnM7W/3HMHGboM2AG/6fLmDqpPWz4M63ZkupQoOb59eGfZUtD
	fi1Ge2fymHwde0RdZ4H8i9wh9lTUa9kLvT7lf2EiqQ9kogut87RPkbPEBsfJs9KW7RGJV5TLVYVUs
	ZfLFHq6873oN7M9HvkdJrlG4GelJNxu6CEQBKbevYjNONRgQUbXvOfHc/shKayfVzBDu8a4T/ZSBb
	cbBFzu0UwkunTJAxz9HUk0c2Cr5qmI2tMoBb06DefAmpbNcReHFI3p+vsCPlPR3bmByj0Q+q+nx/D
	bMrTuMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v53IM-0000000DmyZ-0SOS;
	Sat, 04 Oct 2025 14:31:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v53IJ-0000000DmyO-46QL;
	Sat, 04 Oct 2025 14:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF21B62034;
	Sat,  4 Oct 2025 14:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4E8C4CEF1;
	Sat,  4 Oct 2025 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759588290;
	bh=7I9cs/CZgED4iFSnKxJlz8RXYc/lFuGyZFexuMMRKWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=swhG2/atqORA2zXzxRuCGA5HDC/Y7Y4PcbdiUfUpmVlQbDd+NScOmjRL9MHLrK4H9
	 7CZiDCSw2iH3CzmLDkVvq7kpfRBk1XYA3EvgLQTCloKccWnJNPYKzMqT5o+E8V4g2U
	 VGS61RBSpL6VLP3Uwh5BId7Im5jaadP5yXpm8A3TUCeKzZwaNtJpyQWZmC2G+K6DYy
	 o2E9g15Tz/WjAMi2KiAra9cuWIm/ecBmKPObkiXugNYUjqStN2wrolc9Zdm2mjirLK
	 Pxffe4TnxdeQGtmprcxRS0Xk4AoXZ9/uM98rvJeLMnStxxiTRcpaOz/H3XWcEKRBvH
	 IEVbI7Bk1UHlQ==
Date: Sat, 4 Oct 2025 15:31:25 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Abhash Jha
 <abhashkumarjha123@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] iio: adc: mt6360: Handle error in cleanup path
 correctly
Message-ID: <20251004153125.2e46b6ff@jic23-huawei>
In-Reply-To: <20250929162453.1203-1-vulab@iscas.ac.cn>
References: <20250929025358.2064-1-vulab@iscas.ac.cn>
	<20250929162453.1203-1-vulab@iscas.ac.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 30 Sep 2025 00:24:53 +0800
Haotian Zhang <vulab@iscas.ac.cn> wrote:

> The return value of a regmap_raw_write() and regmap_update_bits()
> in the cleanup path was being ignored.
> 
> Fix this by checking the return value and warn on error.
> 
> Fixes: 1f4877218f7e ("iio: adc: mt6360: Add ADC driver for MT6360")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> 
> ---
> Changes in v2:
>  - Do not propagate cleanup path errors.
>  - Log a warning on failure instead of overwriting the return value, as
>    suggested by the maintainer.

As below. I think dev_err() is appropriate.

>  - Also check the return value of regmap_update_bits() for consistency.
> ---
>  drivers/iio/adc/mt6360-adc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
> index 69b3569c90e5..9ee7247aacbe 100644
> --- a/drivers/iio/adc/mt6360-adc.c
> +++ b/drivers/iio/adc/mt6360-adc.c
> @@ -70,6 +70,7 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
>  	ktime_t predict_end_t, timeout;
>  	unsigned int pre_wait_time;
>  	int ret;
> +	int cleanup_ret;
>  
>  	mutex_lock(&mad->adc_lock);
>  
> @@ -130,11 +131,16 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
>  out_adc_conv:
>  	/* Only keep ADC enable */
>  	adc_enable = cpu_to_be16(MT6360_ADCEN_MASK);
> -	regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG, &adc_enable, sizeof(adc_enable));
> +	cleanup_ret = regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG,
> +				&adc_enable, sizeof(adc_enable));
> +	if (cleanup_ret)
> +		dev_warn(mad->dev, "Failed to reset ADC config: %d\n", cleanup_ret);
Why warn? If this happens it's definite and error and may bite us later.

>  	mad->last_off_timestamps[channel] = ktime_get();
>  	/* Config prefer channel to NO_PREFER */
> -	regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PREFERCH_MASK,
> +	cleanup_ret = regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PREFERCH_MASK,
>  			   MT6360_NO_PREFER << MT6360_PREFERCH_SHFT);
> +	if (cleanup_ret)
> +		dev_warn(mad->dev, "Failed to reset prefer channel: %d\n", cleanup_ret);
>  out_adc_lock:
>  	mutex_unlock(&mad->adc_lock);
>  

Maybe it is worth trying to surface the error if nothing else has already gone wrong. That is a little fiddly
to do but something like

	if (cleanup_ret) {
		dev_err()
		ret = ret ?: cleanup_ret;
	}

I'm not sure it is worth the complexity however, so perhaps see if others have comments on this
in next few days before spinning a v3.

Thanks,

Jonathan

