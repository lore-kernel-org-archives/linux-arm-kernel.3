Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ED1CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCzMVuNyvj4CwzWZJSgJ/7ZOk+cXNaVody6HWjxlZHs=; b=ygUA5xTToVuucp3P116wLgyrpe
	52dVKciAzBbxtJKPjEWXW5NzhOiVZkQU9OwSlTfdmuNz23zGIZZzVnXhvFqRluw6hlRc4dNofZfrY
	HAVsU5oNRcjbYJ64U38xp8kTv9arvSxbTf7fX++RDdPD2sIiNmC0x8Bd27AcfyKAfecMMPdGkq3p6
	vYwIDTVz/aCCwyRTGHJd1pLprV7iAA9GrG6cvCoz94lfOLghcTNZlUbVMPXl0TEfik58e87/sJhSo
	MhIeRIUri+AWHUpp44ttaj8YOFEGFp0/KFkEIEmm1/sCDvDF73LVq7IlISIIImFrjXoUBcY5zZ20M
	pZTpQYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLDE-0000000AOR7-36cW;
	Tue, 19 Aug 2025 12:13:12 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJQ0-0000000A6eL-49wm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:18:18 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e933f00bc9bso2789986276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755598696; x=1756203496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCzMVuNyvj4CwzWZJSgJ/7ZOk+cXNaVody6HWjxlZHs=;
        b=ptaQL2X0gNywL/STx+MOD7Xn5CdnSjhQBajr2udQEh9aK4FUvGG5gOjcI2OEonWjLO
         aVPuFn0UBFgKWtZ7cgb3BtFghiN4QuxhKHsYpZ+smAlEG/krotnTVIoqMBkxIBB4i9oG
         +x75ZGydTnue7Sd5d4vkT8tKSisqxykR590+A7RTmmFI8BLla6139b4mzoz/DD1MVjVN
         KWd6q5SPUDalU03riichMBVYoBinqbIezjHWH4TRe+dEl17SXGa1hdYOYWjtkpLoiqIO
         XKUQpPA52Slp1KPm+kgBN9tvcnBJmObXosDdXMAnbnRF7KB4HRs6DbqALwo58+KTylpj
         iN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598696; x=1756203496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCzMVuNyvj4CwzWZJSgJ/7ZOk+cXNaVody6HWjxlZHs=;
        b=RPY4kj95jqYiJMMbgsw2qkNYVPzM8x07Oyw1+w87FveEkUCfmQBMeBu7a+qw/KeJfI
         XUvFWn7grkm6KmF7DEK9KMZh8iuJwLtikJPOFN6st5d9eK9W3wE+oZ1c6CSWKjnbDASo
         /2WVXM++258J15KaOT9k8YHHq7o6MAu73m+psqbeK308U7OT5n1xQMSiJCJCFST7bDVP
         4la7emsnj/kq0wnrMHHhuDG/DVJ37pNPFvSwBwhSZYZkCeR87K2ff4+myNnbMAetWKLQ
         9zIO1D4MQvfNHNK3ctlPxX0B+bNxO/xntoBIaYyjcdFzPSCJPJ93xzZWDwRl7UQrocY0
         6s+w==
X-Forwarded-Encrypted: i=1; AJvYcCUlGYZtiYSqU+m0xznkw2hExc3oDNafiwrVlDtJUIkUwa+9NfhbK8faQZdGb/xvN2R8RrY/TKuEA2iJR19+roOe@lists.infradead.org
X-Gm-Message-State: AOJu0YxqdQjtUO5N2NvS+bBx5PjzjMo9/SpfXrPZ8vub49CjXl5UhIpK
	YZMmrhaBBQxvU6alWi0asLndCiS8hyxdnl/cy22/wiUzQ6J/WHivhDw159zmeAsEU5zjmWBjo9b
	n+5J3oZaIspf+ehmwHzwo1TOyvB2gVk1tmd87XTNYiA==
X-Gm-Gg: ASbGncuC9DCkezwT0XVIYNnt7esbkL8lIcWfDTgrAc+/YvhAS3+Zb1HAG7Sd5H5H3gL
	yGkACm3NwYr7Fm7o4OG0jiUW/FHkkzFSVE0zvL1mavj8oGntBtWGJNimCJM+Pd6tK5ed7vcQXIM
	w3pDBeuShi2tpEl/7j/ayaphSUiXQNg5x9xpc6WRbMHH8mqnVPb0nlMU+OMbumy/j8HGa2HSW5x
	mDf3Oc=
