Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA5FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 23:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iamqFMf6YfFXfgmbAznVKA/YxL41UmipZ81J9LhLv34=; b=KxFRkNNxFDI+fcmAwp1uVOgcTY
	pnZEpvlHJjVbCshhxVyUYm5le89e+V+4nwNdGMeOgKOJefOTnV/M+flgGWXFiSPTqtaQUkwFKDkjj
	PydDywrmhnl9Qag4vXI/sYGr+kK3kdu9Tidxq0UUHaag+cEpuOuLt7C+LlzS41CAknDgK/ehfMYKz
	PSn+SkDJYqJs4mH0VTT3pZ+Gk0aG89e8LA3aKMGKlthe/Oa1SJqVj5HJR4Y8nVzFLPXuyWRAzdpLA
	zo602vqYJx1++UTkGMCx82c1aTw5G41auXZYV5afhyDMGXb4pEc4gdkr6In8IpwAVyQnObekcXxJu
	Q8HEl8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDdR-000000096lE-1aYT;
	Wed, 29 Jul 2026 23:24:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDdQ-000000096l2-0aLs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 23:24:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B741600AA;
	Wed, 29 Jul 2026 23:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE1E1F000E9;
	Wed, 29 Jul 2026 23:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785367463;
	bh=iamqFMf6YfFXfgmbAznVKA/YxL41UmipZ81J9LhLv34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Zx3x/pGvOSSL7p9XfSjbsN3V4080GU4Vs4lDlAxxiK7BDJd81wjlQATKM9+BTjds/
	 zi/u49KhWgyh41Pbgsl8ETYNF7tihIXB8aYykIBDHqyndenyOxbfioOrI6uhImcHVk
	 UkKg+gsmXD1Fg2tKFcWUJ0hS6/04ngqRZBzjCTKDwhSeSa/tRqCv1PMTokNt60/0ao
	 ZTbYhQC2KjMkxwP8qY25yl4Xaacib+foT59rpoHPbiD9fP4b++CUBK6qGEocHYJSrJ
	 RKyC/Wl0HRd5plCdg6MwFWum2CfU5DXOpUNjYjvgmt0FqlCR/sZArH/rBL1sJxobaY
	 eBmHQ9oreU2Bw==
Date: Thu, 30 Jul 2026 00:24:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
 <Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
 <joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 02/16] iio: adc: at91-sama5d2_adc: use cleanup.h for
 NVMEM buffer
Message-ID: <20260730002416.261a6463@jic23-huawei>
In-Reply-To: <20260727122633.117435-3-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
	<20260727122633.117435-3-varshini.rajendran@microchip.com>
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

On Mon, 27 Jul 2026 17:56:19 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Use __free(kfree) and __free(nvmem_cell_put) cleanup helpers in
> at91_adc_temp_sensor_init() to simplify error handling paths.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
A couple of questions inline

> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 33 +++++++++++++-----------------
>  1 file changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index e8a5285bb6d4..4a4a25f3c715 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -35,6 +35,8 @@
>  
>  #include <dt-bindings/iio/adc/at91-sama5d2_adc.h>
>  
> +DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (_T) nvmem_cell_put(_T))
I've lost track if it was previously discussed, but did you propose this for
more general useage in nvmem-consumer.h

The first randomly selected file I opened with nvmem_cell_put() could
make use of this so I assume it is generally useful?


> +
>  struct at91_adc_reg_layout {
>  /* Control Register */
>  	u16				CR;
> @@ -2249,33 +2251,28 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
>  				     struct device *dev)
>  {
>  	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
> -	struct nvmem_cell *temp_calib;
> -	u32 *buf;
>  	size_t len;
> -	int ret = 0;
>  
>  	if (!st->soc_info.platform->temp_sensor)
>  		return 0;
>  
>  	/* Get the calibration data from NVMEM. */
> -	temp_calib = nvmem_cell_get(dev, "temperature_calib");
> +	struct nvmem_cell *temp_calib __free(nvmem_cell_put) =
> +		nvmem_cell_get(dev, "temperature_calib");
>  	if (IS_ERR(temp_calib)) {
> -		ret = PTR_ERR(temp_calib);

Why this change?  Just to avoid the need for ret?  
I'd keep it and reduce the noise in the patch.
 
> -		if (ret != -ENOENT)
> +		if (PTR_ERR(temp_calib) != -ENOENT)
>  			dev_err(dev, "Failed to get temperature_calib cell!\n");
> -		return ret;
> +		return PTR_ERR(temp_calib);
>  	}
>  
> -	buf = nvmem_cell_read(temp_calib, &len);
> -	nvmem_cell_put(temp_calib);
> -	if (IS_ERR(buf)) {
> -		dev_err(dev, "Failed to read calibration data!\n");
> -		return PTR_ERR(buf);
> -	}
> -	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4) {
> +	u32 *buf __free(kfree) = nvmem_cell_read(temp_calib, &len);
> +	if (IS_ERR(buf))
> +		return dev_err_probe(dev, PTR_ERR(buf),
> +				     "Failed to read calibration data!\n");
> +
> +	if (len < AT91_ADC_TS_CLB_IDX_MAX * sizeof(*buf)) {
>  		dev_err(dev, "Invalid calibration data!\n");
> -		ret = -EINVAL;
> -		goto free_buf;
> +		return -EINVAL;
>  	}
>  
>  	/* Store calibration data for later use. */
> @@ -2288,9 +2285,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
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


