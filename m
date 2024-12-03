Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9298BE6C60B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RobnTVBYLiaDMD8JmMIw8HC0/tWcGzmOm0rswY3UxM=; b=Mh2F8PdVe113s3rZjDCo7yQHbI
	/iQJfQcE21+k0uDCk97CA59kvgTtyET9Yw/ReB8pQBZbpmTIhy0JIOU8DiksGB0xestsm3U66jSCv
	GKLCwhjZgHip5/a6LUCUMnDYu4gnqeFes8FD/DYKTq4zFJ7KtXMipAkO00VXQHGvTPHgIIoxeduEz
	RL84uDqkQszc9zUOMxseG6uHQjIwU2pL/nbxzd0+xjk7lm9Xv9XypnzrxodmWdrGucD4Lq7rFvuAw
	Ja3BxHt1TNjx0lXIhez/RKNyXiLRifBndah1HmO8ZfsZPy3PEj9eJ/AHo7386TyDYtSe3RLeadxZD
	77wkAs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMj2-00000008Rdh-0Jq5;
	Tue, 03 Dec 2024 06:49:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMhF-00000008RMq-3uef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 06:47:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-382610c7116so3396298f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 22:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733208463; x=1733813263; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/RobnTVBYLiaDMD8JmMIw8HC0/tWcGzmOm0rswY3UxM=;
        b=AsvJG3bOSc/be9kZDpY73KGJSLJJa4H0T8AM/0bYufXBigxOV4lUp74gBiw2sEHZoR
         TfsIhHd4HFUJISb34D21DZ6iRPCNFbrdYgQX+P5i8VEFTW6AK3STVyErqU7f2VvRGdW+
         wsYlSTG0OHw+Rz+6emg9jcJ0DeSdEyu3QazBtyidBXLcoTSK1fuE5gkYOIRStqWvmads
         oNXZ1YDY1v0mXWDqOJbvL5uTTpDvflxtjDJwrA7IYEmdHR7u2nL+c5kTtLOfSq6eseny
         vKUZ1O1acqxONt6Z8mEW2vdvg/740v9w0tJ7CmODS/WsXWR5uIbpkx0uKo2eVL94aDNV
         fwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733208463; x=1733813263;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RobnTVBYLiaDMD8JmMIw8HC0/tWcGzmOm0rswY3UxM=;
        b=Jr5ghM/UB0o8MidlEk4CyIDk+NTBpmCtKPK800o1I95wvsw+i7ymd8FKX1w1LzIxfs
         HFZWjE7CsDJ/bdprJlDJaMorD7MJjhZyjeH9VxEmRjVwJiuey/fCkDoVN4KvE5riP3oV
         282iRg9xCiQK6q2YpzhTDaoV0XWSBGfNofO1t4EMRQ6ITe5opogYY8V5ggCfkKUXgUZB
         TY+FMTo3wJyuXQ0ommRXyZEzntlkGgn9N9ATAi6XXH8RkgEGCgFgYK8v3iVWi3E9RFh4
         hfQz0Hulo0a/QjLu0HhHTrz4BDc0Bp5AGfUsynk58qnaWbt95ly94lFXgnf9ymEzARlA
         rgMg==
X-Forwarded-Encrypted: i=1; AJvYcCX33pU7odnacBUYKWJsxPtvT0FrG7Jbo9+D4wGHAz+0Hpq6w/b2mnNGRAan0oP9e6y/Av64NwUCLZZheOkmKvwV@lists.infradead.org
X-Gm-Message-State: AOJu0YzaEdjvdVWWEdePfkCPcWkJ9yljsG6AMd3eNlTE9TVeDfC/qwAA
	WmD1GhYzq+V1rlSlRJ+9cZjWcOW0DBcvPnd3NeZfOfPnEI0SGBkfMO+91cjTkGrna3i7lCMH8bG
	e
X-Gm-Gg: ASbGnct5vr/rLUYUDm9MAxGOCvmwaBJYzmD+bDGehwnNYQE5YB0HLnxUbEX7vvg7Wfm
	ZjMaRblWFvOHarcxNV1ZOZpPwPdZ87/tJode2fElB7ZsMgTiWElG0fo2RugwtfC3MyrpP2rcTCU
	K5rLG5qC2m0vWIfjGZonj1cg0ezDqIT+xGMR2geGSLFE1ZlmoaOdmzoy/e1Sd1zm+LoZLll9Afx
	UzTj5gKAYzKV0KANEM0O2E9VmYHWMzVBw36afaeJKKKYzyCZwg8vus=
