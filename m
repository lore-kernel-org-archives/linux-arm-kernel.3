Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E770FC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=; b=L+Nbkxzseb7vMzvSyG9g3LxDMp
	dKazYHqH58xzJqCFbjNF48m1+cjjmKPxfxBnVI/LaygBkGbJuwzsT4XRgDQ5CiC6bLqro/Bvs/fg0
	iX5jTBoAweMQ8BBzqL/DVK4ZpcayqNHIJYRqB8FthKT7eE/rUoQ2pENASzVWPWs8anr+QJWvf24mb
	rfGIVCAu0OK3EQVt/F1VSKi+S4CYGyCpuA4C+28y/KUPPP30VY21V+nuHcwOG9mM4xPQJqgXpi2uO
	vR57JGCozK4au8i4gQ4LkCQ/DVtJHnlktDSG+J8I7E+C3+FUMJj1Ne+eOxyBA1hQoeYew61lgmZIY
	TVqwfBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eWr-0000000ERSy-1z6I;
	Thu, 10 Sep 2026 13:09:25 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eWm-0000000ERQt-1B8E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:09:23 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso10818675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789045758; cv=none;
        d=google.com; s=arc-20260327;
        b=K0lfCRe/8CMkdMkKUMDAwrLWZt3MuwEnBLzadsKLCVbWJRKmfGxULY679SqNTK2+ro
         rIuOfiL6MgEqYO0BNdm9BWRIO/wnLb6McS2mtSiD0KePfFEMWe4aB2V2vcYxnAaS7qwR
         0LiPn0JiC5WQSaPXSAAhKN8/RaBKltngbNuURJi1Eb3TEhPaYil2lDItjpYRTGXNeO6K
         WHgaUtYip9qBa5OWUHKqZyfequQeq+sRlbpDvzH5Z52MXsW+H+b4C+amB5fYb2gxgvgl
         8iYRAM6DYwiZ/MJG4lDvINNf0awUsR30IFmjUtihn1b3ii3wlRjEg6pE+YMgkL5p+FJx
         ak8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        fh=bfyIH+PrYg7oQF/ZY73lPrJo7sdBZE73LIB0Hz75+Rs=;
        b=q6WuAM9GLSmrFTPtlxyvalNDI5uuCnWhPQD1EDHQJvhCI47NmjD+2GpfGgtRNZN4y3
         EXIzfPzyyo8CRn0/jvM/ZJIX9ejUxUYKGt4BwipXAX7o9qtyz4WWttVgfFuvebKckJ92
         27jxX9R8X6aNY2JnVbW9m2WwTMPLOAKZS+D8TrCCbkC7ykfFCAhVLfAs+dUllcjgk/aI
         Pwl1shg00V+Da5t4GXeSnmWw5pPswVMtKDwjvVXQpaTH470vBmuuK4CziIxtZjaydy3p
         hiviAVE2AcgpEg5rSqBNH7TEUNvvaoQKDT91BQrCRGM7ElwaxQH8U73+sR/N+34rJqTO
         wcJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045758; x=1789650558; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=MVxCkhJsDKpGps7djjYCwRHq+EgEbHaJxhat57ra+ayxhZwjQUjs4HWdjNKfWVAAMP
         IxHPGiMoImcUVPwb4/5aoDpal4u4veFWLLfklMVgiFzdJMVolnf5qwpnxoeKcC6LEocV
         LagY9jkcl+9ryDpSQ883HastHX/F+Xq3qX6ln+7ExYjODy3sg8nF+K9dIQJsoHNgSqGI
         c9BSv+UxTlTTmGwiEVAHjiNAkspFKZgTwH2lxCvB5Av5MV5lQjqepe87G473FmRdY2jl
         k3sAHWg9HzglJ7MBUWordSWFpk/xXATPz2lz8k38INhHrR0hMc0QU02Dphx4+j7ZY00f
         iTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045758; x=1789650558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=pXPdC/ZtHTbNYcmN33BQ7b+zjN2tG6ocdG755Q6s7JYJKo/1ZwQZ/bFjp3ak9XteL/
         GzzJCLaqrzKQKwBGIkNgXlBAKzi4dqkM03w6bEQDW7R+oDsNdbeq+VergQV0h3EcuzZ+
         j8S9Hy4RGX1j7wGRkRs4jEJY5VEv/mjkrtcS2EE4Emq5vD5Vmp2TFQaoXpAN1c8+HZGS
         zyKyhLIy21AAVSxbnFZxRj9WPWNACcSAPFg3zd7VSDir1khikSpKp5LbRdeNFqCriQHY
         f68cipcBO01NDDCLe13iDwtI79jJfxKexqoDFVhextRZ0Ftqzkimbsd4QoII1vCqE9/U
         WJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBzszn0wNhdujlknh064/zd0OpxYBrj1XPgXvEsJKZBj73EQljXBDvuOiRSTm1b+7K4svA4sOY4SOLiCnZqHjJHb@lists.infradead.org
