Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9BBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNJctEOxjNX+HPoMc9n0enC9xzXXcKa657v9jR3Yojc=; b=TEzeMe1mlIvo9ruljQrnoPBvWY
	iMJExSNhfrSDwz4Wz97FscAOTiYtRj+V1uj/DM4ZNylwTK2MBGOlvqEWGnFzzp5AHO0dA/FpdIzHk
	nKLSaKAiWQDMt4rB5b2O4aEAoRC5nVNqLj6YF73sDt/cBe3Ix12pG3Nau+QkQP3Kiycs/UmtD7WK5
	On7yIGCHrgfNgrz+cMKqltK4Px74h5fdKiOP+fE19h/xnlA91c3NVG8ZMwkJfa+USmStF9g14ndvq
	/OKiAoN5inK9gdcywq/ZpFsWXx0J/G5XG3oWOoQpqGbiO0RrDy/peRklX+EhlBXc81Gpe2u+jGCHl
	N1+aRDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRCE-00000007W7B-25SC;
	Wed, 08 Jan 2025 08:13:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRB0-00000007Vt1-2mHl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:12:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVRAa-0002TW-VK; Wed, 08 Jan 2025 09:12:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVRAY-007U1v-0v;
	Wed, 08 Jan 2025 09:12:03 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVRAY-00BPlU-31;
	Wed, 08 Jan 2025 09:12:02 +0100
Date: Wed, 8 Jan 2025 09:12:02 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Kory Maincent <kory.maincent@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
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
Message-ID: <Z34zUuUkx2bWXYfW@pengutronix.de>
References: <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
 <20250107171507.06908d71@fedora.home>
 <601067b3-2f8a-4080-9141-84a069db276e@lunn.ch>
 <Z31ZOjLcE34CNj0S@pengutronix.de>
 <20250108082507.0402f158@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108082507.0402f158@fedora.home>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_001230_700505_9C342A4D 
X-CRM114-Status: GOOD (  32.45  )
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

On Wed, Jan 08, 2025 at 08:25:07AM +0100, Maxime Chevallier wrote:
> On Tue, 7 Jan 2025 17:41:30 +0100
> Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > On Tue, Jan 07, 2025 at 05:22:51PM +0100, Andrew Lunn wrote:
> > > >   I have however seen devices that have a 1G PHY connected to a RJ45
> > > > port with 2 lanes only, thus limiting the max achievable speed to 100M.
> > > > Here, we would explicietly describe the port has having 2 lanes.   
> > 
> > I can confirm existence of this kind of designs. One industrial real life
> > example: a SoC connected to 3 port Gigabit KSZ switch. One port is
> > typical RJ45 connector. Other port is RJ11 connector.
> > 
> > The speed can be reduced by using max-speed property. But i can't
> > provide any user usable diagnostic information just by saying pair A or
> > B is broken.
> > 
> > This is one of the reasons why i propose detailed description.
> 
> While I get the point, I'm wondering if it's relevant to expose this
> diag information for the user. As this is a HW design feature we're
> representing, and it's described in devicetree, the information that the
> HW design is wrong or uncommon is already known. So, exposing this to
> the user ends-up being a pretty way to display plain devicetree data,
> without much added value from the PHY stack ? Or am I missing the point
> ?

Correct. The same kind of information, such as whether the connector is RJ45 or
an industrial one with a proprietary layout, or what label this port will have
on the box, is essential. This information helps the user to manage, repair, or
connect devices in the field - even after 30 years of operation, when no paper
manual has survived being eaten by animals and the vendor's websites no longer
exist.

Here is one example of an industrial switch with PoE support:                                                                                       
https://www.westermo.com/-/media/Files/User-guides/westermo_ug_6641-22501_viper-x12a-poe_revo.pdf?rev=083148a9e565416a9044e9a4e379635f              
                                                                                                                                                    
Please pay attention to the difference for Gbit and 100Mbit ports and signal
layout within this ports.

> I would see some value if we could detect that pairs are miswired or
> disconnected at runtime, then report this to user. Here the information
> is useful.

Ack.
 
> The minimal information needed by software is in that case "how many
> working pairs are connected between the PHY and the connector", and
> possibly "are they swapped ?"

In case of home and enterprise type of devices - yes.
In case of industrial - the devices can be certified to operate in some
specific link mode.

For example device certified for explosive environments. These device should
operate in 10BaseT1L-Vpp1 mode only, and discard any link attempts to
devices which advertise 10BaseT1L-Vpp2 support in addition to 10BaseT1L-Vpp1:
https://www.pepperl-fuchs.com/germany/de/classid_260.htm?view=productdetails&prodid=118298

My point is, if we will need to set limit for the link modes, soon or later,
we will need a supported linkmodes property and this property will partially
duplicated the lanes property. At same time, if we use supported linkmodes
instead of lanes, we solve the problem with multimode PHYs which support
twisted pair and fiber modes.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

