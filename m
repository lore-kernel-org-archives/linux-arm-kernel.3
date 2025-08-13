Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CD7CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXaVARntTj5rstYFk0DVZoF1grl45M/iHSv+inIZnl0=; b=DZYDD3U0s2cVTKJmhn/jOOj/k2
	vI2U+Pe3hkFZyUg1olTVYO8PHSOuFMKXJli3LWhl2OlrHBWwx4KeZFeIYkj6iYDHXBQrqcFLZJRgd
	iRBNKXiLuyDFGf9fEZPkS05V//+L3fx3YnICFFe5opW6S+zCB8BAZTv13AEQ+mo/S8Zf5eK/CgDs4
	eser0hWzfNGAtd5kRI6bLAl731yvJW803ltecy+6IIlbSJVUP+eB0OjX+XIpAP1QCPGzat3cxrm/1
	OotGMH2fnoNGkCjlGCFBWIKlnU2mTmYLw5U4J7PiGS/tIXEzRECMvuHmtyvueV1bE4i66ThDpJ291
	XOJDlGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAxa-0000000DgKI-2bBc;
	Wed, 13 Aug 2025 12:52:06 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA88-0000000Da0U-2PoL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:58:57 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-88e38431d91so894247241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086335; x=1755691135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXaVARntTj5rstYFk0DVZoF1grl45M/iHSv+inIZnl0=;
        b=OzRclHBINb+1/RB0AspAw+CJhnFnQkzCjCcj7TUBheUyLTp0uDDDsRGHTjJBT5wOF2
         QxDCmoqlODGzNj/2VNDgdQ08ApYi1QrkqUfQwWLX1Y0zvicUY/8tMQ86qb7sCez09rqk
         8jDmNGs41jxnOL73tYFIsBgDRmuzoxKXXPgP0FUOTMjkhbM7V1jCg43JBLULB7zMbtKE
         Ck9fyggQUF7m4kbodCdHLvQbP0SfjObdePZqEPUbwIOardFcYwcSB0lB9/h7j3esHHid
         TLigJs8Tvgj8gX1/UUxSkN89fhP9Sj7Tp6uoapeom92s5VvNpMESRoUPRSRAbQuowccC
         ArdA==
X-Forwarded-Encrypted: i=1; AJvYcCWRdCfK6gS0KN+TfrtYuYwB1LGmR+CSMqbXvF9b4ZbVbWJL3w95kCQ8DWynC0oZRPjGotFFleumfLApFverMeST@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Ja6wNe+yNt0sw6Py/jGHVVtQgP3iI5ZjjZ4K7bKDJx3yI/TQ
	/dbPIJ4W8xT+fSwTFE6IOtfThUt7zuCcg7dkM2n8rE1zJWzupGiCFimhAHGmyHMq
X-Gm-Gg: ASbGnctjSKEoME2kJMbgBi59ylQ3Z0siFzBxM3d7A2nP18VidORrRhJyXHtuqs7wZD7
	SgqZ+cmzBuEwV5so3yc0Zu/S35KXXkj1nIq0/ZtYSaUwv4/kUo5eJOQq5k3/VUy8/If0EhDG9jx
	jZDdiSG3qft9Xz2UIvEfUABeq6hRMlBZcgwxt/26WB4Bxm/4osLZPw+eNbMY0/Jw7WebkHy+80v
	g/rkW3qLqjD5AdLk52xAZ85iMCoKUPVhxRWfB41Ok2z9gLQW0dSNb3WYDfiOjsE6pmG35exCkp3
	c/cqYST84aGCXeuknJ/f//gfFg0W5f8fzIQgC1tGWxoMCNsiIntULEoQUzkZfuSrk6kPomqs2K/
	esreGmXKfY/UFASx/QWOaFqnxFM/Q0bIfzGmldiIQKJQNm0g1XtsdvyIclG6jp6993qSWyF8=
X-Google-Smtp-Source: AGHT+IFmBLmLFfR5Bfhm5aeG5Tza9YbLt4tcN7K/DZmckCnq7mWoybr8fDFRMbJalamx62VP9nhtiQ==
X-Received: by 2002:a05:6102:80a0:b0:4e9:c773:dca1 with SMTP id ada2fe7eead31-50e4efe93demr939478137.11.1755086334849;
        Wed, 13 Aug 2025 04:58:54 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-50ec2405bfcsm169448137.19.2025.08.13.04.58.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:58:54 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4fd6c638f20so3031895137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXo6VDif23bcfoExbZuiQ0Bn1b+xCEZINGnu3B6OqGS8rW/8u/ubSVEbq3x+eX469EQ9lgHGoGoyMw8/UIFG7pA@lists.infradead.org
X-Received: by 2002:a05:6102:1487:b0:4e5:9cf0:4eb6 with SMTP id
 ada2fe7eead31-50e4e5d7c88mr994820137.5.1755086332601; Wed, 13 Aug 2025
 04:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com> <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com>
In-Reply-To: <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Aug 2025 13:58:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
X-Gm-Features: Ac12FXy_QPIbJQtFhWwoeC5qDQfggpsR7MDF7zj_crLn7Nv8scpATkvcHMh0lNM
Message-ID: <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250813_045856_616084_DC529C52 
X-CRM114-Status: GOOD (  66.74  )
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

