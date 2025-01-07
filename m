Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A71E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg7HLXMYl0Okee4VbCtvYj3hybq+byhmHOir5t654RA=; b=0pBXaMK/wWe2noxJea9fRcRlm9
	ZGy/cfcQ8AwjP/jZTrPK/rhD4c8smRAoVfbyoh8/Ie+W4UDu5ghMZrWig1mgWAt93zLEy1YeLzgdf
	UiQUZNWSm/HzEu9iATA/zY6vwu1SjrjmhjfPZDsg+1SwGaEqSwUyb9PDA/8QHAgephq/FO0CLGOit
	Xp5lZVtVrFU/gJwYJPI7ldYXPsCOjS2Mv++KtQXnHIU7Kt2jyY172y123qrQ7iEDPcJ4Z5+v3pvwe
	bF3y7KSsmgqAWSDeC1zFae7rfTID484JTr8eFF9Idt5iG/O8hQ5jlz5Rqr0LLDpb2mug/VCo1PdxT
	D5igOvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD4L-00000005llD-43Am;
	Tue, 07 Jan 2025 17:08:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCeC-00000005gAX-3JAK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:41:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVCe3-0001fn-L2; Tue, 07 Jan 2025 17:41:31 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVCe1-007NN0-2p;
	Tue, 07 Jan 2025 17:41:30 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVCe2-009cbp-1h;
	Tue, 07 Jan 2025 17:41:30 +0100
Date: Tue, 7 Jan 2025 17:41:30 +0100
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
Message-ID: <Z31ZOjLcE34CNj0S@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
 <20250107171507.06908d71@fedora.home>
 <601067b3-2f8a-4080-9141-84a069db276e@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <601067b3-2f8a-4080-9141-84a069db276e@lunn.ch>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_084140_823985_F1E78D4F 
X-CRM114-Status: GOOD (  17.78  )
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

On Tue, Jan 07, 2025 at 05:22:51PM +0100, Andrew Lunn wrote:
> >   I have however seen devices that have a 1G PHY connected to a RJ45
> > port with 2 lanes only, thus limiting the max achievable speed to 100M.
> > Here, we would explicietly describe the port has having 2 lanes. 

I can confirm existence of this kind of designs. One industrial real life
example: a SoC connected to 3 port Gigabit KSZ switch. One port is
typical RJ45 connector. Other port is RJ11 connector.

The speed can be reduced by using max-speed property. But i can't
provide any user usable diagnostic information just by saying pair A or
B is broken.

This is one of the reasons why i propose detailed description.

> Some PHYs would handle this via downshift, detecting that some pairs
> are broken, and then dropping down to 100M on their own. So it is not
> always necessary to have a board property, at least not for data.

Ack, but it will work not for all setups.

> I've no idea how this affects power transfer. Can the link partners
> detect which pairs are actually wired?

Not is usual simple implementation. The PSE PI devicetree properties
provide enough information for a _standard_ use case.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

