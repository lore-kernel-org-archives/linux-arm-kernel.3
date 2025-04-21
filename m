Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1485C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkrXFVT56qXMD8Qn+YnLKqFI9L1XN0L0yQOy68LGNTU=; b=MNFaY4xmleONloisIV0ZsnsmUy
	ct7b3fAaI0hFhm/a/03OM3kUJT8NA+7zvdSMeblGrk9ib5TlkuohSiQOkViTK7gfGsMeZP32qWKx4
	HpaZtDYZgknRksyPW9XKIlAOVB2e/DEmT+js/77KIYrbW8iv0vGEbNwPT09FQeK+/S/OAu+LAodtI
	WNkf+SU1iA9mINIGm1yr649lgWZLHs3Ebg4WRdNHEJAdMp8PKMvJlLUVVy/4qN4JHJCdiSf3XD1cS
	/AluXl1nd9sY9gc94OWiwiVlw2Cqn6cJi5yyvTpk3FnKRBf90etIdIH5BOiW+DcgkdBSKrRc9xwU7
	+1YInyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p95-00000004BDl-2GcK;
	Mon, 21 Apr 2025 11:17:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p3z-00000004AbY-1wNe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 11:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B15B460008;
	Mon, 21 Apr 2025 11:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09667C4CEE4;
	Mon, 21 Apr 2025 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745233906;
	bh=xIOsJ++5ldkl33Ki3QyxhNNEyh/er5ilQpmhljgokC0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JPSKx+d1iKqilsixLE1m1PbLAH9n0c75A2xNSjkla7Z/w6WMcIII6RrrfYIINWeeT
	 4eQBAT8W1T06j1O+nSRF/msnKL3PrFMIufjYvetCaAtpS0ARBD2VbxTySnpVFCIyMr
	 ao2x0lt/2hyq8UMtbWdYW/EHAOo54ZSRqwXyv1/VI93zjryiB28+S7VkvipNzHlTdi
	 NINLEe8eAoS/GKxLz4GWKVX2AcmCS+qVhILaUf1dxmIcBWmVTibrY9sC1rjsxSDkMe
	 9Y8j1GoxtQLp01t/NTlOPsp7Oc8TDEht+aWOxS+yqAN90aEjs2YTBnhcDJ+QSDtTcp
	 1q37DQAEoUoYg==
Date: Mon, 21 Apr 2025 12:11:37 +0100
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
Subject: Re: [PATCH 03/10] iio: adc: hx711: use struct with aligned_s64
 timestamp
Message-ID: <20250421121137.26e30217@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-3-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
	<20250418-iio-prefer-aligned_s64-timestamp-v1-3-4c6080710516@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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

On Fri, 18 Apr 2025 14:58:22 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64_timestamp instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
This one is good and doesn't have the issue with moving timestamps.

Applied.
> ---
>  drivers/iio/adc/hx711.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 8da0419ecfa3575aa54a93707c681ec8ced28be8..7235fa9e13d57c693751757c5d40e8a799622f17 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
> @@ -87,7 +87,10 @@ struct hx711_data {
>  	 * triggered buffer
>  	 * 2x32-bit channel + 64-bit naturally aligned timestamp
>  	 */
> -	u32			buffer[4] __aligned(8);
> +	struct {
> +		u32 channel[2];
> +		aligned_s64 timestamp;
> +	} buffer;
>  	/*
>  	 * delay after a rising edge on SCK until the data is ready DOUT
>  	 * this is dependent on the hx711 where the datasheet tells a
> @@ -361,15 +364,15 @@ static irqreturn_t hx711_trigger(int irq, void *p)
>  
>  	mutex_lock(&hx711_data->lock);
>  
> -	memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> +	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
>  
>  	iio_for_each_active_channel(indio_dev, i) {
> -		hx711_data->buffer[j] = hx711_reset_read(hx711_data,
> +		hx711_data->buffer.channel[j] = hx711_reset_read(hx711_data,
>  					indio_dev->channels[i].channel);
>  		j++;
>  	}
>  
> -	iio_push_to_buffers_with_timestamp(indio_dev, hx711_data->buffer,
> +	iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer,
>  							pf->timestamp);
>  
>  	mutex_unlock(&hx711_data->lock);
> 


