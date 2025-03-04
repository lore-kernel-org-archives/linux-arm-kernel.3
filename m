Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FC6C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNHGZZAfC/OeouxLYsdw1LTwRghW2GqRfwvXDc9ArBc=; b=DbWUfQwVMJ4b0DUBpZ9XfTmPdv
	UNcx71fKQKAUAAne58SU3IIP4rtxYiABdoRo3iuB8OJclorCSDalC4ywoXXVB6MTTEZUWQ5Ckh77z
	faAkeb12U3h3jhAIcJJxaPnTfJifN5RXxBImG1ag2EPt6Icb3KDQe2WpCF29gP2qb4N0BGmf33gLA
	NVATQn8YsU56cwV0H+YCVxgx/EtKOAQWvpFswMVMPVszARCxQeFQxaRfGPjtuLyCIlTNXpCFSaNR2
	JehT1whgVAeRo6yGO6jxOxchosuVOTQQINunEekmpfsE1ehMHI8rjnUYXuMr7yMfuADHov/4X9+2d
	HXMip6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOYs-00000003sqN-1p7I;
	Tue, 04 Mar 2025 09:27:38 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOWb-00000003s4I-30Bb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:25:19 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30bb184ab24so21841201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 01:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741080315; x=1741685115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNHGZZAfC/OeouxLYsdw1LTwRghW2GqRfwvXDc9ArBc=;
        b=xYB7+Ow1n6QFxcrie/KG/ci8orFcGBQYc8lw+VD3iDzEpdSecnO4P7Rl/kiDsbxXX2
         0ZjHqvqsgjqQXqGCIwN3DJhBOzq2nlRV4CJJA7VgKEBVjR8NIaZgACJiaQ+KYze1/hfU
         wqW5d7j76nDQHz/QAQ5secRxpdVDF+ACxEJuGeMgI55KVfj6w7NJ0vxfaYmck3WZhMXH
         RlMBCfP2KvWgoLo+P5lsZ56z1PxoAU9nhhPiSH3miy9pUHRbozUQ7Ex5Yp3VZPxf5Va4
         dcWDJaNLvoFXdYuWmiarnB/eUTgDWFBn8z+BYDjJBuvawSfQ4tY0itnTnypL2z8qKUS5
         yqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080315; x=1741685115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNHGZZAfC/OeouxLYsdw1LTwRghW2GqRfwvXDc9ArBc=;
        b=LIp+Ixxe4q1nZC5az64wyPgKXjLyWPuT95X0pmDkSIH8qxAly4b9AYQo7oVuWEPB5u
         Ac0uMbx/HzCQc9+NM8wqUNRlT/odZHfWWj18MxQHcL+/7jCzuBwcPL00f8R26X4wiz+y
         +TldUZgwT/DIxSnOywIPmMKR40WRH8hYzY8+mcEHpxb/FbsqRDMxCXJm4pjvw4vk6PY/
         kgtmJIZoATOfSfvBCb3P2EVdKeuw+NJiHqL/QD+QnSPnA0SH96XAZhF0eVdLwcDoGUhZ
         d8nvyuGG2XDtlUWL75DrBwv54J1rPfEcIbZxlDAm6T2/aejesmV6HxayIYrYdR4I9gem
         /VBw==
X-Forwarded-Encrypted: i=1; AJvYcCWgr6/EgUHQf8EHUujkZA8DUO9fiNysvVdCOHbxktbrZKJeodFiu2zvGnJ1ee3elnlqirzhV0O0p4xMrAlr5e4V@lists.infradead.org
X-Gm-Message-State: AOJu0YyOk2qvsp4EcK27aqozvPm07quXUAWiEGivfcBR1h1sskhMHBG5
	rEqlfJTj6+AjC9FVStGOsJ1dm+3KJC21OKiBhfmhWWXxJrfjHC5kkfuGhIVT60RSa5ZSa0hNKHX
	NVwHyz/3cl3EEInwg3m0lmnNtkZDxzcZw8hzJYg==
