Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C36CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDY0YanhdTPBYVehJnziBlfJN/Uu32aoSpKdRXBk4+g=; b=N76/DAcxj93Z9NyucfzYXwb59H
	G2/oqI2HxiOt4rO42233H6lXXX+eiRkq2vijn2IPB43M7bseT0H7UY6kraqV3rBVKpBaX1TdusRst
	qUE+LMBuiIs2uqSE6EPuALrMv6ShYBGTppYLj4ByCfYCubIWbPHm6WcI1FhvofEbtTHcoD5Cssi1B
	PMXpf1vR90hRHfxdKhF+ro8UZX/3KT4EnwKucf6u+npB4Kt3GYWp1NNYJgE66c8s7/h43r1Kj7C1W
	o5tVCH7VfbHNs4vLqwS/z2G4TwfHLTP1VxwioTHcISQMSAjwzLl3zrUu8mseQC3vO0GmxTTP9RZmB
	tdI3s2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKNG-00000009uic-08EN;
	Fri, 24 Oct 2025 16:10:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKND-00000009uhT-4B5y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FC4B491BE;
	Fri, 24 Oct 2025 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29727C4CEF1;
	Fri, 24 Oct 2025 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761322239;
	bh=4SoTri5W3H54+3tKwwPWDSe9QCJbhHeD6Hnf3WTJiIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8OKaKExojQJsNa3/9XyDn/+qFCxUG4IW3oOapovBVahDQXpSGGiUn/3TY8C3U8Qj
	 yjAsT0gYQja4onOmMGtoUHTuJ09qyX8rRJtRdrnF4jAk3j07yIjC7jxegqXF2wkw2r
	 8Z1Ww/kgAB0hk5FZPZ9MTdqSCxMGf/RZDvS0aUnI0AQ8XnjonowgkyU8tmJPLK3+/b
	 ESx8BtMI9RTPuj7nSWTCJnxGD1EnHET4MuaSDgmS7YAQQaKlwqbp4arphUtbHi2mQk
	 AJWSzXWXo/Y8byU3465DdeUlLGrayDqWqJq09G9lusDJfdjAb6mZgJ2CRGb8qM3Fej
	 jNVRjCyg8tp6g==
Date: Fri, 24 Oct 2025 17:10:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX95
Message-ID: <20251024-stardom-salsa-8e52d241fbf2@spud>
References: <20251024144921.77714-1-francesco@dolcini.it>
 <20251024144921.77714-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UrG/VOuGoe/anPA6"
Content-Disposition: inline
In-Reply-To: <20251024144921.77714-2-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_091040_158206_02B97BE7 
X-CRM114-Status: GOOD (  13.89  )
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


--UrG/VOuGoe/anPA6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 04:49:20PM +0200, Francesco Dolcini wrote:
> From: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
>=20
> Add DT compatible strings for Toradex SMARC iMX95 SoM and
> Toradex SMARC Development carrier board.
>=20
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x95
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Signed-off-by: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 00cdf490b062..44dd93f1c674 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1439,6 +1439,12 @@ properties:
>            - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
>            - const: fsl,imx95
> =20
> +      - description: Toradex Boards with SMARC iMX95 Modules
> +        items:
> +          - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Tora=
dex SMARC Development Board
> +          - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
> +          - const: fsl,imx95
> +
>        - description: i.MXRT1050 based Boards
>          items:
>            - enum:
> --=20
> 2.39.5
>=20

--UrG/VOuGoe/anPA6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPuk9gAKCRB4tDGHoIJi
0oZGAP9MOTTaex3xtSgbAsqJCkx1oR8NC4KeZ1bRCfJdAhnhvQEAknH3HKjjcz1m
37Ble1U8GN0RBpbqJOzKd/5m34WT0gU=
=w/oi
-----END PGP SIGNATURE-----

--UrG/VOuGoe/anPA6--

