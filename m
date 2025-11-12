Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B033CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wFrt/LADXbjn6c8+TuF1xEj034sEsGmUDeod+7NYBo=; b=Y1eof2FqKPRXWHNtwIlrWo8tvt
	OdjtRKvGI3FKY1zDB9bPtfDglahCXXKHJ3A90l4B4xkFAT5N0Zq4lu/JPJHCeiIs4TqIfFFn0iO68
	i3Aj1IcERIGkrtdwfh+Ls9+ByO37UOoPlNUjXAqK2SDDhRjVztlG3+1uOMU8owhpSn57lpkMBLPAq
	lNDPJiDR/YVeoWkQxfZgr+UaaDhdnNn2TCbaEvhZZ7wHHOeZAG+jFfTWICvNzFgumDWe+Mk8FgVTJ
	c5A5VWVnnG9qK5z3Hm3yJsalK1blDg5je4nrwSMH6If9f9nmChUJPEaXVQkE8WV79Y1iLBiuG339P
	gz4/TuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9vr-00000008log-0GvG;
	Wed, 12 Nov 2025 12:26:39 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9vo-00000008loB-3URB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:26:38 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-3e8317b1262so572296fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 04:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762950392; x=1763555192; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wFrt/LADXbjn6c8+TuF1xEj034sEsGmUDeod+7NYBo=;
        b=FzQHUIwzB5ujl6JD8nYwYMuVhDJZRurG3bCUE1DcCtVCDGCQ2UNO+swnTiyBR1gBXb
         vwY5sxPiwchfLH+baaAxucFG6fwqb6PJ+DJ+9SjLzgtCLeJejRYLhhka5KL4mGgyOgFA
         z8ayCRIRLRjOo9baBHtWeY7Hj9opNRgW/xpDKu55B8sUhsXofJARaVe/am/g3bvCDVGu
         E7fImmHj8dLchbGCONA+Yc8qn4/D52STU/zU/SvBObnP1o16S/qffAnRVy1ssilpSjwO
         EmM7/hUtvr4ba4XExJ/gsAGuHFr6mx6OvEz0c+o/0Mf3S9b5Mi6Rlo24JcYFljBMv/5f
         XJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950392; x=1763555192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wFrt/LADXbjn6c8+TuF1xEj034sEsGmUDeod+7NYBo=;
        b=YszhCt9Kb781YA3uV3hV0EyMefnwe+Psa1+XHz0DGyAd+Hm9lT2UOvra3R42B3Pury
         UAvWdB41ndc3id6kpY341DJqDD7h7lMEYoGA+I0qS/5esrZQclgydoNgmrtkOekhHPKn
         gKHhgAmGMDGdFobmYjPtJz+LFGEvUkIml1+gq57N0ofrAKUcSmOl62LM4Cuy6ilHC9Wt
         IpVNUucY56mFGcR50CuVZsycp9XUB4MapTedNAVENxxQ8785bAZTOqJtG5XM5Fm11iV3
         AEhXTEMgeryr6BiXNQUcbS+QtoP6t0VPoMJOu0LpDkNVUESDk46CufGim8az8/yRqgcC
         yHkg==
X-Forwarded-Encrypted: i=1; AJvYcCU/E1DSAXUAc9cFnGt8/O4bHM1TkqeB0M83CZVbgbQp0LsxtoKI1fiuqQRSteDblKzDFZsCFs1l/XWmuTtTCtgi@lists.infradead.org
X-Gm-Message-State: AOJu0YxFHGMYsxM2dCxmiLgFNCo/0VTHjaCFqfPRZJNBVwDF2qU6Q67Z
	K7dcHkIcbl3H2OYjNSjBuUSraQctxNLRqZzGJogfOJp3ck3BlOsoBnTIF4dtVJOUZeo+Rfy9kCS
	dSZqmVUEHyVlROl0lQFMSZfu9T5V2kEWCf8LLWz501g==
X-Gm-Gg: ASbGncvrIvwQmJ8ElM4FnqifxxIQRbkZzrKBrFporEDDKeG2ClLaK5a9UmMrYsqBdzA
	ivFkXpOYtzS+oF9oW5IQMJZbOBynUbiS8pRk+Zkzdorumz+5y2HvuSB1sB2/kDujOjyA8b/vKGq
	kaJUjN75JpH5/vrFujnZyPRyzr5bEYToCTmOem+SU4z6RSvyAHf44nONzh+LhrF/f+noCv0O9Bv
	9ZMyJhEHwsqNcG+mkIi6vxvXUDmNF+O35YjZc31TE3k2umdDN2zIxTqXlze3A==
X-Google-Smtp-Source: AGHT+IE1tLumK4n7DEwiq4S5JSBYPEzwm+BAj2LMCZxL3vQMOt1J1sE0UaE8YVtiqdzAwD2oN7VxHWusv1seYdRsy+g=
X-Received: by 2002:a05:6871:2e8e:b0:3d4:3658:ede0 with SMTP id
 586e51a60fabf-3e83419b8bfmr1247405fac.40.1762950392152; Wed, 12 Nov 2025
 04:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid> <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org>
In-Reply-To: <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 12:26:21 +0000
X-Gm-Features: AWmQ_blqp2Ui-ZoVaTdeg2kHQP2n-uxUtRhftLhBrfgQJGuwpcrlRSIvpnI39mE
Message-ID: <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_042636_885273_4B052C0B 
X-CRM114-Status: GOOD (  23.22  )
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

Hi Krzysztof & Doug,

On Wed, 12 Nov 2025 at 08:10, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/11/2025 20:22, Douglas Anderson wrote:
> > The first four Google Tensor SoCs were offshoots of Samsung Exynos
> > SoCs and their device trees were organized under the "exynos/google"
> > directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
> > Google Tensor SoCs are now of Google's own design. Add a location in
> > the tree to store these device tree files.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  MAINTAINERS                         | 1 +
> >  arch/arm64/Kconfig.platforms        | 6 ++++++
> >  arch/arm64/boot/dts/Makefile        | 1 +
> >  arch/arm64/boot/dts/google/Makefile | 1 +
> >  4 files changed, 9 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/google/Makefile
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ddecf1ef3bed..f73a247ec61c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10606,6 +10606,7 @@ C:    irc://irc.oftc.net/pixel6-kernel-dev
> >  F:   Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >  F:   Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
> >  F:   arch/arm64/boot/dts/exynos/google/
> > +F:   arch/arm64/boot/dts/google/
> >  F:   drivers/clk/samsung/clk-gs101.c
> >  F:   drivers/phy/samsung/phy-gs101-ufs.c
> >  F:   include/dt-bindings/clock/google,gs101.h
>
>
> I am fine with this but also please consider having separate maintainers
> entry, because, as you said, this is a completely different SoC.
>
> In any case, up to you folks.

Doug did reach out to me prior to posting. We are OK having it here
(happy to help with Laguna). Most of the exynos specific SoC drivers
are under ARM/SAMSUNG entry anyway. There will be some Laguna SoC
drivers for pinctrl, clocks etc, but many of the IPs are designware so
likely to have existing entries (uart, i2c, spi, i3c, usb etc).

>
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index 13173795c43d..044af9a3b45f 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -138,6 +138,12 @@ config ARCH_EXYNOS
> >       help
> >         This enables support for ARMv8 based Samsung Exynos SoC family.
> >
> > +config ARCH_GOOGLE
> > +     bool "Google-Designed SoC family"
> > +     help
> > +       This enables support for Google Tensor chips starting at the
> > +       Google Tensor G5.

It might be worth adding (Laguna) here

With that addressed:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

