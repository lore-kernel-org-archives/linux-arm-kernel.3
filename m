Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A2CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9raa4UnWp7S98pmKgOEBKVBBsQu0EJl6gJVzoGdYgQ=; b=ujzvWoA5PN8b1spI0KpEnXhxbz
	seG/A3x3VB3PDGnSEkIxiT+pejwzwO4gcJjtRpF+f/fpD+NiKwQAdxcpXfQWM4z19selww0RrF6B1
	9wijqXbPO+l6nPeJYQopuCDo+5krLyCCXOy8DnvBbgoy8sAOs6Qp+O7uUgKPi3FuqbEzFInPvxfh9
	kVvBqOQDof690C427Nth76s5DuaaiiO4cV6SwhuT1Ho5AhUI/o4Ryi0LcIRTfkrXhD8iWTpZnBf8w
	Et8gGFKg2rI5i4aCbAkzJsYNL64e2qXdi7XpUDiSLk5bYVIKhhMTvmJJV93EXfFifJvbqGiETR18Q
	DjO4dnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1la-00000008p8m-1KY0;
	Fri, 12 Sep 2025 11:16:34 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1lX-00000008p7k-3uQo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:16:33 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-621c69d767aso142025eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757675791; x=1758280591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9raa4UnWp7S98pmKgOEBKVBBsQu0EJl6gJVzoGdYgQ=;
        b=Zukutgs7KUMiAarSu0Z2eurz3y8mv4YdSBQ01r7QVdhD3r8uTZLLDv92KuZAEyBHNt
         6LBcKsC8lYQE9ZmOogFtvgxaAW3tkavh7ykRUC2SYxsyUxAwLzShEz9XZ/+2Pguy6lXt
         4pm/vrgXvnT44AUop7zi8GlHJfB/NUnPj2NWBkE4GEHHipkRxEYjZ5VgfrYwtF4D87iJ
         kn0GcWZJhvNO48a3MHQE4JaHXZPy5UZ9QQaQcdY2rsDtACcq8Xd+RUceBT9Y58p407ex
         nvc9JPPN7FoVlTPhmfKMSAGclTVWThIKwvv22QKxNhl2C1AbOVk+ZkslQvSOWJpLTxjw
         lnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675791; x=1758280591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9raa4UnWp7S98pmKgOEBKVBBsQu0EJl6gJVzoGdYgQ=;
        b=TUOiAJ0nH4TOEMqDbKaVcTk3WApcQLzajheJKbt0IlomT0dTfTsAeTwtehTEAPZ+nH
         t4nHQC185c5g2EUXG54aUbrw4sadKueES/ymvDlYyj7dY/QBTedP1YjpF3GcjkmSztEV
         23Tdw/BAjxaAPXRSsvxFnzLSa01t4RQoPm2n0DG8bfmwDxhuhHoKCCt3aW0/oxMrEAai
         86iw7ujVJ7da5zAYC2N/kfSvJ1jSrIgXRW1SvW0C7vgaUG+Oqt74MFuU0XsKeZzBgzjC
         pnTdVLoGlADefRpboRGVH9WuEgqc4s7IO5XTLVISYN4+3TCO9GcVd1o8k/sY6e8C5oDD
         h2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnOpHdAH7+QPsXwMO8fOoQ1o3AQ4QCLboYNF5ExosY57T3WKBh0TLqBzR06sq/SXyKXF4IIiepwk1Ef2sqyLCo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv+WKx5o9PnIw8ANlSr8JcQj73TFuUpjhzRhoNVA0xYopj0m03
	HAKXhwZkbXrgbtGjvUqqFcN4Z1Lse8gIko+voCjfMKPjjXECHoFGPgF84psT1E6xssQ69IHnhRy
	uCnVVNmgnIH4P42CqKnZbqEV+HAXOWqPyjWHroQwm3g==
X-Gm-Gg: ASbGnctSS5hqWR7P/Z15bbVZavlfr5/aIpkyXsdTR3GMKunQ6/NAXyY3DKHASpz0ReI
	QZAuzoae/jj+oT42YiBxvStr/GoKafsZ2RvpAYqVV3Jl+o426sICjd6s1dtKpcuizl/URPyIT/3
	lljS6GavtwOBMuEGZ9oN4v3PzhXttWuK7yPLO4qof3cejMpaOYapnszInlTr48y6UE33tY8ngZA
	gA3+kP7lSSZc6nPzVjdlPGSiqGp
