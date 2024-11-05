Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9D1D3177D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzDFNoa8uXjBwJNetcZxdtsnSmBcL5ndUXB6OA5dqlU=; b=dSRUI9z6TW6nCzTfURJ/9cVBC3
	DN/NHeNIg0lAmL+apRwncnIE40bM9F97Fz9xsyzzJQEKkyGkaMcl7CBs8RqB+2M8/VrLYkiizQlmD
	IZ4ipJKbbMtgX6OGrucnma1l6+MMQNJdovco5z7DC5tI1nJlk1J+4g3xtyzbgGbkPVOrc04d8LRgG
	xSMXzrH9IFsv0QeJweVEF010+FXESwPRiP4sdhyeRwErDI8GIDrh+vyXivmwNqg9TjZ5YAbRsu/zu
	gLEUC9keE/HTaOWfL+A3+5c4wNnW+uAjHJgFETJWiCLMKcNq5y3Apq/5KA5XYbMLA+3wV/Awd1Bbd
	RPByp2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O8d-00000000Lnt-3yKb;
	Tue, 05 Nov 2024 18:18:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O3x-00000000LAX-2Zmt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4FB5A43801;
	Tue,  5 Nov 2024 18:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75ADFC4CECF;
	Tue,  5 Nov 2024 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830436;
	bh=j/hVO0QTQ7lh4OLZKHXt9OfuNaNn7hMoHNsw5w3AxGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/Y+TCUd+UCPFyz/QmYOaNyOrEY1F37aPU3mTkW94gcgl6YKusgTFEavVQPhoeeIv
	 1g25+SjPc863n/03n17Q8U9+vubjmu/gxSHJ0FwrPO41zjM8FNNp/gP6dEqmG2n2er
	 9KW3n3/R4c6vJ6TiAAjCbiqNirR7q4OgkSP0BBfkg+Xvp50q9Z6R92N4hnJtltMI75
	 ssHBAEY7YDX0LcU08JrKl6NgWaUBPwVHaIqAiXKsce8YC8up4aOciVTBdIPAsHEtd2
	 AXxX75o5LueqSOLgkNBl21uKzU1/+LmOy1z8R6Upf1iga/VyFvU/LwZF8e2frzRNN+
	 REGnoAwCz4KmQ==
Date: Tue, 5 Nov 2024 18:13:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
Message-ID: <20241105-endearing-huddling-30728a002321@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
 <20241105-disarm-baggie-e2563299a24f@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h6DOoDpaBp8hRAn5"
Content-Disposition: inline
In-Reply-To: <20241105-disarm-baggie-e2563299a24f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_101357_825443_84530135 
X-CRM114-Status: GOOD (  20.09  )
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


--h6DOoDpaBp8hRAn5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 06:05:54PM +0000, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 03:58:09PM +0000, Matt Coster wrote:
> > The single existing GPU (AXE-1-16M) only requires a single power domain.
> > Subsequent patches will add support for BXS-4-64 MC1, which has two pow=
er
> > domains. Add infrastructure now to allow for this.
> >=20
> > Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> > ---
> >  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 ++++++++++++++=
+++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e81f=
24c4b93857f3e12fe 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -49,7 +49,16 @@ properties:
> >      maxItems: 1
> > =20
> >    power-domains:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  power-domain-names:
> > +    oneOf:
> > +      - items:
> > +          - const: a
> > +      - items:
> > +          - const: a
> > +          - const: b

Additionally, a & b? Are those actually the names for the power domains?

> > =20
> >  required:
> >    - compatible
> > @@ -57,10 +66,27 @@ required:
> >    - clocks
> >    - clock-names
> >    - interrupts
> > +  - power-domains
> > +  - power-domain-names
>=20
> A new required property is an ABI break. Please explain why this is
> acceptable in your commit message.
>=20
> > =20
> >  additionalProperties: false
> > =20
> >  allOf:
> > +  # Cores with a single power domain
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            anyOf:
> > +              - const: img,img-axe-1-16m
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          minItems: 1
> > +          maxItems: 1
> > +        power-domain-names:
> > +          items:
> > +            - const: a
> >    # Vendor integrations using a single clock domain
> >    - if:
> >        properties:
> > @@ -90,4 +116,5 @@ examples:
> >          clock-names =3D "core";
> >          interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> >          power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> > +        power-domain-names =3D "a";
> >      };
> >=20
> > --=20
> > 2.47.0
> >=20



--h6DOoDpaBp8hRAn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypgXgAKCRB4tDGHoIJi
0tmqAP9uwcomPx5whZkcSbKHa8dRJnwZZX53eRiq8F+FqIWxuAD6A6vFpCuNo4V0
stf8zberB2p7Bwefhwsl5aJGNmHl/QY=
=EWBb
-----END PGP SIGNATURE-----

--h6DOoDpaBp8hRAn5--

