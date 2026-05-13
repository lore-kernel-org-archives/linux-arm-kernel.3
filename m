Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF43CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGopBsLqO2aU9U0+Bg4ESbCh30nZOqyDa8IE0MbQ+7E=; b=QBuuYBI5rKrFaCdjNsKRREb6m5
	tT1+uIxP8oUcB7e1A6S9DueW172txO3dg38mVuFtaS6fQeEZ62QL4VEGZtG22JOr6QgkNxQRs2CIt
	ED+dthb7ikybtLFdHEXeEEtMMKx7gqWOYTGFJy9d5MAsBqP8DkqY20FHAY62FoNYWOE0IDC6n2bRL
	QOW/ufTe5n0asYxRR8KuBwlZi1cCwlNXUdR+mP4/YJJNBY785EY6Hfj9C1nmzX5EFTuiAImn208Om
	Ozd2uP+04aeLn7+mQpbhTS7CrVUMMnfXh1vUiwDFns4JQewAfEJUqC5ERQi81f+TXMQmHimTXlEyH
	RhD5BZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGC8-00000003i0Q-1RH4;
	Wed, 13 May 2026 20:28:40 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGC6-00000003hzY-2DZ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778704118; x=1810240118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=94YyXNzMTEt4UesTQXEg5EHXkdJVDB9o4CXu2ck8OUA=;
  b=DK+koLMuk52ZhwgxpWlh197s8n+9uCiNO3dIIPVME9QL19n0mfP5YSvH
   /WCHe3245fe+BafCaHnz46KVsMvi+E0SjamXsynK76R7S/8Aa54eCCSSX
   LmWNHrnok3cGMrNlALgd6IADFjpPfC/kBwyXWEol433u7CSiL/VJ/772E
   TzAw21bLLIOyiHQon4//R3ezgpRjy8W7Il/ucVjREwT31bKwz7zLVrQkY
   VTci3UgN3FtEiNPF4oWLQFQ8XYBWKVTtG/ldKXbZtqtTiH5F3aVXFRh2b
   6s8vI5jrPh2vTd2MI5CCGLD4zja+dnn7oEl4EKl+FDhndMP2KaRx3JlEn
   A==;
X-CSE-ConnectionGUID: mtlVcOHISEaS3/fqOC8Ptg==
X-CSE-MsgGUID: muF0VT4uT72cQ/PlHKcFtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102309898"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="102309898"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:28:37 -0700
X-CSE-ConnectionGUID: aedUM+sTS4aBSfGy9nseAA==
X-CSE-MsgGUID: Oz9845mtQWuod6gKW4p9zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261936442"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:28:33 -0700
Date: Wed, 13 May 2026 23:28:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 11/11] iio: dac: add mcf54415 DAC
Message-ID: <agTe7vZ94DnmD4Ed@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_132838_645178_6EF6CD1F 
X-CRM114-Status: GOOD (  25.23  )
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

On Wed, May 13, 2026 at 11:14:35AM +0200, Angelo Dureghello wrote:
> 
> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
> 
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> are respectively 0 and 0xfff, left untouched in this initial version.
> 
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mode
> is high speed, default format is right-justified 12bit on 16bit word.

...

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/compiler_types.h>
> +#include <linux/delay.h>

+ err.h

> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

...

> +struct mcf54415_dac {
> +	struct clk *clk;
> +	struct regmap *map;

I believe that regmap pointer is used more often, can you check with
bloat-o-meter that swapping these two (by the order) gives any benefit in
object size?

> +};

...

> +	.max_register = 0x1F,

No definition? What datasheet says about this? Perhaps define the MAX as per
last defined register in the datasheet?

> +};

...

> +static void mcf54415_dac_init(struct mcf54415_dac *info)
> +{
> +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> +	regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
> +		     FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));

Seems the whole driver ignores IO errors, why?

> +	/* DAC is ready after 12us, from RM table 40-3  */
> +	fsleep(12);
> +}

...

> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info = data;
> +
> +	regmap_update_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN,
> +			   MCF54415_DAC_CR_PDN);

regmap_set_bits()

> +}

...

> +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int val, int val2, long mask)
> +{
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (val < 0 || val > 4095)

Do we have a definition for the resolution? I'm fine with the plain numbers,
but it's better to add a short comment to say that this is "based on the
resolution of XXX register per datasheet".

> +			return -EINVAL;
> +		regmap_write(info->map, MCF54415_DAC_DATA, val);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}

...

> +static int mcf54415_dac_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct iio_dev *indio_dev;
> +	struct mcf54415_dac *info;
> +	void __iomem *regs;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info = iio_priv(indio_dev);
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return dev_err_probe(dev, PTR_ERR(regs),
> +				     "failed to get io regs\n");

One line.

> +
> +	info->map = devm_regmap_init_mmio(dev, regs,
> +					  &mcf54415_dac_regmap_config);
> +	if (IS_ERR(info->map))
> +		return PTR_ERR(info->map);
> +
> +	info->clk = devm_clk_get_enabled(dev, "dac");
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(dev, PTR_ERR(info->clk),
> +				     "failed getting clock\n");

Also can be a single line, but this one a bit longer than above, gives
88 characters.

> +	platform_set_drvdata(pdev, indio_dev);
> +
> +	indio_dev->name = "mcf54415";
> +	indio_dev->info = &mcf54415_dac_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = mcf54415_dac_iio_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(mcf54415_dac_iio_channels);
> +
> +	mcf54415_dac_init(info);
> +
> +	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

-- 
With Best Regards,
Andy Shevchenko



