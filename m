Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59443E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHK1HVNEZ43w2Z1xUykye6r5z7hYi8iWdxWZtLZeFMk=; b=Sdl7qX8y7JoLyYCvXt90+OHrtv
	CIBjl5DR5G42UCxmDvym5+0/WUSX82uZrojOSdutgSKqMkSCJdsF+vCy9TejJ8xDt7WbasQ0Dsz/v
	qcH0mB7SaNt7X0fVbT+Jilh+i4VNFsDNeYlkFyxflocHGWmdYh9pgH/nX4GYrnQl3tF3fSmoUr+nJ
	wb6WlKjIdhJlHjmHelGGub+GXTBwPCMu/U0csa6uwmFDpZfqJKwhV72eLcp7F5d67SGpBNikXU7Ts
	kBt+tRXFGCwSvmD+QoskmzYYBakVUcNPpsaiVIAp45ij9LLWfKt/kPkJvoXwmGyfdURMvd/hNgaMJ
	p1dUvdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpvb-0000000CkDI-3nZ2;
	Wed, 04 Dec 2024 14:00:31 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpuD-0000000CjuS-2HUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 13:59:06 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53de92be287so10352248e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320743; x=1733925543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHK1HVNEZ43w2Z1xUykye6r5z7hYi8iWdxWZtLZeFMk=;
        b=amljf8rs6C6ol6pDG5/DXfH36rblJCg6u6CGym7HhcB1HBM1RrEP+aNfFPckNC4tYR
         Za8eL6RpLAPyCMi6HqXSNWQW5WB6pc/5x6HSH1s+feeubpCqdZQELsTYzjmtJwogH5eM
         eB8DWO0dT+AVCS1wE1DRquTpU+vXjslf9FkQFFYvVoW33hQlKDnTyuMbRdX89WZ1n4Ml
         WgFVblUugrKJRZspBQbcuyDH9ExzAWZMguFoYLOSRwlCmiiEs6rMsX7iwGAIxCjbnwcJ
         yBqqEjoIr3Xhf7U7aNJEy+trzaBch76LL9tKfEMRbGwXZCYuNUAFOsLO2CInTisc2suC
         2sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320743; x=1733925543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHK1HVNEZ43w2Z1xUykye6r5z7hYi8iWdxWZtLZeFMk=;
        b=TGy36DqhjyIojWZ3eYNB0/2b7ClcfdRwgA0ZwPkWNUP7XLgddS/GGyYiTopYjNGphh
         X16Oa3CzOqdH4IVmeFSykHVRMsAiCNDzamMuE3XbIeqZPBJsca1pIa1P5eqKpYjs7Biq
         L8Ih9RhNpvKoGpzL4TyAa4iHCAphMffw+uCJRWW+OWrqRi8piiAZiTyYPJltZTrAjCC/
         hQMWgJGrHHwclk67IIl4VDo2/m4feMQZhXq3p9BSqkliAU1rFGs0No49GR//RZ0D4/pK
         Dxna1IzrafUiRvd/4KMxvCqHjcPajPAfM+4jI9AzgVgrAAEF8kDKECD4hVMiuM6IA2of
         KlLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs83tVjWLjoV1ZknQR2dt3vqQJyw4Ak1a6P0GKvAm9PNV/eY/1rTi78lwlDxJKOpKib8h4etYpYVaPPaSk27Ro@lists.infradead.org
X-Gm-Message-State: AOJu0YyTLO1uM0Cp5YjXpOYOLUGipirG8FfhrLA/AG586/uL25ZJjcG3
	bt2TSZVyjy1e4XiigxsDWT8brI4XAK3O6BStUujNkFs9AzpTGX7BzVD+xv+BMkHoraZDw1dNFnu
	xhWKn7KdA4ZkEQ1eR3P2cl25d0CBP4SQBu1DHhw==
X-Gm-Gg: ASbGncstWFmJgRa6Xqw3eOqtaqS7IhCjpwEHf8yw/2G+YSAsb6t3QUpJ4fx4zjY6zyk
	5idmiD7VUIDWA9B0LBsPNWjAAjHoR1A==
X-Google-Smtp-Source: AGHT+IFUO9mBPhpg6S0Kvk3PDrX6OFpFY+tvVAd/2zYNYYChe+XyIM673D7LgWSMhxfZcFzoPfmo0nt91APgbJwU7p0=
X-Received: by 2002:a05:6512:39cb:b0:53d:a3a7:fe84 with SMTP id
 2adb3069b0e04-53e129ef587mr6063237e87.8.1733320742975; Wed, 04 Dec 2024
 05:59:02 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-3-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-3-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 14:58:51 +0100
Message-ID: <CACRpkdY243J4C3A9_13eTN84T2SeOjyoh0bWk6U1mqffUd6urw@mail.gmail.com>
Subject: Re: [PATCH 02/15] ARM: limit OABI support to StrongARM CPUs
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
X-CRM114-CacheID: sfid-20241204_055905_581006_ABAAD9A5 
X-CRM114-Status: GOOD (  22.23  )
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
> As discussed on the mailing lists, there is no way to build OABI userspac=
e
> binaries any more since gcc-4.8, and now support is also getting dropped =
in
> binutils, which will make it impossible to build pure OABI kernels at som=
e
> point in the future.
>
> I found no evidence of anyone still sing OABI userspace on embedded syste=
ms
> that keep getting kernel updates, but there are a few desktop-class machi=
nes
> that date back to the 1990s using Intel StrongARM processors that were
> supported by old versions of Debian, Red Hat or the official Corel
> Netwinder distribution.
>
> Add a much stricter Kconfig dependency for both native OABI and OABI_COMP=
AT
> enabled kernels, only allowing either of them to be selected when buildin=
g
> a kernel that targets a StrongARM based machine.
>
> Link: https://lore.kernel.org/lkml/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@a=
pp.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For
>  arch/arm/configs/versatile_defconfig   |  1 -

Acked-by: Linus Walleij <linus.walleij@linaro.org>


> diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/foo=
tbridge_defconfig
(...)
>  CONFIG_ARCH_NETWINDER=3Dy
> +# CONFIG_AEABI is not set
>  CONFIG_FPE_NWFPE=3Dy
>  CONFIG_FPE_NWFPE_XP=3Dy
> -# CONFIG_AEABI is not set

Hm why do we need a separate netwinder_defconfig if this defconfig already
supports it?

I am occasionally booting the NetWinder and then I use this defconfig,
the netwinder_defconfig wasn't even working for me.

Do you want to propose a separate patch to delete netwinder_defconfig,
otherwise I can send one. I think everyone (which is like ... 3 people) are
using footbridge_defconfig.

Yours,
Linus Walleij

