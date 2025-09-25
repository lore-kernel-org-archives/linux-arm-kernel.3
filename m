Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D4CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHj+PHiUkQISWl2G0dz1sK7qOqKWgrZbDfjsc28nwu8=; b=it0uGaEDpjluHT68YkpGMbN8TR
	xIVxGcJahPKQdWa5z6RfKumaXtY7slweGJoUCsabmYPTMyJwaD6ejQ25QnAtvxpTV8tN1XN5mHq5d
	ve9AVzob+mm+L5O1qJ6LElLhAd83Huc0r3tyEqTt/colcfODuIzCBmXC4+x3XM+GSZVmnTDdGs23i
	d6Qi1hlopvBoETmQvuHkI5UPYt3LuEVSRp1KW/DVVupnOVX7gGhvUx05YAK0kzmdqMh9x/kfw55Qh
	qDA5831kNr61AkHwHI7C7nXYDHZwciMCZYoRzw3q3PE4UFPvXVMvAGkKbwMyqROdRqq0zWWnITRe4
	1USr7twA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uev-0000000Dfst-2TqO;
	Thu, 25 Sep 2025 22:41:53 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ueo-0000000DfmX-2dVK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 22:41:47 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-8e3eaa30c71so1409340241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758840105; x=1759444905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHj+PHiUkQISWl2G0dz1sK7qOqKWgrZbDfjsc28nwu8=;
        b=o1trnd9E3noxniMsl/nq8Y6yyk8XLOdy9J7jgh5jS25c77fm2+d+gwe/x3N234gTKm
         Nwq0nwDFLAk3gVDz1ZWSNhf0MMmUzXdnerbD3KrbF3FuribuO+jIHv5gV65bGhn3Il5y
         xfo8XHeMmYEZFjD/jJvC33EcBPm//RpoG2zHmah5y16lenkzi7+3lp+grKUX7pBdHmie
         wkUnMAwAZ34RTF0Qd7FSWTTFgBTU2KUlJsvZg9ppjTuDp+TE5MZkPlBznEQEoeZ6Gn+P
         V+K5XmsKhHTaGofanKHEST4Xz21dVKbOSH3NAtVMHOwm+wbg47gV7e6xgcQsmwQ4LASD
         rR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758840105; x=1759444905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHj+PHiUkQISWl2G0dz1sK7qOqKWgrZbDfjsc28nwu8=;
        b=JNL5Q7z2VEDLlehGaN2XYJWUUUOeVg2JZbgNlvZwYX6qky2Xupgda8eAsbGXdlsjCX
         EyGa9Cw9l9sEOaOcjNd/lFUjqgr1h0+cB5JkDjQ9QbSjLswBfN3EfGAWSRi22J59ar49
         dwpm3okmHyG70d+pCQp43iPoEeB6yfIcIo41Kwf4nYyL/bhmAfvuc85NW5Zrn9772k/G
         LoQs2L2CMNWaZ//Wsp0c5vBkWPwmjJ7n6k6W2cnjcU0cD/Z1AdcoO+29XlQZRflyYx2q
         A1oDG9fb+gEKR3OFc1plb61HXhZe7tb/P4wTgECebYQf/jBRPElNut4c0aWCIYsz7NSa
         doZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa8joqao0zl6LvkinjKvQlBRWRURKMW9XkHMI49x6F8CwJ0/yS6bGzf2uSNNyzezM4/TPi4xZV0oZq96hbZZRE@lists.infradead.org
X-Gm-Message-State: AOJu0YyaGy/C2gsDMLy91ohi7tyKf+L0gkF7cXigVLFCFXKsn8oNqGqp
	eCAGX2fEG3+xE+7wACcsxmHwo+L+HqRHI2gVM8b4PmEU+eq2FwbxF2W/JLtJWJwOF4RJgcJYsZL
	79fxVNPPnOT6YTaAsigKu+Km59qrxlE6kIVIcm2P7
X-Gm-Gg: ASbGnctyyjVY2MttKBiK92KTqpQydALgGEglAUi1P1l7XxUReDNjs2kUctRoSukIjnv
	qqbrWmv0+yn64egfrkbYgXSwN8piVqlTyY5cVQ0D0QZzb9pvWZrqGg6knu4QTKQlEMgLn+C1kCJ
	iBFqi24eCpvwgwOpetR9Z/yFZ3orhv/oLoAGdkcRLKuHVnlTnADrTDe7eSflqxq5h0Hd4DA1qew
	sDnRJlES0RwgxOlCCULXdgwWRSkJlqw32TpPf+GTnye
