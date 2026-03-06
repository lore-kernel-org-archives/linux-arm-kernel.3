Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4A8FCB619
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEcKE/Xry4U3uD1i7TPLQGRKNjLm+QJOilg4eN6K6Ig=; b=FXMZNbGJEe5ldU97c1+Dt6fMX6
	GzpCulCclEPbHGDOccyLx+TK3f7zV59xmMe8Z56d7Erm7ljNPNNTksxQMyZC83lxPA8jl6dC/Izkc
	7pk5mMwifHTdMhmYprGPnRuUvdT0RtQ3x+jkm02X1oEIc6zmplx1wLL8+0MOn4n0VaJdnWAS4af5N
	tNl7eP8VMhLnl3rvI4tWvepKf1HkTeRb9pK7dT+VjgNElLQvAqG2ksLdQCBuUufPX9U68sxXsRe6T
	exJ3rLuS/My4ggo3Oz3jkYl9HKgfhYrJQIAGta5N6pwUsRPTNqXo2rVpdrplN50OdUoOvC7iwLdWb
	virrwFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX8j-000000042XB-2GTi;
	Fri, 06 Mar 2026 15:30:57 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX8h-000000042Wi-0BUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:30:56 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6615c461d3fso2850449a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772811053; cv=none;
        d=google.com; s=arc-20240605;
        b=UGaMHUaMyZiLiss0fsR78f/R1fSu/qPRDORZgogLvUO3ERWFPjPpCYcuLHBfEoZDZQ
         CVNqGSEr8wOAwxfkqG+CCuIXAsyj3Rx4sFYlCVchoMLORZPrWwG6PCzLlpY7CZi6ZIDy
         iwzu2HJnjbotYuTs58IdrsngfAfpZq+OGrqro/JThPNfzbv5CclV3e3rmfHy31MvMHCU
         4I2yyld9J5P/Lrfg/idsljIBto47Nc2Ippmt9jgHlRIDjW/bUErEM0jC9MxqZZOlI6mw
         Ms3Ana2RjEy2V+gc97KeoRE/8Mgidqdk2C9CltFVcLKzDFPoW4BDptoEqlOmgnsKP/wA
         1otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEcKE/Xry4U3uD1i7TPLQGRKNjLm+QJOilg4eN6K6Ig=;
        fh=9b9tCmlkQiDa2ujc4CuUYFzszM1Y2t1Q0OlcFYDrYKg=;
        b=kccwhDswvtsVn/3kf6OGrWFtFnma9MufRxpnvXl/SuoSmiyJ3339X2vzVF4+FG1XAJ
         k751TXS1PUKXir7EsPegtjej+JCXHNbfZ2sfPem8ZeJ6GeEDZpil2JnuxUB8MDGNTg6Q
         iiy5sAdyJQ717egMW/gobn/kKGJ3DKqBrFNg4PeyYS4o223WV3+V1lTakO7JFOpk6OnU
         HwK+D+2FLFHm/t/tYAm1bTSgz3luoKt0jwx0KBhCiAwgDELOjfNc9aUX1uA3bo9LpCIc
         1+M+VIHmLi4gWqMCnmtfXVa6alGT1zcwKtsaOD0w9swW9wa5Ri02MljhNns0L+OPy25v
         3HfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772811053; x=1773415853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEcKE/Xry4U3uD1i7TPLQGRKNjLm+QJOilg4eN6K6Ig=;
        b=MHreZJP2torViExb7Qv5y7L7zHBj87s+fzI9k4pwV799Qd5Ugwq73SWg9pj7l7qehE
         iidGFeMioOgcc8G/QiyV1vITLmaVoHpbLKp2RXDE0VxbHk1ElnjavqD/WA29vcf4noIV
         9HwPHqQZJGuLvb0wuhlKbtAOCWgQWvFCvWBqZZqlVS473TTvH5zzxz8iYbRv86YZBMWH
         +LNJXI7dvhU/JqJ4oZdvlHCB9awctpkBq5Oxf22IItAdER8iqthy9nKsQMBuhO8cWGUA
         tfWAeUdX+DY/5xg7QY8G7jJj7Mvm3+NfBirVjkIyy00UL2mMeMCB9/A7HH1PVv6jEdMq
         L+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772811053; x=1773415853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEcKE/Xry4U3uD1i7TPLQGRKNjLm+QJOilg4eN6K6Ig=;
        b=iZteRyBAawLs/hugWx/md0QoOMUAux/Me6Mb+RZbNaMNXplpAbA3GKpnoy4inn6kCP
         d2odeZBjCVrTu+lM9cr4MGu5sDDPG1xMxtRJtD4zDLKp0Uxs9+qGErkVn1MLqzza1amO
         7vkI0UukqDUBf/B3ZxHU3iJ03l4MoJhgVYQ/4aa1Y6ZAPalSzZ0DylQ4bwvC6j17zBk/
         4ZfB3NUxbe89wOhWAAqW0tCfRV7HELWXM4nEnQRUtUMwYJszdV4Ii8GY+tLcWMoIKcKD
         z+LsD53Je4pDCkODp5MYXV15cH6j+inK33KjfjUv9HeWC768bBHKcbTI4D3J8x0cj7wb
         BxlA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/mZp3y4RG3B1oKO66R6MPOrPr0O0AoZh7fhERb+oENTch7Nx5n9eY26YS365J0I8rXKVrRpdKkOR7Vtb5A1h@lists.infradead.org
