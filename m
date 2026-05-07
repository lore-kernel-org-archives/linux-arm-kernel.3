Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C06CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlujo7B4GXnOEwb19kGu4mpvesYmekRBqIKCAW22YrQ=; b=kFIplbEipgnbzz9cWF9iQ33iPQ
	51qeT17HquC0hr5GyrbMZNH+zZejrqnd/eZYYRMXjFkImPDYyRVSoE1nLeg62fOKh+IDucBH5lA4Z
	U09aK9r52y8TQCADfyS5IHrEbDuJuUQn9Wsxr/XpSznBhMBBR88d9CcKYuhREVgR1zWgRAlIB2WQU
	BnxxNLk3QVqo3spNs0IAp8LHY52sfSwEXq8VdNQEDv+RziedajCC9RBu++z9fRWsTo7u7LDOZvCPu
	PdQ7trvzUxK16z5nHhyjnqwNqBageUZb/E1ghXoSbxxLbeOOcdfZCg9jLMYKqx96nmL6tQCgRz0V7
	1iCvaT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtrl-000000037IR-3EuM;
	Thu, 07 May 2026 08:13:53 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtri-000000037Hc-213k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:13:51 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-365212191f6so395572a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 01:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141629; x=1778746429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlujo7B4GXnOEwb19kGu4mpvesYmekRBqIKCAW22YrQ=;
        b=gt8CY8IC6hcGupQ18diNaC19lU0R/TjphEZAbU/+HIl6yw4n/h48Kjsb+vQOClVRhS
         ei9V+q06eVFkKi2MJbssdb9rCs4vxspwTaO0HvICJNO9kM+W3w2HKM52NU8+k0D2suvX
         7t0wKipDxWIrDSWaYAQN6dQH9dSg0xhpw0Ey7yd4TArMmKww9Jb2K0ceO7VmL/6Muv09
         Fc2yG04JqSuomzPMdXeXgCAwdZEn4UhxeHKsw41oDwBK7XsjIUru9xiHYHXWEzYLMiTL
         orMakeLGuVfyy7kSPGlRlrHf1bXuAME1/gg1HGFpAG63vI997ZSg3g5b03+8brTR1UsM
         txOg==
X-Forwarded-Encrypted: i=1; AFNElJ+tyY8Kp8JhjR5/qv16tO7OoDsMUi4tHi01Lqw2dgUS9ZZK/boBKm/sDKlHGIDYXJozCkQqBPFSY0QCiTaHdRNF@lists.infradead.org
X-Gm-Message-State: AOJu0YzR15xPVXoqkSVKKJJF9N3yzBkJaZi9MimbkwWQSikpnw5SRSgI
	/f3asU3PyDb8MSrPcrfpo5eb5Uo15yyEg+ixfIqyO1W75n6Qfrw6dtwHZe9C+OwLmXM=
X-Gm-Gg: AeBDievIuRgKd0MSkQfBmM2efmXZj1ejjjOfmruHmBZNh7yxJ8P4XDUfjIKNAv0zW/2
	UVeZPyEgcmbhJKHEoX3O79B7V6EMMyk3KQJmw2mJCFtR1X/JaVhbN07uk3Sv7ilUhUBDk+iRgCK
	ZfBCpeXt20dkAO+BrGgzjX4ub20cJsamSTpAZIteplmdTBtr73gg58ltzGtvQAgJhp4p4OQw3zD
	PCMlhSTqAHHOg8Qqmw5qsVPnQuRpWl8TnRNlcF+i7++ptXoEoBgIDI3B45c3c2tfMmzRYUk0WQ0
	MPAH9+rLWfDF9WDyB8iEInOteCgNRRQf75JUD9e+NF1ibU9VlGAWigjLLafogrUk1QHspmprJDu
	u1XjnEYcHXrB0SAMFmG5NsUepj7rF1dWJGEgUGM+XInp4/mSY/jVgHxthLWagWzs0zl1OFlThCy
	xbyuDTmAmzYhsXTdzTq6ZY8D9D9pnAjA0hPqh1aHSRmG1SbnlBcu8LzIKKUcAvh64neOztYKvPg
	A==
X-Received: by 2002:a17:90b:3f45:b0:364:6558:99bf with SMTP id 98e67ed59e1d1-365ac0801a8mr6776923a91.14.1778141629148;
        Thu, 07 May 2026 01:13:49 -0700 (PDT)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b46c42sm1360370a12.25.2026.05.07.01.13.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:13:48 -0700 (PDT)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so1438305eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 01:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8JNcastNd+sHjrU0mrpzvwHv5ucoHSPWi08azBye1nH7k4rz1LhfrMbpwMvBdagJz9UiiLZJAmnAIsaGQcrIoJ@lists.infradead.org
X-Received: by 2002:a05:6102:304e:b0:62e:79ee:4cda with SMTP id
 ada2fe7eead31-630f8e6ad78mr3364577137.3.1778141327428; Thu, 07 May 2026
 01:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto>
In-Reply-To: <ae6Zp54NhKlVes8J@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 10:08:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com>
X-Gm-Features: AVHnY4JbGLo8_iAmQ_D9O0588NyvaqL5CIqCjBD959GBuikmvjn-HVAEApsHrL4
Message-ID: <CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_011350_524240_EA59B14F 
X-CRM114-Status: GOOD (  61.45  )
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

Hi Cristian,

