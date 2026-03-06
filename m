Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD37BFCB60B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPFMUflif2PcoprUWa7OFxGTQSn7UEMXyNiXbjIMxgc=; b=EwegrpWCSFAXBUwo+46qcCoD/V
	eJJKHWtpMjPezVdL3tn/WLdS6CGlXBsYvsCEGFAJdmtu99Wp+tERSTUe7CDdTXDKLuLMXriuW43JS
	zEkKR6OI0equJ2UJR1vOmAUjqfFxThRSfXSYbV7PBf9dTKsXACawtIlSWYoJJ6YNwhGtED8QHyEzN
	9hN8I0gGZV4Xdnni5zaw1j0axfuVbMPa1cG9X+EMdq72zR82LZJOgh/Ol1rURhbUzAgqZ2BhU+F7d
	YHPF/Q8NMQr5MQ4CwPalpJCLVPbGnyf7Ua/MIzkJZX95BHDu+hxwR6vpH7TX+zQImQc21yxyDMBKb
	UBbIXCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWys-0000000413K-0xOi;
	Fri, 06 Mar 2026 15:20:46 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWyp-0000000412v-2HnI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:20:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so1024268a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772810442; cv=none;
        d=google.com; s=arc-20240605;
        b=H753scVbjolrzFJrfLjFJcNWALGMvfSOs02ScE4oncNn2i1cgltYqB9X/mB/Elmqnh
         gmENbEpQtjAuQNITT900lwOqomnsdHihiXda64wXPoQD1rB94o1QRvzD0pHh7otiiNRS
         nkuXECFYaAYUj+vSlN5GY8NvKtrO/jUoNkG6XmKde72/3gUc181OL3gCgckv7W4VhmQq
         1DmmZABAxUhYuRJ0onQkccMaoFbXGCApoIMwAAXbHKvKJs21Il0+m54WExuW2OcLw99M
         JoIlcG8ZdhivV+Wy4Q3aALipY+vxRGsvDIfMbpOBVI8SlLLsAJ+0X6DNpXMpWfqk0+ln
         ofqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oPFMUflif2PcoprUWa7OFxGTQSn7UEMXyNiXbjIMxgc=;
        fh=KhVxU+dCG3TJpsvJp86N3qiHruAE6p2EKrzxXcBd1Pg=;
        b=K+drY0SOmRILYmsCZm7otH9QRGmm4D+7L3Pr5MxZmCY+WEJn8AGJofhKXGrbLSDfLO
         iDmVgz/5YT1TjY+m+iUmdDmv8GCyf28T8bFJlH68DMBh4WQo8eS4Xe/sX4gnfkl/w2ko
         NACGThyWVz30pJ5QCY6J5huXQyJSqZ37R8wLenWYbHeEq8ryb92m+fzXkWEePcb+PwL3
         +jsbmR6JXPX/xkWBuYTDqG8lM0cE4pjYARVNHpwzwLUHK1WdH2xXrFDXI79ykJo55Cku
         DBDPUQoqKwnK8VN1+cd4bAyd1o4XvIR9GUYPYcL2o5YC0orwSL+WNPAHnZNVwo7VJFEy
         v4Ig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772810442; x=1773415242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPFMUflif2PcoprUWa7OFxGTQSn7UEMXyNiXbjIMxgc=;
        b=Rhk6oML0Vos+LK+XZg2htoWXrH9PNxb+4metELUgL2J8Ig7VGw39UDQD2UkmHwYn8i
         IrvSTNlrAHyzeDKRSKicbEW6lN/PhxBV0Nf1XUAu+v4lQw7tscpDHb1pvVlzYd0ZFskO
         1KnZezHgZBnkU2T/NNs6YlnFxG1qhHlBdGmYswgefu1Y/5j3XMCcn+4h8IauenrHY2P9
         SdRv88G0Uyhegwhim2QumPjfkoEOyk5sZpsQWzvPVqaHo57xUVBmLoVifpItlE9EvzGF
         SkRADnSq+a/3MbniQ7NVO7XldZtXKf7rc+7U40brbrxyJmkuqmJBRaY2vn3qN7whotUg
         dn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772810442; x=1773415242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPFMUflif2PcoprUWa7OFxGTQSn7UEMXyNiXbjIMxgc=;
        b=MFKbNKxjVoF/yRSWz7OYJwQWr47dQ/8rk7KQzQXJ8gnA186sR2sd0YOfA+czMZWIp8
         uFl963QevRS6LCmyC3ruQp/6YVAWXs0S86Ky0IBc86Xn7MY5RtSyOpzvpsYdAl1wnJlt
         V0hxGAU6ZWs+A0cs5zcpzhhjwM1cMQqBPXUClP7ZPUXwg9NmiW9+ub7+dQwMD9FZQ/Yh
         2ea7da6+HeOIngH6HtM8OaS8c6Tq43HJDpPrkKG+YJFDwnMtql44bq9qlQCkCW4zfpZ6
         9Tqjr2QnviOeKGuU3Mo4ZVkhdLG+Uan3oZXs8fscTwrWmTs8v98ek7EGBHS2ZJihfmEN
         gJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXXQLP1dr+vINRrJ+ugZNAvAT+lUnr0R/ZycvdjZakA3lz7vYFWeu7pkYKEsJu2/dCoALTi46qHDDKKifOIbSjb@lists.infradead.org
