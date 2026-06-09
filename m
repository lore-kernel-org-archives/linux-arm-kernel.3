Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B55ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvjjhZx2KbfbA3aG4zyyErvYRIPzEB2KAnDRxFD1IPc=; b=mt4Pp1JUiBegFglAbVb/GSlTS8
	mbPiFrhmI9BxIHA3xCO6ivkXIwC0J0Pc8FJj4TuXsCUN4N1RjQ7RMd4plSN1x2OtmPQPOMjfOCwDp
	Pqk3HUpKBiGPYm8vzkF8XiBGIQ2wjXWKJA7rVxvsGQH64nnF5+iBOKtHKq395tMqkI0l+t/Su/WcF
	/WndHZpBtURZ6R5ANwLDJdC1b0HAHEmUuWyOOeZnmXbM6eOnfTq8H73mq/cK9vssvEN6bR9HV4d2o
	18nmfu40IJZQvi9whSU+yvrhwQSJCVW1CyWUPBe7VggK9QaXElARNbRdpJqNKqtEi/kpRbQwi+0kw
	rLpTQvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz7I-0000000617L-3JGe;
	Tue, 09 Jun 2026 16:15:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz7H-0000000616c-1j9A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 16:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8552460228;
	Tue,  9 Jun 2026 16:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC841F00893;
	Tue,  9 Jun 2026 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781021750;
	bh=tvjjhZx2KbfbA3aG4zyyErvYRIPzEB2KAnDRxFD1IPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ldVcXqpMfPnx7MbGkzjiKmG5isZtE6wHrZdwubDdIb/oUu3NPCUxvsgp5o992C4hc
	 rwo0VTTx2ZEzMoUMaq8d91m8YgK8MrYVadGjb0/1Z2wnaVqI2emGX4LErES8j5cg0+
	 8A7/LYour6QsZl9m9Endsdh9sMQObr8vDQ1H3Fa9MtiHEjkxB3qGMTjXEVVxPNsk6g
	 /DbmAfHTfGzukSlxze2GHTAemwupHp7OiupCGs3nGZTWKWbVUfOjUbNlW+RpOAZJXD
	 GkCh6tye7pA9DY0zyfEeEBC6GRqi7dEmzwDX09dgwJa3ecOtZmfeYwh9fm7vt+4MFY
	 mXwYCTynEsBvA==
Date: Tue, 9 Jun 2026 17:15:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M
 PLUS Boards
Message-ID: <20260609-clumsy-material-b74a9b6bc7b7@spud>
References: <cover.1780998600.git.stefano.r@variscite.com>
 <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IzjPPGoaiFY9Un2l"
Content-Disposition: inline
In-Reply-To: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
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


--IzjPPGoaiFY9Un2l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 11:51:18AM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>=20
> Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
> development carrier Board.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

My mailbox looking like
| 169 ND  Jun 09 Stefano Radaell ( 27K) =E2=94=8C=E2=94=80>[PATCH v5 3/3] a=
rm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
| 170 ND  Jun 09 sashiko-bot@ker (7.2K) =E2=94=82 =E2=94=8C=E2=94=80>
| 171 ND  Jun 09 Stefano Radaell ( 24K) =E2=94=9C=E2=94=80>[PATCH v5 2/3] a=
rm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
| 172  D  Jun 09 Stefano Radaell (  43) =E2=94=9C=E2=94=80>[PATCH v5 1/3] d=
t-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
| 173 ND  Jun 09 Stefano Radaell ( 10K) [PATCH v5 0/3] Add support for Vari=
scite DART-MX8M-PLUS and Sonata board
| 174 ND  Jun 09 sashiko-bot@ker (7.1K)   =E2=94=8C=E2=94=80>
| 175 ND  Jun 09 Hongliang Wang  (7.8K) =E2=94=8C=E2=94=80>[PATCH v1 2/3] L=
oongArch: dts: i2c: Add clocks and clock-frequency properties to 2K1000
| 176 ND  Jun 09 Hongliang Wang  (8.9K) =E2=94=9C=E2=94=80>[PATCH v1 1/3] L=
oongArch: dts: i2c: Add clocks and clock-frequency properties to 2K0500
| 177 ND  Jun 09 Hongliang Wang  (7.7K) =E2=94=9C=E2=94=80>[PATCH v1 3/3] L=
oongArch: dts: i2c: Add clocks and clock-frequency properties to 2K2000
| 178 ND  Jun 09 Hongliang Wang  (7.0K) [PATCH v1 0/3] LoongArch: dts: i2c:=
 Add clocks and clock-frequency properties
| 179 ND  Jun 09 Stefano Radaell ( 27K) =E2=94=8C=E2=94=80>[PATCH v4 3/3] a=
rm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
| 180 ND  Jun 09 sashiko-bot@ker (7.7K) =E2=94=82 =E2=94=8C=E2=94=80>
| 181 ND  Jun 09 Stefano Radaell ( 24K) =E2=94=9C=E2=94=80>[PATCH v4 2/3] a=
rm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
| 182  D  Jun 09 Stefano Radaell (  40) =E2=94=9C=E2=94=80>[PATCH v4 1/3] d=
t-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
| 183 ND  Jun 09 Stefano Radaell ( 10K) [PATCH v4 0/3] Add support for Vari=
scite DART-MX8M-PLUS and Sonata board
| 184  D  Jun 09 Paolo Abeni     (  19) Re: [PATCH v2 1/1] dt-bindings: net=
: dsa: Convert lan9303.txt to yaml format
| 185 N   Jun 09 Stefano Radaell ( 27K) =E2=94=8C=E2=94=80>[PATCH v3 3/3] a=
rm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
| 186 N   Jun 09 sashiko-bot@ker (7.1K) =E2=94=82 =E2=94=8C=E2=94=80>
| 187 N   Jun 09 Stefano Radaell ( 24K) =E2=94=9C=E2=94=80>[PATCH v3 2/3] a=
rm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
| 188     Jun 09 Stefano Radaell (  36) =E2=94=9C=E2=94=80>[PATCH v3 1/3] d=
t-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
| 189 N   Jun 09 Stefano Radaell ( 10K) [PATCH v3 0/3] Add support for Vari=
scite DART-MX8M-PLUS and Sonata board
is a pretty clear indication that you're iterating too quickly.
Try to slow down and leave people time to respond before sending new
versions, not just respin for every automated response you get.

Cheers,
Conor.

> ---
> v4->v5:
>  -=20
>=20
> v3->v4:
>  -=20
>=20
> v2->v3:
>  -=20
>=20
> v1->v2:
>  -=20
>=20
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 86876311ec59..11629b9eafc5 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1310,6 +1310,12 @@ properties:
>            - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX=
8MP TQMa8MPQL SOM
>            - const: fsl,imx8mp
> =20
> +      - description: Variscite DART-MX8M Plus based boards
> +        items:
> +          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8M=
P on Sonata Development Board
> +          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
> +          - const: fsl,imx8mp
> +
>        - description: Variscite VAR-SOM-MX8M Plus based boards
>          items:
>            - const: variscite,var-som-mx8mp-symphony
> --=20
> 2.47.3
>=20

--IzjPPGoaiFY9Un2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig8LwAKCRB4tDGHoIJi
0m4zAQCmUxD/ny43hOfglQERHwtFde8j02NcX+qT47L4RKlj1gEAkvLqrFrJ2iQs
E8lVAVxb3YBc4akFxdaHWXuYhtsKpgw=
=vM9U
-----END PGP SIGNATURE-----

--IzjPPGoaiFY9Un2l--

