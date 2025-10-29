Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D35CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdMmTEVXmrdUQVal1cKnxdF6jTyKX4No0foVL6qsIc0=; b=QYsSgkiwnUP6+QIO5zq47wWa2e
	VDEMwviU4rJ03+8lIkbSn/0+YrDbNu0XV8B2LhsqVwm0z6xyVqV1gnuD4HFdyErZQIIGe1ROcmcEq
	1E2J5HcEEZ1KHFhBPipI5E7tpALxZ2GVjKdWqlZJYFO8iFvG2z0aeAMxTr1Q4utpsPt7165Ye3tOy
	Sw0PqLXA0sBZffoHWhXytC9IoGL4JIx9rmuuffbxMXZNvQY2ytDVzl5HGsdlTGLW9al8DNVvwOt9e
	VOLtDragGmmhEp9dJ479Q0tsD+ynEOmmPa8zjLN/DZpT/g6KmkjcM1IG6OYT1zcDJlNyH1/RuQebV
	jhS1RyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2pc-00000000Zsu-3BcQ;
	Wed, 29 Oct 2025 09:51:04 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2pV-00000000Zog-3pQO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:50:59 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-932c42aaf14so5536962241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731456; x=1762336256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdMmTEVXmrdUQVal1cKnxdF6jTyKX4No0foVL6qsIc0=;
        b=snXyE1V30xye7xNya4jCjbkhQOuGbRHCGFQBV/xDagpmOg1cxVXnkO8h6i772Fi0CC
         uG0q3JAQiZ9BsgObT9UWcs/t+Ix6Iv4SHAAm2VVW5lqZAUC06u6NH+PIZbboRGl6jqHK
         GdaUHGEW66IOwV2ArXH+DysbsDdnTdP4BEnTn2ss1cY0Wi4yVa1hpcz+FlCjn+/A5iYq
         Ah3lsSBkcDH9Gga7Ct0yGWcohx/QkKSYwLEtQvIh7xOvS5LD1COvQX4TRIICdyployp8
         hvKiTEzvFeYEXmIqjkXvTKMRrPYiMXHp0kVYHWLc0jeNJ97DKIKDx2DynbyhtI+KAdnR
         yHKw==
X-Forwarded-Encrypted: i=1; AJvYcCX7E7tGqnP3G11LBzGLM3VkKpx3rmPRM0ouN5FnyJIcXG0LXSEPepZT0p+dO9VZvYdNcyvD5B207uY07C7WQlb6@lists.infradead.org
X-Gm-Message-State: AOJu0YzU88dvwp5faEoWaNZjDEoYsvoDrZFhToItZdezSd173J7pqTn+
	vUJUmBFe0dBsPGgj/3cohsiwXEVD6Gs6FKYM9aVtOCRKciKeLTMnt8EuDj37GYYr
X-Gm-Gg: ASbGncunPdR3JA07rW+LaLCSio4qfKijS+3LHitS9Bmgr8SZJuu9xoEAPSp1KlwVZ9k
	jbS/JxAIdqpi80nvl0kwjBvHeD0TZ5E/t8EvXuirCLhwL+U8NNzBMo1WZsqRSVU9VFEhIYcJ3gk
	5P7m5XgDnYMvyUsF3+M5qhHMDohp7Qk6iHovcertgCYHf+Ego/+fPcHdvjkuUiaqgGECAyBbSH3
	l5vD3bad3xYY68GyoXTRBSgRjtyvYfAOPalTVkcOzjOJgE6qrvLGLnuWXWzRYxGdgxiJFNvRlYG
	IWO94X6okHvA5ci7KFrDNhgG2VyCL1aLG7996ZXNu0GNGkJDjy9saUvNY/VghtrMeS675anQvKG
	cMwhbVzbCyeX3i+ujh2Eiw2uh3ytWHAgpNws6bnD6GWWyrHeu8SKsDfAkDqCvTXpflE7UmhGJQY
	Z8Rq2XkIQUKlXopXRDPibwyew0mo7I+RhK1U+BYQ==
X-Google-Smtp-Source: AGHT+IEBGowKZ5zds6QLLB8DhHWZXzEV0vztzDKf20sKkeTJez+wNOdkx21SC4ntggi50ioE0ayWhw==
X-Received: by 2002:a05:6123:2e6:b0:542:d782:2522 with SMTP id 71dfb90a1353d-5581420df03mr712471e0c.14.1761731455627;
        Wed, 29 Oct 2025 02:50:55 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb08b9bsm5277806e0c.6.2025.10.29.02.50.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:50:54 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5db7dcab01bso1728299137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:50:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVEEbg/LiS10bXYGG/aEAmEh+x/YYB3RQxmPoA6Oex7nYEyx1PHfAUDm/h0PELi4pWdyZwMF4L0QBDPlEyAavp@lists.infradead.org
