Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3640C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kg4yVMonzvoboWXkN1zzSwUBk/T53kVazB7EUBcPsmw=; b=3Tatx9vEMFC+phzxfyJO3QtMvK
	sYG2ioOHO6ALXzLoHnNm4ydV4pIPgvUqD/M+EbhhZzwjCRQB3Ta5JB+6sNJFd/DSNCEHNvfota15e
	0i07hbsp6fhmv2tO552iAIAHrUN2e1JIOpGQpxg27G/br0gqTPiBhanUo2a6HTbqsu95LMam87WbA
	pNNxrRUFXa+sQOZGoIIjuqk9C06pEzCmbaki58Kt/yZ0UJIXFUY/kY7eLCZLc/Ndkek19ZT6xao3D
	YsIvdPYrHEr19s48DvYCUQseFGscMREax9YMtp4ae2ou3a0fvNwCGNlX7fGhW7kPLyTSxWIQW1rq3
	vMeI6pkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujxCd-000000006pr-2eHM;
	Thu, 07 Aug 2025 09:46:27 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujxA5-0000000064o-27JO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 09:43:50 +0000
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e3f449fa6fso7152055ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 02:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754559828; x=1755164628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kg4yVMonzvoboWXkN1zzSwUBk/T53kVazB7EUBcPsmw=;
        b=QRTCUJJuzBhvK7S4fpuHIXsWWiK7BnESZlMhgczXGLcyQ2ZVkER7jy6NoFaKZHXn2t
         NFTHQYRr9kYDaKMwegVuY3VBrwboWBzNkxNHjbBmTiJeFSS8nxpjLYbj4KzsnSlhbGx7
         nZOwZurFNOh6msteNclR8Zw3eo/zwfBDq2SjCXXpfuOOoqjf8Qp/pBMAaXIQn+Aea5+H
         KEuBW3bXk5c1sZnuUqyurXKqQyblQGaYgY1HtxZiZuhVr+07bN5Lhd7U4V+83auJ0uYy
         Hqzy6EWMz84L8yRxDB/5/idMOXfSF41apDGX+/+FxpfmubB5P/rCQqap9ARo63TzQN/C
         bFYA==
X-Forwarded-Encrypted: i=1; AJvYcCVRUVAg09SDrWRAmdGR3ejwSzjRSs5Tft4jHx+C+d3DiW2n2zx2RqCB8gwL7u6D+hlzMxomdIZLn/dNfHqOKuCW@lists.infradead.org
X-Gm-Message-State: AOJu0YxO2Wup2nKlgm9LvssESOCTzHU0I+CIVVaZ3eTN1oiPBhBhxYNd
	PYhmRNSI198oa7sH3lOsoBkASOpjWqOnkPH3MlS+6PWVeUgtvqQY5Kkmbgc2+nhdCTc=
X-Gm-Gg: ASbGncv5xMJlH3wJ+leOIHfhTLK3ka1TPdKXmEW7fj7KKGzvQeYs4ZwB/Bnofg7ELZO
	mkODAbZizSxG4biWSVn4fGRr3k17dw0EgNwhH4Dhv6d7/5wq84Fzs/Xwh257SYiJn5zb3o+K850
	4ovFx0SRI3mZYeyZW0ujIIGRT3K9KQYts8T5c0ev/8CS9M/0DgHfYxEYlj7ym4xza5DfeR0/WYS
	6eHJfs8roYT9Q87+Ke36MXtq2QIa6mCqE7GlWJTxUPv0KkhaRRmBsj/kvDNcDom1x3SUm+M3LPu
	qZ/qFBfRIw8eIZifzdZi2qq3N/RbSNqOBzZNKsIrtlMno0XiD+VkI1nuCWeD55OFAR3SNO5aBmV
	DcB+3xkyo5n5FYjBfISDrOY/Ijy4wXsQjiLXq8K6AJ79Noek38SOlLS35Dlww
