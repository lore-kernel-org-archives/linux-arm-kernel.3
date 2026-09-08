Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D181FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/P9NMmb1bKlJESKNUVT1eu3XFgU1HlOoe7JBU7vKCC4=; b=UryhhBDkD3TFugTnxCYAApzh8q
	Bw7wGJTb1NswBgocZKdwcVGDBXfOyJHCeljH9sXEumx3Nk3z3BbaTEDQNW0ROc0VoecvoTzokuUGH
	wmdo7ZVgPZqW/IyQwC5jWYFMrQHRtipbb6DQPR9Gh2i9ufcDa35nYum4sj8hYHIFPZy62nyFiNxIR
	7mnmO8WheHWu49E+ixfZqj976NG0vD0+gDK1aAXAPl5fTnZrghpWTy0Q7hBTyNNEy7+5cU7lagCct
	oFIqiKUqJysJ6LsSd9trWGeFYemq+z/rXksYjKIbLJiZASUnKmug8UHNa+3VEM37iCeBOS27pfczP
	a7ZoHUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41on-0000000A6aj-1UrX;
	Tue, 08 Sep 2026 19:49:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41om-0000000A6aW-25KJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:49:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DC96601F7;
	Tue,  8 Sep 2026 19:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07451F00A3E;
	Tue,  8 Sep 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788896959;
	bh=/P9NMmb1bKlJESKNUVT1eu3XFgU1HlOoe7JBU7vKCC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fh9i0uXDyWEFR2uOr95NplkfG96J6thbYHCbX9Yw++FdCOUctWj04uVNF6GkWQbY0
	 pwTZ02VYjDsovAfcxdhJxsXVUcTDJKbTKooDfAWFEu82TcprN8TjFQhQx2XiP4S6eO
	 dMcKAmtaqHuVBAJEf/lfpYuw/qAi3Kt2HFynbKUcgUqCGLIHFhcGX7Po2h/Ywyuk/L
	 mvtOJq9Fj1CwdG9DUf+iAXDE9T91PTCaq9Gl/220rr3StOTCpvykpBxKvD064dphUc
	 sbBf4kWcrwzYLV9zlUS8pKbfewzeicNGRtdl1NwQSFaHkNb2wX9PLROfA9ogDlAXg0
	 B9f3Lx2+nVRBA==
Date: Tue, 8 Sep 2026 20:49:09 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
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
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 11/13] ARM: versatile: remove mps2 support
Message-ID: <20260908-nuthatch-of-utter-peace-68ead7@sudeepholla>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-12-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-12-arnd@kernel.org>
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

On Tue, Sep 08, 2026 at 05:28:01PM +0200, Arnd Bergmann wrote:
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

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

While at it, should we also remove

drivers/tty/serial/mps2-uart.c and related Makefile/Kconfig entries ?

-- 
Regards,
Sudeep

