Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F9C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXeG/XDBVrTmxGiBbYRNgm5OvK+oLH/1zybK1FnCrVk=; b=ATbOaKRryMkVVmbgduAsFHw8nk
	0013WTV3xv2s/212qMggA3XGcbe3c3Sw7nNcLV0fBmqcrc2cg5nsMl5kta5dT3lMJFqHmJrcB/63l
	os7M4xp5N2WxuP9tQeTAk3SMVhJjlgBRJLsno2Y8ka3uC8yVmlZlbZi+2M1RqFpYwqpVGqh/rGS4B
	fU5IxyulsitmYY6WVfwODNLYS7edo8wIFlwwTCNfX5gOjfFMYlt2I590H0Z4GIzCE76gi5GsPRu6N
	4eBC0HSLlvT+n0kCxuthWd0MJ3ToNhLwrteFamadEP1iteedz/w4vL00Zpbt6YjYlBBsV3mtMNWtt
	Z3KwL7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZnu-000000098NR-3BtU;
	Mon, 26 May 2025 15:31:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZkL-0000000980c-4AKI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 15:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26AC26111C;
	Mon, 26 May 2025 15:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056F7C4CEE7;
	Mon, 26 May 2025 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273292;
	bh=kx4yqtWDGweZsbDr2gCws1oaqd0WX7/rjIqEa7ApGPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBMR/EqD2LP6ZMPrdhAz5GKwgLaYU5OLWEXKKEkRkERaLW6tj3NPmH/yJY93BrIkk
	 oqhH7jAiRBVQcPG8g2HSodJ6bqNVI0hfwhyM6AECHauRn9OegoVXNa6MsBuljNAHXl
	 Bh8gi698WLTIYN4jHrMbqEfV6Bo2r88Nojmim5EzU7ADtUTBNVPZb+vJr7HIgZIs7m
	 pD47cXG4K0/jnaNIvsGj3unpYEYQGXpBiChV28o6VDLuOJR9qyObJB/iG8Gw8RxdRV
	 1OPb8D1rvBE42FwZn3wJDxzPF+GreVTUVfNRFNL/03trQQiVjyhbOcNgXaunhxpMIc
	 JJIjF0XDCr7qA==
Date: Mon, 26 May 2025 16:28:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: dma: fsl-mxs-dma: allow interrupt-names
 for fsl,imx23-dma-apbx
Message-ID: <20250526-plural-nifty-b43938d9f180@spud>
References: <20250523213252.582366-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6/eZI3GwQY5emfaK"
Content-Disposition: inline
In-Reply-To: <20250523213252.582366-1-Frank.Li@nxp.com>
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


--6/eZI3GwQY5emfaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 05:32:52PM -0400, Frank Li wrote:
> Allow interrupt-names for fsl,imx23-dma-apbx and keep the same restriction
> for others.

The content of the patch seems okay, but why are you doing this? What is
the value on this particular platform but not the others?

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,mxs-dma.yaml  | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml b/Doc=
umentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
> index 75a7d9556699c..9102b615dbd61 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
> @@ -23,6 +23,35 @@ allOf:
>        properties:
>          power-domains: false
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx23-dma-apbx
> +    then:
> +      properties:
> +        interrupt-names:
> +          items:
> +            - const: audio-adc
> +            - const: audio-dac
> +            - const: spdif-tx
> +            - const: i2c
> +            - const: saif0
> +            - const: empty0
> +            - const: auart0-rx
> +            - const: auart0-tx
> +            - const: auart1-rx
> +            - const: auart1-tx
> +            - const: saif1
> +            - const: empty1
> +            - const: empty2
> +            - const: empty3
> +            - const: empty4
> +            - const: empty5
> +    else:
> +      properties:
> +        interrupt-names: false
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -54,6 +83,10 @@ properties:
>      minItems: 4
>      maxItems: 16
> =20
> +  interrupt-names:
> +    minItems: 4
> +    maxItems: 16
> +
>    "#dma-cells":
>      const: 1
> =20
> --=20
> 2.34.1
>=20

--6/eZI3GwQY5emfaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSIhwAKCRB4tDGHoIJi
0oP3AQDZKIfwzE9jpzhzxeBf1nNcdt6Ict2IVltCQIp8aS+xsQD/d6XIOMs1ZvRC
LNdQl78nksXIYJ53eDc742UHjVpsyQ8=
=hMch
-----END PGP SIGNATURE-----

--6/eZI3GwQY5emfaK--

