Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3409C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7X0JA6NPBtK7B5WV1GuX974vQAg7xKQrzlRa97f86dM=; b=LGuw58nVx9/2lFQJGIy/MDyvoP
	0xNDWbJnp0D+iil9thVwoKAIhzuTQhEjHgbc4W8tDjTYWUuwZ9w9BVpualydWKaLccpOjIEhnFvkv
	uOY/X9LZy8LyTDjdE0IzfOBrAYfbhg2PxxFoBGXTuCE6/0c4B8enUzRrU2igFuA7KqZCXcHgUaTC9
	RhPmLr/I2X8o0lF7FSgiXO4urGV5KFkPn3qE+wi7bKbi6hxz75DJiBf7h0r6lisY6Z/uYOhysNw0h
	kzWiPjWXLZmxUGhYbhWvQSBRw7dxsB9oUm2SN76SkPHqBgra/wgMGeuIJSNvH6ih/Fugb4s/P5hEm
	vQnh7a7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCIU-00000007Yd1-3VXI;
	Wed, 29 Jan 2025 17:56:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCGK-00000007YPz-3HVx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26D76A407BF;
	Wed, 29 Jan 2025 17:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454BFC4CED1;
	Wed, 29 Jan 2025 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738173243;
	bh=Zyf2Hutc5cy0T89YVPvTglk6LxkQN6P68b7+zGZ837w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BU+nGcuTtFSX63zvw1OdWg01bkYPv85CIq9lThHNzW8t3mpk5pTpn0NqgjviFTmRG
	 9uVfhz8se45xyyaEoJqxNWNjKuRHlArPi8QK/gm8W4zzZRChSe5OMBBJs4YmF6Xk01
	 sPPyyCDIlHHO8uk0UwfddpjuVyJA/DKOtpq6iajj1opHiHc44poT3PnxtTO9Wvohzn
	 lL6dN2TRIQYh2GV3Uk1SIrsvbOp91L6c7FJTLx3O2QtGJ7nQ+mVSh+Ti7kAb9zQvj2
	 Q4jA3SJG9OJICbc50j21pWb8Of7cSotac9oTJ3OYI880BfnboqeSHWj3FWLzUXsC/j
	 HDAusBlf+F/iw==
Date: Wed, 29 Jan 2025 17:53:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	christophe.kerello@foss.st.com
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI controller
Message-ID: <20250129-feminize-spotlight-2cee53f8b463@spud>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
 <e3d01bce-a7d4-4690-8a2f-3bbb1ee5ccb7@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="klBchq5Iv61GqXw7"
Content-Disposition: inline
In-Reply-To: <e3d01bce-a7d4-4690-8a2f-3bbb1ee5ccb7@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_095404_954395_5F51C310 
X-CRM114-Status: GOOD (  26.65  )
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


--klBchq5Iv61GqXw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 06:40:23PM +0100, Patrice CHOTARD wrote:
> On 1/28/25 19:02, Conor Dooley wrote:
> > On Tue, Jan 28, 2025 at 09:17:23AM +0100, patrice.chotard@foss.st.com w=
rote:
> >> +  memory-region:
> >> +    maxItems: 1
> >=20
> > Whatever about not having descriptions for clocks or reg when there's
> > only one, I think a memory region should be explained.
>=20
> ok i will add :
>=20
>     description: |

The | isn't needed here.

>       Memory region to be used for memory-map read access.

I don't think that's a good explanation, sorry. Why's a memory-region
required for read access?

> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    items:
> >> +      - description: phandle to OSPI block reset
> >> +      - description: phandle to delay block reset
> >> +
> >> +  dmas:
> >> +    maxItems: 2
> >> +
> >> +  dma-names:
> >> +    items:
> >> +      - const: tx
> >> +      - const: rx
> >> +
> >> +  st,syscfg-dlyb:
> >> +    description: phandle to syscon block
> >> +      Use to set the OSPI delay block within syscon to
> >> +      tune the phase of the RX sampling clock (or DQS) in order
> >> +      to sample the data in their valid window and to
> >> +      tune the phase of the TX launch clock in order to meet setup
> >> +      and hold constraints of TX signals versus the memory clock.
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >=20
> > Why do you need a phandle here? I assume looking up by compatible ain't
> > possible because you have multiple controllers on the SoC? Also, I don't
>=20
> Yes, we got 2 OCTOSPI controller, each of them have a dedicated delay blo=
ck
>  syscfg register.

:+1:=20

> > think your copy-paste "phandle to" stuff here is accurate:
> >       st,syscfg-dlyb =3D <&syscfg 0x1000>;
> > There's an offset here that you don't mention in your description.
>=20
> I will add it as following:
>=20
>   st,syscfg-dlyb:
>     description:
>       Use to set the OSPI delay block within syscon to
>       tune the phase of the RX sampling clock (or DQS) in order
>       to sample the data in their valid window and to
>       tune the phase of the TX launch clock in order to meet setup
>       and hold constraints of TX signals versus the memory clock.
>     $ref: /schemas/types.yaml#/definitions/phandle-array
>     items:
>       - description: phandle to syscfg
>       - description: register offset within syscfg

:+1:

> >> +  access-controllers:
> >> +    description: phandle to the rifsc device to check access right
> >> +      and in some cases, an additional phandle to the rcc device for
> >> +      secure clock control
> >=20
> > This should be described using items rather than a free-form list.
>=20
>   access-controllers:
>     description: phandle to the rifsc device to check access right
>       and in some cases, an additional phandle to the rcc device for
>       secure clock control
>     items:
>       - description: phandle to bus controller or to clock controller
>       - description: access controller specifier
>      minItems: 1
>      maxItems: 2

These updates look fine to me.

--klBchq5Iv61GqXw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5prNQAKCRB4tDGHoIJi
0tiOAQDd9BF6yvC5/EHySEFWBLCC14sZW3m0j9Y5sHG+IFLYJQD/SiGc3aoOaqRR
GvI0wjS/7qTgY+FgXginJwblZbIzNAs=
=C2X+
-----END PGP SIGNATURE-----

--klBchq5Iv61GqXw7--

