Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A165C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xrB5T2U//WugoFqCLMTlI0Odg7nrVEQz34wLoa8ML4=; b=vpinGWK7kcD7rc4+eGphMmiK/z
	mpqZKYKna7EEcmJK5JGVwlIzTsHsB5lcKXXx9e/LtLI+uxe7sll9cOi2s2qFAXo2atLQVKsortCps
	BAYizTLnfuJ/VZuR1CsfjLVa9ShLnNaF6ZO5B8MPfrXGcADAR9DxJnvuFH7FCaSNSM7bnOYMz1ide
	RBDrmOF5MfbSIGzh52g7gu0qRdOuU3crQaQKM6E8e57QJEuJAbbxqbkC7sI5TeuwTXxCtshSGa24B
	iOgQJ2vCGBZeOJx0f6IjDHxDx6dMv5Z7GVlKlzCFKZABu0Xqb694FqFXco/G9/UyfKcB84VcJr5u3
	o5Ziq2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflAZ-00000004QWR-249E;
	Wed, 05 Feb 2025 19:34:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl9B-00000004QCf-0y7Z;
	Wed, 05 Feb 2025 19:33:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4B035C5D20;
	Wed,  5 Feb 2025 19:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9931DC4CED1;
	Wed,  5 Feb 2025 19:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738783996;
	bh=B/kqz7BMCRcXcNkULlXWbe8rQqpjmskiXpQUTOkxG2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0LatF6SvEfeeYJE9BNmmmeizE1IeFzFC658QJrATwfK6HNFvVLtJrAkMQtMMNUTj
	 okszOcVt1KpVOzZieCzo1NLZRZflHzBEm2hCN4KoYXqhRSDywgacluxdY7BMG5db3x
	 EteR5UMxvyv3meUlTb+w/IxDbB+Dj/eO5qHxpvLYsEGTgLwsgYIa9O7r0ymes11/2r
	 /ceQUFUrMPdni1DrgeYEGvQQ/f9YSwBCaVz0r7y9OEwT7A5hWkASoGSzEAJcMXQ1PO
	 4E7IgS/cU0UERNM5gFeBk2mPdGvROfdLIox5FUZ76UkNhPj3qJTgYRFHAQbp2nadRb
	 vQmPlv5stGGBw==
Date: Wed, 5 Feb 2025 20:33:13 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 09/13] dt-bindings: net: airoha: Add airoha,npu
 phandle property
Message-ID: <Z6O8-dUrLNmvnW1u@lore-desk>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OLRYiDtnqR+Ktbpf"
Content-Disposition: inline
In-Reply-To: <20250205-cleaver-evaluator-648c8f0b99bb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_113317_356508_3345203C 
X-CRM114-Status: GOOD (  20.06  )
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


--OLRYiDtnqR+Ktbpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> > Introduce the airoha,npu property for the npu syscon node available on
> > EN7581 SoC. The airoha Network Processor Unit (NPU) is used to offload
> > network traffic forwarded between Packet Switch Engine (PSE) ports.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8 +++++=
+++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a20230b0c=
4e58534aa61f984da 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > @@ -63,6 +63,12 @@ properties:
> >    "#size-cells":
> >      const: 0
> > =20
> > +  airoha,npu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the syscon node used to configure the NPU module
> > +      used for traffic offloading.
>=20
> Why do you need a phandle for this, instead of a lookup by compatible?
> Do you have multiple instances of this ethernet controller on the
> device, that each need to look up a different npu?

actually not, but looking up via the compatible string has been naked by
Krzysztof on a different series [0].

Regards,
Lorenzo

[0] https://patchwork.kernel.org/project/linux-pci/patch/20250115-en7581-pc=
ie-pbus-csr-v1-2-40d8fcb9360f@kernel.org/

>=20
> > +
> >  patternProperties:
> >    "^ethernet@[1-4]$":
> >      type: object
> > @@ -132,6 +138,8 @@ examples:
> >                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> >                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> > =20
> > +        airoha,npu =3D <&npu>;
> > +
> >          #address-cells =3D <1>;
> >          #size-cells =3D <0>;
> > =20
> >=20
> > --=20
> > 2.48.1
> >=20



--OLRYiDtnqR+Ktbpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6O8+QAKCRA6cBh0uS2t
rBuDAQC8IfaonQoR+OsBNVLR3QqRP2V9u+fgOgmLkd8nLqxJXgD+LlNv2zJCpRM4
mPz3craYS9w8t05bFQju9tmeKJ0FSQ4=
=7CSn
-----END PGP SIGNATURE-----

--OLRYiDtnqR+Ktbpf--

