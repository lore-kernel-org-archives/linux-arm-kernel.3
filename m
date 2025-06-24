Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D1FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dJOF+dkZKOGrXkHRENXg44LMKX4qd4pEo3+Zbj7kKM=; b=jqsQJkVGNT1oE0aw0mG7VA8Mdp
	ASdENMt8L6j3ljq603uc32opvCSj/zIGG+Wglxw3O3+TPHR6kswRI3VPFjJlmnfiPJCxFDsWTsfiX
	YPb1X1h8aodC9JEE9apuEaPtwKUMSDOOLzdhZhKZulj63GM6y0T3SqqAyI88o1E4V3PzQNy+1JL6s
	1/xPKxrmtqxqkJ3reH/9vGfSy1GFG+gD3WM6LpGJ/HhIxR92dGRpW3QWX3tnJOw2k+o2Pn3rXYQ58
	VMMiS3jLgXH/rW0xXZy0czeC89+l5yjKn4JIve5ACfxwWK1E+bhX8U20mBFS8/4BnGdLiG/3fWEsx
	1glwHEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAaU-00000006oIc-0WhI;
	Tue, 24 Jun 2025 20:49:50 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5b4-000000067Yb-0wpr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:30:07 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e81ec95d944so4537391276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750779005; x=1751383805; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8dJOF+dkZKOGrXkHRENXg44LMKX4qd4pEo3+Zbj7kKM=;
        b=YT0ToW4gKQ38WaM3zKwVBM3yvs+yuZhEquoLnIwX0wEapINp2B3gyaXpDeP727ntt1
         9zsJKvmUhAa/vR1TafAT6QHc6mnKpS23prgs/Vs1DL+gWGev3KBvaHf8WLKSPoj0daLv
         HN+X4t9RaMbBAQxJuNUg3V6EtCSaZZEG3lVlJUjIkr1TeRG4RjMUsO6PwfATEZj1gWtV
         ZvOe3RRardtZyjvVlxwxWkSxCuuL7dRDMO1zf8z3UtTXfAUBmUQE4jazTzLSxAhePfmf
         /V4Vge7aQXyFG3SeLr8ESp8WUnjVleV7vSE7W39dQfm3gz51OYTpHMt66+LyvWaGA53W
         E55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779005; x=1751383805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dJOF+dkZKOGrXkHRENXg44LMKX4qd4pEo3+Zbj7kKM=;
        b=GbBkpr1UwCnGuhrdcu8Zks/HnkhTEW3h/DrcFWEjSk0hZnJBB9k9BbB6XG1Qa+3Kfv
         dS1yaOhrUV2pm2bjKZjF/mf5tesCNAlpyIeNMgYDPMieChEgV8w1IVSj2zoDjLDR4Z76
         Vd7hQeOKx0IvfuK0lsMDtu9whjFy2+D0l80Gw5fn9TsyMbmB8mv4GYI+5JaG8btGfNrQ
         0uXXkun4JyFNsXSm4KL9Efnaim0tU82LGftuspOUQvSagGnWjYdZ4jWQPCTKWhFy27qq
         v81aoL5q0ft+OLxMARDm+JymvelGZEI/ddUXrW54rZW4L5cyLtgfZbAbe98lOrt02O2Q
         pd1w==
X-Forwarded-Encrypted: i=1; AJvYcCVQvdnSIjQvNgPYf7jggG8B4gaZ6wk63P+YhI9M8XZI2yt6YaekfNgkGIG8GxAsHgYSDJaQpPKOSvUYBjYk6V71@lists.infradead.org
X-Gm-Message-State: AOJu0YzTFPlumdpmg9p3+PYpkfCGymx5mpJcLWjPCJRyOJm2xNXbFcDE
	CpFcBdOk32wTTxLwbsuClVI1+tMaSUNzBg45yW0vxju/ihf+xQlGbZ1CCdlxGyXJsvwK+gc4p5S
	xgxqu/7nYgIPoL3gMgk7jEeSLOAZ7qFRLZ94V/Nzrlg==
