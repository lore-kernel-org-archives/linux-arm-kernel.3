Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A409C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2j3x93HYeHwY5tSNUGE91ADq/ThMEsShqde0z89gCY=; b=X/LtMUvQno/WUPI4jWjbUnPaoD
	TWBd3DUphdNuMkn4gqPikeFydl6THRJAfJkD89q2LSKkP4xpsnwUEvLpwUbIvRBLY67W4Zt6UCPhO
	LnM1MsE1ljEMU7wk66ca+Y/zGGzScIZJO6MIW3iJlQn6vNgZiNghNeMYvuEU/mHYH8/O08ZMUk0+I
	sDMJHEiwm6H3UzfQpMZkCqsJO2AFjRBibjtbS5i4lDAhID2UAK+wEf6EoiQFuKFK77uCcvQdnK/uE
	jL8OZG9H7mcrqtYoPqJIzJo+m558osdzM2iszJcOPpil0qvDI6gjZQj9HQIadJTjV8xw4JNZQU9pa
	f9bP4X9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0joJ-0000000CHuq-3nB2;
	Fri, 04 Apr 2025 16:22:27 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jhT-0000000CH7Z-3soh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:15:26 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3feaedb39e9so629576b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743783322; x=1744388122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2j3x93HYeHwY5tSNUGE91ADq/ThMEsShqde0z89gCY=;
        b=jHkSgI8mSlHt76rTtaX1kRrkX/SVyvwLnvX+E5jXt80KEgE8TBpp0TqLEQr5nudbOH
         rqrCmDu15yXNRC1SW3ZDZEf0oxJidCYMwyDzliFhLlDht/xQHpDNJ0mKBYyUKhDVk8bt
         G5EMOsW0byvWYhU/hqSy2DFmFL23LV+PCC6vZWyUzSv6iZANfCrxo0HpGQo9yHzUXmlQ
         c9uLAkgC2rP/ScFjOjY/MYlHZ5qrpLUshvmDSpRMHNh/XrKqFluR+8DjrMcldl6gvrtK
         q3kWBTB/Q1iTsQJv8m1siajSzH7Td2cbVgXION1I+iCu2PYNhl59jRWGXnxHJoF+Ng9a
         8pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743783322; x=1744388122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2j3x93HYeHwY5tSNUGE91ADq/ThMEsShqde0z89gCY=;
        b=rglY1/W3VK5FJX/Oa9O20PmJ97D7FwXJdBRd7SudEr6sw04f3Q0iJETCBu7Z9HA2IV
         oK6m+4bBi90hIjAeAZsM70PT9zdcqxC3EZaQHbGn08PZPWO/0YJbi3a9ACLJlslkk9yJ
         gWV/S2VeQGZ0652r/2PK1rObvMkA3P/mMGyn/JJ5BrrWqx6nd7a1YRKtBSCks8suMriC
         KydwW6SUb5F500ccg1cE7s6ax69kozdjlztgeM6YflYg5IBhJGcZzYlK/mDh00Kx2yu+
         oTTxKWg1lQqh/8UP9DqLA/PhYsFF5Q++V9JOTI9AJzWqwP8lrtP/Qv8UMXr1eBKJCnsx
         8qLA==
X-Forwarded-Encrypted: i=1; AJvYcCUeJqtzoli4xaRpKY6f91RECQ3ILomKpz1RwaohTXcBVdqNqOIMgUsowDOfYxTfb/b0/m5LsfKNFjxtnFUwb7J/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy17B4JCqh8XsswcJuG+S7xzrPpu9i6wzzfcsosVBu/F2bZgPlZ
	RTimXPMR+c7WhJ/DR7BOVIYO8VM56PFruTHcLUB1U+dOMCcumTBuwGbh4KAAfz8=
X-Gm-Gg: ASbGncuFRVgPjPWyHWz3TdvEvfRxyhAFNAzfatCUgZuzeOAczmD+t89nj35nm4hWfLV
	porH4g2azQiUcRi0UsChWgT0I//+8f3Ke8/YVtNbbCUoeo4yjoSLdvdkoGcSY0UGZmdfZ9TPM73
	/0ZzJ9O6v4bcOKDxCLRz/Hojk901scTtimWq/658naT2p/t2U46Z3fDHksZfhAl0lSvPrwIuPRm
	rKcImQWZH0emdXCLNofYN/pKjH7FbTft1yJbgSuJWnNWLob19ZKvNlAYU6EVuBP8h1abJMDANzq
	/6oZUK8ASrA7LhrOeZYgrgWEWx7CUUB3B7UNeAZ3slC3zWD7lZb4cfbhsF5d2niPXz50w5Lsnsg
	jtu51cw==
X-Google-Smtp-Source: AGHT+IGeD0DN5s5NpX38+vrcEe8pmX0dglCUeK/9Wn3VmmDArglW7QUf9t5hzJw6MmeVoRIoUy9CaA==
X-Received: by 2002:a05:6808:2444:b0:3f8:30c1:cca7 with SMTP id 5614622812f47-4004557f18fmr2465378b6e.8.1743783322149;
        Fri, 04 Apr 2025 09:15:22 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4003ff9be6dsm662896b6e.25.2025.04.04.09.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:15:20 -0700 (PDT)
Message-ID: <25b34e60-5392-4bfb-b994-49212dfbdb22@baylibre.com>
Date: Fri, 4 Apr 2025 11:15:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: stm32: add oversampling support
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_091524_177398_1962CFA8 
X-CRM114-Status: GOOD (  32.71  )
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

On 4/3/25 11:23 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.

