Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78C7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcolRZoQB4ws+cuLwpFSDmMfaoDBVHgV4no7KK057D4=; b=ck//mdMwkTOhyMHDMbh/vcXlud
	OmpaH5JmzucYAVxKG3b7LJoH8ly7Ub9luyFIH3rYrXMOATWK3qlLOvxwiZaR5ZCCY1ETEv2p76ddK
	b+B3A9hzSlviBUmoAIPm4NextM8T70N4Q13EGZQkqkDE1pljpGsE9U/k1FY+97eYP+tWo9sSKVlFr
	SEVbzz6M5ShX0jdlT7ROIunIJ4XoaHn/fkCFgmt8Sl68Nf1jcHUSKFeMhFwWItQRrM7mBOTSdN63d
	7wd/ZOCfUGwng4WdCgvMJ8Xi3wPShRnXVp0zNFNmV4cg9DPhDdEQDTX8wiK8eaA+uKXQz1hKPJc12
	l6sTNvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbH9-000000007wT-0EKO;
	Thu, 14 Aug 2025 16:58:03 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaDi-0000000HXLe-311L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:50:27 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d6059643eso9001707b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755186625; x=1755791425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TcolRZoQB4ws+cuLwpFSDmMfaoDBVHgV4no7KK057D4=;
        b=FKA08T02dMNUOMEzLLFYKOrJtM3pG1xL1yMf0WoUSnTii+cwVaDO6HJtng/EZ7y66e
         t8caohirN545Uz6Bc2CwPTvUIomQ3mSAgniTrlUkjf3/6V3WG/cUv7eTw4p703TArtIW
         gkbjzxBVYnAOJ/7s2YEkBh0z1BUZBOZ94mjHllWR0YCfM1K0E7QVyOCY36L/xBADoS49
         kybmk2eNU+nYaIxDv7XXXE59xdQPpYZNw9fPw8tfMo2yswQbNahMql7IEkrEK1Syrlzl
         ABtLGwSECcnim/ktrlaX+IJ8s9QsgGmAzbCfRKwjs7hR/we87umV0lZjZA254rgqAsDR
         AJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186625; x=1755791425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcolRZoQB4ws+cuLwpFSDmMfaoDBVHgV4no7KK057D4=;
        b=wTayxxShxRBkBHBlYoOg2QP6RZWIMVxRljWwFG5S8Ow3Y3RSiwyXKi6e6l9P3I7eV4
         uUnqQaI/f/Ez7EIxV6ubLHMG0iNO/BwjSdTmXp3s2yf7oLql1Vq10xrvDjbMPLf6eSbg
         cWhoZwywU9kNfRdXFcYIv/Ds/yjuZXkXCt783XWKzHMSXs9fcWwlOI/A/pxZqKjTKNiD
         vDkBR1ycWnOsPPTpNviwZ4VPf9zNuOjtMPX0qDVp+19SHMWXKkAiX42tPVAZuUCPwYHw
         Lnmk+5Mvo3GgukDt1YUOsP12kkrU2/GRSMuUGVSxO8eXom9JvQWnIrYkZoAH5XGwADaO
         Lwhg==
X-Forwarded-Encrypted: i=1; AJvYcCWChc+lHzxBrZ45eUHB3Zf3uUqIA91x+CPjnpvm3p1KNH3DmCLmpf3gLs3ML44waamqTrQ9f7mbpNbCHLFKNXZL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc87Uu6xYPE8VlGnBNo9yzr7YYOFhkYbtWmT2q1hkz6PnBDAj6
	HIsyhE0oPsed8I5suKgVwfYhKeKYrAtHKycNnzvQC9Kc9Y3UeopoR8JwMWVJczF70thmOgNdVW7
	GUCOTSIXdZfMf2UJuDConNrk5sk99iht6q+2dXbxLQA==
X-Gm-Gg: ASbGnctWzisYUPNxnG+affCi+mO5DjfOgQhRqETWN6thJrysiNxQneiKQzqNfT8ViFu
	z1tokl/MpryHRSL19Yed4eO1c1k5UrgeaFcEfsdkCYeV28w4MChhAxxAmOvb8xMZGKIjBDnOIZc
	LXwJxDIGiMLI7TgvRZFrx3gdHtjwVLGW/6ooQKIxI6eAmOOrXyGLs8SGBcTMTd6gyWaafWNenw8
	/GvUabL
X-Google-Smtp-Source: AGHT+IEZdf3u9KWA9hpdME1MSo058HtmW98XBIg+BRTyD6KMN6/eMmlikus/YCW2MUTCFxGAEqaAwS1dA88OESJcat4=
X-Received: by 2002:a05:690c:7309:b0:71b:f500:70c2 with SMTP id
 00721157ae682-71d633f0da3mr47170887b3.6.1755186625067; Thu, 14 Aug 2025
 08:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com> <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Aug 2025 17:49:48 +0200
X-Gm-Features: Ac12FXw0d_08LwE0Kxq885y0aixo5HX1zNMPaf7I2LzMEd8jDbPPe6xvMDHaAUY
Message-ID: <CAPDyKFr-mVbGo62Wp+othcs+cWR6Wn9bz==ZB5hSpyKgkGtqHg@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20250814_085026_773493_3874B468 
X-CRM114-Status: GOOD (  65.71  )
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

