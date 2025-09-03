Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0A5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQn5pMPl9146x+c9350KeXdmTI+fqcTGbQQZZ2L9FUA=; b=cv9Vu8E/5F5jRL+abd0/nWtIAK
	EkDRxLpSYoy5eC5BwIhJNKalsvbtulF/+UYRP7fcZwP+ha0IzyD4WCLIcBQhUhCepRZdvvZsofzf1
	nkaMkeNsm0R//vlBGcbfBjdnLhZeAYSIPwESxsg+eCvQo/lTonveO6WkoL0LSfsx2fmkQMimn4WpX
	Jg3FaTt+G+9N7xBOFUCtytewFNisuHnO84vXbM/V7n05rI9NsKNoDGBPkZgosA7s0Wnj6rF3w8VDT
	PJ8N3Ljx/stLl3SmnOagUQazHfDaO9bfWgMc6a0G2+RIp2E/1eitT1uV7wCIyNKaGC7fDxeQOU4/6
	wMcufdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturm-00000007dVc-2noV;
	Wed, 03 Sep 2025 21:18:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqJ7-000000073m8-44mZ;
	Wed, 03 Sep 2025 16:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6234E60248;
	Wed,  3 Sep 2025 16:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C3CC4CEF4;
	Wed,  3 Sep 2025 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756916761;
	bh=BDjIUd2kVTCwm9T6bUGQ8NdZz69FUdPuVZPsHBAlutY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLud6noUZebhHPdVOSQahlEVZJFRIn034FaEZXbQAAYwcplOxVvFyrickxAmWN6R5
	 rnIJM4qvtlIh/GWu4Iz2cB11IkV/cHpCZcdDW71Rch+bF7K4cJQWnkJRuSRXaWn/j+
	 va/2fRf4OMKmJv0ZqZEFrrc7z8YDTDNPxXGN2+ZfZ/QfnZSchP19vNi4JcYUmGZE/a
	 v2D7+Ay4myy1WbHd1jlihyF05zlDOGhqnCp9kaji+Py2AyZb5byWe144MJxAHHae2s
	 ptZB7ly3pks1C9gKCF8y6hAwdv6T8FZqkpWN9y6pZGv+mXgnVEsmNktcap6fttUClv
	 tygPeAeBS+ecg==
Date: Wed, 3 Sep 2025 17:25:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Bough Chen <haibo.chen@nxp.com>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA105X/1048
Message-ID: <20250903-subwoofer-anyone-bc7aa007927a@spud>
References: <20250901-can-v4-0-e42b5fe2cf9e@nxp.com>
 <20250901-can-v4-1-e42b5fe2cf9e@nxp.com>
 <20250901-diligent-dreaded-59b9ad5c3976@spud>
 <20250901-uproar-shrill-07d51ea21a29@spud>
 <PAXPR04MB845991442136C0BEF0540D6A8806A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250902-dastardly-truth-fb2be9f68e4a@spud>
 <PAXPR04MB8459F58B1FCF532F0DE802438801A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB845903CF3D03A436925150238801A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kpMiHlovSVn8VNfU"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845903CF3D03A436925150238801A@PAXPR04MB8459.eurprd04.prod.outlook.com>
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


--kpMiHlovSVn8VNfU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 03, 2025 at 06:49:47AM +0000, Peng Fan wrote:
> > Subject: RE: [PATCH v4 1/6] dt-bindings: phy: ti,tcan104x-can:
> > Document NXP TJA105X/1048
> >=20
> ...
> >=20
> > Thanks again for the detailed reading into datasheet.
> >=20
> > Yes. But I would like to only keep one compatible "nxp,tja1051" from a
> > board design level, EN could be always tied to high for TJA1051T/E. So
> > to dt-binding, EN it is optional for all TJA1051 variants.
> >=20
> > I am thinking to use below compatible in V4 for the devices added in
> > this patch. Does this look good to you?
> >=20
> >       - items:
> >           - const: nxp,tja1057
> >           - const: nxp,tja1051
> >       - enum:
> >           ....
> >           - nxp,tja1048
> >           - nxp,tja1051
>=20
> Considering TJA1057 does not have EN, I may need to use:
>       - enum:                                                            =
                          =20
>           ....
>           - nxp,tja1048                                                  =
                          =20
>           - nxp,tja1051                                                  =
                          =20
>           - nxp,tja1057                                                  =
                          =20
>          ....

Seems reasonable to me, go for it.

--kpMiHlovSVn8VNfU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLhsEgAKCRB4tDGHoIJi
0nj8AP9rGJfvEe4zLkBt1ZJjQLFKT1/3vKVWjJX3TBZo83gmxwD/RtmQzj11THLq
lOmFaI/VUQJB0FLk3mi7pCWUeLs+sw8=
=4zb4
-----END PGP SIGNATURE-----

--kpMiHlovSVn8VNfU--

