Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3356CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lajD8QJElBkHp+szQMp4lvfntXaq7B2csoiFGrMzr/8=; b=VyD2xh0RyaFo9fNDDZNsOtevh2
	BhdMb/YkMXlMtwm7rrd+49Io5WaSqiEAfC+2FVXftu2EzqAVEDc/zCEejeQbMHPmwMLInRha9szh6
	yMty50bMrgd5bI3zFeAuBWCVMy9PLFbW7+m9/NMzHCC/95hMl+YAm77ojqsfY6i3sqlj4M44XC32N
	I/HzlsRg0AeV4nnabez7c8YZNvl/K1lSpFp9RYG5o+jeWreaLMzxtABDtYMKiicAUFQUG/BTCCYvS
	e0Kd23xXhUoc6QPkXlDMTHWCucvGE7kgXhB21NHlZUGdAv5ErNsWoN1NgWwBSrytTz73q50hVl3q5
	JgG4/hAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRON-00000005RII-0d4V;
	Mon, 10 Nov 2025 12:53:07 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIROK-00000005RHb-2V3G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:53:05 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-3d2ea93836bso1797203fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762779183; x=1763383983; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lajD8QJElBkHp+szQMp4lvfntXaq7B2csoiFGrMzr/8=;
        b=c0ccrVNmnIjx0/LZ2Icxvama6qlAyWzgobiYBSOIDsnQ6b5ueG4J6TEtJwqRUvLrIv
         lFgbY3vUfRemLfXqU9DD+atW+cjZ9VNIQNDjjT0hPZtixr7peYZKfxfzFwnfm309XdNh
         cQfKfQc4PAOl7PcLm/TFRxxkfkpPLtYe8WN0ULY+HYQpEGsRzwGYBryNaxIlFB6hhFcN
         ATccA2dJ/w0ai/SSQ2ICrxYSoAJMH1h8o4FR2ot/0+JDf2EwHcp9JPE9bSryahbNkaat
         Rtty4pItuleKoqj1OG+CMcp7R6YYxg5IlHbuFPFUq2JgYEfmc3zaY+HSnNmWkGzmjyjK
         GXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762779183; x=1763383983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lajD8QJElBkHp+szQMp4lvfntXaq7B2csoiFGrMzr/8=;
        b=gAUDbXAE8LIvNjhRHb1dYiVTSYWu2MOgYbkh+MswaI/UrBRTjA5RDbyMKNZYgvt/+D
         7DzW9+ehCjvup6wXcuFLg+Jd92/5RiT5PdBu1L3puEUPQ/pRoPTvmbAYMJf6WYIpMT6t
         Mgj3bJoLYJkhlkBK9tp8d81KWOtLoaUq2iTUGZV8tx6aXKjWBlrsl6myTrc24coynp71
         k4B1SpiTwOv0/typbDSxKzp3r5OfnGjUplO+jmai6pFXDgPyU3wJimPHncmokOWq9RYw
         YSdRJbpfHCy5T5M7Jj9ZxrNjliZE3HIyJviuPd9pRwPR6p7jUm35BI3FmkvejjEmUc0N
         cAQA==
X-Forwarded-Encrypted: i=1; AJvYcCUB5on09+5FYN/eb1zSv6qfMGN40mN/jtCSYX1z1no7+c3o4Dol84ZIESx9+3+5ijZP8w7vNpHYu9NgzsEPTLJx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4PgSBg5mN5Rr9T/IqMJr3cLmHwz4wkxykWIReyNBJLpyGPKaK
	hzQIyNsFjMCHDSK+SbwPZmTwm+qXEHGe67x2TRztlY2Trq5idX9n8O1z04kGI93NBKKcrT5Eo2N
	e1XwlUjassvY4vyI0I8clW38J+Bjpi6WzJno9Y9P8HQ==
