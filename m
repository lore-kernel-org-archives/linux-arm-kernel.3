Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1EDCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAHBggf+1OIf0Art4DtxmGcKB48+e1i/K9FRsCExzBY=; b=1b08dKKeXnfI+/CyATWUwe+8TI
	nyI0aStki9mfk1Gghf6yP3DV97FHQlFjah8zdm7NLwFfYHSgV4S0ZYT42JyqXBjGkos92UQ8WBc0T
	Uckg+fFuolDF5FTTYhm2eP71cP+Tw8TYDJqmtfqR9zYOiKH2x7uDjl6q/omL0PviktSv1NIPfpBnE
	R2thbrhFclc/oRlocqPkWKa4I9N/g2CZrgPlM0JVECtvLHvjxEwswq1i8Acj0PQEbElAeBfHKcDk8
	sKVnIAzUOE+IRZSkEHakN7bA6MY7Whgz2SMTq+YDogvOY/myAg6K2Yfld4pYLUqNKdqLj1+94+37/
	puk/3Y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fDi-00000005yxT-2YYY;
	Tue, 30 Sep 2025 18:37:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fDh-00000005yxG-0582;
	Tue, 30 Sep 2025 18:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04617611B6;
	Tue, 30 Sep 2025 18:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B043C4CEF0;
	Tue, 30 Sep 2025 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759257419;
	bh=b0DO6QcFb+m6/nmTuU5im+jk0/VqEOzpAugWjXSZukc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h05EiDDmLZSDnM4ZsKoHRYybhWLmI/4M+y4jhrTFRnfPn2fR3jfKFUGIbdnfOt0IZ
	 ntnrRwnMmfBmI1aYz5Tv/0EX7R8jpOlTpDy39jrWF6SJNRcXxaxzraBkqFHwDE93QF
	 tjZkzGGZDVs45y5PYryING89IycDANflyGsJfLEv8rzID5OO6JH7Q8suw4wTJEM6u7
	 rAyeVbUZRWpcVtXMyH5Vt5uTWrQzRelUU2VaLja5Ug1fHIBhY214G+w3VHsDO8WPrD
	 Pm6z+75SWrTqntdE/ZkEOAp4Kpr5ft5nkXJ1noJQs8FjllDmXwEp87HLYfEbXV5yQW
	 WRFCFtggsjHwQ==
Date: Tue, 30 Sep 2025 19:36:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangjie Song <guangjie.song@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>, kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: mediatek: Add clocks for MT8196
 mfgpll
Message-ID: <20250930-reconcile-apostle-64397f998a30@spud>
References: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
 <20250929-mtk-pll-rpm-v1-1-49541777878d@collabora.com>
 <20250929-whoops-kennel-5f54fb6559a8@spud>
 <3374975.aeNJFYEL58@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fZ4QstzZMSk1bYrw"
Content-Disposition: inline
In-Reply-To: <3374975.aeNJFYEL58@workhorse>
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


--fZ4QstzZMSk1bYrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 05:57:00PM +0200, Nicolas Frattaroli wrote:
> On Monday, 29 September 2025 19:31:36 Central European Summer Time Conor =
Dooley wrote:
> > On Mon, Sep 29, 2025 at 02:13:20PM +0200, Nicolas Frattaroli wrote:
> > > The clock controllers for mfgpll, mfgpll-sc0, and mfgpll-sc1 all need
> > > CLK_TOP_MFG_EB to be on if their clock control registers are touched =
in
> > > any way.
> > >=20
> > > This was not known at the time this binding was written, as this
> > > dependency only came to light when I started poking at the MFlexGraph=
ics
> > > hardware, where this undocumented peculiarity made itself known throu=
gh
> > > SErrors being thrown during register reads.
> > >=20
> > > Add a clocks property to the binding to describe this relationship, a=
nd
> > > mark it as required for the affected clocks.
> > >=20
> > > Fixes: dd240e95f1be ("dt-bindings: clock: mediatek: Describe MT8196 c=
lock controllers")
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  .../bindings/clock/mediatek,mt8196-sys-clock.yaml  | 28 ++++++++++++=
++++++++++
> > >  1 file changed, 28 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8196-=
sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sy=
s-clock.yaml
> > > index 660ab64f390d2e722b7d3e25cf057926da318bc0..41aacd8d5f69050eebdf8=
392f7b652427632f491 100644
> > > --- a/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clo=
ck.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clo=
ck.yaml
> > > @@ -45,6 +45,9 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > > =20
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > >    '#clock-cells':
> > >      const: 1
> > > =20
> > > @@ -90,6 +93,23 @@ required:
> > > =20
> > >  additionalProperties: false
> > > =20
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - mediatek,mt8196-mfgpll-pll-ctrl
> > > +              - mediatek,mt8196-mfgpll-sc0-pll-ctrl
> > > +              - mediatek,mt8196-mfgpll-sc1-pll-ctrl
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: mfg_eb clock
> > > +      required:
> > > +        - clocks
> >=20
> > Don't you want an else: properties: clocks: false here?
>=20
> Possibly. I'm never quite sure how strict bindings should be when
> it comes to stuff like this. On the one hand, none of the other
> compatibles described in it use any clocks that we know of
> right now.

It's a bit case-by-case I suppose, but anything that is invalid and can
be easily prevented should be. Particularly in cases where information
about what's correct is harder to find.

> On the other, if we have a second set of compatibles that also
> needs clocks, but in a different way, would we repeat that for
> each such if/then condition? Or would be reformulate this as
> some oneOf/anyOf construct specifically for the clock property?

Depends on what's simpler to do. Sometimes it's better to have if/then
on a per property basis and sometimes separate entries under the allOf
per platform is. Usually depends on how unique each platform is.

--fZ4QstzZMSk1bYrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwjRQAKCRB4tDGHoIJi
0k2bAQCjXXRncpKoMJR24/6cQoVfQTpI1s7ccTIPodjULJZPVwD/WV6udQlkMuX2
6ZxfAHeOTMBs515cJyWF94PA2GwEOAM=
=52m1
-----END PGP SIGNATURE-----

--fZ4QstzZMSk1bYrw--