X-Google-Smtp-Source: AGHT+IFvIm1Cj+m9L3+8eoO1wguyNHK3N/D+YEl/HgW5fjyufsSwyyXyAHnmtnybYP0D7O4sZNMCrg==
X-Received: by 2002:a05:6000:1acd:b0:385:de67:2297 with SMTP id ffacd0b85a97d-385fd532bdcmr879010f8f.54.1733208463581;
        Mon, 02 Dec 2024 22:47:43 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e391656csm9296916f8f.47.2024.12.02.22.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:47:43 -0800 (PST)
Message-ID: <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 06:47:41 +0000
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_224746_024391_1333EE40 
X-CRM114-Status: GOOD (  32.56  )
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

Hi Thomas,

Thanks for looking into this!

> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> The Maxim max77759 fuel gauge has the same interface as the Maxim max1720=
x
> except for the non-volatile memory slave address which is not available.

It is not fully compatible, and it also has a lot more registers.

For example, the voltage now is not in register 0xda as this driver assumes=
.
With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0xda
doesn't exist in max77759

I haven't compared in depth yet, though.

> No slave is available at address 0xb of the i2c bus, which is coherent
> with the following driver from google: line 5836 disables non-volatile
> memory for m5 gauge.
>=20
> Link:
> https://android.googlesource.com/kernel/google-modules/bms/+/1a68c36bef47=
4573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
>=20
> Add support for the max77759 by allowing to use the non-volatile
> memory or not based on the chip. Value for RSense comes from the followin=
g
> stock devicetree:
>=20
> Link:
> https://android.googlesource.com/kernel/devices/google/gs101/+/33eca36d43=
da6c2b6a546806eb3e7411bbe6d60d/dts/gs101-raviole-battery.dtsi
>=20
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
> =C2=A0drivers/power/supply/max1720x_battery.c | 71 ++++++++++++++++++++++=
+++++-
> -----
> =C2=A01 file changed, 59 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/power/supply/max1720x_battery.c
> b/drivers/power/supply/max1720x_battery.c
> index
> 33105419e2427bb37963bda9948b647c239f8faa..faf336938dd4306dd2ceeb0a84b90ca=
8
> 0ad41a9f 100644
> --- a/drivers/power/supply/max1720x_battery.c
> +++ b/drivers/power/supply/max1720x_battery.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/nvmem-provider.h>
> =C2=A0#include <linux/power_supply.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/types.h>

Please keep file names in alphabetical order.

