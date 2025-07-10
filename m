Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86455C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwOZdn2NiDVjIPrABYZCyte+ZpAf7Y1hBgPJVXATIso=; b=zUi2l7IasojR6qd9SSYzf1Qklg
	zmcGUOgWvz39MP8MzsolLrVPWGbr4X6dyAePSgLZiw3TV2/3xQRpMAFHSeu+zsceXV2QrVemS+BXz
	x/R4PE9jlX4qF3XUBV9l2hkL03nlDhBDdNgyTsYfN75v8xyU96FYHOO7M/D8hBh/Obpv310vHfeVO
	Vv51W4CShJSNUvkGqxZ2Wp00LU0dOYyKulmSi7edrq88MeSPIOHrdz4qorbJGsdR8AG8Vef+kzrk3
	0UYZNOufjvqNaMVba4jjNO0xgRB3B4bb1G6NI9VQ8SKqBnnBiLT+LK6I0jo+9yQDfgFf0IDakvqZf
	6VhDYeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZust-0000000CYQZ-039e;
	Thu, 10 Jul 2025 17:16:35 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsgK-0000000CBpb-0sQ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:55:29 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-713fba639f3so10601287b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752159327; x=1752764127; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nwOZdn2NiDVjIPrABYZCyte+ZpAf7Y1hBgPJVXATIso=;
        b=Ql6qQ7y2Koqo46xGsQ0a/+Z6Od5xC+oiJ1FFQDQNUdbQvQ8i8J4TluLjkreGTHlhlI
         kYQ8WASlcz2BvvASaCLKcwYeqg0bhoQ82ryGKLXp/Znq1WIbbpSLaQpcwlfBHe7arHPo
         TCOnPdrHyynH4k3KfFMtM/TXV/9nirii5VDsAepFLwgGrLzG1Z0jkC8Joo5MtWcmYB/S
         R+Dee7UjAlkM/DCWO5/9fNvQW6r5NIvJOSuiUCvP+n5o5gJ9A00OTl5n4hKfuO50h14M
         da1x+p8OIKuoLyacZEm4JY1t2Meg2VRq+xTQaZRad4tWDsL2mKNw4z+jaEAEpdLe9Mrt
         S0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752159327; x=1752764127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwOZdn2NiDVjIPrABYZCyte+ZpAf7Y1hBgPJVXATIso=;
        b=Ggmt5OdmvZP63CPve1ieXqNemvHBJ42gX3LnrOx5Lu4OBZU1CNqCaFwlij1wGGCHdv
         CFJAtvprYnmyUgxYSIFxs7vTBTW+JXgZpXjw6HAunp4Z0xBvhFttgQR4vaBnNvasUxlU
         h4usDY9J3/SZOyAxbJOGs9LWzabNX5FQKSLXT3MIvidnf4BjuLi46lmNRn7mBeHdQL+V
         Qk1CNua99uLyzXN/YCjaWyPTDHhH1ck6d4b165MjcAPTvlrAglnSlpB5hmO5glZiAgxD
         zbGwkxn3RoUdg7IKbpf6ejJOmuX6/cfuAb152P4Tr60t+8tKuIamdyKXfMdBZdh2NVUp
         i7mA==
X-Forwarded-Encrypted: i=1; AJvYcCXOmcmp6CGKBwT0gqX6FoMM4L2k/fnlFs1IVbUCJggjTynLiumMPSD6Y/6mqtskKrO5kbbQsYrymoGT5q+8nohc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr2P1nIIa32+FiOY4nenSBGcjD3biHOrgNLB2jAqRoEa+0OCZO
	C5EsDM6V+lKcXc0qNMRj1Cc2knnyw7z/lvNhyiuU9eSsbFac64yy73zZ9smyViuKabJ0RZ+tZoM
	DuVakkFa6jK7W59vIGteXlYeHipCal0gP2N9e9euJzg==
X-Gm-Gg: ASbGncszv4X3da+VWHF6U9infKwqGhKl+HvVGx3DwFF1tGo+9MfkcU4ZTsri6oxXWwn
	nooBkfdtW22xtXzwGX6aG2OuIim03bNA36OBULahm3eltgzgUB5Mh+7mUlw+b/sokccRmCclTu7
	61gObQbiniBzXK52rPakLjhSGYgjMOaWmjo6P6KnLG1AI=
X-Google-Smtp-Source: AGHT+IHc5dtpkiZ7u2SN9CrdCVrZBHY9P08NaQD/OycrMWylt76w9oUZCr6FAkSY6jbXyljQzIQ7UX5mkXVQHKZ643o=
X-Received: by 2002:a05:690c:87:b0:70d:ecdd:9bd1 with SMTP id
 00721157ae682-717b198ef8emr101473497b3.24.1752159326962; Thu, 10 Jul 2025
 07:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CGME20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae@eucas1p2.samsung.com>
 <20250701114733.636510-22-ulf.hansson@linaro.org> <212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com>
