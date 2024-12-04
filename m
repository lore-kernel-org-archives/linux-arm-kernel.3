Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949B0E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqP87WCiN6ncxgmgpniBE1T1mI3RT4GMjwb4A1C8J6c=; b=ktyd1UeQcsMGfVHTcmjP+Jx62I
	0iOrWBqPWRBgrxQDpdnHSf41DnGwJwRN+Fm/a981O6xErquwR8N+ijAPZ2gWfTdsZvPkQ8pLTuWJw
	Q0Psfhg6v7VxZI6Cdk6hVfmB7Fgls8zSfLdUEnEJW+Qj4vvYPnCw3+xWgYCUfEShzrrjCV9DGnlJ7
	CP+VUXKJe+4GJankkeCjd+oQY/M/Ju2J0b31XIyl9MC1aZsUBjAWebIGYdmTq61tI6SEGW1x/hAOr
	KieT9QXfemidU1eyZ5rXxesD7Zsz3q3Y4mfP9HShxyNCeg6YX5Smscwv/owt1BO6EopDBYmgnb5gg
	HJDugzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIr4j-0000000Cxae-1JcO;
	Wed, 04 Dec 2024 15:14:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpxI-0000000CkYB-3I3Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:02:17 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53de5ec22adso8528331e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320935; x=1733925735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqP87WCiN6ncxgmgpniBE1T1mI3RT4GMjwb4A1C8J6c=;
        b=K5TN1AyA9jvKYWszDecCf4OpQmYFBl4ZMCMMfo3ZF5eXlBR/FSWHE5YVtohbNI3/Jr
         gp4SJN6NbRQURrnlOB6Z1glmhaTc0osraB9Ec1TGGX9cr4N88yD87nnOg9a16nLfNxPK
         ld6K9bDNX/d1W+VC6bZcXNWJyLsHNxIhjVykDvaAs4eOHImuz+DoI23WqQ5PcOOcU+RY
         QK1UJp43Jlp4xoB1ECO7wFCH3RBjhYXhGEfSVa0Pn4slhF19ljK/z8zCzVA9EoYIhLr1
         eyw+swCTvuGMX1bEfT2jmHGChPAWsoL8eUAjH3/mG5S6Ualr8OizDf/UaYAyLDxiuFG3
         0wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320935; x=1733925735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqP87WCiN6ncxgmgpniBE1T1mI3RT4GMjwb4A1C8J6c=;
        b=s+ILFM4BH2NltN1gWP8CsSDFtGO1Rk1Q7wb2PgF+Dq/ejrJzgo8xv9jjsd7+btv51m
         kNmxETrivUErY6u867gSviiInoLxbpRuQOw/hkgOEQV+XDojBLYA5p0ktnzBmAPnA88A
         TPLQxLojyQfMeQ/NkFZEW0lIroMHIEY70LhKLZE2HlTK63BQTKU7hnopdj2kDwyG1lle
         2f0rIogpd/DO/7aanmGMYNC9gimMLHWqlBtsxeVzE00UfK4UDY5lxza0edfJCxrQPDFF
         hXIaq6AaYDwtuIjc6zhN3kvLwNTMLNfzLT0lHkzP2IUfG+hNOewzOHNN54U3hJecwWCB
         2qJA==
X-Forwarded-Encrypted: i=1; AJvYcCV2fbpdU3i36e0+JyyzqgtFqg8R/ubtQxq10k5JUiNNrpnJYY/3CNId8J7zVrit/gZ3I0foGDab3aA/Pp7gZNK0@lists.infradead.org
X-Gm-Message-State: AOJu0YyMT82OuFh/tTQC3CIJti0HmqT9RBRsy0lnuwZ5bsN2lOrhBJTY
	XYdx17NxjO4dAD2v29nD2McIqjD6tU+mcTLfmql2f43Oq/TQGAAhdm3FZMv17sVE7VXmwT2hJb6
	TuQalfalXdnpociSil7g2eP/wv0eb+ZMpRCJHIg==
X-Gm-Gg: ASbGncubwdMEley7P8qIowvXxs0EmfAGFxjpcU1ragyc8AHW5AFL8pbzwML6jj9/Uid
	waxCnsnifCwvg68ojT/hPQSQb+dAl6A==
X-Google-Smtp-Source: AGHT+IF42JEDDralS/q7GAyf8ShLhuPw9fjRPS3IF1nVPtKZCVFYhoqWECbNYFk03ea8B3Fz+6drL1O/4aVN2nZ4eJw=
X-Received: by 2002:a05:6512:1256:b0:53d:cb91:2f3e with SMTP id
 2adb3069b0e04-53e129f36c8mr4029043e87.22.1733320934341; Wed, 04 Dec 2024
 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-4-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-4-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:02:03 +0100
Message-ID: <CACRpkdYws_rfGPe--xj8d4Gu1pON=_T2sSAoTi3=sMz7wpSFHQ@mail.gmail.com>
Subject: Re: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_060216_820667_46A7350E 
X-CRM114-Status: GOOD (  24.81  )
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

On Wed, Dec 4, 2024 at 11:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Support for SMP on ARM1136r0 has been broken for a while, and nobody
> is working on fixing it. I had a plan to change ARMv6 support to no
> longer coexist in a common kernel with ARMv7 CPUs but instead ARMv5 and
> below. This would have addressed the problem, but after a recent mailing
> list discussion, we concluded that an easier approach is to just forbid
> ARM1136r0 CPU support on SMP-enabled kernels.
>
> This mainly affects users of the Nokia N800/N810 tablets using an
> OMAP2420 SoC, which is the only commercial product with an ARM1136r0
> that is still supported by the kernel.
>
> The other machines that are still in the same hardware catogory are:
>
>  - TI OMAP2420 H4 reference board
>  - TI OMAP2430 SDP software development platform
>  - Freescale/NXP i.MX31 Lite Development Kit
>  - Buglabs i.MX31 Bug 1.x prototype
>  - Arm Integrator/AP with CM1136JF-S core module
>
> To my knowledge, none of these have any actual users aside from
> reference boards being used more easily test the platforms.
>
> There are also a few ARM1136r1 machines, which implement the
> ARMv6K SMP support (barriers, atomics and TLS):
>
>  - Eukrea CPUIMX35 reference platform
>  - Freescale/NXP i.MX35 Product Development Kit
>  - ARM Integrator/CP/IM-LT3 with ARM1136J Core Tile

I can't test that, I doubt anyone can. I think this support can
be simply deleted unless there is some QEMU support or
so.

>  - ARM Realview/EB with ARM1136J Core Tile

I will check if I have this one, otherwise this can probably go
as well.

>  arch/arm/mach-versatile/Kconfig | 10 +++++-----

For Versatile:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

