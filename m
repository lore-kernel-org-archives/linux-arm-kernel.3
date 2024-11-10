Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5421D5E123
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePMmnRiXJkYLNWS2ahzAE5K60sKD/KQbBf4D5d5ZRsg=; b=to/wzpUh+n+F5l
	REL6PtbM3PPZCRyMXYm3km1Kdps8PseSpg31FAfUQHkKPhlBu3MVuPoH4UauV4pU4RWbHFh06TyDa
	ufLcrm9IA2fat/5/o4lJsZbyALNZ73hNUy2Y7Guz0TWvNKWREC4c+o0r+o4FcCkjhk8EySqjFKBn1
	kJ0M7IckTBnzG9RWt00+iFl2hDzMFyzfijPPowauc+NjOSS6QEKOBiFXAb5mHsScG3HtLr15ubNBl
	vbXB7Sb1BzDV/VUrKAt/etDQQfNCz0sGEa08FNmrra8NCR2rbeFUDCAQD1L25+PFehWGqFjoD/OCK
	cLqCpoxmeB4337jZzuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA7AV-0000000ErH5-2PR3;
	Sun, 10 Nov 2024 12:35:51 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA78k-0000000Er99-1eOm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 12:34:04 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e63c8678so4307612e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 04:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731242040; x=1731846840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePMmnRiXJkYLNWS2ahzAE5K60sKD/KQbBf4D5d5ZRsg=;
        b=hPUYDwUq5/HrgiYdyoOMLHzxpNPqnYmSBaaQZhMfnEheu/RmZaow2+XukzL6mPWUc1
         hAwC8xNYKuzEn3HZ+MIJcQnAShB7Nk544zrVEvdCxPqJLjJQvH1mlN5hk6yzM7Lw+N/N
         jwUPh608PZEsZxSM3p84Mkjx8raMXop2Z+yDVMik7leafI2COlYdz29t/tUAAOqxrOzc
         kF7qUb0OB4mREuNmV98ceO+Hi+EoefDsdqvl3J0ndMF/BLZXPmw/tA+cOwg9fksJyZr5
         NkCc/fReEukXu07V3oNNo9BllRROgdb/75HiIOgM5mOYMarrwa4jrSFoy4/clWPYHkPD
         2M8A==
X-Forwarded-Encrypted: i=1; AJvYcCXj7NnCZvboUECZ/tSAoePfgRy0x1c0UGPhdc155hdsQvud1NVh7/XFJRlTKy5vA8xq3y8xFX8tu+JiRmLVdC/f@lists.infradead.org
X-Gm-Message-State: AOJu0YyuaPb/Y/mKiovSOlPUh3nMZ8pBsQWW2joZyQAaigHyQaTgdQjl
	pvoJM9N3h82NAB4W6f6YkK7mkwS8hOGp4E4/b389G6RHjSh/keJ0XNbjlf5m
X-Google-Smtp-Source: AGHT+IHKofQ6d/R1507wQL4dhUv2OZIMsvMLsEHjUHE13Yj884VMxZss8l+BwGIlhJ0nQqVVwc8OzA==
X-Received: by 2002:a05:6512:3d8f:b0:539:dca9:19cc with SMTP id 2adb3069b0e04-53d862cd106mr3964345e87.4.1731242039274;
        Sun, 10 Nov 2024 04:33:59 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9cc7sm1208652e87.196.2024.11.10.04.33.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 04:33:59 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3110b964so28146901fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 04:33:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfcfOjeL9OJ0fxPAT24Iaat2VEgR14NJkSvZ7Os8hGX+gO8QxPba6RfKZAKoNH5FZZ5pOF8xKfaOPivQtlz2bz@lists.infradead.org
X-Received: by 2002:a05:651c:1515:b0:2ef:243b:6dce with SMTP id
 38308e7fff4ca-2ff20185abfmr37481621fa.10.1731242038795; Sun, 10 Nov 2024
 04:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20241025105620.1891596-1-andre.przywara@arm.com>
 <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com> <20241108223400.460982d6@minigeek.lan>
 <a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
In-Reply-To: <a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 20:33:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-4VK_V4Ob__VAB0+qETuisvdUEUFVwg-7SfHy4rv6_g@mail.gmail.com>
Message-ID: <CAGb2v65-4VK_V4Ob__VAB0+qETuisvdUEUFVwg-7SfHy4rv6_g@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Evgeny Boger <boger@wirenboard.com>, Andre Przywara <andre.przywara@arm.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org, 
	simons.philippe@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_043402_454286_561EF536 
X-CRM114-Status: GOOD (  28.17  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Nov 9, 2024 at 7:15=E2=80=AFAM Evgeny Boger <boger@wirenboard.com> =
wrote:
>
> On 11/9/24 01:34, Andre Przywara wrote:
> > On Fri, 8 Nov 2024 23:14:51 +0300
> > Evgeny Boger <boger@wirenboard.com> wrote:
> >
> > Hi Evgeny,
> >
> >> Tested-by: Evgeny Boger <boger@wirenboard.com>
> >>
> >> We had stability issues with some of our T507-based boards. T507 is th=
e
> >> same die as H616, to my knowledge.
> >> They were fixed by essentially the same patch, which we unfortunately
> >> didn't submitted to mainline:
> >> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54=
ca1a1756458af
> >>
> >> It's worth noticing that not only the reparenting is mandated by T5 Us=
er
> >> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in th=
e
> >> same way.
> >>
> >> We tested the patch extensively on dozens of custom T507 boards (Wiren
> >> Board 8 PLC). In our test it significantly improved the stability,
> >> especially at low core voltages.
> > many thanks for this reply, I was hoping for such a kind of report!
> > I typically don't test those things in anger, and only have a few
> > boards, so having those reports from the real world is very helpful!
> >
> > Can you maybe give some hint on how you tested this? Does "at low core
> > voltages" mean you forced transitions between the lower OPPs only, or
> > were the chips undervolted?
> Both, in a way. Some boards (about 1 in 20 or so) would hang after a few
> days of operation.
>
> During our investigation, we found they would never hang under stress
> testing, so we started examining cpufreq-related factors.
>
> Disabling lower OPPs also prevented hanging. If we artificially lowered
> the OPP voltages (undervolting the chip), the boards would hang much
> faster without the patch, and even the previously stable ones would
> start to hang.

I guess we can merge this one then?


ChenYu

> >>   From my understanding, all Allwinner SoCs need to follow this kind o=
f
> >> procedure, however it's only implemented in mainline for a handful of =
chips.
> > Yes, I saw, I have added this to my A523 code already, and prepared a
> > patch for the H6.
> > Do you have boards with any other Allwinner SoCs you could test on, or
> > even already have experience with?
> Unfortunately, no, not really. We only use the T507 and A40i at the momen=
t.
> We=E2=80=99ve never had these kinds of issues with the A40i, though. By t=
he way,
> the A40i is among the few Allwinner chips with reparenting implemented
> in the mainline.
>
> The A523/T527 is really nice; it's a pity it's limited to 4GB RAM.
>
> >
> > Cheers,
> > Andre
>
> --
> Kind regards,
> Evgeny Boger
>