X-Google-Smtp-Source: AGHT+IF+6KDhxF/Nv9wIPe93Lse4duQguZZlNPVnH8YGAzn5f8KKXL2caupjcfX/resj9T72psSu60bapr4zRsCqOX4=
X-Received: by 2002:a05:6808:1a1e:b0:439:40ed:1927 with SMTP id
 5614622812f47-43b8da9120amr1190971b6e.51.1757675790664; Fri, 12 Sep 2025
 04:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be> <20250804-b4-gs101_max77759_fg-v5-1-03a40e6c0e3d@uclouvain.be>
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-1-03a40e6c0e3d@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 12:16:19 +0100
X-Gm-Features: Ac12FXyOFnYMp2b4OuaR1npoXk0x3GKafYhZlOCgGWPVm0PFMJpZl8toEpgiLuo
Message-ID: <CADrjBPqe6JsT_yKTazRn-Ro2V4ZHQ1=6LX304CyVxgzLBqXrew@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] power: supply: add support for MAX77759 fuel gauge
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_041631_999502_5C05B67B 
X-CRM114-Status: GOOD (  43.14  )
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

Thanks for your patch, and working on this!

On Mon, 4 Aug 2025 at 15:25, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> The Maxim MAX77759 is a PMIC used in gs101-oriole and gs101-raven
> (Google Pixel 6 and 6 Pro). It contains a fuel gauge on a separate
> I2C address. Add basic support for this fuel gauge. The driver is
> based on the driver for the MAX17201 and MAX17205 which also use
> the MAX M5 fuel gauge. There is a lot of common between the two

small nit: "in common"                             ^^^^^^

> devices with some key differences. The main one is the lack of nvmem
> in the fuel gauge of the MAX77759.
>
> The initialization of the chip is very basic and mostly hardcoded.
> Loading the model of the fuel gauge is not implemented here.
>
> On both gs101-oriole and gs101-raven, the same EEPROM as for the
> battery id is used to backup some of the state of the fuel gauge.
> Use a standard nvmem binding to access this data. The CRC8 is
> computed to allow to go from linux to a stock android without
> apparent data corruption. If other devices using the MAX77759 are
> found/created, a similar nvmem layout should be made or the driver
> should be extended to support those devices.
>
> The current, capacity, temperature and charge have all been tested.
> The charge full design and capacity equal the ones seen on android,
> the ratio between average charge and average current does predict
> pretty accurately the time to empty under a constant workload and
> temperature is coherent with the dynamic state of the device.
>
> Health is not enabled as it always reports overheating. The time to
> empty is wrong by about a factor 2. The voltage reporting is
> correct when using VCELL (which reports the lowest voltage of all
> cells) when considering that the device is connected to a single
> cell. It could be enabled by either confirming that the device is
> connected to a single cell or finding an alternative reporting mean.
>
> Modifications have been made to it since but the regmap was
> originally proposed by Andr=C3=A9 Draszik in
>
> Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e455a11=
6.camel@linaro.org/
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
>  drivers/power/supply/Kconfig            |  14 +
>  drivers/power/supply/Makefile           |   1 +
>  drivers/power/supply/max77759_battery.c | 649 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 664 insertions(+)
>
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 79ddb006e2dad6bf96b71ed570a37c006b5f9433..147d049b836c3fbb24b762dba=
f31eebb8ba041f7 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -458,6 +458,20 @@ config BATTERY_MAX1721X
>           Say Y here to enable support for the MAX17211/MAX17215 standalo=
ne
>           battery gas-gauge.
>
> +config BATTERY_MAX77759
> +       tristate "Maxim Integrated MAX77759 Fuel Gauge"
> +       depends on I2C
> +       select REGMAP_I2C
> +       help
> +         Say yes to enable support for the Fuel gauge of the Maxim Integ=
rated
> +         MAX77759. It is a companion Power Management IC for USB Type-C
> +         applications with Battery Charger, Fuel Gauge, temperature sens=
ors,
> +         USB Type-C Port Controller (TCPC), NVMEM, and additional GPIO
> +         interfaces.
> +
> +         To compile this driver as module, choose M here: the
> +         module will be called max77759_fg.
> +
>  config BATTERY_TWL4030_MADC
>         tristate "TWL4030 MADC battery driver"
>         depends on TWL4030_MADC
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefil=
e
> index 4f5f8e3507f80da02812f0d08c2d81ddff0a272f..114578fa4fd08356822f13ce1=
fbad29923defad8 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_BATTERY_MAX17040)        +=3D max17040_bat=
tery.o
>  obj-$(CONFIG_BATTERY_MAX17042) +=3D max17042_battery.o
>  obj-$(CONFIG_BATTERY_MAX1720X) +=3D max1720x_battery.o
>  obj-$(CONFIG_BATTERY_MAX1721X) +=3D max1721x_battery.o
> +obj-$(CONFIG_BATTERY_MAX77759) +=3D max77759_battery.o
>  obj-$(CONFIG_BATTERY_RT5033)   +=3D rt5033_battery.o
>  obj-$(CONFIG_CHARGER_RT5033)   +=3D rt5033_charger.o
>  obj-$(CONFIG_CHARGER_RT9455)   +=3D rt9455_charger.o
> diff --git a/drivers/power/supply/max77759_battery.c b/drivers/power/supp=
ly/max77759_battery.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d8d702af607211e391733cd14=
323698b54be734c
> --- /dev/null
> +++ b/drivers/power/supply/max77759_battery.c
> @@ -0,0 +1,649 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Fuel gauge driver for Maxim 777759
> + *
> + * based on max1720x_battery.c
> + *
> + * Copyright (C) 2024 Liebherr-Electronics and Drives GmbH
> + */
> +

