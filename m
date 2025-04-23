Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A3FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHGMFL0fUvT51G5doXrMDZ4P+H09IeAYckYXE5kSZCE=; b=VpQGIHoouEFnt/yqAbFWbBuUIl
	qSHAsXNf1n9hkbfi1evHVSRvFBuyYw5bEEm5HckV489w06MA0C7I0jeOKp+HZJVoMIHKuO4pxM2Ky
	BVdnhaObXXnOJgX4Re6gqqIOz5FyGbzJfRYV0abZGvlmzZnxHM4b5QlpVjej7nn83dwLg9y7UQTW/
	cClpRJyR70Wma88e0pdFo5B0glK3sYScp4Rw+sIkRw77a4i3te6B86ROHnk0WpBhS0rzWYGVuT/Of
	Vh/v51WJrjl07cA9ECTxY/TRZCQZGmMwQBoDp6ayDytSajkixQL1XoP5AUni1LlrK68Dwlx6Q0Vl0
	Au7YydbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VP7-00000009itb-3upX;
	Wed, 23 Apr 2025 08:24:25 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Up7-00000009ZGo-2wzW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:47:15 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-70811611315so12352927b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745394432; x=1745999232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHGMFL0fUvT51G5doXrMDZ4P+H09IeAYckYXE5kSZCE=;
        b=j50oUqMYWezc9VhNZpC0Te76sfXoLqRFTXC9OKGUrB0CSKGHci6cwB1uFdZbmqswQC
         znDdGRWKt78il2PNnDiFAzky3i3ulxk5tTdmbEHn4SOT78RO8iOzbMTzU7p4NLF/mT4z
         q+uxs95PF+0bwWgzogBt7WZK/RFq5Xea8qTOkK+BBCRWbj5ezgmSMYxU1g+eVa9wWxZR
         JJ1DEp0e4oDDV6VCr872HxwJ3FApoiNx3T8bPNEPvXL9IEBwMsf/FDV5DIsOkq3INYNp
         lJWzKeHyVrvxp7GWD5jkG6jWT/ZZRK7uz/PvnYDlWKuaLHAdSHh40AmEfBXysHr1uuXV
         pRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394432; x=1745999232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHGMFL0fUvT51G5doXrMDZ4P+H09IeAYckYXE5kSZCE=;
        b=YOvQKtMZtjG+GD1mUSZNy0hDCEiG3qP9C96wjtO8bP4CrY1hg1xVOid3xOsZjIpvPf
         EYmRMPq3a5o70YhWCR1vU7V9UfxhfEMce0LCgEMIgWhiQwLcKYWO1iZ8vM9kzKho7Vdi
         7P0Yx9BPIghcHevMVi7ovgHMQmfJXK86pMDEY1ePC2Mks3eB9nPuhjqITrKuIwTk9X+8
         Qp4xvflihQp4s8zEpleY91hRwQEFsDiVOmxBXp0S12/RuJfZSLQzW3quNQWAX5ERoIlh
         btNjl2iEYxIadVDFs8z6HLd8etShQZqyvGms3N7ZUhnf5Ow8m/kF1y8qHaTXCQfRNEsn
         h7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR2AQnFvdGPgVxenzwwSitJla43XY8yyCbr2AKxuit0ahUN/KPdnUAV35Bhz0sDOSFCS99Mtapl67ZH+FW0p+u@lists.infradead.org
X-Gm-Message-State: AOJu0YwrfPOiX0U3JMFvl9akbJ6EUSWQSAzJUNfqs07lUG9z6LlMR7Fj
	Rpl78RPY7g8o1vtKl4ZB55t3C9i+AQPdcBabVxOAih0fyydl9IUhvpw/87E/i1fGQBz1rQmCgkQ
	JIPN2xzPn89p1o32UjTnxr6GDni4xd3QehIfl/Q==
X-Gm-Gg: ASbGnctOi3QFQKrtpgv8yyMF3LUDaUP9xHxUxbWkEN+roSHVx/bA4HuTLAPmi28gGOF
	J/UuBMkpYUfSDk4Ls0atBOFOLtTQlZarnpRpAPOkredSGOg/iI6DQc9LoEHN0JgBcyJSPnBMnjv
	hDti7UFns/CUJbfRscdhNHMA==
X-Google-Smtp-Source: AGHT+IEIsuGeT70VcTTtBNp0FoTy4Z2BzN/eP/3me52qwbQRMCmDjAmuOo6CONr2SdNAR783FwZ/SpPV+be9CTnuF48=
X-Received: by 2002:a05:690c:7344:b0:6fb:2c34:8ee4 with SMTP id
 00721157ae682-706ccce4bc4mr266811177b3.13.1745394432562; Wed, 23 Apr 2025
 00:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-12-ulf.hansson@linaro.org> <CAGETcx_hQRr1hRQD0vyAN9bhZRx+763zfHUG0oBi0sqFUi85pA@mail.gmail.com>
