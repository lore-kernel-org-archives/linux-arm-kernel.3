Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E8CD78783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6DYE2MNhTkzYWZad7/KQln/QRdYJn201FXeD1GBcXY=; b=3GuIRElORstZp1Rtf//swP9KLz
	8KAx1200DGr5OXG6hjmzqx5KH07t+SnMvKzpmRAjpftsDU6UsIEad1dycKCpXuJsF27WYK94EiQfT
	XACqRJsZPhvnqgKyx59KeBRMUhhjOsqnfPWGuMWLWyzTcKXraCRrlaqdGbugmZKEyL98Xe3YiioIw
	cYE4D+7JipZtGoSedp9gIjboqR2hH3sDgvD5H05sJfmVghU3VwFpYsHecJBsP2kHXo0q+ZhZQ1TUy
	SjISKOOLaixlFjj8k9GC3FCqzAD5O8XqG8x3On13cE4XVBqCAp9h4aEEGK7XsMVUCxfUU2Sirys4f
	HZ2qHopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWc7H-0000000ATmd-3NrA;
	Fri, 19 Dec 2025 15:10:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWc7E-0000000ATlp-3aFo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:10:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso15101185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 07:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156999; x=1766761799; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6DYE2MNhTkzYWZad7/KQln/QRdYJn201FXeD1GBcXY=;
        b=YR16oGmNhgfC/piq5oJ1Nk2fkjlI93pj8jYyVVRSO3F5bhqYyD2ACuPN2x3hijtCB4
         NwgxFDo3nr3y4TFO/hHakAuY1POQfqzF6UuWWGoBKvqWJ7o9oL6mJnPtoRV117kxbSoh
         u8Q0MJpPhRV+cFjWTVW64KJYOejwWe44TbG8uVOTV35yHrDEUYNodS0B0AVcMIr7fflc
         3uxshArme/Y6Ov58pF58SdDdPaXqK6fn5Hsc1/VoEnbG0GFA/cg8WNtGx4gxhbmRatuu
         xSmH+o75tPQvC9haL9socA51fQ50iZiabi0zoYrqAKDlx6/Fk9TuVGomuMn9ryWu6imh
         BrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156999; x=1766761799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6DYE2MNhTkzYWZad7/KQln/QRdYJn201FXeD1GBcXY=;
        b=fXspYqPbrkH+annQWYasPLvq+x32VtSdRgyM/XjUu8puEmNVQCSuWdDy76S4ze7YD5
         QYwsEt0oAI7xAgcMzXjD3SwffPfLrf1eFutzVk5vEIQoiDToYrpZ3y+K6SujYiWA4qeK
         PM4blY4Ipj/DrC0hQEls3tFbGgXR3B4W5x1NoZ6pEuKEUDf+SNxCXamZIo8eHwXld+ga
         R3EehxHhL3BvjzxtTtRIlUAYSCR9JLSaGf0rSUEwYOJtVB4yctytzDk7VI90dkZ1DnIs
         qLXDq6XFWTdXPKy8IHbOvF3LgGhNHqt+WW9TQ8MWkQ/opaz40VHu80bIVT5/kr6EFgAa
         yDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS7KqlGLiZ5EuqLS4MwHXT+uzpSfYfK6NQwe9js4s4HfCNXPJsKaf0bTmvnpGtSFt8Cb4QTzIw4DMhbd6SZ8rB@lists.infradead.org
X-Gm-Message-State: AOJu0YwN3AmOUmTptvx9GTIpgX/rF3ryKrpWrpLF1RqU3gBUCTDpmIBn
	XXoEvkxTqykAsbmALL4OhVQh55kxmmAjbVzInoxV+v83XPH42OBMBujQaaTlKg4VVxo=
