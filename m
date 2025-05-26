Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FD1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dW8OSIbbawloq0QAUDsZ/mU0mi+/01JKd/8eK7tU9fs=; b=FDshmdTshbxZuk/7a81LXxXu+u
	C2fP2mz/4sBgN56gL8x/7l/9gm47Esz4MVMfchcV6z0NtSymUv03RrpiLmecV9BjjMt0hhZCfbbOj
	TmDl/haQVYWbjq57cpFcbpxf6XKZzAaIwwarhMIED4GenazDeOuMGlH8ESXV+H2sVlunw3MRk5xiQ
	FzgYl6nhSqzEFX/xwIGOhie/ee5YlxCBK2A3Y164MqqVXzkSVaJghL+CJt7Z4JVPrutszp5W7EoSl
	36lq7pQbWm9UzjlbRZUYl9s2O4NY6GdGJEFf8SIaiNB+Bk//YZRXPEt5Ip6fvaFwLdohfpUIHlJ4C
	i3Xdmksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZxM-000000099Ue-1UX8;
	Mon, 26 May 2025 15:41:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZvB-00000009951-3dgk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 15:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 152C2A4E87F;
	Mon, 26 May 2025 15:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE02C4CEE7;
	Mon, 26 May 2025 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273964;
	bh=ch4UlhSRcLszMAM+USq4g6GagJ4v1ZQSXAIVyxnYpP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxwMzAve0DnXzhNrTgDy2B7VSabV9Vr1C04z2hpBcDGcKwxFjzrAWYbCMlXVsJspD
	 8JOSehSedd7mLgP760iizCeeU6/POxykJBQu9lGounJK9c0UdaNTmSHHNvbLP0j6Oi
	 JmaZowh5N6bKqZAoJVoji7RVu7+jBdBWiXrwyU/CFUyU17yvKozEjFZx6Ape8wNXnx
	 kQdKZuJy2VozzXV9ZT23mMyXoMFhE8K0M3D3A0EF/JorevESI5x2RE4bQKmgNI/CVG
	 Nz+VZ/MfsEQJv5wlU9XHR9O2eGL244MGAFXl/5sZ87iKA+Ff7XcTA0lpPeZbpxjcfx
	 Ue6nRwhqoApyQ==
Date: Mon, 26 May 2025 16:39:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: ieee802154: Convert at86rf230.txt yaml
 format
Message-ID: <20250526-laborer-repackage-0dd6f7730b2c@spud>
References: <20250523154743.545245-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AX1uLCkW5kwIJMO8"
Content-Disposition: inline
In-Reply-To: <20250523154743.545245-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_083926_049823_7E25891F 
X-CRM114-Status: GOOD (  21.44  )
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


--AX1uLCkW5kwIJMO8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:47:39AM -0400, Frank Li wrote:
> Convert at86rf230.txt yaml format.
>=20
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Add parent spi node in examples.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/net/ieee802154/at86rf230.txt     | 27 --------
>  .../net/ieee802154/atmel,at86rf233.yaml       | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/ieee802154/at86=
rf230.txt
>  create mode 100644 Documentation/devicetree/bindings/net/ieee802154/atme=
l,at86rf233.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/net/ieee802154/at86rf230.t=
xt b/Documentation/devicetree/bindings/net/ieee802154/at86rf230.txt
> deleted file mode 100644
> index 168f1be509126..0000000000000
> --- a/Documentation/devicetree/bindings/net/ieee802154/at86rf230.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* AT86RF230 IEEE 802.15.4 *
> -
> -Required properties:
> -  - compatible:		should be "atmel,at86rf230", "atmel,at86rf231",
> -			"atmel,at86rf233" or "atmel,at86rf212"
> -  - spi-max-frequency:	maximal bus speed, should be set to 7500000 depen=
ds
> -			sync or async operation mode
> -  - reg:		the chipselect index
> -  - interrupts:		the interrupt generated by the device. Non high-level
> -			can occur deadlocks while handling isr.
> -
> -Optional properties:
> -  - reset-gpio:		GPIO spec for the rstn pin
> -  - sleep-gpio:		GPIO spec for the slp_tr pin
> -  - xtal-trim:		u8 value for fine tuning the internal capacitance
> -			arrays of xtal pins: 0 =3D +0 pF, 0xf =3D +4.5 pF
> -
> -Example:
> -
> -	at86rf231@0 {
> -		compatible =3D "atmel,at86rf231";
> -		spi-max-frequency =3D <7500000>;
> -		reg =3D <0>;
> -		interrupts =3D <19 4>;
> -		interrupt-parent =3D <&gpio3>;
> -		xtal-trim =3D /bits/ 8 <0x06>;
> -	};
> diff --git a/Documentation/devicetree/bindings/net/ieee802154/atmel,at86r=
f233.yaml b/Documentation/devicetree/bindings/net/ieee802154/atmel,at86rf23=
3.yaml
> new file mode 100644
> index 0000000000000..275e5e4677a46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ieee802154/atmel,at86rf233.ya=
ml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ieee802154/atmel,at86rf233.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AT86RF230 IEEE 802.15.4
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at86rf212
> +      - atmel,at86rf230
> +      - atmel,at86rf231
> +      - atmel,at86rf233
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpio:
> +    maxItems: 1
> +
> +  sleep-gpio:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 7500000
> +
> +  xtal-trim:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array

I think this is just uint8, not an array of uint8s (in which case you'd
be missing constraints on how many?)

> +    description: |
> +      u8 value for fine tuning the internal capacitance
> +      arrays of xtal pins: 0 =3D +0 pF, 0xf =3D +4.5 pF
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        zigbee@0 {
> +            compatible =3D "atmel,at86rf231";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <7500000>;
> +            interrupts =3D <19 4>;
> +            interrupt-parent =3D <&gpio3>;
> +            xtal-trim =3D /bits/ 8 <0x06>;
> +        };
> +    };
> --=20
> 2.34.1
>=20

--AX1uLCkW5kwIJMO8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSLJwAKCRB4tDGHoIJi
0qV3AQDwD/JHyyrPfgpUbSBTgf1HnrVPkzCoveSe40iVlVWiuQEAhXl0mGpT4VHu
F9AtcPvAsCTjG2v1kpvXN1AAKaU/bAw=
=siVm
-----END PGP SIGNATURE-----

--AX1uLCkW5kwIJMO8--

