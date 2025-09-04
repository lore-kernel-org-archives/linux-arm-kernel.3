Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0672CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1GcUZqgBM2rvR9WerFxy2QlVf4Kk1dgDYgSCP6Uzsg=; b=EnzKDJX8m57SgxddS1OMi3QGFb
	zopei+HaeaIxEUhNnSczADHz/X9rjaU/+xRbObToVbmeN601SJ5ondRHHqwMCRGwlCKbfgSBy+8hE
	s51I+a5gbkG+U6YykRLygr8LQy+wbCz0Hzm0T7SYxLQkaIuUTjSbtv/pfbfecNMq4yGhgWkj7sYae
	AJTLaPRtR6h8R4G9bXRxyNV/QN3Mytl6y0LbwUCYwXmWux4kg663l3g3UrMtbnYQbNVYAG2QAPrRJ
	JIaB3IR8izl9l9/Ox6iAIP5ZtFJv5wh3IkM+0w59OLLJGGSe5xC/tEvb53FRs2qHOzeAr7f4oJHII
	9W4qD/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFz9-0000000E0pa-06Qa;
	Thu, 04 Sep 2025 19:51:07 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9HR-0000000Bdgx-1vGl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:41:35 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8988b982245so703042241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 05:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756989692; x=1757594492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1GcUZqgBM2rvR9WerFxy2QlVf4Kk1dgDYgSCP6Uzsg=;
        b=Y2Ol4qcFbi2csYtHuudoJuWFyrpPO6MAjMz8SvY9pXSxpHAWOcoQCx5NvII37/Zpud
         i1dCnSfq7OgDMgQ5p/t6HB7Ui+94Pek1ZyZ8iEfzRftEzCxwxBhi8YZtWuOfIvhnsPNk
         dcwNEtiZOesJV2Szre0uDCaSBRmO1VO2ANORvOdByC0gyrgRcaD89mURdh0KahqKre08
         6CDtHt2gx8rSIdz03BjUy3fsBDPxZrndnFeXDyY9v3xhmfwwr+ECRMfVZ+gbinWLv/6h
         LkLgHxOFVN2rY9snJyxQQ6XrjV8ytmZa96wUqxVsyZnOfRVFv9EsXAIi19DrKNdyKYei
         ItxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW26xY4E4MABXSZcKMhLp/13zicHE8cfGNL1KS9A8SAVOuJSLf0+Uw7AguXZdmJzeEzsVvn3bFB8srPkn7X0wl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/cHQCEoJLXrqJjRChcptZAW6LEFGuMBbFeVpD6s8Wmhv3EPOy
	RIzLjUIeI1jpXAaMunYS+KnNWWrFxla01dcIGH3r4gYVIjhpa0D0H9bLmo1ZtbJH
X-Gm-Gg: ASbGncs9b5b7NOLsKOgPBZ+HeiQ2I5FyJqordA9EpyIqR92PXX742lQh0kNTvurMpyM
	Aux9pLJZ1j3hIGNXk2vKpQp3ctVqO4me+zjfI0Nf3Pwp68qUxTQUXKgXXRkYulbhQFX3upAYEB8
	t1zCnZkj3jDCziPHvxTanFh8xKABvB0js8CtiQ3zXLoXrbJo1UDAWTJyeTVFmgbXilLI1ECzpm1
	j6JuH8yxLjevE2uPpuVvzsrSOWT8I+YUnwoyzvWGAYCQqHOnGpcUxt8tM5P5c9MaX9jBv+x76Fn
	oYJvP3F3G53uP90q7C20Fo4EaCN3JgEOLmS1NPAQE4l8mZNqDAgAFyHLQ+qUVygvxM3dnbDxZLK
	Bjaeb9mVogJPeZ4CoiKh3g/vH1Toj4T7/D8PP/CZ18tccaVNxI0HyoDX/FK2cpOhXCdzGl4NHLT
	4dAdUSmw==
X-Google-Smtp-Source: AGHT+IEKaBoRFC1smkoom4EtAsGBaH4WlXZnagQDwc0kDZkTENUMjFAqzXg/GddZaIkDgsAOE0nl8A==
X-Received: by 2002:a05:6102:5f04:b0:520:3f1a:c533 with SMTP id ada2fe7eead31-52b1b91e423mr5657499137.21.1756989691922;
        Thu, 04 Sep 2025 05:41:31 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19156ecsm6798403137.12.2025.09.04.05.41.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:41:31 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89018e9f902so501522241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 05:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxPPYyDN9V774FURt+MWJZ+GxmRPXuNVjXC3efsknYL37x4XSXC6+54Aw9ud2x9ovVyi6+APRjhJtNb8jvOKNi@lists.infradead.org