X-Gm-Gg: ASbGncvSKqbSpBtV+5rTK7iKkFeHZWsXRDh2UW7ckUywZqEewvf5kE9YatqIXSAy7i6
	JKbT/e8r8QsLGSHirdAmQnU/8YPx4sX14xI8ixfWf405kiRJM5I4ttTWBP0RhlzOmCV9O5JUXFj
	7OQywxCjlkE0KMYYYQSWiCaxi9rGuMHqN9szKPWZORdtjfaiIdu8/7xb8=
X-Google-Smtp-Source: AGHT+IHATcRs0RklhKZHJE22UBmrpX8en+JTsoR7JvemTlqCu4NknqQmYKRTJnXSHRC2xNDXA70wYENoyIcfbMnd1YU=
X-Received: by 2002:a05:6902:274a:b0:e84:4be2:de76 with SMTP id
 3f1490d57ef6-e85f1ec2397mr5375345276.24.1750779004282; Tue, 24 Jun 2025
 08:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com> <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
 <CAPDyKFpXcpwkacnYqWz2vxaTd7pW5bSRa2F063BryFxVNEAmPA@mail.gmail.com> <CAMuHMdXGS+efbbQ_Pn1iYhQ1aWc_DuJ-CBN=jxfjwOWxTRx+9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXGS+efbbQ_Pn1iYhQ1aWc_DuJ-CBN=jxfjwOWxTRx+9Q@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Jun 2025 17:29:27 +0200
X-Gm-Features: Ac12FXxfHF_RfveQAeQ0ntPO20zA_1gHc1ii1mqp7uJj4D3vjCp3dlPLBhgbDVo
Message-ID: <CAPDyKFoJHFuY278eEobje4TOv_+-i966H2OuP9fqHMLLevb0qw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Saravana Kannan <saravanak@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_083006_274945_E0211438 
X-CRM114-Status: GOOD (  54.99  )
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