Why do we not want the extra bits too? I guess if we wanted the extra bits
in the future we could make the in_voltage_scale attribute writable to
select the resolution.

> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - in_voltage_oversampling_ratio_available
> - in_voltage_oversampling_ratio

This would require info_mask_shared_by_type but the patch uses
info_mask_shared_by_all, so the attributes will be:

- oversampling_ratio
- oversampling_ratio_available

I guess currently it doesn't matter which one gets used if there are only
voltage channels, but it could make a difference, e.g. if a temperature
channel was ever added.

In any case, the description should match what is actually implemented.

> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
> Changes in v2:
> - Remove useless header files
> - Use FIELD_PREP macro
> - Reorder stm32_adc_write_raw() function

Link to v1? (for the lazy reviewer :-p)

> ---
>  drivers/iio/adc/stm32-adc-core.h |  14 ++++
>  drivers/iio/adc/stm32-adc.c      | 137 +++++++++++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
> index 73b2c2e91c08..bfd42c5456bf 100644
> --- a/drivers/iio/adc/stm32-adc-core.h
> +++ b/drivers/iio/adc/stm32-adc-core.h
> @@ -91,6 +91,7 @@
>  #define STM32H7_ADC_IER			0x04
>  #define STM32H7_ADC_CR			0x08
>  #define STM32H7_ADC_CFGR		0x0C
> +#define STM32H7_ADC_CFGR2		0x10
>  #define STM32H7_ADC_SMPR1		0x14
>  #define STM32H7_ADC_SMPR2		0x18
>  #define STM32H7_ADC_PCSEL		0x1C
> @@ -160,6 +161,13 @@
>  #define STM32H7_DMNGT_SHIFT		0
>  #define STM32H7_DMNGT_MASK		GENMASK(1, 0)
>  
> +/* STM32H7_ADC_CFGR2 bit fields */
> +#define STM32H7_OVSR_MASK		GENMASK(25, 16) /* Correspond to OSVR field in datasheet */

nit: Comment seems obvious and can be left out.

> +#define STM32H7_OVSR(v)			FIELD_PREP(STM32H7_OVSR_MASK, v)
> +#define STM32H7_OVSS_MASK		GENMASK(8, 5)
> +#define STM32H7_OVSS(v)			FIELD_PREP(STM32H7_OVSS_MASK, v)
> +#define STM32H7_ROVSE			BIT(0)
> +

...

> +static const unsigned int stm32h7_adc_oversampling_avail[] = {
> +1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024

Normal style is to have 1 tab indent here.

> +};
> +
> +static const unsigned int stm32mp13_adc_oversampling_avail[] = {
> +1, 2, 4, 8, 16, 32, 64, 128, 256

And here.

>  };
>  

...

> @@ -889,6 +912,41 @@ static void stm32mp13_adc_start_conv(struct iio_dev *indio_dev, bool dma)
>  	stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADSTART);
>  }
>  
> +static void stm32h7_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	u32 ovsr_bits, bits, msk;
> +
> +	msk = STM32H7_ROVSE | STM32H7_OVSR_MASK | STM32H7_OVSS_MASK;
> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
> +
> +	if (!ovs_idx)
> +		return;
> +
> +	ovsr_bits = (1 << ovs_idx) - 1;
> +	bits = STM32H7_ROVSE | STM32H7_OVSS(ovs_idx) | STM32H7_OVSR(ovsr_bits);
> +
> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
> +}
> +
> +static void stm32mp13_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	u32 bits, msk;
> +
> +	msk = STM32H7_ROVSE | STM32MP13_OVSR_MASK | STM32MP13_OVSS_MASK;
> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
> +
> +	if (!ovs_idx)
> +		return;
> +
> +	bits = STM32H7_ROVSE | STM32MP13_OVSS(ovs_idx);
> +	if (ovs_idx - 1)
> +		bits |= STM32MP13_OVSR(ovs_idx - 1);
> +
> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
> +}


Some comments in these functions could be useful to avoid needing the
datasheet to understand all the different things that are happening here
and more importantly, why it was decided to do it this way when there are
many other possibilities (i.e. repeat the bit from commit message about
always using 12-bit output).

> @@ -1461,6 +1519,69 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
>  	return ret;
>  }
>  
> +static int stm32_adc_write_raw(struct iio_dev *indio_dev,
> +			       struct iio_chan_spec const *chan,
> +			       int val, int val2, long mask)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	struct device *dev = indio_dev->dev.parent;
> +	int nb = adc->cfg->adc_info->num_ovs;
> +	u32 idx;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		if (val2)
> +			return -EINVAL;
> +
> +		for (idx = 0; idx < nb; idx++)
> +			if (adc->cfg->adc_info->oversampling[idx] == val)
> +				break;
> +
> +		if (idx >= nb)
> +			return -EINVAL;
> +
> +		ret = iio_device_claim_direct_mode(indio_dev);
> +		if (ret)
> +			return ret;

We've been replacing this everywhere with:

		if (!iio_device_claim_direct(indio_dev))
			return -EBUSY;

See: https://lore.kernel.org/linux-iio/20250331121317.1694135-1-jic23@kernel.org/

> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0)
> +			goto err;
> +
> +		adc->cfg->set_ovs(indio_dev, idx);
> +
> +		pm_runtime_mark_last_busy(dev);
> +		pm_runtime_put_autosuspend(dev);
> +
> +		adc->ovs_idx = idx;
> +
> +err:
> +		iio_device_release_direct_mode(indio_dev);

		iio_device_release_direct(indio_dev);

> +
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}

