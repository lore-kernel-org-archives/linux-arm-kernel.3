Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16624EC01C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfhJtctKkBh3xaDsnD60gVRtGCRlFtFFqCXx32LHffU=; b=XhEpyw0/k4AS1flSpKQlshU8/H
	vAlKx60Cklphm5/AMj8+8PEfAMYw5ojYKGTjLgEGM6LQHDMwZ3/lwT76Z8u22L86HIaju4PW/BrxU
	rl9+IhBU8GhTPnkdhwW7lE8Pe6u/IFY2AmJoP0kDBOYVXBhmGT9HenoyOgRRL7MeUE5SzfsM1uSSq
	96GPjFKjZUwsA8X++ardrVSGcPZebCRd9h37VffzqyNhSHUICSb1eOuNADI7qcFiJFWQXTBN1g/oi
	VMGMzHYG8MYnAifmLVNhPblM2hVYNIgMFSx72+hOp0nsNZ8fXZU4NtFwlJhYushJogSAdyREd4kCa
	70tWLd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cor-0000000GXbV-3LOc;
	Mon, 23 Mar 2026 10:47:37 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4coq-0000000GXb7-03Zs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774262856; x=1805798856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FCKrt2gqpw9wh1RlH7VtYPIeF+zWONfzPOyem6I4+LE=;
  b=BGt/0kS8H/1SGP49YZZfNs+JhHDOLEBVSkalvJC3vwDhImU57WIePXzs
   xoVbiJaPEA1D+D1oL3x29H5hLEg56Ymihdq6vlISYCG6Y1sV2A/wIHieM
   UND7HB6092QbhXgM5TJUPBl7phexvxWDMzhgGB6le79SO0xRIfCsWiOuA
   tQT8F6z0CokCe4Xu8yV0+76Uu6lHgQE6L079aMaEt1wQjNmAQXQFTlZwg
   Gk+HiZRqgG0qhfSuPmRAPakfucLUXxnL70rtSs/5RR7w6A9piDw6TpMpg
   3hje5qEaXZOJFhGp7r//udkaHi6vShjIGmVPbNT6kUXuf8IFKFv0ikGam
   Q==;
X-CSE-ConnectionGUID: ERDfpAoUSqq+jzxoBJ0yqg==
X-CSE-MsgGUID: UcLG5F7LQFWiN5+FeiyK3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74435223"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74435223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:47:34 -0700
X-CSE-ConnectionGUID: zmwPpgwsS2uL96bNKL++XA==
X-CSE-MsgGUID: 6lGLvtiITI+5jDMaksciLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223946511"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:47:31 -0700
Date: Mon, 23 Mar 2026 12:47:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com
Subject: Re: [PATCH v2 1/4] iio: adc: xilinx-xadc: Split driver into core and
 platform files
Message-ID: <acEaQLGOcI5mshsC@ashevche-desk.local>
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
 <20260323074505.3853353-2-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323074505.3853353-2-sai.krishna.potthuri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_034736_071800_89029AF0 
X-CRM114-Status: GOOD (  32.42  )
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

On Mon, Mar 23, 2026 at 01:15:02PM +0530, Sai Krishna Potthuri wrote:
> Split the xilinx-xadc-core.c into separate core and platform specific
> files to prepare for I2C interface support.
> 
> xilinx-xadc-core.c is reorganized as follows:
> xilinx-xadc-core.c:
>   - Platform-independent IIO/ADC operations
>   - Channel definitions and management
>   - Buffer and trigger management
>   - Device tree parsing
> 
> xilinx-xadc-platform.c:
>   - ZYNQ platform (FIFO-based) register access and interrupt handling
>   - AXI platform (memory-mapped) register access and interrupt handling
>   - Platform-specific setup and configuration
>   - Platform device probe function
> 
> Update Kconfig to introduce XILINX_XADC_CORE as a helper module selected
> by XILINX_XADC and update Makefile to build the split modules:
>   - xilinx-xadc-common.o (core + events)
>   - xilinx-xadc-platform.o (platform-specific)
> 
> Reorganized the code and No behavioral changes.

...

> +void xadc_write_reg(struct xadc *xadc, unsigned int reg, uint32_t val)
>  {
>  	writel(val, xadc->base + reg);
>  }
> +EXPORT_SYMBOL_GPL(xadc_write_reg);
>  
> -static void xadc_read_reg(struct xadc *xadc, unsigned int reg,
> -	uint32_t *val)
> +void xadc_read_reg(struct xadc *xadc, unsigned int reg, uint32_t *val)
>  {
>  	*val = readl(xadc->base + reg);
>  }
> +EXPORT_SYMBOL_GPL(xadc_read_reg);

Use namespace.

