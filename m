Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D44AC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubB85xiyakrTzqYeahwIzAhiIGVtm8XPMhOV+rPyXOM=; b=H4c5KWBEQFavTdadhivCqpthpg
	sygzfe9m7U+5ReSDQ2jXFUyVUX2kp6OPN52p6UGGWRYXxLtn9L34Dpg+KkDaTs1cmPBe53wMgpXTq
	Qq7vW6Q/R4oh35URTCQlNRRUg6H2xsXS5thQynS13q0B3ZCobGakCX/8vlIteW+jVNdMeXaWMCQeo
	53UEoXKShBEqvEDZT6dCSOxvw8rq94XVf26oW3TrtN3SrTT4lE3VoXl7FcY5WymoEnQ9uBTzEWuRb
	Y6calpHVq+csFoOccxk8DIsxfoOIqXQKl/UefJV+UTxeV1RdtfIS1pGycLQ6gr9O2kmGKzfRsKl4R
	tPI/XhKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNAq-000000082zM-2jYl;
	Wed, 26 Mar 2025 09:35:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txN96-000000082lc-26tF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:34:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso29949525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742981639; x=1743586439; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ubB85xiyakrTzqYeahwIzAhiIGVtm8XPMhOV+rPyXOM=;
        b=K1ddxedmilvgjQBd2fHIh+TZmQixaGApYMi2eInCWjys3ZAWb2XQDRVB6/LEwJDNYw
         ac8195VBmVT4ZJk7xFqAkoT72/unnHrTNBnfh5qqtfoElk+k7t5qLit84IbACGGFOnTb
         GeZLfZRYpu8phgGicPIhQGg05uOB3YahDNyXh/bZDrC0B3w+qntCHAy4bnEq2hSSJVC3
         sKEZRTf6ENMZ59XZjuYJOJBcJlfeKVwp6Xlfnax7wASxLVnpnjlpif3YfgRIWa1UtJho
         zXGp+prbRpTmfOM2iuWLVSJxuq8PLLOuDzdqScBBm5fYRpqh6qcnB+/5dmXinLagGK95
         heDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981639; x=1743586439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubB85xiyakrTzqYeahwIzAhiIGVtm8XPMhOV+rPyXOM=;
        b=lpyywgrhrnNamlDiQw/wfPaz8LxBw3IxgeIyFRH18RXr1EaJhVW0isqoUj57nxj4FT
         5Ogx7z/9e5P7AKyPPWeujY8GdwA/yjsT972fYa2tCkgsoEOKHO7AF0gZTdkxhvu17DHz
         IgjZ1GPNTCxFMZhbsjT6y5RfsVuS1JiD+/309P16wUyGDdV22G+GgA7MHRouw+dvLuUK
         a6g2reXeak6JFWjb2tuDsiKTapyF+iFFjKFzMX0g0oBwW5nFhgPwMXSMtB/Xxz0oWxtC
         s71gYCeKdubT2yue+CFhCx003bixqG8Va683HYGrdaxYYnwfoF9PiUmgcB4Ca5DgJJ+P
         Be6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgt+f3VtaWRU3ClYWBzN0dA3pddGj4lJJ84fFXdm0TLUzWdDBUUBnbepnSho0j/TslntSvvUTWYS7OcesBXe7c@lists.infradead.org
X-Gm-Message-State: AOJu0YyhqSbwgmY+3hWDRKMqEipHqS69h7guJs87fHeeX+J2t5Jmyh77
	Iyqfcez1lvNBA9sxep0QZoou3nbdJX+VUpbcPwj7mV+iA+vlfEt85zUqlMd0HCY=
X-Gm-Gg: ASbGncuibKhtfDOLLxLJhYZ82p1afUSTJKWTRpxVAZNpTTf4nDPgaCB3CNtx6E1OtTo
	BD1ktkTejwfKCtY4BpzEhH9jKtnKJFIPtSwN9co0tMfaVE/n9MtQNA7xOl2CU6KC95nR6M+l4tI
	Zytbq0juu4cqAIeEwoBKQEtSAp4a5Obd6vbytXlhuPpHKnsgiiKb3CuNbYwB7g37NJjo+3LLyTm
	TSiaXFpaNKOj70J0hTLzT2h1pouJcJsA4qD47jJdIm3L1nQ41EIKuH/owjOLymbMaZirBeO7XlS
	sjvyqxdANBFtmBStrOAXyner9RjDYZYCGrlIASTynC4WDlrvO7r5KHZafsk9
X-Google-Smtp-Source: AGHT+IE7bscgKy9rGjJGpIo6TFDhfB/8EvvbOpctc3LTRLmGBdFDt6WU6FZmKes+uCyDc1Z9qfNxWg==
X-Received: by 2002:a05:6000:18a2:b0:391:3028:c779 with SMTP id ffacd0b85a97d-3997f95956cmr18702675f8f.45.1742981638712;
        Wed, 26 Mar 2025 02:33:58 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d7ae65761sm11733465e9.0.2025.03.26.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:33:58 -0700 (PDT)
Message-ID: <18b43ec2e9f6edd5597de0023c30e7c949416ac2.camel@linaro.org>
Subject: Re: [PATCH 10/34] mfd: sec: split into core and transport (i2c)
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:33:55 +0000
In-Reply-To: <79a2bdd7-af66-4876-9553-bb2223760880@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-10-d08943702707@linaro.org>
	 <79a2bdd7-af66-4876-9553-bb2223760880@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_023400_551626_C428E6F4 
