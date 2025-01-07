Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CC8E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZy6zaL3auTQI87bDI7Q8hHx2ztKK9SEbDscRh+BoZE=; b=lbuhZ8L7Gl4Umw/bnzDn7cRmtO
	tt4XIvw/pGXTV99dXFP7DuEcLeFYOpmYB8XN2x5Dnd2kdFietoOqZX53Y/eiYdYExOYjUBKJKX3ar
	a5m8VJj4LiT+gbWP5fm/qK1Q/E2g70jQomoCtQLnE1+SfoiuQrTLVsepk3rhRNKZYHMvFxgUsr+JG
	p6ZtDGdSWV9j3jlo+bomWzb9yMvxW/dT2R5lMzcm4p12/b3EsteC9eZeZ+rAEAwugvn+4o2HJOFXw
	/ohGtbnQN4h5mWMce5FkK7hkcpCsUDQ4eYeH+NjALApi3R88kZstsZ95768fdr0htptHuPjGU6mHg
	BFUcYtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9eq-000000050RN-0LBS;
	Tue, 07 Jan 2025 13:30:08 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9b2-00000004zs3-31n2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:26:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29B6660005;
	Tue,  7 Jan 2025 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736256367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZy6zaL3auTQI87bDI7Q8hHx2ztKK9SEbDscRh+BoZE=;
	b=pKY+u6mEp8EaWU6MPTKWH/z/tscf/lVeses2qVc5zXT78RReZGt3AJ5Jt6CMrqFlFzSeDZ
	99gfkFnafZMMsYWJFmJGX4nmhIwcl7RAWzeVvylZe/OcsmjG2W8gQ8ITBLaM/37Jz5UyV/
	sfWIyhyruvOySGLfpt1VSg41L+3igzXyVeU19VQsy53PT7c6Jyk/9dTqZd7TFUGCJeIVL8
	tb74JuFfSteb/sucIIpnqfuCxXBzLXEIkZtk5HMlWiLqg+aSfss8sfThFyXaSkYkLQWcl/
	8CO47EexKrdhzpsd5WC3/E9dkoE24pabFVskeGrZdDpql8xCFMqlUh1SJG7GDQ==
Date: Tue, 7 Jan 2025 14:26:05 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
In-Reply-To: <Z3bG-B0E2l47znkE@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
	<Z2g3b_t3KwMFozR8@pengutronix.de>
	<Z2hgbdeTXjqWKa14@pengutronix.de>
	<Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
	<Z3bG-B0E2l47znkE@pengutronix.de>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_052613_028801_2A32B74A 
X-CRM114-Status: GOOD (  17.76  )
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

On Thu, 2 Jan 2025 18:03:52 +0100
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> On Thu, Jan 02, 2025 at 10:48:05AM +0000, Russell King (Oracle) wrote:
> > On Sun, Dec 22, 2024 at 07:54:37PM +0100, Oleksij Rempel wrote: =20
> > > Here is updated version:
> > >=20
> > > ports {
> > >     /* 1000BaseT Port with Ethernet and simple PoE */
> > >     port0: ethernet-port@0 {
> > >         reg =3D <0>; /* Port index */
> > >         label =3D "ETH0"; /* Physical label on the device */
> > >         connector =3D "RJ45"; /* Connector type */
> > >         supported-modes =3D <10BaseT 100BaseTX 1000BaseT>; /* Support=
ed
> > > modes */
> > >=20
> > >         transformer {
> > >             model =3D "ABC123"; /* Transformer model number */
> > >             manufacturer =3D "TransformerCo"; /* Manufacturer name */
> > >=20
> > >             pairs {
> > >                 pair@0 {
> > >                     name =3D "A"; /* Pair A */
> > >                     pins =3D <1 2>; /* Connector pins */
> > >                     phy-mapping =3D <PHY_TX0_P PHY_TX0_N>; /* PHY pin
> > > mapping */ center-tap =3D "CT0"; /* Central tap identifier */
> > >                     pse-negative =3D <PSE_GND>; /* CT0 connected to G=
ND */
> > >                 };
> > >                 pair@1 {
> > >                     name =3D "B"; /* Pair B */
> > >                     pins =3D <3 6>; /* Connector pins */
> > >                     phy-mapping =3D <PHY_RX0_P PHY_RX0_N>;
> > >                     center-tap =3D "CT1"; /* Central tap identifier */
> > >                     pse-positive =3D <PSE_OUT0>; /* CT1 connected to
> > > PSE_OUT0 */ };
> > >                 pair@2 {
> > >                     name =3D "C"; /* Pair C */
> > >                     pins =3D <4 5>; /* Connector pins */
> > >                     phy-mapping =3D <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY
> > > connection only */ center-tap =3D "CT2"; /* Central tap identifier */
> > >                     /* No power connection to CT2 */
> > >                 };
> > >                 pair@3 {
> > >                     name =3D "D"; /* Pair D */
> > >                     pins =3D <7 8>; /* Connector pins */
> > >                     phy-mapping =3D <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY
> > > connection only */ center-tap =3D "CT3"; /* Central tap identifier */
> > >                     /* No power connection to CT3 */
> > >                 };
> > >             };
> > >         }; =20

Couldn't we begin with something simple like the following and add all the
transformers and pairs information as you described later if the community =
feels
we need it?

mdis {

    /* 1000BaseT Port with Ethernet and PoE */
    mdi0: ethernet-mdi@0 {
        reg =3D <0>; /* Port index */
        label =3D "ETH0"; /* Physical label on the device */
        connector =3D "RJ45"; /* Connector type */
        supported-modes =3D <10BaseT 100BaseTX 1000BaseT>; /* Supported mod=
es */
        lanes =3D <2>;
        variant =3D "MDI-X"; /* MDI or MDI-X */
        pse =3D <&pse1>;
    };
};

We can also add led, thermal and fuse subnodes later.
Let's begin with something simple for the initial support, considering
that it has places for additional details in the future.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