X-Gm-Message-State: AOJu0YxSTfO7NMBBpC2NJs0pxs7qwjuDFKwRUhYepAKUBGIV37Q6TSl5
	3yXtHPpopg5wl7CGDd/iW5w1fXJ2J12gPRDh2/VlwyfhjzY5fQUnATLOWdZXcR9h2jm+7m1AkGM
	W/PFmCQetnCLm27RuOwwWVQj5HGAepCbkd6FBSnYUVg==
X-Gm-Gg: ATEYQzwagbL0F51yaA0Jh+56upgVjH4J0O6VRXI3AJSmt7hEJQ55TWYSHD7fM+oWr2m
	LLE9eUhLd1ld6TZALGGo/ysuK44RTLU3kbWmMMQuVXBwCNZbnzuYd79yNmQXxoN+xWgQKkP80Jz
	O5dRZe8K323e91edx8KZ+1v6yTJnjxIX5kXKcOIJeOTUUVyd/DCTIRpzGFRZxipAR0P8BWX5zLC
	moj3v5n1x6FMmqYPCLrnd3Z20JQw49QW5ih0RkmrX1b67yVi9cgrAFBSkeQwZX2hDapkuJAJq2g
	NUF4KnLYj1HNsET3zmU/wIWsLBIsS8A+HdZEK7+GcQ==
X-Received: by 2002:a05:6402:719:b0:65f:76d7:d507 with SMTP id
 4fb4d7f45d1cf-66142d406c4mr2730888a12.8.1772810441112; Fri, 06 Mar 2026
 07:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-7-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-7-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:20:29 +0000