X-Received: by 2002:a05:6102:d87:b0:5d5:f6ae:390a with SMTP id
 ada2fe7eead31-5db906e1ea2mr632557137.40.1761731454123; Wed, 29 Oct 2025
 02:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251022070543.1169173-1-ryan_chen@aspeedtech.com>
 <20251022070543.1169173-5-ryan_chen@aspeedtech.com> <b5441728-06a7-44ea-8876-3a9fc3cf55be@app.fastmail.com>
 <TY2PPF5CB9A1BE626A2F0F6307461D8F64BF2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <6a97fbb4-19c2-4ffa-9c73-26aea02c27e4@app.fastmail.com> <TY2PPF5CB9A1BE6CF8336D211641A18E2DEF2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <71df9bdf-53b2-45e2-a9e3-5b00a556f957@lunn.ch> <TY2PPF5CB9A1BE6F3E95C7FD61CF4F90ECAF2FEA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <fdbc471f-514e-4521-b7a1-dcf6127d64ff@lunn.ch> <TY2PPF5CB9A1BE6DD93D0F397C961D5CB5AF2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <01573262-69a8-44cf-ae02-2e9842c59dde@lunn.ch> <TY2PPF5CB9A1BE665D988A413B8BCD5CA27F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <7c0c966b-c45f-47ad-9243-b945036a9bd2@app.fastmail.com>
In-Reply-To: <7c0c966b-c45f-47ad-9243-b945036a9bd2@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 10:50:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVueyxmATwS_EnqBBPtX-O0bw6Ubnj-Dey8wN=pEvo_zA@mail.gmail.com>
X-Gm-Features: AWmQ_blS6idckwhpIjkOWHP0NGDWxrc7vZpSwkjlsFZQOSpuaInPPIOtTjyVPpU
Message-ID: <CAMuHMdVueyxmATwS_EnqBBPtX-O0bw6Ubnj-Dey8wN=pEvo_zA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC device tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Lunn <andrew@lunn.ch>, 
	BMC-SW <BMC-SW@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Lee Jones <lee@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_025057_964151_9D0F8794 
X-CRM114-Status: GOOD (  40.21  )
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

Hi Arnd,

On Wed, 29 Oct 2025 at 08:26, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Oct 29, 2025, at 03:31, Ryan Chen wrote:
> >> Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC device
> >> tree
> >>
> >> On Mon, Oct 27, 2025 at 02:42:01AM +0000, Ryan Chen wrote:
> >> > > Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700
> >> > > SoC device tree
> >> > >
> >> > > > SoC0, referred to as the CPU die, contains a dual-core Cortex-A35
> >> > > > cluster and two Cortex-M4 cores, along with its own clock/reset
> >> > > > domains and high-speed peripheral set.
> >> > >
> >> > > > SoC1, referred to as the I/O die, contains the Boot MCU and its
> >> > > > own clock/reset domains and low-speed peripheral set, and is
> >> > > > responsible for system boot and control functions.
> >> > >
> >> > > So is the same .dtsi file shared by both systems?
> >> >
> >> > This .dtsi represents the Cortex-A35 view only and is not shared with
> >> > the Cortex-M4 or the Boot MCU side, since they are separate 32-bit and
> >> > 64-bit systems running independent firmware.
> >>
> >> DT describes the hardware. The .dtsi file could be shared, you just need
> >> different status = <>; lines in the dtb blob.
> >
> > Could you please share an example of a .dtsi that is shared between
> > different CPU architectures?
>
> I can think of three that are shared between arm and riscv, with both
> able to boot Linux using a variation of the same device tree, with
> the .dtsi file being included from the respective other side:
>
> arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> arch/arm64/boot/dts/sophgo/sg2000.dtsi
>
> All of these however use the same basic physical address layout
> as seen from the two CPUs, with only the set of on-chip devices
> being slightly different, such as using the native irqchip
> instance per CPU.

I can't speak for the last two ones, but the first one is not what Ryan
is looking for, as r9a07g043 has either an ARM (r9a07g043u) or a
RISC-V (r9a07g043f) CPU core, not both.

> In the AST2700 design, even though we have both Cortex-A35 (64-bit)
> > and Cortex-M4 (32-bit) cores, each runs in a distinct address space
> > and sees a different memory map.
>
> This is similar to the Cortex-M4 on i.MX7D. This is supported by
> the Linux code, but I don't see the corresponding dts file for it now,
> it may have never been merged.

The keyword here is "System DT", where you have a single file describing
the whole SoC. From this, separate DTS files are generated that
describe the view for the application CPU core, real-time CPU core,
control CPU core, etc...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

