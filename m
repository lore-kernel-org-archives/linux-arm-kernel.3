Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E1C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6jTWAIrLIpzgDpLBz42fd+VOfZnGCDvdcE7hWJmuGw=; b=WTbnVw0SM87NC1iFvlx4FEFjc5
	GtF1ROgkOZYCvUaWuNisoB2Lr0rFV/4p1GO+HLupY3rmVNvEv5CP7cTMek1r/0LZzj5OL0mSFlnit
	6E01uOeBnXwqmf1q/BjeqdDs+t+S58J5bgR24V0cfaf91j4k8UUSPDYbgHpMboTO8XMILRHWGzzDH
	6ulywqABCMs0aZ1H4ZitWax2udfrlkiwHYao/EYl2+Oz97ozhqy1iQ6nM7xAJi922NjsMiCRW9yCg
	GyCt2ONqSuulng8qJJEYIgmXW9UKangt2l0Z6y7Ju7qGkm4NWcESpZLPPtJCOb3jdUJ5sp+AIt3lp
	9OWp9/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zky-00000009qdk-1VKl;
	Tue, 08 Sep 2026 17:37:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zkx-00000009qdU-0PwY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:37:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D64B8433B7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA561F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889034;
	bh=x6jTWAIrLIpzgDpLBz42fd+VOfZnGCDvdcE7hWJmuGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ca/HQ8DHSdLskAtbHdPp1qBfNvNKvwm9EcGFd2RKPS1P5sVk9XN1CvEw6ORs6x4ad
	 1K0X20YKxXTayWsoL1I1bQO6GCoM4b37t6AlTi5VjLGOLo+c+0OY6BXgUhLjrjJc8l
	 AF2yGBw64cEbT9crbm9TNHrYMTlgAMKSfesds/KqmpEEzx5DdgmCp3rglRT30iOBvx
	 spkd8YCMi1QgLSvab+b7QrTChQxHasU1XRVG6JTvxIAjHHk//scR936djuAPD1kpcq
	 8RtAVojOOnNKiFaBvVaq5mufN+HRmBnSbblzYkJO7znhI3PEuSUnsnh6luGsNF+dIO
	 H0MoHq8JZnUtg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so202606e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:37:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEQY/298XDT3jF5S6rpNSmkXQ4nY9NjRXxs5nbGn+fYLA2MRP2uY5ai8HG1QqtHTnf6mQmV/TChU2Hs1cXzYWm@lists.infradead.org
X-Gm-Message-State: AFuF++k6ghfXzD7G85GBxEb4uO0mZ9oOtc++cn8rEGR6FKxUu59tImwx
	z1alivnaMu3WVb514F8DB42aXIx7QxR93Omkv1BqYozi94/ijXKtPxf6cUOicfDft/mBWGYR2My
	92vpE8DUagHuvk87WGsPpV1mwBTaD65w=
X-Received: by 2002:a05:6512:3b90:b0:5b6:425:4bef with SMTP id
 2adb3069b0e04-5b763cfb263mr320034e87.32.1788889033394; Tue, 08 Sep 2026
 10:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-11-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-11-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:36:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLnd5=uM56OyJ=J3Bt+o9pv2GmiPUeW8hn8FZXJe54c2=g@mail.gmail.com>
X-Gm-Features: AcwNN1W-3fWex_aQtlnPS_2IdFq7NxnkbpKmVsEJ4Y3Csr6iBcy20K2ukvxG9ug
Message-ID: <CAD++jLnd5=uM56OyJ=J3Bt+o9pv2GmiPUeW8hn8FZXJe54c2=g@mail.gmail.com>
Subject: Re: [PATCH 10/13] ARM: stm32: remove stm32f4/f7/h7 MCU support
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
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Christophe Parant <c.parant@phytec.fr>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
> The stm32 platform started out as a Cortex-M based microcontoller
> platform in 2007, with a few of the older products gaining Linux kernel
> support in 2016. These days, the only relevant chips for Linux are the
> stm32mp1 (Cortex-A7) and stm32mp2 (Cortex-A35) product lines, with the
> microcontrollers running smaller RTOSs on new products.
>
> The microcontrollers were marked as deprecated in the linux-7.3LTS
> release, which will remain supported for a few more years and
> is expected to be sufficient for any of the remaining original users.
>
> Remove the MCU support now, leaving only the stm32mp SoCs in the platform=
.
>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Christophe Parant <c.parant@phytec.fr>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

