Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77AEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 06:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ/Zn/msJw83LpGcMMqNF9uWvU5YMyMm9vbqQhCTzPk=; b=n8+uZZyt0cTw9EUA/Wk/laxWee
	zODLanU7cB+DEQjppXZCeY7frsxNyckTAUKU0N5NQGRL+jbihp0zT/c+jLB788ssFQ8q4K8BdSTgN
	pTblO1B90jB/UNFYK71VlDdIVj2TvpJJrImgadQlL7gNcWtu+0OKml9Mfw8Rc2YDL7uCDBrx2zMUF
	KKsOe4Our+9FdwO/qqDJQXpnw5XwRTbgg0B5F7cW/HwM8PMP+eUY54mn83O+YOl6vvXgD1azG9pB0
	F5QtyMmt3LyjU79oszzYGdfQs/EK5ytmyXKwpgqN8npJH6zUPwzTVhM6IlWVD29IdFS5lVZMpv9Ay
	MA1DVVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPyfX-0000000BNlJ-3e63;
	Tue, 24 Dec 2024 06:45:27 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPyeL-0000000BNbF-1XsR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 06:44:15 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e39841c8fd6so4293820276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 22:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735022652; x=1735627452; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ/Zn/msJw83LpGcMMqNF9uWvU5YMyMm9vbqQhCTzPk=;
        b=Jgk6mORKkS64mqkvawewukmV80YMC6NbimT4vMw0CgjJiWtqUFz9UZU7WtNKrwrRgC
         D//IJr22VxOH4bMBZmBERBYLDVT5Cv/Mav15VmJbhDBsy6HWJBxBcZ5UkS78sr+Ou9lz
         2TMxbB/VX5P9DqclhBgMp27J2D4eQG52rUh8cgXhU/RJXRWkJcEIBh2venkPsOXQqGNT
         Yy/hnaGdG1O1H9VzpGZ3d96P4Ng94DNcSdyHitZjlJMteJlIztLuRxVQ0gArkpv9g6Hj
         pAZkykcnSWNypj8iWwbgWnrKfW9Z8y6FT2i/NMhTQ4cdVLi+0bq9oxFkAyetLeXyMCmU
         HEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735022652; x=1735627452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ/Zn/msJw83LpGcMMqNF9uWvU5YMyMm9vbqQhCTzPk=;
        b=YQ2wxchZAoeGCrpXt6qIm3khDvNw7EZhEKo9Xt/YhWiNyaCjBhfGoA3+0JA7uE+pV1
         6lxeTq7gZNxgGIg9kIpGI2Ca2d6SruF8ubuOgs15cHIpfHZ2PbKYKGOEkA+mzDnVA/pK
         iEv4IuRD5NyX0kygxmicLkP7mi9fAzKJvahsAuYy4csKXbrVn9R5hyD4etALq+LTEEBG
         +M6RLxREuEpIK9OPM5xxDNhCX7cZ0d/YNRim7zzuOyWHYEJHpo8SrYT0r0s7fjUIGTba
         0ogsMuN5LlbU+nCQmOvvj81bfRYMzEhsFfkGSrlj0tnV9Ej3BOtpQFuwV8OirNdg/MQr
         rUbA==
X-Forwarded-Encrypted: i=1; AJvYcCVu5PGbvpBoOgDt5GpgnraWcoZ8zkuLXLPNIYXls4+WFHFC5TbRiKv2rmK3X/ASrsi5cW4iuU6F+R4ndqM5dY96@lists.infradead.org
X-Gm-Message-State: AOJu0YySNCsNc++UQg4y6dItVCbYhfRy0tniQm3ow5hcMGnO7Q+sl0nP
	K5ugI8oY8XKAw0GmunlWSbobDOKZ5rjWH/DwQuw1rll+Zhelev3NRDTq5FaFhdNz+xD7b3uvFOG
	APQPSXIzRSrzgl7WIV78+7kcvpDUaCYN0oSRDVA==
X-Gm-Gg: ASbGncuK64J08/vPyORH/mXRpm3GL7utCVOknXWFJuEY72/UVmpdPCEcVu16d24htEA
	tBkUpGATKYJ6HXG3AH/E+2DmZWL7MX9R9+eJ0nELrC8CCH9eH4py1
