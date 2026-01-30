Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71339E6BF1C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ua8lq97NxZFVhL5+3f9y9xRGjdmm39lr8OPlguNpmk=; b=xjCtfAjdAc4eh458p7ce1saYew
	+8eUCCYquZXvbJE2iyvuyPYn3OQRaQpFb39OQBokm4sFYUeaN/d4apwGFbzhdgq3tcRDrhEV8K3qB
	yd3LFgrfn6OjMfI7fnE0nZECT6yGkqLBtPy4ej1+BA7KDvWycXqlB0Zk8ZjMexE6eKOIracsFQaDY
	M1NyXY6d1TfCNagPe+ITMEmxNalrAEChrz2K9rwQ2e6XQQLpeY24XzTE8MUiWW13ZbetnwuQ3I3uv
	+zlr7etr6iB5Utlb+O8j+njoD7rALXDP06ayPZg3D5dFqloR13UD3obcA1uFJSBqNQi4UbmGtL9L2
	/dag8sUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq1B-00000001cE0-0vsg;
	Fri, 30 Jan 2026 15:02:41 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq18-00000001cDN-2Zjz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 15:02:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59b710d46ceso1996351e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 07:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785355; x=1770390155; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ua8lq97NxZFVhL5+3f9y9xRGjdmm39lr8OPlguNpmk=;
        b=XmgkDC32KxYpdisgBsrboIu3tDAMa3iI6jtso/9LgdZikXYybwiSIDSjSSkSYE61JS
         6BRtxemWZlPVaUqBmEcsYvp4nHkYPaRpWVqapT84FEI1jmUBNP9i3kCqZflMb7mZgF3z
         Cflo8xNdsth4/fJ0wzMK0pMh2QIfgfx+gBjlfn2/mL3hNjQ8RvUktsBv943Y9XVbulBp
         x3MSoUW40Sp3fQ6b9Vo4ZaW+28/2Y79m8cKFAU/r8WtNAHfAyKDY3Dx1BPjo+Bsu4cMx
         lbN4LgkzbnHsgCnev8Zi0uYNApmvtqYDQ6jEG+/t8rO7g7QWPeVX467kzjAvt/W5EC2y
         2zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785355; x=1770390155;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ua8lq97NxZFVhL5+3f9y9xRGjdmm39lr8OPlguNpmk=;
        b=sQwSyOxIEEARk6tI40v21eKE9EqZAUbayF9QidN3KqMqv4Ew/maR7dOAH8Yt/SqyhB
         DfXNPLNl9rFDtlxBGARU5dQMbFeRiHYTKgVL6/ZwIpFX98fI9y8RFvCQw6hRXy4NZPJv
         jPlLkATArjrXmiHwXFBugmHz0nySjnfmLbbgfJQzNWc7DoOhEUNvZSEAk8EVJVuRzIWN
         Zvc3t95SLR/IYB6EhA0SR+xAjRmJjZVEQDS3U6T7SL0IbuPf/OpXAErOc5Uypkef1hmo
         DTYSZ2kqeP0wSZGf0/Acxkk+QlCFo6xHAkNaHSqniSoB69kyQfW2rtkZ04fkhPtdgH3H
         Q3gQ==
X-Gm-Message-State: AOJu0YwC2F2TWkZ35IRieesFGtqdyEpnkSUOQ1P3SRcW6xU6UQDlYZ0c
	JQsNoiECjAYQfuJt2ARl1MteoiZJtny9ekbCg4bu/QcupYkbn6muyTnw6div1GYl
X-Gm-Gg: AZuq6aLny2595u2hXj6O+kyzvN+XCXDy4UZ+CM273v2Ke3CSu1ZcXgZqCDhIiWS2QjL
	ADMI8RbpIL+iTeSYsme9VPqROW6PIrH1YllFdfvABuTQeUfD1BnztJ5IuiApeSsORMGFNBe42mr
	+WzAizupY21p5jw9TanyFpwlkCfdnDe6xdvXck2uBbVQ7vC2oJr/+Tt/yQf6Kg8ap2Tg3v9CTdR
	+lkXo4mmUbTEq/4+REiisZk9jq6O5i68fN0P0PmBxsWWcrwPNFd5kTK3FyMp4cwsVm4U/Gf5B3P
	dZvqWvvAy6K4PgaeLUBdzWibkKFv2yYTcRts1dlSUiJlYhczlDH4AQlm1v34pSCU84RWFINXcL0
	PoT/Gv5Ira8GkjEdx6H0nz6CJVaGe2qzWZfTHnQQzwQH1YVHPzBfj+d8lsRW+g97lsNWlH0wRCX
	Pz9CGIA2HccmCB0kX68KSkicN9
X-Received: by 2002:a05:6512:3405:b0:59b:b17d:9852 with SMTP id 2adb3069b0e04-59e163f5a11mr1004299e87.1.1769785354771;
        Fri, 30 Jan 2026 07:02:34 -0800 (PST)
Received: from strix.localnet ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm270613075e9.13.2026.01.30.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:02:34 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Andre Przywara <andre.przywara@arm.com>
Cc: soc@lists.linux.dev, linus.walleij@linaro.org,
 Jun Nie <jun.nie@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <fustini@kernel.org>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Fri, 30 Jan 2026 18:02:25 +0300
Message-ID: <10794569.nUPlyArG6x@strix>
In-Reply-To: <5c8e88f9-4f21-41ec-ba55-bc3b06861157@arm.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <5c8e88f9-4f21-41ec-ba55-bc3b06861157@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2338004.iZASKD2KPV";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_070238_689072_6AAD178C 
X-CRM114-Status: GOOD (  38.04  )
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

