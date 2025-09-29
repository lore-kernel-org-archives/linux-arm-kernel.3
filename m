Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BB1CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUXSFceWb25g9n2jWqeSmoB7pNwdYGNyiAtsuATGVG8=; b=W9OW+5LgAN4OPXDuEHrxN53bua
	QTJ9xP2fy0+FQnllyQtpYWZRTEFSZIV7nEXuSRyigZFt/kVuXUCh/74hNSwNdA52H+G+Gm/3HvgoP
	O2linJTPn6CQc/jRMhyql+fLF2swo83QygXSviaMQmk7v+5sJP8qraae8ylKOwyLgimmyeDLoRquq
	dv9Pahu7GTZX5Qtlu0aGQ81F+OK0kSa42BmcB67+l2JKuUFpcXF/D6PFYwDvdTyGYeHQM/IO0ymSC
	Remkc99b1YKqw0YfwJR4ISOTpf0dFJUTvvimbkyRGbgT8Q6+McPG18GQx/1TvlVAbujgpu4jlDp5D
	TazPebOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38he-00000001gpE-2MBM;
	Mon, 29 Sep 2025 07:53:46 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38hb-00000001goT-3x5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 07:53:45 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-59d576379b9so2185118137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 00:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759132421; x=1759737221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUXSFceWb25g9n2jWqeSmoB7pNwdYGNyiAtsuATGVG8=;
        b=oISMD+f6wcCYlexlOmX2W1caUHfDh0gONHVJO2doxYZvKkOKk/brySjhOuyvicfRXD
         z2f9Co/1cv96iyQuqUcbbHx21htQXNV2HiwK+Hg9CXLSKbwV2Zz4eDPo1qMHQZMiFSBN
         BfRNYPR0Wm4biBBv+uhCjX+RkebEq3BfnfPuZllK82XT0v3mawb/Zu8W5DAajpZIrtdB
         +2ap2b42hSPLW/7kNNUjc6zKTLzkZd5v7NT7BSmQSJ0HxtEPcKGcEQHQKm+t0sZ+ErAC
         SjaJ9R2zky7Wsl+TYvOZz5mQIxvtWY5xOZ2EsGuHYk8Qmhe2K8AwAQr1vx7PDxiVyFni
         HPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1g9Bqwun+/edOw7jiU5VdmR4g1hf9+rbizeGUxXSIGoFJfu5/fVCZGYupUt7Kos3sLHvZYQf/L17cvhT7YF34@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+jczF/R6JXKtSWA/Hz6cZb421ULjZYlFTCrsdZLnaApvVhiP
	maK695tOITWSpGBk/oIEkJirFOZ7B2BjttO38y/Li3u3pMipuG0GvQ7Ji5nipT+i
X-Gm-Gg: ASbGncvswa6GIIMwi/hVjBNxj2GSr+BNPVSbptgFn4owJVRYBF3wke4Og0fL1lyz4Fb
	1/oKbNMkADk61fii02yS+rziRe6byf1pJDh/BXNADdxvFMCDc7snsXSsTKx5iqGWx36QJJHndbX
	jdqlJARB5gT/y/0n0qYVWfeo00xQwbwQ69yYIn7B8TDe/xhVaDttnkOjOyvbyvNFe/JUccBb3gH
	LN02diCPmBRqjijWyRC/HD+/y2H2Zj5g1K+DjROvasKRnJUkMEMkKxj7bGTXrYpWrlKWoJN3un2
	wkNvzWY8Osd7xGyFlcOHoyN79UPGz2GmZ50E6LKWIii3wSnISlV9cdBcAQQv4nrcjaklTcfkxKy
	NYbRfzLKeufh3lgfoHaCAXSncsXKVoiJZD3U7aCsNFheRCxP4iKyrioerJvSy9HnSNF63410=
X-Google-Smtp-Source: AGHT+IGcHcGt3dRNAJtS+cs7Fkn7UmPLcREbdKR2NIf5OE4CV0/a+XtSSJa63Fb+jGSV6GmKw05+Nw==
X-Received: by 2002:a05:6102:370d:b0:527:8b63:78e1 with SMTP id ada2fe7eead31-5acc4632c1fmr6110960137.1.1759132420819;
        Mon, 29 Sep 2025 00:53:40 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae39efda42sm3184401137.13.2025.09.29.00.53.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 00:53:40 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5b59694136bso1919706137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 00:53:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbBqBDRHp2Ad1W+/fpuyyH7RWmFIHMwhtdF4XHJVwvvH0qTNBBgEVqcbJuTpALrjYiVn56k82p+OUuHCOvt11P@lists.infradead.org