X-Gm-Gg: ASbGncuDDA+23/aaKxrUwZjh2BcQ0VBWCn4cANc9g/AHQbrSeGSkiK2z/i2REXKapwZ
	F3aPuy+LQzmy59d73eVuLgkNclbTQ5sziuQp2cf/EdCRvIDVhO5qEQvJiVeDHd/fhshiAzhGD9T
	FhgmRGd4q0QvmzATprHx/9zcBXlQ==
X-Google-Smtp-Source: AGHT+IGBR2saDF3QQilBjubdBkLz9GIwt81EvLWpbxtqjDwEqBVukkswrlVo60Wa8sQgAwNowo9qt17F/oOZ+WCjClQ=
X-Received: by 2002:a2e:9c92:0:b0:308:e803:1180 with SMTP id
 38308e7fff4ca-30b9344cee6mr42882981fa.31.1741080315257; Tue, 04 Mar 2025
 01:25:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740993491.git.mazziesaccount@gmail.com> <e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
In-Reply-To: <e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 4 Mar 2025 10:25:03 +0100
X-Gm-Features: AQ5f1JpLki6dbkM9Ig67nt3sfSzm1pr_ewW2yyuU-GO1iNjarygbWgXgDim39ws
Message-ID: <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Guillaume Stols <gstols@baylibre.com>, 
	Dumitru Ceclan <mitrutzceclan@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, Alisa-Dariana Roman <alisadariana@gmail.com>, 
	Ramona Alexandra Nechita <ramona.nechita@analog.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_012517_755599_8CDD3F90 
X-CRM114-Status: GOOD (  41.35  )
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

On Mon, Mar 3, 2025 at 12:32=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
>
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.
>
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>
> ---
> Revision history:
> v4 =3D> v5:
> - Inline iio_adc_device_num_channels()
> - Fix Indenting function parameters
> - Combine the max channel ID checks.
> v3 =3D> v4:
>  - Drop diff-channel support
>  - Drop iio_adc_device_channels_by_property()
>  - Add IIO_DEVICE namespace
>  - Move industrialio-adc.o to top of the Makefile
>  - Some styling as suggested by Andy
>  - Re-consider included headers
> v2 =3D> v3: Mostly based on review comments by Jonathan
>  - Support differential and single-ended channels
>  - Rename iio_adc_device_get_channels() as
>    iio_adc_device_channels_by_property()
>  - Improve spelling
>  - Drop support for cases where DT comes from parent device's node
>  - Decrease loop indent by reverting node name check conditions
>  - Don't set 'chan->indexed' by number of channels to keep the
>    interface consistent no matter how many channels are connected.
>  - Fix ID range check and related comment
> RFC v1 =3D> v2:
>  - New patch
> ---
>  drivers/iio/adc/Kconfig            |  3 ++
>  drivers/iio/adc/Makefile           |  2 +
>  drivers/iio/adc/industrialio-adc.c | 82 ++++++++++++++++++++++++++++++
>  include/linux/iio/adc-helpers.h    | 27 ++++++++++
>  4 files changed, 114 insertions(+)
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
> +       tristate
> +
>  config AB8500_GPADC
>         bool "ST-Ericsson AB8500 GPADC driver"
>         depends on AB8500_CORE && REGULATOR_AB8500
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index ee19afba62b7..1c410f483029 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -3,6 +3,8 @@
>  # Makefile for IIO ADC drivers
>  #
>
> +obj-$(CONFIG_IIO_ADC_HELPER) +=3D industrialio-adc.o
> +
>  # When adding new entries keep the list in alphabetical order
>  obj-$(CONFIG_AB8500_GPADC) +=3D ab8500-gpadc.o
>  obj-$(CONFIG_AD_SIGMA_DELTA) +=3D ad_sigma_delta.o
> diff --git a/drivers/iio/adc/industrialio-adc.c b/drivers/iio/adc/industr=
ialio-adc.c
> new file mode 100644
> index 000000000000..7bdae5330224
> --- /dev/null
> +++ b/drivers/iio/adc/industrialio-adc.c
> @@ -0,0 +1,82 @@
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
> +/**
> + * devm_iio_adc_device_alloc_chaninfo_se - allocate and fill iio_chan_sp=
ec for ADC
> + *
> + * Scan the device node for single-ended ADC channel information. Channe=
l ID is
> + * expected to be found from the "reg" property. Allocate and populate t=
he
> + * iio_chan_spec structure corresponding to channels that are found. The=
 memory
> + * for iio_chan_spec structure will be freed upon device detach.
> + *
> + * @dev:               Pointer to the ADC device.
> + * @template:          Template iio_chan_spec from which the fields of a=
ll
> + *                     found and allocated channels are initialized.
> + * @max_chan_id:       Maximum value of a channel ID. Use -1 if no check=
ing
> + *                     is required.
> + * @cs:                        Location where pointer to allocated iio_c=
han_spec
> + *                     should be stored.
> + *
> + * Return:     Number of found channels on succes. Negative value to ind=
icate

s/succes/success/

> + *             failure.
> + */
> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> +                                         const struct iio_chan_spec *tem=
plate,
> +                                         int max_chan_id,
> +                                         struct iio_chan_spec **cs)
> +{
> +       struct iio_chan_spec *chan_array, *chan;
> +       int num_chan =3D 0, ret;
> +
> +       num_chan =3D iio_adc_device_num_channels(dev);
> +       if (num_chan < 1)
> +               return num_chan;
> +
> +       chan_array =3D devm_kcalloc(dev, num_chan, sizeof(*chan_array),
> +                                 GFP_KERNEL);
> +       if (!chan_array)
> +               return -ENOMEM;
> +
> +       chan =3D &chan_array[0];
> +
> +       device_for_each_child_node_scoped(dev, child) {
> +               u32 ch;
> +
> +               if (!fwnode_name_eq(child, "channel"))
> +                       continue;
> +
> +               ret =3D fwnode_property_read_u32(child, "reg", &ch);
> +               if (ret)
> +                       return ret;
> +
> +               if (max_chan_id !=3D -1 && ch > max_chan_id)
> +                       return -ERANGE;
> +

Should we use return dev_err_probe() on these to help with debugging a bad =
dtb?

> +               *chan =3D *template;
> +               chan->channel =3D ch;
> +               chan++;
> +       }
> +
> +       *cs =3D chan_array;
> +
> +       return num_chan;
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER"=
);

