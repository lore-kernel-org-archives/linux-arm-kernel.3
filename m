Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D3ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8ggIna0sbQOSPbI2RMjkyAsvw39Pak1O+w/BfpIbBw=; b=I9O1JbgVRLSJfNQFMF7sYz1xG2
	aVy7GE1RDzojyJEQy1XuJnbUj7M7O92z/83B2p12doKTOarkRzpH6CxyMLNXnbT+z7rb0T79krk+y
	B2NFCr/A7ozwmZ7cUmgCrZJsu2IJFqmh2LMLT0Lmw78H5bjapeEzAs1urJmrbUq5ZbSQOXAyuvkG8
	8q2ULWqPT+CpDEzFj5OMOyWvn5whklSFWh4qZMIJsM30Qivth5xOWiaKex62LFUtist5WAU34O792
	ZEXz2pwZH33sx1jtbz1rcQ5Hx46uGJAKIKd9Vuuf4N4V5AcVfj8ciNZWFCHs7vnVGIGOxh+p0y4zY
	9/a6Xi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULbL-0000000CgfZ-0Vtv;
	Tue, 02 Jun 2026 09:39:59 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULak-0000000CgeY-46Gm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780393163; x=1811929163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5oC8ksAHTf+xBVKyW06yVS5MRSz5ZtAoCm0qkxSJeZQ=;
  b=anAfl9sZRTXk9XITFCRcEdKloCnlhxXPxO2Fx6I1TAyb/tp1rPb89mra
   wKCxvlBUOTK+qgxyJk8V18nLIBwE2ga8nNKnwkc+mj+t4RvHmp7XS0cts
   vCArkpS9BtA7Phk8wuwMqGjHmGphH2dOdSPyw0AKXM2pmKYxzDDKtanoa
   8ZoxX+4A+jqXoi/ws5iggzagsGQB3AuvUuU0XeVT2kcNlvfCh/Xdzfd07
   fGiRqGAGvj8w/LUMn1JR53hTC4s79lUnP7xFCMClRHSnonlyivLdfXWcG
   4xYrtU5mJ80wrO2xIrWLNLlms0xE4EIaL9gvrVCDlIWbgOn62OooN6Qjz
   A==;
X-CSE-ConnectionGUID: 9txq93o7QOy0wNdp7pMUig==
X-CSE-MsgGUID: KsgXZkGSTYGAGFYx6e9iwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84797712"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="84797712"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:39:22 -0700
X-CSE-ConnectionGUID: gSzDEjBvT1axWlMMHfCJ4A==
X-CSE-MsgGUID: N47fI6AOTuSPh76YjMJXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="267722861"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:39:18 -0700
Date: Tue, 2 Jun 2026 12:39:15 +0300
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
Subject: Re: [PATCH v4 11/11] iio: dac: add mcf54415 DAC
Message-ID: <ah6kw-oTM9jgkWBL@ashevche-desk.local>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-11-7e65ab4215dd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-wip-stmark2-dac-v4-11-7e65ab4215dd@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_023923_057002_64FB4BA2 
X-CRM114-Status: GOOD (  23.95  )
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

On Sun, May 31, 2026 at 05:26:04PM +0200, Angelo Dureghello wrote:

> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and

CPU

(or maybe you wanted use 'SoC' acronym)

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

Be consistent: 12-bit on 16-bit

...

> Changes in v4:
> - remove unused includes
> - sashiko: return "ret" as regmap_read ret value in case of error

> - sashiko: using u32 as regmap_read value

Why? regmap API uses 'unsigned int'. Then you can take out any bits, fields,
et cetera from it into fixed-width type of variables.

> - use local variable in mcf54415_dac_init() for better readability
> - sashiko: check mcf54415_dac_init return value also in resume()

...

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>

> +#include <linux/compiler_types.h>

Drop this (see below).

> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

+ types.h (it also guarantees compile_types.h).

...

> +static int mcf54415_dac_init(struct mcf54415_dac *info)
> +{
> +	int ret;
> +	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);

Can we move towards reversed xmas tree order?

	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
	int ret;

> +	/* Fixed defaults and enable DAC (bit 0 set to 0) */
> +	ret = regmap_write(info->map, MCF54415_DAC_CR, val);
> +	if (ret)
> +		return ret;
> +
> +	/* DAC is ready after 12us, from RM table 40-3  */
> +	fsleep(12);
> +
> +	return 0;
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
> +		/* Check based on RM 30.3.2 (DACn_DATA) reg. resolution */
> +		if (val < 0 || val > 4095)
> +			return -EINVAL;
> +		return regmap_write(info->map, MCF54415_DAC_DATA, val);

So, for example, -1 will be written as 0xffffffff (with the respective bits
taken into account). Is it a problem?

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

One line. It's more than decade that checkpatch stopped complaining on
the trailing string literals.

> +	info->map = devm_regmap_init_mmio(dev, regs,
> +					  &mcf54415_dac_regmap_config);

One line (yes, 82 characters).

> +	if (IS_ERR(info->map))
> +		return PTR_ERR(info->map);
> +
> +	info->clk = devm_clk_get_enabled(dev, "dac");
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(dev, PTR_ERR(info->clk),
> +				     "failed getting clock\n");

Also one line.

> +	platform_set_drvdata(pdev, indio_dev);
> +
> +	indio_dev->name = "mcf54415";
> +	indio_dev->info = &mcf54415_dac_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = &mcf54415_dac_iio_channel;
> +	indio_dev->num_channels = 1;
> +
> +	ret = mcf54415_dac_init(info);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

...

> +static int mcf54415_dac_resume(struct device *dev)
> +{
> +	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
> +	int ret;
> +
> +	ret = clk_prepare_enable(info->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = mcf54415_dac_init(info);
> +	if (ret) {
> +		dev_err(dev, "could not resume device\n");
> +		return ret;
> +	}
> +
> +	return 0;

> +

Besides stray blank line the above can be

	ret = mcf54415_dac_init(info);
	if (ret)
		dev_err(dev, "could not resume device\n");

	return ret;

> +}

-- 
With Best Regards,
Andy Shevchenko



