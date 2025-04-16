Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C7BC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4zpoCMXelSRo9q9VG8KFbKXKYEUsSZYve8Gh3pqDxg=; b=YI5eCT0KzWcRaui+R+Pm544zgi
	aFP19fhZKRf8AGvq0sm808G/BFgg3xdEqg/o9qUPnlJrgD5VrhM7fKPNgWdJ1Yr7djPZuYzs4G1UI
	Z4M0zeMY/Jdj52AD43KC4wkuSU5w+qouU6tLdNFTxBz965L2b1oQcpqjSxl/lvXORdh2jJFEJ96k/
	D/F+/nUDexGyZdgD9r2rDG9y72e96dLG5r+QqIXFjSP1p01nUzQgg9W6tfORHwB9LJQBw2on9vFPF
	0BwnDvA5potnlwrjScXksvPVy0ezdtF3g75zAA7LV9b0Zk4Gj9k7LVCKAecpgOLWr2YvaE/+1d7y+
	wkluwLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54og-0000000A6R3-3Arm;
	Wed, 16 Apr 2025 15:36:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Gu-00000009zUo-1CHe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:01:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 497501595;
	Wed, 16 Apr 2025 08:01:49 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 124A63F66E;
	Wed, 16 Apr 2025 08:01:48 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:01:46 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Boris
 Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/5] pmdomain: sunxi: add H6 PRCM PPU driver
Message-ID: <20250416160146.5338e791@donnerap.manchester.arm.com>
In-Reply-To: <CAPDyKFqne4VLemkkgS948whoNm4pOdvp_CCJ4SSBJOBzt9k2Nw@mail.gmail.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
	<20250221005802.11001-3-andre.przywara@arm.com>
	<CAPDyKFqne4VLemkkgS948whoNm4pOdvp_CCJ4SSBJOBzt9k2Nw@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_080152_424564_160B22CF 
X-CRM114-Status: GOOD (  51.55  )
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

On Thu, 27 Feb 2025 23:43:29 +0100
Ulf Hansson <ulf.hansson@linaro.org> wrote:

Hi Ulf,

sorry for the delay, I actually changed to code according to your comments
back then already, just now find time to come back to this.

