Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE27C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjKVJqoWVAS53Pc1wsAByMnpVKnxvUmjRTG1LDcF1cc=; b=1C3t+TogX0UiTc
	/8TeKsidk035YkoAinFFRiv9r8AcAdUwQhz3+FrI1PmC6OyvwmS7sgD0QEZqadlWtk+w1clg21gB2
	SYBQ7S13IbaMSOTtnCoBdfSvZfaNGsDh86C8Ih7nFKrD+iSCUQ2W+s1d2dijZC5n3bpoaYoIK8aGx
	1I+/DWY/SZ1cjYNaQjVU+yt7uTmHX1qBAK3kQgDIhm1Tkgi7EMPBS7xarP6r7GC1QdSr7ldmFKpGG
	xLhmTyR4qjquzE/nH/H9WvFYwZOaa/5rEzEabaWepLgpYnZk+GAhNpdE6kRSlKN5VfUtXvGzwcg5z
	CzgL+22dV4Hg6vJ5EA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBGy-00000002fYb-0ioj;
	Sat, 18 Jan 2025 16:02:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBFP-00000002f47-1kaH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 16:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3CF6DA41346;
	Sat, 18 Jan 2025 15:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B844C4CED1;
	Sat, 18 Jan 2025 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737216029;
	bh=aoL64gAwJYIQk+frzXHPyXnLHLTZu1YygjJp4IyW1PE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HYAV0GBd7taKQQx9yxmurM4I2tT10lJncshdGK4rBARte0lKq2fmY1/G9oH6J85H5
	 cv/rNSYdjQztMWszuUUbrNCyUkiySXr2uiz/UGYJjQbK/RLRjLIkCx/0CJo4f30Rqe
	 G3iZlIzg2m4QkxuNHFcTybeeKQSohuOL+VhxArrztiuHj2cE6Su8TK5r1FtwE34RML
	 rUS1Hn96oQu7fBVQeectR+YegZND3UT+o9Z2sQgu8bK9893xBdfN82zVZjby+s3qBn
	 sjjO7vOz3JO49m0tMe+foLcVKeBQdMbzJvWSCxoRPzMEeWXZTw1KR0/hDdQOeF8QRb
	 dg7GuefQSYh5A==
Date: Sat, 18 Jan 2025 16:00:20 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Nayab Sayed via B4 Relay
 <devnull+nayabbasha.sayed.microchip.com@kernel.org>
Subject: Re: [PATCH v2] iio: adc: at91-sama5d2_adc: fix sama7g5 realbits
 value
Message-ID: <20250118160020.5b32eb61@jic23-huawei>
In-Reply-To: <20250115-fix-sama7g5-adc-realbits-v2-1-58a6e4087584@microchip.com>
References: <20250115-fix-sama7g5-adc-realbits-v2-1-58a6e4087584@microchip.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_080031_590242_02A1120F 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: nayabbasha.sayed@microchip.com, Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jan 2025 11:37:04 +0530
Nayab Sayed via B4 Relay <devnull+nayabbasha.sayed.microchip.com@kernel.org> wrote:

> From: Nayab Sayed <nayabbasha.sayed@microchip.com>
> 
> The number of valid bits in SAMA7G5 ADC channel data register are 16.
> Hence changing the realbits value to 16
> 
> Fixes: 840bf6cb983f ("iio: adc: at91-sama5d2_adc: add support for sama7g5 device")
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
Applied to the fixes-togreg branch of iio.git and marked for stable.
Note though I'll be rebasing that on rc1 once available and haven't pushed
out in the meantime a will make a mess of linux-next.

Jonathan

