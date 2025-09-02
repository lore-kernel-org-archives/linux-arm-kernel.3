Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82FFCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihQ/kEsYupHNjL4SfYC2rugzOY+rXOm8PtF7e6MHoZA=; b=INyXUqPfnl11RnDv8DCT+qCZcQ
	JZB9d+5FAhxCs8oLkrWYYzHqXCzjrofJWRopvn4276eh7LtCKn2xUtAispgbP2Zu9gZzblUQ1FkW7
	gPyI6sVJVIqv8V5I2NAVrpTzVTCxOdM11ZwO8FnxIGKYcEpjFVEzEWm45FfT597QCCePnCYEvBopI
	pS8Y0+nCn0Zion4rVAp5nkxaeKgUj55aRK2E1AJqTKsYxp3FYxr9J+OYdW1hkNzqvql13gUF26lTF
	dhYW4IV19iug6FElh+4Ho9L7zJK7U+aumYp5tMGLhxe2WNbk+ISqwIfuwSLuoEjfaYebFR6GzN014
	jWMSZK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbcG-00000002pM7-2iDv;
	Wed, 03 Sep 2025 00:44:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWj8-00000001jSX-3El1;
	Tue, 02 Sep 2025 19:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 400AF444CD;
	Tue,  2 Sep 2025 19:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDCDC4CEED;
	Tue,  2 Sep 2025 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756841494;
	bh=F14nPORs8JdgFQl33HfGRKc+FkO94g/5nNmkQ7R1MBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFs/A14ma2YVWf6Xfo5kNA4paBdeW7hQYYdbujdC/+mCv7+Q5Se86rzNwGS6MwaiD
	 UVG3Q0qBHF38bpOg7jcYZRztAC2ZopUFHOVbZGmU0KSC8UUGldGv+XC0rsyc1UmsQ9
	 p8/0tlsdKvL4rMgNass/Y3Sdo9/tIzN2+43azvH4Yl/1XqWOsrYbDRENCmAd5sl2ap
	 1ERo9tzWZJzYwNgOpMfrlVq4zxtSNL6g6HGu7qv0L4+9/Sq/IpQ2c/tDAnBEF2hbtt
	 9SsLq0fQZD/Yec0fwRiovHKo4WJhrIMhBVnwvLJ4ipIyndd7jV3lyFXDR2gRrCbdj2
	 VTUYFM+98bPRA==
Date: Tue, 2 Sep 2025 20:31:28 +0100
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
Message-ID: <20250902-dastardly-truth-fb2be9f68e4a@spud>
References: <20250901-can-v4-0-e42b5fe2cf9e@nxp.com>
 <20250901-can-v4-1-e42b5fe2cf9e@nxp.com>
 <20250901-diligent-dreaded-59b9ad5c3976@spud>
 <20250901-uproar-shrill-07d51ea21a29@spud>
 <PAXPR04MB845991442136C0BEF0540D6A8806A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="emYz2NOh8U/FtcyF"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845991442136C0BEF0540D6A8806A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_123134_853794_675048F6 
X-CRM114-Status: GOOD (  39.81  )
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


--emYz2NOh8U/FtcyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 02:24:49AM +0000, Peng Fan wrote:
> Hi Conor,
>=20
> > Subject: Re: [PATCH v4 1/6] dt-bindings: phy: ti,tcan104x-can:
> > Document NXP TJA105X/1048
> >=20
> > On Mon, Sep 01, 2025 at 07:54:01PM +0100, Conor Dooley wrote:
> > > On Mon, Sep 01, 2025 at 11:18:11AM +0800, Peng Fan wrote:
> > > > The TJA105[1,7] is a high-speed CAN transceiver which is a
> > > > pin-compatible alternative for TI TCAN1043 with sleep mode
> > > > supported, and has a compatible programming model, therefore
> > use ti,tcan1043 as fallback compatible.
> > > >
> > > > The TJA1048 is a dual high-speed CAN transceiver with sleep mode
> > supported.
> > > >
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/phy/ti,tcan104x-can.yaml   | 30
> > ++++++++++++++++++++--
> > > >  1 file changed, 28 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > > > b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > > > index
> > > >
> > 4a8c3829d85d3c4a4963750d03567c1c345beb91..f8e0c24856a2ba83
> > b5c988b246
> > > > 464f47e11a032f 100644
> > > > --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > > > +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-
> > can.yaml
> > > > @@ -19,18 +19,25 @@ properties:
> > > >            - enum:
> > > >                - microchip,ata6561
> > > >            - const: ti,tcan1042
> > > > +      - items:
> > > > +          - enum:
> > > > +              - nxp,tja1051
> > > > +              - nxp,tja1057
> > > > +          - const: ti,tcan1043
> > > >        - enum:
> > > >            - ti,tcan1042
> > > >            - ti,tcan1043
> > > > +          - nxp,tja1048
> > > >            - nxp,tjr1443
> > > >
> > > >    '#phy-cells':
> > > > -    const: 0
> > > > +    enum: [0, 1]
> > > >
> > > >    standby-gpios:
> > > >      description:
> > > >        gpio node to toggle standby signal on transceiver
> > > > -    maxItems: 1
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > >
> > > You're adding a second standby gpio, which one is which?
> > > I assume you mean that item 1 is stbn1 and item 2 is stbn 2 for
> > tja1048.
>=20
> Yes. There are two standby pins.
>=20
> > > Might be kinda obvious, but I think it should be mentioned.
>=20
> I could update description as below.
> "
> description:
>   gpio node to toggle standby signal on transceiver. For two Items,
>   item 1 is for stbn1, item 2 is for stbn2.

Sure.

>=20
> > >
> > > tja105{1,7} don't have a standby gpio, but they do have a silent
> > mode.
>=20
> Right. Tja105{1,7} has a pin S for silent mode.
>=20
> > > silent mode seems fundamentally different to standby, since the
> > > receiver still works. Seems like that should be handled differently, =
no?
> >=20
> > The docs for standby mode for the tcan1043 don't match with the
> > tja1051, "Standby mode is a low power mode where the driver and
> > receiver are disabled," so does the fallback compatible even make
> > sense? Seems like a combination of enable and standby gpios are used
> > to put the tcan device into silent mode but the tja1051 has a pin for
> > that alone and seemingly does not support standby at all?
>=20
> Thanks for looking into the details. I also read more into the datasheet.
>=20
> Tcan1043:
> EN   nSTB
> H       H    ---> normal mode
> L        H   ---> slient mode
> H       L    ---> standby mode
> L        X    --->off mode
>=20
> TJA1051
> EN   S
> H     L   --> normal mode
> H     H  --> slient mode
> L      X  --> off mode
>=20
> Your analysis is correct. silent is different with standby,
> but we only wanna to use normal and off mode

In addition, it looks like there are some tja1051 devices that don't
even have the enable pin? Of the 4 SKUs, there are 2 that use pin5 as
Vio and 1 that has it n/c. Only the T/E device has an enable there.

> If we need to handle differently, I need
> to add a new optional property
>=20
> silent-gpios:
>   description:
>     gpio node to toggle silent signal on transceiver
>   minItems: 1

Ye, I think so. And probably add some if/then to use it instead of
standby on the relevant chips.

--emYz2NOh8U/FtcyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLdGEAAKCRB4tDGHoIJi
0mVdAQDC4R/uDobfYX0MlIc7P3VN7g19AM8wzxvWSJ27EwGhBgEA12JCMoHxPor9
peA9L92m9adGEyaiB2fIMSJnYILwrQM=
=7Ezu
-----END PGP SIGNATURE-----

--emYz2NOh8U/FtcyF--