> On Fri, 21 Feb 2025 at 02:00, Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > The Allwinner Power Reset Clock Management (RPCM) block contains a few
> > bits that control some power domains. The most prominent one is the one
> > for the Mali GPU. On the Allwinner H6 this domain is enabled at reset, so
> > we didn't care about it so far, but the H616 defaults to it being disabled.
> >
> > Add a power domain driver for those bits. Some BSP code snippets and
> > some spare documentation describe three bits, slightly different between
> > the H6 and H616, so add three power domains for each SoC, connected to
> > their compatible string.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/pmdomain/sunxi/Kconfig              |  10 +
> >  drivers/pmdomain/sunxi/Makefile             |   1 +
> >  drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c | 191 ++++++++++++++++++++
> >  3 files changed, 202 insertions(+)
> >  create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> >
> > diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kconfig
> > index 17781bf8d86d7..43eecb3ea9819 100644
> > --- a/drivers/pmdomain/sunxi/Kconfig
> > +++ b/drivers/pmdomain/sunxi/Kconfig
> > @@ -8,3 +8,13 @@ config SUN20I_PPU
> >         help
> >           Say y to enable the PPU power domain driver. This saves power
> >           when certain peripherals, such as the video engine, are idle.
> > +
> > +config SUN50I_H6_PRCM_PPU
> > +       tristate "Allwinner H6 PRCM power domain driver"
> > +       depends on ARCH_SUNXI || COMPILE_TEST
> > +       depends on PM
> > +       select PM_GENERIC_DOMAINS
> > +       help
> > +         Say y to enable the Allwinner H6/H616 PRCM power domain driver.
> > +         This is required to enable the Mali GPU in the H616 SoC, it is
> > +         optional for the H6.
> > diff --git a/drivers/pmdomain/sunxi/Makefile b/drivers/pmdomain/sunxi/Makefile
> > index ec1d7a2fb21db..c1343e1237599 100644
> > --- a/drivers/pmdomain/sunxi/Makefile
> > +++ b/drivers/pmdomain/sunxi/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_SUN20I_PPU)               += sun20i-ppu.o
> > +obj-$(CONFIG_SUN50I_H6_PRCM_PPU)       += sun50i-h6-prcm-ppu.o
> > diff --git a/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> > new file mode 100644
> > index 0000000000000..1c6b0c78b222d
> > --- /dev/null
> > +++ b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> > @@ -0,0 +1,191 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) Arm Ltd. 2024
> > + *
> > + * Allwinner H6/H616 PRCM power domain driver.
> > + * This covers a few registers inside the PRCM (Power Reset Clock Management)
> > + * block that control some power rails, most prominently for the Mali GPU.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/reset.h>
> > +
> > +/*
> > + * The PRCM block covers multiple devices, starting with some clocks,
> > + * then followed by the power rails.
> > + * The clocks are covered by a different driver, so this driver's MMIO range
> > + * starts later in the PRCM MMIO frame, not at the beginning of it.
> > + * To keep the register offsets consistent with other PRCM documentation,
> > + * express the registers relative to the beginning of the whole PRCM, and
> > + * subtract the PPU offset this driver is bound to.
> > + */
> > +#define PD_H6_PPU_OFFSET               0x250
> > +#define PD_H6_VDD_SYS_REG              0x250
> > +#define PD_H616_ANA_VDD_GATE                   BIT(4)
> > +#define PD_H6_CPUS_VDD_GATE                    BIT(3)
> > +#define PD_H6_AVCC_VDD_GATE                    BIT(2)
> > +#define PD_H6_GPU_REG                  0x254
> > +#define PD_H6_GPU_GATE                         BIT(0)
> > +
> > +struct sun50i_h6_ppu_pd {
> > +       struct generic_pm_domain        genpd;
> > +       void __iomem                    *reg;
> > +       u32                             gate_mask;
> > +       bool                            negated;
> > +};
> > +
> > +#define FLAG_PPU_ALWAYS_ON     BIT(0)
> > +#define FLAG_PPU_NEGATED       BIT(1)
> > +
> > +struct sun50i_h6_ppu_desc {
> > +       const char *name;
> > +       u32 offset;
> > +       u32 mask;
> > +       unsigned int flags;
> > +};
> > +
> > +struct sun50i_h6_ppu_desc sun50i_h6_ppus[] = {
> > +       { "AVCC", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE },
> > +       { "CPUS", PD_H6_VDD_SYS_REG, PD_H6_CPUS_VDD_GATE },
> > +       { "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE },
> > +       {}
> > +};  
> 
> I suggest we define a new struct (perhaps sun50_domain_data!?) that
> has a struct sun50i_h6_ppu_desc* member along with a size_t member to
> keep the number of the domains, set by using ARRAY_SIZE().
> 
> In this way we don't need the additional NULL domain at the end - and
> we can also avoid looping through the array during probe  to count
> them.

OK, I implemented it that way, indeed removes the need for the extra
iteration of all entries.

> > +
> > +struct sun50i_h6_ppu_desc sun50i_h616_ppus[] = {
> > +       { "PLL", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE,
> > +               FLAG_PPU_ALWAYS_ON | FLAG_PPU_NEGATED },
> > +       { "ANA", PD_H6_VDD_SYS_REG, PD_H616_ANA_VDD_GATE, FLAG_PPU_ALWAYS_ON },
> > +       { "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE, FLAG_PPU_NEGATED },
> > +       {}
> > +};
> > +#define to_sun50i_h6_ppu_pd(_genpd) \
> > +       container_of(_genpd, struct sun50i_h6_ppu_pd, genpd)
> > +
> > +static bool sun50i_h6_ppu_power_status(const struct sun50i_h6_ppu_pd *pd)
> > +{
> > +       bool bit = readl(pd->reg) & pd->gate_mask;
> > +
> > +       return bit ^ pd->negated;
> > +}
> > +
> > +static int sun50i_h6_ppu_pd_set_power(const struct sun50i_h6_ppu_pd *pd,
> > +                                     bool set_bit)
> > +{
> > +       u32 reg = readl(pd->reg);
> > +
> > +       if (set_bit)
> > +               writel(reg | pd->gate_mask, pd->reg);
> > +       else
> > +               writel(reg & ~pd->gate_mask, pd->reg);
> > +
> > +       return 0;
> > +}
> > +
> > +static int sun50i_h6_ppu_pd_power_on(struct generic_pm_domain *genpd)
> > +{
> > +       const struct sun50i_h6_ppu_pd *pd = to_sun50i_h6_ppu_pd(genpd);
> > +
> > +       return sun50i_h6_ppu_pd_set_power(pd, !pd->negated);
> > +}
> > +
> > +static int sun50i_h6_ppu_pd_power_off(struct generic_pm_domain *genpd)
> > +{
> > +       const struct sun50i_h6_ppu_pd *pd = to_sun50i_h6_ppu_pd(genpd);
> > +
> > +       return sun50i_h6_ppu_pd_set_power(pd, pd->negated);
> > +}
> > +
> > +static int sun50i_h6_ppu_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct genpd_onecell_data *ppu;
> > +       struct sun50i_h6_ppu_pd *pds;
> > +       const struct sun50i_h6_ppu_desc *desc;
> > +       void __iomem *base;
> > +       int ret, i, count;
> > +
> > +       desc = of_device_get_match_data(dev);
> > +       if (!desc)
> > +               return -EINVAL;
> > +
> > +       for (count = 0; desc[count].name; count++)
> > +               ;
> > +
> > +       pds = devm_kcalloc(dev, count, sizeof(*pds), GFP_KERNEL);
> > +       if (!pds)
> > +               return -ENOMEM;
> > +
> > +       ppu = devm_kzalloc(dev, sizeof(*ppu), GFP_KERNEL);
> > +       if (!ppu)
> > +               return -ENOMEM;
> > +
> > +       ppu->num_domains = count;
> > +       ppu->domains = devm_kcalloc(dev, count, sizeof(*ppu->domains),
> > +                                   GFP_KERNEL);
> > +       if (!ppu->domains)
> > +               return -ENOMEM;
> > +
> > +       platform_set_drvdata(pdev, ppu);
> > +
> > +       base = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(base))
> > +               return PTR_ERR(base);
> > +
> > +       for (i = 0; i < count; i++) {
> > +               struct sun50i_h6_ppu_pd *pd = &pds[i];
> > +
> > +               pd->genpd.name          = desc[i].name;
> > +               pd->genpd.power_off     = sun50i_h6_ppu_pd_power_off;
> > +               pd->genpd.power_on      = sun50i_h6_ppu_pd_power_on;
> > +               if (desc[i].flags & FLAG_PPU_ALWAYS_ON)
> > +                       pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
> > +               pd->negated             = !!(desc[i].flags & FLAG_PPU_NEGATED);
> > +               pd->reg                 = base + desc[i].offset - PD_H6_PPU_OFFSET;
> > +               pd->gate_mask           = desc[i].mask;
> > +
> > +               ret = pm_genpd_init(&pd->genpd, NULL,
> > +                                   !sun50i_h6_ppu_power_status(pd));
> > +               if (ret) {
> > +                       dev_warn(dev, "Failed to add GPU power domain: %d\n", ret);
> > +                       return ret;
> > +               }
> > +               ppu->domains[i] = &pd->genpd;
> > +       }
> > +
> > +       ret = of_genpd_add_provider_onecell(dev->of_node, ppu);
> > +       if (ret)
> > +               dev_warn(dev, "Failed to add provider: %d\n", ret);  
> 
> If of_genpd_add_provider_onecell() fails, shouldn't we remove the
> genpds in the error path?

Ah, good point, I was put off by the name "init" in pm_genpd_init(), but I
see that it does an allocation in there, so would need to be paired with
the remove on the error path.
I also added a goto to deal with a failed init in the middle of the loop
above, so that it cleans up the already registered genpds.
I tested this lightly by faking an error return for the 3rd
pm_genpd_init() call, and seeing the other genpds being cleaned up.

So thanks for your comments and the heads up, v2 incoming.

Cheers,
Andre

> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id sun50i_h6_ppu_of_match[] = {
> > +       { .compatible   = "allwinner,sun50i-h6-prcm-ppu",
> > +         .data         = &sun50i_h6_ppus },
> > +       { .compatible   = "allwinner,sun50i-h616-prcm-ppu",
> > +         .data         = &sun50i_h616_ppus },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, sun50i_h6_ppu_of_match);
> > +
> > +static struct platform_driver sun50i_h6_ppu_driver = {
> > +       .probe  = sun50i_h6_ppu_probe,
> > +       .driver = {
> > +               .name                   = "sun50i-h6-prcm-ppu",
> > +               .of_match_table         = sun50i_h6_ppu_of_match,
> > +               /* Power domains cannot be removed while they are in use. */
> > +               .suppress_bind_attrs    = true,
> > +       },
> > +};
> > +module_platform_driver(sun50i_h6_ppu_driver);
> > +
> > +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> > +MODULE_DESCRIPTION("Allwinner H6 PRCM power domain driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.46.3
> >  
> 
> Kind regards
> Uffe