X-Google-Smtp-Source: AGHT+IHEAcO4SzwVu/XD+eGRTC4UNMEX1DV9hFXIwthyq8vKu+pFu02fbBz9fqX6dEsIgcRwLnjixkKRX2KKqzoF0aA=
X-Received: by 2002:a05:6902:f86:b0:e8e:1e32:c2ac with SMTP id
 3f1490d57ef6-e94e60b40f0mr2106357276.16.1755598695665; Tue, 19 Aug 2025
 03:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz> <20250806-pxa1908-genpd-v1-3-16409309fc72@dujemihanovic.xyz>
In-Reply-To: <20250806-pxa1908-genpd-v1-3-16409309fc72@dujemihanovic.xyz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Aug 2025 12:17:39 +0200
X-Gm-Features: Ac12FXwwCWVlz3SBUxWoOpDMHjQLKe8Y27bp2RrWfHQeBsjz0TJO18qciB6F97s
Message-ID: <CAPDyKFqio19zCx+XXgqS-MqUpc-m5Q4J=Wn8wPsB+fQ61fnWMw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] pmdomain: marvell: Add PXA1908 power domains
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_031817_048650_952E0D70 
X-CRM114-Status: GOOD (  27.12  )
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

On Wed, 6 Aug 2025 at 19:35, Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz> w=
rote:
>
> Marvell's PXA1908 SoC has a few power domains for its VPU, GPU, image
> processor and DSI PHY. Add a driver to control these.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

FYI, overall this looks okay to me, but I will review your next
version more in detail.

Kind regards
Uffe

