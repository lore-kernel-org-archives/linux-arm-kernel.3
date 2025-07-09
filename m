Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4B0C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/pT7QtJ2y0Yr0sbQcrQgyeiPZXfJWqL9UzWbCaU/Ws=; b=RUVgpnhUPRF4dcNy6gWqU1UQ5C
	0ern/CEYdLp/90kQt2NA1p61j6Eu8VYMnYX4WzcKXa3sIs7itZownmFNUYVRhHeddfTl0mmjQAlR8
	a5TihUkgiejUIjGeb8/GMAT9dnUcnqxHfjR8w3SOVGMtUbmjKHdDWxqCggTS9wUSXJlKAOIeAOnOg
	XZo1UaPAIFDoMK72YtEf2cC0MA3MpEz5xdfYFKI6lCyNa7Jcgxb6p44x4VAyqYEKuOAQloIMcjwpM
	MNK4haSRN8GmhET7dwaDe8YHfyaukegL6fX0ysV5LPGXrtJLLO9IC9kczRoi4G5OFNhDOPVviF+gl
	zl9vQb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUYE-00000008jz4-2UiF;
	Wed, 09 Jul 2025 13:09:30 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSNl-00000008NG5-3vL4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:50:35 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e898de36cfbso4560069276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752058233; x=1752663033; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H/pT7QtJ2y0Yr0sbQcrQgyeiPZXfJWqL9UzWbCaU/Ws=;
        b=NLk1Zlrf0YDJGE13KxfdAEXyRdEjvA3ieDHwOg9kYy7cFoZxVN+K+35wVtA9IrT2B6
         ZCprfg+iTQPGhqAhVCuJ1v+zBUqYLiRW3eKYZI6QXGl7t1fc1c/u9XIHEbIAa4w+fdle
         8M+G0jYh1ye+RL0bmf7onzC7/Eb2HWQ16ezMTua8WpmzqZzPSdbQYQMNNX9lxpUVCua6
         pRurLIhXQFyyZfz6Y0NQBO46x43vEtk+zFe2kl6fJJWJp0G27KLZlxZIL/tFAbHLokvp
         gokE/e0tPmYcWRQnha+gch30Z/1HAXgtDBo0RIvOEAiRmFVHab6pSVr6Fo72y4YqrquT
         A2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058233; x=1752663033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/pT7QtJ2y0Yr0sbQcrQgyeiPZXfJWqL9UzWbCaU/Ws=;
        b=nWJVOzM5jxQ0Ip1E7UFFPhuabTaHBMAtYbpmDoyTk7PWP1Mvd0c2X854v2O/25GI4z
         dPcR1NMFfUdSqkiGwe0LiH94YN6nZkSF3DiQYg3wdmzTHvP95zhHrJ4cocA4LDw089lc
         I1sL76rz3kwOm2qJT9WXPXhNW34+/vTiwCi989S02xY/9nixCyc5eiy2TdLo4HsATy/b
         JxOxODAFOruvgVo5sThOlOVs6Vb9ECMpdcBAZdKFYdeEzVqVGsglMhIxGAm4Q2nSyWM1
         gdy4Uqw7R6/6VQtlabaVggZtrLAYjCiarGzgOcslLlNEqb4ZQmGtI5uE6b6kYyvKVGWh
         cPfw==
X-Forwarded-Encrypted: i=1; AJvYcCX/3qBMyhFLp6ypAkMOyVtLB+2SCitF0pc0EmNZOOIdZU1XWHUkbUzlIWS+UXZOJL/TZLt2ARnzslki0GWiIuuA@lists.infradead.org
X-Gm-Message-State: AOJu0YyLRrDg9PeLKUEyHABz+LKSdV2ObpZmrETqFUYQxUrwmLJycw9h
	1wclgwPdGHg//Ci3f/3l1droo6q/SNo7XMbdl9MFCeEwLBpes9U59q+3gQfV3CeQ1sR4uHPeap4
	uy4IG3BNHohd9dOLX3avUoKuTavZ2e4wVwSdtiwTKsg==