[..]

> +       switch (psp) {
> +       case POWER_SUPPLY_PROP_PRESENT:
> +               /*
> +                * POWER_SUPPLY_PROP_PRESENT will always readable via
> +                * sysfs interface. Value return 0 if battery not
> +                * present or unaccesable via I2c.

small nit: inaccessible      ^^^^^^

> +                */
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_STATUS, &re=
g_val);
> +               if (ret < 0) {
> +                       val->intval =3D 0;
> +                       return 0;
> +               }
> +
> +               val->intval =3D !FIELD_GET(MAX77759_FG_STATUS_BAT_ABSENT,=
 reg_val);
> +               break;
> +       case POWER_SUPPLY_PROP_CAPACITY:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_REPSOC, &re=
g_val);
> +               val->intval =3D max77759_fg_percent_to_ps(reg_val);
> +               break;
> +       case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_DESIGN_CAP,=
 &reg_val);
> +               if (ret < 0)
> +                       return ret;
> +
> +               val->intval =3D max77759_fg_capacity_to_ps(reg_val, info)=
;
> +               ret =3D max77759_fg_capacity_lsb(info, &reg_val);
> +               val->intval *=3D reg_val;
> +               break;
> +       case POWER_SUPPLY_PROP_CHARGE_AVG:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_REPCAP, &re=
g_val);
> +               if (ret < 0)
> +                       return ret;
> +
> +               val->intval =3D max77759_fg_capacity_to_ps(reg_val, info)=
;
> +               ret =3D max77759_fg_capacity_lsb(info, &reg_val);
> +               val->intval *=3D reg_val;
> +               break;
> +       case POWER_SUPPLY_PROP_TEMP:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_TEMP, &reg_=
val);
> +               val->intval =3D max77759_fg_temperature_to_ps(reg_val);
> +               break;
> +       case POWER_SUPPLY_PROP_CURRENT_NOW:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_CURRENT, &r=
eg_val);
> +               val->intval =3D max77759_fg_current_to_voltage(reg_val) /=
 info->rsense;
> +               break;
> +       case POWER_SUPPLY_PROP_CURRENT_AVG:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_AVG_CURRENT=
, &reg_val);
> +               val->intval =3D max77759_fg_current_to_voltage(reg_val) /=
 info->rsense;
> +               break;
> +       case POWER_SUPPLY_PROP_CHARGE_FULL:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_FULL_CAP, &=
reg_val);
> +               if (ret < 0)
> +                       return ret;
> +
> +               val->intval =3D max77759_fg_capacity_to_ps(reg_val, info)=
;
> +               ret =3D max77759_fg_capacity_lsb(info, &reg_val);
> +               val->intval *=3D reg_val;
> +               break;
> +       case POWER_SUPPLY_PROP_MODEL_NAME:
> +               ret =3D regmap_read(info->regmap, MAX77759_FG_DEV_NAME, &=
reg_val);
> +               if (ret < 0)
> +                       return ret;
> +
> +               reg_val =3D FIELD_GET(MAX77759_FG_DEV_NAME_TYPE_MASK, reg=
_val);
> +               if (reg_val =3D=3D MAX77759_FG_DEV_NAME_TYPE)
> +                       val->strval =3D max77759_fg_model;
> +               else
> +                       return -ENODEV;
> +               break;
> +       case POWER_SUPPLY_PROP_MANUFACTURER:
> +               val->strval =3D max77759_fg_manufacturer;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +static int max77759_fg_init(struct device *dev,
> +                           struct max77759_fg_device_info *info,
> +                           struct power_supply *bat_psy)
> +{
> +       struct max77759_fg_state_save *state;
> +       struct power_supply_battery_info *bat_info;
> +       struct nvmem_cell *cell;
> +       unsigned int val;
> +       int ret;
> +       size_t len;
> +
> +       power_supply_get_battery_info(bat_psy, &bat_info);

Should check the return code here and exit if not present as if the
battery info is missing in DT it will crash in max77759_fg_init().

With that addressed:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

I think there was also some feedback from Krysztof on the binding, but
aside from that I think Sebastian was ready to queue this.

regards,

Peter

