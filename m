Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4820FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+zahhJHj07HWvl7DNjhmnl0nAVHZGcBuWyOQqbroZ8=; b=dln+KFsSV4+91d
	41JJOg7+C7NdihrlfrbsRjJ7R+9Ko9j3regUdx7MjtU8iiq1JW0yqE0qCr55OL6XGZTXfiFookn5o
	E60oGdwmq7SioR/8ow8VFUteLrEuARsYuk4guoUi6XOAj8FSfvLc4QILTNGSGjdjkSwoTzQ7+dqiI
	PYncqsIJFbNqsyQSIImoVPed718juTTqYKzJdk+7iKnkQ5lUSBwCCzkCz1vm7u0R1s1tMdW45y4Hd
	QyaUzsO+xbHhvhFow+bXE0mS+fKjSa1zLIafJ4PI4AI7ILQoegK9jWLXI3EWmSOKfx4z0xDYEItvG
	ryWJRJKPGBQRCyuMnfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU4NE-0000000F3hd-1Cuk;
	Sat, 04 Jan 2025 13:39:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU4M3-0000000F3cq-249V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 13:38:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B7ECA40691;
	Sat,  4 Jan 2025 13:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C233C4CED1;
	Sat,  4 Jan 2025 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735997894;
	bh=DZ641ToUHGGIED25myr3uOrPZ32fWg2JpL6WpgLolKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HlGHfP9xizgNnOE+02G0SLHGaEHmxCwRd40Vo+pgpo7Am7HmR/cub6RSRG8zP+zgA
	 icLL/MgUHmBnMW6rJG1KHmWZa7ajA8Z1OWe8Gjt6WkM6D06VrFcQZS1akOwVZQeWyL
	 4SHAMcpcKLaEA2tQJ1knx2WF8jl5h1wr9KiUPkzHElDVqmt1Opxa4UQSudob/4CNDK
	 BY7UlxHu4+ICOp1iQ+sht5F7pj1GqVoi96QplUShifUGySwpg7866hb3wpcVMLmI6b
	 TkrdkdnNc2SDowJ8EDwCs6aFAnueTNXovIaI2NJB+0iY2DpDSK9bgub53Tv4euY0De
	 2szrPU6AR2jDQ==
Date: Sat, 4 Jan 2025 13:38:04 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Nayab Sayed via B4 Relay
 <devnull+nayabbasha.sayed.microchip.com@kernel.org>
Subject: Re: [PATCH] iio: adc: at91-sama5d2_adc: fix sama7g5 realbits value
Message-ID: <20250104133804.2a3c2ba3@jic23-huawei>
In-Reply-To: <20250103-fix-sama7g5-adc-realbits-v1-1-1732d265c36a@microchip.com>
References: <20250103-fix-sama7g5-adc-realbits-v1-1-1732d265c36a@microchip.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_053815_678239_58D65AE5 
X-CRM114-Status: GOOD (  17.23  )
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
Cc: nayabbasha.sayed@microchip.com, Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jan 2025 16:50:40 +0530
Nayab Sayed via B4 Relay <devnull+nayabbasha.sayed.microchip.com@kernel.org> wrote:

> From: Nayab Sayed <nayabbasha.sayed@microchip.com>
> 
> The number of valid bits in SAMA7G5 ADC channel data register are 16.
> Hence changing the realbits value to 16
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
Please send an appropriate fixes tag so we know how far to backport.
In reply to this mail is fine (no need to send a v2 for that)

Thanks,

Jonathan

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
> base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> change-id: 20250103-fix-sama7g5-adc-realbits-37f62f8925d7
> 
> Best regards,