--nextPart2338004.iZASKD2KPV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Fri, 30 Jan 2026 18:02:25 +0300
Message-ID: <10794569.nUPlyArG6x@strix>
In-Reply-To: <5c8e88f9-4f21-41ec-ba55-bc3b06861157@arm.com>
MIME-Version: 1.0

Am Freitag, 30. Januar 2026, 17:02:16 Ostafrikanische Zeit schrieben Sie:
> Hi Stefan,
> > 1) The GIC is a GICv3, but there are some extra registers (probably on a
> > different chip) to switch PPIs and SPIs between level high/level low or
> > rising edge/falling edge.
> 
> Wouldn't it be possible to fix this up in firmware and not bother the
> kernel with it? It would treat this like some very platform specific
> setup, as there is probably also very little point it ever doing it any
> other way?

Yes, this is certainly possible, and it is in a way what I am doing right now. 
As far as I understand the hardware I won't have to switch this at runtime, it 
just needs a sane default.

> The arm64 booting.rst specifies the expectations of the kernel very
> clearly, for instance it demands the GIC to be setup correctly and be
> booted in non-secure state. The arm(32) kernel was much more forgiving,
> mostly because many firmwares couldn't be fixed, so there was no choice.
> But I feel like for "new" devices we should lean on the safe side and
> use the firmware to bring the system in a sane state (pun intended).
> 
> It looks like you have access to the firmware and can change it?

Yes, we can replace Uboot on the NAND and boot our own via USB as well. ZTE 
actually provided uboot sources too. And I can certainly add some preload code 
into uimages to fix up registers, so these kinds of setup quirks won't go into 
the main kernel.

How we handle this for user-installable systems is still open. It depends on 
the risk of producing a bricked device. But we certainly have options.

And yes, they are begging to be called "insanechips" :-)

> > 3) The SoC has clock and reset controls in the same MMIO space, even the
> > same 32 bit registers. What is the preferred way to handle this? Two
> > separate clk and reset drivers that write into the same place? One
> > multifunction driver that exposes clock and resets? One syscon that
> > contains the reg values and two separate clk and reset drivers that
> > consume the syscon?
> 
> That's quite common, and the solution is to have one driver, that acts
> as both a clock and reset controller (registers to both subsystems).
> Look at sunxi, for instance (from the sun50i-a64.dtsi):

Thanks for the pointer, I'll use this as guidance.

> Allwinner cores also reset into EL3/AArch32, there an RMR reset brings
> it into AArch64 state. For this to work Allwinner provides a writable
> MMIO register that backs the architecturally read-only RVBAR, so you can
> program the AArch64 entry point.
> https://github.com/u-boot/u-boot/blob/master/arch/arm/mach-sunxi/rmr_switch.
> S Not sure if this works here, of course, but just FYI.
> In any case I feel this beast is better left in arm32 land ;-)

We tried to do something similar. We can actually change RVBAR and read back 
the changed value - and the value becomes 32 byte aligned. However, writing to 
RMR doesn't seem to do anything. The CPU just continues to execute the next 
instruction. I can even read it back later

What I'm doing in EL3:
mrc	15, 0, r0, cr12, cr0, 2	@ read RMR register
orr	r0, r0, #2			@ request reset in AArch32
mcr	15, 0, r0, cr12, cr0, 2 	@ write RMR register
isb	sy

and it merrily continues executing after that. It does that with or without 
the attempt to set RVBAR. If RMR worked I'd at least expect the hardware to 
crash in some way, not go back to the interactive uboot prompt (which 
continues to work fine). I also tried to set bits 0 and 1 (reset to aarch64) 
or set all 32 bits. There's no observable change.

We don't have any board schematics or datasheets, but I assume the 32/64 mode 
pin is wired to arm32. It may be controllable by one of the GPIOs, but I doubt 
that. So far we don't know of a way to reset the main CPU without resetting 
the entire board either.

The third way I read about was to attempt to return from 32 bit EL3 to 64 bit 
EL3, but I think I ran into some AI hallucination there.
--nextPart2338004.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAml8yAEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoimbQP/2/ZC8c09EYTFbL1/YBT
KrYvJ31zSi1DULgwWY0gSXfo0S39FX5e5xz/hvxUs1GIbKC0VQky5zcbV2KazCzY
mzk0U0aMCs8QF3pP9KFogroAwUuUvwbzdjMGhDE/HK2KQMWry208EZ+nRu/W+sxq
R6K/2Hb4lmFp8Z3FFW/bVxLPtzX5wo1SdJd+ajwa6O2w2RVJEBFevggLt68BSFd/
xcop1GkrmQXAjDs0eqpEtI4At/B4UB1ptpY2ldl6pObEvtSrjs4KS1+kkljd4bSk
YI/EFXxfDWWGnGs4aebY3t/XwCQ9UtnZseDMub3UQhXo+TZKUqSyW5Wd8S3xxFE2
o2oxazO5sfipQ8DHnDZyJrFqK7UybuBfF+GcXswFRPDhcKFv/3eqa0pwR1s9oKeX
BbG/kcSUI2wLasXyXd7hd/96q2DhLdrbjWx+9qArGirjIaVDqp1xsESI+6iuzQs7
6fLBoeytl5rl0oZNTaPhnKI6zLLe/h6Vz7p7gRAfq+q3XNbaJZ7Io2WbN6Qhk7zy
KXCcW4yKK1X+Ov4y6Ttg3gIU/Kc5PPZxRT+SyjFgRnznE974VQOxWc4AGsUS7kmk
Is9svnetixmYsV6IVW2q1w7G9LYwcTaS7bG7I94pY1oLqszw4ybYOXddEIfIYHna
8HYH6emOZ7yx3T/3Z6VhGXEJ
=cBkk
-----END PGP SIGNATURE-----

--nextPart2338004.iZASKD2KPV--




