Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1481C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usZvs6KCLTgjGr0SVDdV9KkJaypefAlDD3xqFkv+Ahk=; b=V7GN1YovfhhS9oWL5aHSXoYLzR
	CZE93hwt6xmy5qxo/YqjYFiovuoru7pG5F1jju7L/uNGbVpCQCZaDfqjxhEGWgQjUK99x4buU8zqB
	yD5+CRaykWq4TWbNUNHOjQm37H366Jzo1nllU9rUjAxHJsCF9U4YV6sCU02PBU3kbJJ6GOaVf75SS
	WKB78yl+DQpDhFxeUp2P3AB+33tAXPDuJeqkdcQK/Eef3vahs+zX77eAHVFoIIBQDRRTpT+J2CkEl
	uRiLcxK/QADbfJN6p2dy7Tk/fl6FjB+94afAKmVTzKpYtaASo1KguAFUZEWnjxu4EjyRSYZkdoYMj
	2PVhaudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iMU-0000000H7Kd-3k6r;
	Mon, 07 Apr 2025 09:01:46 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iGj-0000000H5uH-0Ui2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:55:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so23506305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744016147; x=1744620947; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=usZvs6KCLTgjGr0SVDdV9KkJaypefAlDD3xqFkv+Ahk=;
        b=hzJmaH6JS0Gwo5CJVfXn0FablScWf226mesC6Wv18hn3PMPM1kJB3+0gMGlJEhl9CT
         2KiKBTK9zrDQ8z8f/3bQD9JM2j+PCid50kINUxURvDlePG0SPTtBbNrRUysig7vd+y7f
         CC6nR9jqauxVloLUsGxsT4R4JOK7ZLr5TbC/Knp+3NLMxLkkuaFBQv/cKxZ4V6mzZrpt
         GUo70bkOLhOoSrFWPld+xsE463RrsKLMZedS3IbpIbwy3Hn2ejqhP3snUo2R7rGg4A1S
         m+xVnlz10aMhUqQd7i6QbxpknDreFjELYPH9ZcZ0n3Ou80RjSmnYLU1jjaFD+MjqBYMg
         bD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016147; x=1744620947;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=usZvs6KCLTgjGr0SVDdV9KkJaypefAlDD3xqFkv+Ahk=;
        b=m5RaUfHF+MQr47kUHw84zJGMUF824miSTHc0oXV/lhI+/ItBI7EYzaHz/COo1Cj1Ks
         8CRKYxS9ckKFid5T3qBMXvu/pPsdBwp+KNfcNfBg00eNWIvPswEPumNFzN5pbBYwntjT
         FDIggNUGH31l6R5GkftdH2sWhOTnKsAtq6S441dwz5XuxxzCXqx6b+xapA+/XtRdjamR
         QnlI35xPUZX9t0UZ3GBfLZepjTfzfbs7TPaCT0f2hPqNxp08wovcwjiRYWxanU9KeWBl
         ZtEYhupGtMCuxR9OZTsQW4+c1etXmntaxIvTmjLSrDYBsnaWqhnHjwHN14YjX9CzNU40
         prnA==
X-Forwarded-Encrypted: i=1; AJvYcCXHPIwloJmlifFXaEas483DpG3xVWScj0k84+v2TpB2LJZrQoMEi4q40/zDfA14OS8JXDddVGRb270asl2AJI9U@lists.infradead.org
X-Gm-Message-State: AOJu0YydRE1XGGjiecw+j6iqkd1tTDeO2gv2e8/WA3jJEAxEtLI4sDL4
	n+JokVLbzGJ+Ay4qQ8bxgXx13fLBOrGa/TbPYqEkcKaysI5DbSPD/EfMQcQo3x8=
X-Gm-Gg: ASbGncue2o2kCq2TbuS0e2neVA6/o0atOUKE+hP5bYiOaoLAsJCkJu+O+YrFJS3G++G
	4vuKB8CHSIHjzUw3p8f4h4KsW+i0bOsndjO40Qgrx2Ss5jx8kGLEuHg04Bi4fwoRVj8PdoUJtsZ
	3ObGvmQQhvBvAVl39UdwFAPMEt+OohgW1WMeZH8WYceiQ4HECWXFMdhKyxIx1UDWNFCvgFNjv5h
	2mCtfH77ZkR7WydK9ThU6HHpFcS2E/WLjqPU4jTziNhUFmVzWnAFyo8myB8dXWw2EXtxt8DFuC0
	RiXiFtEXucMcY8EDgEAdcTHWnnqBNjs2N1HqUqKhWfkx5jEN
