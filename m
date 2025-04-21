Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41266C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sggaySWQolZV5IOMG2CbSowHGN8SAplpIWm3hu6GyRg=; b=qMQDPDXMQc0ZZj6BOPwU3o5IIg
	dTJKNs2G+/oBHthHCozbnFONpAUl32n8MJGhavesW/WgMz2A1qFZyLYzQEbLBV+gDHSLT3Yr18LPr
	MmmAQNTI+wtTSobpUNabyUG3MYJDLnVuyICE/jP907Zf/3L1CNlE6CK4RGsXoTtPpXIsyzuZ2crNH
	lcScDY9WE8gNQSfhF5VhULijz/h6wXTSNaMCXUmndYEs0PnhkMBDhRg7EkbfSxjdhDF/KJHJbO9Hz
	8c6EjPJLrEPwd0/P2IR0r2YKSwg5s1MGXEzRLH+2ITH8dlAbSfVtWSPk4IDXjPybPM82CXA3H9G+b
	5ZknujBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p5Q-00000004AmL-0G82;
	Mon, 21 Apr 2025 11:13:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p2k-00000004AR0-1V7M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 11:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 332A444D6D;
	Mon, 21 Apr 2025 11:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE7AC4CEE4;
	Mon, 21 Apr 2025 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745233828;
	bh=qBNeYTCCeJLPNODBt8loEIk8Uz5A8LZFmdC8vvl9rQM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i0/qTr8hB4VUINlgBBJ+1dH9hr0Bfy6rW8xEjEnkBFICRaT5N5K3To9a48uuNl602
	 9Fg7MzxfZyF9nlnJMdZ+rsTUzGYm6wEv0IKfKKgciN9GGdr35379JMNRQ/ps9pA73J
	 Jt9qKTv953bM922uwYv6HBi5yEsY3i6zMBGkWkYz9/cKegiPxelGIfbRutEu58cwuP
	 qUhnf2uytx6KmLFQd+aVD+zLKJKamHqrcxpr5cQq9S3KtbuWB0z26VFUaKHhkiV+UO
	 OTmJr9/4U3csWp5ky5iPWBko0Fc/TOCWtynTBcyHLa+Dy3k62Fhca/Q5Aa5x9V9BT6
	 3kDgzPC0jJrgQ==
Date: Mon, 21 Apr 2025 12:10:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 02/10] iio: adc: at91-sama5d2_adc: use struct with
 aligned_s64 timestamp
Message-ID: <20250421121018.5b09ea21@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
	<20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_041030_445849_A597D671 
X-CRM114-Status: GOOD (  23.41  )
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

On Fri, 18 Apr 2025 14:58:21 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64 timestamp_instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index 414610afcb2c4128a63cf76767803c32cb01ac5e..07ced924f7a6ae36fe538021a45adbf7d76c2e69 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/sched.h>
> +#include <linux/types.h>
>  #include <linux/units.h>
>  #include <linux/wait.h>
>  #include <linux/iio/iio.h>
> @@ -586,15 +587,6 @@ struct at91_adc_temp {
>  	u16				saved_oversampling;
>  };
>  
> -/*
> - * Buffer size requirements:
> - * No channels * bytes_per_channel(2) + timestamp bytes (8)
> - * Divided by 2 because we need half words.
> - * We assume 32 channels for now, has to be increased if needed.
> - * Nobody minds a buffer being too big.
> - */
> -#define AT91_BUFFER_MAX_HWORDS ((32 * 2 + 8) / 2)
> -
>  struct at91_adc_state {
>  	void __iomem			*base;
>  	int				irq;
> @@ -617,7 +609,10 @@ struct at91_adc_state {
>  	struct iio_dev			*indio_dev;
>  	struct device			*dev;
>  	/* Ensure naturally aligned timestamp */
> -	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
> +	struct {
> +		u16 data[32];

When you rework this into the large buffer scheme, can you add a define
or some other means to establish where that 32 comes from!
We've lost the comment as a result of this refactor so need to put that
info back somehow.


> +		aligned_s64 timestamp;
> +	} buffer;
>  	/*
>  	 * lock to prevent concurrent 'single conversion' requests through
>  	 * sysfs.
> @@ -1481,14 +1476,14 @@ static void at91_adc_trigger_handler_nodma(struct iio_dev *indio_dev,
>  		if (chan->type == IIO_VOLTAGE) {
>  			val = at91_adc_read_chan(st, chan->address);
>  			at91_adc_adjust_val_osr(st, &val);
> -			st->buffer[i] = val;
> +			st->buffer.data[i] = val;
>  		} else {
> -			st->buffer[i] = 0;
> +			st->buffer.data[i] = 0;
>  			WARN(true, "This trigger cannot handle this type of channel");
>  		}
>  		i++;
>  	}
> -	iio_push_to_buffers_with_timestamp(indio_dev, st->buffer,
> +	iio_push_to_buffers_with_timestamp(indio_dev, &st->buffer,
>  					   pf->timestamp);
>  }
>  
> @@ -1643,7 +1638,7 @@ static void at91_adc_touch_data_handler(struct iio_dev *indio_dev)
>  			at91_adc_read_pressure(st, chan->channel, &val);
>  		else
>  			continue;
> -		st->buffer[i] = val;
> +		st->buffer.data[i] = val;
>  		i++;
>  	}
>  	/*
> @@ -1691,7 +1686,7 @@ static void at91_adc_workq_handler(struct work_struct *workq)
>  					struct at91_adc_state, touch_st);
>  	struct iio_dev *indio_dev = st->indio_dev;
>  
> -	iio_push_to_buffers(indio_dev, st->buffer);
> +	iio_push_to_buffers(indio_dev, st->buffer.data);
>  }
>  
>  static irqreturn_t at91_adc_interrupt(int irq, void *private)
> 


