Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98046CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQwjBGOlUox0oTO6Nb+xBFeGEpaCgvVAY6DNlLQtXZ0=; b=JmIGHAjn65Eo2/AmSyH+WmCHbe
	J1pCX/M7iRfcsCXSmC/Pvot1Bh8ll0Q+NMYtpBw5DvmzYxcFX/AQOq4C70Ob90EBtSmn8mFW6jL17
	wBcZPfaEWcgsWflchjatYifbG8VMbeLsfKkKG33I0zX4jI7IJYpw8gtiirnNGSkn0MnCRertYApFc
	xUzcj0GQLVOrJNpruvHKR/GnixJ/GOrL+fZBVqb2t3B2qRa93MJW76YrBeNNzTs2OsvhYmyEru6c+
	wOEbqVNidoqzqtJ4c0vGf3IS4/v8elqU9Whplj2wIoMs+jWqVLG9CJ3dzMhGrsHq87tRtJ9tzZv7f
	BgI5LhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyim-0000000E70t-0y4r;
	Mon, 04 May 2026 19:12:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyiN-0000000E6LS-1IPv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:12:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso23250525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777921940; x=1778526740; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QQwjBGOlUox0oTO6Nb+xBFeGEpaCgvVAY6DNlLQtXZ0=;
        b=eyyuyGPO0uN/MCTZSOw0ir/aZXoAXbmBpgvBHhcSaUXhcnaqbD/1Yq+P56ED2SoFZd
         5asxPbz3MSdYentYNeombzRvEUBUcLQ1hSznezVgvS2naGVkfJ9WdVr/o3apx/Eo2xQy
         pbh0ml5b05diNM/wGwjN/bPLbqTtAAYfrdE4ax/4ISRz8pEhAJfnTibLH5tjcp8kq4Cy
         hYWgb8bU23vHuA3XI55IlRIWPaTbZ3+Q8A0wUA4muQ32QYzBtivAcxKiN5Cnc4Vb9WWW
         t+Nps+aMoFTV5Q+qQnVBurQTAvq01U0qaG3wvBnOe0nPlDnkkr5wi7UsfhHYYwayTfYQ
         Z8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921940; x=1778526740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQwjBGOlUox0oTO6Nb+xBFeGEpaCgvVAY6DNlLQtXZ0=;
        b=AEkfxhvCO7SoB0XKJD7j4uhsT/otuXA87T+3iJKseF/hh3NU+/l/XmDXuOBYdCHZkp
         HVO0u1zCA1IIJ2U9qHUWkw/QLHzd8OPd/Qn47W5sX9iLCVU4nzVF4wmoRXlkPm5hD25R
         8TN1T+Nh3CGWue+0wqhdZnmoQQ5y67TC0Mr49dBeoDnQ70IWnT8tt4AEFm2q5Wj5p/2G
         2gYMXRxG8YK1O48G5crVcYX8iWZftPHkLGhK/SRq6IAFGHe7I+2OQjtkf6dK14r/VqMx
         f6Ii1cfxug/kvEDJIUhSAAhwqPeAJGqk6Y+lG2byA6QK5Xh4WotukFtcfcijQTVnL93j
         Gldg==
X-Forwarded-Encrypted: i=1; AFNElJ9HeYrk3NU05tgwozFCO/FeQ9oDFboLmXspU0RHNHyhcr9rgoZEpAU2Ja13l3y8ufzBBJGp2QRdn1ezF1D/qP4f@lists.infradead.org
X-Gm-Message-State: AOJu0YwuKI9PQg2eGXwX5Vrw6nrUXNYAwb3ypmkelCaN0ntEPkTOROi8
	SmdI26gm8/Xh0zzmk3o+LdlM+rfNfNi92dEGQ7gLGM2u32sP3hSdAmuw
X-Gm-Gg: AeBDiesfIfYE2emJjGgnOdOXY3NTpMnECtO3Sdieo/5R+qUNM/pwp1eMb9h9p+el1NE
	qshHi1jRyTsuzlRWht5RmTMlZRUv225A2kceGtEU+kd6P9kw3gu3RRhinYQwvE2RJmSJBd/KvWQ
	OLnQhsTlS5bufMP7COpBd4ULa9JRD+/6s6Ge5WfyV51hGJp6e6lEiHGeXWV5CbrZu+dGdXpY8wD
	FKR2c5fDz3hzQz4DNK2fsWjwtoo8nQWtV3G9xtJ4z5VWFb/WiWMPngvS/qDhNB9PPJcapgCgizc
	JureroMI5aXpfDSPX0/qMu8PVeIL0yv22svOA3rjTkRdfB3Uas8tS0AA2Ne6pLc+Y9WWrS0Rw1N
	bTipWEU5zwyyGEpVZzxLhCy9x8vtAiaHhKShEbWGGPePKkH35pVgHtVyRaHty12d+BZdEPILTeZ
	zGhuPrg8xIcDteICuyTAjRRhP5GhXZIflz8ZO7qzaW7uCY8SZVxS5VHPFRKB2kRaga5hVrobeD1
	o3ksbtBvrqGgycencha9CI=
X-Received: by 2002:a05:600c:6215:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48a988a9c49mr165080765e9.5.1777921939450;
        Mon, 04 May 2026 12:12:19 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba6f83sm285124095e9.9.2026.05.04.12.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:12:19 -0700 (PDT)
Message-ID: <ab58ef97e0e2b20d04210ca0adda6a46a023ac00.camel@gmail.com>
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Angelo Dureghello <angelo@kernel-space.org>, Greg Ungerer	
 <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Steven
 King	 <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin	
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Jonathan Cameron	 <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, Angelo
 Dureghello <adureghello@baylibre.com>
Date: Mon, 04 May 2026 20:13:19 +0100
In-Reply-To: <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
	 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121223_522156_A47FE9F7 
X-CRM114-Status: GOOD (  33.17  )
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

Hi Angelo,

Minor stuff from me

On Mon, 2026-05-04 at 19:16 +0200, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
>=20
> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
>=20
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from ~DAC_VREFL to ~DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. DAC_VREFL and DAC_VREFH defaults respectivley to
> 0 and 0xfff.
>=20
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mo=
de
> is high speed, default format is right-justified 12bit on 16bit word.
>=20
> Basic tests done on stmark2 mcf54415-based board, voltage check on DAC0:
>=20
> /sys/bus/iio/devices/iio:device0 # ls
> name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ubsystem
> out_conversion_mode=C2=A0 out_voltage_scale=C2=A0=C2=A0=C2=A0 uevent
>=20
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415_dac.0
>=20
> /sys/bus/iio/devices/iio:device0 #
>=20
> echo 4095 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0 =3D> voltage abt 3.3V=
 by oscilloscope
> echo 4096 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0 =3D> roll over to 0V
> echo 0 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> v=
oltage is 0V
> echo 2048 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0 =3D> voltage is abt 1=
.7V, mid scale
>=20
> Same behavior for /sys/bus/iio/devices/iio:device1.
>=20
> Generated a sine wave by shell script, sine shape is good.
>=20

Not sure if the above example belongs to the commit message. I would just w=
rite a
small doc if you really want to document the above. We're now seeing more d=
ocs for
IIO drivers.

> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
> =C2=A0drivers/iio/dac/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 10 +++
> =C2=A0drivers/iio/dac/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0drivers/iio/dac/mcf54415_dac.c | 200 ++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 211 insertions(+)
>=20
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index cd4870b65415..17550e99cfdd 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -516,6 +516,16 @@ config MAX5821
> =C2=A0	=C2=A0 Say yes here to build support for Maxim MAX5821
> =C2=A0	=C2=A0 10 bits DAC.
> =C2=A0
> +config MCF54415_DAC
> +	tristate "NXP MCF54415 DAC driver"
> +	depends on M5441x
> +	help
> +	=C2=A0 Say yes here to build support for NXP MCF54415
> +	=C2=A0 12bit DAC.
> +
> +	=C2=A0 To compile this driver as a module, choose M here: the module
> +	=C2=A0 will be called mcf54415_dac.
> +
> =C2=A0config MCP4725
> =C2=A0	tristate "MCP4725/6 DAC driver"
> =C2=A0	depends on I2C
> diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
> index 2a80bbf4e80a..1cb93e83d0eb 100644
> --- a/drivers/iio/dac/Makefile
> +++ b/drivers/iio/dac/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MAX517) +=3D max517.o
> =C2=A0obj-$(CONFIG_MAX22007) +=3D max22007.o
> =C2=A0obj-$(CONFIG_MAX5522) +=3D max5522.o
> =C2=A0obj-$(CONFIG_MAX5821) +=3D max5821.o
> +obj-$(CONFIG_MCF54415_DAC) +=3D mcf54415_dac.o
> =C2=A0obj-$(CONFIG_MCP4725) +=3D mcp4725.o
> =C2=A0obj-$(CONFIG_MCP4728) +=3D mcp4728.o
> =C2=A0obj-$(CONFIG_MCP47FEB02) +=3D mcp47feb02.o
> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_da=
c.c
> new file mode 100644
> index 000000000000..4031a5dc1f9d
> --- /dev/null
> +++ b/drivers/iio/dac/mcf54415_dac.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * NXP mcf54415 DAC driver
> + *
> + * Copyright 2026 BayLibre - adureghello@baylibre.com
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/iio/iio.h>
> +
> +#define MCF54415_DAC_CR			0x00
> +#define MCF54415_DAC_CR_PDN		BIT(0)
> +#define MCF54415_DAC_CR_HSLS		BIT(6)
> +#define MCF54415_DAC_CR_WMLVL		GENMASK(9, 8)
> +#define MCF54415_DAC_CR_FILT		BIT(12)
> +
> +#define MCF54415_DAC_DATA		0x02
> +
> +#define MCF54415_DAC_READY_US		12
> +
> +struct mcf54415_dac {
> +	struct clk *clk;
> +	struct device *dev;
> +	void __iomem *regs;
> +};
> +
> +static void mcf54415_dac_init(struct mcf54415_dac *info)
> +{
> +	int val;
> +
> +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> +	val =3D MCF54415_DAC_CR_FILT;
> +	val |=3D FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
> +
> +	writew(val, info->regs + MCF54415_DAC_CR);
> +
> +	/* DAC is ready after 12us, from RM table 40-3=C2=A0 */
> +	fsleep(MCF54415_DAC_READY_US);
> +}
> +
> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info =3D data;
> +	int val;
> +
> +	val =3D readw(info->regs + MCF54415_DAC_CR);
> +	val |=3D MCF54415_DAC_CR_PDN;
> +	writew(val, info->regs + MCF54415_DAC_CR);
> +}
> +
> +#define MCF54415_DAC_CHAN { \
> +	.type =3D IIO_VOLTAGE, \
> +	.output =3D 1, \
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE), \
> +}
> +
> +static const struct iio_chan_spec mcf54415_dac_iio_channels[] =3D {
> +	MCF54415_DAC_CHAN
> +};
> +
> +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2,
> +			long mask)
> +{
> +	struct mcf54415_dac *info =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		*val =3D readw(info->regs + MCF54415_DAC_DATA);
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> +		*val =3D 3300 /* mV */;
> +		*val2 =3D 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int val, int val2,
> +			long mask)
> +{
> +	struct mcf54415_dac *info =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		writew(val, info->regs + MCF54415_DAC_DATA);
> +		return 0;
> +

No need for the new line.

> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_info mcf54415_dac_iio_info =3D {
> +	.read_raw =3D &mcf54415_read_raw,
> +	.write_raw =3D &mcf54415_write_raw,
> +};
> +
> +static int mcf54415_dac_probe(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev;
> +	struct mcf54415_dac *info;
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(&pdev->dev,
> +					=C2=A0 sizeof(struct mcf54415_dac));

Slight preference for sizeof(*info)

> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info =3D iio_priv(indio_dev);
> +	info->dev =3D &pdev->dev;
> +
> +	info->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(info->regs))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->regs),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get io regs\n");
> +
> +	info->clk =3D devm_clk_get_enabled(&pdev->dev, "dac");
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed getting clock\n");
> +
> +	platform_set_drvdata(pdev, indio_dev);
> +
>=20
> +	indio_dev->name =3D dev_name(&pdev->dev);

Just use "mcf54415".=20

> +	indio_dev->info =3D &mcf54415_dac_iio_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D mcf54415_dac_iio_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(mcf54415_dac_iio_channels);
> +
> +	mcf54415_dac_init(info);
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev, mcf54415_dac_exit, info);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_iio_device_register(&pdev->dev, indio_dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "couldn't register the device\n");
> +

I would just return devm_iio_device_register();

- Nuno S=C3=A1


