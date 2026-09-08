Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDC6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHz8ORFSvJaE+UR+1UHvUxKukNbdZNA++8TVO2BPQIw=; b=1LgXQL0Mcj1zOK/Gtgs1SBYC6+
	i4BjEo8YpTjYL2orVdQncaK6hZ9bOf99UNZhSL42YcL4xZp/bjFXPi37VzKp1vi7ZaYFiTvP5eZBJ
	I3nMwAMyWViIpefTbO0W3Iwp+qlkBrUgYJntR92goijKgEo/lXRSNiEXvBGeriQiZ8IhplnYaQyVl
	ne7BF2t9mQA9sgCpGcROfi8q+ZaxQaecbhJbazz5gGFeV0JA9tRwM16eVNbaGBlZ0s7bOdTQEqOZe
	43ha/BLxO3dUZW00s5stS0495TIcxOVGyQijP+FM3ttYAkTQbLZ1tcG4SjhQ4KYC64SUN1tpM2J4r
	HPi6k0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x434i-0000000AHtU-18PF;
	Tue, 08 Sep 2026 21:09:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x434h-0000000AHtM-0SGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 21:09:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B760601DE;
	Tue,  8 Sep 2026 21:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFC61F00A3A;
	Tue,  8 Sep 2026 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788901789;
	bh=IHz8ORFSvJaE+UR+1UHvUxKukNbdZNA++8TVO2BPQIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k6aq7Lh3Q+v4QuxYAJUOgrnezdCmOrjX6AbZRXTvV6JfbmzSp2mW5yLFnOmvpzn1L
	 gdSZ6rAkIqAZRkBKBEZFtQf/XCG237Vyt3Xeyd0mRJCnXAnKW28WdHJMxQwZAVrE7y
	 4Hwo6Uwo4llrJJAjflUh+NzyI6mY4NVqHCKF29f5+IVw3XSivdVt28IpyoWQlQz5R5
	 zhhqBMeGs32IwOe/hMkpSfjXIhSEmgl5DbmXeRHpDxFZBU2Fz7Z/mBmf6P8jZ6wD2V
	 20WTIvkcNhPiq4WfRqxKNDB30AeeL7Q88JryLDhhrmeBWAjDmQ+zYe0sMQkASYC9e/
	 xzMibxXhsfOdw==
Date: Tue, 8 Sep 2026 16:09:47 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
Message-ID: <20260908210947.GA519272-robh@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
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

On Tue, Sep 08, 2026 at 05:28:02PM +0200, Arnd Bergmann wrote:
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
> ---
>  arch/arm/Kconfig.debug      | 10 ----------
>  arch/arm/mach-at91/Kconfig  | 11 +----------
>  arch/arm/mach-at91/Makefile |  1 -
>  arch/arm/mach-at91/samv7.c  | 17 -----------------
>  drivers/soc/atmel/soc.c     | 36 ------------------------------------
>  5 files changed, 1 insertion(+), 74 deletions(-)
>  delete mode 100644 arch/arm/mach-at91/samv7.c

Do you want to drop all the samv7 platform compatibles from at91.yaml? 
Are there non-Linux users using DT?

Rob

