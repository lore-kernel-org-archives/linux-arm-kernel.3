Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148D5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVhR2hLHLi9hBr30OMbQ9jGMgnfMq+j3RfhjudSluRw=; b=sT/WV1q5JYP8aiOAHubeyZuqyN
	4+2U/5jW3qkCPltO6BnCHcTMiedRg6blW+Gw/oW/DyJqYlREeSRWPy0LMskJeGdZke8ELGZxX+MFO
	3haG8h+bahAjHX4LKFOHgenE5oMxvYLgosYJRC03qXP12U2uY2WZbTGdDOluYxvluQkSHUO6Aqppc
	WFjE4R1pO8JJFa29sajHT2eAzaF3Vx1vplmUTW1Lqj6okR7YpcCcMgJgfQF2zJAkTtpbr9fWFuLvP
	Mv50BwZ0vnK6tg6E412zSsV5oE3gf945rK0e2HG7asfA+Z0G4KvrffsotA+jXdkbjUrhTEGn9svM3
	9ooMxGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807g-0000000ErA8-11M4;
	Thu, 24 Apr 2025 17:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zto-0000000EpWt-0jy4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 16:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PVhR2hLHLi9hBr30OMbQ9jGMgnfMq+j3RfhjudSluRw=; b=GsZokbSgowoxubep1TrtVR8knJ
	I+6sFKRgN5DN8FdSHQ2Gh2KS3IgiQC1F9eqNATe4KeH+8m8qiqqLYGZZ9mHi0MqkW+wHeA31f3FDD
	ZLY10EcJwe2fZmJADaisxPpVJuqpMDg8zyVDfViVOBr23lVHpX2zFr/R+ao6NQIiBmZV6yQlEIX9x
	5U311y5kZ46iYJadY8mTuAMvOPaVKrqakxlkWj+OV4rdnfpeoxB/Hts3M4Mzapv7HlWqiJ18D6oLq
	LKxTHOIW0H8n378kQyvAox0IRV8tq7u28FbDbSX1qm2S87slYOggH3Bz8nQrEtwOZHvnj0BnPlHFJ
	EHLmhMeg==;
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ztl-0000000Brpf-0zfu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:58:07 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6fda22908d9so11000527b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513883; x=1746118683; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PVhR2hLHLi9hBr30OMbQ9jGMgnfMq+j3RfhjudSluRw=;
        b=RF/dHpclSOcbKVneye/ybDkA0QPwkcCKv6n0UHHFzlq/W2vMPVYo8zNekn1pLutg1f
         QtDZeNsyfDDTbLk3YE4gyl2YENZQmOiTOUZ+gm+cDJKxqZMqif/Br8hT0VOeq4Z3jkCt
         VQumWr05pMHpgjZb7NgjAYdSykPpIHGtHh3A9tHni6SazPqHzS7dc/S92i+bp0WrA9Qk
         CMH2LlEuWKPsWlbhzvZH0rQLq7FD0f2gqy234HveQc2Bw9QVaLjLtZGAMs5DA7LpD9lK
         4j6ajGXIvFJ41CEDmh/q7MO/1C6H9T21TwXn+zKPCBa4lX9lb+kUWc9+G4AgzkjcfysL
         TruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513883; x=1746118683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVhR2hLHLi9hBr30OMbQ9jGMgnfMq+j3RfhjudSluRw=;
        b=BI0KUYlI2f1uUqycXwzRpl66xJj52YOEWLWUXEIN/r/sBwmsstT9NZrUWSCxCsHg4g
         ghv+50L1pX+BTCiyz5x/5Xud3XgfggLe2fK723rp11f2SH5aQPuzcperZmi4V5u99+++
         zAUqiRcsBK6+9OzI9XgJxi0T9dX2MG27I9t7+9ZVdqDWjDbnTGgjP+Gf46hdszci2R7A
         um7aGYJJn2pvrqTXPceZ1FmajBfBwYEhOxPczekIFaQYVdgEc8oMUAyaHzpNYOXBrLWk
         lPPiqIzcAnh40XHo/4NN6O7+ey77D6qZLSw6Ukvh5+/OdQdKzE3akiUwY3KowZVCTnb+
         128Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqxfJCwbIW5YmNjVc4Wk39RqduRmigU8/jbygtH27R2fDU0LwPiSrjz9pFxa+pRzRWD826pJzJKDWgEjqEznux@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/V+rFpI7f55kyNIY6GKuokuln/Mz4EFZTBEaH5GoW0rj6EDtL
	980oV2ernUHcO78MAZVemqEcK61utXsDZmfts/dlne0K6qjRFkU+P3QsJFgnlx1OjSeDldBYl9n
	WgpZmQmzbZWW06/qI8328BV3yW3xxtFOR4OASqg==