...

> -static int _xadc_update_adc_reg(struct xadc *xadc, unsigned int reg,
> -	uint16_t mask, uint16_t val)
> +static int _xadc_update_adc_reg(struct xadc *xadc, unsigned int reg, u16 mask, u16 val)

This is unrelated. Make it a separate change "Switch to use kernel types"
or alike.

...

> -static int xadc_update_scan_mode(struct iio_dev *indio_dev,
> -	const unsigned long *mask)
> +static int xadc_update_scan_mode(struct iio_dev *indio_dev, const unsigned long *mask)

This is unrelated indentation change. Either drop or move to a separate patch.

...

>  	struct xadc *xadc = iio_priv(indio_dev);
> -	size_t n;
>  	void *data;
> +	size_t n;

Ditto.

...

>  static int xadc_trigger_set_state(struct iio_trigger *trigger, bool state)
>  {
>  	struct xadc *xadc = iio_trigger_get_drvdata(trigger);
> +	unsigned int convst, val;
>  	unsigned long flags;
> -	unsigned int convst;
> -	unsigned int val;
>  	int ret = 0;

This shouldn't be done at all, one variable per line is fine and readable.

...

>  		ret = _xadc_update_adc_reg(xadc, XADC_REG_CONF1, XADC_CONF0_EC,
> -					convst);
> +					   convst);

Separate patch for indentation.

...

> -static struct iio_trigger *xadc_alloc_trigger(struct iio_dev *indio_dev,
> -	const char *name)
> +static struct iio_trigger *xadc_alloc_trigger(struct iio_dev *indio_dev, const char *name)

Ditto and anything similar should go to a separate patch.

...


> -static int xadc_postdisable(struct iio_dev *indio_dev)
> +int xadc_postdisable(struct iio_dev *indio_dev)
>  {
>  	struct xadc *xadc = iio_priv(indio_dev);
>  	unsigned long scan_mask;
>  	int ret;

> -	int i;
> +	u32 i;

Why?

>  
>  	scan_mask = 1; /* Run calibration as part of the sequence */
>  	for (i = 0; i < indio_dev->num_channels; i++)

...

> +EXPORT_SYMBOL_GPL(xadc_postdisable);

Add namespace.

...

> +EXPORT_SYMBOL_GPL(xadc_read_samplerate);

Ditto and so on...

...

> -static int xadc_write_samplerate(struct xadc *xadc, int val)
> +int xadc_setup_buffer_and_triggers(struct device *dev, struct iio_dev *indio_dev,
> +				   struct xadc *xadc, int irq)

At this time do you need all three first parameters? I think it may be two or
even one.

> +{
> +	int ret;
> +
> +	if (!(xadc->ops->flags & XADC_FLAGS_BUFFERED))
> +		return 0;
> +
> +	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
> +					      &iio_pollfunc_store_time,
> +					      &xadc_trigger_handler,
> +					      &xadc_buffer_ops);
> +	if (ret)
> +		return ret;

> +	if (irq > 0) {

	/* The feature is optional */
	if (irq < 0)
		return 0;

> +		xadc->convst_trigger = xadc_alloc_trigger(indio_dev, "convst");
> +		if (IS_ERR(xadc->convst_trigger))
> +			return PTR_ERR(xadc->convst_trigger);
> +
> +		xadc->samplerate_trigger = xadc_alloc_trigger(indio_dev,
> +							      "samplerate");
> +		if (IS_ERR(xadc->samplerate_trigger))
> +			return PTR_ERR(xadc->samplerate_trigger);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xadc_setup_buffer_and_triggers);

Namespace.

...

> -static const char * const xadc_type_names[] = {
> +const char * const xadc_type_names[] = {
>  	[XADC_TYPE_S7] = "xadc",
>  	[XADC_TYPE_US] = "xilinx-system-monitor",
>  };

Why this change without export? Is it fine?

...

> +	*ops = device_get_match_data(dev);

> +	if (!*ops)
> +		return ERR_PTR(-ENODEV);

Just drop it. we expect driver to have it.

...

> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>

> +#include <linux/kernel.h>

No driver should use this header (there might be rare exceptions, but not
here).

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

...

> +static const unsigned int XADC_ZYNQ_UNMASK_TIMEOUT = 500;

Unit suffix?

...

> +#define XADC_ZYNQ_CFG_CFIFOTH_MASK	(0xf << 20)

> +#define XADC_ZYNQ_CFG_DFIFOTH_MASK	(0xf << 16)

Yeah, these all _MASK (here and elsewhere) should use GENMASK().

...

> +static void xadc_zynq_write_fifo(struct xadc *xadc, uint32_t *cmd, unsigned int n)

Why not u32?

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < n; i++)

Can be

	for (unsigned int i = 0; i < n; i++)

> +		xadc_write_reg(xadc, XADC_ZYNQ_REG_CFIFO, cmd[i]);
> +}