X-Gm-Message-State: AOJu0YxfzCI259WWMEPzwDayl09ckLAz2h6+HosOMwy4onl5hps5JQLt
	ILFheVnV9liDqrLMpBlrBWWvVOibATJtjZuL6/FOD61/mGlu9wMWqptl71uVoWrl3h9hIyM1ZT6
	hou1rBfCUGzAu8R/aK1FcA8FpG3huZqCsrPc8JHLWOA==
X-Gm-Gg: ATEYQzzgr4mzyi0yoFZLO4eF/56QdllupzvM0n4UK/InOowHXCP48EGfZnoV90bszO9
	Wk3suXktbMDSolOoyPbmjZIpozjkNr9kL0QjhrqNNbz1gPbh35Aw6IYyVv9lfdTX8AWN5tvxQoO
	meS9fCJlisiqPL3kpN9ckod6ty07xYgQR6bRZ8ELyeeCTZs43cGstoVn4G6VA0xvQcUWK9/OaKx
	LC9B3s39tnbaPBDNRfpM6TWleYLbd9OXPrpi4JGNUtkEFn0yPCDhsPXePcAfwEe7x2vXguQaQDC
	hq+b/h49yTQNZBKP1z7nvVp7KshkOUcT9mm3+orjlg==
X-Received: by 2002:a05:6402:278f:b0:659:4099:877 with SMTP id
 4fb4d7f45d1cf-6619d2f6d81mr1512760a12.0.1772811052896; Fri, 06 Mar 2026
 07:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-5-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-5-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:30:41 +0000