X-Google-Smtp-Source: AGHT+IElrrDNnf5zzt/10bZzZCwE9J+ER1eu6Zhq+nXQLsvYpq1uhaBvOwfXXlKuFifDN7kz+McaLg==
X-Received: by 2002:a05:6e02:2513:b0:3e3:baa7:4793 with SMTP id e9e14a558f8ab-3e525955506mr40781875ab.10.1754559827958;
        Thu, 07 Aug 2025 02:43:47 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55db1402sm5428590173.93.2025.08.07.02.43.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 02:43:47 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8818bb36b5bso56355939f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 02:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQABbO9PXL2mtrZov+Zeg5ozkggyfZub/qUrCxv/qdwKd1bBH3ClFSMzcWqTYGYq+VSgzMVQgKaDvUTbdV3b/3@lists.infradead.org
X-Received: by 2002:a67:e715:0:b0:4fc:d0e5:23fe with SMTP id
 ada2fe7eead31-504b889fb24mr993877137.15.1754559506070; Thu, 07 Aug 2025
 02:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com> <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
In-Reply-To: <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 11:38:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
X-Gm-Features: Ac12FXz_Wf7VThW0eyyjvLdjQbW2gc7dwXYQXV43OPnnHHrM4sUfbNQtDD8n2Ug
Message-ID: <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250807_024349_544267_B263E087 
X-CRM114-Status: GOOD (  47.30  )
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

On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > Changes in v3:
> > > >         - Added a couple of patches to adress problems on some Renesas
> > > >         platforms. Thanks Geert and Tomi for helping out!
> > > >         - Adressed a few comments from Saravanna and Konrad.
> > > >         - Added some tested-by tags.
> > >
> > > I decided it was time to give this a try, so I have queued this up for
> > > v6.17 via the next branch at my pmdomain tree.
> > >
> > > If you encounter any issues, please let me know so I can help to fix them.
> >
> > Thanks for your series!  Due to holidays, I only managed to test
> > this very recently.
> >
> > Unfortunately I have an issue with unused PM Domains no longer being
> > disabled on R-Car:
> >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> >     disabled.
> >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> >     sometimes not disabled.
> >     At first, I noticed the IOMMU driver was not enabled in my config,
> >     and enabling it did fix the issue.  However, after that I still
> >     encountered the issue in a different config that does have the
> >     IOMMU driver enabled...
> >
> > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > of_genpd_add_provider_simple(), while all R-Car drivers use
> > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > the latter?  If you don't have a clue, I plan to do some more
> > investigation later...

of_genpd_add_provider_onecell() has:

    if (!dev)
            sync_state = true;
    else
            dev_set_drv_sync_state(dev, genpd_sync_state);

    for (i = 0; i < data->num_domains; i++) {
            ...
            if (sync_state && !genpd_is_no_sync_state(genpd)) {
                    genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
                    device_set_node(&genpd->dev, fwnode);
                    sync_state = false;
                    ^^^^^^^^^^^^^^^^^^^
            }
            ...
    }

As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
Domain only.  All other domains have the default value of sync_state
(0 = GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
is called later, it ignores all but the first domain.
Apparently this is intentional, as of_genpd_sync_state() tries to
power off all domains handled by the same controller anyway (see below)?

> > BTW, the "pending due to"-messages look weird to me.
> > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> >
> >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > due to e6020000.watchdog
> >
> > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > the watchdog resides in the always-on Clock Domain, and uses the
> > clock-controller for PM_CLK handling.

Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
these bogus pending states, and no PM Domain is powered off.

If I remove the "sync_state = false" above, genpd_provider_sync_state()
considers all domains, and does power down all unused domains (even
multiple times, as expected).

Upon closer look, all "pending due to" messages I see claim that the
first (index 0) PM Domain is pending on some devices, while all of
these devices are part of a different domain (usually the always-on
domain, which is always the last (32 or 64) on R-Car).

So I think there are two issues:
  1. Devices are not attributed to the correct PM Domain using
     fw_devlink sync_state,
  2. One PM Domain of a multi-domain controller being blocked should
     not block all other domains handled by the same controller.

Does that make sense?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

