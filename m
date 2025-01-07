Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81C2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9RmLQOMfl0rWJpIYvWk4KZnHv3ahfnPTCrPG72CVSU=; b=0ePhwrHgDv/kJuf/fyE3lRkYXR
	9kN1dJm//hgWE725sE4UrGICF6ZDe/FluAK6S9lcF8gC2xnAD9hJ8IUlsVR1ASgutTNhzDfX+0eo/
	iYPwMOHzpS26b+ZG4rG79cGM/hPvLEuw09m4/4qJ8POl8OACwnhx6nEJBOfgYkzb2ZeFhKzpkOaGM
	5hA6CKS+vsf1M8HiUlx3NXuJKq31k65X8TcWEviQvXuZiwRDjgC/+/ZfDgXxYZctROv9giD//5KFn
	vDjrxqHTcLZUhAbEqvfcT9H5ELYsqumb6oKpVYda4OCdMfvueg+X2QF1lA3ZrgO9qwVhmsSnJaXOU
	Ak+7eYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBK7-00000005OYk-0wOR;
	Tue, 07 Jan 2025 15:16:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBIF-00000005O64-2PCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r9RmLQOMfl0rWJpIYvWk4KZnHv3ahfnPTCrPG72CVSU=; b=vhJbGUgWXA5FWGaLKa5wloDXsK
	UGdrPSDKf7OacsPThP1pQikbaFRHW0RXiIowiwPjyaXpZVbisTfrJGY1AFZtZzREdi/lQSZ+xWNo0
	35puHZlNqahsb6gIvivcFHijIjhdF7umOCvt+k04qsrPX9nkjT4Ho8nhl3QHPCnj7gP9Y5s0cD7yO
	7/rRhnwW0mk7a8WRp0xDfoQo0twWf50mwlKf31vp2oyCJM4ns5X6bQN5OKrhkSFuXmSvS9YD4RytP
	qYI3og+KvdgAedcdpyZFUWoP5sfVGSC0eJGiQqBhMcl5GOiZ2J5NTkWQGuhmDvzDGHSqjYV98A+8P
	M2m56bug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48082)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVBI5-0007fG-21;
	Tue, 07 Jan 2025 15:14:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVBI3-0005OL-2x;
	Tue, 07 Jan 2025 15:14:43 +0000
Date: Tue, 7 Jan 2025 15:14:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z31E4_oWPmFgvfxl@shell.armlinux.org.uk>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z300BuATJoVDc_4S@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z300BuATJoVDc_4S@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071455_611186_E1703147 
X-CRM114-Status: GOOD (  25.21  )
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

On Tue, Jan 07, 2025 at 03:02:46PM +0100, Oleksij Rempel wrote:
> On Tue, Jan 07, 2025 at 02:26:05PM +0100, Kory Maincent wrote:
> > On Thu, 2 Jan 2025 18:03:52 +0100
> > Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > 
> > > On Thu, Jan 02, 2025 at 10:48:05AM +0000, Russell King (Oracle) wrote:
> > > > On Sun, Dec 22, 2024 at 07:54:37PM +0100, Oleksij Rempel wrote:  
> > > > > Here is updated version:
> > > > > 
> > > > > ports {
> > > > >     /* 1000BaseT Port with Ethernet and simple PoE */
> > > > >     port0: ethernet-port@0 {
> > > > >         reg = <0>; /* Port index */
> > > > >         label = "ETH0"; /* Physical label on the device */
> > > > >         connector = "RJ45"; /* Connector type */
> > > > >         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported
> > > > > modes */
> > > > > 
> > > > >         transformer {
> > > > >             model = "ABC123"; /* Transformer model number */
> > > > >             manufacturer = "TransformerCo"; /* Manufacturer name */
> > > > > 
> > > > >             pairs {
> > > > >                 pair@0 {
> > > > >                     name = "A"; /* Pair A */
> > > > >                     pins = <1 2>; /* Connector pins */
> > > > >                     phy-mapping = <PHY_TX0_P PHY_TX0_N>; /* PHY pin
> > > > > mapping */ center-tap = "CT0"; /* Central tap identifier */
> > > > >                     pse-negative = <PSE_GND>; /* CT0 connected to GND */
> > > > >                 };
> > > > >                 pair@1 {
> > > > >                     name = "B"; /* Pair B */
> > > > >                     pins = <3 6>; /* Connector pins */
> > > > >                     phy-mapping = <PHY_RX0_P PHY_RX0_N>;
> > > > >                     center-tap = "CT1"; /* Central tap identifier */
> > > > >                     pse-positive = <PSE_OUT0>; /* CT1 connected to
> > > > > PSE_OUT0 */ };
> > > > >                 pair@2 {
> > > > >                     name = "C"; /* Pair C */
> > > > >                     pins = <4 5>; /* Connector pins */
> > > > >                     phy-mapping = <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY
> > > > > connection only */ center-tap = "CT2"; /* Central tap identifier */
> > > > >                     /* No power connection to CT2 */
> > > > >                 };
> > > > >                 pair@3 {
> > > > >                     name = "D"; /* Pair D */
> > > > >                     pins = <7 8>; /* Connector pins */
> > > > >                     phy-mapping = <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY
> > > > > connection only */ center-tap = "CT3"; /* Central tap identifier */
> > > > >                     /* No power connection to CT3 */
> > > > >                 };
> > > > >             };
> > > > >         };  
> > 
> > Couldn't we begin with something simple like the following and add all the
> > transformers and pairs information as you described later if the community feels
> > we need it?
> > 
> > mdis {
> > 
> >     /* 1000BaseT Port with Ethernet and PoE */
> >     mdi0: ethernet-mdi@0 {
> >         reg = <0>; /* Port index */
> >         label = "ETH0"; /* Physical label on the device */
> >         connector = "RJ45"; /* Connector type */
> >         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes */
> >         lanes = <2>;
> >         variant = "MDI-X"; /* MDI or MDI-X */
> >         pse = <&pse1>;
> >     };
> > };
> 
> The problematic properties are lanes and variants.
> 
> Lanes seems to not provide any additional information which is not
> provided by the supported-modes.
> 
> We have at least following working variants, which are supported by (some?)
> microchip PHYs:
> https://microchip.my.site.com/s/article/1000Base-T-Differential-Pair-Swapping
> For swapping A and B pairs, we may use MDI/MDI-X. What is about swapped
> C and D pairs?
> 
> The IEEE 802.3 - 2022 has following variants:
> 14.5.2 Crossover function - only A<>B swap is supported
> 40.4.4 Automatic MDI/MDI-X Configuration - only A<>B swap is supported?
> 55.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> 113.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> 126.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> 
> This was only the pair swap. How to reflect the polarity swap withing
> the pairs?

802.3 supports this because of the problems caused by miswired cables,
which are typically a user thing. It's not really there to give freedom
to designers to wire their sockets incorrectly.

Do we have any real cases where a socket has been wired incorrectly?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

