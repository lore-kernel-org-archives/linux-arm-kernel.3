Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8819C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6J82CIJWCwTmm+W0qMHbVPGiDQud3FaPVYDKi0CgEM=; b=m801HYDsC34n42N9HB2S2W7YGh
	93b7omFfC6r6BKFB57w+UDBjMd1cUir5t6t/KPpysBfJy01t69QWXt7n3XSEj8utQr9itBErQaCH+
	FzwXQHIKFW571HjyNRxEMJX5rm0F7iFXkXkl/eD+wWXNclj7ocsiPfWSTlj5QkeijvhDusfslXKoQ
	HrFTPbnDh2LHsV4TOrHtF93WS4ad1mSVJwGatfvRZQSC2ilzlv5+MoysB4v07Xi5WrIewAKZSsqe9
	+rurgiLChk/T6AL1qRc2JDVCPG2K49FmK/mWuxgBCG4f3vm62c3okKm4DUftiO8DSgkT30H1SPdnQ
	KORRaJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd651-0000000BL2h-3tNS;
	Fri, 26 Jun 2026 12:54:47 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd64y-0000000BL2L-47Lp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782478485; x=1814014485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bA5gZ8nVjmIMUXVdBIALv/ZULDjKZlaMP/awFqfmKX8=;
  b=ZkDbTtCCZaYJmZIWtoKSSDnTQ5YhUM5ww8Y4Zz5J9RTVTbITTO15FNz0
   PlNK3LNB0BYhupnzdlDxX9KS6WDLDLimdz9f6pR9M6j3QsVErJZUOZ3iL
   /D7jKiyeubqi1nck8pvdiccDLcz9M4CO2ASpbMbQXvI1WfzEl9qEj4ZMK
   gmuxhx1nWhlOsAYMPamBOT0ahBuVrxWZP0hUa3NRQrej3cflWI1s6uN4G
   fsRoz2plxcHHnNlNXrEOcmE2cm1DzcJZfTvVxr6gmWhhXIYjagN0/AVP2
   wm9PEhim+EfOi+rdNf7igFQR8IfBdeME9h+3wREP9YuPapl39HCJvMJEg
   A==;
X-CSE-ConnectionGUID: BlFq8PnwSSawLz5cg2gEcg==
X-CSE-MsgGUID: J7UAdbOlR7OClePdzlJeuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="85820866"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="85820866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:54:43 -0700
X-CSE-ConnectionGUID: 6f6lVhqIRT+fSWuMTrVidA==
X-CSE-MsgGUID: Z2kmyNMwSXirbLb7R0twYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="274519403"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.1])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:54:39 -0700
Date: Fri, 26 Jun 2026 15:54:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <aj52jaJK3qwvQu2k@ashevche-desk.local>
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-3-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625110638.38438-3-cwweng.linux@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_055445_068202_73D1FA9F 
X-CRM114-Status: GOOD (  28.63  )
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

On Thu, Jun 25, 2026 at 07:06:38PM +0800, Chi-Wen Weng wrote:

> Add an IIO driver for the Nuvoton MA35D1 Enhanced ADC controller.
> 
> The driver supports direct raw reads and triggered buffered capture. The
> controller end-of-conversion interrupt is exposed as the device trigger
> and is used to push samples into the IIO buffer.
> 
> Channels are described by firmware child nodes and can be configured as
> single-ended or differential inputs. Since the differential enable bit is
> global, mixed single-ended and differential buffered scans are rejected.
> 
> DMA support is intentionally not included in this initial upstream driver;
> conversions are handled through the interrupt-driven path.

Nice written driver, some small issues here and there, and I think in a couple
of versions it will stabilize and can be accepted.

...

> +#include <linux/bitfield.h>

> +#include <linux/bits.h>

No need, bitmap.h covers this.

> +#include <linux/bitmap.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>

> +#include <linux/device.h>

No need, covered by platform_device.h.

> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>

> +#include <linux/kernel.h>

No way this header should be in the mere drivers.

> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/property.h>

Also missing some headers, such as types.h.

...

> +#define MA35D1_EADC_TIMEOUT		msecs_to_jiffies(1000)

+ jiffies.h

...

> +static inline u32 ma35d1_adc_read(struct ma35d1_adc *adc, u32 reg)
> +{
> +	return readl(adc->regs + reg);
> +}
> +
> +static inline void ma35d1_adc_write(struct ma35d1_adc *adc, u32 reg, u32 val)
> +{
> +	writel(val, adc->regs + reg);
> +}
> +
> +static void ma35d1_adc_rmw(struct ma35d1_adc *adc, u32 reg, u32 mask, u32 val)

Name it _update() to be aligned with the _read() and _write() above.

> +{
> +	u32 tmp;
> +
> +	tmp = ma35d1_adc_read(adc, reg);
> +	tmp &= ~mask;
> +	tmp |= val;

Correct pattern is to use

	tmp = (tmp & ~mask) | (val & mask);

> +	ma35d1_adc_write(adc, reg, tmp);
> +}

...

