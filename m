Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99592CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfdBybtRppeE1KvRbZrzufC/NV+OTkc8viJlVMQwDSw=; b=BNz6uDp9f1VQP9KYQeF4nqrXCQ
	j/02NS+Daip8UJOZdcuPWyCOmVGH4ic8n57X+I0i5OCnbvFXEmq2tCklnP5bpaIXE3xoBjwj+gRZp
	CO4uizz4h9SO5B9nk2uy3WPPXeuXBImMr0RPNvGDHwbZ3kiZDWffa4CWxs+J6t8dJOX+L9uFR1J4q
	h80kfXjofzfD7ghpz62of2ZMY/9U5HXiHu1rxuCqjIi+l/RtW2SoO6aj6NW22fJSfLHBm1zvAmtYg
	WOlScNlOyqXTrewZroOucjTULE601cF2KQHnWIiJqTLppm/P30tjQXB1G3lBLYbh4kMCUMScAmto1
	lg8c19bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeSJ-00000001ODN-1WcB;
	Wed, 06 May 2026 15:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeSH-00000001OCa-0WMC;
	Wed, 06 May 2026 15:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B4EF42AE5;
	Wed,  6 May 2026 15:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482C2C2BCB8;
	Wed,  6 May 2026 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778082392;
	bh=OaJWjamc6kWNh1B4kT6JEeX0RWTw5B2ryP/Qeb2SLqI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bw+h6YwP+WQqhFBn5HlBoswhd3ysx6X4monJg25zfK0XT4NRi0HBcANF9k/umJUPP
	 hK/SVCcVmO9CCQBA0ZeOINqcMOHI/Ilb7iOOUPWoT4zUMtWN7utj07QJdhc/za6pEI
	 6mbNTO8t9UBLSrV2CSYQWaAaObkiu7QTv0eMTbuhem+GoT4U92+RuL7lOstqJ41lh3
	 ZAnpBljjOZP6j8QcL4Iwp8Vj3rWIe/r2Erm3gqDRroDhMC3ufuvMXpv1b4Casu/uKM
	 O7pqIG8UMj/kHRegSGMN50Z6W8EFNuiglMUMxeWOaoi6dYjG0ZuZcj3FOBiOn/cHt8
	 0YBfH4CiIbNMg==
Date: Wed, 6 May 2026 16:46:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
 <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Ben Grisdale
 <bengris32@protonmail.ch>
Subject: Re: [PATCH 04/13] iio: adc: mediatek: add mt6323 PMIC AUXADC driver
Message-ID: <20260506164619.63ebc626@jic23-huawei>
In-Reply-To: <20260504-mt6323-v1-4-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
	<20260504-mt6323-v1-4-799b58b355ff@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_084633_213588_6C0039A2 
X-CRM114-Status: GOOD (  34.86  )
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

On Mon, 04 May 2026 21:24:56 +0300
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
> 
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

A few things inline that might not entirely overlap with other reviews

Also make sure to check:
https://sashiko.dev/#/patchset/20260504-mt6323-v1-0-799b58b355ff%40protonmail.com
It may well have made some stuff up, but in general it does find stuff
humans have missed. I've called out a few more interesting ones inline
(I looked after doing my initial review)


Thanks,

Jonathan

> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-auxadc.c
> new file mode 100644
> index 000000000000..97b4ad4e7b47
> --- /dev/null
> +++ b/drivers/iio/adc/mt6323-auxadc.c

> +/**
> + * struct mt6323_auxadc - Main driver structure
> + * @dev:           Device pointer
> + * @regmap:        Regmap from PWRAP
> + * @lock:          Mutex to serialize AUXADC reading vs configuration
> + */
> +struct mt6323_auxadc {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mutex lock;
> +};

