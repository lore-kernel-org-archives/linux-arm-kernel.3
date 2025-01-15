Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC00C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdkrQTRhznZOHJugzyblEZGatDWjWHhDWzWqyeJbNHU=; b=JUV3n90S24xTeZwy6H6Oj4TMgg
	3ef8bqxHh8jzBxdfZUUsR4YmCR3DCFZ9Z7KxBqOj5xWIqp0nISUugVD4x+yhdJUeZ4HqEZ5PvLySo
	kFweScO+3Mh2Fi/pLS0z2Llqtln7ETnPjAh1E+sPx8aNIKYECzmHItaaQPmjOLctGUlGjkuvkqdkY
	zkOR1Kox5njfwd/TyyQWIEg7I0TnxWUVQqVl+TxB5mQ2N6H0S7g9GDqBOvFw1UGZjynJJINz1h4v3
	qckOf9XgtT/VbIHUqeXgpsbypnhabt+K0aBsaM76UTGmA6sMZW0yPRcKIIHoHED55v+W3aFGSPtRc
	QtLPDJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrDp-0000000ACFh-3Mw3;
	Wed, 15 Jan 2025 00:25:25 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrCa-0000000ACAx-14bZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 00:24:09 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7bcf33f698dso371111785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 16:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736900647; x=1737505447; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdkrQTRhznZOHJugzyblEZGatDWjWHhDWzWqyeJbNHU=;
        b=aaqJU2XyuBLsiDH+Et2iSaGUXnf40ynf8aKGyR7OBrQnjCWDQ09diIfntbhzgUzhkF
         VdgNV9gSkNU6txi57Nt9JREBV0qy39w3TSzV3zwKUf0d/+6eqjx/AqKhVvtwiUi0lMRa
         NE4pZlbREi6YPCPwi+uT0/4pfatTtIhVzeWAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736900647; x=1737505447;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdkrQTRhznZOHJugzyblEZGatDWjWHhDWzWqyeJbNHU=;
        b=oMH2umnRnPDQsnAAtMmyaEq+XIzCCoFdGTJEjSWfP+I6c+aC9UNM9WeLyuwTHdrx+s
         vKGioJAW2s2NVIHzXxrj/BMkTRbTj7vfR8Q/4Q0xWiWAK4lBrCG9ao1NM8DH9IDFFJKC
         KQQP0dba5tpq56uWtl22rfy1Tvr/XoRV6r99XdOiCgVTKiYjXu4g2U9f4lt562n9z+hS
         XP54msR7VK/G7utFVftliVfNb2+ydXtWVGgxoEXGXvGXeDUiJXgE3tHDEn4HO5rm5OEx
         2kLcDCHgIQpagQxznD4qqN6Pv9Xtl+ROBxdrx3gxHulGGwqjS/5jiQ8A23BHjsPeOO+Y
         kKmg==
X-Forwarded-Encrypted: i=1; AJvYcCXtyuRkGgzl9cvF8Uv2SAIFFGFwj27IRGl+UkZ+yTfjmFAwYph1MzN8KyUjKov3h1CWxx6IIe5kxkvK/A40lsRw@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ9yxdCEfdoXnpkFAAMb1194ueSqOwO0sibB9hRnHeXZcxgGQW
	rg8FCEhya+olJGVdze3gi2pWKpzkIAfcWUP1laahhurhP9XQ6LFKI996n5sG+VJxfxjLhuEKIQB
	zZh3ukdV3q3K+hua1hTi0tM3DX/TLyyInPvjl
X-Gm-Gg: ASbGncst+iW8up6HbhYOOTJ5QpmSFiKAZKHkLWUt5Q/oj26Nn4fbHC8MEzQphwZxV9d
	ZTXBEOSNbyUwyfRvIvtaBPiHa5P5BVab0cUoWSwHyOfDkDGZojNxI3w7vg6eWj1aKfw==
X-Google-Smtp-Source: AGHT+IGFlnDsW2kYH9Fj+I7/X5kk5DRoyvUl1Vg4TYrbwt2tYG+HP+0yjJ7qusb6i1E+hOnMy50XeRmYAHgeARPLxE8=
X-Received: by 2002:a05:620a:1b8f:b0:7b6:6ffc:e972 with SMTP id
 af79cd13be357-7bcd96fa261mr4559763085a.5.1736900646849; Tue, 14 Jan 2025
 16:24:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jan 2025 16:24:06 -0800
MIME-Version: 1.0
In-Reply-To: <20250110140934.GB2630182-robh@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-6-swboyd@chromium.org>
 <20250110140934.GB2630182-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 14 Jan 2025 16:24:06 -0800
X-Gm-Features: AbW1kvavzIgI9aEsq8_mXYL0R-E63WYKH0DsECCwhvKpTHMjYrqscz7VM-RM9s4
Message-ID: <CAE-0n51sr_D7e66WiSETiSuE3nZaAJwS5KfuYzdVWsLbL=q2zA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] bus: qcom-sc7180: Attach pm domain to watchdog device
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_162408_328837_7AC415D2 
X-CRM114-Status: GOOD (  32.64  )
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