> +static void ma35d1_adc_config_sample(struct ma35d1_adc *adc,
> +				     unsigned int sample, unsigned int channel)
> +{
> +	u32 reg = MA35D1_EADC_SCTL(sample);

I don't see the need of this variable, use the value directly.

> +	ma35d1_adc_rmw(adc, reg,
> +		       MA35D1_EADC_SCTL_CHSEL_MASK |
> +		       MA35D1_EADC_SCTL_TRGSEL_MASK,
> +		       FIELD_PREP(MA35D1_EADC_SCTL_CHSEL_MASK, channel) |
> +		       MA35D1_EADC_SCTL_TRGSEL_ADINT0);
> +}

...

> +static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf = p;
> +	struct iio_dev *indio_dev = pf->indio_dev;
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);

> +	int i;
> +
> +	for (i = 0; i < adc->scan_chancnt; i++)

	for (unsigned int i = 0; i < adc->scan_chancnt; i++)

> +		adc->scan.channels[i] =
> +			ma35d1_adc_read(adc, MA35D1_EADC_DAT(i)) &
> +			MA35D1_EADC_DAT_MASK;
> +
> +	iio_push_to_buffers_with_timestamp(indio_dev, &adc->scan, pf->timestamp);
> +	iio_trigger_notify_done(adc->trig);
> +
> +	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0,
> +		       MA35D1_EADC_CTL_ADCIEN0);
> +	ma35d1_adc_write(adc, MA35D1_EADC_SWTRG, 1);
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int ma35d1_adc_validate_scan(struct iio_dev *indio_dev,
> +				    const unsigned long *scan_mask)
> +{
> +	const struct iio_chan_spec *chan;
> +	bool have_single = false;
> +	bool have_diff = false;
> +	unsigned int count = 0;
> +	unsigned long bit;
> +
> +	for_each_set_bit(bit, scan_mask, indio_dev->masklength) {
> +		chan = &indio_dev->channels[bit];
> +
> +		if (chan->type == IIO_TIMESTAMP)
> +			continue;

> +		count++;

Make it last in the loop, it will be standard pattern. Otherwise it's hard to
read and find. Also it's recommended to split assignment and definition
for better maintenance.

	unsigned int count;
	...
	count = 0;
	for_each_set_bit(bit, scan_mask, indio_dev->masklength) {
		...
		count++;
	}

> +		if (chan->differential)
> +			have_diff = true;
> +		else
> +			have_single = true;
> +	}
> +
> +	if (!count || count > MA35D1_EADC_MAX_SAMPLE_MODULES)
> +		return -EINVAL;

> +	if (have_single && have_diff)
> +		return -EINVAL;

Is it possible IRL?

> +	return 0;
> +}

...

> +static int ma35d1_adc_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	int i;
> +
> +	if (!adc->scan_chancnt)
> +		return -EINVAL;
> +
> +	ma35d1_adc_write(adc, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
> +	ma35d1_adc_rmw(adc, MA35D1_EADC_INTSRC0,
> +		       MA35D1_EADC_INTSRC0_ADINT0,
> +		       MA35D1_EADC_INTSRC0_ADINT0);
> +	ma35d1_adc_rmw(adc, MA35D1_EADC_REFADJCTL,
> +		       MA35D1_EADC_REFADJCTL_EXT_VREF,
> +		       MA35D1_EADC_REFADJCTL_EXT_VREF);
> +	ma35d1_adc_rmw(adc, MA35D1_EADC_SELSMP0, GENMASK(1, 0), 3);
> +	ma35d1_adc_set_diff(adc, adc->scan_differential);
> +	for (i = 0; i < adc->scan_chancnt; i++)

	for (unsigned int i = 0; i < adc->scan_chancnt; i++)

> +		ma35d1_adc_rmw(adc, MA35D1_EADC_SCTL(i),
> +			       MA35D1_EADC_SCTL_TRGDLY_MASK,
> +			       MA35D1_EADC_SCTL_TRGDLY_MASK);
> +
> +	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0,
> +		       MA35D1_EADC_CTL_ADCIEN0);
> +	ma35d1_adc_write(adc, MA35D1_EADC_SWTRG, 1);
> +
> +	return 0;
> +}
> +
> +static int ma35d1_adc_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	int i;
> +
> +	ma35d1_adc_disable_irq(adc);
> +	for (i = 0; i < adc->scan_chancnt; i++)
> +		ma35d1_adc_rmw(adc, MA35D1_EADC_SCTL(i),
> +			       MA35D1_EADC_SCTL_TRGSEL_MASK, 0);

Ditto.

Also looking to the cases of setting 0s, I would rather have a helper
_set_bits() / _clear_bits() in conjunction with _update().

> +	return 0;
> +}

...

