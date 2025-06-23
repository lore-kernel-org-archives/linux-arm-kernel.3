Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C094C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp76G6zSq2VEZ9aK70X+T0RQCLIqoSSA+Av6/Es2hYc=; b=NMh0njLhdgdlTsj/1wfohGkKxy
	+0dJkL0fuduN4CeCMy/HUnHf3R2kUEMnIN4e1fD/l+StqYUL8+ZiBrw3zlNbAKtK09ehfOi++A3Gy
	lzjr8iR3hrLMdoOWKCDBSc8i6OVKcKL/PTwkeDCxNQk72+Q/J3YCHEWG4IdXHclT6pswPXaQdY+cR
	9Y7JRGfee0PaH11RpUjBEflFHKU52kzkMCwtclvNrPzTfaf4/eNNVlOiZ2dwjypNLd9vMX/OXp1S5
	k0djMqyQcui8uJ4r+42CpunybNwQjXZfHJsYCw7SMeZ2KOzoXSITqjM5sTIloDe3BzE91X/z5J1+r
	DeN9NybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToBE-00000003xeI-0jLU;
	Mon, 23 Jun 2025 20:54:16 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTil9-00000003ABJ-1m9u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:07:02 +0000
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3862646eeso277660685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691216; x=1751296016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lp76G6zSq2VEZ9aK70X+T0RQCLIqoSSA+Av6/Es2hYc=;
        b=LtlV0sJ0+jsWrYUrgRI0mOS4aasnCHziTaR/xfHSUcbjpI1UqwE6RotUCkT3gVVWab
         Gjed0AjzSu00kFLG8wnD9NKRTJsbTHgPSdSDi5gacbeUwqT2fBuQuPY2S4Triv78Y4L0
         rnCZC7PLbQRlWfh5noR3yCNv0l5sFdlG+tEY4jM/Mt2/XMUo63RETOG9Vi2zCG30PNB5
         5HVYf0i6wQkcWq0tYcPhxFNfSQ9xK3IYNLHT1SV2e0ctKKDdmzYQ/sJXapAqaTakFl9l
         kCUYBaXi1KJgyJyrM6OdEAOkj646Jgeb9GNE6juiYJpmlZq6QGAirRBMa7/Wx2uXLmyC
         y2PA==
X-Forwarded-Encrypted: i=1; AJvYcCVsbEn+mNM2qI5nfUreeZKHTYmMenY6943fLPGqiM6PVklhchkfc1qUUlYaRXDv6D7BB2ARQ+o4zuOW6YNeMrnz@lists.infradead.org
X-Gm-Message-State: AOJu0YyeMJHrIVmrrinHxKhGbcnVZsmy5ECVygz0I+S1gqNJynqcunds
	yfcg5gYTWSXsCGeOxGeGnzDtkr4AaeEaueilborgVXrn8ZwQOIJ2WTpxQ18sPR51
X-Gm-Gg: ASbGncuC/HsiJ4rpv7jVdwFoDm+uAC5DTh1HpMZta+oTtJWyuFZ1Ar+VdwIXt9b2sjN
	6klfJ+A0b4g2aasPP2pt535U3h2oiMp4CwdOWSPGzw9sFauHe4bEcfjUp1QUHALzIbSXaCq/tfi
	oOZ9RmRlmHg+/R/5+vm7PldPNyzIAKXCUC26sHZykQqGsPkIRBZhixK4CxIWE130gkaAM/2VCRu
	rCfFkwIUMWfS8yf03SMV4D5rfyz0zKartNpBnE7ke4tdeq4iEM5y6UtiQ3Gr5eC9mUvZUgGi5Qh
	Rm8icHRPRLuZlUhp3jW9qOKe5W50bD3dDYioTW2pqBKIc8cd2VVGEA1H4ZplUcVK8Wc7/x1t3hx
	4H0xzKbNQbt6Pp0Tgt3rTeCFPGHMq
X-Google-Smtp-Source: AGHT+IG/DlBfxq2C1jGrskSmt1H9mpov9XoXkV7r6pTS7j0g8BlYMzWFTP5RkLSDXF6t33Hh9EqYLw==
X-Received: by 2002:a05:620a:2692:b0:7cd:90eb:7d70 with SMTP id af79cd13be357-7d3f991d078mr1849209985a.35.1750691215838;
        Mon, 23 Jun 2025 08:06:55 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f9a058c2sm394861185a.103.2025.06.23.08.06.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:06:55 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d3e7641b76so259179385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:06:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVU2Hm2yoXBnL+6w/6qFAzMHB/Lz5EzqZeaJpaM7brViJZgWsOELaeQ+NgVl2+huQu4GDezClTFa6UALp6oP5nj@lists.infradead.org
X-Received: by 2002:a05:620a:298f:b0:7c5:9b12:f53c with SMTP id
 af79cd13be357-7d3f98c18f0mr1924690385a.5.1750691214368; Mon, 23 Jun 2025
 08:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com> <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
 <CAPDyKFpXcpwkacnYqWz2vxaTd7pW5bSRa2F063BryFxVNEAmPA@mail.gmail.com>
