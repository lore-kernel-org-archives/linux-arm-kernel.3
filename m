Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31A8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=av1dZ903Qe5cH7xNjzzbX6LUsXwx6HoGx9FOcTx68sE=; b=wHsBaIV5ManqojnZi5RmULiJZ4
	LL6SMcQMjazeHdhQQFUvmAB5jSY1b6ySQsoi2qCDWhnkFHNN+KQZePQZre5jTrwEKeFC+fzLhrJPA
	GGKDLhLKgiG5U087r6KqhVlI9FX/BcgPofgPHTBLfoo3skkwP7k2/ciPiFQXJkGGBKuEf4d66tphq
	PWmZ76bHfBh4+P5kAIVNd9LU8BQ95M/cw1E65q0Foa2/FJwVQJII6fqzRcfTlUwlL7DMmeLZalknY
	5ANSlK7Qw5goBLSyqTqiGBWymEhuyAn1O7UI3mMsghBND3c3Yj04sJifw9WeVGL3EFiZOgTQz/2yN
	fK/lMkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgN0-0000000Ff0Z-1gAR;
	Wed, 06 Aug 2025 15:48:02 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujg7L-0000000FcDN-2Cka
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:31:53 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bxvKr1Stxz6GDGT;
	Wed,  6 Aug 2025 23:27:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id ACBF314037D;
	Wed,  6 Aug 2025 23:31:45 +0800 (CST)
Received: from localhost (10.81.207.60) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 6 Aug
 2025 17:31:44 +0200
Date: Wed, 6 Aug 2025 16:31:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
CC: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/15] iio: adc: at91-sama5d2_adc: adapt the driver for
 sama7d65
Message-ID: <20250806163141.00005d83@huawei.com>
In-Reply-To: <20250804100219.63325-10-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
	<20250804100219.63325-10-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.60]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_083151_852605_37DCA3A2 
X-CRM114-Status: GOOD (  18.72  )
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

On Mon, 4 Aug 2025 15:32:13 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add support to sama7d65 ADC. The differences are highlighted with the
> compatible. The init and parsing of the temperature sensor and
> calibration indexes are the main differences.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
...

>  static int at91_adc_chan_xlate(struct iio_dev *indio_dev, int chan)
>  {
>  	int i;
> @@ -2319,6 +2360,56 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
>  	return ret;
>  }
>  
> +static int at91_sama7d65_adc_temp_sensor_init(struct at91_adc_state *st,
> +					      struct device *dev)
> +{
> +	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
> +	struct nvmem_cell *temp_calib;
> +	u32 *buf = NULL;

As per earlier comment and I see Andy raised it as well. __free()
magic dust is useful here.

> +	size_t len;
> +	int ret = 0;
> +
> +	if (!st->soc_info.platform->temp_sensor)
> +		return 0;
> +
> +	/* Get the calibration data from NVMEM. */
> +	temp_calib = devm_nvmem_cell_get(dev, "temperature_calib");
> +	if (IS_ERR(temp_calib)) {
> +		ret = PTR_ERR(temp_calib);
> +		if (ret != -ENOENT)
> +			dev_err(dev, "Failed to get temperature_calib cell!\n");
> +		return ret;
> +	}
> +
> +	buf = nvmem_cell_read(temp_calib, &len);
> +	if (IS_ERR(buf)) {
> +		dev_err(dev, "Failed to read calibration data!\n");
> +		return PTR_ERR(buf);
> +	}
> +
> +	if (len < AT91_SAMA7D65_ADC_TS_CLB_IDX_MAX * sizeof(u32) ||
> +	    buf[0] != AT91_TEMP_CALIB_TAG) {
> +		dev_err(dev, "Invalid calibration data!\n");
> +		ret = -EINVAL;
> +		goto free_buf;
> +	}
> +
> +	/* Store calibration data for later use. */
> +	clb->p1 = buf[AT91_SAMA7D65_ADC_TS_CLB_IDX_P1];
> +	clb->p4 = buf[AT91_SAMA7D65_ADC_TS_CLB_IDX_P4];
> +	clb->p6 = buf[AT91_SAMA7D65_ADC_TS_CLB_IDX_P6];

only these indexes and the MAX check above make this different from
the existing function.  Maybe we could just store those instead
of a function pointer in the device type specific structure.

> +
> +	/*
> +	 * We prepare here the conversion to milli from micro to avoid
> +	 * doing it on hotpath.
> +	 */
> +	clb->p1 = clb->p1 / 1000;
> +
> +free_buf:
> +	kfree(buf);
> +	return ret;
> +}