> ---
>  drivers/pmdomain/Kconfig                           |   1 +
>  drivers/pmdomain/Makefile                          |   1 +
>  drivers/pmdomain/marvell/Kconfig                   |  16 +
>  drivers/pmdomain/marvell/Makefile                  |   3 +
>  .../pmdomain/marvell/pxa1908-power-controller.c    | 347 +++++++++++++++=
++++++
>  5 files changed, 368 insertions(+)
>
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 91f04ace35d4b024fafdf6af4e26a179640eb82f..23076ae90e6641dea8e5dbc85=
1d041cd7929cee6 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -7,6 +7,7 @@ source "drivers/pmdomain/apple/Kconfig"
>  source "drivers/pmdomain/arm/Kconfig"
>  source "drivers/pmdomain/bcm/Kconfig"
>  source "drivers/pmdomain/imx/Kconfig"
> +source "drivers/pmdomain/marvell/Kconfig"
>  source "drivers/pmdomain/mediatek/Kconfig"
>  source "drivers/pmdomain/qcom/Kconfig"
>  source "drivers/pmdomain/renesas/Kconfig"
> diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
> index 7030f44a49df9e91b1c9d1b6d12690a6248671fb..ebc802f13eb953db750f5a950=
7caa64c637a957a 100644
> --- a/drivers/pmdomain/Makefile
> +++ b/drivers/pmdomain/Makefile
> @@ -5,6 +5,7 @@ obj-y                                   +=3D apple/
>  obj-y                                  +=3D arm/
>  obj-y                                  +=3D bcm/
>  obj-y                                  +=3D imx/
> +obj-y                                  +=3D marvell/
>  obj-y                                  +=3D mediatek/
>  obj-y                                  +=3D qcom/
>  obj-y                                  +=3D renesas/
> diff --git a/drivers/pmdomain/marvell/Kconfig b/drivers/pmdomain/marvell/=
Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..be2036726cc563ba2a3d1a82c=
a24763e2148fec2
> --- /dev/null
> +++ b/drivers/pmdomain/marvell/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "Marvell PM Domains"
> +       depends on ARCH_MMP || COMPILE_TEST
> +
> +config PXA1908_PM_DOMAINS
> +       tristate "Marvell PXA1908 power domains"
> +       depends on OF
> +       depends on PM
> +       default ARCH_MMP && ARM64
> +       select REGMAP
> +       select PM_GENERIC_DOMAINS
> +       help
> +         Say Y here to enable support for Marvell PXA1908's power domain=
s.
> +
> +endmenu
> diff --git a/drivers/pmdomain/marvell/Makefile b/drivers/pmdomain/marvell=
/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..6163bcbcb00ca7256e4c89311=
7b7443b6fb195e7
> --- /dev/null
> +++ b/drivers/pmdomain/marvell/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_PXA1908_PM_DOMAINS)       +=3D pxa1908-power-controller.o
> diff --git a/drivers/pmdomain/marvell/pxa1908-power-controller.c b/driver=
s/pmdomain/marvell/pxa1908-power-controller.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8940e6dc2eaad2b14e9e6d8a=
a875c11e114b9dd
> --- /dev/null
> +++ b/drivers/pmdomain/marvell/pxa1908-power-controller.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/of_clk.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +#include <dt-bindings/power/marvell,pxa1908-power.h>
> +
> +/* VPU, GPU, ISP */
> +#define APMU_PWR_CTRL_REG      0xd8
> +#define APMU_PWR_BLK_TMR_REG   0xdc
> +#define APMU_PWR_STATUS_REG    0xf0
> +
> +/* DSI */
> +#define APMU_DEBUG             0x88
> +#define DSI_PHY_DVM_MASK       BIT(31)
> +
> +#define POWER_ON_LATENCY_US    300
> +#define POWER_OFF_LATENCY_US   20
> +
> +struct pxa1908_pd_ctrl {
> +       struct genpd_onecell_data onecell_data;
> +       struct regmap *base;
> +       struct generic_pm_domain *domains[];
> +};
> +
> +struct pxa1908_pd_data {
> +       u32 reg_clk_res_ctrl;
> +       u32 hw_mode;
> +       u32 pwr_state;
> +       bool keep_on;
> +       int id;
> +};
> +
> +struct pxa1908_pd {
> +       const struct pxa1908_pd_data data;
> +       struct generic_pm_domain genpd;
> +       struct clk_bulk_data *clks;
> +       struct device *dev;
> +       bool initialized;
> +       int num_clks;
> +};
> +
> +static bool pxa1908_pd_is_on(struct pxa1908_pd *pd)
> +{
> +       struct pxa1908_pd_ctrl *ctrl =3D dev_get_drvdata(pd->dev);
> +
> +       return regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data=
.pwr_state);
> +}
> +
> +static int pxa1908_pd_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D dev_get_drvdata(pd->dev);
> +       const struct pxa1908_pd_data *data =3D &pd->data;
> +       unsigned int status;
> +       int ret =3D 0;
> +
> +       if (pd->clks)
> +               ret =3D clk_bulk_prepare_enable(pd->num_clks, pd->clks);
> +
> +       regmap_set_bits(ctrl->base, data->reg_clk_res_ctrl, data->hw_mode=
);
> +       if (data->id !=3D PXA1908_POWER_DOMAIN_ISP)
> +               regmap_write(ctrl->base, APMU_PWR_BLK_TMR_REG, 0x20001fff=
);
> +       regmap_set_bits(ctrl->base, APMU_PWR_CTRL_REG, data->pwr_state);
> +
> +       usleep_range(POWER_ON_LATENCY_US, POWER_ON_LATENCY_US * 2);
> +
> +       ret =3D regmap_read_poll_timeout(ctrl->base, APMU_PWR_STATUS_REG,=
 status,
> +                                      status & data->pwr_state, 6, 25 * =
USEC_PER_MSEC);
> +       if (ret =3D=3D -ETIMEDOUT)
> +               dev_err(pd->dev, "timed out powering on domain '%s'\n", p=
d->genpd.name);
> +
> +       if (pd->clks)
> +               clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +
> +       return ret;
> +}
> +
> +static int pxa1908_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D dev_get_drvdata(pd->dev);
> +       const struct pxa1908_pd_data *data =3D &pd->data;
> +       unsigned int status;
> +       int ret;
> +
> +       regmap_clear_bits(ctrl->base, APMU_PWR_CTRL_REG, data->pwr_state)=
;
> +
> +       usleep_range(POWER_OFF_LATENCY_US, POWER_OFF_LATENCY_US * 2);
> +
> +       ret =3D regmap_read_poll_timeout(ctrl->base, APMU_PWR_STATUS_REG,=
 status,
> +                                      !(status & data->pwr_state), 6, 25=
 * USEC_PER_MSEC);