We can make this less verbose by setting #define
DEFAULT_SYMBOL_NAMESPACE at the start of the file. Then we can just do
EXPORT_SYMBOL_GPL() throughout the rest of the file.

Also, I would prefer if the namespace matched config name (IIO_ADC_HELPER).

> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
> +MODULE_DESCRIPTION("IIO ADC fwnode parsing helpers");
> diff --git a/include/linux/iio/adc-helpers.h b/include/linux/iio/adc-help=
ers.h
> new file mode 100644
> index 000000000000..403a70b109ec
> --- /dev/null
> +++ b/include/linux/iio/adc-helpers.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/*
> + * The industrial I/O ADC firmware property parsing helpers
> + *
> + * Copyright (c) 2025 Matti Vaittinen <mazziesaccount@gmail.com>
> + */
> +
> +#ifndef _INDUSTRIAL_IO_ADC_HELPERS_H_
> +#define _INDUSTRIAL_IO_ADC_HELPERS_H_
> +
> +#include <linux/property.h>
> +
> +struct device;
> +struct iio_chan_spec;
> +
> +static inline int iio_adc_device_num_channels(struct device *dev)
> +{
> +       return device_get_child_node_count_named(dev, "channel");
> +}
> +
> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> +                                         const struct iio_chan_spec *tem=
plate,
> +                                         int max_chan_id,
> +                                         struct iio_chan_spec **cs);
> +

There are some different opinions on this, but on the last patch I did
introducing a new namespace, the consensus seems to be that putting
the MODULE_IMPORT_NS() in the header file was convenient so that users
of the API don't have to remember to both include the header and add
the import macro.

> +#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
> --
> 2.48.1
>