X-CRM114-Status: GOOD (  30.04  )
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

Hi Krzysztof,

Thanks for your review.

On Wed, 2025-03-26 at 08:14 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > -
> > -	sec_pmic->regmap_pmic =3D devm_regmap_init_i2c(i2c, regmap);
> > -	if (IS_ERR(sec_pmic->regmap_pmic)) {
> > -		ret =3D PTR_ERR(sec_pmic->regmap_pmic);
> > -		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
> > -			ret);
> > -		return ret;
> > +	if (probedata) {
>=20
> I don't get why this is conditional. New transport will also provide
> probedata or at least it should.

The original thinking was that I'll need very different OF parsing for
ACPM and I2C transports, but after reconsidering, I'll keep the OF parsing
in the core instead (to truly have common OF parsing), and then this
becomes unnecessary.

[...]

> > diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..803a46e657a5a1a639014d4=
42941c0cdc60556a5
> > --- /dev/null
> > +++ b/drivers/mfd/sec-i2c.c
> > @@ -0,0 +1,252 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2012 Samsung Electronics Co., Ltd
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 http://www.samsung.com
> > + * Copyright 2025 Linaro Ltd.
> > + *
> > + * Samsung SxM I2C driver
> > + */
> > +
> > +#include <linux/dev_printk.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mfd/samsung/core.h>
> > +#include <linux/mfd/samsung/s2mpa01.h>
> > +#include <linux/mfd/samsung/s2mps11.h>
> > +#include <linux/mfd/samsung/s2mps13.h>
> > +#include <linux/mfd/samsung/s2mps14.h>
> > +#include <linux/mfd/samsung/s2mps15.h>
> > +#include <linux/mfd/samsung/s2mpu02.h>
> > +#include <linux/mfd/samsung/s5m8767.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/pm.h>
> > +#include <linux/regmap.h>
> > +#include "sec-core.h"
> > +
> > +static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case S2MPA01_REG_INT1M:
> > +	case S2MPA01_REG_INT2M:
> > +	case S2MPA01_REG_INT3M:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static bool s2mps11_volatile(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case S2MPS11_REG_INT1M:
> > +	case S2MPS11_REG_INT2M:
> > +	case S2MPS11_REG_INT3M:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case S2MPU02_REG_INT1M:
> > +	case S2MPU02_REG_INT2M:
> > +	case S2MPU02_REG_INT3M:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static const struct regmap_config sec_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +};
> > +
> > +static const struct regmap_config s2mpa01_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPA01_REG_LDO_OVCB4,
> > +	.volatile_reg =3D s2mpa01_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps11_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS11_REG_L38CTRL,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps13_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS13_REG_LDODSCH5,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps14_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS14_REG_LDODSCH3,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps15_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS15_REG_LDODSCH4,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mpu02_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPU02_REG_DVSDATA,
> > +	.volatile_reg =3D s2mpu02_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s5m8767_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S5M8767_REG_LDO28CTRL,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +/*
> > + * Only the common platform data elements for s5m8767 are parsed here =
from the
> > + * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charg=
er and
> > + * others have to parse their own platform data elements from device t=
ree.
> > + */
> > +static void
> > +sec_pmic_i2c_parse_dt_pdata(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0 struct sec_pmic_probe_data *pd)
> > +{
> > +	pd->manual_poweroff =3D
> > +		of_property_read_bool(dev->of_node,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,s2mps11-acokb-ground");
> > +	pd->disable_wrstbi =3D
> > +		of_property_read_bool(dev->of_node,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,s2mps11-wrstbi-ground");
> > +}
> > +
> > +static int sec_pmic_i2c_probe(struct i2c_client *client)
> > +{
> > +	struct sec_pmic_probe_data probedata;
> > +	const struct regmap_config *regmap;
> > +	unsigned long device_type;
> > +	struct regmap *regmap_pmic;
> > +	int ret;
> > +
> > +	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
>=20
> This wasn't tested and it makes no sense. You pass random stack values.
> And what is the point of:
> "pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);"
> in sec_pmic_probe()?

Here, the 'struct sec_pmic_probe_data probedata' is on-stack,
and populated by sec_pmic_i2c_parse_dt_pdata(), to become non-random.
This is then passed into the core's sec_pmic_probe(), which kzalloc()s
pdata, and populates pdata using probedata. i2c's probedata is not
used past .probe(), and the pdata from the core is kzalloc()d, so it's
safe to keep using past .probe().

But I'll change this anyway, to keep it all in the core in the first
place, to have truly common i2c and acpm parsing of DT.

>=20
>=20
> ...
>=20
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);
> > +
> > +static struct i2c_driver sec_pmic_i2c_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "sec-pmic-i2c",
> > +		.pm =3D pm_sleep_ptr(&sec_pmic_pm_ops),
> > +		.of_match_table =3D sec_pmic_i2c_of_match,
> > +	},
> > +	.probe =3D sec_pmic_i2c_probe,
> > +	.shutdown =3D sec_pmic_i2c_shutdown,
> > +};
> > +module_i2c_driver(sec_pmic_i2c_driver);
> > +
> > +MODULE_AUTHOR("Andr=C3=A9 Draszik <andre.draszik@linaro.org>");
>=20
> This belongs to the patch adding actual features. Moving existing code
> or splitting it is not really reason to became the author of the code.
> The code was there.

OK.

Cheers,
Andre'


