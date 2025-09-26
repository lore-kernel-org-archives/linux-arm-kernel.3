Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99316CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjQDtyvvVNH5A+YlQavoDIDNO01bRK+FCcEXT++J39I=; b=v7UUEiHxVCZKvOOuvfpTdkKrtI
	tWMoWcZBghGV9aGkqn9pk1uhLxqsRZYmzypfKmFd8gQTSaZtJCR2KXoTE4XURYQ7Z2XnYzMcMXloR
	msu8CSpQvuvjfwoCEAI8eFdFkAbRNlUlQt+B0OeCqN12QzjkZ00Bs7miJv01dUWqapJC/Emp/gBgv
	QgXwz4+EvL8lnIvJ1cnap5qDFCWSeEBNOjrzDOoytl/DYqXoHwX+XEYmIkrxaUCNX7iszhkjGeVXN
	95Rqqr1hwR/NAgiD4PtpaC04do0JXexdFQnVu0n9JQEpJJv8n2njqfG4OFVp02gQSRpeJzjx9uWhR
	A6GQ4oLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22P3-0000000GYtw-0EzE;
	Fri, 26 Sep 2025 06:58:01 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22Oz-0000000GYss-4BQq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 06:57:59 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8e32821b5bcso687620241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 23:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758869876; x=1759474676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjQDtyvvVNH5A+YlQavoDIDNO01bRK+FCcEXT++J39I=;
        b=HLMP0uRF2mrIMTKqOhOAgw2hvN0eIzJhlfLtJl8YQoXmXH5atQRE+utpd3kmiKWKVM
         qkkGyroMzfy138h+pyXJV4Mc0dEUMOSNbg4mSSLRw3qTlCAFob/dNdpCp8/zMcrAl/M/
         RdI7zXEMcCws/JuO5D2PD3xT6jpV7FQBeAubNXPUDCq0iRy696hzinHfPZLolyB88Cu+
         2r70o2S7UrwI9hjoZWV6GOpev3oHySdB9tJjAg5jmRdJPweC032deJKurkaiL7GTW2N2
         Oy39JcjKIJJqmEd2D5syv5MTVg+5NVICs9qjL2pEztMxQbE604ozNIFIlAU4tlTfaCyL
         mcEA==
X-Forwarded-Encrypted: i=1; AJvYcCVOQ4h5qBzQLyvSaFncqI9EI+hNcXIsYl2uq/888xQTBFYsMgPxYoy1GIIHs5kUS4q/W9Z1nXEDMHnm6T0JgIEz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc4+8Koudyky9UjndGZU/boZKH1j/mwnQJEyabKNazDc9HC364
	vnDGaDeQ6OZIsJRyyYqei9vCw+x2Ql2bCr2088e3ydsqGxNuqWWLEvsIrDFgwXsM
X-Gm-Gg: ASbGncvljBq75hwB9zbtwEWVtT1fDu9ZGKSzlPBM9kZlbi6hZWYY1QpYaBKOxvsTggw
	1SMca/FX9I9m+1GKqI+HPfcZ5WeJFL5atSTjvDXaBKPTcF/bPJtXKdQFxoulREQSNlc6MTc5gIa
	wl4gwyW6/v9z08ERw57EpVLqKjJQyGKPh4Zskn0QDejUGAOa65Pn20txxgzoXL/SlEjKSD77ZaI
	RmiflpkODLWsGzxLynJmvhCcCL8eCLr0JMt7bVVQ7YuR9X0R6BqQ6s8V9TToB649LvmFeUGiFJY
	FDGV+a9+16DcQLnxc5stWThgqPxXfDjBxg7v3N1TUOLRh18ghN/hicixwenuvK6YcPPtj5XGz5t
	PV3yx1XQD16ObN7nsSnRRIfnxT8dtR02o6J7e42rWC3thyDgrsO6JpOxOc8yyusbKhBgHZxY=
X-Google-Smtp-Source: AGHT+IF6LNacEzCzwhc/k7PhuTqGNAZ76HUZriwRlLwJpIqhsJ1jujjGM0HbNP+GJ8P80yhn1ktOOg==
X-Received: by 2002:a05:6102:3ecb:b0:523:863d:ece1 with SMTP id ada2fe7eead31-5accd117d1bmr3173825137.17.1758869876525;
        Thu, 25 Sep 2025 23:57:56 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3182cbf0sm1092753137.7.2025.09.25.23.57.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 23:57:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5a392946c4aso1078562137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 23:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7r8gqr2iUw0dc/Y0cxE/o1JE4tzaIfoTq8KyWf+cuwUlWR30PwC0c4DQhm6728VGk+MsCP+HFKuorvxBlnj3x@lists.infradead.org
X-Received: by 2002:a05:6102:442c:b0:5a3:6a6f:21ad with SMTP id
 ada2fe7eead31-5acd0182a34mr2333473137.30.1758869876161; Thu, 25 Sep 2025
 23:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com> <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com>
In-Reply-To: <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 08:57:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
X-Gm-Features: AS18NWD2sqCNW31Hr76xpW5m_kx80ye1q9D4_pFDoOhvkwDietXEmUuVKInRsEY
Message-ID: <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Saravana Kannan <saravanak@google.com>
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
X-CRM114-CacheID: sfid-20250925_235758_043771_9774738A 
X-CRM114-Status: GOOD (  39.90  )
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

Hi Saravana,

On Fri, 26 Sept 2025 at 00:41, Saravana Kannan <saravanak@google.com> wrote=
:
> On Thu, Aug 7, 2025 at 2:43=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrot=
e:
> > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> > > > BTW, the "pending due to"-messages look weird to me.
> > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > >
> > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.=
watchdog
> > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pendin=
g
> > > > due to e6020000.watchdog
> > > >
> > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > clock-controller for PM_CLK handling.
> >
> > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > these bogus pending states, and no PM Domain is powered off.
>
> Can you explain why you call these as bogus? Sorry if you already
> explained it. But the reason I'm asking is to see if you can set a
> flag for the watchdog device so fw_devlink will completely ignore it.

"bogus" refers to "1." below.

Furthermore, devices that are located in an alway-on domain should
not block the sync state.

> It looks like there's a driver for this watchdog node? Why is it not
> probing then?

Because this particular revision of the SoC has a hardware bug that
prevents the watchdog timer from rebooting the system, and the driver
detects that.

Anyway, if the driver is not available, unused power domains should
still be powered down, like before.

> > If I remove the "sync_state =3D false" above, genpd_provider_sync_state=
()
> > considers all domains, and does power down all unused domains (even
> > multiple times, as expected).
> >
> > Upon closer look, all "pending due to" messages I see claim that the
> > first (index 0) PM Domain is pending on some devices, while all of
> > these devices are part of a different domain (usually the always-on
> > domain, which is always the last (32 or 64) on R-Car).
> >
> > So I think there are two issues:
> >   1. Devices are not attributed to the correct PM Domain using
> >      fw_devlink sync_state,
>
> Is it a fw_devlink issue? Or is this a multi-domain controller?

This is a multi-domain controller.

> >   2. One PM Domain of a multi-domain controller being blocked should
> >      not block all other domains handled by the same controller.
>
> This is going to take a while to sort out. But the current behavior is
> the safest. How grumpy will you be if we don't fix this :)

Depending on your definition of "safe".  Keeping all power domains on
increases power consumption and heat generation, and may cause e.g. CPU
frequency throttling to kick in, slowing down operation of the system.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

