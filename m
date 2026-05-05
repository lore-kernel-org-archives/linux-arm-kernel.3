Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D014CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIQMeq1AEGXyUwiy/PFSFptolKqBplkFHmhQkuWunqk=; b=YA9xDdSewUdEYv/OErz2vycGbc
	KO/FIg7a485rLfZQhNsm8lGZmBuPG/769cL2oVVu+jTa5yD0Rcv1IBvnX5qKYGVmalIysgFT9RtJZ
	0cgopn5GUhsun1o/+34fDdUcKdN4P9hi/ihLkgM7xmwef55QFtb0+xPtHboqy/328vn/LrAvnbd6v
	j649lV2dFR/nHDQvPbzfeD8wvWbkzmMPkjjh7KGW6AQ5Dw3Fi1fy/jIhXPmiMQ5MbvTqmk13kYAhq
	VWNKwTMCslsqGVaerizjebqfG/BnN3pqiargqsg5IgxtIvaaQaMEahVE4itVEz/Xf9SutFKyK+5PC
	dJ+Q6SwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBP3-0000000FYjK-2cR4;
	Tue, 05 May 2026 08:45:17 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBP1-0000000FYit-0Zft
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777970715; x=1809506715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TMDCpTWMAj+qHdIIGI4JmLHxDIMLsB6RWL1vo0UQJrg=;
  b=WCjLZN9iqq2c2p6Xgui90SVUPzlIQ8HBEJtMGhazNLV9uj+zkNXR07XI
   FSjZlId+oOv+O2O8BZO186pKti4LcX3OdKm7cUOn51Ea+K6Co7db65KkW
   gU3QT+VjeOTbThC++ylM066Enq6yUwkcVQLPWk6dWKON/HgZL8CplGOIs
   a6iCu3w1FioPMF97lBhnT0l0ndPIJJlYr1PBLdRbBnW0Iax4P1UXkz4Iy
   WA57/2yMggdXo3YdbVjdCgzjD8YBoi3vn7FMFMBkWZOhG8o4Z4MEOjSxc
   IbHmJBZIweE8DbYfkMV7unyxwrs03vDZCq4+uAFi8OVKJXk59FQfJ+Jd8
   Q==;
X-CSE-ConnectionGUID: n5dXhOjUQpmlJb4zRffXww==
X-CSE-MsgGUID: C8t7tmFGTwiEN9UQeLbFYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78859654"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78859654"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:45:14 -0700
X-CSE-ConnectionGUID: ZueXutVxScuiafrom2uXTQ==
X-CSE-MsgGUID: HaBZbaj/T7yAPFlq0lDHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="240733294"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:45:09 -0700
Date: Tue, 5 May 2026 11:45:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <angelo@kernel-space.org>
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
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	Angelo Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
Message-ID: <afmuE5YZmfKKeoVQ@ashevche-desk.local>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_014515_212315_B6DF8853 
X-CRM114-Status: GOOD (  23.35  )
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

On Mon, May 04, 2026 at 07:16:48PM +0200, Angelo Dureghello wrote:

> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
> 
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from ~DAC_VREFL to ~DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. DAC_VREFL and DAC_VREFH defaults respectivley to
> 0 and 0xfff.
> 
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mode
> is high speed, default format is right-justified 12bit on 16bit word.

The below doesn't make much sense in the commit message (author must contribute
the tested code), but for the record in the comments block it might be useful
when one digs the lore ML archives.

> Basic tests done on stmark2 mcf54415-based board, voltage check on DAC0:
> 
> /sys/bus/iio/devices/iio:device0 # ls
> name                 out_voltage_raw      subsystem
> out_conversion_mode  out_voltage_scale    uevent
> 
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415_dac.0
> 
> /sys/bus/iio/devices/iio:device0 #
> 
> echo 4095 > out_voltage_raw     => voltage abt 3.3V by oscilloscope
> echo 4096 > out_voltage_raw     => roll over to 0V
> echo 0 > out_voltage_raw        => voltage is 0V
> echo 2048 > out_voltage_raw     => voltage is abt 1.7V, mid scale
> 
> Same behavior for /sys/bus/iio/devices/iio:device1.
> 
> Generated a sine wave by shell script, sine shape is good.


^^^ See above.

> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---

Put that here.

...

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>

Follow IWYU. At least the headers for __iomem, ARRAY_SIZE() are missing.

...

> +	int val;

Why signed?

> +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> +	val = MCF54415_DAC_CR_FILT;
> +	val |= FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);

Why two lines?

	val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);

even fits 80 limit.

> +	writew(val, info->regs + MCF54415_DAC_CR);
> +
> +	/* DAC is ready after 12us, from RM table 40-3  */
> +	fsleep(MCF54415_DAC_READY_US);

...

> +#define MCF54415_DAC_CHAN { \

Move { to a separate line.

> +	.type = IIO_VOLTAGE, \
> +	.output = 1, \
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
> +}

...

> +static const struct iio_chan_spec mcf54415_dac_iio_channels[] = {
> +	MCF54415_DAC_CHAN

Use trailing commas when it's not a terminator.

> +};

...

> +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2,
> +			long mask)
> +{
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		*val = readw(info->regs + MCF54415_DAC_DATA);
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> +		*val = 3300 /* mV */;
> +		*val2 = 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}

> +	return 0;

Dead code.

> +}

...

> +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,

> +			int val, int val2,
> +			long mask)

One line.

> +{
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		writew(val, info->regs + MCF54415_DAC_DATA);
> +		return 0;

> +

Already mentioned: Stray blank line.

> +	default:
> +		return -EINVAL;
> +	}
> +}

...

> +	indio_dev = devm_iio_device_alloc(&pdev->dev,
> +					  sizeof(struct mcf54415_dac));

Use

	struct device *dev = &pdev->dev;

to make it neater. Also it's more robust to use sizeof(*).

	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));

> +	if (!indio_dev)
> +		return -ENOMEM;

...

> +static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops, mcf54415_dac_suspend,
> +				mcf54415_dac_resume);

Use logical split:

static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
				mcf54415_dac_suspend,
				mcf54415_dac_resume);

OR

static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
				mcf54415_dac_suspend, mcf54415_dac_resume);

-- 
With Best Regards,
Andy Shevchenko



