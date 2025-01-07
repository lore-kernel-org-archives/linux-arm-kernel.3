Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27497E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVvHwicIH7u51N6MOXh6VLjjsXRtvgJyog6xrObUVqA=; b=x7NSh1idnUk5bdUdS81+j4QZjp
	5tX1sBMM72da7n8jKjQD6wMSFnEcKuFN3uy/0kP3opBewa84n+PrOhDxhLUSiLJDrqRBiJcoDsE89
	eYkqy3Y6EY0dXsMHbqLT+/4Rti8eGfw6R3PeK7QEn7j9S7xj8qjR/Zn1QPmH5l3DgOgDQ5cL1Xhu6
	gXT1+56JYfBAvom9iQWu2ZR2Y+weUlX8AF2r6Zl1SxmcFPXY9akUtDqxHBQ/uyFEYO7ZAHUv5/LAT
	kg0JDDKvp4NySnciQVazDFP3JrHoOUDSnScauSOx4NrwuwlkEtu0XKwuj2Haiex9UFHqdNk4xSGuk
	ubEnKv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDAH-00000005oEm-139N;
	Tue, 07 Jan 2025 17:14:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVClh-00000005hzC-0AIy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:49:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVClY-0003IO-68; Tue, 07 Jan 2025 17:49:16 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVClW-007NNg-2N;
	Tue, 07 Jan 2025 17:49:15 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVClX-009ceo-1D;
	Tue, 07 Jan 2025 17:49:15 +0100
Date: Tue, 7 Jan 2025 17:49:15 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Message-ID: <Z31bC6ymkKBHdYVR@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
 <20250107171507.06908d71@fedora.home>
 <601067b3-2f8a-4080-9141-84a069db276e@lunn.ch>
 <Z31ZOjLcE34CNj0S@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z31ZOjLcE34CNj0S@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_084925_079378_0BE0ECED 
X-CRM114-Status: GOOD (  17.45  )
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

On Tue, Jan 07, 2025 at 05:41:30PM +0100, Oleksij Rempel wrote:
> On Tue, Jan 07, 2025 at 05:22:51PM +0100, Andrew Lunn wrote:
> > >   I have however seen devices that have a 1G PHY connected to a RJ45
> > > port with 2 lanes only, thus limiting the max achievable speed to 100M.
> > > Here, we would explicietly describe the port has having 2 lanes. 
> 
> I can confirm existence of this kind of designs. One industrial real life
> example: a SoC connected to 3 port Gigabit KSZ switch. One port is
> typical RJ45 connector. Other port is RJ11 connector.
> 
> The speed can be reduced by using max-speed property. But i can't
> provide any user usable diagnostic information just by saying pair A or
> B is broken.
> 
> This is one of the reasons why i propose detailed description.

Here is one example:
https://www.balluff.com/de-de/products/BNI004F?gad_source=1&gclid=Cj0KCQiAvvO7BhC-ARIsAGFyToUmOy6VpSZUszHQ9X4tuUlyLdtAZqkk3tKxggF5z7D1pk3CgH5IOvwaAhhUEALw_wcB

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

