Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DFD3177E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmANFjhu/Dz9om5RF+XUmAJstx59ZVZL8FwtylwZGDY=; b=XdCr8atDGbigs3mFbINlBUEF9f
	Dv6S3j6HH56vBEC9aadBLkZ6/Acwt9qNg1kb9ljdU4fwi7rRPG+mYoQDOieWG2Y9/wHKlLESy21cE
	82aCeooo9rv8UjQBbJ64H8XtvkNaaL8IxW/d8jVvZRSdsgtTvBrcXp48ec3xBl7Nd72w8V/2hdiwU
	XhIzgHNnvIn1sq3RwbZVmRgw8kknJZ7nw5zhSLYrqKgFhiXhrQ1Nx6TZxEBz54hzh9H1DxUirLsd+
	mmY2msch1RNQVcXXlh5SRYcmjuWP7NTBGlMsKKvzoL9AT62ZNj+YT+25kJLHmVOnKavf7hANOhAK9
	5df9/P4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OIj-00000000N7U-02SM;
	Tue, 05 Nov 2024 18:29:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O6o-00000000Lck-2iiL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 18:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FmANFjhu/Dz9om5RF+XUmAJstx59ZVZL8FwtylwZGDY=; b=Ap3wAHWQHYMMMt8C9pfoT2uZGZ
	PLLMY6geBq5UggkK9ZtdsdCNMEq2/zKRQg5TppElTjX2vUaL/shhS19/R3te5kXhNkhTJ3DpF+JGl
	/453JNY6MJe8yJvuceWWkkrshPjgImrhX+GtWR2t4JtbufW0eWfjabO0PDo81UL0t2XBJpug5HH2i
	iIG54RZ9ZR3k1M23GzOsoMXUkwrBwIVwPLLONCMNvjy/SboBHocETTa6XaGrw4P4jQPtZQi72aMa7
	KDCMWaWECHsMKkyEBtyC09KCYFr3Zrkoymz5JjnqP4erqQctItCZmQBuhcmvmmy7L/ik1zdq3NJJ6
	hOlGXxVg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O6l-0000000Bo7i-2rp0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B22215C53DF;
	Tue,  5 Nov 2024 18:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BA4C4CECF;
	Tue,  5 Nov 2024 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830602;
	bh=gxbmixww9e8I54+a85Lk0u6Qwx29iopkn1bwWVNFU5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHgQ8LjqxMiYEcG4CIthiY+qyb8BJdbl9bqOF8Vdv1Giz2jL4Qm+VprGqVquRtP11
	 csBm24NGhMOP9JX4x7Dm7bLaabuorAtEVqVAXySPJ2TTvMAtgvgaodmQA82oUpllaB
	 wuIZbJuGQcYZoEXft7YQ2osOP+9l9i4gK49e+YHxH+iYuBvEBNSYIhaAbKGLuF47Ti
	 SwkXgjjDYM64f5w1DsnZjNE/5Z5QAZ5kQRpPDinJ5HglGx9bPZgv/WZPR0ggoAPAJe
	 2Na7tgqYoQRtHFwnL1zdfmLBedKBXJi//RPvNNJNkbej5IWHuxpgZeXlfITLKBf1Ow
	 UgehZeMzcKlkw==
Date: Tue, 5 Nov 2024 18:16:36 +0000
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
Subject: Re: [PATCH 02/21] dt-bindings: gpu: img: Further constrain clocks
Message-ID: <20241105-blooper-unflawed-6181022944d9@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TeFaw0Jl+M7/bDvg"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_181652_040072_2F47FABD 
X-CRM114-Status: GOOD (  18.45  )
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


--TeFaw0Jl+M7/bDvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:08PM +0000, Matt Coster wrote:
> All Imagination GPUs use three clocks: core, mem and sys. All reasonably
> modern Imagination GPUs also support a single-clock mode where the SoC
> only hooks up core and the other two are derived internally. On GPUs which
> support this mode, it is the default and most commonly used integration.
>=20
> Codify this "1 or 3" constraint in our bindings and hang the specifics off
> the vendor compatible string to mirror the integration-time choice.
>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 27 +++++++++++++++-=
------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index ef7070daf213277d0190fe319e202fdc597337d4..6924831d3e9dd9b2b052ca8f9=
d7228ff25526532 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -30,15 +30,20 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    minItems: 1
> -    maxItems: 3
> +    oneOf:
> +      - minItems: 1
> +        maxItems: 1
> +      - minItems: 3
> +        maxItems: 3

Just put the outer constraints here and...

>    clock-names:
> -    items:
> -      - const: core
> -      - const: mem
> -      - const: sys
> -    minItems: 1
> +    oneOf:
> +      - items:
> +          - const: core
> +      - items:
> +          - const: core
> +          - const: mem
> +          - const: sys
> =20
>    interrupts:
>      maxItems: 1
> @@ -56,15 +61,21 @@ required:
>  additionalProperties: false
> =20
>  allOf:
> +  # Vendor integrations using a single clock domain
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: ti,am62-gpu
> +            anyOf:
> +              - const: ti,am62-gpu
>      then:
>        properties:
>          clocks:
> +          minItems: 1
>            maxItems: 1

=2E..adjust the constraints in conditional bits. Setting minItems to 1
should be a nop too. Pretty sure what you already had here was actually
already sufficient.

Cheers,
Conor.

> +        clock-names:
> +          items:
> +            - const: core
> =20
>  examples:
>    - |
>=20
> --=20
> 2.47.0
>=20

--TeFaw0Jl+M7/bDvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyphBAAKCRB4tDGHoIJi
0mt+AQCX5TGxUHLmqloLO4UQ2/Z5nICBf/HCL/Q8rZcVfo8ebAEAlFYu7OnzNesz
ZWwQOmVqab0lEHWZg2h1BTjxEg+tFwA=
=fITo
-----END PGP SIGNATURE-----

--TeFaw0Jl+M7/bDvg--

