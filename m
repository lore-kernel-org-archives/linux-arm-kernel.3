Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F27C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsDW5ALDUcHBGUZ9V3zdLGkhSx/h2xVcsJ/Iap/jLJI=; b=Q/P5lJZVmJ5F2Ff9fNIlJ6N4k+
	Tz2kexQYqQQ9LAshUOAHDjZk4KlBlE0dx0+kTcbdHSLATpBRqiP11Wfi1ApW7nAG2uYZkLr9Gp85m
	+Z8IIHkBh9v2poAyuF/IF5uxPWO+uktA9bA6GyG58ZN5vxTX1RTJVPhdJiTYmqGjlYV8al3xKaGTB
	R01up6mWgvF6mGymH4TG0b+VovNauuJrtuld2pPQqZha8i++tgMa0j7yrabYd5OzijFtnYrbrFfxh
	qr7j16gQjQOpSSPsq9c4vdK0DHMVdcMyvM93atljX0+sAnnK1uMrx+lx3ZVPTlyOJLI0D5FXyhYan
	k5GbJdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7T4l-0000000Di8a-2La1;
	Fri, 18 Sep 2026 07:32:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7T4h-0000000Di7h-1j7s;
	Fri, 18 Sep 2026 07:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DsDW5ALDUcHBGUZ9V3zdLGkhSx/h2xVcsJ/Iap/jLJI=; b=kXEtf1tQQ1/5pxAOyCE+ei5k2n
	6T0I6OMpB8QXzSED/Dmg08yBjd+awOlw+19Cc+K5bMarxBVfzSvJP+jLFKvvvoq0g+FzL8L2xdJhS
	Isr7YeNRj9F2cyx8jlKgDv1AINnsgCOIn8xFElNTz6N9QGSpPeR/h7LEtbkvemjaA8FclD6GOejyy
	DmVRzlw1D4lwdwWccmd+xnpqQMqrdWovQEFk64RtVDkfImbxrSzq7oJCv52bHqqstb8sUi7MmJz//
	xLqOeANaIJbB80qnib14Ptqa7A75/SuzHHAZVXMPH4wol8LVNftFBq7XJtBAxW0CjfHOUqREPF1te
	EnGZ/Djw==;