On Mon, 23 Jun 2025 at 17:06, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Mon, 23 Jun 2025 at 16:21, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 19 Jun 2025 at 13:40, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Fri, 13 Jun 2025 at 12:33, Tomi Valkeinen
> > > <tomi.valkeinen@ideasonboard.com> wrote:
> > > > On 23/05/2025 16:39, Ulf Hansson wrote:
> > > > > Changes in v2:
> > > > >       - Well, quite a lot as I discovered various problems when doing
> > > > >       additional testing of corner-case. I suggest re-review from scratch,
> > > > >       even if I decided to keep some reviewed-by tags.
> > > > >       - Added patches to allow some drivers that needs to align or opt-out
> > > > >       from the new common behaviour in genpd.
> > > > >
> > > > > If a PM domain (genpd) is powered-on during boot, there is probably a good
> > > > > reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> > > > > powered-off before all of its consumer devices have been probed. This series
> > > > > intends to fix this problem.
> > > > >
> > > > > We have been discussing these issues at LKML and at various Linux-conferences
> > > > > in the past. I have therefore tried to include the people I can recall being
> > > > > involved, but I may have forgotten some (my apologies), feel free to loop them
> > > > > in.
> > > > >
> > > > > I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
> > > > > Let me know if you want me to share this code too.
> > > > >
> > > > > Please help review and test!
> > > >
> > > > I tested this Renesas white-hawk board, and it hangs at boot. With
> > > > earlycon, I captured with/without boot logs, attached.
> > > >
> > > > The hang case doesn't look very healthy with all these: "kobject:
> > > > '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is
> > > > being called."
> > >
> > > Tomi, thanks a lot for helping out with testing!
> > >
> > > rcar_gen4_sysc_pd_init() calls pm_genpd_init() and
> > > of_genpd_add_provider_onecell().
> > >
> > > rcar_gen4_sysc_pd_init() is an early_initcall, which I guess is the
> > > reason for these problems, as the genpd_provider_bus has not been
> > > registered that early (it's done at core_initcall)
> > >
> > > Do you think it would be possible to move rcar_gen4_sysc_pd_init() to
> > > a postcore/arch_initcall?
> >
> > I did some investigation around this and found that both
> > drivers/pmdomain/renesas/rcar-gen4-sysc.c and
> > drivers/pmdomain/renesas/rcar-sysc.c are registering their genpd
> > providers at the early_initcall() level.
> >
> > I was trying to find (by browsing renesas DTSes and looking into
> > drivers) if there is any consumers that actually relies on this, but
> > so far the earliest consumer I have found is the
> > drivers/irqchip/irq-renesas-irqc.c, but that's at postcore_initcall().
> > Of course, it's difficult to say if my analysis is complete as there
> > are a lot of platform variants and I didn't check them all.
> >
> > Maybe we should just give it a try and move both two drivers above to
> > postcore_initcall and see if it works (assuming the irq-renesas-irqc
> > supports -EPROBE_DEFER correctly too).
> >
> > If this doesn't work, I think we need to find a way to allow deferring
> > the call to device_add() in of_genpd_provider_add*() for genpd
> > provider's devices.
>
> Commit dcc09fd143bb97c2 ("soc: renesas: rcar-sysc: Add DT support for
> SYSC PM domains") explains:
>
>    "Initialization is done from an early_initcall(), to make sure the PM
>     Domains are initialized before secondary CPU bringup."
>
> but that matters only for arm32 systems (R-Car Gen1 and Gen2).
> Arm64 systems (R-Car Gen3 and Gen4) use PSCI for CPU PM Domain control.

Geert, thanks a lot for providing these details and helping out, much
appreciated!

>
> While changing rcar-sysc.c to use a postcore_initcall indeed moves PM
> Domain initialization after secondary CPU bringup, the second CPU core
> on R-Car M2-W is still brought up fine.
>
> For R-Car H1, there is a regression:
>
>     smp: Bringing up secondary CPUs ...
>     CPU1: failed to boot: -19
>     CPU2: failed to boot: -19
>     CPU3: failed to boot: -19
>     smp: Brought up 1 node, 1 CPU
>     SMP: Total of 1 processors activated (500.00 BogoMIPS).
>
> CPU bringup/teardown in userspace using
> /sys/devices/system/cpu/cpu*/online still works.
> R-Car H1 was never converted to use "enable-method" in DT, and relies
> on calling into the rcar-sysc driver directly (see [1]).  However,
> that does not use any actual calls into the genpd core, so probably it
> can be made to work by splitting rcar_sysc_pd_init() in two parts: an
> early_initcall() that allocates all domain structures and populates the
> internal hierarchy, and a postcore_initcall() that registers everything
> with the genpd core.

Yes, that seems like a viable option.

Unless you prefer to have a stab at it, I intend to look into it and
make the patch(es) part of a new version of the $subject series. Of
course I am still relying on your help with testing/review.

>
> As expected, there is no impact on R-Car H3 ES2.0.
> I will test on R-Car V4M tomorrow, but expect no issues.
>
> FTR, drivers/pmdomain/renesas/rmobile-sysc.c uses core_initcall().
> Changing that to postcore_initcall does not seem to make a difference
> (on R-Mobile A1).

Okay, it sure looks like we should be able to take care of this
problem for the Renesas platforms. That's great!

That said, it seems like we should also add some internal check in
genpd to see whether the genpd_provider_bus has been registered,
before we try to add devices to it. Then, perhaps log a warning and
return -EPROBE_DEFER if we hit  that case.

>
> [1] https://elixir.bootlin.com/linux/v6.15.3/source/drivers/pmdomain/renesas/rcar-sysc.c#L439
>

Kind regards
Uffe