On Wed, 13 Aug 2025 at 13:58, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 12 Aug 2025 at 12:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 7 Aug 2025 at 11:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > Changes in v3:
> > > > > > >         - Added a couple of patches to adress problems on some Renesas
> > > > > > >         platforms. Thanks Geert and Tomi for helping out!
> > > > > > >         - Adressed a few comments from Saravanna and Konrad.
> > > > > > >         - Added some tested-by tags.
> > > > > >
> > > > > > I decided it was time to give this a try, so I have queued this up for
> > > > > > v6.17 via the next branch at my pmdomain tree.
> > > > > >
> > > > > > If you encounter any issues, please let me know so I can help to fix them.
> > > > >
> > > > > Thanks for your series!  Due to holidays, I only managed to test
> > > > > this very recently.
> > > > >
> > > > > Unfortunately I have an issue with unused PM Domains no longer being
> > > > > disabled on R-Car:
> > > > >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> > > > >     disabled.
> > > > >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> > > > >     sometimes not disabled.
> > > > >     At first, I noticed the IOMMU driver was not enabled in my config,
> > > > >     and enabling it did fix the issue.  However, after that I still
> > > > >     encountered the issue in a different config that does have the
> > > > >     IOMMU driver enabled...
> > > > >
> > > > > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > > > > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > > > > of_genpd_add_provider_simple(), while all R-Car drivers use
> > > > > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > > > > the latter?  If you don't have a clue, I plan to do some more
> > > > > investigation later...
> > >
> > > of_genpd_add_provider_onecell() has:
> > >
> > >     if (!dev)
> > >             sync_state = true;
> > >     else
> > >             dev_set_drv_sync_state(dev, genpd_sync_state);
> > >
> > >     for (i = 0; i < data->num_domains; i++) {
> > >             ...
> > >             if (sync_state && !genpd_is_no_sync_state(genpd)) {
> > >                     genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
> > >                     device_set_node(&genpd->dev, fwnode);
> > >                     sync_state = false;
> > >                     ^^^^^^^^^^^^^^^^^^^
> > >             }
> > >             ...
> > >     }
> > >
> > > As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
> > > genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
> > > Domain only.  All other domains have the default value of sync_state
> > > (0 = GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
> > > is called later, it ignores all but the first domain.
> > > Apparently this is intentional, as of_genpd_sync_state() tries to
> > > power off all domains handled by the same controller anyway (see below)?
> >
> > Right, this is intentional and mainly because of how fw_devlink works.
> >
> > fw_devlink is limited to use only the first device - if multiple
> > devices share the same fwnode. In principle, we could have picked any
> > of the devices in the array of genpds here - and reached the same
> > result.
>
> OK, just like I already assumed...
>
> > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > >
> > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > > > due to e6020000.watchdog
> > > > >
> > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > clock-controller for PM_CLK handling.
> > >
> > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > these bogus pending states, and no PM Domain is powered off.
> >
> > I see, thanks for the details. I am looking closer at this.
> >
> > In any case, this is the main issue, as it prevents the ->sync_state()
> > callback to be called. Hence the "genpd->stay_on" will also *not* be
> > cleared for any of the genpd's for the genpd-provider.
>
> I was under the impression there is a time-out, after which the
> .sync_state() callback would be called anyway, just like for probe
> deferral due to missing optional providers like DMACs and IOMMUs.
> Apparently that is not the case?

The behaviour is configurable, so it depends. The current default
behaviour does *not* enforce the ->sync_state() callbacks to be
called, even after a time-out.

You may set CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT to achieve the above
behavior or use the fw_devlink command line parameters to change it.
Like setting "fw_devlink.sync_state=timeout".

I guess it can be debated what the default behaviour should be.
Perhaps we should even allow the default behaviour to be dynamically
tweaked on a per provider device/driver basis?

>
> > > If I remove the "sync_state = false" above, genpd_provider_sync_state()
> > > considers all domains, and does power down all unused domains (even
> > > multiple times, as expected).
> >
> > I think those are getting called because with the change above, there
> > is no device_link being tracked. As stated above, fw_devlink is
> > limited to use only one device - if multiple devices share the same
> > fwnode.
>
> Indeed.
>
> > In other words, the ->sync_state() callbacks are called even if the
> > corresponding consumer devices have not been probed yet.
>
> Hence shouldn't there be a timeout, as the kernel may not even have
> a driver for one or more consumer devices?

See above.

>
> > > Upon closer look, all "pending due to" messages I see claim that the
> > > first (index 0) PM Domain is pending on some devices, while all of
> > > these devices are part of a different domain (usually the always-on
> > > domain, which is always the last (32 or 64) on R-Car).
> > >
> > > So I think there are two issues:
> > >   1. Devices are not attributed to the correct PM Domain using
> > >      fw_devlink sync_state,
> > >   2. One PM Domain of a multi-domain controller being blocked should
> > >      not block all other domains handled by the same controller.
> >
> > Right, that's a current limitation with fw_devlink. To cope with this,
> > it's possible to enforce the ->sync_state() callback to be invoked
> > from user-space (timeout or explicitly) for a device.
> >
> > Another option would be to allow an opt-out behavior for some genpd's
> > that are powered-on at initialization. Something along the lines of
> > the below.
> >
> > From: Ulf Hansson <ulf.hansson@linaro.org>
> > Date: Tue, 29 Jul 2025 14:27:22 +0200
> > Subject: [PATCH] pmdomain: core: Allow powered-on PM domains to be powered-off
> >  during boot
>
> [...]
>
> I gave this a try (i.e. "| GENPD_FLAG_NO_STAY_ON" in rcar-sysc.c), but
> this doesn't make any difference.  I assume this would only work when
> actively calling genpd_power_off() (i.e. not from of_genpd_sync_state()
> or genpd_provider_sync_state())?

Right. Thanks for testing!

So, we may need to restore some part of the genpd_power_off_unused()
when CONFIG_PM_GENERIC_DOMAINS_OF is set. Without clearing
"genpd->stay_on".

I can extend the patch, if you think it would make sense for you?

Kind regards
Uffe

