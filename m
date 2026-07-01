Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14DBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 22:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYFlxrwBFYPoq90kn+JK7G1o1/XM41yRTcPx7DGMUZM=; b=3/cUOE78KtlVMfVs+ut3bcXKdR
	w0l7zgtIrGabqB2MQKQ+dJJUQmOirBWI9XzpFZGPfGA8dAKsD1qiG6RVUeGC4/0BIUd6CK9yii+ql
	HI1p3nOtxMFyJyjXOrrK8gQDngf8Ki7Bo9juyrj/vHkquzHsXsWfHAhnRk9v4Xtasr6o35XpOfu4S
	VQ95AFxQCjk36PplkW4q0Dll0Pie9BnbZhoVORFK3L8dB9WTD/zMKPiTzjYnv257ueLeA4CiIVS29
	U2QNMjabk1k5825cVevM9ZszYJ4BcGbGHhQjhzX9K4FK8Gz9PGQMfeXoB4fmFdViPxucpRcLO0AXg
	wPMPHb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3jV-000000037Zk-37Oi;
	Wed, 01 Jul 2026 22:48:41 +0000
Received: from mail-qv2-x01.google.com ([2607:f8b0:4864:33::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3jS-000000037ZG-1sSK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 22:48:39 +0000
Received: by mail-qv2-x01.google.com with SMTP id 6a1803df08f44-8ef118ead8eso6705326d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 15:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782946117; cv=none;
        d=google.com; s=arc-20260327;
        b=RwGuHxQMinVI1p8qA1PY5+IbfFUoVZzVAAUrgt34Xm/bgewSAoKtX8GWvjMo3/LeFT
         BHev5b2+eG23tV+a6TCsAI3lzFodOVtk1XuUgewQwXQokrmItfLtqe749XQSd1hv9n5u
         W6pborOLtlv7z2j1irXRHVptZCP2mmgK09ULkGjqa6sKzc6K2w0CmHBkvOYNSG0qXd9Q
         BN5Mn/XDSLYPChJ2Se+/jG7waUTEs9axA87rNLEcoTT/f1ifUS9ZToGsI6toVUvj4jr3
         eIJ+UJhmJelgb/+z/9qmajw7YgOPWh5duRowNIBnN07lkX99LN3sllXFpaNSYhAU4hHG
         R6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYFlxrwBFYPoq90kn+JK7G1o1/XM41yRTcPx7DGMUZM=;
        fh=1HEoYVEKA3/4GwbvrYTnPadyX3tWB4S4oJHb1j/Y6ig=;
        b=oC8f74BCEIskufuSCZLI+kMiNHLi2ahaVrU77wZrz2E6nB1zTXavds84Qq7GK2+N8O
         i0OeR9x+LTA9vqOWgb35mKdyZZUat/XoP2Lhp3A7xSfa11emxMZy5sAyx/aWybTdiY1a
         5gcCpeDd59JYlolb08PA1yuXugQVn+SAdfEdGePHKf/A3e7TzzuR4uhUw25k7F+hS89N
         EiOfTcZPSKzPXhbG33aSQ1wNr49SdViSBhoEIWlyRqLzbgIalxtP+9x78MZFkLqVZCua
         k80tuw5feMVRl+esTvKYWTnFj5Y51ksSalR+87Gf12pXutUBNso5m1T7TSlLeBcednhg
         +oyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946117; x=1783550917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYFlxrwBFYPoq90kn+JK7G1o1/XM41yRTcPx7DGMUZM=;
        b=jEwo30ctFxgSxvOEx6RkkOCo7ZjFiuP2rwlUeRWozjkl45Ia2ArFUgax3YBFVDMIWo
         ktXR0JOhzI95wPJnSjRqTi3tV+t63YcRB8vxiUTbQ6aex/VnBYKzs/nkXNLDr9Wse7m5
         JjmC2Cu0/mOd+X/Bj7iB6H5DQ6h7Gj4JSsn5VnAJbjm9TNP1VfAWqXJnccYCCK4E84Ag
         2akCHye2CP6VZKKd8JznIhONPUMEewGXVO3GVM1naWcmPOUInl8JOh4PYAevl1k312YP
         NTrTZUTUF9C0EF91iIOLUZ+21gjVNjIBOmbagseBkpOpVHd6unc8ttLKwc9b6R95wBqX
         xL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946117; x=1783550917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYFlxrwBFYPoq90kn+JK7G1o1/XM41yRTcPx7DGMUZM=;
        b=H2u6fsyMgDKtFiY+xZWSDnn+Ym6H2uU2fDZJASf7X5rntJrfCpmhs49sliy+llyzlo
         bZQ2YDkaDw5eIhQ8a1NGkJ+pIcU4V1TWEYalnQfd2WDGaQ/WM+m39jsPZIS8Rn43I2mu
         CmvO6NTgLEe6n/iBGKff/zX43CalyvelTZqYBvRVMoE/oMw9MaVGiTgYpZzWT2hYncTD
         0NR+GSl926irB3R1a/fd3wLt+qC4p7zYP1t53Z9mbcunw09f7sfQtM6ypLl3jDsx318t
         p5eg7xmaMxM6x5cFeeIZIlKIgp5V1hid6r8Gz/N7fkXWq1HHSSrPl2iREWEN9czrXCf4
         SqTg==
X-Gm-Message-State: AOJu0Yy6YHVeweuRBI3hTqjcK3MjqFBW4GySI3DdFVPDKeZk24IeOSHr
	sXeOuKlRUUaUMAaZchI4AGjQ1yd7d9zLbw2dtqC492cgMaMCvzWJE8ed5kVZopEMqFE5SywoP6S
	xcZO1DnSbAG0HF7GKxKqGdpcLrNxJZ2U=
X-Gm-Gg: AfdE7cl2pFEARtImkuWiM6SmJQiwkGxJ7Vs0D4kBssBmKxxKSbxvdnnicc7F6nst7kM
	L4WD2FGj1tIoRC8aa9ZRxBhX+rIkNMS9hxBW+wY1pniJUkBz23BSfjPadq0p5TwrQTsErmSV+Qw
	uktKxhdWPZ8ygvIpH3T7sUsFc7NS87+c8VL31nNTjX95zsbHKdSR9CD1dqwDshZhjvuTddglJ8c
	ngj9rKyssa1Ggy+x67M6mQrAB/d+3Y2zgNkGFEf6SU2vXgH956liiCND0S9cKUKRgLaMtSQKOtA
	eAJnV1LD1Eqx7lJ23m6qi4t7eUgULPjaySLtgb8WinMWNHZEqrUIs+lgRw==
X-Received: by 2002:a05:6214:3d0f:b0:8dd:d13a:8c84 with SMTP id
 6a1803df08f44-8f4214a1f72mr39935196d6.8.1782946117029; Wed, 01 Jul 2026
 15:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-12-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-12-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 15:48:26 -0700
X-Gm-Features: AVVi8Cepw8-jeERBXP5uzrp7v2GBj31ta-VoNMboVTSNdDufrAM_yNfN295JHb0
Message-ID: <CADkSEUgm4Bse0x0K355iuLVJJM-mgeZAxg4xywgH1nYxnU-d4A@mail.gmail.com>
Subject: Re: [PATCH v2 11/19] ARM: mark ARCH_DOVE as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_154838_551933_4F63F351 
X-CRM114-Status: GOOD (  24.02  )
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

On Wed, Jul 1, 2026 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The Marvell Armada 510 (Dove) platform is supported both as devicetree
> and atags/boardfile variants, with varying degrees of hardware support.
>
> Russell was the last known user of the board file version, and there
> are very few users overall. Unless Russell still needs this variant,
> let's remove after the next LTS kernel, leaving the CONFIG_MACH_DOVE
> variant with devicetree.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-dove/Kconfig | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-dove/Kconfig b/arch/arm/mach-dove/Kconfig
> index 996888ffcfe7..f547120e223e 100644
> --- a/arch/arm/mach-dove/Kconfig
> +++ b/arch/arm/mach-dove/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  menuconfig ARCH_DOVE
> -       bool "Marvell Dove" if ARCH_MULTI_V7
> +       bool "Marvell Dove (DEPRECATED)" if ARCH_MULTI_V7
>         depends on ATAGS
>         select CPU_PJ4
>         select GPIOLIB
> @@ -11,7 +11,11 @@ menuconfig ARCH_DOVE
>         select PM_GENERIC_DOMAINS if PM
>         select PCI_QUIRKS if PCI
>         help
> -         Support for the Marvell Dove SoC 88AP510
> +         Support for the Marvell Dove SoC 88AP510 using board files.
> +
> +         Support for this machine will be removed in early 2027, unless
> +         there is a strong reason to keep it. Users should migrate to
> +         the devicetree-enabled version (CONFIG_MACH_DOVE) instead.
>
>  if ARCH_DOVE
>
> --
> 2.39.5
>

Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

