Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3CEC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xV9WGVUhDaM7feSHAMHRU17JK/43xAFNQC9C+0SKuzY=; b=z4j261JsxtkMypjqoc3L8uqcVc
	Pdj51vEq9UpSEVJetgXmUygGfpnNs7J0T0lanZBaniWUc+HCfW2JAkfBhgXs7F/AvruzfPxtlgo9t
	eCsLsem14NdiEVNi2a3cF23i1Ftcjn+dNsmIzOhoUsB7JwKPTZThIAjc9f/Lz9ZvG/SDDjEbHggF2
	s1Uie9uupUIwmwJ0A1b7jR19HNL/xc/R0hNixaAW+ioSATIPiGWt1Rm1vSNmWeSWL+G113jhh3RbE
	t2CBrBHm52u+YcTzC+9MdqKAu5vbVN4kAWFIvNYsLcuwvfgr0ohbS7klRAGIGT9WhuKgeR3VDC5d5
	dIE2GFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zlp-00000009qog-31AT;
	Tue, 08 Sep 2026 17:38:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zlo-00000009qoH-466M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:38:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB38E441F4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911161F01563
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 17:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889088;
	bh=xV9WGVUhDaM7feSHAMHRU17JK/43xAFNQC9C+0SKuzY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E/y5ZWFZ2hwHxch3L34izLg0s7LbkYAR0qYto+nyFgTySlUXkSWDGvDNVbzmJ7FJW
	 a6wv5BA1EO1HbPuYdniyeIW/3E4n9ji2bcHyIp2qKXzdhMWwElQ8EIoDQGjoHAGsiG
	 PAiKJGGkknYUxMCVuJkINzJ1qRO7YXy8XKlU9Hj30vkBoSWN/PZAiU4SBUx1DulzNK
	 wWMBUbNAvivKUmhBbP42Zaar5j4cAK5jz+mIdBEr9NmTFOBw4cPpu72BFEI9s6WJrB
	 a8/2n1Pn/echlAt0iJycONAQvMVMmP/ax9fe3zwyW9cAFCTxFEe0CcponmtfFkRvAA
	 vp+WX0Y/4Cirw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso3942179e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:38:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgSBqSs85gMNPRsXi8YWCwQds8FJYLgaHs+i4iveF4U3l/ZI9OuXOUopibaLAWiHWPsQllJTBgja3iqT7JtGJF@lists.infradead.org
X-Gm-Message-State: AFuF++mRxH4NLQFYD48c2Zy6Es1IuNFD7qDF+oAVPsBq+Q2H+oK7SxQg
	Xtj/Vxx0fBo+18yUOOL6Sng1ooHt8hNCXz+oHwCcvbnIA14LL9a6NEJQH4aDuwQWgaYh9B/LoJb
	yFRehxvuFhgtdLAXGnqDC0Z5ZZBTrs5Q=
X-Received: by 2002:a05:6512:2c04:b0:5b6:1a81:b960 with SMTP id
 2adb3069b0e04-5b61a81bbd7mr4978552e87.67.1788889087269; Tue, 08 Sep 2026
 10:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-12-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-12-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:37:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLmoSUE9582xd9zNCEq3rN0UEyG6sivNz8SDoYy9RxXuQw@mail.gmail.com>
X-Gm-Features: AcwNN1WWmio2Em4aKVDNeDjQ4YqA6DMZXwfzcFUzVwF968HsT49NyvahOJQzbQM
Message-ID: <CAD++jLmoSUE9582xd9zNCEq3rN0UEyG6sivNz8SDoYy9RxXuQw@mail.gmail.com>
Subject: Re: [PATCH 11/13] ARM: versatile: remove mps2 support
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
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
> The Arm mps2 platform is the reference implementation for Arm
> microcontrollers and is useful for testing but not expected to be used
> as a production device.
>
> With all the Cortex-M based products gone, there is no longer a need
> for a reference platform either, so remove it as well.
>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

