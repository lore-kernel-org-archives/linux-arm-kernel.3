Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0CBD6261F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyqVOa6s69CjgzVgN8BfaJxlh8wbJetzdCv2p81XMIY=; b=Yl7NhJeXyWKidjFnD/KBJt/upm
	/Ra2DJESJ+5XFLWllcIL95uXsbwx/pgC6ssoUtt1aqmwOb4MiboYymfEzFlJ6juGZmt0zVlFoH+25
	69xvWLbYBqloo20OGY+TdUa6CGuWsRBbVFWZRuff/PmYe7KFENPswHXjqDoYfK5jN05SMvVwD6N4Z
	8uZ/cJ1I63TK9vWgrKDn2kL87O6e8tXplWo+95Mivs88vkugmWcJ3EK5ex+tIizFTdp0ZtdXn2Qus
	r9fJwml7t4zw5ffm9nx2bhiyj6KqsaroEizQ/NGS2MHOlB+T+fn0MMgG5JGq4Cnxvg92SmM9boJNw
	he+XIppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuB9-000000075cT-3v2f;
	Thu, 22 Jan 2026 12:52:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuB6-000000075aq-2qNX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:52:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so9348145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 04:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769086365; x=1769691165; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eyqVOa6s69CjgzVgN8BfaJxlh8wbJetzdCv2p81XMIY=;
        b=kAzbkAoL5DXKR1aH+CpF40eboHfilvjwM+H6ZSY+jK6xleDqDcfyNgM0hJoYCqLLBZ
         pizWx4XcRUDpi6Z3g72HHKseSjGuXafYKDuVDnNKEFmHcDWQXOeBRya2eDkNnUAbOdCY
         ng3UFXNYgshp2uiyCL7bvEeXDTsfQemLqzY9nVIX2687pD3vu55nHF4fMWuYsASXsqDm
         4W9vN0AVa26zPB23nQ1AdqjZT3ZhZyy3LnDpqItFThq8qphvQkjUZeRRxFjuEPW1MSqb
         +7baG7Vs2VCE9MfdXx+amsbEaGFFg61GW1MjCHQFgBRBsd95HIW1AAb8VleZpLYWvQYD
         M+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769086365; x=1769691165;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyqVOa6s69CjgzVgN8BfaJxlh8wbJetzdCv2p81XMIY=;
        b=ocWUaRbUGI4t+k4hfawliCdDXkg0uPxMWJw7PEUu6aebSbBzZoRNvFjxS7V449Mv0c
         iJLjbVUDnZZ0NGyMyG20jjnZIsve7qtl7Le4OhRzkdzmrMXnHk4DrnXFX9m8E0jrBOm2
         9Bg6ndVBWg+FxQSGAsg9l1x7wPYOlA/1vyhjLtkjUcZ+iHuWCiIxcwJMUWqsHk+8mJqh
         1oDdirL1BIFGyTR4EQTTlaIomB1pvznmW/sVUOjzQBejKsw8UirAKB7b8CjOWXw4Ohi5
         I9HSY5u5cuNP2iMRFX/Z8W3SFrR12NLA+PyFd8GRfrEl/dVPKKwfwFtlEf9mmM0b8cc/
         6vIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWGXOkRfhtEje21fGz5qbGgJE4bFX+EV7Sdg1QzsE72pklMI77dIGUERVaI37W+dWOiIev1mw1S+jExnzJUzk7@lists.infradead.org
X-Gm-Message-State: AOJu0YzijzPWZITVqdE1LA/CtlV4Xzx08yrmLPNv4cuSiw1jdYGA3gj1
	90X6Bx5W8ckpKmB9AA8DZw0+AP+yIEZSA2YMJFxFofGvtJqBa012t+xZK8+d0us9Uh0=