X-Gm-Features: AaiRm50zapVukbutcTzczn3suOY9q3j1hR6w8wOK7BWF-RBJ1XR5B4U0Jjw-RuU
Message-ID: <CADrjBPriZBKpBvZZ4ScNSd2NDT1Oa=y0Z7ZXTt1_ss3y4xkCcQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] pmdomain: samsung: convert to using regmap
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
X-CRM114-CacheID: sfid-20260306_073055_134381_B6B4622D 
X-CRM114-Status: GOOD (  36.79  )
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
> On platforms such as Google gs101, direct mmio register access to the
> PMU registers doesn't necessarily work and access must happen via a
> regmap created by the PMU driver instead.
>
> In preparation for supporting such SoCs convert the existing mmio
> accesses to using a regmap wrapper.
>
> With this change in place, a follow-up patch can update the driver to
> optionally acquire the PMU-created regmap without having to change the
> rest of the code.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> There is one checkpatch warning, relating to the non-const
> regmap_config. It can not easily be made const at this stage, but a
> follow-up patch allows us to make it const and the warning will go away
> anyway.
>
> v4:
> - rework the loop in exynos_pd_power() slightly, to not return 0 early
>   to allow more code to be run after pd on/off register write without
>   changing the loop again, required for gs101.
> - add error message in case first regmap write in exynos_pd_power() fails
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 83 +++++++++++++++++++++-=
------
>  1 file changed, 62 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 5c3aa8983087..3bcba7d38ac1 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -9,15 +9,14 @@
>  // conjunction with runtime-pm. Support for both device-tree and non-dev=
ice-tree
>  // based power domain support is included.
>
> -#include <linux/io.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/pm_domain.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
> @@ -28,7 +27,7 @@ struct exynos_pm_domain_config {
>   * Exynos specific wrapper around the generic power domain
>   */
>  struct exynos_pm_domain {
> -       void __iomem *base;
> +       struct regmap *regmap;
>         struct generic_pm_domain pd;
>         u32 local_pwr_cfg;
>  };
> @@ -36,31 +35,42 @@ struct exynos_pm_domain {
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
>  {
>         struct exynos_pm_domain *pd;
> -       void __iomem *base;
>         u32 timeout, pwr;
> -       char *op;
> +       int err;
>
>         pd =3D container_of(domain, struct exynos_pm_domain, pd);
> -       base =3D pd->base;
>
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
> -       writel_relaxed(pwr, base);
> +       err =3D regmap_write(pd->regmap, 0, pwr);
> +       if (err) {
> +               pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
> +                      domain->name, power_on ? "en" : "dis", err);
> +               return err;
> +       }
>
>         /* Wait max 1ms */
>         timeout =3D 10;
> -
> -       while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) !=3D pwr) =
{
> -               if (!timeout) {
> -                       op =3D (power_on) ? "enable" : "disable";
> -                       pr_err("Power domain %s %s failed\n", domain->nam=
e, op);
> -                       return -ETIMEDOUT;
> +       while (timeout-- > 0) {
> +               unsigned int val;
> +
> +               err =3D regmap_read(pd->regmap, 0x4, &val);
> +               if (err || ((val & pd->local_pwr_cfg) !=3D pwr)) {
> +                       cpu_relax();
> +                       usleep_range(80, 100);
> +                       continue;
>                 }
> -               timeout--;
> -               cpu_relax();
> -               usleep_range(80, 100);
> +
> +               break;
>         }
>
> -       return 0;
> +       if (!timeout && !err)
> +               /* Only return timeout if no other error also occurred. *=
/
> +               err =3D -ETIMEDOUT;
> +       if (err)
> +               pr_err("Power domain %s %sable failed: %d\n", domain->nam=
e,
> +                      power_on ? "en" : "dis", err);
> +
> +       return err;
>  }
>
>  static int exynos_pd_power_on(struct generic_pm_domain *domain)
> @@ -109,8 +119,18 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         struct device_node *np =3D dev->of_node;
>         struct of_phandle_args child, parent;
>         struct exynos_pm_domain *pd;
> +       struct resource *res;
> +       void __iomem *base;
> +       unsigned int val;
>         int on, ret;
>
> +       struct regmap_config reg_config =3D {
> +               .reg_bits =3D 32,
> +               .val_bits =3D 32,
> +               .reg_stride =3D 4,
> +               .use_relaxed_mmio =3D true,
> +       };
> +
>         pm_domain_cfg =3D of_device_get_match_data(dev);
>         pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>         if (!pd)
> @@ -120,9 +140,26 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         if (!pd->pd.name)
>                 return -ENOMEM;
>
> -       pd->base =3D of_iomap(np, 0);
> -       if (!pd->base)
> -               return -ENODEV;
> +       /*
> +        * The resource typically points into the address space of the PM=
U.
> +        * Therefore, avoid using devm_platform_get_and_ioremap_resource(=
) and
> +        * instead use platform_get_resource() and devm_ioremap() to avoi=
d
> +        * conflicts due to address space overlap.
> +        */
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return dev_err_probe(dev, -ENXIO, "missing IO resources")=
;
> +
> +       base =3D devm_ioremap(dev, res->start, resource_size(res));
> +       if (!base)
> +               return dev_err_probe(dev, -ENOMEM,
> +                                    "failed to ioremap PMU registers");
> +
> +       reg_config.max_register =3D resource_size(res) - reg_config.reg_s=
tride;
> +       pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_config);
> +       if (IS_ERR(pd->regmap))
> +               return dev_err_probe(dev, PTR_ERR(base),
> +                                    "failed to init regmap");
>
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
> @@ -137,7 +174,11 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>             of_device_is_compatible(np, "samsung,exynos4210-pd"))
>                 exynos_pd_power_off(&pd->pd);
>
> -       on =3D readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
> +       ret =3D regmap_read(pd->regmap, 0x4, &val);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to read status");
> +
> +       on =3D val & pd->local_pwr_cfg;
>
>         pm_genpd_init(&pd->pd, NULL, !on);
>         ret =3D of_genpd_add_provider_simple(np, &pd->pd);
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

