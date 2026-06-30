Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86075C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBl+6WzSpT/r8VJbJjcUsnvI61cG+nFbsKW3MvqaIPA=; b=br4gbO2LTT8lmhOrRXU7mk/4lj
	pOtUBOAlWbuZ6rPTA8ufjSYpeG6a9Jmco1WGOp5rou7Bgkna1Z2tW6cuot+3jx5uFD3A/nbpvGPFJ
	Oe7aB3EIeG7H2MK9ewmwYdCz3Bh92P2YQvT/FO8wtbGZvg6M95irLO1l7NY8yqSyMEzoNFpQ7asgH
	e0LxcMlOag6VC/0dhVt7aGyrautlwuDyMVDxOsOYccFV/BUcgklZbde5A/Caf3v7sHzwuUEOKza33
	oxL7T48qGKFub7iVR+705Jh9Aqvn505W6c66wA8UBJGSD7qhrOoBQ2kknnd9YCgK3dUlLCH4OAfET
	me/+wt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wei0L-00000000MXm-0aqU;
	Tue, 30 Jun 2026 23:36:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehzq-00000000MUt-46V9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 23:36:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B14DC41ABF;
	Tue, 30 Jun 2026 23:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F591F000E9;
	Tue, 30 Jun 2026 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782862566;
	bh=wBl+6WzSpT/r8VJbJjcUsnvI61cG+nFbsKW3MvqaIPA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y91pGPX3csjh9S5RSRf2qGRuH0GGevE+5z2x7tzXgzctOziJ9PewIRILeDbKTAUjO
	 LSXKLM4ACsC7lmlQ6oFPsISYp17vUPSgnCROtv8ECQlrc9HdP0w3++kRSxIHRXg2el
	 SD3A64CwFOQ5wsCQP6MJ/wnGyVe9oFZfObmZMpBJZnY9GnSawTGaT36pLIbufkwI1i
	 HOf91n4H0tob12xZj2HRD3nWP9nJEaGo204ZBij3mbO7Ni1p3Ep4hLr4+0bOH2kOQQ
	 SeF4FHogn7gtSxm+dx4xf5AEvFZjrWRXLIjH91PEGJhR27xNfwrL+4E7Bvrn0g0sqz
	 K8xzoQ1V/5sJg==
Date: Wed, 1 Jul 2026 00:36:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>,
 <jorge.marques@analog.com>, <mazziesaccount@gmail.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 02/13] iio: adc: at91-sama5d2_adc: use cleanup.h for
 NVMEM buffer
Message-ID: <20260701003600.2a238c20@jic23-huawei>
In-Reply-To: <20260630093603.38663-3-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
	<20260630093603.38663-3-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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

On Tue, 30 Jun 2026 15:05:52 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Use __free(kfree) cleanup helper for the NVMEM data buffer in
> at91_adc_temp_sensor_init() to simplify error handling paths.
> 
> Since __free(kfree) requires a valid kfree-able pointer (not an

Does it require a a kfree-able pointer?
Definition is:
DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T))

Some of these DEFINE_FREE() uses did change to be more resilient
to errors so maybe you have an old kernel?

> ERR_PTR), store nvmem_cell_read() result in a temporary void pointer
> first, check for errors, then assign to the managed buffer.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index 255970b2e747..5015c234289e 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -2251,9 +2251,10 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
>  {
>  	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
>  	struct nvmem_cell *temp_calib;
> -	u32 *buf;
> +	u32 *buf __free(kfree) = NULL;
This breaks the 'rule' about having the destructor defined right next to the
destructor (IIRC there is guidance on this in cleanup.h comments).  Linus is
very keen on this always being done and doesn't like the = NULL pattern at all
(I agree but easier to blame the chief Penguin ;)

Given the argument for this seems to be wrong anyway, just define and assign
in one line below.


> +	void *cell_data;
>  	size_t len;
> -	int ret = 0;
> +	int ret;
>  
>  	if (!st->soc_info.platform->temp_sensor)
>  		return 0;
> @@ -2267,16 +2268,18 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
>  		return ret;
>  	}
>  
> -	buf = nvmem_cell_read(temp_calib, &len);

	

> +	cell_data = nvmem_cell_read(temp_calib, &len);
>  	nvmem_cell_put(temp_calib);

This dance with nvmem_cell_put being called before the error check
seems like another place a cleanup.h trick is useful.

Can we have a DEFINE_FREE() for nvmem_cell_put()  I don't think
ti will matter if we hold that reference for the scope of the rest
of this function - but do check that!

With that in place, you can just do
	u32 *buf __free(kfree) = nvmem_cell_read(temp_calib, &len);
	if (IS_ERR(buf))
		return dev_err_probe(dev, PTR_ERR(buf),
				     "Failed to read calibration data");
	
	}
> -	if (IS_ERR(buf)) {
> +	if (IS_ERR(cell_data)) {
>  		dev_err(dev, "Failed to read calibration data!\n");
> -		return PTR_ERR(buf);
> +		return PTR_ERR(cell_data);
>  	}
> +
> +	buf = cell_data;

> +
>  	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4) {
>  		dev_err(dev, "Invalid calibration data!\n");
> -		ret = -EINVAL;
> -		goto free_buf;
> +		return -EINVAL;
>  	}
>  
>  	/* Store calibration data for later use. */
> @@ -2289,9 +2292,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
>  	 */
>  	clb->p1 = clb->p1 * 1000;
>  
> -free_buf:
> -	kfree(buf);
> -	return ret;
> +	return 0;
>  }
>  
>  static int at91_adc_probe(struct platform_device *pdev)