In-Reply-To: <CAGETcx_hQRr1hRQD0vyAN9bhZRx+763zfHUG0oBi0sqFUi85pA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 23 Apr 2025 09:46:36 +0200
X-Gm-Features: ATxdqUFpGCWv8eNSiRWf2Ei2Irds9OMqUnTlzN0BIWYYRzIieJAOU8hDoreYi_s
Message-ID: <CAPDyKFqS-rOv6cMDUWwJS=B4uMdpOK2FvE23z+jsU4V1zXNG7w@mail.gmail.com>
Subject: Re: [PATCH 11/11] pmdomain: core: Leave powered-on genpds on until ->sync_state()
To: Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_004713_761370_DB46E2A1 
X-CRM114-Status: GOOD (  27.44  )
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

On Fri, 18 Apr 2025 at 02:51, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > Powering-off a genpd that was on during boot, before all of its consume=
r
> > devices have been probed, is certainly prone to problems.
> >
> > Let's fix these problems by preventing these genpds from being powered-=
off
> > until ->sync_state(). Note that, this only works for OF based platform =
as
> > ->sync_state() are relying on fw_devlink.
>
> For non-OF platforms, this will still wait until late_initcall(). So,
> there's at least SOME protection. We could potentially even move that
> to happen after deferred probe timeout expires.

If I understand correctly, you are suggesting that we could update
genpd_power_off_unused() (late_initcall_sync) to clear genpd->stay_on
for the non-OF case? That should work I think.

>
> -Saravana

Kind regards
Uffe

>
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c   | 12 +++++++++++-
> >  include/linux/pm_domain.h |  1 +
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 695d7d9e5582..a8c56f7a7ba0 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -212,6 +212,12 @@ static inline bool irq_safe_dev_in_sleep_domain(st=
ruct device *dev,
> >         return ret;
> >  }
> >
> > +#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
> > +static bool genpd_may_stay_on(bool on) { return on; }
> > +#else
> > +static bool genpd_may_stay_on(bool on) { return false; }
> > +#endif
> > +
> >  static int genpd_runtime_suspend(struct device *dev);
> >
> >  /*
> > @@ -933,11 +939,12 @@ static void genpd_power_off(struct generic_pm_dom=
ain *genpd, bool one_dev_on,
> >          * The domain is already in the "power off" state.
> >          * System suspend is in progress.
> >          * The domain is configured as always on.
> > +        * The domain was on at boot and still need to stay on.
> >          * The domain has a subdomain being powered on.
> >          */
> >         if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
> >             genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) =
||
> > -           atomic_read(&genpd->sd_count) > 0)
> > +           genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
> >                 return;
> >
> >         /*
> > @@ -2374,6 +2381,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd=
,
> >         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
> >         atomic_set(&genpd->sd_count, 0);
> >         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> > +       genpd->stay_on =3D genpd_may_stay_on(!is_off);
> >         genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
> >         genpd->device_count =3D 0;
> >         genpd->provider =3D NULL;
> > @@ -2640,6 +2648,7 @@ void of_genpd_sync_state(struct device *dev)
> >         list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> >                 if (genpd->provider =3D=3D &np->fwnode) {
> >                         genpd_lock(genpd);
> > +                       genpd->stay_on =3D false;
> >                         genpd_power_off(genpd, false, 0);
> >                         genpd_unlock(genpd);
> >                 }
> > @@ -3486,6 +3495,7 @@ static void genpd_provider_sync_state(struct devi=
ce *dev)
> >
> >         case GENPD_SYNC_STATE_SIMPLE:
> >                 genpd_lock(genpd);
> > +               genpd->stay_on =3D false;
> >                 genpd_power_off(genpd, false, 0);
> >                 genpd_unlock(genpd);
> >                 break;
> > diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> > index 2185ee9e4f7c..c5358cccacad 100644
> > --- a/include/linux/pm_domain.h
> > +++ b/include/linux/pm_domain.h
> > @@ -193,6 +193,7 @@ struct generic_pm_domain {
> >         unsigned int performance_state; /* Aggregated max performance s=
tate */
> >         cpumask_var_t cpus;             /* A cpumask of the attached CP=
Us */
> >         bool synced_poweroff;           /* A consumer needs a synced po=
weroff */
> > +       bool stay_on;                   /* Stay powered-on during boot.=
 */
> >         enum genpd_sync_state sync_state; /* How sync_state is managed.=
 */
> >         int (*power_off)(struct generic_pm_domain *domain);
> >         int (*power_on)(struct generic_pm_domain *domain);
> > --
> > 2.43.0
> >