X-Gm-Gg: ASbGnctxLafobw06e2gQb5inJiYo9/ZD5S/GdZSlV5jYTs+ZRUEsyb8Mho8sokQt6UQ
	u22l/mMdWrvDLUlQH23+AOB8CKg5L+jNZPqMgcHgncj4OKueXq9tSDhxBoNucwGF1I79//irxvb
	PXWVDUPSb9P+kO1wf/3EAtuLOp/Q9UTe5VWSLDKDMw6ANKzfOp++5ljfYt4vnrLm3SFbnkl0LAT
	PveCg0KxR9JRHcmLH1cn7n+Pih/wV5vdqDzxnXPNbVsmqSI07WZzJ+Ctdg5
X-Google-Smtp-Source: AGHT+IHaOc9Hf++xJ77n1T9F3eaANxA6a255QvjbOAcsfDAumQrnMbLyVAX5itd8dNhL35m/2iP5WQb/9KW6fxXbd5k=
X-Received: by 2002:a05:6871:60c:b0:3d2:fddc:862c with SMTP id
 586e51a60fabf-3e7c2452b4cmr4340908fac.7.1762779182758; Mon, 10 Nov 2025
 04:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org> <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
 <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com> <20251104-enthusiastic-cream-gibbon-0e7b88@kuoka>
In-Reply-To: <20251104-enthusiastic-cream-gibbon-0e7b88@kuoka>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Nov 2025 12:52:51 +0000
X-Gm-Features: AWmQ_bmYJGLwRqlUrf73Sc1rVwj8QxtUbwqaYUkACotkTBe74SIkf0KWHru_6Ms
Message-ID: <CADrjBPpGt3qBGucF1COWZT=OZ+8ithg6=-QefhKUiW4tkC=KrA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_045304_652842_4C4FC8E7 
X-CRM114-Status: GOOD (  32.75  )
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

Hi Krzysztof,

On Tue, 4 Nov 2025 at 08:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Nov 03, 2025 at 01:49:53PM +0000, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > Thanks for the review feedback!
> >
> > On Mon, 3 Nov 2025 at 09:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> > > > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > > > that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> > > >
> > > > If present these registers need to be initialised
> > >
> > >
> > > ... for what exactly? What would happen if this was not initialized?
> >
> > The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> > bus components. So it is related to the automatic clock gating feature
> > that is being enabled in this series. Things still work without
> > initializing this register, but the bus components won't be
> > automatically clock gated leading to increased dynamic power
> > consumption. Similarly the memclk register enables/disables sram clock
> > gate. Up until now we've not been initializing the registers as
> > everything from Linux PoV has been in manual clock gating mode and
> > until starting to implement this I wasn't aware there were some clock
> > related registers in the corresponding sysreg. Additionally with
> > Andre's work enabling power domains it has become clear we should be
> > saving/restoring these two sysreg clock registers when the power
> > domain is turned off and on.
> >
> > > What is the exact justification for ABI break - wasn't this working
> > > before? Or new feature will not work (thus no ABI break allowed)?
> >
> > No, automatic clocks and dynamic root clock gating were not working
> > prior to this series. Currently power domains and system wide
> > suspend/resume aren't enabled upstream either. As we work on enabling
> > these features we are finding some things that in an ideal world we
> > would have known about earlier. Unfortunately it's not so obvious just
> > from studying the downstream code either as they rely heavily on
> > CAL-IF layer that has peeks/pokes all over the memory map especially
> > for power/clock related functionality.
> >
> > Whilst it is technically an ABI break, I've tried to implement it in a
> > backwards compatible way (i.e. an old DT without the samsung,sysreg
> > phandle specified) will just fallback to the current behavior of not
> > initializing these registers. Things will still work to the extent
> > they did prior to this series. With a new DT the registers will be
> > initialized, and dynamic power consumption will be better.
>
> So explain that this is needed for proper and complete power management
> solution on this SoC, however that is not an ABI break because Linux
> driver will be stil backwards compatible.

I'll send a new version shortly with an updated commit message like you suggest.

Thanks,

Peter.