X-Gm-Message-State: AFuF++lAxXCbb9QfLjBA8UwAgwz6eHFP3xc3tqlIX+RIlpR0GMYnVEdO
	9wnmze0A+21PbZcan/XwWx6mqQUeyOTybWCk2yDugONgcw8+ql8HzZCY0c7LLdZmOKcsdTdmR/N
	LabB/JydBBcG8I0G4AnAA/0AnNyWGNA8=
X-Gm-Gg: AYBFou0OIfgQl3AXL+Bt7D9NHu+Q2JSxOfutz8WPPJStOGmTdvuv96lWmv+YDWRc3Ds
	nkRG+pP+WGHYHt6ci0+qD/TMqaOLjmN1GksOfNAgjDM8sfc5wKEqmGjlp2Z2bBMRWoFKKVPy1mV
	80ow51tanYCWyNcZpPDkU2RXLsHFpL5dXg/QZ9blwUCAh+5eamQ3WrdbbM2slDexzmWtsM0k+ld
	Molclpe4MLd83E+/Roo6cBgpAF8dTGXzvhpz/fCzk1h43YwfNJ6HvriXZDrwKJWFlGCCX8wDzUy
	j8rBWJMhuO+NH+KUC7TGateX56z8XwLRw4ziSwRLKZWTHz5kPHUBatXARP4++C2kAkcYPUeHUax
	rk8GINiHnbOFs
X-Received: by 2002:a05:600c:6c07:b0:49d:1cc7:5ec3 with SMTP id
 5b1f17b1804b1-49d259138abmr111164355e9.9.1789045757952; Thu, 10 Sep 2026
 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
 <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Thu, 10 Sep 2026 09:08:41 -0400
X-Gm-Features: AcwNN1UEFdvIck3fXBUKab0LkOKuiFOwC71vVQo2jwIoxCjaBOCf3NRiYyhyIhY
Message-ID: <CAJFTR8RYajZ+Az9JvemMCApvUEGG3pDLq1KVkKyAsA6Luw-0BA@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_060920_343006_3C37EA87 
X-CRM114-Status: GOOD (  25.09  )
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

On Wed, Sep 9, 2026 at 4:21=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The i.MX platform has grown support for three separate product
> > lines using Cortex-M based microcontrollers over the years:
> >
> >  - i.MX RT1050, a high-end microcontroller
> >  - Vybrid vf610 suppors running Linux on either the Cortex-A5
> >    CPU or the Cortex-M4 MCU
> >  - i.MX7D similarly can run Linux on the Cortex-A7 or the
> >    Cortex-M4
> >
> > There are no known upstream users of any of those three,
There is both a u-boot and buildroot config for i.MX RT1050,
I also do basic regression testing on this platform. I understand the
need to depreciate no-MMU, but it's sad to see them go.

If it helps at all to remove i.MX RT1050 there are only 11 commits
adding it that are from Giulio Benetti and I.
For i.MX RT1170 only 3 commits by me which only got partially
added. See
Commit: fff65226b229 ("pinctrl: freescale: Add i.MXRT1170 pinctrl
driver support")

I also occasionally test the stm32f429-disco as I have one.

> > so
> > drop support and simplify the platform to assume that an MMU
> > is present.
> >
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
> >  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
> >  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
> >  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
> >  arch/arm/configs/imxrt_defconfig              |   35 -
> >  arch/arm/configs/vf610m4_defconfig            |   39 -
> >  arch/arm/mach-imx/Kconfig                     |   27 +-
> >  arch/arm/mach-imx/Makefile                    |    3 -
> >  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
> >  arch/arm/mach-imx/mach-imxrt.c                |   19 -
>
> The imxrt1050-evk dts is used in U-Boot.
>
> Adding Jesse and Giulio, who use this platform in U-Boot.

Thanks for the CC,
Jesse Taube