X-Gm-Features: AaiRm52gkTQ-LvYEyU8OUxVKlY-XzL8CHFqDj2nv7Gqx-ZbbUqON9JYJP7oOtB8
Message-ID: <CADrjBPrAK6-76u1vPUkc5BLTugHCa+Fk=Rvr9uOQDie7Avfd7w@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] pmdomain: samsung: add support for google,gs101-pd
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_072043_648481_89693525 
X-CRM114-Status: GOOD (  31.48  )
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

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Google gs101, direct mmio register access to the PMU registers
> doesn't work and access must happen via a regmap created by the PMU
> driver instead.
>
> Add a flag to the device match data to denote this case, and obtain
> the regmap using the parent node in DT if true, while keeping to use
> the traditional direct mmio regmap otherwise.
>
> Additionally, the status is just one bit on gs101.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v4:
> - add 'use_parent_regmap' flag instead of going by 'syscon' compatible
>   in parent, as it's not a given that the parent provides a syscon-
>   compatible regmap (it actually doesn't anymore after recent changes
>   on gs101)
>
> I've still kept Marek's Tested-by from v3, as legacy Exynos code
> doesn't change.
> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 66 +++++++++++++++++++---=
------
>  1 file changed, 46 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 8df46b41f9bc..2214d9f32d59 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -12,6 +12,7 @@
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/pm_domain.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
> @@ -21,6 +22,7 @@
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>         u32 local_pwr_cfg;
> +       bool use_parent_regmap;
>  };
>
>  /*
> @@ -93,8 +95,16 @@ static const struct exynos_pm_domain_config exynos5433=
_cfg =3D {
>         .local_pwr_cfg          =3D 0xf,
>  };
>
> +static const struct exynos_pm_domain_config gs101_cfg =3D {
> +       .local_pwr_cfg          =3D BIT(0),
> +       .use_parent_regmap      =3D true,
> +};
> +
>  static const struct of_device_id exynos_pm_domain_of_match[] =3D {
>         {
> +               .compatible =3D "google,gs101-pd",
> +               .data =3D &gs101_cfg,
> +       }, {
>                 .compatible =3D "samsung,exynos4210-pd",
>                 .data =3D &exynos4210_cfg,
>         }, {
> @@ -122,17 +132,9 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         struct of_phandle_args child, parent;
>         struct exynos_pm_domain *pd;
>         struct resource *res;
> -       void __iomem *base;
>         unsigned int val;
>         int on, ret;
>
> -       struct regmap_config reg_config =3D {
> -               .reg_bits =3D 32,
> -               .val_bits =3D 32,
> -               .reg_stride =3D 4,
> -               .use_relaxed_mmio =3D true,
> -       };
> -
>         pm_domain_cfg =3D of_device_get_match_data(dev);
>         pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>         if (!pd)
> @@ -143,25 +145,49 @@ static int exynos_pd_probe(struct platform_device *=
pdev)
>                 return -ENOMEM;
>
>         /*
> -        * The resource typically points into the address space of the PM=
U.
> +        * The resource typically points into the address space of the PM=
U and
> +        * we have to consider two cases:
> +        *   1) some implementations require a custom regmap (from PMU pa=
rent)
> +        *   2) this driver might map the same addresses as the PMU drive=
r
>          * Therefore, avoid using devm_platform_get_and_ioremap_resource(=
) and
> -        * instead use platform_get_resource() and devm_ioremap() to avoi=
d
> +        * instead use platform_get_resource() here, and below for case 1=
) use
> +        * syscon_node_to_regmap() while for case 2) use devm_ioremap() t=
o avoid
>          * conflicts due to address space overlap.
>          */
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res)
>                 return dev_err_probe(dev, -ENXIO, "missing IO resources")=
;
>
> -       base =3D devm_ioremap(dev, res->start, resource_size(res));
> -       if (!base)
> -               return dev_err_probe(dev, -ENOMEM,
> -                                    "failed to ioremap PMU registers");
> -
> -       reg_config.max_register =3D resource_size(res) - reg_config.reg_s=
tride;
> -       pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_config);
> -       if (IS_ERR(pd->regmap))
> -               return dev_err_probe(dev, PTR_ERR(base),
> -                                    "failed to init regmap");
> +       if (pm_domain_cfg->use_parent_regmap) {
> +               pd->regmap =3D syscon_node_to_regmap(dev->parent->of_node=
);
> +               if (IS_ERR(pd->regmap))
> +                       return dev_err_probe(dev, PTR_ERR(pd->regmap),
> +                                            "failed to acquire PMU regma=
p");
> +
> +               pd->configuration_reg =3D res->start;
> +               pd->status_reg =3D res->start;
> +       } else {
> +               void __iomem *base;
> +
> +               const struct regmap_config reg_config =3D {
> +                       .reg_bits =3D 32,
> +                       .val_bits =3D 32,
> +                       .reg_stride =3D 4,
> +                       .use_relaxed_mmio =3D true,
> +                       .max_register =3D (resource_size(res)
> +                                        - reg_config.reg_stride),
> +               };
> +
> +               base =3D devm_ioremap(dev, res->start, resource_size(res)=
);
> +               if (!base)
> +                       return dev_err_probe(dev, -ENOMEM,
> +                                            "failed to ioremap PMU regis=
ters");
> +
> +               pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_conf=
ig);
> +               if (IS_ERR(pd->regmap))
> +                       return dev_err_probe(dev, PTR_ERR(base),
> +                                            "failed to init regmap");
> +       }
>
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