X-Google-Smtp-Source: AGHT+IHkOpZ5UWfNCm7D0PZAZL/ZLHhBDc6m6mb4xiPQsIW15234vRHFYT+yvby5B9w2sdj4Hzpxzg==
X-Received: by 2002:a05:600c:3489:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43ee0617025mr74208375e9.7.1744016147044;
        Mon, 07 Apr 2025 01:55:47 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec163107csm127864145e9.3.2025.04.07.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:55:46 -0700 (PDT)
Message-ID: <0a1f45f3221f74fdde0f388b3693e51c771bb307.camel@linaro.org>
Subject: Re: [PATCH v3 09/32] mfd: sec: add support for S2MPG10 PMIC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 09:55:45 +0100
In-Reply-To: <20250404091858.GA43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-9-b542b3505e68@linaro.org>
	 <20250404091858.GA43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_015549_175296_73664377 
X-CRM114-Status: GOOD (  36.24  )
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

Hi,

Thanks Lee for your review!

On Fri, 2025-04-04 at 10:18 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:

[...]

> > diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..39dbb968086ac835b96ed3e=
4efa68868fda63429
> > --- /dev/null
> > +++ b/drivers/mfd/sec-acpm.c
> > @@ -0,0 +1,465 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2020 Google Inc
> > + * Copyright 2025 Linaro Ltd.
> > + *
> > + * Samsung S2MPG1x ACPM driver
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/device.h>
> > +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> > +#include <linux/mfd/samsung/core.h>
> > +#include <linux/mfd/samsung/rtc.h>
> > +#include <linux/mfd/samsung/s2mpg10.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include "sec-core.h"
> > +
> > +#define ACPM_MAX_BULK_DATA=C2=A0=C2=A0 8
> > +
> > +struct sec_pmic_acpm_platform_data {
>=20
> This isn't platform data.=C2=A0 It's driver data.
>=20
> Platform data is passed in, driver data is derived.

This is the match data from of_device_id::data, it is passed in
via device_get_match_data().

>=20
> See how the other drivers do this:
>=20
> =C2=A0 $ git grep ddata -- drivers/mfd

I had followed the example of drivers/mfd/rk8xx-i2c.c

I can rename it to struct sec_pmic_acpm_chip_data if you prefer or
something like that, but the rk8xx driver also calls this platform
data.

ddata in drivers/mfd/ generally seems used for dynamically allocated
runtime driver data. That's not the case here.

> > +	int device_type;
> > +
> > +	unsigned int acpm_chan_id;
> > +	u8 speedy_channel;
> > +
> > +	const struct regmap_config *regmap_cfg_common;
> > +	const struct regmap_config *regmap_cfg_pmic;
> > +	const struct regmap_config *regmap_cfg_rtc;
> > +	const struct regmap_config *regmap_cfg_meter;
> > +};
> > +
> > +static const struct regmap_range s2mpg10_common_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x02), /* CHIP_ID_M, INT, INT_MASK */
> > +	regmap_reg_range(0x0a, 0x0c), /* speedy control */
> > +	regmap_reg_range(0x1a, 0x2a), /* debug */
>=20
> Nit: I like comments to start with an upper-case char.

OK

>=20
> > +};
> > +
> > +static const struct regmap_range s2mpg10_common_ro_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x01),
> > +	regmap_reg_range(0x28, 0x2a),
>=20
> Why describe some, but not all ranges?

They're all covered above. I'll duplicate them here and elsewhere.

> > +struct sec_pmic_acpm_shared_bus_context {
> > +	const struct acpm_handle *acpm;
> > +	unsigned int acpm_chan_id;
> > +	u8 speedy_channel;
> > +};
> > +
> > +enum sec_pmic_acpm_accesstype {
> > +	SEC_PMIC_ACPM_ACCESSTYPE_COMMON =3D 0x00,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_PMIC =3D 0x01,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_RTC =3D 0x02,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_METER =3D 0x0a,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_WLWP =3D 0x0b,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_TRIM =3D 0x0f,
> > +};
> > +
> > +struct sec_pmic_acpm_bus_context {
> > +	struct sec_pmic_acpm_shared_bus_context *shared;
> > +	enum sec_pmic_acpm_accesstype type;
> > +};
> > +
> > +static int sec_pmic_acpm_bus_write(void *context, const void *data,
> > +				=C2=A0=C2=A0 size_t count)
>=20
> Nit: You can tidy this, and similar line-feeds, up by using 100-chars her=
e.