X-Gm-Gg: ASbGnct627bl7mFp3+Qqg4W11dDi3PuSrO3xcVqw93Q6Nu6eM05Vie3FAQACPhfnGXx
	Dj3f/PDFTCMlReTyhDw+O4w/Zy8bHWvTcwF18m3NotuybWJvta6Kz772UE8gwkIfot8OT1WWEB1
	0kKuWjuTtRl3AM/cSuBZS2Rop2riQ7Z+JATQ==
X-Google-Smtp-Source: AGHT+IHSsh/kmYkn+WFgtXin2ugMOVreggmMbrbDjCJDUl4G4egWdalbyROVRXdskuUNfx7wc+7/u/hJdLHgKm/EwTI=
X-Received: by 2002:a05:690c:7449:b0:702:5926:8609 with SMTP id
 00721157ae682-7084efe39f2mr7183287b3.12.1745513882778; Thu, 24 Apr 2025
 09:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250416224839.9840-1-andre.przywara@arm.com> <20250416224839.9840-3-andre.przywara@arm.com>
In-Reply-To: <20250416224839.9840-3-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:25 +0200
X-Gm-Features: ATxdqUFR8Hq7WOkuFgj-ubpob4xQ7WjUuRyyTbKB719qT0w2HuvbM4JN7_zT25o
Message-ID: <CAPDyKFoOMy43uFJ5S09+y0cwE-eFttx-PZgWdGmjjdi9oonJDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pmdomain: sunxi: add H6 PRCM PPU driver
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_175805_418004_A449425A 
X-CRM114-Status: GOOD (  38.90  )
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

