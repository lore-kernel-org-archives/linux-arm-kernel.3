Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137B8CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZIqmD8zZ0qFeOi8hR6tlVmjP85Y0OQ26EIUPvE1H2I=; b=fhav8c03pQ/obYWlCD80lSFn8g
	Zx7o8PLq6510DhlkA882ToG1NQIYfLLS1lLk1fDfYCLPZWTibJdhE/7BdUXbsgT0D0dbrDy8mnY78
	+0cylT3ViDk2xAlk5nI0WFnAXVQ93dwLB0MruR3oazVMz3g/9B+puKDsyY2N1lbeA2apATQ/XefFn
	Jb2ttix2jy239qxiyMlEAVCrPWdd+PnJzn/vOFLkx+a6J06lw7Cp8m/8bPSBQaCeG0BjdG3eQbYnc
	PD7/rNhYzQJk7X9c5wqvN06ojau32g9Ap9gbfLR0RafHN1X7Y9hlx3H47KBouuI8jIOd1ONecHoHa
	N9ORs+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIPi-00000006Dzt-49Yu;
	Fri, 08 May 2026 10:26:35 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIPg-00000006DzX-3gdI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 10:26:34 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso1098676241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 03:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778235991; x=1778840791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZIqmD8zZ0qFeOi8hR6tlVmjP85Y0OQ26EIUPvE1H2I=;
        b=oM+sO/QTuN2I63PdDdUG77DsDFh2agy5L0062AH7C0UDHs5LchlqyJcYsGJbhzSOlx
         /7VPbIc0DFWuukOEfajD1EVwUcdyGtWTMSgiKMk3q2VSDYl1T7OoJVMplKzrkk0v4lDh
         VIc+nvPO5bkjnt73PzVk9sMxDl+wXt62jKdfVMMEzeCvLW/Pv0ijAuPnqBAURMqwDFfO
         hNtTioAuQ9e2PwasSnS7EEyuTcmjs04EL3WQ35WswYB5XXjxGIdBvhSjvyfGg5llpMPI
         +qD29EUmM0LSQzCk73DP0L1q5TjNfFqx5knYDIRwmeJO445xBOZ6F/v15vtC8BMH23pA
         F0vw==
X-Forwarded-Encrypted: i=1; AFNElJ8ndDocsqFulyUJKUKvjCMgGHxVuA0hpd5azxd39PhK7yy+hyLuCQXYhEVMVrK95Ww4rp/6crxwgpXyPTfMJDo/@lists.infradead.org
X-Gm-Message-State: AOJu0YwFZ0/hcusI6XhzwVho+nT5JowjUKN7ajj/VIw+BeqNB+QcYNnn
	4gSJktGGBHZVU3FU1nTb+R9iULZlc4Ga8nxABUXSq1TSJMb/KGMRh+QtJeLoRxO9DuY=
X-Gm-Gg: Acq92OGFRCzSfyiU/j3k6xseUe+puFB62W6CQae3B0yz95GlYqc9n1d9FEawWCwDxfq
	M/4yFFbwnDfHrWrLLfQcLRyl1CY9+tj10KXVr0Tusr58IZOpOalUqLXK57oCs0YdqOPgCiiXcLA
	FiczbnNcLuFFnspf0IrODKFOvb/Dx+MeakbdflWap4L4X9gGpQiWd6Deqk1dDoI8LDXWYNjN1fa
	plh2ybR+OSCFZ8jB3YPMhhkiEo5UnGi7LQ4K0NVdCtJIq36DPo5FzZBcEzxzDpCIgRtl4L5/Vmu
	MgHRwYwGsOcUon21IkrIGeNvr+F9NLoYoSBFe01elKr7m2h+gpVMAJVagCoLNZFYz7QhQr0Ab57
	BlEl2IDdccbB1e/DyZNwuxR0wCZtqTRw28Gv0orvrxaXV9Rb+dw9cedqLf0TRy0dgKqhxxmo9dZ
	XDKwBWdbGPi8+tlBpaxuQ2/XoFejrW/YeMY+44BY09DHplk5a0Qamcr4TN46Ru
X-Received: by 2002:a05:6102:c46:b0:608:a960:c85a with SMTP id ada2fe7eead31-630f8eecdd2mr6521484137.9.1778235991354;
        Fri, 08 May 2026 03:26:31 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21a15c54sm592943241.6.2026.05.08.03.26.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:26:31 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso1094259241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 03:26:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fYkxD2Xw1K7fzgroMJeqLSQMHVMfPU4l/IhTgFuCQoQP0o3WnWgRmuwADJ16xmZjITiVC0DW2B9x+pkSotYcX@lists.infradead.org
X-Received: by 2002:a05:6102:3048:b0:614:bef5:637c with SMTP id
 ada2fe7eead31-630f8c2bb7dmr6450388137.0.1778235990622; Fri, 08 May 2026
 03:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto>
In-Reply-To: <ae6Zp54NhKlVes8J@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 12:26:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
X-Gm-Features: AVHnY4J3TVnOKvIG81cskhXstanCgVV2EYjhdTAUgyNfFJiiKyj4H0BCwyLVTfY
Message-ID: <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260508_032633_013903_B37AF730 
X-CRM114-Status: GOOD (  48.12  )
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
>
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

Exposing only the clocks/reset/power domains the agent can use,
in a contiguous list of IDS, means that the number space changes,
depending on which resources are exposed.

Suppose you have a system where you want to assign a specific hardware
block in the SoC to the realtime CPU core instead of the application
CPU core running Linux.
That means all resources used by that block must no longer be exposed
to the Linux agent, and the corresponding IDs must be removed from
the ID space exposed to Linux.  As the ID space must be sequential
and contiguous, the IDs must be renumbered, impacting resources that
are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
must be changed there, too, However, these IDs have become part of
the stable DT ABI, and thus cannot be changed.

This patch series fixes that issue, too, by describing the actual
hardware in DT, and doing the mapping to exposed SCMI features in the
kernel, based on which firmware version is running on the SCP.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

