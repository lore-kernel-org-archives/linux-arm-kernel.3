Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF36C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXzfiY6SzoJBncXcdLH+tsYFvMZl0xri22KcLVBkMFA=; b=NYJH0Kyrzme+EduRYfVlK6IPxV
	2kmMUQsRQb8gedo7uzjzcdsBZswn8Ry3RZMzNIlp5ToPIOMDBM3bv37F+SZgdn6A7g52M+qKXXB7h
	skSzaeR2bjyT4o2XFKOaF9E4wCj+D7vRekFKOZuSMBC9MVmYoFn9kmfer4gIr0bxsc1fkChg0+I/P
	oUy5D8ieCP1ZAE7Bu2fQgzbm+E6rzNvQYkcBnvwiIA5+kP7lCNZAbt/P+aAxJdtZRqGpD8gHhrbr1
	GFcLdDrpeNKYoc2o/rsyLK9kK6AV8UC7Rf8Njh70NI2DjckvMKxSopSca4EFUGbltpSY2ZuUllUrr
	lTt822Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zkE-00000009qVH-0wEi;
	Tue, 08 Sep 2026 17:36:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zkD-00000009qVA-0TAr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:36:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9F75444F6
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23101F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888988;
	bh=xXzfiY6SzoJBncXcdLH+tsYFvMZl0xri22KcLVBkMFA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DN6cQtn0qqlONJ5apqe2nrBkN4G+dqWgJOugaBlDHNOVy5m4kPoWqFy0DEu47pTgy
	 T15dVGzKaDuiH8QZPT3LIXOfbAgZqibeIwmhgs+VZOD0sChaVSCGTT8IuThuToEFp+
	 jPFgtd/TpkOwLMpqFIym37NLVavDndl8Bwl0v7PkHlw4OwaZskbS036yKlcumLeNd1
	 ZaPMzLhfPSxnXmAYB/cHVRPczacrZ6jMFQmUrMaZafbp4xjeHvajU66mcEA6WUt31S
	 mVQVhlsEcGCUjl2tJzlFPKpnj3dS3LzWrTtmZwE4uKLvrvXK9nFCWuo7kG/CdBdVkZ
	 lGX7q7lodMBPQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a472ff39d4so23502901fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjZOw3D6EANvpyh9nRpUSOWjOrx93HsXrV2SGwiQ6B5owPYWDdww+YWBxXY5xhGKNYL0b07zCfG3rBAFuaO5Az@lists.infradead.org
X-Gm-Message-State: AFuF++kwg2PGpkFlPGmevnOPHHALlAlqyNJL1xRjebdCrGwolM1osPNB
	+sYrbA3GX/21cEnVuN3J1noF5FeFX6FNXFKRICZAHYg6SFSGyOucK/A8nH6uZMuwKH+4Z5MB7Id
	G/wf0qJ4ZhBiSNPtGsVp36fNTYW8CD1k=
X-Received: by 2002:a05:6512:31cb:b0:5b4:5838:30ee with SMTP id
 2adb3069b0e04-5b616edf505mr4589701e87.7.1788888987143; Tue, 08 Sep 2026
 10:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-10-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-10-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:36:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkVPQyDKj2kRMgjo6zJFJy2WNpOiNmzDGo8_Tdzf9-voA@mail.gmail.com>
X-Gm-Features: AcwNN1V-wZ8mrD2va0ETCcbA6PJ4QIvheq_0f10i2NyJnopy7bfJnS_t3Fwsds0
Message-ID: <CAD++jLkVPQyDKj2kRMgjo6zJFJy2WNpOiNmzDGo8_Tdzf9-voA@mail.gmail.com>
Subject: Re: [PATCH 09/13] ARM: lpc18xx: remove entire platform
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>
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
> The NXP LPC18xx and LPC43xx microcontrollers are the more modern
> version of the classic LPC32xx line, but they lack memory management
> units.
>
> These microcontrollers all remain in production as of 2026, but
> there are no known users running Linux on them.
>
> The platform was marked deprecated in the 7.3-LTS release, which
> will remain supported for a few more years.
>
> Remove support for both LPC18xx and LPC43xx.

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