On Thu, 17 Apr 2025 at 00:49, Andre Przywara <andre.przywara@arm.com> wrote:
>
> The Allwinner Power Reset Clock Management (RPCM) block contains a few
> bits that control some power domains. The most prominent one is the one
> for the Mali GPU. On the Allwinner H6 this domain is enabled at reset, so
> we didn't care about it so far, but the H616 defaults to it being disabled.
>
> Add a power domain driver for those bits. Some BSP code snippets and
> some spare documentation describe three bits, slightly different between
> the H6 and H616, so add three power domains for each SoC, connected to
> their compatible string.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/sunxi/Kconfig              |  10 +
>  drivers/pmdomain/sunxi/Makefile             |   1 +
>  drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c | 208 ++++++++++++++++++++
>  3 files changed, 219 insertions(+)
>  create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
>
> diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kconfig
> index 17781bf8d86d7..43eecb3ea9819 100644
> --- a/drivers/pmdomain/sunxi/Kconfig
> +++ b/drivers/pmdomain/sunxi/Kconfig
> @@ -8,3 +8,13 @@ config SUN20I_PPU
>         help
>           Say y to enable the PPU power domain driver. This saves power
>           when certain peripherals, such as the video engine, are idle.
> +
> +config SUN50I_H6_PRCM_PPU
> +       tristate "Allwinner H6 PRCM power domain driver"
> +       depends on ARCH_SUNXI || COMPILE_TEST
> +       depends on PM
> +       select PM_GENERIC_DOMAINS
> +       help
> +         Say y to enable the Allwinner H6/H616 PRCM power domain driver.
> +         This is required to enable the Mali GPU in the H616 SoC, it is
> +         optional for the H6.
> diff --git a/drivers/pmdomain/sunxi/Makefile b/drivers/pmdomain/sunxi/Makefile
> index ec1d7a2fb21db..c1343e1237599 100644
> --- a/drivers/pmdomain/sunxi/Makefile
> +++ b/drivers/pmdomain/sunxi/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_SUN20I_PPU)               += sun20i-ppu.o
> +obj-$(CONFIG_SUN50I_H6_PRCM_PPU)       += sun50i-h6-prcm-ppu.o
> diff --git a/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> new file mode 100644
> index 0000000000000..d59644499dfe0
> --- /dev/null
> +++ b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) Arm Ltd. 2024
> + *
> + * Allwinner H6/H616 PRCM power domain driver.
> + * This covers a few registers inside the PRCM (Power Reset Clock Management)
> + * block that control some power rails, most prominently for the Mali GPU.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset.h>
> +
> +/*
> + * The PRCM block covers multiple devices, starting with some clocks,
> + * then followed by the power rails.
> + * The clocks are covered by a different driver, so this driver's MMIO range
> + * starts later in the PRCM MMIO frame, not at the beginning of it.
> + * To keep the register offsets consistent with other PRCM documentation,
> + * express the registers relative to the beginning of the whole PRCM, and
> + * subtract the PPU offset this driver is bound to.
> + */
> +#define PD_H6_PPU_OFFSET               0x250
> +#define PD_H6_VDD_SYS_REG              0x250
> +#define PD_H616_ANA_VDD_GATE                   BIT(4)
> +#define PD_H6_CPUS_VDD_GATE                    BIT(3)
> +#define PD_H6_AVCC_VDD_GATE                    BIT(2)
> +#define PD_H6_GPU_REG                  0x254
> +#define PD_H6_GPU_GATE                         BIT(0)
> +
> +struct sun50i_h6_ppu_pd {
> +       struct generic_pm_domain        genpd;
> +       void __iomem                    *reg;
> +       u32                             gate_mask;
> +       bool                            negated;
> +};
> +
> +#define FLAG_PPU_ALWAYS_ON     BIT(0)
> +#define FLAG_PPU_NEGATED       BIT(1)
> +
> +struct sun50i_h6_ppu_desc {
> +       const char *name;
> +       u32 offset;
> +       u32 mask;
> +       unsigned int flags;
> +};
> +
> +static const struct sun50i_h6_ppu_desc sun50i_h6_ppus[] = {
> +       { "AVCC", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE },
> +       { "CPUS", PD_H6_VDD_SYS_REG, PD_H6_CPUS_VDD_GATE },
> +       { "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE },
> +};
> +static const struct sun50i_h6_ppu_desc sun50i_h616_ppus[] = {
> +       { "PLL", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE,
> +               FLAG_PPU_ALWAYS_ON | FLAG_PPU_NEGATED },
> +       { "ANA", PD_H6_VDD_SYS_REG, PD_H616_ANA_VDD_GATE, FLAG_PPU_ALWAYS_ON },
> +       { "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE, FLAG_PPU_NEGATED },
> +};
> +
> +struct sun50i_h6_ppu_data {
> +       const struct sun50i_h6_ppu_desc *descs;
> +       int nr_domains;
> +};
> +
> +static const struct sun50i_h6_ppu_data sun50i_h6_ppu_data = {
> +       .descs = sun50i_h6_ppus,
> +       .nr_domains = ARRAY_SIZE(sun50i_h6_ppus),
> +};
> +
> +static const struct sun50i_h6_ppu_data sun50i_h616_ppu_data = {
> +       .descs = sun50i_h616_ppus,
> +       .nr_domains = ARRAY_SIZE(sun50i_h616_ppus),
> +};
> +
> +#define to_sun50i_h6_ppu_pd(_genpd) \
> +       container_of(_genpd, struct sun50i_h6_ppu_pd, genpd)
> +
> +static bool sun50i_h6_ppu_power_status(const struct sun50i_h6_ppu_pd *pd)
> +{
> +       bool bit = readl(pd->reg) & pd->gate_mask;
> +
> +       return bit ^ pd->negated;
> +}
> +
> +static int sun50i_h6_ppu_pd_set_power(const struct sun50i_h6_ppu_pd *pd,
> +                                     bool set_bit)
> +{
> +       u32 reg = readl(pd->reg);
> +
> +       if (set_bit)
> +               writel(reg | pd->gate_mask, pd->reg);
> +       else
> +               writel(reg & ~pd->gate_mask, pd->reg);
> +
> +       return 0;
> +}
> +
> +static int sun50i_h6_ppu_pd_power_on(struct generic_pm_domain *genpd)
> +{
> +       const struct sun50i_h6_ppu_pd *pd = to_sun50i_h6_ppu_pd(genpd);
> +
> +       return sun50i_h6_ppu_pd_set_power(pd, !pd->negated);
> +}
> +
> +static int sun50i_h6_ppu_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +       const struct sun50i_h6_ppu_pd *pd = to_sun50i_h6_ppu_pd(genpd);
> +
> +       return sun50i_h6_ppu_pd_set_power(pd, pd->negated);
> +}
> +
> +static int sun50i_h6_ppu_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct genpd_onecell_data *ppu;
> +       struct sun50i_h6_ppu_pd *pds;
> +       const struct sun50i_h6_ppu_data *data;
> +       void __iomem *base;
> +       int ret, i;
> +
> +       data = of_device_get_match_data(dev);
> +       if (!data)
> +               return -EINVAL;
> +
> +       pds = devm_kcalloc(dev, data->nr_domains, sizeof(*pds), GFP_KERNEL);
> +       if (!pds)
> +               return -ENOMEM;
> +
> +       ppu = devm_kzalloc(dev, sizeof(*ppu), GFP_KERNEL);
> +       if (!ppu)
> +               return -ENOMEM;
> +
> +       ppu->num_domains = data->nr_domains;
> +       ppu->domains = devm_kcalloc(dev, data->nr_domains,
> +                                   sizeof(*ppu->domains), GFP_KERNEL);
> +       if (!ppu->domains)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, ppu);
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       for (i = 0; i < data->nr_domains; i++) {
> +               struct sun50i_h6_ppu_pd *pd = &pds[i];
> +               const struct sun50i_h6_ppu_desc *desc = &data->descs[i];
> +
> +               pd->genpd.name          = desc->name;
> +               pd->genpd.power_off     = sun50i_h6_ppu_pd_power_off;
> +               pd->genpd.power_on      = sun50i_h6_ppu_pd_power_on;
> +               if (desc->flags & FLAG_PPU_ALWAYS_ON)
> +                       pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
> +               pd->negated             = !!(desc->flags & FLAG_PPU_NEGATED);
> +               pd->reg                 = base + desc->offset - PD_H6_PPU_OFFSET;
> +               pd->gate_mask           = desc->mask;
> +
> +               ret = pm_genpd_init(&pd->genpd, NULL,
> +                                   !sun50i_h6_ppu_power_status(pd));
> +               if (ret) {
> +                       dev_warn(dev, "Failed to add %s power domain: %d\n",
> +                                desc->name, ret);
> +                       goto out_remove_pds;
> +               }
> +               ppu->domains[i] = &pd->genpd;
> +       }
> +
> +       ret = of_genpd_add_provider_onecell(dev->of_node, ppu);
> +       if (!ret)
> +               return 0;
> +
> +       dev_warn(dev, "Failed to add provider: %d\n", ret);
> +out_remove_pds:
> +       for (i--; i >= 0; i--)
> +               pm_genpd_remove(&pds[i].genpd);
> +
> +       return ret;
> +}
> +
> +static const struct of_device_id sun50i_h6_ppu_of_match[] = {
> +       { .compatible   = "allwinner,sun50i-h6-prcm-ppu",
> +         .data         = &sun50i_h6_ppu_data },
> +       { .compatible   = "allwinner,sun50i-h616-prcm-ppu",
> +         .data         = &sun50i_h616_ppu_data },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, sun50i_h6_ppu_of_match);
> +
> +static struct platform_driver sun50i_h6_ppu_driver = {
> +       .probe  = sun50i_h6_ppu_probe,
> +       .driver = {
> +               .name                   = "sun50i-h6-prcm-ppu",
> +               .of_match_table         = sun50i_h6_ppu_of_match,
> +               /* Power domains cannot be removed while they are in use. */
> +               .suppress_bind_attrs    = true,
> +       },
> +};
> +module_platform_driver(sun50i_h6_ppu_driver);
> +
> +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> +MODULE_DESCRIPTION("Allwinner H6 PRCM power domain driver");
> +MODULE_LICENSE("GPL");
> --
> 2.46.3
>

