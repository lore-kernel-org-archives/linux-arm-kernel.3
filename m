Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E3CD30CDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 00:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ext8msLhoBecX7Fpbdp+73tXE9MeV0UomGOCXQFEQM=; b=fUKbOG6Doj5sHPTIFDuw6Ov+TO
	fW76IGK70151fOoJxxrfnMH1SWUWnK/2ll3C9bB/pXc5s34ieHVMKEprMX66Z0G6njYibDf+yl6eZ
	ldoIVBNYlqVjhYs2YiHbGiEUIUkV2f5nen9fLbvYxbH66mOGOglC3ugURx7pQhmvZIMwQkR/2ebaG
	AASrj7WQZpG4hINPEq/gxdeGAOJRDB35kmLnXUtMMHgFHqCCEIWM4h5SGrxIUkx8ldV1aHgktcsOG
	DeO9mL0hWJv6uyl1rkdEC0U9e1TmFBoGV/t+CVoIfya4yy4Z1Vg1++A2oynIjrXnG72xtHhnGmoXx
	3UykHLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpB3-00000007vYC-1MHv;
	Wed, 14 Jan 2026 00:56:01 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpB0-00000007vXq-3RPZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 00:56:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768352154; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=me9Ls9oYKtfulWvqnrW70RBJKuT3fgrHZlaS6eZZIlmo2fBZp8RpzLKj1pRsVQJRHIeo/g7hTGsNT0x/l8Ee8T/tRuaTkgQ0Hpltl4NUEy5Y6IXozvNSRabS8wwq19GnAJIjUrQwIxHLpX9qQTHnPrEXEAXIe1tv6buBzxMXxEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768352154; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+Ext8msLhoBecX7Fpbdp+73tXE9MeV0UomGOCXQFEQM=; 
	b=ZA53bfwfeeTbNZ1beM57SYhMTcuC7W56YEQo6wYuyO465DYkyD2HnMaCR4ZLIQHSqX1k8Ix3I4anJdAaH+xip5dXh2NFnkEChQXVFazVXI2OAaLNGEuR0omeS+GBrovLZ4kFgX1fLqSMyoz1C9lUftrX6ZI803a3M5O59wCeYEU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768352154;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=+Ext8msLhoBecX7Fpbdp+73tXE9MeV0UomGOCXQFEQM=;
	b=ERWZVRixuIRt4OzNh7HTLrMngknLqEDfsmVUuTd/aILZuNqhvFmtw5KWG3O7mBgh
	HYrxV2Gs6iozUBdS039SiIYyNQq1xZgpPuqnVnwwQKeCoGEmUkT8AoQLTzIcTevCbC2
	fEjU4VJV8NlGFJCVwtNxB1XS5ejYqteYHuMumQy8=
Received: by mx.zohomail.com with SMTPS id 1768352152701661.3386817883359;
	Tue, 13 Jan 2026 16:55:52 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id BDB05181010; Wed, 14 Jan 2026 01:55:47 +0100 (CET)
Date: Wed, 14 Jan 2026 01:55:47 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Josua Mayer <josua.mayer@jm0.eu>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] power: supply: add battery driver for netronix ec
Message-ID: <aWblrimQTy5-khZF@venus>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
 <20260102-kobo-aura-battery-v1-3-501f2a8fa575@jm0.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sqik7oiq3dkakjj4"
Content-Disposition: inline
In-Reply-To: <20260102-kobo-aura-battery-v1-3-501f2a8fa575@jm0.eu>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/268.322.40
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_165558_929704_5965C566 
X-CRM114-Status: GOOD (  32.59  )
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


--sqik7oiq3dkakjj4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] power: supply: add battery driver for netronix ec
MIME-Version: 1.0

Hi,

On Fri, Jan 02, 2026 at 07:00:32PM +0100, Josua Mayer wrote:
> Implement a simple battery driver for monitoring voltage with the
> netronix embedded controller found in certain ebook readers.
>=20
> Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
> ---
>  drivers/power/supply/Kconfig         |   9 ++++
>  drivers/power/supply/Makefile        |   1 +
>  drivers/power/supply/ntxec-battery.c | 101 +++++++++++++++++++++++++++++=
++++++

That's indeed simple :)

>  3 files changed, 111 insertions(+)
>=20
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 92f9f7aae92f..0f944c10e50b 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -1132,4 +1132,13 @@ config FUEL_GAUGE_MM8013
>  	  the state of charge, temperature, cycle count, actual and design
>  	  capacity, etc.
> =20
> +config BATTERY_NTXEC
> +	tristate "Battery driver for Netronix embedded controller"
> +	depends on MFD_NTXEC

You can add "|| COMPILE_TEST"

> +	help
> +	  Say yes here to enable netronix ec battery monitoring driver.
> +	  It enables the monitoring battery voltage on certain e-book readers
> +	  using an embedded controller by ODM Netronix. Battery design
> +	  characteristics are read from device-tree if available.
> +
>  endif # POWER_SUPPLY
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index 4b79d5abc49a..db6fc815f9da 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -128,3 +128,4 @@ obj-$(CONFIG_CHARGER_SURFACE)	+=3D surface_charger.o
>  obj-$(CONFIG_BATTERY_UG3105)	+=3D ug3105_battery.o
>  obj-$(CONFIG_CHARGER_QCOM_SMB2)	+=3D qcom_smbx.o
>  obj-$(CONFIG_FUEL_GAUGE_MM8013)	+=3D mm8013.o
> +obj-$(CONFIG_BATTERY_NTXEC)	+=3D ntxec-battery.o
> diff --git a/drivers/power/supply/ntxec-battery.c b/drivers/power/supply/=
ntxec-battery.c
> new file mode 100644
> index 000000000000..f49f0966d18d
> --- /dev/null
> +++ b/drivers/power/supply/ntxec-battery.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * The Netronix embedded controller is a microcontroller found in some
> + * e-book readers designed by the original design manufacturer Netronix,=
 Inc.