X-Gm-Gg: AZuq6aIXXgmxKwTg6gQpns43pbVSmkrmFz2IWArB7g03s27AD9gwrYV2NlI8nwEliSb
	RNDpG9kgxf7qf+DdcUQRf1AvpI+8b+dGyUi/Re9iLq5xsx518dkLyrYxVy6Vp6Cz4q+R94WFA4m
	fl6+72WMdmx5ioDUio++3EnazMqdPWlwJZK4/3KduQmyaKr6JN2wMmV082DOguL5K67/NGHljya
	Dp3RyW6lzbyXTCJqF30T9U6B2ZuNQ1kmRrYK78DchirAmqZYNt2O9mebZBqIR5svyX8Yy7Laeqn
	ER1kWtAIxFHYOhLXlnPJYEgU9l854zcWl6f2d7CnJl+6+VfzlCytLk79g3U++gxxGIw56EUVeoR
	nV2FtwE8sJzHoe94C11T3/ZHk1LOqXPwKjEAgjpCO9nIf/l99zY51X/75EhRbzmGrZAFzgxGuTz
	EsvO2UdlkAVOFkFM66Qg==
X-Received: by 2002:a05:600d:6450:10b0:477:58af:a91d with SMTP id 5b1f17b1804b1-480215e1ad9mr230076045e9.5.1769086365383;
        Thu, 22 Jan 2026 04:52:45 -0800 (PST)