X-Google-Smtp-Source: AGHT+IH+tUx3wsKXoRccfhQ9sC/ui1pPyLa1/HDfJqJRr5j8UEnntJ1fSPiiiZze29cEu6LVIRZLDndyqvIvmsnlI1A=
X-Received: by 2002:a05:690c:6182:b0:6ef:5fee:1ca6 with SMTP id
 00721157ae682-6f3f8110472mr107964417b3.18.1735022652292; Mon, 23 Dec 2024
 22:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20241223064147.3961652-1-victor.liu@nxp.com> <20241223064147.3961652-10-victor.liu@nxp.com>
 <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij> <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
In-Reply-To: <b2d78f9f-014d-475b-86f1-9916ad6a3126@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 08:44:01 +0200
Message-ID: <CAA8EJpom94QfZm5es7i1eVpzeL0svQYDEcGzd0atbgNYCv1osA@mail.gmail.com>
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller display engine
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, 
	agx@sigxcpu.org, u.kleine-koenig@baylibre.com, francesco@dolcini.it, 
	frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_224413_429141_13837C35 
X-CRM114-Status: GOOD (  46.68  )
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

On Tue, 24 Dec 2024 at 08:21, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/23/2024, Dmitry Baryshkov wrote:
> > On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
> >> i.MX8qxp Display Controller display engine consists of all processing
> >> units that operate in a display clock domain.  Add minimal feature
> >> support with FrameGen and TCon so that the engine can output display
> >> timings.  The FrameGen driver, TCon driver and display engine driver
> >> are components to be aggregated by a master registered in the upcoming
> >> DRM driver.
> >>
> >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v7:
> >> * Add kernel doc for struct dc_drm_device. (Dmitry)
> >> * Fix regmap_config definitions by correcting name field, correcting read
> >>   ranges and setting max_register field.
> >> * Get instance numbers from device data(compatible strings) instead of OF
> >>   aliases.
> >
> > Unfortunately no. Your instances are compatible on the hardware level
> > (at least they were with the previous versions, I don't think that
> > there was a silicon change).
>
> v5/v6 use OF aliases to the instance numbers, but in v6 Rob said it's
> abusing aliases because the aliases contain display controller instance
> number, like "dc0-display-engine0"(i.MX8QM SoC has two display controllers).
> Or, use OF graph to describe all connections between the display controller's
> internal devices, but it's too complex. So, I choose to add the instance
> numbers to compatible strings.
>
> >
> >> * Collect Maxime's R-b tag.
> >> * Trivial tweaks.
> >>
> >> v6:
> >> * No change.
> >>
> >> v5:
> >> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
> >> * Select REGMAP and REGMAP_MMIO Kconfig options.
> >> * Fix commit message to state that display engine driver is a component driver
> >>   instead of a master/aggregate driver.
> >>
> >> v4:
> >> * Use regmap to define register map for all registers. (Dmitry)
> >> * Use regmap APIs to access registers. (Dmitry)
> >> * Inline some small functions. (Dmitry)
> >> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
> >>   KMS routine to initialization stage. (Dmitry)
> >> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> >> * Drop unnecessary private struct dc_*_priv.
> >> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
> >>   interfaces to bind/unbind the drivers.
> >>
> >> v3:
> >> * No change.
> >>
> >> v2:
> >> * Use OF alias id to get instance id.
> >> * Add dev member to struct dc_tc.
> >>
> >>  drivers/gpu/drm/imx/Kconfig     |   1 +
> >>  drivers/gpu/drm/imx/Makefile    |   1 +
> >>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
> >>  drivers/gpu/drm/imx/dc/Makefile |   5 +
> >>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
> >>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
> >>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
> >>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
> >>  10 files changed, 810 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
> >>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> >>
> >
> > [...]
> >
> >> +
> >> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct dc_drm_device *dc_drm = data;
> >> +    void __iomem *base_top;
> >> +    struct dc_de *de;
> >> +    int ret;
> >> +
> >> +    de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
> >> +    if (!de)
> >> +            return -ENOMEM;
> >> +
> >> +    de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
> >> +
> >> +    base_top = devm_platform_ioremap_resource_byname(pdev, "top");
> >> +    if (IS_ERR(base_top))
> >> +            return PTR_ERR(base_top);
> >> +
> >> +    de->reg_top = devm_regmap_init_mmio(dev, base_top,
> >> +                                        &dc_de_top_regmap_config);
> >> +    if (IS_ERR(de->reg_top))
> >> +            return PTR_ERR(de->reg_top);
> >> +
> >> +    de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
> >
> > Nit: shdload or shdld? Which one is used in the documentation?
> >
> >> +    if (de->irq_shdld < 0)
> >> +            return de->irq_shdld;
> >> +
> >> +    de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
> >> +    if (de->irq_framecomplete < 0)
> >> +            return de->irq_framecomplete;
> >> +
> >> +    de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
> >> +    if (de->irq_seqcomplete < 0)
> >> +            return de->irq_seqcomplete;
> >> +
> >> +    de->dev = dev;
> >> +
> >> +    dev_set_drvdata(dev, de);
> >> +
> >> +    ret = devm_pm_runtime_enable(dev);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    dc_drm->de[de->id] = de;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >
> > [...]
> >
> >> +
> >> +struct dc_de {
> >> +    struct device *dev;
> >> +    struct regmap *reg_top;
> >> +    struct dc_fg *fg;
> >> +    struct dc_tc *tc;
> >> +    int irq_shdld;
> >> +    int irq_framecomplete;
> >> +    int irq_seqcomplete;
> >> +    enum dc_de_id id;
> >
> > Why do you need to store it? This patch makes use of it just for the
> > registration.
>
> dc-crtc.c added in patch 12 would reference de->id. If no strong opinions,
> I'd keep this as-is.

Patch 12 uses de->id for two purposes: to assign dc_drm->de[ID] and to
include ID into error messages. It might be better to use the DE
device in dev_err instead of using generic DRM device and de->id.

>
> >
> >> +};
> >> +
> >
> > [...]
> >
> >> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct dc_drm_device *dc_drm = data;
> >> +    void __iomem *base;
> >> +    enum dc_fg_id id;
> >> +    struct dc_fg *fg;
> >> +    struct dc_de *de;
> >> +
> >> +    fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
> >> +    if (!fg)
> >> +            return -ENOMEM;
> >> +
> >> +    id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
> >> +
> >> +    base = devm_platform_ioremap_resource(pdev, 0);
> >> +    if (IS_ERR(base))
> >> +            return PTR_ERR(base);
> >> +
> >> +    fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
> >> +    if (IS_ERR(fg->reg))
> >> +            return PTR_ERR(fg->reg);
> >> +
> >> +    fg->clk_disp = devm_clk_get(dev, NULL);
> >> +    if (IS_ERR(fg->clk_disp))
> >> +            return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
> >> +                                 "failed to get display clock\n");
> >> +
> >> +    fg->dev = dev;
> >> +
> >> +    de = dc_drm->de[id];
> >
> > This depends on a particular order of component's being bound. If the
> > order changes for whatever reason (e.g. due to component.c
> > implementation being changed) then your driver might crash here.
>
> Nope. There is no chance to crash here, because
> 1) dc_drm is not NULL here
> dc_drm is allocated in dc_drm_bind() and before component_bind_all() is
> called.  dc_fg_bind() is called by component_bind_all().
>
> 2) dc_drm->de[id] is not NULL here
> It's already set by dc_de_bind(), because component_bind_all() binds
> components in match order and the component match for DE is added before
> the one for FG(DE is a child device of display controller and FG is a
> _grandchild_ of display controller).
>
> component_bind_all():
>         /* Bind components in match order */
>         for (i = 0; i < adev->match->num; i++)
>                 if (!adev->match->compare[i].duplicate) {
>                         c = adev->match->compare[i].component;
>                         ret = component_bind(c, adev, data);

Yes, this depends on the particular behaviour of both
component_bind_all() (which is not documented this way, so somebody
might decide to optimise things somehow) and of your component
management. While you have control on the latter, you don't have
control on the former code.

Please, don't depend on the undocumented behaviour!

>
> dc_add_components():
>         for_each_available_child_of_node(dev->of_node, child) {
>                 ...
>
>                 drm_of_component_match_add(dev, matchptr, component_compare_of,
>                                            child);
>
>                 for_each_available_child_of_node(child, grandchild)
>                         drm_of_component_match_add(dev, matchptr,
>                                                    component_compare_of,
>                                                    grandchild);
>         }
>
> >
> > This applies to several other places in the driver.
>
> I don't see any other potential crash caused by the binding order of the
> components.
>
> >
> >> +    de->fg = fg;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >
>
> --
> Regards,
> Liu Ying



-- 
With best wishes
Dmitry