...

> +static void xadc_zynq_drain_fifo(struct xadc *xadc)
> +{
> +	u32 status, tmp;
> +
> +	xadc_read_reg(xadc, XADC_ZYNQ_REG_STATUS, &status);

	/* Needs a comment explaining why there will be no infinite loop */

> +	while (!(status & XADC_ZYNQ_STATUS_DFIFOE)) {
> +		xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &tmp);
> +		xadc_read_reg(xadc, XADC_ZYNQ_REG_STATUS, &status);
> +	}
> +}

...

> +static void xadc_zynq_update_intmsk(struct xadc *xadc, unsigned int mask, unsigned int val)
> +{
> +	xadc->zynq_intmask &= ~mask;
> +	xadc->zynq_intmask |= val;

Standard pattern is to have it on a single line

	xadc->zynq_intmask = (xadc->zynq_intmask & ~mask) | (val & mask);

> +	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTMSK, xadc->zynq_intmask | xadc->zynq_masked_alarm);
> +}

...

> +static int xadc_zynq_write_adc_reg(struct xadc *xadc, unsigned int reg, uint16_t val)
> +{
> +	u32 cmd[1], tmp;
> +	int ret;
> +
> +	spin_lock_irq(&xadc->lock);

Are you going to use cleanup.h?

> +	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, XADC_ZYNQ_INT_DFIFO_GTH);
> +
> +	reinit_completion(&xadc->completion);
> +
> +	cmd[0] = XADC_ZYNQ_CMD(XADC_ZYNQ_CMD_WRITE, reg, val);
> +	xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
> +	xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);
> +	tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
> +	tmp |= 0 << XADC_ZYNQ_CFG_DFIFOTH_OFFSET;
> +	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
> +
> +	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
> +	spin_unlock_irq(&xadc->lock);
> +
> +	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
> +	if (ret == 0)
> +		ret = -EIO;
> +	else

> +		ret = 0;

This seems quite wrong. If you use interruptible version, why ignoring the
error codes?

> +	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &tmp);
> +
> +	return ret;
> +}
> +
> +static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg, uint16_t *val)

u16

> +{
> +	u32 cmd[2], resp, tmp;
> +	int ret;
> +
> +	cmd[0] = XADC_ZYNQ_CMD(XADC_ZYNQ_CMD_READ, reg, 0);
> +	cmd[1] = XADC_ZYNQ_CMD(XADC_ZYNQ_CMD_NOP, 0, 0);
> +
> +	spin_lock_irq(&xadc->lock);
> +	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, XADC_ZYNQ_INT_DFIFO_GTH);
> +	xadc_zynq_drain_fifo(xadc);
> +	reinit_completion(&xadc->completion);
> +
> +	xadc_zynq_write_fifo(xadc, cmd, ARRAY_SIZE(cmd));
> +	xadc_read_reg(xadc, XADC_ZYNQ_REG_CFG, &tmp);

> +	tmp &= ~XADC_ZYNQ_CFG_DFIFOTH_MASK;
> +	tmp |= 1 << XADC_ZYNQ_CFG_DFIFOTH_OFFSET;

Are you going to use bitfield.h?

> +	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, tmp);
> +
> +	xadc_zynq_update_intmsk(xadc, XADC_ZYNQ_INT_DFIFO_GTH, 0);
> +	spin_unlock_irq(&xadc->lock);
> +	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
> +	if (ret == 0)
> +		ret = -EIO;
> +	if (ret < 0)
> +		return ret;

As per above.

> +	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
> +	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &resp);
> +
> +	*val = resp & 0xffff;

Unneeded mask.

> +	return 0;
> +}

> +static unsigned int xadc_zynq_transform_alarm(unsigned int alarm)
> +{
> +	return ((alarm & 0x80) >> 4) |
> +		((alarm & 0x78) << 1) |
> +		(alarm & 0x07);

One line. Also add a comment explaining this (perhaps with a reference to
datasheet).

> +}

...

> +#define XADC_ZYNQ_TCK_RATE_MAX 50000000
> +#define XADC_ZYNQ_IGAP_DEFAULT 20
> +#define XADC_ZYNQ_PCAP_RATE_MAX 200000000

Unit suffixes?

...

I stopped here. I think what you need is to clean up and modernize the driver
first (see my comments above) and only when it's ready, start splitting it.
The split itself can also be done in a few steps (you can try to prepare
patches with `... -M -C --histogram ...` to see when it will look better).

-- 
With Best Regards,
Andy Shevchenko