X-Gm-Gg: AY/fxX6AczpuvUqtJrzBuR38FH2q2X176Kk0SLq0K+ktU+aiuTT2yxz6PbAhhxO8Jwl
	SeJr7dQQvgIMGmnBgKmCHc4OSYWbYoQi1013+CRShOyqWkrpGTy43IoM4L1Sw33zyo+6U8bJvFB
	WIRr7eut5FfqGwyjip5lvU5KlyWLTUwSVqS6CaUvdFZWC0TiLKyFaC/GpRoT7Puu++rimEFU4Gk
	eLpN9GaeB3VocsIJRSB6GccGsEEXd9AYfLoq0Jqs3YdRURO8GIZK9pNQFSmCqLhsrXsE0UCTePq
	KkE8ztIeAzGQ1/qm2etroziWcZZnFjjRSBoIXiGG0XkcH9M/P6iJdxrBOjQW3FM6objH7jaLa/h
	5Xzmzc/Qdea2eA8Rxiu2z/EJes97ZMyy2wMCXU1EYurmVY9/64eB73CV1UkC6Tp8k8eAMtbFls8
	IWtqKhIe0wcq5KWFBvcQ==
X-Google-Smtp-Source: AGHT+IHfurN12FpNnNPiiNVGLrHRJmgkN9qwpziMmbCueFgBzqKgruvEnsQbRkbsEmUQUdLB2C9F4g==
X-Received: by 2002:a05:6000:22c1:b0:431:771:a50c with SMTP id ffacd0b85a97d-432447952a3mr8084959f8f.1.1766156998712;
        Fri, 19 Dec 2025 07:09:58 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82c5csm5281983f8f.21.2025.12.19.07.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:09:58 -0800 (PST)
Message-ID: <653202f78f060b7e001b78604dd26d0f18ab76f9.camel@linaro.org>
Subject: Re: [PATCH v3 5/6] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 15:10:04 +0000
In-Reply-To: <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_071000_950300_B7AED817 
X-CRM114-Status: GOOD (  30.72  )
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