> +static void ma35d1_adc_init_channel(struct ma35d1_adc *adc,
> +				    struct iio_chan_spec *chan, u32 vinp,
> +				    u32 vinn, int scan_index, bool differential)
> +{
> +	char *name = adc->chan_name[vinp];
> +
> +	chan->type = IIO_VOLTAGE;
> +	chan->indexed = 1;
> +	chan->channel = vinp;
> +	chan->address = vinp;
> +	chan->scan_index = scan_index;
> +	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
> +	chan->scan_type.sign = 'u';
> +	chan->scan_type.realbits = 12;
> +	chan->scan_type.storagebits = 16;
> +	chan->scan_type.endianness = IIO_CPU;
> +
> +	if (differential) {
> +		chan->differential = 1;
> +		chan->channel2 = vinn;

> +		snprintf(name, MA35D1_EADC_CHAN_NAME_LEN, "in%d-in%d", vinp,
> +			 vinn);

Can compiler prove the buffer size is enough?

> +	} else {
> +		snprintf(name, MA35D1_EADC_CHAN_NAME_LEN, "in%d", vinp);
> +	}
> +
> +	chan->datasheet_name = name;

Why not use devm_kasprintf() instead?

> +}

...

> +static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
> +				     struct device *dev)
> +{
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	DECLARE_BITMAP(used_channels, MA35D1_EADC_MAX_CHANNELS);
> +	struct fwnode_handle *child;
> +	struct iio_chan_spec *channels;
> +	int num_channels;
> +	int scan_index = 0;
> +	int ret;
> +
> +	bitmap_zero(used_channels, MA35D1_EADC_MAX_CHANNELS);
> +
> +	num_channels = device_get_child_node_count(dev);
> +	if (!num_channels)
> +		return dev_err_probe(dev, -ENODATA,
> +				     "no ADC channels configured\n");
> +
> +	if (num_channels > MA35D1_EADC_MAX_CHANNELS)

Perhaps >= ?

> +		return dev_err_probe(dev, -EINVAL, "too many ADC channels\n");
> +
> +	channels = devm_kcalloc(dev, num_channels + 1, sizeof(*channels),
> +				GFP_KERNEL);
> +	if (!channels)
> +		return -ENOMEM;
> +
> +	device_for_each_child_node(dev, child) {

Use _scoped() variant.

> +		u32 diff[2];
> +		u32 reg;
> +		bool differential = false;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret) {
> +			fwnode_handle_put(child);
> +			return dev_err_probe(dev, ret,
> +					     "missing channel reg property\n");
> +		}
> +
> +		if (reg >= MA35D1_EADC_MAX_CHANNELS) {
> +			fwnode_handle_put(child);
> +			return dev_err_probe(dev, -EINVAL,
> +					     "invalid ADC channel %u\n", reg);
> +		}
> +
> +		if (test_and_set_bit(reg, used_channels)) {
> +			fwnode_handle_put(child);
> +			return dev_err_probe(dev, -EINVAL,
> +					     "duplicate ADC channel %u\n", reg);
> +		}
> +
> +		if (fwnode_property_present(child, "diff-channels")) {
> +			ret = fwnode_property_read_u32_array(child,
> +							     "diff-channels",
> +							     diff,
> +							     ARRAY_SIZE(diff));
> +			if (ret) {
> +				fwnode_handle_put(child);
> +				return dev_err_probe(dev, ret,
> +						     "invalid diff-channels for channel %u\n",
> +						     reg);
> +			}
> +
> +			if (diff[0] != reg ||
> +			    diff[1] >= MA35D1_EADC_MAX_CHANNELS ||
> +			    diff[0] == diff[1]) {
> +				fwnode_handle_put(child);
> +				return dev_err_probe(dev, -EINVAL,
> +						     "invalid differential ADC channel %u-%u\n",
> +						     diff[0], diff[1]);
> +			}
> +
> +			if (test_and_set_bit(diff[1], used_channels)) {
> +				fwnode_handle_put(child);
> +				return dev_err_probe(dev, -EINVAL,
> +						     "ADC channel %u already used\n",
> +						     diff[1]);
> +			}
> +
> +			differential = true;
> +		}
> +
> +		ma35d1_adc_init_channel(adc, &channels[scan_index], reg,
> +					differential ? diff[1] : 0,
> +					scan_index, differential);
> +		scan_index++;
> +	}
> +
> +	channels[scan_index] = (struct iio_chan_spec)
> +		IIO_CHAN_SOFT_TIMESTAMP(scan_index);
> +
> +	indio_dev->channels = channels;
> +	indio_dev->num_channels = scan_index + 1;
> +	indio_dev->masklength = indio_dev->num_channels;
> +
> +	return 0;
> +}

...

> +	ret = devm_request_irq(dev, irq, ma35d1_adc_isr, 0, dev_name(dev),
> +			       indio_dev);

Make it a single line, here it's fine.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request IRQ %d\n", irq);

Remove duplicate error message.

...

> +	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
> +					      iio_pollfunc_store_time,
> +					      ma35d1_adc_trigger_handler,
> +					      &ma35d1_adc_buffer_ops);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to setup triggered buffer\n");

So, it seems this is very rarely can be not -ENOMEM, and hence it's 99.99% dead
code, just

		return ret;

-- 
With Best Regards,
Andy Shevchenko



