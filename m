Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAC9E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5uq4PW9wrTvSgrbfTYLzSaeh2LuYKlH6oEw/KT9e74=; b=tGAtd5Gh+BNftyPq3nEuditrfB
	84QGqnau0D8w2Dqo8Ks9+r9UORCPLxvFzPaeJVFupVQgAU4e0hbgKLDcyA7zM+ssf7HbblWcL7moy
	hM/pFqkC/OHqtr3+aMVezGLSim33J65y2dIpz0y/eKVosoEdYpPV2xdzkuBiVYHCrQmiqglomtdc4
	vA9c2yZopPpNq4YH6iDaumV7LZRh4659W6XFWU4c9HBEWYbwrSmFx8eq2Moz1CpttCuFeZ0Qg3P0Z
	fvDYj3R9MjWlon7IMlv/ynC7UTYmDixOB/zmdNxnd4H5Uo5MdsgAKVbNl8GLxLSIs+O+VOTP2m0YG
	vfM22cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAuR-00000005IbV-0gQw;
	Tue, 07 Jan 2025 14:50:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAnU-00000005Gig-329Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:43:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E4D0FF805;
	Tue,  7 Jan 2025 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736260985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5uq4PW9wrTvSgrbfTYLzSaeh2LuYKlH6oEw/KT9e74=;
	b=ebOWH577A/9JaunDKYgh0KOM9UjJTC/gFEseIFKocB5C1haiwDg460GKE8QSn60/6fbRxz
	5VlADaY/j2v2/kFmoHmn46iOGA3ngb9vLqccWygDKk6gywsn8m/XtRefXjzlufaU0FEa6P
	GnSAP74nAxR44Cjjq3EzjSr2zTu+3ptu+xwc4G4mqtav5MMmaUqErZHCyFQh0/XdapwSaX
	veLmEhBKelHhW6qnlFbOuKIUcQeyTaebvr/8vaODUfqdyvgkbSSSfjL7hNQzCns5gM5Mnk
	lO3PHdvow1nmoI0pBLBBxDom1Jy9Df8s01o7UX0+qpuq2sQAZDwyRyFt7JtN9g==
Date: Tue, 7 Jan 2025 15:43:02 +0100
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
Message-ID: <20250107154302.628e7982@kmaincent-XPS-13-7390>
In-Reply-To: <Z300BuATJoVDc_4S@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
	<Z2g3b_t3KwMFozR8@pengutronix.de>
	<Z2hgbdeTXjqWKa14@pengutronix.de>
	<Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
	<Z3bG-B0E2l47znkE@pengutronix.de>
	<20250107142605.6c605eaf@kmaincent-XPS-13-7390>
	<Z300BuATJoVDc_4S@pengutronix.de>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_064309_021388_724AE912 
X-CRM114-Status: GOOD (  22.45  )
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

On Tue, 7 Jan 2025 15:02:46 +0100
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> On Tue, Jan 07, 2025 at 02:26:05PM +0100, Kory Maincent wrote:
> > On Thu, 2 Jan 2025 18:03:52 +0100
> > Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> >  =20
> > > On Thu, Jan 02, 2025 at 10:48:05AM +0000, Russell King (Oracle) wrote=
: =20
>  [...] =20
>  [...] =20
> >=20
> > Couldn't we begin with something simple like the following and add all =
the
> > transformers and pairs information as you described later if the commun=
ity
> > feels we need it?
> >=20
> > mdis {
> >=20
> >     /* 1000BaseT Port with Ethernet and PoE */
> >     mdi0: ethernet-mdi@0 {
> >         reg =3D <0>; /* Port index */
> >         label =3D "ETH0"; /* Physical label on the device */
> >         connector =3D "RJ45"; /* Connector type */
> >         supported-modes =3D <10BaseT 100BaseTX 1000BaseT>; /* Supported=
 modes
> > */ lanes =3D <2>;
> >         variant =3D "MDI-X"; /* MDI or MDI-X */
> >         pse =3D <&pse1>;
> >     };
> > }; =20
>=20
> The problematic properties are lanes and variants.
>=20
> Lanes seems to not provide any additional information which is not
> provided by the supported-modes.
>=20
> We have at least following working variants, which are supported by (some=
?)
> microchip PHYs:
> https://microchip.my.site.com/s/article/1000Base-T-Differential-Pair-Swap=
ping
> For swapping A and B pairs, we may use MDI/MDI-X. What is about swapped
> C and D pairs?
>=20
> The IEEE 802.3 - 2022 has following variants:
> 14.5.2 Crossover function - only A<>B swap is supported
> 40.4.4 Automatic MDI/MDI-X Configuration - only A<>B swap is supported?
> 55.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> 113.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
> 126.4.4 Automatic MDI/MDI-X configuration - 4 swap variants are supported
>=20
> This was only the pair swap. How to reflect the polarity swap withing
> the pairs?

Indeed I see what you mean. Maybe we could add it later as optional binding=
 and
only focus for now on the current needs.
According to Maxime proposition he wants the connector types and the
supported modes (or number of lanes). On my side I am interested in the PSE
phandle.

We could begin with this:
mdis {
    /* 1000BaseT Port with Ethernet and PoE */
    mdi0: ethernet-mdi@0 {
        reg =3D <0>; /* Port index */
        label =3D "ETH0"; /* Physical label on the device */
        connector =3D "RJ45"; /* Connector type */
        supported-modes =3D <10BaseT 100BaseTX 1000BaseT>; /* Supported mod=
es */
        pse =3D <&pse1>;
    };
}; =20

Your proposition will stay in our mind for future development on the subjec=
t.
I think we currently don't have enough time available to develop the full
package.
What do you think?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

