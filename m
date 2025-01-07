Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26478E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4du5LWjZMyGowohYHWCZqhQ22dv14dIIf7ZvEHMxq0=; b=grNaUyOZifN51nMuQLP/vqQl5b
	AoBVZVtiIVdffGRtpYA99xK0xisrL3oPAgNH/GtP0L0pBwriyL8MD3cujpSS2TCWJWXbmnBteaUNs
	gLO7gxo/JHIgKS7Hv/TvxAE4/CbeoQyEK1IckODHYWheRaMRaSa69dAZqJrXgd7nUNnmGmd/Uk0Mv
	lE3wTBU3uV+1Kr+qvEq5vg/Cf+OPISulMkenMgPdYsgDM4vaG498uoM3ir6X0vR4/lCMhtkl+aSuX
	1N1U0p6BGf5Rp38YmzX+Yx5sVYxLrAc/dbLFXALZXKAz8A/QTjrt1ttjy3fT8upKRBBRl3kPSmOdN
	X3P7QnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAKj-000000058Vx-0kd4;
	Tue, 07 Jan 2025 14:13:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAAh-000000055s4-29vB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:03:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVAAR-0007Xm-QU; Tue, 07 Jan 2025 15:02:47 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVAAQ-007M3c-1B;
	Tue, 07 Jan 2025 15:02:47 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVAAQ-009aOe-33;
	Tue, 07 Jan 2025 15:02:47 +0100
Date: Tue, 7 Jan 2025 15:02:46 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z300BuATJoVDc_4S@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060303_550759_E4BF826B 
X-CRM114-Status: GOOD (  26.95  )
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

On Tue, Jan 07, 2025 at 02:26:05PM +0100, Kory Maincent wrote:
> On Thu, 2 Jan 2025 18:03:52 +0100
> Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > On Thu, Jan 02, 2025 at 10:48:05AM +0000, Russell King (Oracle) wrote:
> > > On Sun, Dec 22, 2024 at 07:54:37PM +0100, Oleksij Rempel wrote:  
> > > > Here is updated version:
> > > > 
> > > > ports {
> > > >     /* 1000BaseT Port with Ethernet and simple PoE */
> > > >     port0: ethernet-port@0 {
> > > >         reg = <0>; /* Port index */
> > > >         label = "ETH0"; /* Physical label on the device */
> > > >         connector = "RJ45"; /* Connector type */
> > > >         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported
> > > > modes */
> > > > 
> > > >         transformer {
> > > >             model = "ABC123"; /* Transformer model number */
> > > >             manufacturer = "TransformerCo"; /* Manufacturer name */
> > > > 
> > > >             pairs {
> > > >                 pair@0 {
> > > >                     name = "A"; /* Pair A */
> > > >                     pins = <1 2>; /* Connector pins */
> > > >                     phy-mapping = <PHY_TX0_P PHY_TX0_N>; /* PHY pin
> > > > mapping */ center-tap = "CT0"; /* Central tap identifier */
> > > >                     pse-negative = <PSE_GND>; /* CT0 connected to GND */
> > > >                 };
> > > >                 pair@1 {
> > > >                     name = "B"; /* Pair B */
> > > >                     pins = <3 6>; /* Connector pins */
> > > >                     phy-mapping = <PHY_RX0_P PHY_RX0_N>;
> > > >                     center-tap = "CT1"; /* Central tap identifier */
> > > >                     pse-positive = <PSE_OUT0>; /* CT1 connected to
> > > > PSE_OUT0 */ };
> > > >                 pair@2 {
> > > >                     name = "C"; /* Pair C */
> > > >                     pins = <4 5>; /* Connector pins */
> > > >                     phy-mapping = <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY
> > > > connection only */ center-tap = "CT2"; /* Central tap identifier */
> > > >                     /* No power connection to CT2 */
> > > >                 };
> > > >                 pair@3 {
> > > >                     name = "D"; /* Pair D */
> > > >                     pins = <7 8>; /* Connector pins */
> > > >                     phy-mapping = <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY
> > > > connection only */ center-tap = "CT3"; /* Central tap identifier */
> > > >                     /* No power connection to CT3 */
> > > >                 };
> > > >             };
> > > >         };  
> 
> Couldn't we begin with something simple like the following and add all the
> transformers and pairs information as you described later if the community feels
> we need it?
> 
> mdis {
> 
>     /* 1000BaseT Port with Ethernet and PoE */
>     mdi0: ethernet-mdi@0 {
>         reg = <0>; /* Port index */
>         label = "ETH0"; /* Physical label on the device */
>         connector = "RJ45"; /* Connector type */
>         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes */
>         lanes = <2>;
>         variant = "MDI-X"; /* MDI or MDI-X */
>         pse = <&pse1>;
>     };
> };

The problematic properties are lanes and variants.

Lanes seems to not provide any additional information which is not
provided by the supported-modes.

We have at least following working variants, which are supported by (some?)
microchip PHYs:
https://microchip.my.site.com/s/article/1000Base-T-Differential-Pair-Swapping
For swapping A and B pairs, we may use MDI/MDI-X. What is about swapped
C and D pairs?

The IEEE 802.3 - 2022 has following variants:
14.5.2 Crossover function - only A<>B swap is supported
40.4.4 Automatic MDI/MDI-X Configuration - only A<>B swap is supported?
55.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
113.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
126.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported

This was only the pair swap. How to reflect the polarity swap withing
the pairs?

> We can also add led, thermal and fuse subnodes later.
> Let's begin with something simple for the initial support, considering
> that it has places for additional details in the future.

Yes :)

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

