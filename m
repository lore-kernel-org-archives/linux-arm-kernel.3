Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160CAC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=; b=aAhY6z82PVeoUQZauaIxJEakKA
	dfMmu/lyp1vWuTbRgCOni3YMr1gtiVwirDEmLKG7M0Peeys2+Pxnb3xFgiKF36fDRgo7F1n3lIshc
	g90SnvGOljXRHTcO61QdURrPkbX5SBr0cGG7p8RI9yxJWE88SI9StbmDOeFJCCEii1SBz1cX9+YH+
	z4C5inlhA1WPfl6Svo1wLo2+ZXAgfqTLJSYOFRsxvM33wfIbGzC6jxi2OMmYBA79Fa3vJlIyadoHs
	C0CrswwYs7srjXs3QRuzdtkXYIE9HyOxHiXNTyt96bBkKUeLNyrVVXKXRxGCx3cRN/Pb4hRIzVyPQ
	dFHezkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ok8-0000000CnWD-3OvR;
	Wed, 09 Sep 2026 20:18:04 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ok5-0000000CnVr-1qcE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:18:04 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso437818e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985078; cv=none;
        d=google.com; s=arc-20260327;
        b=cavXnnAcXSo4x8vx9+p1tUwcGnhag2WdsJ9eLrbMbQnjHbQSJkpo2TMkLeTr7TsE+a
         f56ueiAXgv8TgCW6yZpLhVGOuk1WQSzDB3/JwKeIzQy2KxUChtKjB+1t6z4gsnWpSOjD
         Iff7jOUTRXCv6anK3+EGLK6Z5wxkcFC3BXl5ALQ2asH/fdtuZ0CGW+OEoJCseDlEXoVd
         axJ5iSjliA4BdZelbepmlDgP7X8ue6hZMlw9NRfzDl39/lsPn3fsBaOaDmjXw+lus3Sl
         cjnFf9Ea7szGz+rUnYs7USUbH+nxSJf6d+yX28vSxvdAG0NPJqmd3lNGDzzQShOntoD8
         vHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        fh=7d3gjO5zsrTys3ZozEN1m0EAKK3klKP2ao9D8fS7tcc=;
        b=MO1mlrrgnQPtXGHDNZoER2iIH7cbeQ3YEs2xCB50rbd2btivz2ZW8LAyDfmPs3bxu2
         rzdNUvkF+GTUrxd7kUGtU3XfuK9NJxyDFhiyg0MkCDAsnyQZSwWSPBUca6PyK0Weznf3
         55noR8W7tnxswfZVzA9g/s3MIj1O3/gErj7SEtJ0UByGWN7OFCUgbbWRjfruf3aD0xwo
         +M3Fx48IFDKBcw0SzbEw+w69humcc3gALUbctPuAVdEKvk+b5mSxGI00Ir3W3Pej+Hpk
         OZnbWL8RpqaJDQ1+97fusavECe69GpLi9ETwClpqkxXgod/fT6TaGYjaAOcAukMvDyh2
         bPtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985078; x=1789589878; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=rm15VFa2Onm6PKh+0QFqzN1RftxcXdzNUU27YNuEJVkktkuq13m0jBtsO9UIfsxm3w
         T8t5zMIXBdLKez3tAG439TvJWq7PFpHwmEi35mklIxjw6J0TwrjdWSSeZOKAcVnd4tQA
         gLDecaYZouZ8bEy9BL3QawtYIc7ioaAPRflGxKhwTr6rfD7gFzL82+2zVA7amNABjlP3
         or6wLFHm8DXK03mdF9Xr1BtqzNfF9WHO58kHfayNSpGA5fNYYtZdSjvCaLOp6cF2Ide9
         OR4/zx/6+bONvJUEm5W9dHEIaMIn6Hda21i2nDZMDkzrOfvEPZU88PoGnvO8hHEXtuGk
         Ll0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985078; x=1789589878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=jc/5gu6139Aivsz29s5EonmtK3n4D37oC5g/avCo/PwWvGbtkl0PLnHR44Lf4xV9B2
         TY8XYtLcAL5nsSnK9U0478wRVthfZ/3rsswG3KDlC/aGXR1KvXx8khF2tRfksvHJ3no2
         drhXvE/S4jXU9oY9jwZTfIFpB2Xvcuq7OeN+XeZYWUZj4ObSmo442YwFZtBB1WU2b3na
         OmLm76lGwJJtG2bZDcrrliaNzL59h+FS2Tumr/2ZNKHvtfxQBvQyPwucoqjHhg40pURN
         LRuOrPgpen6GbxAwOfE75XwAylA+QlEYViXFUldVTxEWC/LKi7auk5tVyqzQ1idd678t
         JuQw==
X-Forwarded-Encrypted: i=1; AKwUvBxR1q8JgC52JqyAzw5pmi6IgMrNqy6KJuG2xePoJwIHV5zvMCEpoPoAzqbiOHnrA1z5w6n3ehoYccTpviwjB4p1@lists.infradead.org
X-Gm-Message-State: AFuF++lBGGmC+xWiDZEIU52P6MX2/k9rJb0E3q7o3HEZdaEh482ue49s
	Tw8gsTC7reK5Wqyf1W3tj/QGnKFpfo4EukLxbOgf0Xnu0ePHiWVSDocv/fVGrIiSdfUn7wCuYcT
	/vHHZf7g4IDRArkLxrH19M0p+3eCjZko=
X-Gm-Gg: AYBFou2/li3a+XoCbfP9F5tm4chIDUbWJ+ElDDq5APaplQFjXvZoBjd9415KBnS4rYU
	2Ow/W1gxpjaL/J2q6O0YvFd/Ej/k9HQxWwcncqgVV93/HMgP8QD9AzSHRITLOaW2TU2l5zpFLSH
	mUXow61Joyx8d4pc2Yr3NOO/+LQjArrIz0LlrKz3RNGET5iV08IMswwbUMgP7YvDEQ6/DL9DvPa
	35zUlDK2cLx+PCUW2KLdNMiSoLyXXTbQx3NvL0Q5N883jN/poCfItPZgkZ8R1CtF95MMXBglVIn
	Zp+t/JwoBGLwhrahEFZiVsMJLGAYGtYJGQoYVKLR03lhxHoegfFqklGfki49Z0q/i/bf0TFVkrd
	IddIe4K4Prp8SxwkOtA925ZCHpROetE4vH1nQ14xFdLpP
X-Received: by 2002:a05:6512:acd:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b61a7cfdb9mr6159278e87.44.1788985077633; Wed, 09 Sep 2026
 13:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:17:46 -0300
X-Gm-Features: AcwNN1WKZQyaGADU6lkE-GsXnisq5MVghkNUlNC3CqrQiDAXJmgIgXPSi_5sivU
Message-ID: <CAOMZO5B4q01XRGRfK_LoR1SWkvdP-_fbSHrE4BYq7gVf7k0Xwg@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_131801_512369_4F96B238 
X-CRM114-Status: GOOD (  16.88  )
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

On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The i.MX platform has grown support for three separate product
> lines using Cortex-M based microcontrollers over the years:
>
>  - i.MX RT1050, a high-end microcontroller
>  - Vybrid vf610 suppors running Linux on either the Cortex-A5
>    CPU or the Cortex-M4 MCU
>  - i.MX7D similarly can run Linux on the Cortex-A7 or the
>    Cortex-M4
>
> There are no known upstream users of any of those three, so
> drop support and simplify the platform to assume that an MMU
> is present.
>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
>  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
>  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------

