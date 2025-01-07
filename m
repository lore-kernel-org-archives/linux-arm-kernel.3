Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DA1E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4Gg20KiFE6gVMYr4V4rZaknsO1TvSlGmAwG0tVYAE8=; b=jnG9uTRxnO20+/nRznEWXfjsc4
	CQs8j7SpAdzal/c80Yyo4qlBP/RZjBUtlKxiey72512P2fLCDTbww/mB8H82MDGyrQ/hmZ9mjKBrU
	Ks4yB0dz7dYghBNmJNm33wnY4ZqzcpMNgbx87frzz1QSw/XBYHaY4GDEjWZzmC+Zxo2fEZLedI5Et
	shfs61bUyj70nHJfzKalKbFwiaqKxxHQ4sKyc7kYIm6Nwqe2AfjQ/cdwQr++FV+Jpk23IrAKPPWO6
	xfl25rOvdnofaCKzSfwIusOCi+QqpJd0x7WVKth9/8WAmqrGxdA5IpU4DS5lk3xdBw/aiKpFnAgbl
	WKH93+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB2d-00000005KnS-4AdA;
	Tue, 07 Jan 2025 14:58:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAy7-00000005Jj1-0IfR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:54:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVAxy-00032F-BC; Tue, 07 Jan 2025 15:53:58 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVAxx-007MWH-0E;
	Tue, 07 Jan 2025 15:53:57 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVAxx-009auF-2K;
	Tue, 07 Jan 2025 15:53:57 +0100
Date: Tue, 7 Jan 2025 15:53:57 +0100
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
Message-ID: <Z31ABd8pdBjJtTiE@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z300BuATJoVDc_4S@pengutronix.de>
 <20250107154302.628e7982@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107154302.628e7982@kmaincent-XPS-13-7390>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065407_114845_BBA5082E 
X-CRM114-Status: GOOD (  25.96  )
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

On Tue, Jan 07, 2025 at 03:43:02PM +0100, Kory Maincent wrote:
> On Tue, 7 Jan 2025 15:02:46 +0100
> Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > On Tue, Jan 07, 2025 at 02:26:05PM +0100, Kory Maincent wrote:
> > > On Thu, 2 Jan 2025 18:03:52 +0100
> > > Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > >   
> > > > On Thu, Jan 02, 2025 at 10:48:05AM +0000, Russell King (Oracle) wrote:  
> >  [...]  
> >  [...]  
> > > 
> > > Couldn't we begin with something simple like the following and add all the
> > > transformers and pairs information as you described later if the community
> > > feels we need it?
> > > 
> > > mdis {
> > > 
> > >     /* 1000BaseT Port with Ethernet and PoE */
> > >     mdi0: ethernet-mdi@0 {
> > >         reg = <0>; /* Port index */
> > >         label = "ETH0"; /* Physical label on the device */
> > >         connector = "RJ45"; /* Connector type */
> > >         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes
> > > */ lanes = <2>;
> > >         variant = "MDI-X"; /* MDI or MDI-X */
> > >         pse = <&pse1>;
> > >     };
> > > };  
> > This was only the pair swap. How to reflect the polarity swap withing
> > the pairs?
> 
> Indeed I see what you mean. Maybe we could add it later as optional binding and
> only focus for now on the current needs.
> According to Maxime proposition he wants the connector types and the
> supported modes (or number of lanes). On my side I am interested in the PSE
> phandle.
> 
> We could begin with this:
> mdis {
>     /* 1000BaseT Port with Ethernet and PoE */
>     mdi0: ethernet-mdi@0 {
>         reg = <0>; /* Port index */
>         label = "ETH0"; /* Physical label on the device */
>         connector = "RJ45"; /* Connector type */
>         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes */
>         pse = <&pse1>;
>     };
> };  
> 
> Your proposition will stay in our mind for future development on the subject.

Perfect :)

> I think we currently don't have enough time available to develop the full
> package.

Yes, no one do.

> What do you think?

Sounds good!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