Received: from draszik.lan ([212.129.87.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804706f351sm70589485e9.14.2026.01.22.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:52:45 -0800 (PST)
Message-ID: <606f3de66ec16accfb82d4ea77d0ca9b7e8790d8.camel@linaro.org>
Subject: Re: [PATCH v4 4/5] power: supply: max77759: add charger driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Thu, 22 Jan 2026 12:52:44 +0000
In-Reply-To: <71d816c5ed4ee2d13ec63b8fd4acd49f4e418284.camel@linaro.org>
References: <20260121-max77759-charger-v4-0-694234c8ded1@google.com>
		 <20260121-max77759-charger-v4-4-694234c8ded1@google.com>
	 <71d816c5ed4ee2d13ec63b8fd4acd49f4e418284.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_045248_815389_BC26D5B3 
X-CRM114-Status: GOOD (  39.10  )
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

On Thu, 2026-01-22 at 12:47 +0000, Andr=C3=A9 Draszik wrote:
> Hi Amit,
>=20
> Thanks for your patches, just a few minor comments below.
>=20
> On Wed, 2026-01-21 at 00:59 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> > From: Amit Sunil Dhamne <amitsd@google.com>
> >=20
> > Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
> > Li+/LiPoly dual input switch mode charger. While the device can support
> > USB & wireless charger inputs, this implementation only supports USB
> > input. This implementation supports both buck and boost modes.
> >=20
> > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> > =C2=A0drivers/power/supply/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
> > =C2=A0drivers/power/supply/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/power/supply/max77759_charger.c | 737 +++++++++++++++++++=
+++++++++++++
> > =C2=A04 files changed, 755 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0d044a58cbfe0f2b97f3682a86708e1ece108e9f..38354964a85c34611b1b54e=
20651b360f3b9c11e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15546,6 +15546,12 @@ F:	drivers/mfd/max77759.c
> > =C2=A0F:	drivers/nvmem/max77759-nvmem.c
> > =C2=A0F:	include/linux/mfd/max77759.h
> > =C2=A0
> > +MAXIM MAX77759 BATTERY CHARGER DRIVER
> > +M:	Amit Sunil Dhamne <amitsd@google.com>
> > +L:	linux-kernel@vger.kernel.org
> > +S:	Maintained
> > +F:	drivers/power/supply/max77759_charger.c
> > +
> > =C2=A0MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
> > =C2=A0M:	Javier Martinez Canillas <javier@dowhile0.org>
> > =C2=A0L:	linux-kernel@vger.kernel.org
> > diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfi=
g
> > index 92f9f7aae92f249aa165e68dbcd4cebb569286ea..3a2cdb95c98e44324151ac2=
b86d740ae2923ee77 100644
> > --- a/drivers/power/supply/Kconfig
> > +++ b/drivers/power/supply/Kconfig
> > @@ -631,6 +631,17 @@ config CHARGER_MAX77705
> > =C2=A0	help
> > =C2=A0	=C2=A0 Say Y to enable support for the Maxim MAX77705 battery ch=
arger.
> > =C2=A0
> > +config CHARGER_MAX77759
> > +	tristate "Maxim MAX77759 battery charger driver"
> > +	depends on MFD_MAX77759 && REGULATOR
> > +	default MFD_MAX77759
> > +	help
> > +	=C2=A0 Say M or Y here to enable the MAX77759 battery charger. MAX777=
59
> > +	=C2=A0 charger is a function of the MAX77759 PMIC. This is a dual inp=
ut
> > +	=C2=A0 switch-mode charger. This driver supports buck and OTG boost m=
odes.
> > +
> > +	=C2=A0 If built as a module, it will be called max77759_charger.
> > +
> > =C2=A0config CHARGER_MAX77976
> > =C2=A0	tristate "Maxim MAX77976 battery charger driver"
> > =C2=A0	depends on I2C
> > diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makef=
ile
> > index 4b79d5abc49a7fd1e37a26d0c89f94d9fe3a916f..6af905875ad5e3b393a7030=
405355b9a975870f6 100644
> > --- a/drivers/power/supply/Makefile
> > +++ b/drivers/power/supply/Makefile
> > @@ -128,3 +128,4 @@ obj-$(CONFIG_CHARGER_SURFACE)	+=3D surface_charger.=
o
> > =C2=A0obj-$(CONFIG_BATTERY_UG3105)	+=3D ug3105_battery.o
> > =C2=A0obj-$(CONFIG_CHARGER_QCOM_SMB2)	+=3D qcom_smbx.o
> > =C2=A0obj-$(CONFIG_FUEL_GAUGE_MM8013)	+=3D mm8013.o
> > +obj-$(CONFIG_CHARGER_MAX77759)	+=3D max77759_charger.o
> > diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/su=
pply/max77759_charger.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..34b5ea0967eb7b4716e81ee=
1a55227ac872493b0
> > --- /dev/null
> > +++ b/drivers/power/supply/max77759_charger.c
> > @@ -0,0 +1,737 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * max77759_charger.c - Battery charger driver for MAX77759 charger de=
vice.
> > + *
> > + * Copyright 2025 Google LLC.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/devm-helpers.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/math64.h>
> > +#include <linux/mfd/max77759.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/power_supply.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/string_choices.h>
> > +
> > +/* Default values for Fast Charge Current & Float Voltage */
> > +#define CHG_CC_DEFAULT_UA			2266770
> > +#define CHG_FV_DEFAULT_MV			4300
> > +
> > +#define FOREACH_IRQ(S)			\
> > +	S(AICL),			\
> > +	S(CHGIN),			\
> > +	S(CHG),				\
> > +	S(INLIM),			\
> > +	S(BAT_OILO),			\
> > +	S(CHG_STA_CC),			\
> > +	S(CHG_STA_CV),			\
> > +	S(CHG_STA_TO),			\
> > +	S(CHG_STA_DONE)
> > +
> > +#define GENERATE_ENUM(e)		e
> > +#define GENERATE_STRING(s)		#s
> > +
> > +enum {
> > +	FOREACH_IRQ(GENERATE_ENUM)
> > +};
> > +
> > +static const char *const chgr_irqs_str[] =3D {
> > +	FOREACH_IRQ(GENERATE_STRING)
> > +};
> > +
> > +#define NUM_IRQS			ARRAY_SIZE(chgr_irqs_str)
> > +
> > +struct max77759_charger {
> > +	struct device *dev;
> > +	struct regmap *regmap;
> > +	struct power_supply *psy;
> > +	struct regulator_dev *chgin_otg_rdev;
> > +	struct notifier_block nb;
> > +	struct power_supply *tcpm_psy;
> > +	struct work_struct psy_work;
> > +	int irqs[NUM_IRQS];
> > +	struct mutex lock; /* protects the state below */
> > +	enum max77759_chgr_mode mode;
> > +};
> > +
> > +static inline int regval_to_val(int reg, int reg_offset, int step, int=
 minval)
> > +{
> > +	return ((reg - reg_offset) * step) + minval;
> > +}
> > +
> > +static inline int val_to_regval(int val, int minval, int step, int reg=
_offset)
> > +{
> > +	s64 dividend;
> > +
> > +	if (unlikely(step =3D=3D 0))
> > +		return reg_offset;
>=20
> Does it really make an impact on performance to specify unlikely? Also, I=
 seem to
> remember that the if branch is treated as unlikely anyway, but can't find=
 any hard
> evidence on that right now.
>=20
> > +
> > +	dividend =3D (s64)val - minval;
> > +	return DIV_S64_ROUND_CLOSEST(dividend, step) + reg_offset;
> > +}
>=20
> For these two functions above, have you considered using the APIs from
> include/linux/linear_range.h instead of duplicating in this driver? The
> implementations of the above match linear_range_get_value() and
> linear_range_get_selector_low() quite nicely.
>=20
> > +
> > +static inline int unlock_prot_regs(struct max77759_charger *chg, bool =
unlock)
> > +{
> > +	return regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_06,
> > +				=C2=A0 MAX77759_CHGR_REG_CHG_CNFG_06_CHGPROT, unlock
> > +				=C2=A0 ? MAX77759_CHGR_REG_CHG_CNFG_06_CHGPROT : 0);
> > +}
> > +
>=20
> [...]
>=20
> > +static irqreturn_t irq_handler(int irq, void *data)
> > +{
> > +	struct max77759_charger *chg =3D data;
> > +	struct device *dev =3D chg->dev;
> > +	int i;
> > +
> > +	for (i =3D 0; i < NUM_IRQS && chg->irqs[i] !=3D irq; i++)
> > +		;
> > +
> > +	if (i =3D=3D NUM_IRQS) {
> > +		dev_err(dev, "Unable to handle irq=3D%d", irq);
> > +		return IRQ_NONE;
> > +	} else if (i =3D=3D BAT_OILO) {
> > +		dev_warn(dev, "Battery over-current threshold crossed");
> > +	}
>=20
> Generally, no 'else' is required after return.
>=20
> > +
> > +	power_supply_changed(chg->psy);
> > +	return IRQ_HANDLED;
> > +}
> > +
>=20
> [...]
>=20
> > +static void psy_work_item(struct work_struct *work)
> > +{
> > +	struct max77759_charger *chg =3D
> > +		container_of(work, struct max77759_charger, psy_work);
> > +	union power_supply_propval current_limit, online;
> > +	int ret;
> > +
> > +	ret =3D power_supply_get_property(chg->tcpm_psy,
> > +					POWER_SUPPLY_PROP_CURRENT_MAX,
> > +					&current_limit);
> > +	if (ret) {
> > +		dev_err(chg->dev,
> > +			"Failed to get CURRENT_MAX psy property, ret=3D%d",
> > +			ret);
> > +		return;
> > +	}
> > +
> > +	ret =3D power_supply_get_property(chg->tcpm_psy, POWER_SUPPLY_PROP_ON=
LINE,
> > +					&online);
> > +	if (ret) {
> > +		dev_err(chg->dev,
> > +			"Failed to get ONLINE psy property, ret=3D%d",
> > +			ret);
> > +		return;
> > +	}
> > +
> > +	if (online.intval && current_limit.intval) {
> > +		ret =3D set_input_current_limit(chg, current_limit.intval);
> > +		if (ret)
> > +			dev_err(chg->dev,
> > +				"Unable to set current limit, ret=3D%d", ret);
> > +
> > +		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON);
> > +	} else {
> > +		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
> > +	}
>=20
> For all the possible errors in this function, should the driver try a bit
> harder, even if unlikely to occur? What if the current limit needed to be
> reduced, e.g. due to thermal or any other reasons?
>=20
> Could rescheduling the work be something to consider?
>=20
> > +}
> > +
> > +static int psy_changed(struct notifier_block *nb, unsigned long evt, v=
oid *data)
> > +{
> > +	struct max77759_charger *chg =3D container_of(nb, struct max77759_cha=
rger,
> > +						=C2=A0=C2=A0=C2=A0 nb);
> > +	const char *psy_name =3D "tcpm-source";
>=20
> This can be static const char.
>=20
> > +	struct power_supply *psy =3D data;
> > +
> > +	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)) ||
> > +	=C2=A0=C2=A0=C2=A0 evt !=3D PSY_EVENT_PROP_CHANGED)
> > +		return NOTIFY_OK;
> > +
> > +	chg->tcpm_psy =3D psy;
> > +	schedule_work(&chg->psy_work);
> > +
> > +	return NOTIFY_OK;
> > +}
> > +
> > +static void max_tcpci_unregister_psy_notifier(void *nb)
> > +{
> > +	power_supply_unreg_notifier(nb);
> > +}
> > +
> > +static int max77759_charger_probe(struct platform_device *pdev)
> > +{
> > +	struct regulator_config chgin_otg_reg_cfg;
> > +	struct power_supply_config psy_cfg;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct max77759_charger *chg;
> > +	int ret;
> > +
> > +	device_set_of_node_from_dev(dev, dev->parent);
> > +	chg =3D devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
> > +	if (!chg)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, chg);
> > +	chg->dev =3D dev;
> > +	chg->regmap =3D dev_get_regmap(dev->parent, "charger");
> > +	if (!chg->regmap)
> > +		return dev_err_probe(dev, -ENODEV, "Missing regmap");
> > +
> > +	ret =3D devm_mutex_init(dev, &chg->lock);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to initialize lock");
> > +
> > +	psy_cfg.fwnode =3D dev_fwnode(dev);
> > +	psy_cfg.drv_data =3D chg;
> > +	chg->psy =3D devm_power_supply_register(dev, &max77759_charger_desc,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &psy_cfg);
> > +	if (IS_ERR(chg->psy))
> > +		return dev_err_probe(dev, -EPROBE_DEFER,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to register psy, ret=3D%ld",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(chg->psy));
> > +
> > +	ret =3D max77759_charger_init(chg);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to initialize max77759 charger");
> > +
> > +	chgin_otg_reg_cfg.dev =3D dev;
> > +	chgin_otg_reg_cfg.driver_data =3D chg;
> > +	chgin_otg_reg_cfg.of_node =3D dev_of_node(dev);
> > +	chg->chgin_otg_rdev =3D devm_regulator_register(dev, &chgin_otg_reg_d=
esc,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &chgin_otg_reg_cfg);
> > +	if (IS_ERR(chg->chgin_otg_rdev))
> > +		return dev_err_probe(dev, PTR_ERR(chg->chgin_otg_rdev),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to register chgin otg regulator")=
;
> > +
> > +	ret =3D devm_work_autocancel(dev, &chg->psy_work, psy_work_item);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to initialize psy work");
> > +
> > +	chg->nb.notifier_call =3D psy_changed;
> > +	ret =3D power_supply_reg_notifier(&chg->nb);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Unable to register psy notifier");
> > +
> > +	ret =3D devm_add_action_or_reset(dev, max_tcpci_unregister_psy_notifi=
er,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &chg->nb);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to add devm action to unregister =
psy notifier");
> > +
> > +	return max77759_init_irqhandler(chg);
> > +}
> > +
> > +static const struct platform_device_id max77759_charger_id[] =3D {
> > +	{"max77759-charger",},
>=20
> Minor formatting nit - I believe common practice is to use named initiali=
zers:
>=20
> +	{ .compatible =3D "max77759-charger", },

.name of course for platform_device_id

A.

>=20
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(platform, max77759_charger_id);
> > +
> > +static struct platform_driver max77759_charger_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "max77759-charger",
>=20
> Can it be async, or are there issues with that?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>=20
>=20
> Thanks again Amit!
>=20
> Cheers,
> Andre'
>=20
> > +	},
> > +	.probe =3D max77759_charger_probe,
> > +	.id_table =3D max77759_charger_id,
> > +};
> > +module_platform_driver(max77759_charger_driver);
> > +
> > +MODULE_AUTHOR("Amit Sunil Dhamne <amitsd@google.com>");
> > +MODULE_DESCRIPTION("Maxim MAX77759 charger driver");
> > +MODULE_LICENSE("GPL");

