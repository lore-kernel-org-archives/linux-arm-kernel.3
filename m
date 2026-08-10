Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7914AC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ0prIa3bUg9h7tDn1dNoc94cePJs+cfj4sGwOhsUT8=; b=rGXFJDteKPIT1j0gL+bXwyJPop
	61ODJ8SLK2JAGaqKuFASS04xRFwr5shUoIdyCZtVtfu/4/gXwd7IvlgtDm865Qx3a0j/KjLcjArjY
	954oxtgGnHGZL6QdAJkCcL1Q8ZbXSkb5GlnvFstPydFlwlgyct2MPKEYFeNgMsD0xi+zrDJi+VJYB
	RkkUaNHSYILEoUFPTWWRDmVFOVcoZZSWIrsK8314+Q2+0zVs/7LFXP9xLJUBu3o/ZpEpFnL9vVcT3
	UTNyfFD49RldHZ5It/CEU4B0NYHUYH8YrDbyhzB+rVIk60eV9SRxpReFhk34NM+DoykZRw04s6HWW
	u4ghH3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUim-0000000CdFy-0M6C;
	Mon, 10 Aug 2026 18:27:36 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUik-0000000CdFY-2rvb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786386454; x=1817922454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8h7g0wplfTmMtiDtt71tGq38X0APIXuCqV22D46BWvQ=;
  b=J4kHDd3O/RxUJAdXOTv9BHbkkh4PEiH4EGhinVIKmhOwbOurvshaw1SB
   dIOFtsEytCVPz6CcAHxTkKIrAr/AqeRZ3qsSNmwL+F6B4oL09r8zQjRtg
   aVP2b45Ep82gHG5rl+dl7XbYUS3zuwP/zP04fj9tCrTLMpRWH4CJr3Rzt
   fR7o0FAIGeoJoFlomBinGL9CllBxnjQgEORfF8+VmhnghzKLtbswLtfHp
   j+AepZOWA6cPCLwHzeuiNMxO6AhUEQWZVWBFeE3xytAjnM+tCQA6qWirL
   DkDS9/QRnj3Xlf4bvXweENERPTaO0ddpEQR7hM18rYTTNLaPyru4UgM2L
   Q==;
X-CSE-ConnectionGUID: q5kPsmy5QD+ja5ebo40S5w==
X-CSE-MsgGUID: 4JZ1ravVSh6gNv4y6IKz+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97564147"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="97564147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 11:27:33 -0700
X-CSE-ConnectionGUID: 14oKCL5+TX6VP6+LCmVvtw==
X-CSE-MsgGUID: JSCe0SpWT/6vj6a6CCF1QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="293040054"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 11:27:30 -0700
Date: Mon, 10 Aug 2026 21:27:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <anoYDi-bt-t6ZeeD@ashevche-desk.local>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
 <20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_112734_735917_B0FD2A5C 
X-CRM114-Status: GOOD (  19.13  )
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

On Mon, Aug 10, 2026 at 07:49:36AM -0700, Petar Stepanovic wrote:
> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
> 
> The driver supports single-shot voltage reads through the IIO
> subsystem. The number of available input channels is selected from
> the SoC match data, allowing AX3000 and AX3005 variants to use the
> same driver.

...

> +/* MANUAL_CTRL register fields */

^^^

> +#define AX_SARADC_MANUAL_CTRL_ENABLE	BIT(0)
> +#define AX_SARADC_MANUAL_CTRL_CH_SEL_MASK	GENMASK(4, 1)
> +
> +#define AX_RESOLUTION_BITS	10
> +#define AX_SARADC_CONV_CYCLES	13
> +#define AX_SARADC_CONV_DELAY_MARGIN_US	10
> +
> +struct axiado_saradc {
> +	struct regmap *regmap;
> +	struct mutex lock; /* Serializes ADC conversions. */

Choose the same style for all single-line comments (here is a period present
while in the above, for instance, there is none).

> +	unsigned long clk_rate;
> +	int vref_uV;
> +};

...

> +static int axiado_saradc_conversion(struct axiado_saradc *info,
> +				    struct iio_chan_spec const *chan, int *val)
> +{
> +	unsigned long usecs;
> +	unsigned int regval;
> +	int ret;
> +
> +	guard(mutex)(&info->lock);
> +
> +	/* Select the channel to be used and trigger conversion */
> +	ret = regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG,
> +			   AX_SARADC_MANUAL_CTRL_ENABLE |
> +			   FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, chan->channel));
> +	if (ret)
> +		return ret;
> +
> +	/* Hardware requires 13 conversion cycles at clk_rate */

> +	usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC,
> +			     info->clk_rate);

I think it's okay to have this on a single line (83 characters).

> +	fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);
> +
> +	ret = regmap_read(info->regmap, AX_SARADC_DOUT_REG, &regval);
> +
> +	/* Best effort to stop manual conversion. */
> +	regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG, 0);
> +
> +	if (ret)
> +		return ret;
> +
> +	*val = regval & GENMASK(AX_RESOLUTION_BITS - 1, 0);
> +
> +	return 0;
> +}

...

> +	soc_data = device_get_match_data(dev);
> +	if (!soc_data)
> +		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");

-ENODATA

-- 
With Best Regards,
Andy Shevchenko