X-Received: by 2002:a05:6102:3243:20b0:533:44d4:d624 with SMTP id
 ada2fe7eead31-53344d4e497mr2659275137.8.1756989690635; Thu, 04 Sep 2025
 05:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com>
 <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com> <CAPDyKFr-mVbGo62Wp+othcs+cWR6Wn9bz==ZB5hSpyKgkGtqHg@mail.gmail.com>
In-Reply-To: <CAPDyKFr-mVbGo62Wp+othcs+cWR6Wn9bz==ZB5hSpyKgkGtqHg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 14:41:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAhsZMbkUzwb=XnCNyvA3aOvuhkKL4=1nOPQ0w0if-HA@mail.gmail.com>
X-Gm-Features: Ac12FXzWgUQ1v4jwp8YVOmQ4uaqt1gNk5S1qspb_Ul3tFWFDvX6qayzlZulEUEQ
Message-ID: <CAMuHMdUAhsZMbkUzwb=XnCNyvA3aOvuhkKL4=1nOPQ0w0if-HA@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_054133_498701_F64F6725 
X-CRM114-Status: GOOD (  79.62  )
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

Hi Ulf,

On Thu, 14 Aug 2025 at 17:50, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Wed, 13 Aug 2025 at 13:58, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, 12 Aug 2025 at 12:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Thu, 7 Aug 2025 at 11:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > > Changes in v3:
> > > > > > > >         - Added a couple of patches to adress problems on some Renesas
> > > > > > > >         platforms. Thanks Geert and Tomi for helping out!
> > > > > > > >         - Adressed a few comments from Saravanna and Konrad.
> > > > > > > >         - Added some tested-by tags.
> > > > > > >
> > > > > > > I decided it was time to give this a try, so I have queued this up for
> > > > > > > v6.17 via the next branch at my pmdomain tree.
> > > > > > >
> > > > > > > If you encounter any issues, please let me know so I can help to fix them.
> > > > > >
> > > > > > Thanks for your series!  Due to holidays, I only managed to test
> > > > > > this very recently.
> > > > > >
> > > > > > Unfortunately I have an issue with unused PM Domains no longer being
> > > > > > disabled on R-Car:
> > > > > >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> > > > > >     disabled.
> > > > > >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> > > > > >     sometimes not disabled.
> > > > > >     At first, I noticed the IOMMU driver was not enabled in my config,
> > > > > >     and enabling it did fix the issue.  However, after that I still
> > > > > >     encountered the issue in a different config that does have the
> > > > > >     IOMMU driver enabled...
> > > > > >
> > > > > > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > > > > > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > > > > > of_genpd_add_provider_simple(), while all R-Car drivers use
> > > > > > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > > > > > the latter?  If you don't have a clue, I plan to do some more
> > > > > > investigation later...
> > > >
> > > > of_genpd_add_provider_onecell() has:
> > > >
> > > >     if (!dev)
> > > >             sync_state = true;
> > > >     else
> > > >             dev_set_drv_sync_state(dev, genpd_sync_state);
> > > >
> > > >     for (i = 0; i < data->num_domains; i++) {
> > > >             ...
> > > >             if (sync_state && !genpd_is_no_sync_state(genpd)) {
> > > >                     genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
> > > >                     device_set_node(&genpd->dev, fwnode);
> > > >                     sync_state = false;
> > > >                     ^^^^^^^^^^^^^^^^^^^
> > > >             }
> > > >             ...
> > > >     }
> > > >
> > > > As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
> > > > genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
> > > > Domain only.  All other domains have the default value of sync_state
> > > > (0 = GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
> > > > is called later, it ignores all but the first domain.
> > > > Apparently this is intentional, as of_genpd_sync_state() tries to
> > > > power off all domains handled by the same controller anyway (see below)?
> > >
> > > Right, this is intentional and mainly because of how fw_devlink works.
> > >
> > > fw_devlink is limited to use only the first device - if multiple
> > > devices share the same fwnode. In principle, we could have picked any
> > > of the devices in the array of genpds here - and reached the same
> > > result.
> >
> > OK, just like I already assumed...
> >
> > > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > > >
> > > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > > > > due to e6020000.watchdog
> > > > > >
> > > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > > clock-controller for PM_CLK handling.
> > > >
> > > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > > these bogus pending states, and no PM Domain is powered off.
> > >
> > > I see, thanks for the details. I am looking closer at this.
> > >
> > > In any case, this is the main issue, as it prevents the ->sync_state()
> > > callback to be called. Hence the "genpd->stay_on" will also *not* be
> > > cleared for any of the genpd's for the genpd-provider.
> >
> > I was under the impression there is a time-out, after which the
> > .sync_state() callback would be called anyway, just like for probe
> > deferral due to missing optional providers like DMACs and IOMMUs.
> > Apparently that is not the case?
>
> The behaviour is configurable, so it depends. The current default
> behaviour does *not* enforce the ->sync_state() callbacks to be
> called, even after a time-out.
>
> You may set CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT to achieve the above
> behavior or use the fw_devlink command line parameters to change it.
> Like setting "fw_devlink.sync_state=timeout".
>
> I guess it can be debated what the default behaviour should be.
> Perhaps we should even allow the default behaviour to be dynamically
> tweaked on a per provider device/driver basis?

The domains are indeed powered off like before when passing
"fw_devlink.sync_state=timeout", so that fixes the regression.
But it was not needed before...

I could add "select FW_DEVLINK_SYNC_STATE_TIMEOUT" to the SYSC_RCAR
and SYSC_RCAR_GEN4 Kconfig options, but that would play badly with
multi-platform kernels.  As the fw_devlink_sync_state flag is static,
the R-Car SYSC drivers can't just auto-enable the flag at runtime.

Any other options? Perhaps a device-specific flag to be set by the PM
Domain driver, and to be checked by fw_devlink_dev_sync_state()?

> > > > If I remove the "sync_state = false" above, genpd_provider_sync_state()
> > > > considers all domains, and does power down all unused domains (even
> > > > multiple times, as expected).
> > >
> > > I think those are getting called because with the change above, there
> > > is no device_link being tracked. As stated above, fw_devlink is
> > > limited to use only one device - if multiple devices share the same
> > > fwnode.
> >
> > Indeed.
> >
> > > In other words, the ->sync_state() callbacks are called even if the
> > > corresponding consumer devices have not been probed yet.
> >
> > Hence shouldn't there be a timeout, as the kernel may not even have
> > a driver for one or more consumer devices?
>
> See above.
>
> > > > Upon closer look, all "pending due to" messages I see claim that the
> > > > first (index 0) PM Domain is pending on some devices, while all of
> > > > these devices are part of a different domain (usually the always-on
> > > > domain, which is always the last (32 or 64) on R-Car).
> > > >
> > > > So I think there are two issues:
> > > >   1. Devices are not attributed to the correct PM Domain using
> > > >      fw_devlink sync_state,
> > > >   2. One PM Domain of a multi-domain controller being blocked should
> > > >      not block all other domains handled by the same controller.
> > >
> > > Right, that's a current limitation with fw_devlink. To cope with this,
> > > it's possible to enforce the ->sync_state() callback to be invoked
> > > from user-space (timeout or explicitly) for a device.

That needs explicit handling, which was not needed before.

Perhaps the fw_devlink creation should be removed again from
of_genpd_add_provider_onecell(), as it is not correct, except for
the first domain?

> > > Another option would be to allow an opt-out behavior for some genpd's
> > > that are powered-on at initialization. Something along the lines of
> > > the below.
> > >
> > > From: Ulf Hansson <ulf.hansson@linaro.org>
> > > Date: Tue, 29 Jul 2025 14:27:22 +0200
> > > Subject: [PATCH] pmdomain: core: Allow powered-on PM domains to be powered-off
> > >  during boot
> >
> > [...]
> >
> > I gave this a try (i.e. "| GENPD_FLAG_NO_STAY_ON" in rcar-sysc.c), but
> > this doesn't make any difference.  I assume this would only work when
> > actively calling genpd_power_off() (i.e. not from of_genpd_sync_state()
> > or genpd_provider_sync_state())?
>
> Right. Thanks for testing!
>
> So, we may need to restore some part of the genpd_power_off_unused()
> when CONFIG_PM_GENERIC_DOMAINS_OF is set. Without clearing
> "genpd->stay_on".
>
> I can extend the patch, if you think it would make sense for you?

I would applaud anything that would fix these regressions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

