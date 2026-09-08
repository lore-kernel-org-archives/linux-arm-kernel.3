Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043E3C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJaaRz4MsyrOVh6YnV0YRCgCp5Qj4xEbBmQuv65GUYs=; b=FSGcler79hep2SFRYE6NpETULP
	+LBBNvgjOpRdBBSEjru07MFebyrCNxkqi3W/xvTt5yzzek3k8LDYGMOG7p9jPi3f+46xzbPWyPzKp
	ijcuds+sLJD/SsWn7SD6Vzj1LaYBuB/nVUqoBx7uLEwY9WJAavaP2Fsut7ZEP/uqzVtFpOd71PSza
	WSH2x7W6rhf4cJPfVr3eWPqOzl/CUBrF66G7CJM9lLLATQ0TvQ5xHOtoPQcnPfzu7n6bCJ3iwlyxP
	wk/CZtAL7fx1b8rKUcxzReT6pi8Rzh6SVaXNIcMfBEGFLH1ofHrcTSuK6Trhw2DXkQ5I1pBZANkvg
	LDT2QHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41tv-0000000A76D-1ULY;
	Tue, 08 Sep 2026 19:54:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41ts-0000000A75y-2NED
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:54:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2B77601DE;
	Tue,  8 Sep 2026 19:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183A81F00A3A;
	Tue,  8 Sep 2026 19:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897275;
	bh=eJaaRz4MsyrOVh6YnV0YRCgCp5Qj4xEbBmQuv65GUYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eZtpQZ2mYf15Akpd8onnJM5irfg/WdW38TXlJO3HzDjUpr/VCKE87stPMjojlHXNz
	 5nX7vFy7TQ1STo1GzJseSMJK4hqN8jQPcFjeyANjSZYbqc7sL7nMsWMydPMJr6khr4
	 JM3LfmCtwSfIfwU3rYcYK/8jcYNcU89JGIQzyeIZb0enxzLdXaC+lEAv3RvoF1ozvT
	 aafXPZOLk35Bn43nA7bO5OFMrTSpnv3YaPnSzYRKEaLTuP0NtnPdCBEs1YQEHmdulZ
	 ASx1nmLY/NmTzNrGS2m1KLD2VZS1wmeboa4qHOv4rv3L37Me8iqaa7NqOI6tKB+FSC
	 fx56cq6O7A+ew==
Date: Tue, 8 Sep 2026 20:54:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <20260908-interesting-primitive-squirrel-afcd7e@sudeepholla>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-12-arnd@kernel.org>
 <20260908-nuthatch-of-utter-peace-68ead7@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-nuthatch-of-utter-peace-68ead7@sudeepholla>
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

On Tue, Sep 08, 2026 at 08:49:09PM +0100, Sudeep Holla wrote:
> On Tue, Sep 08, 2026 at 05:28:01PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The Arm mps2 platform is the reference implementation for Arm
> > microcontrollers and is useful for testing but not expected to be used
> > as a production device.
> > 
> > With all the Cortex-M based products gone, there is no longer a need
> > for a reference platform either, so remove it as well.
> > 
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> While at it, should we also remove
> 
> drivers/tty/serial/mps2-uart.c and related Makefile/Kconfig entries ?
> 

My initial search was incomplete(used _MPS2_ instead of _MPS2).
We also have timer/clocksource driver:

drivers/clocksource/mps2-timer.c

-- 
Regards,
Sudeep