> =C2=A0
> =C2=A0#include <linux/unaligned.h>
> =C2=A0
> @@ -39,6 +40,7 @@
> =C2=A0#define MAX172XX_DEV_NAME_TYPE_MASK	GENMASK(3, 0)
> =C2=A0#define MAX172XX_DEV_NAME_TYPE_MAX17201	BIT(0)
> =C2=A0#define MAX172XX_DEV_NAME_TYPE_MAX17205	(BIT(0) | BIT(2))
> +#define MAX172XX_DEV_NAME_TYPE_MAX77759	0
> =C2=A0#define MAX172XX_QR_TABLE10		0x22
> =C2=A0#define MAX172XX_BATT			0xDA	/* Battery voltage */
> =C2=A0#define MAX172XX_ATAVCAP		0xDF
> @@ -46,6 +48,7 @@
> =C2=A0static const char *const max1720x_manufacturer =3D "Maxim Integrate=
d";
> =C2=A0static const char *const max17201_model =3D "MAX17201";
> =C2=A0static const char *const max17205_model =3D "MAX17205";
> +static const char *const max77759_model =3D "MAX77759";
> =C2=A0
> =C2=A0struct max1720x_device_info {
> =C2=A0	struct regmap *regmap;
> @@ -54,6 +57,21 @@ struct max1720x_device_info {
> =C2=A0	int rsense;
> =C2=A0};
> =C2=A0
> +struct chip_data {
> +	u16 default_nrsense; /* in regs in 10^-5 */
> +	u8 has_nvmem;
> +};
> +
> +static const struct chip_data max1720x_data=C2=A0 =3D {
> +	.default_nrsense =3D 1000,
> +	.has_nvmem =3D 1,
> +};
> +
> +static const struct chip_data max77759_data =3D {
> +	.default_nrsense =3D 500,
> +	.has_nvmem =3D 0,
> +};

This should be made a required devicetree property instead, at least for
max77759, as it's completely board dependent, 'shunt-resistor-micro-ohms'
is widely used.

I also don't think there should be a default. The driver should just fail
to probe if not specified in DT (for max77759).

> +
> =C2=A0/*
> =C2=A0 * Model Gauge M5 Algorithm output register
> =C2=A0 * Volatile data (must not be cached)
> @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(struct
> power_supply *psy,
> =C2=A0			val->strval =3D max17201_model;
> =C2=A0		else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX17205)
> =C2=A0			val->strval =3D max17205_model;
> +		else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX77759)
> +			val->strval =3D max77759_model;
> =C2=A0		else

This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MASK only
cares about the bottom 4 bits, the register is described as 'Firmware
Version Information'.

But maybe it's ok to do it like that, at least for now.

> =C2=A0			return -ENODEV;
> =C2=A0		break;
> @@ -416,7 +436,6 @@ static int max1720x_probe_nvmem(struct i2c_client
> *client,
> =C2=A0		.priv =3D info,
> =C2=A0	};
> =C2=A0	struct nvmem_device *nvmem;
> -	unsigned int val;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	info->ancillary =3D i2c_new_ancillary_device(client, "nvmem", 0xb)=
;
> @@ -438,6 +457,27 @@ static int max1720x_probe_nvmem(struct i2c_client
> *client,
> =C2=A0		return PTR_ERR(info->regmap_nv);
> =C2=A0	}
> =C2=A0
> +	nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> +	if (IS_ERR(nvmem)) {
> +		dev_err(dev, "Could not register nvmem!");
> +		return PTR_ERR(nvmem);
> +	}
> +
> +	return 0;
> +}
> +
> +static int max1720x_get_rsense(struct device *dev,
> +					 struct max1720x_device_info
> *info,
> +					 const struct chip_data *data)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	if (!data->has_nvmem) {
> +		info->rsense =3D data->default_nrsense;
> +		return 0;
> +	}
> +
> =C2=A0	ret =3D regmap_read(info->regmap_nv, MAX1720X_NRSENSE, &val);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(dev, "Failed to read sense resistor value\n");
> @@ -446,14 +486,9 @@ static int max1720x_probe_nvmem(struct i2c_client
> *client,
> =C2=A0
> =C2=A0	info->rsense =3D val;
> =C2=A0	if (!info->rsense) {
> -		dev_warn(dev, "RSense not calibrated, set 10 mOhms!\n");
> -		info->rsense =3D 1000; /* in regs in 10^-5 */
> -	}
> -
> -	nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> -	if (IS_ERR(nvmem)) {
> -		dev_err(dev, "Could not register nvmem!");
> -		return PTR_ERR(nvmem);
> +		dev_warn(dev, "RSense not calibrated, set %d mOhms!\n",
> +						data-
> >default_nrsense/100);
> +		info->rsense =3D data->default_nrsense;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -474,6 +509,7 @@ static int max1720x_probe(struct i2c_client *client)
> =C2=A0	struct device *dev =3D &client->dev;
> =C2=A0	struct max1720x_device_info *info;
> =C2=A0	struct power_supply *bat;
> +	const struct chip_data *data;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> @@ -488,9 +524,19 @@ static int max1720x_probe(struct i2c_client *client)
> =C2=A0		return dev_err_probe(dev, PTR_ERR(info->regmap),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap initialization failed\n");
> =C2=A0
> -	ret =3D max1720x_probe_nvmem(client, info);
> +	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, ret, "Failed to get chip
> data\n");
> +
> +	if (data->has_nvmem) {
> +		ret =3D max1720x_probe_nvmem(client, info);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to probe
> nvmem\n");
> +	}
> +
> +	ret =3D max1720x_get_rsense(dev, info, data);
> =C2=A0	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to probe
> nvmem\n");
> +		return dev_err_probe(dev, ret, "Failed to get RSense");
> =C2=A0
> =C2=A0	bat =3D devm_power_supply_register(dev, &max1720x_bat_desc,
> &psy_cfg);
> =C2=A0	if (IS_ERR(bat))
> @@ -501,7 +547,8 @@ static int max1720x_probe(struct i2c_client *client)
> =C2=A0}
> =C2=A0
> =C2=A0static const struct of_device_id max1720x_of_match[] =3D {
> -	{ .compatible =3D "maxim,max17201" },
> +	{ .compatible =3D "maxim,max17201", .data =3D (void *) &max1720x_data
> },
> +	{ .compatible =3D "maxim,max77759-fg", .data =3D (void *)
> &max77759_data},

missing space before }

Cheers,
Andre'

> =C2=A0	{}
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, max1720x_of_match);
>=20