X-Gm-Gg: ASbGncu+yvWEBikWgS+h99Wwvk+mcK2dbf6yj0DpU5emBkQMHyJTowwa7EkMQzhnk3X
	CsQj1/svuZbHmivjfBhX8zd79Bts1kzLKsD490eWPJ8shIkkWdDgEpA99w53ncKpvpKgebJOpYL
	kEljrL2GnzRHicDrmKS4epWEUe9bRXosyffGyU+ER/iJgE
X-Google-Smtp-Source: AGHT+IHAPAQxqp/QmTpsCbt8oJ83U9lsBh3ufrR1BZRofloQKbNtdV7YaGBiyqejPkvhxc8BDmk63wAJKW/bpKUN3RQ=
X-Received: by 2002:a05:690c:9a8b:b0:710:e8a8:771d with SMTP id
 00721157ae682-717b1984909mr29729677b3.24.1752058232542; Wed, 09 Jul 2025
 03:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250627152918.2606728-1-wens@kernel.org> <20250627152918.2606728-4-wens@kernel.org>
In-Reply-To: <20250627152918.2606728-4-wens@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 12:49:56 +0200
X-Gm-Features: Ac12FXyZZo_gyxde5PGaFmAK7RtmqIBsI-DO5q6_JvOlmtCvpbCBgiSF25u2wFY
Message-ID: <CAPDyKFpqjd-KapYizxPD_=6TmNd7ZHZQVtVTPq_3u+ZutiO0pg@mail.gmail.com>
Subject: Re: [PATCH 3/4] pmdomain: sunxi: add driver for Allwinner A523's
 PCK-600 power controller
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_035033_980626_A693DA1B 
X-CRM114-Status: GOOD (  37.43  )
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

On Fri, 27 Jun 2025 at 17:29, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Allwinner A523 family has a second power controller, named PCK-600 in
> the datasheets and BSP. It is likely based on ARM's PCK-600 hardware
> block, with some additional delay controls. The only documentation for
> this hardware is the BSP driver. The standard registers defined in ARM's
> Power Policy Unit Architecture Specification line up. Some extra delay
> controls are found in the reserved range of registers.
>
> Add a driver for this power controller. Delay control register values
> and power domain names are from the BSP driver.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

FYI, this looks good to me.

Kind regards
Uffe