Received: from mgamail.intel.com ([192.198.163.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7T4d-00000009iP0-48ug;
	Fri, 18 Sep 2026 07:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789716716; x=1821252716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSShAsO12XubLfGpze9r4T+pSVrU9sR0OtduLM9w+dU=;
  b=TQPPmAC4NgC/3s8633Xe97YWftapG4w0bvZrSKKJzxPcqoQ8AendVTwP
   G7c3DrjpQibKtzGZ9ZxMnKyb+sVGBmSEgB1e+I/B1t/8jpWK1LbT9boKS
   K5qN3DUga7ddAOaAdbdRUxyN53RSqXG4G7T0vwCtPJ7YJ+t9F+o3fBdpk
   S1UrT0TQeECRhtQIaxtqk1a+ooLAoYwHdJE7bvMX9NHmcrzxuIkerErQ1
   IneHgUMw/Ayw8KWQewdauArPnY9cf2wQC0d+QUDp0FNpcUfya1vf2w84q
   zougjssSYFJoP//pVsfxSQyAlxxwkx3RbooqtOrBTsaYubDE0vdmonNQo
   Q==;
X-CSE-ConnectionGUID: 8zfMvoEZS6+1hAklGI8xRw==
X-CSE-MsgGUID: 4IDnhwDvQzKkIWjjLalT5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="712663"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="712663"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:31:49 -0700
X-CSE-ConnectionGUID: qLC/C1UYRsSZmIz02DoYvw==
X-CSE-MsgGUID: tnrRKkoxRlG/AUaUUZGwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268006028"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:31:45 -0700
Date: Fri, 18 Sep 2026 10:31:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
	Roman Vivchar <rva333@protonmail.com>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: Re: [PATCH v2 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
Message-ID: <aqzo2vqeGEGCLFIP@ashevche-desk.local>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_083156_538763_36DA99ED 
X-CRM114-Status: GOOD (  47.81  )
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

On Thu, Sep 17, 2026 at 09:19:51PM -0500, Ryan Brue wrote:
> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
> built around this PMIC it is the only way to read the battery: the SoC's
> AUXADC is wired to board thermistors and the charger ICs these boards use
> have no ADC of their own.
> 
> Add a driver exposing the battery voltage and battery temperature
> channels. Only those two are described, so a channel ID in the device tree
> is an index into the driver's channel array rather than the PMIC's channel
> number, as mt6323-auxadc does. The ready bit lives in a channel's raw
> result register, but the value comes from the chip's trimmed copy of it,
> which is what the vendor driver reads for a measurement.
> 
> Both channels need more than that, as the vendor programs them. The
> battery voltage is measured through ISENSE, because a board with a
> switching charger in the power path leaves BATSNS on the charger's system
> rail instead of on the pack. The thermistor only reads correctly with the
> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
> settle. Both are switched back off afterwards.
> 
> Reads average sixteen conversions in software; the chip's sample
> accumulator makes no measurable difference at any setting, so it is left
> at one sample per conversion.

...

The below should be part of the comment block, no commit message needs to
be polluted with this.

> A new driver was created here, instead of modifying an existing driver
> such as mt6323-auxadc or mt6359-auxadc, for the following reasons:
> 
>  - Both mt6323-auxadc and mt6359-auxadc select channels through a request
>    register (1 bit per channel), while mt6397 uses a 4-bit numeric field
>    CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).
> 
>  - For mt6323-auxadc, which is the closest I could find to the mt6397
>    (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
>    It uses CON22 for its request register, and reads the result value
>    from the same register as the ready bit. We don't do that - the mt6397
>    has a factory calibrated value for each channel at 0x16 higher than the
>    raw value. mt6323 also has a 1800 mV / 15 bit scale / resolution while
>    we have 1200 mV / 10 bits. We also have some per-channel preparation
>    that we have to do before the burst, that the mt6323 doesn't have to
>    do.
> 
>  - For mt6359-auxadc, it has a more generic framework for describing the
>    AUXADC, but it assumes requests are channel-per-bit, and so we would
>    have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.
> 
>  - We also have our own software sampling, which the vendor does too
>    (Amazon Fire OS based on Linux 3.18). We'd have to have our own
>    sampling callback to do it.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---

...here is the comment block...

>  MAINTAINERS                     |   1 +
>  drivers/iio/adc/Kconfig         |  11 ++
>  drivers/iio/adc/Makefile        |   1 +

...

> +static int mt6397_auxadc_read_once(struct mt6397_auxadc *adc,
> +				   const struct iio_chan_spec *chan, int *val)
> +{
> +	struct regmap *map = adc->regmap;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_update_bits(map, MT6397_AUXADC_CON1,
> +				 MT6397_AUXADC_CON1_CHSEL,
> +				 FIELD_PREP(MT6397_AUXADC_CON1_CHSEL,
> +					    chan->address));

Make it two a bit long lines rather than four.

> +	if (ret)
> +		return ret;
> +
> +	/* START is edge triggered: it has to be lowered before being raised. */
> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
> +	if (ret)
> +		return ret;

Does it need any settling timeout (in case it was set before)?

> +	ret = regmap_set_bits(map, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(MT6397_AUXADC_START_US);
> +
> +	ret = regmap_read_poll_timeout(map, MT6397_AUXADC_ADC(chan->address),
> +				       reg, reg & MT6397_AUXADC_ADC_RDY,
> +				       100, 100 * USEC_PER_MSEC);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(map, MT6397_AUXADC_ADC_TRIM(chan->address), &reg);
> +	if (ret)
> +		return ret;
> +
> +	*val = FIELD_GET(MT6397_AUXADC_ADC_VAL, reg);
> +
> +	return 0;
> +}

...

> +static int mt6397_auxadc_battemp_bias(struct mt6397_auxadc *adc, bool on)

There is nothing common between on==false and on==true cases. Make it two
distinct functions and drop bool parameter. It's actually a recommended
pattern.

> +{
> +	struct regmap *map = adc->regmap;
> +	int ret, err;
> +
> +	if (on) {
> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> +				      MT6397_AUXADC_CON0_BUF_PWD_ON);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> +				      MT6397_AUXADC_CON0_BUF_PWD_B);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_set_bits(map, MT6397_CHR_CON7,
> +				      MT6397_CHR_CON7_BATON_TDET_EN);
> +	} else {
> +		/*
> +		 * Every step of the teardown is attempted even if an earlier
> +		 * one failed, so that one failing write cannot leave the bias
> +		 * or the input buffer powered. The first error is reported.
> +		 */
> +		ret = regmap_clear_bits(map, MT6397_CHR_CON7,
> +					MT6397_CHR_CON7_BATON_TDET_EN);
> +
> +		err = regmap_clear_bits(map, MT6397_AUXADC_CON0,
> +					MT6397_AUXADC_CON0_BUF_PWD_B);
> +		if (!ret)
> +			ret = err;
> +
> +		err = regmap_clear_bits(map, MT6397_AUXADC_CON0,
> +					MT6397_AUXADC_CON0_BUF_PWD_ON);
> +		if (!ret)
> +			ret = err;

These 'if (!ret)' bug me. What can we do if the ret == 0 and err != 0
on the caller's level? In other words, what can caller do in such a case?

> +	}
> +
> +	return ret;
> +}

...

> +static int mt6397_auxadc_isense_disable(struct mt6397_auxadc *adc)
> +{
> +	struct regmap *map = adc->regmap;
> +	int ret, err;
> +
> +	/* As above: the routing is undone even if the select write failed. */
> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON14,
> +				MT6397_AUXADC_CON14_CH0_NORM_SEL |
> +				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> +
> +	err = regmap_clear_bits(map, MT6397_CHR_CON16,
> +				MT6397_CHR_CON16_ADCIN_VSEN_EN |
> +				MT6397_CHR_CON16_ADCIN_VBAT_EN);
> +	if (!ret)
> +		ret = err;
> +
> +	return ret;

This can be written as

	if (ret)
		return ret;

	return err;


But the same Q as per above remains.

> +}

...

> +static int mt6397_auxadc_read_channel(struct mt6397_auxadc *adc,
> +				      const struct iio_chan_spec *chan,
> +				      int *val)
> +{
> +	bool isense = chan->channel == MT6397_AUXADC_ISENSE;
> +	unsigned int sum = 0;
> +	int sample;
> +	int ret;

> +	/* Held across the whole burst: the channel select is shared state. */

Unneeded comment. It's obvious that guard()() takes the whole scope.

> +	guard(mutex)(&adc->lock);
> +
> +	/*
> +	 * Once any part of the per-channel setup has been written, the
> +	 * teardown has to run, so every exit below goes through it.
> +	 */
> +	if (isense) {
> +		ret = mt6397_auxadc_isense_enable(adc);
> +		if (ret)
> +			goto out_teardown;

Have you compiled this?

> +		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
> +	} else {
> +		ret = mt6397_auxadc_battemp_bias(adc, true);
> +		if (ret)
> +			goto out_teardown;
> +		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
> +	}
> +
> +	for (unsigned int i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
> +		ret = mt6397_auxadc_read_once(adc, chan, &sample);
> +		if (ret)
> +			goto out_teardown;
> +
> +		sum += sample;
> +	}
> +
> +	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
> +
> +out_teardown:
> +	/* Lower START so the converter is not left armed between reads. */
> +	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1,
> +			  MT6397_AUXADC_CON1_START);
> +
> +	if (isense)
> +		mt6397_auxadc_isense_disable(adc);
> +	else
> +		mt6397_auxadc_battemp_bias(adc, false);
> +
> +	return ret;
> +}

So, this function has to refactored. And please, compile and test the code
*each* time you update it.

...

> +static int mt6397_auxadc_read_raw(struct iio_dev *indio_dev,
> +				  const struct iio_chan_spec *chan,
> +				  int *val, int *val2, long mask)
> +{
> +	struct mt6397_auxadc *adc = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = mt6397_auxadc_read_channel(adc, chan, val);
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:

> +		/* 1200 mV full range with 10-bit resolution. */
> +		*val = 1200;
> +		if (chan->channel == MT6397_AUXADC_ISENSE)
> +			*val *= MT6397_AUXADC_ISENSE_DIVIDER;

Make it if-else.

> +		*val2 = 10;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko



