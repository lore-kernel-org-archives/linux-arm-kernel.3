Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C401CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylz1oiPhtoKBMsOdw8S6ulCdAQFgME1WIIPYHlvBdSc=; b=bokemN5lbA7fHwTzcTpHMnntJQ
	NTf9QxnXK5Ka/oGjrsbj/C0jnAWeJf4HwnU3xFhaIcRZtglNCZK0glplSYWh+o0mzSteITM935FB6
	MX5opWPD5Ol2YaRW9DRJMbNTG/ZNVlBBjOeVclCOQWhWhqmv/0Zxds/xe/qW/GXsbnkun4E1+YOEt
	EhvQ8G7brmYywvVYnvSKQK9lBR7V0ima8kEtuhKcGQii7FYCfmdVqy+rB6r+nOBV3qm/8X/+tRewF
	pBQr44f7NvYnhv5fijr7XxUCVhSxvMypg47k/uGlaGKT7spHGnZqahC3o7BZOZlOdKQsjVTxNkEyN
	rq2hoMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTaA-0000000EE09-178A;
	Mon, 11 May 2026 16:34:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTa8-0000000EDzo-47td
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 16:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ylz1oiPhtoKBMsOdw8S6ulCdAQFgME1WIIPYHlvBdSc=; b=g+o7YkTKxljGRoLtLBbarxOkax
	zv/A2S2XqO4lj2yK3ymopBjwOy6YH8aZ9PZEicAUNLPFPrQjhKtqwSOqgOvTSjGGZh55ZLa9X4OIS
	N14KvWpktwtWaQ7sauQa+h6TNmnyWVu7E40ob6NR4BGQw6WLDjipVAld4VCkYVfSQBytSdTXeR9fZ
	eWiOE6ia9uhtHO9ucGj4IT/upsffH4kauR0Hv7KjZ5g2ElBJe/NtYyXlgbEN/9bZojimpIUhzAzQ1
	dzRj3Ac8HclNHVwBMVD6UBVYhDxzWz83ILHnpYkbyIrf2/vcNyH0flZ8huj4QOiRvw6Ksl7VZFuZz
	4dhGWWdg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTa5-0000000CLSH-22rk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 366684172B;
	Mon, 11 May 2026 16:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B37C2BCC9;
	Mon, 11 May 2026 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517248;
	bh=ylz1oiPhtoKBMsOdw8S6ulCdAQFgME1WIIPYHlvBdSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYG9YS7MrteGT1RlB+bEstA5kHW0D78F1ldj3UaIvplq6TQClpeMn0K2VYwKHXVHF
	 IAoPbUL0/LvPty3d7DovyKMpScfya3e91/n9wQozdm8cwho2urIakok9xyHFrIhwfr
	 r9EyuYAkCUuGvwnxhKsGNwkB/g2WWtJiUY7ImkAYptjlw9IXqT/dZ3cMv4irGDAAzi
	 VvoS+luWIZ4NPIcVF1KQ2wA/42/5lhYI/+5SPutWYuITyNhJKjbVHjbYoAn/RKgtHN
	 XgFlm9TNo6KfYRST9RSl7A8oTGDBP8rmdwv82mKmNysSZMR4frumDULvhzL3Vj8YqC
	 vuHbXaKpMRDxQ==
Date: Mon, 11 May 2026 17:34:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
Message-ID: <20260511-startup-subside-343d9f8352f4@spud>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
 <20260511-stock-elitism-f1f703bee1a3@spud>
 <d51ab76d9f658aad542fa24651d1083e31628038.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cB4Di8dSFm0cWmlk"
Content-Disposition: inline
In-Reply-To: <d51ab76d9f658aad542fa24651d1083e31628038.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_173410_138715_E5DA5AB9 
X-CRM114-Status: GOOD (  24.92  )
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


--cB4Di8dSFm0cWmlk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 06:18:22PM +0200, Alexander Sverdlin wrote:
> Hi Conor,
>=20
> On Mon, 2026-05-11 at 17:08 +0100, Conor Dooley wrote:
> > > Baijie HelperBoard A133 is a development board around their A133 Core
> > > board. Introduce a compatible for both the Core and the development
> > > boards.
> > >=20
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > ---
> > >=20
> > > Changelog:
> > > v2:
> > > - introduced baijie,helper-a133-core compatible for the Core (SoM) bo=
ard
> > >=20
> > > =A0 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
> > > =A0 1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Docum=
entation/devicetree/bindings/arm/sunxi.yaml
> > > index e6443c266fa1..d7b9dec81165 100644
> > > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > @@ -96,6 +96,17 @@ properties:
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,ba10-tvbox
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,sun4i-a10
> > > =A0=20


> > > +
> > > +=A0=A0=A0=A0=A0 - description: HelperBoardA133 Core
> > > +=A0=A0=A0=A0=A0=A0=A0 items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: baijie,helper-a133-core
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,sun50i-a100
> >=20
> > Does this make sense? Can the core board be used without a carrier?
>=20
> such operation would be impractical at least, that's why in my v1
> Core board didn't have its own compatible. Maybe I didn't understand
> you correctly.

I just wanted a comaptible for the SoM, so that there's a common
compatible for that if it ends up on another carrier. IIRC these Baijie
folks had another one on their site, but may be misremembering.

>=20
> Shall I drop the above 4 lines, the compatible property from the
> root in sun50i-a133-baije-core.dtsi and only leave
> sun50i-a133-baijie-helper.dtb with 3-strings compatible as it is
> now in v2?

> > > +=A0=A0=A0=A0=A0 - description: Baijie Helper A133
> > > +=A0=A0=A0=A0=A0=A0=A0 items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: baijie,helper-a133
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: baijie,helper-a133-core
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,sun50i-a100

What I wanted was just this, so trim it down to that and you can add
my Acked-by: Conor Dooley <conor.dooley@microchip.com>

~heers,
Conor.


--cB4Di8dSFm0cWmlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIE+wAKCRB4tDGHoIJi
0nBNAPwK8Yq4uL0Ra+sraV5A47KnNc4KNwG1tD3MeAzxtUaewQD/RU96WmYb98VU
UBY0rtr749FM3A1Lq53tW1kpdCSISAA=
=MFgT
-----END PGP SIGNATURE-----

--cB4Di8dSFm0cWmlk--