On Tue, 12 Aug 2025 at 12:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 7 Aug 2025 at 11:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > Changes in v3:
> > > > > >         - Added a couple of patches to adress problems on some Renesas
> > > > > >         platforms. Thanks Geert and Tomi for helping out!
> > > > > >         - Adressed a few comments from Saravanna and Konrad.
> > > > > >         - Added some tested-by tags.
> > > > >
> > > > > I decided it was time to give this a try, so I have queued this up for
> > > > > v6.17 via the next branch at my pmdomain tree.
> > > > >
> > > > > If you encounter any issues, please let me know so I can help to fix them.
> > > >
> > > > Thanks for your series!  Due to holidays, I only managed to test
> > > > this very recently.
> > > >
> > > > Unfortunately I have an issue with unused PM Domains no longer being
> > > > disabled on R-Car:
> > > >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> > > >     disabled.
> > > >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> > > >     sometimes not disabled.
> > > >     At first, I noticed the IOMMU driver was not enabled in my config,
> > > >     and enabling it did fix the issue.  However, after that I still
> > > >     encountered the issue in a different config that does have the
> > > >     IOMMU driver enabled...
> > > >
> > > > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > > > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > > > of_genpd_add_provider_simple(), while all R-Car drivers use
> > > > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > > > the latter?  If you don't have a clue, I plan to do some more
> > > > investigation later...
> >
> > of_genpd_add_provider_onecell() has:
> >
> >     if (!dev)
> >             sync_state = true;
> >     else
> >             dev_set_drv_sync_state(dev, genpd_sync_state);
> >
> >     for (i = 0; i < data->num_domains; i++) {
> >             ...
> >             if (sync_state && !genpd_is_no_sync_state(genpd)) {
> >                     genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
> >                     device_set_node(&genpd->dev, fwnode);
> >                     sync_state = false;
> >                     ^^^^^^^^^^^^^^^^^^^
> >             }
> >             ...
> >     }
> >
> > As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
> > genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
> > Domain only.  All other domains have the default value of sync_state
> > (0 = GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
> > is called later, it ignores all but the first domain.
> > Apparently this is intentional, as of_genpd_sync_state() tries to
> > power off all domains handled by the same controller anyway (see below)?
>
> Right, this is intentional and mainly because of how fw_devlink works.
>
> fw_devlink is limited to use only the first device - if multiple
> devices share the same fwnode. In principle, we could have picked any
> of the devices in the array of genpds here - and reached the same
> result.

OK, just like I already assumed...

> > > > BTW, the "pending due to"-messages look weird to me.
> > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > >
> > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > > due to e6020000.watchdog
> > > >
> > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > clock-controller for PM_CLK handling.
> >
> > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > these bogus pending states, and no PM Domain is powered off.
>
> I see, thanks for the details. I am looking closer at this.
>
> In any case, this is the main issue, as it prevents the ->sync_state()
> callback to be called. Hence the "genpd->stay_on" will also *not* be
> cleared for any of the genpd's for the genpd-provider.

I was under the impression there is a time-out, after which the
.sync_state() callback would be called anyway, just like for probe
deferral due to missing optional providers like DMACs and IOMMUs.
Apparently that is not the case?

> > If I remove the "sync_state = false" above, genpd_provider_sync_state()
> > considers all domains, and does power down all unused domains (even
> > multiple times, as expected).
>
> I think those are getting called because with the change above, there
> is no device_link being tracked. As stated above, fw_devlink is
> limited to use only one device - if multiple devices share the same
> fwnode.

Indeed.

> In other words, the ->sync_state() callbacks are called even if the
> corresponding consumer devices have not been probed yet.

Hence shouldn't there be a timeout, as the kernel may not even have
a driver for one or more consumer devices?

> > Upon closer look, all "pending due to" messages I see claim that the
> > first (index 0) PM Domain is pending on some devices, while all of
> > these devices are part of a different domain (usually the always-on
> > domain, which is always the last (32 or 64) on R-Car).
> >
> > So I think there are two issues:
> >   1. Devices are not attributed to the correct PM Domain using
> >      fw_devlink sync_state,
> >   2. One PM Domain of a multi-domain controller being blocked should
> >      not block all other domains handled by the same controller.
>
> Right, that's a current limitation with fw_devlink. To cope with this,
> it's possible to enforce the ->sync_state() callback to be invoked
> from user-space (timeout or explicitly) for a device.
>
> Another option would be to allow an opt-out behavior for some genpd's
> that are powered-on at initialization. Something along the lines of
> the below.
>
> From: Ulf Hansson <ulf.hansson@linaro.org>
> Date: Tue, 29 Jul 2025 14:27:22 +0200
> Subject: [PATCH] pmdomain: core: Allow powered-on PM domains to be powered-off
>  during boot

[...]

I gave this a try (i.e. "| GENPD_FLAG_NO_STAY_ON" in rcar-sysc.c), but
this doesn't make any difference.  I assume this would only work when
actively calling genpd_power_off() (i.e. not from of_genpd_sync_state()
or genpd_provider_sync_state())?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

