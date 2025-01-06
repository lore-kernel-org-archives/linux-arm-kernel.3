Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3CAE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 18:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNGPObBWC347+yfAF+Rst9DVWfQV7XHxF9dhpWCHwz8=; b=tN0FyjX8l9OQD2AVEHUEfH5VAJ
	2B8Df2ubYFFy/tNN8nEvQtsRBsa/usAHoyGzR/i6Vz+zTZa2BvVB72/235mUBaouIpl31zq3MSPIA
	tC7vIjQRYLC6fwM2bbCktEU8SpN3tCzcFtJpBFvLP7mVT67KLYsv/weDJfoHD+RQGIlZVabbNP5Se
	RbpT0mcEx3OeFka/ldveQD+gUZ2Z5MubH4sQfIHR4utAW5lv600Vp9iNbRA74dTL6BkMGwOOgYVHB
	HFqyc5YKU5E72hQ0TiW0IDsUZdKM3ifHNcQv+r+nmc6RhCJTN5RMmFviS/kpizw9Iy/Cfw/t/8umv
	d4aMywkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrgu-00000002GEO-2ERG;
	Mon, 06 Jan 2025 18:19:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrfi-00000002Fxz-24e8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 18:17:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tUrfV-00070y-Fp; Mon, 06 Jan 2025 19:17:37 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tUrfS-007DDy-2w;
	Mon, 06 Jan 2025 19:17:35 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tUrfT-007iFk-1m;
	Mon, 06 Jan 2025 19:17:35 +0100
Date: Mon, 6 Jan 2025 19:17:35 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z3weP2JpURuRgHnb@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <20250104232359.2c7a7090@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250104232359.2c7a7090@kmaincent-XPS-13-7390>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_101750_530178_D11A9791 
X-CRM114-Status: GOOD (  24.24  )
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

On Sat, Jan 04, 2025 at 11:23:59PM +0100, Kory Maincent wrote:
> On Sun, 22 Dec 2024 19:54:37 +0100
> Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> >         pse = <&pse1>; /* Reference to the attached PSE controller */
> 
> The PSE pairset and polarity are already described in the PSE bindings.
> https://elixir.bootlin.com/linux/v6.12.6/source/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
> 
> I am not sure it is a good idea to have PSE information at two different places.


You are right, the PSE PI node already covers the IEEE specifications. But
there are still some missing pieces. These are not directly tied to the PSE but
are important for port functionality, like LEDs, thermal sensors, and
transformer characteristics.  

### Why Link to the Port Node  

While LEDs, thermal zones, and other components can be described in the Device
Tree, there’s currently no clear way to indicate which ones belong to a
specific port. For single-port devices, this isn’t a big issue, but for devices
like switches with multiple ports, it gets messy very quickly.  

For example:  
- LEDs: Each port may have multiple LEDs for link, activity, and PoE
status. Without linking them to specific ports, the software cannot correctly
map these LEDs to their respective functionalities.
 
- Thermal Sensors: Sensors located near specific ports or magnetics are crucial
for thermal management. If they aren’t linked to a port, it’s unclear which
sensor data applies to which port.  

### Why Transformer Characteristics Matter  

Transformers (magnetics) are critical for Ethernet and affect software in these
ways:  

1. Signal Integrity:  
   - Transformers influence noise and insertion loss.
   - Some PHYs allow analog tuning for the connected transformer. Software
     needs this information to configure PHY registers for optimal performance.  

2. Power Delivery:  
   - Transformers have power and current limits.  
   - Software must ensure the power budget stays within these limits and detect
     overcurrent conditions.  

3. Thermal Management:  
   - Transformers can overheat under load.
   - Software should monitor nearby sensors and reduce power if temperatures
     exceed safe levels.  

This functionality does not need to be added right now. However, I’ve
encountered some of these issues and believe they may impact others sooner or
later. It would be good if newly added specifications avoid conflicting with or
blocking potential solutions to these known issues.

> > In case of PoDL, we will have something like this:
> > 
> > pair@0 {
> >     name = "A"; /* Single pair for 10BaseT1L */
> >     pins = <1 2>; /* Connector pins */
> >     phy-mapping = <PHY_TXRX0_P PHY_TXRX0_N>; /* PHY pin mapping */
> >     podl-mapping = <PODL_OUT0_P PODL_OUT0_N>; /* PoDL mapping: Positive and
> > negative outputs */ };
> 
> We should do the same for PoDL. Put all information in the same place, the PSE
> bindings.

Ack.

Since IEEE does not provide anything beyond pinout and polarity description for
PSE PI specifications (at least for PoE variants), let's keep those details
there. Magnetics, being a shared component, should be described as part of the
port. Thermal sensors located near magnetics or physical ports are port-related
and should also be linked to the port. LEDs, however, fall into different
groups: some are connected to PHYs, others to PSE, and they may be controlled
by PHYs, PSE, or external controllers with software. These LEDs need a clear
linkage to their corresponding port functionality. What would be the best way
to establish this linkage without introducing unnecessary complexity?

Best regards,  
Oleksij  
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

