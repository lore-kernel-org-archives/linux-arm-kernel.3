Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C24AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcRUFlTpm8Zh2F0emtR0r0UVSpkNddkhpcAlUKtjSko=; b=dN2mNVHqSzPE51zcMx3G0Aelxg
	WRGxZl4tq8RifhmYvl99+MoG4z1tekhV0xjAuOs/gThvLVaEKKD5Qak+aH19PUXDv8Kh/7pTiKtjq
	pq/VErzDHaTE2MvVPa4YqHRt+wu9kXFiKLUQOHBeb29UlNW4Je9Pcfa6B6d3LwVTc7VWnJwFP5Gdw
	y1PNmip8eRvWCF34WZ8UVS7zxVNrGKCwtxH0SAZ8YBk0iaKMNz5yo0+DDiu1oWF+GLJJmTQJALtOq
	mq63SMXEFVid3YrZRARHALv/qDPERgicCA+HPUD/8PyrxkhZgRFcW5gH9MWR0Dz2+30FUA1pObi+/
	MPrfml8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIle-0000000ACNd-2yfi;
	Thu, 02 Jan 2025 10:49:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIkV-0000000ACEa-1cE1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 10:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rcRUFlTpm8Zh2F0emtR0r0UVSpkNddkhpcAlUKtjSko=; b=PVWZLdhNQm0ngzeRCuyoqKxsgP
	f3gQSl+IyaZvM2gs5B7vdKrr6G/M8lsgHwgxLJMZtDdgvl0f70wPBxEbYtbLeMjwuEdthMvOYCGC4
	QYIiMdID1Iq3wIuVH6xP/Ibm38M7XhqZbsSVs8UBwfsv6KuzBewWVNG/DxpHzyrHq7a7OGubuASdA
	1S9zdy6kyq9nb9SbXb9guy1oEUB4gdotsVG3761+um1LHl5ZVI9Zd3bhTo3iGcS7d2o1HvebnzS4u
	7+RnvDjZfFjGXxBhmXsnCSouMOw6P7+StQiVjfpFGi8Ph43Yi+MIR1mScQB9JLYyDcMaiaJkL6m1y
	nzaqr32Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39980)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTIkK-0001tV-1o;
	Thu, 02 Jan 2025 10:48:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTIkH-0000DB-1o;
	Thu, 02 Jan 2025 10:48:05 +0000
Date: Thu, 2 Jan 2025 10:48:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2hgbdeTXjqWKa14@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_024819_422126_2F11CFDA 
X-CRM114-Status: GOOD (  16.02  )
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

On Sun, Dec 22, 2024 at 07:54:37PM +0100, Oleksij Rempel wrote:
> Here is updated version:
> 
> ports {
>     /* 1000BaseT Port with Ethernet and simple PoE */
>     port0: ethernet-port@0 {
>         reg = <0>; /* Port index */
>         label = "ETH0"; /* Physical label on the device */
>         connector = "RJ45"; /* Connector type */
>         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes */
> 
>         transformer {
>             model = "ABC123"; /* Transformer model number */
>             manufacturer = "TransformerCo"; /* Manufacturer name */
> 
>             pairs {
>                 pair@0 {
>                     name = "A"; /* Pair A */
>                     pins = <1 2>; /* Connector pins */
>                     phy-mapping = <PHY_TX0_P PHY_TX0_N>; /* PHY pin mapping */
>                     center-tap = "CT0"; /* Central tap identifier */
>                     pse-negative = <PSE_GND>; /* CT0 connected to GND */
>                 };
>                 pair@1 {
>                     name = "B"; /* Pair B */
>                     pins = <3 6>; /* Connector pins */
>                     phy-mapping = <PHY_RX0_P PHY_RX0_N>;
>                     center-tap = "CT1"; /* Central tap identifier */
>                     pse-positive = <PSE_OUT0>; /* CT1 connected to PSE_OUT0 */
>                 };
>                 pair@2 {
>                     name = "C"; /* Pair C */
>                     pins = <4 5>; /* Connector pins */
>                     phy-mapping = <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY connection only */
>                     center-tap = "CT2"; /* Central tap identifier */
>                     /* No power connection to CT2 */
>                 };
>                 pair@3 {
>                     name = "D"; /* Pair D */
>                     pins = <7 8>; /* Connector pins */
>                     phy-mapping = <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY connection only */
>                     center-tap = "CT3"; /* Central tap identifier */
>                     /* No power connection to CT3 */
>                 };
>             };
>         };

I'm sorry, but... what is the point of giving this much detail in the DT
description. How much of this actually would get used by *any* code?

Why does it matter what transformer is used - surely 802.3 defines the
characteristics of the signal at the RJ45 connector and it's up to the
hardware designer to ensure that those characteristics are met. That
will depend on the transformer, connector and board layout.

What does it matter what connector pins are used? This is standardised.

You also at one point had a description for a SFP cage (I'm sorry, I
can't be bothered to find it in the 3000+ emails that I've missed over
the Christmas period), using pin numbers 1, 2, 3, and 4. That's
nonsense, those aren't the pin numbers for the data pairs. You also
are effectively redefining what already exists for SFP cages - we
already have a DT description for that, and it's based around the
standardised connector. Why do we need a new description for SFP
cages?

Are we going to start converting schematics into DT representations,
including any resistors and capacitors that may be present in the
data path?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

