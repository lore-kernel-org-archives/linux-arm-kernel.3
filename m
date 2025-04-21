Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E00AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXBFTXZJ1O9H4E7i7x0bXvIUx+orouk6FApq9E2Mumc=; b=viVbZHn+R5aPTksZQQOLEkprHH
	JTkfxBA0k2nvJl65tOhzInR1euwLBPnTB3SrYvpC13VO2DXH280wnNdkD+BYyq2lr0HgUZ2HgwaEI
	HgLEnpSRUuPlcCz0oVb4yGXpAKUFaW9ikjD1b2ZiNhbxvHWlM7O2zoiF4Gx34/Csxeh1BuOeRpCl8
	gl0FvCNfAm6qNZoWKvbymWzug/dJAKGI6lVN5L8op5pCYX/SjIXawP95IL99THaqNqraffOCJE+Kw
	qUzQwsMo3mVLrayCQJrH00vyrVeuKvOXzZo33jaoWEcXlp/yFR7QWitPtdKx2zXuj470Yn6/BHbfQ
	EEJuSH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pEZ-00000004BlH-2TuL;
	Mon, 21 Apr 2025 11:22:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p7c-00000004B5L-1mdD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 11:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B7285C5784;
	Mon, 21 Apr 2025 11:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D609C4CEE4;
	Mon, 21 Apr 2025 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745234131;
	bh=TdFSkW6rqypU0+ImrYwDMTJM3iLFX0OMR7ZgNNK8YxA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Myzm4XAFqBLGoeUjlyfyQjhc7KPyaHZA16g4xxJMBb7l20uElkuxTHmsAWf8saup6
	 adlybNGy/G7BUnaHEPf8718dBJGEgRFuQeQkCxtqX8Bn9p/2l2vvxhcpjI9hB0bsPM
	 lJ2+qyke6mrPwKI8Hh8un4rovBOZX2OkCk4Q8X9nn227DZEF2okAnm8j/vbca6YH+g
	 VaMbt/bih3JxM+cQak8hKBgGM5Hm7usTKDTOQkny7+xPYSR7/bJtZQyYZOZQ94UFRL
	 zmDWSIkMfemzQLrVhOmcFqQVVSellMq3+ImJPvJP9nDSEsU1RBZZE8h7a7SANHZNZ4
	 E3UN3wWgZ/wMQ==
Date: Mon, 21 Apr 2025 12:15:19 +0100
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
Subject: Re: [PATCH 06/10] iio: adc: ti-adc0832: use struct with aligned_s64
 timestamp
Message-ID: <20250421121519.4189bd3d@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-6-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
	<20250418-iio-prefer-aligned_s64-timestamp-v1-6-4c6080710516@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_041532_574900_8AF5DCFD 
X-CRM114-Status: GOOD (  22.42  )
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

On Fri, 18 Apr 2025 14:58:25 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64_timestamp instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/ti-adc0832.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-adc0832.c b/drivers/iio/adc/ti-adc0832.c
> index cfcdafbe284b103a069857028886411bc72dea4f..f508f7113faa2610a2889f3c36c5a679fa72264d 100644
> --- a/drivers/iio/adc/ti-adc0832.c
> +++ b/drivers/iio/adc/ti-adc0832.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/spi/spi.h>
> +#include <linux/types.h>
>  #include <linux/iio/iio.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/iio/buffer.h>
> @@ -29,12 +30,10 @@ struct adc0832 {
>  	struct regulator *reg;
>  	struct mutex lock;
>  	u8 mux_bits;
> -	/*
> -	 * Max size needed: 16x 1 byte ADC data + 8 bytes timestamp
> -	 * May be shorter if not all channels are enabled subject
> -	 * to the timestamp remaining 8 byte aligned.

If the comment is going, we need to capture that there are 16 channels
via a define or a comment.

This one probably wants to stay as a buffer but the same will apply to a new
patch doing that.


> -	 */
> -	u8 data[24] __aligned(8);
> +	struct {
> +		u8 data[16];
> +		aligned_s64 timestamp;
> +	} buffer;
>  
>  	u8 tx_buf[2] __aligned(IIO_DMA_MINALIGN);
>  	u8 rx_buf[2];
> @@ -222,10 +221,10 @@ static irqreturn_t adc0832_trigger_handler(int irq, void *p)
>  			goto out;
>  		}
>  
> -		adc->data[i] = ret;
> +		adc->buffer.data[i] = ret;
>  		i++;
>  	}
> -	iio_push_to_buffers_with_ts(indio_dev, adc->data, sizeof(adc->data),
> +	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
>  				    iio_get_time_ns(indio_dev));
>  out:
>  	mutex_unlock(&adc->lock);
> 