> ---
> Changes in v2:
> - Add `Fixes:` tag in commit message.
> - Link to v1: https://lore.kernel.org/r/20250103-fix-sama7g5-adc-realbits-v1-1-1732d265c36a@microchip.com
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 68 ++++++++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index 8e5aaf15a921..c3a1dea2aa82 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -329,7 +329,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
>  #define AT91_HWFIFO_MAX_SIZE_STR	"128"
>  #define AT91_HWFIFO_MAX_SIZE		128
>  
> -#define AT91_SAMA5D2_CHAN_SINGLE(index, num, addr)			\
> +#define AT91_SAMA_CHAN_SINGLE(index, num, addr, rbits)			\
>  	{								\
>  		.type = IIO_VOLTAGE,					\
>  		.channel = num,						\
> @@ -337,7 +337,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
>  		.scan_index = index,					\
>  		.scan_type = {						\
>  			.sign = 'u',					\
> -			.realbits = 14,					\
> +			.realbits = rbits,				\
>  			.storagebits = 16,				\
>  		},							\
>  		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> @@ -350,7 +350,13 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
>  		.indexed = 1,						\
>  	}
>  
> -#define AT91_SAMA5D2_CHAN_DIFF(index, num, num2, addr)			\
> +#define AT91_SAMA5D2_CHAN_SINGLE(index, num, addr)			\
> +	AT91_SAMA_CHAN_SINGLE(index, num, addr, 14)
> +
> +#define AT91_SAMA7G5_CHAN_SINGLE(index, num, addr)			\
> +	AT91_SAMA_CHAN_SINGLE(index, num, addr, 16)
> +
> +#define AT91_SAMA_CHAN_DIFF(index, num, num2, addr, rbits)		\
>  	{								\
>  		.type = IIO_VOLTAGE,					\
>  		.differential = 1,					\
> @@ -360,7 +366,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
>  		.scan_index = index,					\
>  		.scan_type = {						\
>  			.sign = 's',					\
> -			.realbits = 14,					\
> +			.realbits = rbits,				\
>  			.storagebits = 16,				\
>  		},							\
>  		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> @@ -373,6 +379,12 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
>  		.indexed = 1,						\
>  	}
>  
> +#define AT91_SAMA5D2_CHAN_DIFF(index, num, num2, addr)			\
> +	AT91_SAMA_CHAN_DIFF(index, num, num2, addr, 14)
> +
> +#define AT91_SAMA7G5_CHAN_DIFF(index, num, num2, addr)			\
> +	AT91_SAMA_CHAN_DIFF(index, num, num2, addr, 16)
> +
>  #define AT91_SAMA5D2_CHAN_TOUCH(num, name, mod)				\
>  	{								\
>  		.type = IIO_POSITIONRELATIVE,				\
> @@ -666,30 +678,30 @@ static const struct iio_chan_spec at91_sama5d2_adc_channels[] = {
>  };
>  
>  static const struct iio_chan_spec at91_sama7g5_adc_channels[] = {
> -	AT91_SAMA5D2_CHAN_SINGLE(0, 0, 0x60),
> -	AT91_SAMA5D2_CHAN_SINGLE(1, 1, 0x64),
> -	AT91_SAMA5D2_CHAN_SINGLE(2, 2, 0x68),
> -	AT91_SAMA5D2_CHAN_SINGLE(3, 3, 0x6c),
> -	AT91_SAMA5D2_CHAN_SINGLE(4, 4, 0x70),
> -	AT91_SAMA5D2_CHAN_SINGLE(5, 5, 0x74),
> -	AT91_SAMA5D2_CHAN_SINGLE(6, 6, 0x78),
> -	AT91_SAMA5D2_CHAN_SINGLE(7, 7, 0x7c),
> -	AT91_SAMA5D2_CHAN_SINGLE(8, 8, 0x80),
> -	AT91_SAMA5D2_CHAN_SINGLE(9, 9, 0x84),
> -	AT91_SAMA5D2_CHAN_SINGLE(10, 10, 0x88),
> -	AT91_SAMA5D2_CHAN_SINGLE(11, 11, 0x8c),
> -	AT91_SAMA5D2_CHAN_SINGLE(12, 12, 0x90),
> -	AT91_SAMA5D2_CHAN_SINGLE(13, 13, 0x94),
> -	AT91_SAMA5D2_CHAN_SINGLE(14, 14, 0x98),
> -	AT91_SAMA5D2_CHAN_SINGLE(15, 15, 0x9c),
> -	AT91_SAMA5D2_CHAN_DIFF(16, 0, 1, 0x60),
> -	AT91_SAMA5D2_CHAN_DIFF(17, 2, 3, 0x68),
> -	AT91_SAMA5D2_CHAN_DIFF(18, 4, 5, 0x70),
> -	AT91_SAMA5D2_CHAN_DIFF(19, 6, 7, 0x78),
> -	AT91_SAMA5D2_CHAN_DIFF(20, 8, 9, 0x80),
> -	AT91_SAMA5D2_CHAN_DIFF(21, 10, 11, 0x88),
> -	AT91_SAMA5D2_CHAN_DIFF(22, 12, 13, 0x90),
> -	AT91_SAMA5D2_CHAN_DIFF(23, 14, 15, 0x98),
> +	AT91_SAMA7G5_CHAN_SINGLE(0, 0, 0x60),
> +	AT91_SAMA7G5_CHAN_SINGLE(1, 1, 0x64),
> +	AT91_SAMA7G5_CHAN_SINGLE(2, 2, 0x68),
> +	AT91_SAMA7G5_CHAN_SINGLE(3, 3, 0x6c),
> +	AT91_SAMA7G5_CHAN_SINGLE(4, 4, 0x70),
> +	AT91_SAMA7G5_CHAN_SINGLE(5, 5, 0x74),
> +	AT91_SAMA7G5_CHAN_SINGLE(6, 6, 0x78),
> +	AT91_SAMA7G5_CHAN_SINGLE(7, 7, 0x7c),
> +	AT91_SAMA7G5_CHAN_SINGLE(8, 8, 0x80),
> +	AT91_SAMA7G5_CHAN_SINGLE(9, 9, 0x84),
> +	AT91_SAMA7G5_CHAN_SINGLE(10, 10, 0x88),
> +	AT91_SAMA7G5_CHAN_SINGLE(11, 11, 0x8c),
> +	AT91_SAMA7G5_CHAN_SINGLE(12, 12, 0x90),
> +	AT91_SAMA7G5_CHAN_SINGLE(13, 13, 0x94),
> +	AT91_SAMA7G5_CHAN_SINGLE(14, 14, 0x98),
> +	AT91_SAMA7G5_CHAN_SINGLE(15, 15, 0x9c),
> +	AT91_SAMA7G5_CHAN_DIFF(16, 0, 1, 0x60),
> +	AT91_SAMA7G5_CHAN_DIFF(17, 2, 3, 0x68),
> +	AT91_SAMA7G5_CHAN_DIFF(18, 4, 5, 0x70),
> +	AT91_SAMA7G5_CHAN_DIFF(19, 6, 7, 0x78),
> +	AT91_SAMA7G5_CHAN_DIFF(20, 8, 9, 0x80),
> +	AT91_SAMA7G5_CHAN_DIFF(21, 10, 11, 0x88),
> +	AT91_SAMA7G5_CHAN_DIFF(22, 12, 13, 0x90),
> +	AT91_SAMA7G5_CHAN_DIFF(23, 14, 15, 0x98),
>  	IIO_CHAN_SOFT_TIMESTAMP(24),
>  	AT91_SAMA5D2_CHAN_TEMP(AT91_SAMA7G5_ADC_TEMP_CHANNEL, "temp", 0xdc),
>  };
> 
> ---
> base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
> change-id: 20250103-fix-sama7g5-adc-realbits-37f62f8925d7
> 
> Best regards,


