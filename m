Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08990CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q11AWL/EPY/BIfVce6hC9e0RarRTo3nH7wZFJBgkAFk=; b=QT8tIH6Aakz8m9bi/UB2LU/SoF
	ShNv5EU1Ex10Hf3gGKmNg6hdyQeD2zpVb85zMALgPHM5A1awxs7DlZqsB5EA7QulVpkTejyl9lm1j
	CCfQQgvwjBGt9qeJBNyMAgIcWWZI7nZETCew+pFHcyoG2AOZHQJsjFrXucW/E2pvdLuhSZXsPdnxC
	iT3Xv/MZzIxnkpUV4IbGrreXu+PZhc8mRwa/koZcPuZ9BEg8hoLay4H0Vz1t5rKCN4nwJt9hmVyqN
	eKiC14uroSRZ7c0wFZlh+PRM9wSIZS/vk6Og7kQ7JrW4YWd3NLxwlDjAw+hwOqUkVSI7HM/3ncCBZ
	LBz5+8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESDu-00000002ZfK-25rp;
	Wed, 07 Oct 2026 14:02:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESDq-00000002Zew-1Eds
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:02:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2CD0601FF;
	Wed,  7 Oct 2026 14:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF1D1F0089B;
	Wed,  7 Oct 2026 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791381735;
	bh=Q11AWL/EPY/BIfVce6hC9e0RarRTo3nH7wZFJBgkAFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dh+P1RXbYlDFbGN3suBP/RDNbylH2oJ6Gms2EMXYldoKY8E2nHzwHiFnEwdYs6W3l
	 rzCIRKZL/2iqcKybG7RD0BwtEi/bq4DmkfqpcAlZLB4mbuYfEh1ZsU4gy05P5HOT2n
	 NEY87qUfazr66eAYIt7kTX9znV4y6r4PtvY4BI1JE89teABSvP1yUye/8tBRlOKBS4
	 zZ6QUo1bMqC7W/yvoZBKYDESwwmOVG8MQ6pnl/OjjxSxUYzvDH1LE7XN8/GU2GPNeS
	 UcWsvKy6I+qmBNhd7oOvK5R+fgRjy1CWFelgmxhdKOuPc2onZzPCJxW8jy4vQhJ50K
	 TiZM7D5W804PA==
Date: Wed, 7 Oct 2026 15:02:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb
 child node
Message-ID: <20261007-ebaeee3a3bbd50ebbdedcf72@squawk>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-6-bcfb28de0aae@oss.nxp.com>
 <20261007-cb2d638508f306f3385c3799@squawk>
 <jr7zy2oxsuzfjrp4d74tl6gxiz5kg3pxl4qgigbbmtzyvjliwp@xaidoy4qvrdh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qfYFC1F6QFYmGCHK"
Content-Disposition: inline
In-Reply-To: <jr7zy2oxsuzfjrp4d74tl6gxiz5kg3pxl4qgigbbmtzyvjliwp@xaidoy4qvrdh>
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

--qfYFC1F6QFYmGCHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 04:57:45PM +0300, Laurentiu Palcu wrote:
> Hi Conor,
>=20
> On Wed, Oct 07, 2026 at 02:12:52PM +0100, Conor Dooley wrote:
> > On Tue, Oct 06, 2026 at 12:22:01PM +0000, Laurentiu Palcu wrote:
> > > Since the BLK CTL registers, like the LVDS CSR, can be used to contro=
l the
> > > LVDS Display Bridge controllers, add 'ldb' child node to handle
> > > these use cases.
> > >=20
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > ---
> > >  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 24 ++++++++++++=
+++++++++-
> > >  1 file changed, 23 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ct=
l.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > index fbbf1b3f17904..97fe816a38f94 100644
> > > --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > @@ -51,6 +51,10 @@ patternProperties:
> > >      $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> > >      unevaluatedProperties: false
> > > =20
> > > +  '^ldb@[0-9a-f]+$':
> > > +    type: object
> > > +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> >=20
> > The class of device is bridge, why not use that here?
>=20
> I'm sorry, your question is a bit vague... Are you referring to renaming
> the pattern to '^bridge@[0-9a-f]+$'? If yes, I don't have strong
> opinions against it. I can do it in the next iteration.

Yes, sorry.
That'd be great.

Thanks,
Conor.

pw-bot: changes-requested


--qfYFC1F6QFYmGCHK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasZQ4AAKCRB4tDGHoIJi
0vtMAP9BAzbT8CNXcasaaU+K6qO6MCMdqQyLCatmAZpSK81yRwEAudTtBZWLd7cb
w3GYYsCuwheg3bZe3nqy+OpPtql79AY=
=kp1o
-----END PGP SIGNATURE-----

--qfYFC1F6QFYmGCHK--