Quoting Rob Herring (2025-01-10 06:09:34)
> > diff --git a/drivers/bus/qcom/qcom-sc7180.c b/drivers/bus/qcom/qcom-sc7180.c
> > index a615cf5a2129..7dfe6b32efef 100644
> > --- a/drivers/bus/qcom/qcom-sc7180.c
> > +++ b/drivers/bus/qcom/qcom-sc7180.c
> > @@ -3,18 +3,140 @@
> >   * SoC bus driver for Qualcomm SC7180 SoCs
> >   */
> >
> > +#include <linux/cleanup.h>
> > +#include <linux/clk.h>
> >  #include <linux/device.h>
> > +#include <linux/dev_printk.h>
[...]
> > +
> > +static int qcom_soc_domain_power_on(struct generic_pm_domain *domain)
> > +{
> > +     struct qcom_soc_pm_domain *soc_domain;
> > +
> > +     pr_info("Powering on device\n");
> > +     soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> > +
> > +     return clk_prepare_enable(soc_domain->clk);
> > +}
> > +
> > +static int qcom_soc_domain_power_off(struct generic_pm_domain *domain)
> > +{
> > +     struct qcom_soc_pm_domain *soc_domain;
> > +
> > +     pr_info("Powering off device\n");
> > +     soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> > +
> > +     clk_disable_unprepare(soc_domain->clk);
>
> How's this going to scale when there are multiple clocks and it's not
> just turn on/off all the clocks in any order? Or when there's ordering
> requirements between different resources.

We'll need different power_on/power_off functions when the ordering
requirements are different. It would be similar to how we have different
clk_ops for different types of clks.

>
> I'm pretty sure I've seen attempts to order clock entries in DT based on
> the order they want to enable them.

Yes, I've seen that too. The order in DT shouldn't matter. The SoC PM
driver will know what order of operations to take, including between
different resources like resets, interconnects, power-domains, etc.
That's the general idea of this driver, it will coordinate all the power
for devices in the soc node, because it's written for that particular
SoC. For example, if there are ordering requirements it can get clks by
name and "do the right thing".

Another goal I have is to power off devices that aren't bound to a
driver, and/or never will be. If we can figure out the runtime PM state
of devices before adding them to the platform bus it would allow us to
power those devices off at runtime or during system suspend if userspace
isn't actively trying to power down devices. Maybe to do that we'll have
to be notified by subsystem frameworks when a provider is registered and
then once all the providers are registered, get the PM resources like
clks and interconnects, etc., figure out if they're on/off, set the
runtime PM state of the device to match, and finally add the device to
the bus. Then we can extend the driver PM core to allow userspace to
turn off devices that aren't bound to a driver, because we've moved the
SoC PM glue out of each driver into this one driver that both adds the
devices to the system and manages the device power.

If a node is status = "disabled" I'd like to still get all the PM
resources for that device and either put them into one overall SoC PM
domain, or in an "unused device" domain that we can have userspace tell
the kernel it's safe to power down those devices that were left in a
(semi-)powered state by the bootloader. Obviously I haven't gotten to
this point yet, but it's another TODO item. We could also populate those
devices but never let them be bound to a driver because they're marked
disabled in DT. Then we don't have to do anything different from devices
that are ok to use, but we waste kernel memory. Either way, the PM
resources for disabled devices need to be dealt with.

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int qcom_soc_add_clk_domain(struct platform_device *socdev,
> > +                                struct platform_device *pdev)
> > +{
> > +     struct qcom_soc_pm_domain *domain;
> > +     struct generic_pm_domain *pd;
> > +     int ret;
> > +
> > +     domain = devm_kzalloc(&socdev->dev, sizeof(*domain), GFP_KERNEL);
> > +     if (!domain)
> > +             return -ENOMEM;
> > +
> > +     pd = &domain->pd;
> > +     pd->name = "wdog";
> > +     ret = pm_genpd_init(pd, NULL, false);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* TODO: Wrap this in a generic_pm_domain function similar to power_on() */
> > +     pd->domain.activate = qcom_soc_domain_activate;
> > +     pd->power_on = qcom_soc_domain_power_on;
> > +     pd->power_off = qcom_soc_domain_power_off;
> > +
> > +     dev_info(&socdev->dev, "adding pm domain for %s\n", dev_name(&pdev->dev));
> > +     dev_pm_domain_set(&pdev->dev, &pd->domain);
> > +
> > +     return 0;
> > +}
> >
> >  static int qcom_soc_sc7180_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> >       struct device_node *np = dev->of_node;
> > +     struct platform_device *sdev;
> > +     int ret;
> > +
> > +     sdev = qcom_soc_alloc_device(pdev, "qcom,apss-wdt-sc7180");
>
> We're going to have to have an explicit call for every child node?

Probably! Or we can populate the "complicated" ones that require
something different and then populate the rest of the nodes that didn't
get populated explicitly with some sort of loop over non-populated nodes
that attaches a simple pm domain that does generic on/off sequencing. I
haven't gotten that far to know if populating everything explicitly will
be a problem.

