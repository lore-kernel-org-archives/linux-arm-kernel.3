Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF2FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+81GJ2Ed5kEguiInJKiepzHO9GSn8dLtYS8lNL93dKc=; b=pkbGOh1rSIhWo8Wo+AnjADL5c9
	KgaKbRTos5QLtTAqMsVDKyqbNXJuOWNt1WqzLFENvL+4pT3BuhWzdI3WUcXZowJQPLG/HuvzRX9mA
	Bmt3CLbehe4bNhazwr6HkzoRkRn2y+trzOd16l4Fv1/7YSn0FsQpoYqXhkXhmCj1nkcRX/dkE4rN9
	JVjowvNAl2lJKQquqibRGHkWBtqrzMguX74A8RevQ9OgkJ5lLRfix8PxZa0VeSjcdMOlYXMRP3WWK
	Lq9uWEH2vB5e3Q5pY8oHRkNyMJkO+hfoL715AY5Ph0GWyMKbdLySkvzm9xnlKlP8HXXc1KcgrXMI0
	p4bWqQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvD6-00000004t1t-1GmP;
	Tue, 11 Feb 2025 18:42:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thv1p-00000004qlg-2Gyn;
	Tue, 11 Feb 2025 18:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+81GJ2Ed5kEguiInJKiepzHO9GSn8dLtYS8lNL93dKc=; b=nBkvSj70UI3gVuMe4oRYyKQvpg
	aAwk66xqmQflX6iB7Oetn2SMefuFJVqdIqenPvotXvohLZv0SRdo+8WBz3M1ouJdgK30EGIiesoFu
	DCYKwR1008twCxfXCxmyRdcMsZnfLsi5DIVDv9OO3zwU7owymfwh8TDV/0T0WNt1t+Y0vh2LzbuwB
	0fF2oC8dTaoyetAieNA2SDcD3HQYGJlPkBhrjVz1Hb5s0r3YwBKRrd5F9eV91rdpCuKPVZZvivmhb
	OoANAKT54DpybGglU45R0UiyLO9U/5vhyOgeiRF60IR0rps7eBwNm7VemIWta8v1UWEj5c2YRqdPD
	AyO878Aw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thv1m-00000000g8n-2gbg;
	Tue, 11 Feb 2025 18:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 666A95C4D7F;
	Tue, 11 Feb 2025 18:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F90C4CEDD;
	Tue, 11 Feb 2025 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298632;
	bh=MXkpdxUrKwlNGyhfGqjpT3gM++JqSC+ekFB+wz6S6C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCyHpRREJtOY2Tvjhmv03vG4+reEXqTnt+Z16GX1SfqS0MjxOwCo1EkI7LsyZe667
	 yI9on/ejRJGqty+zjK9W38REK0RkwwpIRuQCIMMu6VGuc7I6Sxdor9CL8VJA9sQSfP
	 hfqIGAk+U6UY8++83IseOi+KOi6orwI9zC5TEWJ4IV/KxoyZtizGTzuofkrl2/UHl+
	 9EzKiewIdemBesCWREr8SU6FJWyoQgcHnhUIsC3VfdrS9uL/ckmRjak7S4HIkz0wIN
	 kToARy9Bzz1GXAlbUO7Ubvq1yuhDW3JxiOMRQ5HoRrVzJomx/qY8WCJS2yFDlKE22U
	 L8GFUoMbB1QzA==
Date: Tue, 11 Feb 2025 18:30:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add
 property to set disconnect threshold
Message-ID: <20250211-destiny-crablike-ab17a2814b7a@spud>
References: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
 <20250113-aerobics-tall-e570d8bbcf2c@spud>
 <e61b61574bd58c1bbc0648257fb4ab23ed582de0.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EJv8ebh2m2tBBLDa"
Content-Disposition: inline
In-Reply-To: <e61b61574bd58c1bbc0648257fb4ab23ed582de0.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_183035_014843_90BC83E8 
X-CRM114-Status: GOOD (  20.15  )
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


--EJv8ebh2m2tBBLDa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2025 at 03:34:12AM +0000, Chunfeng Yun (=E4=BA=91=E6=98=A5=
=E5=B3=B0) wrote:
> On Mon, 2025-01-13 at 18:30 +0000, Conor Dooley wrote:
> > On Sat, Jan 11, 2025 at 10:15:41PM +0800, Chunfeng Yun wrote:
> > > Add a property to tune usb2 phy's disconnect threshold.
> > > And add a compatible for mt8196.
> > >=20
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > > based on kernel 6.13-rc1
> > >=20
> > > this property is porting from t-phy driver, due to the u2 phy are
> > > similar.
> > > ---
> > >  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 8
> > > ++++++++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > index a9e3139fd421..2e012d5e1da1 100644
> > > --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > @@ -49,6 +49,7 @@ properties:
> > >        - enum:
> > >            - mediatek,mt3611-xsphy
> > >            - mediatek,mt3612-xsphy
> > > +          - mediatek,mt8196-xsphy
> > >        - const: mediatek,xsphy
> > > =20
> > >    reg:
> > > @@ -129,6 +130,13 @@ patternProperties:
> > >          minimum: 1
> > >          maximum: 7
> > > =20
> > > +      mediatek,discth:

Just make it "disconnect-threshold" please.

> > > +        description:
> > > +          The selection of disconnect threshold (U2 phy)
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 1
> > > +        maximum: 15
> >=20
> > What unit is this? Unitless? How are the values determined?
> No unit, it's a level, may be treat it as an index to select different
> threshold.

So this is a register value of some sort? What is the actual threshold
measured in?

--EJv8ebh2m2tBBLDa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uXRAAKCRB4tDGHoIJi
0tleAQCvurEiAzM1BdOVDJ9+251emEMUXx+UXepVHn6w3KdPIgD+I1IyvZElSdMC
2wI8UZTiXnHTsxxuyayinbiJi5M2LwM=
=2LgZ
-----END PGP SIGNATURE-----

--EJv8ebh2m2tBBLDa--