Will do.

> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx =3D context;
> > +	const struct acpm_handle *acpm =3D ctx->shared->acpm;
> > +	const struct acpm_pmic_ops *pmic_ops =3D &acpm->ops.pmic_ops;
> > +	u8 reg;
> > +
> > +	if (count < 2 || count > (ACPM_MAX_BULK_DATA + 1))
>=20
> 2 because?=C2=A0 Either comment or define magic numbers please.
>=20
> > +		return -EINVAL;
> > +
> > +	reg =3D *(u8 *)data;
>=20
> No API to conduct this raw read for you?=C2=A0 readl(), *_to_cpu() or sim=
ilar?

This is just regmap, passing a buffer. First byte(s) contains the reg
address, depending on the regmap_config used during creation, and remainder
the values starting from that address. This is not an I/O read as such, it'=
s
only extracting the register address. See e.g. regmap_parse_8().

I'll reflow it a little.

>=20
> > +	++data;
> > +	--count;
> > +
> > +	return pmic_ops->bulk_write(acpm, ctx->shared->acpm_chan_id,
> > +				=C2=A0=C2=A0=C2=A0 ctx->type, reg,
> > +				=C2=A0=C2=A0=C2=A0 ctx->shared->speedy_channel, count, data);
> > +}
> > +
> > +static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf,
> > +				=C2=A0 size_t reg_size, void *val_buf,
> > +				=C2=A0 size_t val_size)
> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx =3D context;
> > +	const struct acpm_handle *acpm =3D ctx->shared->acpm;
> > +	const struct acpm_pmic_ops *pmic_ops =3D &acpm->ops.pmic_ops;
> > +	u8 reg;
> > +
> > +	if (reg_size !=3D 1 || !val_size || val_size > ACPM_MAX_BULK_DATA)
> > +		return -EINVAL;
> > +
> > +	reg =3D *(u8 *)reg_buf;
> > +
> > +	return pmic_ops->bulk_read(acpm, ctx->shared->acpm_chan_id,
> > +				=C2=A0=C2=A0 ctx->type, reg,
> > +				=C2=A0=C2=A0 ctx->shared->speedy_channel,
> > +				=C2=A0=C2=A0 val_size, val_buf);
> > +}
> > +
> > +static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned i=
nt reg,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int mask,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int val)
> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx =3D context;
> > +	const struct acpm_handle *acpm =3D ctx->shared->acpm;
> > +	const struct acpm_pmic_ops *pmic_ops =3D &acpm->ops.pmic_ops;
> > +
> > +	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id,
> > +				=C2=A0=C2=A0=C2=A0 ctx->type, reg & 0xff,
> > +				=C2=A0=C2=A0=C2=A0 ctx->shared->speedy_channel, val, mask);
> > +}
> > +
> > +static const struct regmap_bus sec_pmic_acpm_regmap_bus =3D {
> > +	.write =3D sec_pmic_acpm_bus_write,
> > +	.read =3D sec_pmic_acpm_bus_read,
> > +	.reg_update_bits =3D sec_pmic_acpm_bus_reg_update_bits,
> > +	.max_raw_read =3D ACPM_MAX_BULK_DATA,
> > +	.max_raw_write =3D ACPM_MAX_BULK_DATA,
> > +};
> > +
> > +static struct regmap *
> > +sec_pmic_acpm_regmap_init(struct device *dev,
>=20
> Place both of these on the same line please.
>=20
> > +			=C2=A0 struct sec_pmic_acpm_shared_bus_context *shared_ctx,
> > +			=C2=A0 enum sec_pmic_acpm_accesstype type,
> > +			=C2=A0 const struct regmap_config *cfg, bool do_attach)
> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx;
> > +	struct regmap *regmap;
> > +
> > +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->shared =3D shared_ctx;
> > +	ctx->type =3D type;
> > +
> > +	regmap =3D devm_regmap_init(dev, &sec_pmic_acpm_regmap_bus, ctx, cfg)=
;
> > +	if (IS_ERR(regmap))
> > +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(regmap),
>=20
> dev_err_cast_probe()
>=20
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init (%s) failed\n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 cfg->name));
> > +
> > +	if (do_attach) {
> > +		int ret;
> > +
> > +		ret =3D regmap_attach_dev(dev, regmap, cfg);
> > +		if (ret)
> > +			return ERR_PTR(dev_err_probe(dev, ret,
>=20
> dev_err_ptr_probe()

Thanks! I had forgotten about those two.

> > +						=C2=A0=C2=A0=C2=A0=C2=A0 "regmap attach (%s) failed\n",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 cfg->name));
> > +	}
> > +
> > +	return regmap;
> > +}
> > +
> > +static void sec_pmic_acpm_mask_common_irqs(void *regmap_common)
> > +{
> > +	regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 S2MPG10_COMMON_INT_SRC);
>=20
> Single line.=C2=A0 And others like it.
>=20
> > +}
> > +
> > +static int sec_pmic_acpm_probe(struct platform_device *pdev)
> > +{
> > +	struct regmap *regmap_common, *regmap_pmic, *regmap;
> > +	const struct sec_pmic_acpm_platform_data *pdata;
> > +	struct sec_pmic_acpm_shared_bus_context *shared_ctx;
> > +	const struct acpm_handle *acpm;
> > +	struct device *dev;
> > +	int ret, irq;
> > +
> > +	dev =3D &pdev->dev;
>=20
> You can do this during the declaration.
>=20
> > +	pdata =3D device_get_match_data(dev);
> > +	if (!pdata)
> > +		return dev_err_probe(dev, -ENODEV,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "unsupported device type\n");
> > +
> > +	acpm =3D devm_acpm_get_by_node(dev, pdev->dev.parent->of_node);
>=20
> You have 'dev' now.=C2=A0 Please use it.
>=20
> > +	if (IS_ERR(acpm))
> > +		return dev_err_probe(dev, PTR_ERR(acpm),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get acpm (2)\n");
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	shared_ctx =3D devm_kzalloc(dev, sizeof(*shared_ctx), GFP_KERNEL);
> > +	if (!shared_ctx)
> > +		return -ENOMEM;
> > +
> > +	shared_ctx->acpm =3D acpm;
> > +	shared_ctx->acpm_chan_id =3D pdata->acpm_chan_id;
> > +	shared_ctx->speedy_channel =3D pdata->speedy_channel;
> > +
> > +	regmap_common =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +						=C2=A0 SEC_PMIC_ACPM_ACCESSTYPE_COMMON,
> > +						=C2=A0 pdata->regmap_cfg_common, false);
> > +	if (IS_ERR(regmap_common))
> > +		return PTR_ERR(regmap_common);
> > +
> > +	/* Mask all interrupts from 'common' block, until successful init */
> > +	ret =3D regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK,
> > +			=C2=A0=C2=A0 S2MPG10_COMMON_INT_SRC);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to mask common block interrupts\n=
");
> > +
> > +	regmap_pmic =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +						SEC_PMIC_ACPM_ACCESSTYPE_PMIC,
> > +						pdata->regmap_cfg_pmic, false);
> > +	if (IS_ERR(regmap_pmic))
> > +		return PTR_ERR(regmap_pmic);
> > +
> > +	regmap =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +					=C2=A0=C2=A0 SEC_PMIC_ACPM_ACCESSTYPE_RTC,
> > +					=C2=A0=C2=A0 pdata->regmap_cfg_rtc, true);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	regmap =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +					=C2=A0=C2=A0 SEC_PMIC_ACPM_ACCESSTYPE_METER,
> > +					=C2=A0=C2=A0 pdata->regmap_cfg_meter, true);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	ret =3D sec_pmic_probe(dev, pdata->device_type, irq, regmap_pmic, NUL=
L);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (device_property_read_bool(dev, "wakeup-source"))
> > +		devm_device_init_wakeup(dev);
> > +
> > +	/*
> > +	 * Unmask PMIC interrupt from 'common' block, now that everything is =
in
> > +	 * place.
> > +	 */
> > +	ret =3D regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
> > +				S2MPG10_COMMON_INT_SRC_PMIC);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to unmask PMIC interrupt\n");
> > +
> > +	/* Mask all interrupts from 'common' block on shutdown */
> > +	ret =3D devm_add_action_or_reset(dev, sec_pmic_acpm_mask_common_irqs,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_common);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static void sec_pmic_acpm_shutdown(struct platform_device *pdev)
> > +{
> > +	sec_pmic_shutdown(&pdev->dev);
>=20
> sec_pmic_shutdown() takes a pointer to i2c_client (unless you changed it
> somewhere else).=C2=A0 If the later is true, then why not make it take a
> pointer to platform_device and omit this abstraction?

I changed it earlier indeed to support both I2C and ACPM transports, simila=
r
to drivers/mfd/rk*. The I2C driver doesn't have a struct platform_device,
but it has struct i2c_client::dev, hence I'm passing struct device to the
common code, like in the rk8xx example.

[...]

>=20
> > diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> > index 4d49bb42bd0d109263f485c8b58e88cdd8d598d9..bf86281401ac6ff05c90c2d=
71c84744709ed79cb 100644
> > --- a/drivers/mfd/sec-irq.c
> > +++ b/drivers/mfd/sec-irq.c
> > @@ -11,6 +11,7 @@
> > =C2=A0#include <linux/irq.h>
> > =C2=A0#include <linux/mfd/samsung/core.h>
> > =C2=A0#include <linux/mfd/samsung/irq.h>
> > +#include <linux/mfd/samsung/s2mpg10.h>
> > =C2=A0#include <linux/mfd/samsung/s2mps11.h>
> > =C2=A0#include <linux/mfd/samsung/s2mps14.h>
> > =C2=A0#include <linux/mfd/samsung/s2mpu02.h>
> > @@ -20,6 +21,60 @@
> > =C2=A0#include <linux/regmap.h>
> > =C2=A0#include "sec-core.h"
> > =C2=A0
> > +static const struct regmap_irq s2mpg10_irqs[] =3D {
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRONF, 0, S2MPG10_IRQ_PWRONF_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRONR, 0, S2MPG10_IRQ_PWRONR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_JIGONBF, 0, S2MPG10_IRQ_JIGONBF_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_JIGONBR, 0, S2MPG10_IRQ_JIGONBR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_ACOKBF, 0, S2MPG10_IRQ_ACOKBF_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_ACOKBR, 0, S2MPG10_IRQ_ACOKBR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRON1S, 0, S2MPG10_IRQ_PWRON1S_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_MRB, 0, S2MPG10_IRQ_MRB_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTC60S, 1, S2MPG10_IRQ_RTC60S_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTCA1, 1, S2MPG10_IRQ_RTCA1_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTCA0, 1, S2MPG10_IRQ_RTCA0_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTC1S, 1, S2MPG10_IRQ_RTC1S_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WTSR_COLDRST, 1, S2MPG10_IRQ_WTSR_COLDRST_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WTSR, 1, S2MPG10_IRQ_WTSR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WRST, 1, S2MPG10_IRQ_WRST_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SMPL, 1, S2MPG10_IRQ_SMPL_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_120C, 2, S2MPG10_IRQ_INT120C_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_140C, 2, S2MPG10_IRQ_INT140C_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_TSD, 2, S2MPG10_IRQ_TSD_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PIF_TIMEOUT1, 2, S2MPG10_IRQ_PIF_TIMEOUT1_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PIF_TIMEOUT2, 2, S2MPG10_IRQ_PIF_TIMEOUT2_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SPD_PARITY_ERR, 2, S2MPG10_IRQ_SPD_PARITY_=
ERR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SPD_ABNORMAL_STOP, 2, S2MPG10_IRQ_SPD_ABNO=
RMAL_STOP_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PMETER_OVERF, 2, S2MPG10_IRQ_PMETER_OVERF_=
MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B1M, 3, S2MPG10_IRQ_OCP_B1M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B2M, 3, S2MPG10_IRQ_OCP_B2M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B3M, 3, S2MPG10_IRQ_OCP_B3M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B4M, 3, S2MPG10_IRQ_OCP_B4M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B5M, 3, S2MPG10_IRQ_OCP_B5M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B6M, 3, S2MPG10_IRQ_OCP_B6M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B7M, 3, S2MPG10_IRQ_OCP_B7M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B8M, 3, S2MPG10_IRQ_OCP_B8M_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B9M, 4, S2MPG10_IRQ_OCP_B9M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B10M, 4, S2MPG10_IRQ_OCP_B10M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WLWP_ACC, 4, S2MPG10_IRQ_WLWP_ACC_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SMPL_TIMEOUT, 4, S2MPG10_IRQ_SMPL_TIMEOUT_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WTSR_TIMEOUT, 4, S2MPG10_IRQ_WTSR_TIMEOUT_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SPD_SRP_PKT_RST, 4, S2MPG10_IRQ_SPD_SRP_PK=
T_RST_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH0, 5, S2MPG10_IRQ_PWR_WARN_CH0_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH1, 5, S2MPG10_IRQ_PWR_WARN_CH1_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH2, 5, S2MPG10_IRQ_PWR_WARN_CH2_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH3, 5, S2MPG10_IRQ_PWR_WARN_CH3_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH4, 5, S2MPG10_IRQ_PWR_WARN_CH4_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH5, 5, S2MPG10_IRQ_PWR_WARN_CH5_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH6, 5, S2MPG10_IRQ_PWR_WARN_CH6_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH7, 5, S2MPG10_IRQ_PWR_WARN_CH7_=
MASK),
> > +};
> > +
> > =C2=A0static const struct regmap_irq s2mps11_irqs[] =3D {
> > =C2=A0	[S2MPS11_IRQ_PWRONF] =3D {
> > =C2=A0		.reg_offset =3D 0,
> > @@ -320,6 +375,16 @@ static const struct regmap_irq s5m8767_irqs[] =3D =
{
> > =C2=A0	},
> > =C2=A0};
> > =C2=A0
> > +static const struct regmap_irq_chip s2mpg10_irq_chip =3D {
> > +	.name =3D "s2mpg10",
> > +	.irqs =3D s2mpg10_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(s2mpg10_irqs),
> > +	.num_regs =3D 6,
> > +	.status_base =3D S2MPG10_PMIC_INT1,
> > +	.mask_base =3D S2MPG10_PMIC_INT1M,
> > +	/* all interrupt sources are read-to-clear */
>=20
> TOUPPER(a);
>=20
> Comments usually go on-top of the thing they're commenting on.

This comment is where .ack_base would usually be specified, but I'll move i=
t.

[...]

> > diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/sa=
msung/s2mpg10.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..778ff16ef6668ded514e8dc=
7242f369cb9c2d0e6
> > --- /dev/null
> > +++ b/include/linux/mfd/samsung/s2mpg10.h
> > @@ -0,0 +1,454 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2015 Samsung Electronics
> > + * Copyright 2020 Google Inc
> > + * Copyright 2025 Linaro Ltd.
> > + */
> > +
> > +#ifndef __LINUX_MFD_S2MPG10_H
> > +#define __LINUX_MFD_S2MPG10_H
> > +
> > +/* Common registers (type 0x000) */
> > +enum s2mpg10_common_reg {
> > +	S2MPG10_COMMON_CHIPID,
> > +	S2MPG10_COMMON_INT,
> > +	S2MPG10_COMMON_INT_MASK,
> > +	S2MPG10_COMMON_SPD_CTRL1 =3D 0x0a,
> > +	S2MPG10_COMMON_SPD_CTRL2,
> > +	S2MPG10_COMMON_SPD_CTRL3,
> > +	S2MPG10_COMMON_MON1SEL =3D 0x1a,
> > +	S2MPG10_COMMON_MON2SEL,
> > +	S2MPG10_COMMON_MONR,
> > +	S2MPG10_COMMON_DEBUG_CTRL1,
> > +	S2MPG10_COMMON_DEBUG_CTRL2,
> > +	S2MPG10_COMMON_DEBUG_CTRL3,
> > +	S2MPG10_COMMON_DEBUG_CTRL4,
> > +	S2MPG10_COMMON_DEBUG_CTRL5,
> > +	S2MPG10_COMMON_DEBUG_CTRL6,
> > +	S2MPG10_COMMON_DEBUG_CTRL7,
> > +	S2MPG10_COMMON_DEBUG_CTRL8,
> > +	S2MPG10_COMMON_TEST_MODE1,
> > +	S2MPG10_COMMON_TEST_MODE2,
> > +	S2MPG10_COMMON_SPD_DEBUG1,
> > +	S2MPG10_COMMON_SPD_DEBUG2,
> > +	S2MPG10_COMMON_SPD_DEBUG3,
> > +	S2MPG10_COMMON_SPD_DEBUG4,
> > +};
> > +
> > +/* for S2MPG10_COMMON_INT and S2MPG10_COMMON_INT_MASK */
>=20
> TOUPPER(f), etc.

Still getting used to this, sorry I missed them

Thanks Lee!

Andre'