> +       if (ret =3D=3D -ETIMEDOUT) {
> +               dev_err(pd->dev, "timed out powering off domain '%s'\n", =
pd->genpd.name);
> +               return ret;
> +       }
> +
> +       regmap_clear_bits(ctrl->base, data->reg_clk_res_ctrl, data->hw_mo=
de);
> +
> +       return 0;
> +}
> +
> +static int pxa1908_dsi_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D dev_get_drvdata(pd->dev);
> +
> +       if (pd->clks) {
> +               int ret =3D clk_bulk_prepare_enable(pd->num_clks, pd->clk=
s);
> +
> +               if (ret) {
> +                       dev_err(pd->dev, "failed to enable clocks for dom=
ain '%s': %d\n",
> +                               pd->genpd.name, ret);
> +                       return ret;
> +               }
> +       }
> +
> +       regmap_set_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +
> +       return 0;
> +}
> +
> +static int pxa1908_dsi_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D dev_get_drvdata(pd->dev);
> +
> +       regmap_clear_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +
> +       if (pd->clks)
> +               clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +
> +       return 0;
> +}
> +
> +#define DOMAIN(_id, _name, ctrl, mode, state) \
> +       [_id] =3D { \
> +               .data =3D { \
> +                       .reg_clk_res_ctrl =3D ctrl, \
> +                       .hw_mode =3D BIT(mode), \
> +                       .pwr_state =3D BIT(state), \
> +                       .id =3D _id, \
> +               }, \
> +               .genpd =3D { \
> +                       .name =3D _name, \
> +                       .power_on =3D pxa1908_pd_power_on, \
> +                       .power_off =3D pxa1908_pd_power_off, \
> +               }, \
> +       }
> +
> +static struct pxa1908_pd domains[] =3D {
> +       DOMAIN(PXA1908_POWER_DOMAIN_VPU, "vpu", 0xa4, 19, 2),
> +       DOMAIN(PXA1908_POWER_DOMAIN_GPU, "gpu", 0xcc, 11, 0),
> +       DOMAIN(PXA1908_POWER_DOMAIN_GPU2D, "gpu2d", 0xf4, 11, 6),
> +       DOMAIN(PXA1908_POWER_DOMAIN_ISP, "isp", 0x38, 15, 4),
> +       [PXA1908_POWER_DOMAIN_DSI] =3D {
> +               .genpd =3D {
> +                       .name =3D "dsi",
> +                       .power_on =3D pxa1908_dsi_power_on,
> +                       .power_off =3D pxa1908_dsi_power_off,
> +                       /*
> +                        * TODO: There is no DSI driver written yet and u=
ntil then we probably
> +                        * don't want to power off the DSI PHY ever.
> +                        */
> +                       .flags =3D GENPD_FLAG_ALWAYS_ON,
> +               },
> +               .data =3D {
> +                       /* See above. */
> +                       .keep_on =3D true,
> +               },
> +       },
> +};
> +
> +static void pxa1908_pd_cleanup(struct pxa1908_pd_ctrl *ctrl)
> +{
> +       struct pxa1908_pd *pd;
> +       int ret;
> +
> +       for (int i =3D ARRAY_SIZE(domains) - 1; i >=3D 0; i--) {
> +               pd =3D &domains[i];
> +
> +               if (!pd->initialized)
> +                       continue;
> +
> +               ret =3D pm_genpd_remove(&pd->genpd);
> +               if (ret)
> +                       dev_err(pd->dev, "failed to remove domain '%s': %=
d\n",
> +                               pd->genpd.name, ret);
> +               if (pxa1908_pd_is_on(pd) && !pd->data.keep_on)
> +                       pxa1908_pd_power_off(&pd->genpd);
> +
> +               clk_bulk_put_all(pd->num_clks, pd->clks);
> +       }
> +}
> +
> +static int
> +pxa1908_pd_init(struct pxa1908_pd_ctrl *ctrl, struct device_node *node, =
struct device *dev)
> +{
> +       struct pxa1908_pd *pd;
> +       int clk_idx =3D 0, ret;
> +       u32 id;
> +
> +       ret =3D of_property_read_u32(node, "reg", &id);
> +       if (ret) {
> +               dev_err(dev, "failed to get domain id from reg: %d\n", re=
t);
> +               return ret;
> +       }
> +
> +       if (id >=3D ARRAY_SIZE(domains)) {
> +               dev_err(dev, "invalid domain id %d\n", id);
> +               return ret;
> +       }
> +
> +       pd =3D &domains[id];
> +       pd->dev =3D dev;
> +       pd->num_clks =3D of_clk_get_parent_count(node);
> +       ctrl->domains[id] =3D &pd->genpd;
> +
> +       if (pd->num_clks > 0) {
> +               pd->clks =3D devm_kcalloc(dev, pd->num_clks, sizeof(*pd->=
clks), GFP_KERNEL);
> +               if (!pd->clks)
> +                       return -ENOMEM;
> +       }
> +
> +       for (int i =3D 0; i < pd->num_clks; i++) {
> +               struct clk *clk =3D of_clk_get(node, i);
> +
> +               if (IS_ERR(clk)) {
> +                       ret =3D PTR_ERR(clk);
> +                       dev_err(dev, "failed to get clk for domain '%s': =
%d\n",
> +                               pd->genpd.name, ret);
> +                       goto err;
> +               }
> +
> +               pd->clks[clk_idx++].clk =3D clk;
> +       }
> +
> +       /* Make sure the state of the hardware is synced with the domain =
table above. */
> +       if (pd->data.keep_on) {
> +               ret =3D pd->genpd.power_on(&pd->genpd);
> +               if (ret) {
> +                       dev_err(dev, "failed to power on domain '%s': %d\=
n", pd->genpd.name, ret);
> +                       goto err;
> +               }
> +       } else {
> +               if (pxa1908_pd_is_on(pd)) {
> +                       dev_warn(dev,
> +                                "domain '%s' is on despite being default=
 off; powering off\n",
> +                                pd->genpd.name);
> +
> +                       ret =3D pxa1908_pd_power_off(&pd->genpd);
> +                       if (ret) {
> +                               dev_err(dev, "failed to power off domain =
'%s': %d\n",
> +                                       pd->genpd.name, ret);
> +                               goto err;
> +                       }
> +               }
> +       }
> +
> +       ret =3D pm_genpd_init(&pd->genpd, NULL, !pd->data.keep_on);
> +       if (ret) {
> +               dev_err(dev, "domain '%s' failed to initialize: %d\n", pd=
->genpd.name, ret);
> +               goto err;
> +       }
> +
> +       pd->initialized =3D true;
> +
> +       return 0;
> +
> +err:
> +       clk_bulk_put_all(pd->num_clks, pd->clks);
> +       return ret;
> +}
> +
> +static int pxa1908_pd_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct pxa1908_pd_ctrl *ctrl;
> +       struct device_node *node;
> +       int ret;
> +
> +       ctrl =3D devm_kzalloc(dev, struct_size(ctrl, domains, ARRAY_SIZE(=
domains)), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->base =3D syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(ctrl->base)) {
> +               dev_err(dev, "no regmap available\n");
> +               return PTR_ERR(ctrl->base);
> +       }
> +
> +       platform_set_drvdata(pdev, ctrl);
> +
> +       ctrl->onecell_data.domains =3D ctrl->domains;
> +       ctrl->onecell_data.num_domains =3D ARRAY_SIZE(domains);
> +
> +       for_each_available_child_of_node(dev->of_node, node) {
> +               ret =3D pxa1908_pd_init(ctrl, node, dev);
> +               if (ret)
> +                       goto err;
> +       }
> +
> +       return of_genpd_add_provider_onecell(dev->of_node, &ctrl->onecell=
_data);
> +
> +err:
> +       pxa1908_pd_cleanup(ctrl);
> +       return ret;
> +}
> +
> +static void pxa1908_pd_remove(struct platform_device *pdev)
> +{
> +       pxa1908_pd_cleanup(platform_get_drvdata(pdev));
> +}
> +
> +static const struct of_device_id pxa1908_pd_match[] =3D {
> +       {
> +               .compatible =3D "marvell,pxa1908-power-controller",
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, pxa1908_pd_match);
> +
> +static struct platform_driver pxa1908_pd_driver =3D {
> +       .probe =3D pxa1908_pd_probe,
> +       .remove =3D pxa1908_pd_remove,
> +       .driver =3D {
> +               .name =3D "pxa1908-power-controller",
> +               .of_match_table =3D pxa1908_pd_match,
> +       },
> +};
> +module_platform_driver(pxa1908_pd_driver);
> +
> +MODULE_AUTHOR("Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>");
> +MODULE_DESCRIPTION("Marvell PXA1908 power domain driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.50.1
>