On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > > > Currently non-SCMI drivers cannot find out what the specific versions of
> > > > each SCMI provider implementation on the running system are.
> > >
> > > Thanks for your patches....this is not a proper full review of the series,
> > > BUT this patch catched my eye..
> > >
> > > Indeed, yes, it is deliberate that the SCMI version information is NOT
> > > exposed out of the SCMI world, since being the SCMI an attempt to
> > > standardize a common FW interface (as in [1] of course), you should not
> > > know what runs inside the black-box, it should be irrelevant...
> > >
> > > ...indeed the versioning is used inside the SCMI stack to deal properly
> > > with different protocol versions implemented by the server OR to apply
> > > proper quirks when needed, but all the rest should be standard....
> > >
> > > ...you should NOT really behave differently based on the underneath
> > > protocol or firmare implementation version...it is the SCMI stack that
> > > should behave properly, transparently...
> >
> > Oh well...
> >
> > > Having said that...I understand that at least it could be useful to be able
> > > to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> > > have been applied/activated at run time...but anything more than that it
> >
> > I see no need for that, but we can discover which quirks have been
> > applied from the kernel log ;-)
>
> Ok so I may have misunderstood...it seemed to me, glancing through the
> series that you wanted sort of reconfigure other non-SCMI drivers based
> on the SCMI FW version assuming that some quirks were applied BUT also
> that some sort of corrective workaround was needed additionally...so
> what I was saying was that: is not more straightforward to be possibly
> able to check if a quirk has been applied instead of querying the
> version from outside ?

I am not sure I can implement everything as quirks...
Also, as quirks.h lives under drivers/firmware/arm_scmi/, accessing
quirks.h elsewhere requires a relative include path.

> > > Also because this should be one of the selling point of the SCMI stack
> > > in a virtualized environment: you can ship the same kernel drivers with
> > > the same DT and you know that ID=<N> will always identify the specific
> > > resource that is needed by your driver without worrying about the fact
> > > that in reality in the backstage the effectively managed physical resource
> > > could be different across different platforms, because that does not matter
> >
> > This sounds strange to me, do I understand it correctly?
> > So the ID should (1) be tied to the use-case, and not to the underlying
> > hardware, and (2) be the same for different platforms?
> >
> > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> >     to describe the hardware (and firmware IDs in DT were IMHO already
> >     a stretch before).
> > For (2): How can there be a contiguous list of IDs, as not all platforms
> >     may have the same underlying hardware?
>
> I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> is a possible SCMI deployed setup that can be useful in virtualized setups
>
> I mean, the DT describes the hardware of course BUT when you refer to
> some of this hardware DT bits from some other subsystem by referencing a
> phandle, even in the non-SCMI world, you are in fact selecting a specific
> resource that fit you use case, right ? Can we say this ?
> I mean you needed that specific clock or regulator that you described
> previously so as to be able to enable some other piece of HW...

OK.

> Now, the SCMI provides an abstraction on top of this, since you really
> discover domain IDs of a specific class (clocks/regulators etc) you are
> in fact describing an HW abstraction that you then refer with the usual
> phandle...also because there is NOT so much SCMI hardware to describe,
> given that the HW is handled transparently (opaquely really :P) by the
> driver on the FW side...
>
> ...you basically obtain such domain ID, usable as phandles through dynamic
> SCMI enumeration so that you can use it all over your DT to make use of such
> resources...
>
> ...on top of this, consider that the SCMI server CAN provide to its agents
> a per-agent-view of the world, IOW it can (and should) expose to a specific
> agent ONLY the resources needed by that agent, i.e. it can expose the set
> of resources 1-N to two distinct agents and that does NOT mean that the
> underlying physical resource mapped by ID=3 in both agents has to be
> effectively the same piece of hardware: it could be the case, and this
> would be useful to exposed and managed properly a shared resource, or
> it could also be that the same ID=3 could refer to completely distinct
> pieces of the same class of hardware...(same protocol same class of
> resource...)
>
> In fact the SCMI server provides an abstraction, sometime a mere illusion
> to the agents...
>
> So in a virtualized ennvironment you could expose the same ID to a pair
> of distinct agents on distinct VMs, so that you can use the same driver
> and same DT despite the fact that maybe the underlying resources are
> distinct pieces of hardware ...

I am not sure how this can actually work.  Many clock, reset, and
power domain resources cannot just be remapped to different hardware,
as they are related to other hardware resources described in DT,
which are not handled by SCMI.

Take for example a serial port:

    serial@c0714000 {
            compatible = "vendor,serial"'
            reg = <0 0xc0714000 0 0x60>;
            interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
            clocks = <&scmi_clk 42>, <&scmi_clk 43>, <&scif_clk>;
            clock-names = "fck", "brg_int", "scif_clk";
            dmas = <&dmac1 0x33>, <&dmac1 0x32>;
            dma-names = "tx", "rx";
            power-domains = <&scmi_pd 44>;
            resets = <&scmi_reset 45>;
            status = "disabled";
    };

The clock, power-domain, and reset cannot be remapped to a different
serial port instance, as they are tied intimately to this specific
instance at MMIO address 0xc0714000, which is wired to a specific ESPI
interrupt and to specific DMA controller channels.

> ...OR on the other side you could decide to share the same resource with
> different agents (say a clock) and take care, as a server, of armonizing
> conflicting requests from different agents (e.g. by refcounting enable/disable
> across all agents), WITHOUT necessarily need to expose that same resource
> with the same ID to both agents...

E.g. preventing the inadvertent disabling of shared resources like
shared parent clocks I can agree with.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