On Thu, 2025-11-20 at 11:29 +0000, Tudor Ambarus wrote:
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
>=20
> Add the GS101 chip ID support. The support is intentionally added in the
> exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
> we estimate that there will not be any OTP consumers in the kernel other
> than the chip ID/SoC interface. The downstream GS101 drivers confirm
> this supposition.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 87 ++++++++++++++++++++++++++=
++++++-----
> =C2=A01 file changed, 75 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/ex=
ynos-chipid.c
> index 5c8660374269c87ec38ebca242918bd7b1d362e5..06eb6ef8740d3f58eda52c8e7=
1cf40074d2deb1f 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -13,9 +13,11 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/array_size.h>
> +#include <linux/clk.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/device/devres.h>
> -#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/ioport.h>
> =C2=A0#include <linux/mfd/syscon.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> @@ -28,9 +30,11 @@
> =C2=A0#include "exynos-asv.h"
> =C2=A0
> =C2=A0struct exynos_chipid_variant {
> -	unsigned int rev_reg;		/* revision register offset */
> +	unsigned int main_rev_reg;	/* main revision register offset */
> +	unsigned int sub_rev_reg;	/* sub revision register offset */
> =C2=A0	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
> =C2=A0	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
> +	bool efuse;
> =C2=A0};
> =C2=A0
> =C2=A0struct exynos_chipid_info {
> @@ -69,6 +73,8 @@ static const struct exynos_soc_id {
> =C2=A0	{ "EXYNOS990", 0xE9830000 },
> =C2=A0	{ "EXYNOSAUTOV9", 0xAAA80000 },
> =C2=A0	{ "EXYNOSAUTOV920", 0x0A920000 },
> +	/* Compatible with: google,gs101-otp */
> +	{ "GS101", 0x9845000 },
> =C2=A0};
> =C2=A0
> =C2=A0static const char *exynos_product_id_to_name(unsigned int product_i=
d)
> @@ -93,19 +99,53 @@ static int exynos_chipid_get_chipid_info(struct devic=
e *dev,
> =C2=A0		return dev_err_probe(dev, ret, "failed to read Product ID\n");
> =C2=A0	soc_info->product_id =3D val & EXYNOS_MASK;
> =C2=A0
> -	if (data->rev_reg !=3D EXYNOS_CHIPID_REG_PRO_ID) {
> -		ret =3D regmap_read(regmap, data->rev_reg, &val);
> +	if (data->sub_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID) {
> +		/* exynos4210 case */
> +		main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +	} else {
> +		unsigned int val2;
> +
> +		ret =3D regmap_read(regmap, data->sub_rev_reg, &val2);
> =C2=A0		if (ret < 0)
> =C2=A0			return dev_err_probe(dev, ret,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to read revision\n");
> +
> +		if (data->main_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID)
> +			/* gs101 case */
> +			main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		else
> +			/* exynos850 case */
> +			main_rev =3D (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +
> +		sub_rev =3D (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;

The above looks a little fragile, comparing register offsets between differ=
ent
hardware platforms and macros, but I guess it works for now and isn't reall=
y
much different to before.

> =C2=A0	}
> -	main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> -	sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +
> =C2=A0	soc_info->revision =3D (main_rev << EXYNOS_REV_PART_SHIFT) | sub_r=
ev;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static struct regmap *exynos_chipid_get_efuse_regmap(struct platform_dev=
ice *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return ERR_CAST(base);
> +
> +	const struct regmap_config reg_config =3D {
> +		.reg_bits =3D 32,
> +		.reg_stride =3D 4,
> +		.val_bits =3D 32,
> +		.use_relaxed_mmio =3D true,
> +		.max_register =3D (resource_size(res) - reg_config.reg_stride),
> +	};
> +
> +	return devm_regmap_init_mmio(&pdev->dev, base, &reg_config);
> +}
> +
> =C2=A0static void exynos_chipid_unregister_soc(void *data)
> =C2=A0{
> =C2=A0	soc_device_unregister(data);
> @@ -127,10 +167,24 @@ static int exynos_chipid_probe(struct platform_devi=
ce *pdev)
> =C2=A0		return dev_err_probe(dev, -EINVAL,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get match data\n");
> =C2=A0
> -	regmap =3D device_node_to_regmap(dev->of_node);
> -	if (IS_ERR(regmap))
> -		return dev_err_probe(dev, PTR_ERR(regmap),
> -				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get regmap\n");
> +	if (drv_data->efuse) {
> +		struct clk *clk;
> +
> +		regmap =3D exynos_chipid_get_efuse_regmap(pdev);
> +		if (IS_ERR(regmap))
> +			return dev_err_probe(dev, PTR_ERR(regmap),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get efuse regmap\n");
> +
> +		clk =3D devm_clk_get_enabled(dev, NULL);
> +		if (IS_ERR(clk))
> +			return dev_err_probe(dev, PTR_ERR(clk),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get clock\n");

Could you use devm_regmap_init_mmio_clk() instead?

Cheers,
Andre'

> +	} else {
> +		regmap =3D device_node_to_regmap(dev->of_node);
> +		if (IS_ERR(regmap))
> +			return dev_err_probe(dev, PTR_ERR(regmap),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get regmap\n");
> +	}
> =C2=A0
> =C2=A0	ret =3D exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_=
info);
> =C2=A0	if (ret < 0)
> @@ -177,19 +231,28 @@ static int exynos_chipid_probe(struct platform_devi=
ce *pdev)
> =C2=A0}
> =C2=A0
> =C2=A0static const struct exynos_chipid_variant exynos4210_chipid_drv_dat=
a =3D {
> -	.rev_reg	=3D 0x0,
> =C2=A0	.main_rev_shift	=3D 4,
> =C2=A0	.sub_rev_shift	=3D 0,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct exynos_chipid_variant exynos850_chipid_drv_data=
 =3D {
> -	.rev_reg	=3D 0x10,
> +	.main_rev_reg	=3D 0x10,
> +	.sub_rev_reg	=3D 0x10,
> =C2=A0	.main_rev_shift	=3D 20,
> =C2=A0	.sub_rev_shift	=3D 16,
> =C2=A0};
> =C2=A0
> +static const struct exynos_chipid_variant gs101_chipid_drv_data =3D {
> +	.sub_rev_reg	=3D 0x10,
> +	.sub_rev_shift	=3D 16,
> +	.efuse =3D true,
> +};
> +
> =C2=A0static const struct of_device_id exynos_chipid_of_device_ids[] =3D =
{
> =C2=A0	{
> +		.compatible	=3D "google,gs101-otp",
> +		.data		=3D &gs101_chipid_drv_data,
> +	}, {
> =C2=A0		.compatible	=3D "samsung,exynos4210-chipid",
> =C2=A0		.data		=3D &exynos4210_chipid_drv_data,
> =C2=A0	}, {

