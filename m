Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A196C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeRwoMgiYVUi/Ah3tQJF0Pa9MvRlkNB1dv59WKnnW+4=; b=N2N1/+F1wduQASkyr6X6ycfu+s
	wZpJz0Dk6BPNPYnEfF6xF+VxDQOAzjPlyTEErAZUqVoLLtr0/fRl/T48Mx4MdmZhBaBDv5sKGTPaA
	eTivBOxmTo8s+QsgwZyXt7bAltdmaQRllTK8sUvNPE7CL0Sh6b4WErHpwURBVGSRIM7WoMmW/5Wsl
	d+rFIx3I+uxSp7YM/XU/ls0UV9BtaSukI/K6PLH2Nb1WyQKQJ+t+7VOy+7SUP/zZEyFzmMfmidrvo
	WNRUi3awo3Vbcd3EUeUWIRFuOGM1x5FeXswYgcTyUFXcMl5Y75Z2nyIV1M6bpeknY5AAjKXVR8Y4F
	tT+fUI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3znR-00000009rIm-0UeE;
	Tue, 08 Sep 2026 17:39:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3znP-00000009rIU-2y3E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:39:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3725C43D1D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B601F0155A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889187;
	bh=qeRwoMgiYVUi/Ah3tQJF0Pa9MvRlkNB1dv59WKnnW+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SC8mB5rPyRTvkIZvrBlaOR0NMk3ObczsexyyqjAcxnvVlw2KWPZwVcgOTJohPKr4v
	 lFwpA6TAjXfPrX5vVoLpEZEllzT5VjBEHLjG+/RNg4j/oF7Igi7JxJBvHPjfKTI3Mn
	 5jwmtTmPXIzLvCDliV4B8pZz05GCd5UT7sunng5r60WkldzA+7CD3masBg7dGPOkVF
	 TXpx52hb5VUss5MoyBD2mhEIiX3XbbyzesyYp9HYTX+K8OOyK76IUmfxC2bY7+WcIQ
	 UVCLz8Na0Ufzp6bkonl9YeSy0WvpUjzOXn5Tl1TOVdNiZ+OyDS6tKqz9xvuPqyPa3G
	 mozDMh9YQ8zfQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4ae3e201cso4263450e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:39:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXraKDFPmQLzbEFSIe5TrjH/SHM36E1o++qtM8kVm4atgYqeJcYTMQ1+TIsmf80jVqA4Zz3P9y7LoayLPZNUSf@lists.infradead.org
X-Gm-Message-State: AFuF++nHEpYx9Bh1iFtSnhG996r6UKsmsoAiwNqvCDYwu8WmoRgpKHnW
	T4EuHezCdlGEt101jwz77PzXrK0qwQyyeubKpYvot7Uw3ibpHRw36rDH6PT/gxabhVUZCLIsUBV
	pwH/DR4ddrf7wCo2D+N731FkSXlIi+LA=
X-Received: by 2002:a05:6512:6c8:b0:5b6:1870:268d with SMTP id
 2adb3069b0e04-5b6187043e1mr5134617e87.62.1788889185812; Tue, 08 Sep 2026
 10:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-13-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:39:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLkZqGPP5XO0FwORA=exTpMTHnw9pjEDnhDRbdGAXaE47g@mail.gmail.com>
X-Gm-Features: AcwNN1XFd_7XP6HTCgVzAbMTQ1UQaJXktIWC_-YLfvh2SZkqTOYcmI8a_fbRBVk
Message-ID: <CAD++jLkZqGPP5XO0FwORA=exTpMTHnw9pjEDnhDRbdGAXaE47g@mail.gmail.com>
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
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
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 8, 2026 at 5:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The Atmel at91 line, now known as Microchip SAM contains both
> SoCs using ARM926 and Cortex-A CPUs as well as a number of
> microcontrollers. Only a single one of those MCUs currently
> has Linux support, and has no known users.
>
> The samv7 platform was deprecated in Linux-7.3LTS, which will
> remain supported a while longer after it is gone from mainline.
>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