> +static int mt6323_auxadc_check_if_stuck(struct mt6323_auxadc *auxadc)
> +{
> +	int i, ret;
> +	u32 val;
> +
> +	for (i = 0; i < 50; i++) {
> +		ret = regmap_read(auxadc->regmap, MT6323_AUXADC_CON19, &val);
> +		if (ret)
> +			return ret;
> +
> +		if (FIELD_GET(AUXADC_DECI_GDLY_MASK, val)) {
Flip to reduce indent.
		if (!FIELD_GET(AUXADC_DECI_GDLY_MASK, val))
			return 0;

		ret = regmap_read(auxadc->regmap, MT6323_AUXADC_ADC19, &val);
		if (ret)
			return ret;

		if (!FIELD_GET(AUXADC_ADC19_BUSY_MASK, val)) {
			ret = regmap_update_bits(auxadc->regmap,
						 MT6323_AUXADC_CON19,
						 FIELD_PREP(AUXADC_DECI_GDLY_MASK, 3),
// no idea what the magic 3 is. Might need a define to make that clear.
// fine to go a bit long on code like this for readability.  Also rather
// odd for a regmap mask to be made up of some bits of a larger mask.
// rather implies that a field needs breaking up into two.

						 0x0);
			if (ret)
				return ret;
		}
		fsleep(10);
	}

> +			ret = regmap_read(auxadc->regmap, MT6323_AUXADC_ADC19,
> +					  &val);
> +			if (ret)
> +				return ret;
> +
> +			if (!FIELD_GET(AUXADC_ADC19_BUSY_MASK, val)) {
> +				ret = regmap_update_bits(
> +					auxadc->regmap, MT6323_AUXADC_CON19,
> +					FIELD_PREP(AUXADC_DECI_GDLY_MASK, 3),
> +					0x0);
> +				if (ret)
> +					return ret;
> +			}
> +		} else {
> +			return 0;
> +		}
> +
> +		fsleep(10);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int mt6323_auxadc_request(struct mt6323_auxadc *auxadc,
> +				 unsigned long channel)
> +{
> +	int ret;
> +	u32 pmic_val, adc_val;
> +
> +	if (channel < 9) {
> +		ret = regmap_update_bits(auxadc->regmap, MT6323_AUXADC_CON11,
> +					 AUXADC_VBUF_EN, AUXADC_VBUF_EN);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(auxadc->regmap, MT6323_AUXADC_CON22,
> +				  &pmic_val);
> +		if (ret)
> +			return ret;
> +
> +		adc_val = FIELD_GET(AUXADC_LOW_CHANNEL_MASK, pmic_val);
> +		adc_val &= ~BIT(channel);
> +
> +		ret = regmap_update_bits(auxadc->regmap, MT6323_AUXADC_CON22,
> +					 AUXADC_LOW_CHANNEL_MASK, adc_val);

Given you have the full register value I'd do regmap_write() rather than
update_bits() that may trigger another read. Matters less if you having
caching enabled.

> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(auxadc->regmap, MT6323_AUXADC_CON22,
> +				  &pmic_val);
> +		if (ret)
> +			return ret;
> +
> +		adc_val = FIELD_GET(AUXADC_LOW_CHANNEL_MASK, pmic_val);
> +		adc_val |= BIT(channel);
> +
> +		ret = regmap_update_bits(auxadc->regmap, MT6323_AUXADC_CON22,
> +					 AUXADC_LOW_CHANNEL_MASK, adc_val);

as above for a full write.

		return regmap_update_bits() so we don't have to read on
to see what else happens.  You could drop the else but I think it
does have some value in showing they are of 'equal' likelihood.

> +
> +	} else {
Sashiko points out that we only have channels 0-9 defined, so how do
we get here?

> +		ret = regmap_read(auxadc->regmap, MT6323_AUXADC_CON23,
> +				  &pmic_val);
> +		if (ret)
> +			return ret;
> +
> +		adc_val = FIELD_GET(AUXADC_AUDIO_CHANNEL_MASK, pmic_val);
> +		adc_val &= ~BIT(channel - 9);
> +
> +		ret = regmap_update_bits(auxadc->regmap, MT6323_AUXADC_CON23,
> +					 AUXADC_AUDIO_CHANNEL_MASK, adc_val);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(auxadc->regmap, MT6323_AUXADC_CON23,
> +				  &pmic_val);
> +		if (ret)
> +			return ret;
> +
> +		adc_val = FIELD_GET(AUXADC_AUDIO_CHANNEL_MASK, pmic_val);
> +		adc_val |= BIT(channel - 9);
> +
> +		ret = regmap_update_bits(auxadc->regmap, MT6323_AUXADC_CON23,
> +					 AUXADC_AUDIO_CHANNEL_MASK, adc_val);
return regmap_update_bits() here as well because we might as well.

> +	}
> +
> +	return ret;
> +}

> +static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
> +				  const struct iio_chan_spec *chan, int *val,
> +				  int *val2, long mask)
> +{
> +	struct mt6323_auxadc *auxadc = iio_priv(indio_dev);
> +	int ret, mult = 1;

Move declaration of mult into the scope where it's used.
That will mean this default is near the point of use. Mind you
I'd probably but the assignment in and else to make it even
more obvious.

> +
> +	if (mask == IIO_CHAN_INFO_RAW) {
> +		scoped_guard(mutex, &auxadc->lock)
> +		{
		guard(mutex)(&auxadc->lock);
preferred where not necessary to use scoped_guard() as it
means we don't end up with large code indents.

Though if you did { on the line above.

As sashiko notes, this will trip up compilers anyway due
to an oddity of how scoped_guard() is implemented. You have
to have a return after it.

> +			ret = mt6323_auxadc_check_if_stuck(auxadc);
> +			if (ret)
> +				return ret;
> +
> +			ret = mt6323_auxadc_request(auxadc, chan->address);
> +			if (ret)
> +				return ret;
> +
> +			usleep_range(300, 500);

Smells like fsleep() is appropriate.

> +
> +			ret = mt6323_auxadc_read(auxadc, chan, val);
> +			if (ret)
> +				return ret;
> +			return IIO_VAL_INT;
> +		}
> +	} else if (mask == IIO_CHAN_INFO_SCALE) {
> +		if (chan->channel == MT6323_AUXADC_ISENSE ||
> +		    chan->address == MT6323_AUXADC_BATSNS)
Probably pick channel or address.  Mind you not much point in
setting them both to the same thing (another one sashiko got
that I missed)

> +			mult = 4;
> +
> +		*val = mult * 1800;
> +		*val2 = 32768;
> +
> +		return IIO_VAL_FRACTIONAL;
> +	} else 

{} for all legs if any need it.

> +		return -EINVAL;
> +}
> +
> +static int mt6323_auxadc_init(struct mt6323_auxadc *auxadc)
> +{

> +
> +	ret = regmap_update_bits(auxadc->regmap, MT6323_AUXADC_CON9,
> +				 AUXADC_OSR_MASK,
> +				 FIELD_PREP(AUXADC_OSR_MASK, 3));

I'm going to guess something to do with sampling rate?  That 3 is non
obvious so I'd suggest defines for the values AUXADC_OSR can take.

> +	return ret;
> +}