> ---
>  drivers/pmdomain/sunxi/Kconfig         |   8 +
>  drivers/pmdomain/sunxi/Makefile        |   1 +
>  drivers/pmdomain/sunxi/sun55i-pck600.c | 225 +++++++++++++++++++++++++
>  3 files changed, 234 insertions(+)
>  create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
>
> diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kconfig
> index 43eecb3ea981..3e2b77cd9a2b 100644
> --- a/drivers/pmdomain/sunxi/Kconfig
> +++ b/drivers/pmdomain/sunxi/Kconfig
> @@ -18,3 +18,11 @@ config SUN50I_H6_PRCM_PPU
>           Say y to enable the Allwinner H6/H616 PRCM power domain driver.
>           This is required to enable the Mali GPU in the H616 SoC, it is
>           optional for the H6.
> +
> +config SUN55I_PCK600
> +       bool "Allwinner A523 PCK-600 power domain driver"
> +       depends on PM
> +       select PM_GENERIC_DOMAINS
> +       help
> +         Say y to enable the PCK-600 power domain driver. This saves power
> +         when certain peripherals, such as the video engine, are idle.
> diff --git a/drivers/pmdomain/sunxi/Makefile b/drivers/pmdomain/sunxi/Makefile
> index c1343e123759..e344b232fc9f 100644
> --- a/drivers/pmdomain/sunxi/Makefile
> +++ b/drivers/pmdomain/sunxi/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_SUN20I_PPU)               += sun20i-ppu.o
>  obj-$(CONFIG_SUN50I_H6_PRCM_PPU)       += sun50i-h6-prcm-ppu.o
> +obj-$(CONFIG_SUN55I_PCK600)            += sun55i-pck600.o
> diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
> new file mode 100644
> index 000000000000..7248f6113665
> --- /dev/null
> +++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Allwinner PCK-600 power domain support
> + *
> + * Copyright (c) 2025 Chen-Yu Tsai <wens@csie.org>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +#include <linux/string_choices.h>
> +
> +#define PPU_PWPR    0x0
> +#define PPU_PWSR    0x8
> +#define        PPU_DCDR0   0x170
> +#define PPU_DCDR1   0x174
> +
> +#define PPU_PWSR_PWR_STATUS    GENMASK(3, 0)
> +#define PPU_POWER_MODE_ON      0x8
> +#define PPU_POWER_MODE_OFF     0x0
> +
> +#define PPU_REG_SIZE   0x1000
> +
> +struct sunxi_pck600_desc {
> +       const char * const *pd_names;
> +       unsigned int num_domains;
> +       u32 logic_power_switch0_delay_offset;
> +       u32 logic_power_switch1_delay_offset;
> +       u32 off2on_delay_offset;
> +       u32 device_ctrl0_delay;
> +       u32 device_ctrl1_delay;
> +       u32 logic_power_switch0_delay;
> +       u32 logic_power_switch1_delay;
> +       u32 off2on_delay;
> +};
> +
> +struct sunxi_pck600_pd {
> +       struct generic_pm_domain genpd;
> +       struct sunxi_pck600 *pck;
> +       void __iomem *base;
> +};
> +
> +struct sunxi_pck600 {
> +       struct device *dev;
> +       struct genpd_onecell_data genpd_data;
> +       struct sunxi_pck600_pd pds[];
> +};
> +
> +#define to_sunxi_pd(gpd) container_of(gpd, struct sunxi_pck600_pd, genpd)
> +
> +static int sunxi_pck600_pd_set_power(struct sunxi_pck600_pd *pd, bool on)
> +{
> +       struct sunxi_pck600 *pck = pd->pck;
> +       struct generic_pm_domain *genpd = &pd->genpd;
> +       int ret;
> +       u32 val, reg;
> +
> +       val = on ? PPU_POWER_MODE_ON : PPU_POWER_MODE_OFF;
> +
> +       reg = readl(pd->base + PPU_PWPR);
> +       FIELD_MODIFY(PPU_PWSR_PWR_STATUS, &reg, val);
> +       writel(reg, pd->base + PPU_PWPR);
> +
> +       /* push write out to hardware */
> +       reg = readl(pd->base + PPU_PWPR);
> +
> +       ret = readl_poll_timeout_atomic(pd->base + PPU_PWSR, reg,
> +                                       FIELD_GET(PPU_PWSR_PWR_STATUS, reg) == val,
> +                                       0, 10000);
> +       if (ret)
> +               dev_err(pck->dev, "failed to turn domain \"%s\" %s: %d\n",
> +                       genpd->name, str_on_off(on), ret);
> +
> +       return ret;
> +}
> +
> +static int sunxi_pck600_power_on(struct generic_pm_domain *domain)
> +{
> +       struct sunxi_pck600_pd *pd = to_sunxi_pd(domain);
> +
> +       return sunxi_pck600_pd_set_power(pd, true);
> +}
> +
> +static int sunxi_pck600_power_off(struct generic_pm_domain *domain)
> +{
> +       struct sunxi_pck600_pd *pd = to_sunxi_pd(domain);
> +
> +       return sunxi_pck600_pd_set_power(pd, false);
> +}
> +
> +static void sunxi_pck600_pd_setup(struct sunxi_pck600_pd *pd,
> +                                 const struct sunxi_pck600_desc *desc)
> +{
> +       writel(desc->device_ctrl0_delay, pd->base + PPU_DCDR0);
> +       writel(desc->device_ctrl1_delay, pd->base + PPU_DCDR1);
> +       writel(desc->logic_power_switch0_delay,
> +              pd->base + desc->logic_power_switch0_delay_offset);
> +       writel(desc->logic_power_switch1_delay,
> +              pd->base + desc->logic_power_switch1_delay_offset);
> +       writel(desc->off2on_delay, pd->base + desc->off2on_delay_offset);
> +}
> +
> +static int sunxi_pck600_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       const struct sunxi_pck600_desc *desc;
> +       struct genpd_onecell_data *genpds;
> +       struct sunxi_pck600 *pck;
> +       struct reset_control *rst;
> +       struct clk *clk;
> +       void __iomem *base;
> +       int i, ret;
> +
> +       desc = of_device_get_match_data(dev);
> +
> +       pck = devm_kzalloc(dev, struct_size(pck, pds, desc->num_domains), GFP_KERNEL);
> +       if (!pck)
> +               return -ENOMEM;
> +
> +       pck->dev = &pdev->dev;
> +       platform_set_drvdata(pdev, pck);
> +
> +       genpds = &pck->genpd_data;
> +       genpds->num_domains = desc->num_domains;
> +       genpds->domains = devm_kcalloc(dev, desc->num_domains,
> +                                      sizeof(*genpds->domains), GFP_KERNEL);
> +       if (!genpds->domains)
> +               return -ENOMEM;
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       rst = devm_reset_control_get_exclusive_released(dev, NULL);
> +       if (IS_ERR(rst))
> +               return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
> +
> +       clk = devm_clk_get_enabled(dev, NULL);
> +       if (IS_ERR(clk))
> +               return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
> +
> +       for (i = 0; i < desc->num_domains; i++) {
> +               struct sunxi_pck600_pd *pd = &pck->pds[i];
> +
> +               pd->genpd.name = desc->pd_names[i];
> +               pd->genpd.power_off = sunxi_pck600_power_off;
> +               pd->genpd.power_on = sunxi_pck600_power_on;
> +               pd->base = base + PPU_REG_SIZE * i;
> +
> +               sunxi_pck600_pd_setup(pd, desc);
> +               ret = pm_genpd_init(&pd->genpd, NULL, false);
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "failed to initialize power domain\n");
> +                       goto err_remove_pds;
> +               }
> +
> +               genpds->domains[i] = &pd->genpd;
> +       }
> +
> +       ret = of_genpd_add_provider_onecell(dev_of_node(dev), genpds);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "failed to add PD provider\n");
> +               goto err_remove_pds;
> +       }
> +
> +       return 0;
> +
> +err_remove_pds:
> +       for (i--; i >= 0; i--)
> +               pm_genpd_remove(genpds->domains[i]);
> +
> +       return ret;
> +}
> +
> +static const char * const sun55i_a523_pck600_pd_names[] = {
> +       "VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
> +};
> +
> +static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
> +       .pd_names = sun55i_a523_pck600_pd_names,
> +       .num_domains = ARRAY_SIZE(sun55i_a523_pck600_pd_names),
> +       .logic_power_switch0_delay_offset = 0xc00,
> +       .logic_power_switch1_delay_offset = 0xc04,
> +       .off2on_delay_offset = 0xc10,
> +       .device_ctrl0_delay = 0xffffff,
> +       .device_ctrl1_delay = 0xffff,
> +       .logic_power_switch0_delay = 0x8080808,
> +       .logic_power_switch1_delay = 0x808,
> +       .off2on_delay = 0x8
> +};
> +
> +static const struct of_device_id sunxi_pck600_of_match[] = {
> +       {
> +               .compatible     = "allwinner,sun55i-a523-pck-600",
> +               .data           = &sun55i_a523_pck600_desc,
> +       },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, sunxi_pck600_of_match);
> +
> +static struct platform_driver sunxi_pck600_driver = {
> +       .probe = sunxi_pck600_probe,
> +       .driver = {
> +               .name   = "sunxi-pck-600",
> +               .of_match_table = sunxi_pck600_of_match,
> +               /* Power domains cannot be removed if in use. */
> +               .suppress_bind_attrs = true,
> +       },
> +};
> +module_platform_driver(sunxi_pck600_driver);
> +
> +MODULE_DESCRIPTION("Allwinner PCK-600 power domain driver");
> +MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
> +MODULE_LICENSE("GPL");
> --
> 2.39.5
>

