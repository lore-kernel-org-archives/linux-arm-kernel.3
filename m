Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE0DC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NZ4qj4y6ghNql1BBq5OgAjPl+eevtru+FCwcPmuWtk=; b=BOaSM1BgR7CdGjQssvJD+JnE3L
	1diBOuzMfSdGXIVW2317tdXyBDjsiH9YXyJts6Ahpa0GiN+3zHH2AZEmFy6t/PAv9CCXya6HUU8GZ
	ZkkaemyHEXZ7ueSyG5R2toXj1C/cKf5KqJfnXfDK4xtqe8x7FxcF99v12rBDa2uYG74c5vxoRCaMj
	L7iTQe6HtVXBpXU1TdmyK/ycr5dd4MpBQZ37zzjp90uDmjSuAFBMHBHKoANU39FP7RZWIk7n+/J3F
	ugHqBMgiJy1jHZ9LsD9ZUJgxU5HKdzQmSiUUzbKn/V7AYVPjJkQdcyew/hlffQAwkjo134xnGnsmJ
	SsZWhaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41xe-0000000A7XD-1FwR;
	Tue, 08 Sep 2026 19:58:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41xd-0000000A7Wn-2Lot
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:58:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8329601DE;
	Tue,  8 Sep 2026 19:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D225A1F00A3A;
	Tue,  8 Sep 2026 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897508;
	bh=7NZ4qj4y6ghNql1BBq5OgAjPl+eevtru+FCwcPmuWtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O3sWU/ZmJzHn+2N6ETJ6oNqcqqmbVuWJyd8w69y2FiLoyKFPpwOd8xhXQmWtepC2m
	 3v8BXdvB5BHlJRf3W+ok1DEqhufqOgwc4FHTzrUJUWEUzQrReCDYOVeyaE4E3NWt/J
	 ckmMlL70nIBY37lOFcGkzb8ln0UQujCvvsm71z65kEWXTP4d6QZdsFZa0bHMptXSxK
	 22WGC47I115WfmGf89Q3jP4BLDVvdklP9Dh0wbXkPYOHs32iGy/n9gA1jgl4FLfWL1
	 RmAeWVOOuG4iSCavArip1qfjLmYW4fs11N0eoVIxucim1vppcrnbYlIdj4xh1BLRJa
	 DU7Ozjcdi1ouw==
Date: Tue, 8 Sep 2026 20:58:18 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Drew Fustini <fustini@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
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
	"A. Sverdlin" <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 11/13] ARM: versatile: remove mps2 support
Message-ID: <20260908-rare-dragonfly-of-variation-1d59ae@sudeepholla>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-12-arnd@kernel.org>
 <20260908-nuthatch-of-utter-peace-68ead7@sudeepholla>
 <85c2f9d0-0e9f-4228-9275-65e731def3b1@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85c2f9d0-0e9f-4228-9275-65e731def3b1@app.fastmail.com>
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

On Tue, Sep 08, 2026 at 09:51:22PM +0200, Arnd Bergmann wrote:
> On Tue, Sep 8, 2026, at 21:49, Sudeep Holla wrote:
> > On Tue, Sep 08, 2026 at 05:28:01PM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The Arm mps2 platform is the reference implementation for Arm
> >> microcontrollers and is useful for testing but not expected to be used
> >> as a production device.
> >> 
> >> With all the Cortex-M based products gone, there is no longer a need
> >> for a reference platform either, so remove it as well.
> >> 
> >> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> >
> > Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Thanks!
> 
> > While at it, should we also remove
> >
> > drivers/tty/serial/mps2-uart.c and related Makefile/Kconfig entries ?
> 
> Yes, I have a patch for that in
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3 and will post that once this series has progressed enough.
> 

Ah ok, then discard my followup message. I assume you would have the timer
driver as well. Thanks for the deprecation.

-- 
Regards,
Sudeep

