Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8BFCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugU9VS+djQcCi7Ijxcbj58hPt9KlHsIRjlMUCkTq2R0=; b=Iomcbxd2fDSAEJcrtCp013gj/7
	2hd876jmRikvdg/WV7cpRDbp314JzXYTWqrx9gC0myFpQfkeu8Dg+Y+Lr4Q4ponFJ/xsecIPMwZ1o
	uzMTqlc+HU/gDsNtKgzI5JOmcxQo0e1QE615+o0vn6R23qMgPAAuDrCjYOJRMdkIBU6TQHzYvBDzQ
	nyvVIfA0IUkRKg8PHHpQ2MN9Jqjz6LTs2pkYy8Qf1jFt18KTY7THAF+B9YZJEYuJrcdkzK+7Zy0oc
	HHVnsU+oueyZaG0NkEFFjA1h3v0zCtHVAjSbuw7qjrTPqSsFN4Ix7/3PY4t6YyQ275xKWZUDuw/rD
	r/iuz9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Dl-00000006CEU-3D7K;
	Tue, 09 Jun 2026 18:30:41 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Dh-00000006CE4-33o5;
	Tue, 09 Jun 2026 18:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781029838; x=1812565838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W0vFigz4egcwCqqfYcLa0B3UG4B5j/8tAmG05me37jA=;
  b=HxQOyV8EGuq9nL1DH3ja9V/91ybVg0T1ftyrthaZtN4Tqk1MvhHml19L
   OGY9n36V1sB2bGIoalMc8dD/xyX7NNeT53wbt9BPrYbH4uBRnW8oP1tsb
   hYa29Yoy4Pc8SNs/l68eSGHtGTaquKFXcZEdzpKM+4L7Y72NHZv0nGo0K
   j1iW8frar2AlA4DQnAaJvPZWvvaIBS/VIcSNcWWRd3GVTvwXHKDc8pi70
   69uBLUWzUyy6KtElQKlUZhGSz5QipSvTxKNQ18Sk/0S44F45lVyS26AOn
   oNbXLI9ia3G4+98P1iwZGabtITI80vYh2wfBAkWMeMOqNbivm2TXy90n1
   w==;
X-CSE-ConnectionGUID: PK+4PGdZRTCDpDeODkNlJg==
X-CSE-MsgGUID: troVyXvrQ2ynJ/lngGhZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81781638"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81781638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 11:30:37 -0700
X-CSE-ConnectionGUID: 1+SmyyssQRKPAPX76A14TQ==
X-CSE-MsgGUID: XHLlIjFDTwKlwWHCZBRSQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241798924"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 11:30:33 -0700
Date: Tue, 9 Jun 2026 21:30:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: rva333@protonmail.com
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
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <aihbxowyAIlSeDjH@ashevche-desk.local>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com>
 <20260609-mt6323-adc-v2-2-aa93a22309f9@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-mt6323-adc-v2-2-aa93a22309f9@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_113037_867086_2311E5A9 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, Jun 09, 2026 at 04:31:59PM +0300, Roman Vivchar via B4 Relay wrote:

> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
> 
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

A few nit-picks, most important from which is the scoped_guard() versus
guard()() use.

...

> +static int mt6323_auxadc_prepare_channel(struct mt6323_auxadc *auxadc)
> +{
> +	struct regmap *map = auxadc->regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(map, MT6323_AUXADC_CON19, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* The ADC is idle. */
> +	if (!(val & AUXADC_CON19_DECI_GDLY_MASK))
> +		return 0;

> +	ret = regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
> +				       !(val & AUXADC_ADC19_BUSY_MASK),
> +				       10, 500);

It's better to split on logical boundaries:

	ret = regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19,
				       val, !(val & AUXADC_ADC19_BUSY_MASK),
				       10, 500);

> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6323_AUXADC_CON19,
> +				 AUXADC_CON19_DECI_GDLY_MASK);
> +}

...

> +static int mt6323_auxadc_read(struct mt6323_auxadc *auxadc,
> +			      const struct iio_chan_spec *chan, int *out)
> +{
> +	struct regmap *map = auxadc->regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read_poll_timeout(map, chan->address, val, (val & AUXADC_READY_MASK),
> +				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);

Perhaps

	ret = regmap_read_poll_timeout(map, chan->address,
				       val, (val & AUXADC_READY_MASK),
				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);

(see above why).

> +	if (ret)
> +		return ret;
> +
> +	*out = FIELD_GET(AUXADC_DATA_MASK, val);
> +
> +	return 0;
> +}

...

> +	case IIO_CHAN_INFO_RAW:
> +		scoped_guard(mutex, &auxadc->lock) {

I'm wondering why we haven't moved to guard()() here

	case IIO_CHAN_INFO_RAW: {
		guard(mutex)(&auxadc->lock);

> +			ret = mt6323_auxadc_prepare_channel(auxadc);
> +			if (ret)
> +				return ret;
> +
> +			ret = mt6323_auxadc_request(auxadc, chan->channel);
> +			if (ret)
> +				return ret;
> +
> +			/* Hardware limitation: the AUXADC needs a delay to become ready. */
> +			fsleep(300);
> +
> +			ret = mt6323_auxadc_read(auxadc, chan, val);
> +
> +			if (mt6323_auxadc_release(auxadc, chan->channel))
> +				dev_err(&indio_dev->dev,
> +					"failed to release channel %d\n", chan->channel);
> +
> +			if (ret)
> +				return ret;
> +		}
> +		return IIO_VAL_INT;

-- 
With Best Regards,
Andy Shevchenko