In-Reply-To: <CAPDyKFpXcpwkacnYqWz2vxaTd7pW5bSRa2F063BryFxVNEAmPA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jun 2025 17:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGS+efbbQ_Pn1iYhQ1aWc_DuJ-CBN=jxfjwOWxTRx+9Q@mail.gmail.com>
X-Gm-Features: Ac12FXx7Xjfa_xE6RhCHr0iaDW4i79STg-K82k32jY3Xof1MYNIo6ZlgJY_vcl0
Message-ID: <CAMuHMdXGS+efbbQ_Pn1iYhQ1aWc_DuJ-CBN=jxfjwOWxTRx+9Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
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
X-CRM114-CacheID: sfid-20250623_080659_524196_22374575 
X-CRM114-Status: GOOD (  52.81  )
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

On Mon, 23 Jun 2025 at 16:21, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 19 Jun 2025 at 13:40, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Fri, 13 Jun 2025 at 12:33, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > On 23/05/2025 16:39, Ulf Hansson wrote:
> > > > Changes in v2:
> > > >       - Well, quite a lot as I discovered various problems when doing
> > > >       additional testing of corner-case. I suggest re-review from scratch,
> > > >       even if I decided to keep some reviewed-by tags.
> > > >       - Added patches to allow some drivers that needs to align or opt-out
> > > >       from the new common behaviour in genpd.
> > > >
> > > > If a PM domain (genpd) is powered-on during boot, there is probably a good
> > > > reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> > > > powered-off before all of its consumer devices have been probed. This series
> > > > intends to fix this problem.
> > > >
> > > > We have been discussing these issues at LKML and at various Linux-conferences
> > > > in the past. I have therefore tried to include the people I can recall being
> > > > involved, but I may have forgotten some (my apologies), feel free to loop them
> > > > in.
> > > >
> > > > I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
> > > > Let me know if you want me to share this code too.
> > > >
> > > > Please help review and test!
> > >
> > > I tested this Renesas white-hawk board, and it hangs at boot. With
> > > earlycon, I captured with/without boot logs, attached.
> > >
> > > The hang case doesn't look very healthy with all these: "kobject:
> > > '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is
> > > being called."
> >
> > Tomi, thanks a lot for helping out with testing!
> >
> > rcar_gen4_sysc_pd_init() calls pm_genpd_init() and
> > of_genpd_add_provider_onecell().
> >
> > rcar_gen4_sysc_pd_init() is an early_initcall, which I guess is the
> > reason for these problems, as the genpd_provider_bus has not been
> > registered that early (it's done at core_initcall)
> >
> > Do you think it would be possible to move rcar_gen4_sysc_pd_init() to
> > a postcore/arch_initcall?
>
> I did some investigation around this and found that both
> drivers/pmdomain/renesas/rcar-gen4-sysc.c and
> drivers/pmdomain/renesas/rcar-sysc.c are registering their genpd
> providers at the early_initcall() level.
>
> I was trying to find (by browsing renesas DTSes and looking into
> drivers) if there is any consumers that actually relies on this, but
> so far the earliest consumer I have found is the
> drivers/irqchip/irq-renesas-irqc.c, but that's at postcore_initcall().
> Of course, it's difficult to say if my analysis is complete as there
> are a lot of platform variants and I didn't check them all.
>
> Maybe we should just give it a try and move both two drivers above to
> postcore_initcall and see if it works (assuming the irq-renesas-irqc
> supports -EPROBE_DEFER correctly too).
>
> If this doesn't work, I think we need to find a way to allow deferring
> the call to device_add() in of_genpd_provider_add*() for genpd
> provider's devices.

Commit dcc09fd143bb97c2 ("soc: renesas: rcar-sysc: Add DT support for
SYSC PM domains") explains:

   "Initialization is done from an early_initcall(), to make sure the PM
    Domains are initialized before secondary CPU bringup."

but that matters only for arm32 systems (R-Car Gen1 and Gen2).
Arm64 systems (R-Car Gen3 and Gen4) use PSCI for CPU PM Domain control.

While changing rcar-sysc.c to use a postcore_initcall indeed moves PM
Domain initialization after secondary CPU bringup, the second CPU core
on R-Car M2-W is still brought up fine.

For R-Car H1, there is a regression:

    smp: Bringing up secondary CPUs ...
    CPU1: failed to boot: -19
    CPU2: failed to boot: -19
    CPU3: failed to boot: -19
    smp: Brought up 1 node, 1 CPU
    SMP: Total of 1 processors activated (500.00 BogoMIPS).

CPU bringup/teardown in userspace using
/sys/devices/system/cpu/cpu*/online still works.
R-Car H1 was never converted to use "enable-method" in DT, and relies
on calling into the rcar-sysc driver directly (see [1]).  However,
that does not use any actual calls into the genpd core, so probably it
can be made to work by splitting rcar_sysc_pd_init() in two parts: an
early_initcall() that allocates all domain structures and populates the
internal hierarchy, and a postcore_initcall() that registers everything
with the genpd core.

As expected, there is no impact on R-Car H3 ES2.0.
I will test on R-Car V4M tomorrow, but expect no issues.

FTR, drivers/pmdomain/renesas/rmobile-sysc.c uses core_initcall().
Changing that to postcore_initcall does not seem to make a difference
(on R-Mobile A1).

[1] https://elixir.bootlin.com/linux/v6.15.3/source/drivers/pmdomain/renesas/rcar-sysc.c#L439

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