> + * It contains RTC, battery monitoring, system power management, and PWM
> + * functionality.
> + *
> + * This driver implements battery monitoring.
> + *
> + * Copyright 2021 Josua Mayer <josua.mayer@jm0.eu>
> + */
> +
> +#include <linux/mfd/ntxec.h>

^ you probably don't need this with my comments down below :)

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +static const enum power_supply_property ntxec_battery_properties[] =3D {
> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> +};
> +
> +struct ntxec_battery {
> +	struct ntxec *ec;
> +};

Store the regmap instead of the ec. You don't need anything else.

> +#define NTXEC_REG_READ_BATTERY	0x41
> +
> +static int ntxec_battery_get_property(struct power_supply *psy,
> +				     enum power_supply_property psp,
> +				     union power_supply_propval *val)
> +{
> +	struct ntxec_battery *priv =3D power_supply_get_drvdata(psy);
> +	int ret;
> +	unsigned int value;
> +
> +	switch (psp) {
> +		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +			ret =3D regmap_read(priv->ec->regmap, NTXEC_REG_READ_BATTERY, &value);
> +			if (ret < 0)
> +				return ret;
> +
> +			/* ec value to microvolt conversion:
> +			 * vendor kernel source suggests linear behaviour from 3V to 4.2V
> +			 * with readings 767 to 1023; each increment represents 4687,5uV.

4687.5uV ?

> +			 * adjust 3V boundary slightly to report exactly 4.2V when full.
> +			 */
> +			val->intval =3D 2999872 + (value - 767) * 4688;
> +			break;
> +		default:
> +			dev_err(&psy->dev, "%s: invalid property %u\n", __func__, psp);
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct power_supply_desc ntxec_battery_desc =3D {
> +	.name =3D "ec-battery",
> +	.type =3D POWER_SUPPLY_TYPE_BATTERY,
> +	.properties =3D ntxec_battery_properties,
> +	.get_property =3D ntxec_battery_get_property,
> +	.num_properties =3D ARRAY_SIZE(ntxec_battery_properties),
> +};
> +
> +static int ntxec_battery_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ntxec *ec =3D dev_get_drvdata(dev->parent);

Based on the regmap comment above, I think you can just do the
following and completley avoid 'struct ntxec' (please test):

struct regmap *regmap =3D dev_get_regmap(dev->parent, NULL);

> +	struct power_supply_config psy_cfg =3D {};
> +	struct ntxec_battery *priv;
> +	struct power_supply *psy;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->ec =3D ec;
> +	psy_cfg.drv_data =3D priv;
> +	psy_cfg.fwnode =3D dev_fwnode(dev->parent);
> +	psy_cfg.no_wakeup_source =3D true;
> +	psy =3D devm_power_supply_register(dev, &ntxec_battery_desc, &psy_cfg);
> +	if (IS_ERR(psy))
> +		return PTR_ERR(psy);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ntxec_battery_driver =3D {
> +	.driver =3D {
> +		.name =3D "ntxec-battery",
> +	},
> +	.probe =3D ntxec_battery_probe,
> +};
> +module_platform_driver(ntxec_battery_driver);
> +
> +MODULE_AUTHOR("Josua Mayer <josua.mayer@jm0.eu>");
> +MODULE_DESCRIPTION("Battery driver for Netronix EC");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ntxec-battery");

I know there are a bunch of wrong examples in my subsystem, but the
proper way to do this is to drop this alias and instead add a
platform_device_id table together with MODULE_DEVICE_TABLE(platform, ...).
See for example cros_peripheral_charger.c

Greetings,

-- Sebastian

--sqik7oiq3dkakjj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlm6ZAACgkQ2O7X88g7
+pq9fg/9G9xfrQVyTahHnzobU36zUpcA4CWZCRUiREKpiVLJYXLaR3j6bhluf4cU
DUP7DBU5U+OqFxS6pLuPJUe4m92iy2t3YEGiSCxGUmf7Mss5z2UytzFl1aqaZzgX
UZeu6n073CtgPwILLykDZJq6dFDlVFVRS2JuN27XiqZy/rZ0XbE6YKna/HxLAHCo
MNPg0kjtfya69ULOtiTxk1PJqkyoq5k6D4A/2kEDtKBPAgj/fosghtJZAaepPLz+
5TrtBW0XeSMz1u0aKKvdyRWHM67NqTggXhxVa9R9gRVzaCAp9wUWmQBSHKgaXEGg
jTz4N3VJMtcFrPVMnE5J1TgKRZT68xJlgnmd3tX1Eby2SoiiBdzgzNwaILnoyDDL
fidH96UM9/lC8GlWM0FKeoY5xlWMcEbj8vogBRfO2XSfgAhGIaX8986QE7d6tMtW
K5A6LRfjtvpZCA6uSJK/Flw7MDZ+3z6bwL1WlLAjeVh4ubxU+aWjgQRgH381DjlO
FDqJgfQf3WCEMfmfhCpCeGQc7xRKcvL3U5ymJD2eh256p0XS47Oj2qzgQ+kr7KNQ
Bcp0IIypmebUyoo3xYaRIctevxdB++pFvFPBioCSHRjxH0nwaFBeel900VW2Yq04
qIweScg+GJjyzepFcjxN/CDE9pfLfW4yK+0lVz8pm0L4UxKp8yE=
=fqrB
-----END PGP SIGNATURE-----

--sqik7oiq3dkakjj4--

