Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25116C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 03:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVfo/4lrQ9mZ4yDGD/IjOC0+Mb+/rsVbVBuSO/MlSK0=; b=MHlBtERZ89wsNLgL6oSOvJSUj/
	neXcDfgcnGl+aI2iLJlSfU+d9h4VkgRl3wtLxEqZlvIwAMplskLxSiAYqzyH12DE0MIxsz++MnBI7
	Yxv1z3RDckZn6CUmFesAW9pX53sbV5L98YchDwk/LueZqrMQwkZOu5s0UovH6v7YAb/ltM+jPDzzc
	tUMOAz+L7FdVuWQMy9ZZtVR9YTD/4/1b7kw9ly7yrfWD0R/8KUaDx3oSzeMHUqq/JuemNugIBQppe
	8bUAab72pPPrlyl678/RNO9CXfDa0arvlO7Z70YKQELrwoYmnrzc9awFog7wZVUzHCz+uP2JSeMGo
	y9y6BPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toa8Y-0000000FJsm-1OXH;
	Sun, 02 Mar 2025 03:37:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toa71-0000000FJnn-2k2l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 03:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9ECD61141;
	Sun,  2 Mar 2025 03:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81831C4CEE2;
	Sun,  2 Mar 2025 03:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740886529;
	bh=qxsEAw46qjaW9vCHp47YORWcbidCY9uP4CuL/3qIW9M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZGP12Iz1cL1/g4Z8YJFf7kY3o/fyF3QI9T6frEuW3U6Telq0MfsrCnp+aJm1BcYUN
	 ge1U0SxitACahHZY7KQTcVLCOEJZ4noEd8S3cAp8yeshBPxv9AyJSl88XZrAcv4BJz
	 Mr4Rx0+owSS8Uy8UikZRYVY/N+AVgMD4YxqNIGfiPnffT9izzJxzIsGGGcG1KTqheC
	 m7Za6gbdesYfZPM71ZhL0Ogysdev9nA/tYJutmoruTmShjoZy1siL3RKorHSyp+lpi
	 yKorheTshyA9yVCkBgD5OZbs/wtBKrirtUBV0CgLeASxsOVzhPOAr0kopdPMG6KVJ4
	 FkVkoCGr1zckA==
Date: Sun, 2 Mar 2025 03:35:07 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Guillaume Stols
 <gstols@baylibre.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Dumitru
 Ceclan <mitrutzceclan@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, Alisa-Dariana Roman
 <alisadariana@gmail.com>, Ramona Alexandra Nechita
 <ramona.nechita@analog.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <20250302033507.7c166743@jic23-huawei>
In-Reply-To: <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
	<23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 24 Feb 2025 20:33:16 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.
I think it's worth exploring if we can tweak this slightly to make
that something a driver specifies.  Either skip the unspecified or
fill them with default values depending on a parameter.

Would make this code cover the existing cases better. 
Might be a little fiddly as we'd want to maintain ordering so
the code would need to index slightly differently. I've not tried it
so maybe not worth it for now.


> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v3 => v4:
>  - Drop diff-channel support
>  - Drop iio_adc_device_channels_by_property()
>  - Add IIO_DEVICE namespace
>  - Move industrialio-adc.o to top of the Makefile
>  - Some styling as suggested by Andy
>  - Re-consider included headers
> v2 => v3: Mostly based on review comments by Jonathan
>  - Support differential and single-ended channels
>  - Rename iio_adc_device_get_channels() as
>    iio_adc_device_channels_by_property()
>  - Improve spelling
>  - Drop support for cases where DT comes from parent device's node
>  - Decrease loop indent by reverting node name check conditions
>  - Don't set 'chan->indexed' by number of channels to keep the
>    interface consistent no matter how many channels are connected.
>  - Fix ID range check and related comment
> RFC v1 => v2:
>  - New patch
> 
> iio: adc: helper: drop headers
> ---
>  drivers/iio/adc/Kconfig            |  3 +
>  drivers/iio/adc/Makefile           |  2 +
>  drivers/iio/adc/industrialio-adc.c | 89 ++++++++++++++++++++++++++++++
>  include/linux/iio/adc-helpers.h    | 22 ++++++++
>  4 files changed, 116 insertions(+)
>  create mode 100644 drivers/iio/adc/industrialio-adc.c
>  create mode 100644 include/linux/iio/adc-helpers.h
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 849c90203071..37b70a65da6f 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -6,6 +6,9 @@
>  
>  menu "Analog to digital converters"
>  
> +config IIO_ADC_HELPER
> +	tristate
> +
>  config AB8500_GPADC
>  	bool "ST-Ericsson AB8500 GPADC driver"
>  	depends on AB8500_CORE && REGULATOR_AB8500
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index ee19afba62b7..1c410f483029 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -3,6 +3,8 @@
>  # Makefile for IIO ADC drivers
>  #
>  
> +obj-$(CONFIG_IIO_ADC_HELPER) += industrialio-adc.o
> +
>  # When adding new entries keep the list in alphabetical order
>  obj-$(CONFIG_AB8500_GPADC) += ab8500-gpadc.o
>  obj-$(CONFIG_AD_SIGMA_DELTA) += ad_sigma_delta.o
> diff --git a/drivers/iio/adc/industrialio-adc.c b/drivers/iio/adc/industrialio-adc.c
> new file mode 100644
> index 000000000000..d8e9e6825d2b
> --- /dev/null
> +++ b/drivers/iio/adc/industrialio-adc.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Helpers for parsing common ADC information from a firmware node.
> + *
> + * Copyright (c) 2025 Matti Vaittinen <mazziesaccount@gmail.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/types.h>
> +
> +#include <linux/iio/adc-helpers.h>
> +#include <linux/iio/iio.h>
> +
> +int iio_adc_device_num_channels(struct device *dev)
> +{
> +	return device_get_child_node_count_named(dev, "channel");
> +}
> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);

Maybe one to promote to a static inline in the header and avoid need for
the export given it is very simple.

> +
> +/**
> + * devm_iio_adc_device_alloc_chaninfo_se - allocate and fill iio_chan_spec for ADC
> + *
> + * Scan the device node for single-ended ADC channel information. Channel ID is
> + * expected to be found from the "reg" property. Allocate and populate the
> + * iio_chan_spec structure corresponding to channels that are found. The memory
> + * for iio_chan_spec structure will be freed upon device detach.
> + *
> + * @dev:		Pointer to the ADC device.
> + * @template:		Template iio_chan_spec from which the fields of all
> + *			found and allocated channels are initialized.
> + * @max_chan_id:	Maximum value of a channel ID. Use -1 if no checking
> + *			is required.
> + * @cs:			Location where pointer to allocated iio_chan_spec
> + *			should be stored.
> + *
> + * Return:	Number of found channels on succes. Negative value to indicate
> + *		failure.
> + */
> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> +				const struct iio_chan_spec *template,
> +				int max_chan_id,
> +				struct iio_chan_spec **cs)
> +{
> +	struct iio_chan_spec *chan_array, *chan;
> +	int num_chan = 0, ret;
> +
> +	num_chan = iio_adc_device_num_channels(dev);
> +	if (num_chan < 1)
> +		return num_chan;
> +
> +	chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
> +				  GFP_KERNEL);
> +	if (!chan_array)
> +		return -ENOMEM;
> +
> +	chan = &chan_array[0];
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		u32 ch;
> +
> +		if (!fwnode_name_eq(child, "channel"))
> +			continue;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &ch);
> +		if (ret)
> +			return ret;
> +
> +		if (max_chan_id != -1)
> +			if (ch > max_chan_id)
> +				return -ERANGE;

Might as well combine.
		if (max_chan_id != -1 && ch > max_chan_id)
			return -ERANGE; 
> +
> +		*chan = *template;
> +		chan->channel = ch;
> +		chan++;
> +	}
> +
> +	*cs = chan_array;
> +
> +	return num_chan;
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER");
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
> +MODULE_DESCRIPTION("IIO ADC fwnode parsing helpers");


