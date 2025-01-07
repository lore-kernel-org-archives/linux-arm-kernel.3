Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1753E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uZABI3aiutFUpBIj+b0UQRLhLBHXEBsU6zlbUD9vAs=; b=CGsqkfmlKEk7Z+n4xQVCs+LB6j
	bipMWDbeL6Odcv15mPkIh8/AISTrXTpyFMC6QJ7aZxEUSIFpCeWyrCwajy2jN2C+iBPxsScPYO2bh
	6X7zrkVGJ50c14QQzde7veqNUjNBPOXzVQ18icIGzmvIFjhvJ+2r8FeCmZHePTygpegGnSYHLcCdg
	mfrt9+ijlv4eIxF6xXLxT3G57ViBilcINGnrGWV2e5BqnxWRhoQmPdBuDSIZ+c1GdyjR22xomLFLx
	oVthTu02RVQ4dZZgPRenMaajY/cz4fDERUBW9BqXRKqMI7JMe7tSFah02XN4dcEO16eou5VlXPGwk
	l++ly/5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBva-00000005WvA-0KdC;
	Tue, 07 Jan 2025 15:55:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBuK-00000005WLT-2h5e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:54:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVBuB-00085a-1F; Tue, 07 Jan 2025 16:54:07 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVBu8-007MxW-1M;
	Tue, 07 Jan 2025 16:54:05 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVBu9-009bxi-0E;
	Tue, 07 Jan 2025 16:54:05 +0100
Date: Tue, 7 Jan 2025 16:54:05 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z31OHYsfZc8fT--Z@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z300BuATJoVDc_4S@pengutronix.de>
 <Z31E4_oWPmFgvfxl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z31E4_oWPmFgvfxl@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_075416_678841_A9C763F1 
X-CRM114-Status: GOOD (  19.51  )
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

On Tue, Jan 07, 2025 at 03:14:43PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 07, 2025 at 03:02:46PM +0100, Oleksij Rempel wrote:
> > On Tue, Jan 07, 2025 at 02:26:05PM +0100, Kory Maincent wrote:
> > > On Thu, 2 Jan 2025 18:03:52 +0100
> > > Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > The IEEE 802.3 - 2022 has following variants:
> > 14.5.2 Crossover function - only A<>B swap is supported
> > 40.4.4 Automatic MDI/MDI-X Configuration - only A<>B swap is supported?
> > 55.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> > 113.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> > 126.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> > 
> > This was only the pair swap. How to reflect the polarity swap withing
> > the pairs?
> 
> 802.3 supports this because of the problems caused by miswired cables,
> which are typically a user thing. It's not really there to give freedom
> to designers to wire their sockets incorrectly.
> 
> Do we have any real cases where a socket has been wired incorrectly?

Yes. I tested some low cost adapter using same driver but reporting
incorrect results, depending on board. I can explain it only by
incorrect PCB design.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