X-Received: by 2002:a05:6102:304c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-5acce758205mr5685599137.23.1759132419534; Mon, 29 Sep 2025
 00:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com>
 <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com> <CAPDyKFr4t7KjV+bSB2_4wRM0tsSNB7fosoJHAN+yDgc1g=7FgA@mail.gmail.com>
In-Reply-To: <CAPDyKFr4t7KjV+bSB2_4wRM0tsSNB7fosoJHAN+yDgc1g=7FgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 09:53:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYs1w=GtQEQ=iMYxCfAnY4MDrrEQYV+_dNc_sKWCz6zA@mail.gmail.com>
X-Gm-Features: AS18NWDHIeKax_oc2j3zUm5LN96ZK89sUlSKJb1MXuYCTNKdArFExfgAY_xANms
Message-ID: <CAMuHMdXYs1w=GtQEQ=iMYxCfAnY4MDrrEQYV+_dNc_sKWCz6zA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_005344_000165_5462CE2C 
X-CRM114-Status: GOOD (  54.07  )
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

On Fri, 26 Sept 2025 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Fri, 26 Sept 2025 at 08:57, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Fri, 26 Sept 2025 at 00:41, Saravana Kannan <saravanak@google.com> w=
rote:
> > > On Thu, Aug 7, 2025 at 2:43=E2=80=AFAM Geert Uytterhoeven <geert@linu=
x-m68k.org> wrote:
> > > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> =
wrote:
> > > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> > > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > > >
> > > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020=
000.watchdog
> > > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pe=
nding
> > > > > > due to e6020000.watchdog
> > > > > >
> > > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > > the watchdog resides in the always-on Clock Domain, and uses th=
e
> > > > > > clock-controller for PM_CLK handling.
> > > >
> > > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked =
on
> > > > these bogus pending states, and no PM Domain is powered off.
> > >
> > > Can you explain why you call these as bogus? Sorry if you already
> > > explained it. But the reason I'm asking is to see if you can set a
> > > flag for the watchdog device so fw_devlink will completely ignore it.
> >
> > "bogus" refers to "1." below.
> >
> > Furthermore, devices that are located in an alway-on domain should
> > not block the sync state.
> >
> > > It looks like there's a driver for this watchdog node? Why is it not
> > > probing then?
> >
> > Because this particular revision of the SoC has a hardware bug that
> > prevents the watchdog timer from rebooting the system, and the driver
> > detects that.
> >
> > Anyway, if the driver is not available, unused power domains should
> > still be powered down, like before.
> >
> > > > If I remove the "sync_state =3D false" above, genpd_provider_sync_s=
tate()
> > > > considers all domains, and does power down all unused domains (even
> > > > multiple times, as expected).
> > > >
> > > > Upon closer look, all "pending due to" messages I see claim that th=
e
> > > > first (index 0) PM Domain is pending on some devices, while all of
> > > > these devices are part of a different domain (usually the always-on
> > > > domain, which is always the last (32 or 64) on R-Car).
> > > >
> > > > So I think there are two issues:
> > > >   1. Devices are not attributed to the correct PM Domain using
> > > >      fw_devlink sync_state,
> > >
> > > Is it a fw_devlink issue? Or is this a multi-domain controller?
> >
> > This is a multi-domain controller.
> >
> > > >   2. One PM Domain of a multi-domain controller being blocked shoul=
d
> > > >      not block all other domains handled by the same controller.
> > >
> > > This is going to take a while to sort out. But the current behavior i=
s
> > > the safest. How grumpy will you be if we don't fix this :)
> >
> > Depending on your definition of "safe".  Keeping all power domains on
> > increases power consumption and heat generation, and may cause e.g. CPU
> > frequency throttling to kick in, slowing down operation of the system.
>
> FYI, I agree that we need to address these problems, in one way or the
> other. I am trying to summarize them and have also proposed a CFP for
> LPC (power/thermal MC) to discuss and try to solve them.

OK, CU there! ;-)

> Now, as I also proposed in the other thread [1] just now. How about
> changing the default behaviour from FW_DEVLINK_SYNC_STATE_STRICT to
> FW_DEVLINK_SYNC_STATE_TIMEOUT? I think that would solve a lot of
> problems for us, as it would provide a more similar behaviour to what
> we had in genpd originally, hence it would be a smoother transition.
>
> I think this would be true when trying to add ->sync_state() support
> for other subsystems too, like clocks and regulators.
>
> In the end, when platforms are ready to move to the "strict" mode,
> they can do that via the command-line parameter, for example.

Thanks, changing the default to timeout sounds good to me!

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