X-Google-Smtp-Source: AGHT+IFi53lokqPUYgNEQzye6iKr3Z/ilnrjsL+SFz2i8CrL+Ky7RsH/7p9qRjXS5BHvCfGU8MEeb5NCJ3UDJIWnMK4=
X-Received: by 2002:a05:6102:440b:b0:59d:ad3:e1dc with SMTP id
 ada2fe7eead31-5acc680187emr2556063137.8.1758840104879; Thu, 25 Sep 2025
 15:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com> <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
In-Reply-To: <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 25 Sep 2025 15:41:07 -0700
X-Gm-Features: AS18NWC2s6ZZ6wCDx3tWilFSoKlhNIqaCYwvZMZVl4k7rQcUFUWgg_k_mrXSjCs
Message-ID: <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_154146_683282_13C3F5F5 
X-CRM114-Status: GOOD (  50.41  )
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

On Thu, Aug 7, 2025 at 2:43=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Ulf,
>
> On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> > > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wro=
te:
> > > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> w=
rote:
> > > > > Changes in v3:
> > > > >         - Added a couple of patches to adress problems on some Re=
nesas
> > > > >         platforms. Thanks Geert and Tomi for helping out!
> > > > >         - Adressed a few comments from Saravanna and Konrad.
> > > > >         - Added some tested-by tags.
> > > >
> > > > I decided it was time to give this a try, so I have queued this up =
for
> > > > v6.17 via the next branch at my pmdomain tree.
> > > >
> > > > If you encounter any issues, please let me know so I can help to fi=
x them.
> > >
> > > Thanks for your series!  Due to holidays, I only managed to test
> > > this very recently.
> > >
> > > Unfortunately I have an issue with unused PM Domains no longer being
> > > disabled on R-Car:
> > >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> > >     disabled.
> > >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> > >     sometimes not disabled.
> > >     At first, I noticed the IOMMU driver was not enabled in my config=
,
> > >     and enabling it did fix the issue.  However, after that I still
> > >     encountered the issue in a different config that does have the
> > >     IOMMU driver enabled...
> > >
> > > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > > of_genpd_add_provider_simple(), while all R-Car drivers use
> > > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > > the latter?  If you don't have a clue, I plan to do some more
> > > investigation later...
>
> of_genpd_add_provider_onecell() has:
>
>     if (!dev)
>             sync_state =3D true;
>     else
>             dev_set_drv_sync_state(dev, genpd_sync_state);
>
>     for (i =3D 0; i < data->num_domains; i++) {
>             ...
>             if (sync_state && !genpd_is_no_sync_state(genpd)) {
>                     genpd->sync_state =3D GENPD_SYNC_STATE_ONECELL;
>                     device_set_node(&genpd->dev, fwnode);
>                     sync_state =3D false;
>                     ^^^^^^^^^^^^^^^^^^^
>             }
>             ...
>     }
>
> As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
> genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
> Domain only.  All other domains have the default value of sync_state
> (0 =3D GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
> is called later, it ignores all but the first domain.
> Apparently this is intentional, as of_genpd_sync_state() tries to
> power off all domains handled by the same controller anyway (see below)?
>
> > > BTW, the "pending due to"-messages look weird to me.
> > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > >
> > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.wa=
tchdog
> > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > due to e6020000.watchdog
> > >
> > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > the watchdog resides in the always-on Clock Domain, and uses the
> > > clock-controller for PM_CLK handling.
>
> Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> these bogus pending states, and no PM Domain is powered off.

Hi Geert,

Thanks for all the reports as ever!

Can you explain why you call these as bogus? Sorry if you already
explained it. But the reason I'm asking is to see if you can set a
flag for the watchdog device so fw_devlink will completely ignore it.

It looks like there's a driver for this watchdog node? Why is it not
probing then?

>
> If I remove the "sync_state =3D false" above, genpd_provider_sync_state()
> considers all domains, and does power down all unused domains (even
> multiple times, as expected).
>
> Upon closer look, all "pending due to" messages I see claim that the
> first (index 0) PM Domain is pending on some devices, while all of
> these devices are part of a different domain (usually the always-on
> domain, which is always the last (32 or 64) on R-Car).
>
> So I think there are two issues:
>   1. Devices are not attributed to the correct PM Domain using
>      fw_devlink sync_state,

Is it a fw_devlink issue? Or is this a multi-domain controller?

>   2. One PM Domain of a multi-domain controller being blocked should
>      not block all other domains handled by the same controller.

This is going to take a while to sort out. But the current behavior is
the safest. How grumpy will you be if we don't fix this :)

Thanks,
Saravana