In-Reply-To: <212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Jul 2025 16:54:50 +0200
X-Gm-Features: Ac12FXxhP_ygVu4kvJK5PvHoMEGqfNOT1CdeqATazqx35-lOUW-8uexy7JlAHYk
Message-ID: <CAPDyKFrPOgWW_=ehCjtqAUR97HoLKmgFNO3bRT50-w6A1LgGFw@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] pmdomain: core: Leave powered-on genpds on until late_initcall_sync
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_075528_252433_0A8E8E29 
X-CRM114-Status: GOOD (  42.01  )
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

On Thu, 10 Jul 2025 at 14:26, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 01.07.2025 13:47, Ulf Hansson wrote:
> > Powering-off a genpd that was on during boot, before all of its consumer
> > devices have been probed, is certainly prone to problems.
> >
> > As a step to improve this situation, let's prevent these genpds from being
> > powered-off until genpd_power_off_unused() gets called, which is a
> > late_initcall_sync().
> >
> > Note that, this still doesn't guarantee that all the consumer devices has
> > been probed before we allow to power-off the genpds. Yet, this should be a
> > step in the right direction.
> >
> > Suggested-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> This change has a side effect on some Exynos based boards, which have
> display and bootloader is configured to setup a splash screen on it.
> Since today's linux-next, those boards fails to boot, because of the
> IOMMU page fault.

Thanks for reporting, let's try to fix this as soon as possible then.

>
> This happens because the display controller is enabled and configured to
> perform the scanout from the spash-screen buffer until the respective
> driver will reset it in driver probe() function. This however doesn't
> work with IOMMU, which is being probed earlier than the display
> controller driver, what in turn causes IOMMU page fault once the IOMMU
> driver gets attached. This worked before applying this patch, because
> the power domain of display controller was simply turned off early
> effectively reseting the display controller.

I can certainly try to help to find a solution, but I believe I need
some more details of what is happening.

Perhaps you can point me to some relevant DTS file to start with?

>
> This has been discussed a bit recently:
> https://lore.kernel.org/all/544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org/
> and I can add a workaround for this issue in the bootloaders of those
> boards, but this is something that has to be somehow addressed in a
> generic way.

It kind of sounds like there is a missing power-domain not being
described in DT for the IOMMU, but I might have understood the whole
thing wrong.

Let's see if we can work something out in the next few days, otherwise
we need to find another way to let some genpds for these platforms to
opt out from this new behaviour.

Kind regards
Uffe

>
> > ---
> >   drivers/pmdomain/core.c   | 10 ++++++++--
> >   include/linux/pm_domain.h |  1 +
> >   2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 5cef6de60c72..18951ed6295d 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -931,11 +931,12 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
> >        * The domain is already in the "power off" state.
> >        * System suspend is in progress.
> >        * The domain is configured as always on.
> > +      * The domain was on at boot and still need to stay on.
> >        * The domain has a subdomain being powered on.
> >        */
> >       if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
> >           genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
> > -         atomic_read(&genpd->sd_count) > 0)
> > +         genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
> >               return;
> >
> >       /*
> > @@ -1346,8 +1347,12 @@ static int __init genpd_power_off_unused(void)
> >       pr_info("genpd: Disabling unused power domains\n");
> >       mutex_lock(&gpd_list_lock);
> >
> > -     list_for_each_entry(genpd, &gpd_list, gpd_list_node)
> > +     list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > +             genpd_lock(genpd);
> > +             genpd->stay_on = false;
> > +             genpd_unlock(genpd);
> >               genpd_queue_power_off_work(genpd);
> > +     }
> >
> >       mutex_unlock(&gpd_list_lock);
> >
> > @@ -2352,6 +2357,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
> >       INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
> >       atomic_set(&genpd->sd_count, 0);
> >       genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> > +     genpd->stay_on = !is_off;
> >       genpd->sync_state = GENPD_SYNC_STATE_OFF;
> >       genpd->device_count = 0;
> >       genpd->provider = NULL;
> > diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> > index d68e07dadc99..99556589f45e 100644
> > --- a/include/linux/pm_domain.h
> > +++ b/include/linux/pm_domain.h
> > @@ -199,6 +199,7 @@ struct generic_pm_domain {
> >       unsigned int performance_state; /* Aggregated max performance state */
> >       cpumask_var_t cpus;             /* A cpumask of the attached CPUs */
> >       bool synced_poweroff;           /* A consumer needs a synced poweroff */
> > +     bool stay_on;                   /* Stay powered-on during boot. */
> >       enum genpd_sync_state sync_state; /* How sync_state is managed. */
> >       int (*power_off)(struct generic_pm_domain *domain);
> >       int (*power_on)(struct generic_pm_domain *domain);
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

