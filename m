Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955D9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdZfxgVZ08yHDS6y45eZRjamstpg1bQwuCaG4Cfbw0E=; b=k4/1AdsJ5mYb/9QZJXj17igtOa
	QQN344LF2mrwh7K8c11tyuyhLay4MXG4eJuZVYKzwcM/xOmWYyzJOO7dfEaSvzLfmMca7jnK8x2gq
	Bm422yM5p+7RxB6ac+kWugnL00szTrq82kxMidhIpqndx6Mmgj/pOR0h7TQFmo7abnTQrqBGA8avI
	63HP/zdVpg84A+odSTHWXQo1zkv9tDCqWKdrcn7xLlpVfy77H7DHB5asJ5LtGHWoSlvLQj4+ORMl7
	z4TioTHXdIUcyo5XdY1Rs++cAinaut2MpeYLshxfZurnp3T2gU3IqGf7v9XHhCCTYozmkUAM1x8jI
	wMOxH8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR18-00000000RPy-2EYF;
	Fri, 07 Nov 2025 18:16:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR16-00000000ROc-0X7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 18:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE8D661904;
	Fri,  7 Nov 2025 18:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B05AC4CEF8;
	Fri,  7 Nov 2025 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762539413;
	bh=+3LGRZ/i95R9G46DjnQ4oDzhvETIPYCKtlLIAK2PNBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFNFhJgp1kZkEshiNLZQa1cH8HdVHFyKXEiX2/j3WpQOAshi2ICDcRGNrbQvnzZIu
	 Ev1WbzWkDfvPNUzHcb4LcvA+ipD97IetYPlu+Bb/1dqxVuqvBFDJ0TR79zhIOy0Vu9
	 6M0+Xp272845UHA5ZY1C92R9+tlxfcQg+IA7NhONIBlu+HLKAzySAQs1ZgZKmkrIAW
	 nAx7tA+IWU5iFp+Stamqd8v3/LebxTy/Asu4r/w29O/xHPtjqKMr1d1eP4Xd2UO6Kk
	 M84g2J9d8qCpEK3SHXStSFYcTiUKJWx9JKd1a9QHRZ4kfUrH3VuOINxiFdGueKP44C
	 8MZdLTWnobWpA==
Date: Fri, 7 Nov 2025 18:16:47 +0000
From: Conor Dooley <conor@kernel.org>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <20251107-qualified-varsity-78953d06d7c6@spud>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8J53olo9onoOkYiP"
Content-Disposition: inline
In-Reply-To: <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
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


--8J53olo9onoOkYiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 01:49:58PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>=20
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>=20
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>=20
> ---
>=20
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.

I'm sorry if I asked this before and forgot or w/e, but how backwards
compatible is this? If they control all channels and it gets changed to
only control channel one, how will a changed kernel understand the
difference between a new devicetree that only wants to control channel 1
and an old devicetree that is trying to use channel 1 to control all
channels?

Cheers,
Conor.

> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 112 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25=
014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.=
yaml
> new file mode 100644
> index 000000000000..e83723224b07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the boost converter input rail.
> +
> +  pwms:
> +    maxItems: 1
> +
> +  maxim,iset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +    default: 11
> +    description:
> +      Value of the ISET field in the ISET register. This controls the cu=
rrent
> +      scale of the outputs, a higher number means more current.
> +
> +  led@0:
> +    type: object
> +    description: Properties for a string of connected LEDs.
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 4
> +            items:
> +              minimum: 0
> +              maximum: 3
> +            default: [0, 1, 2, 3]
> +
> +      default-brightness:
> +        minimum: 0
> +        maximum: 100
> +        default: 50
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        backlight@6f {
> +            compatible =3D "maxim,max25014";
> +            reg =3D <0x6f>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            enable-gpios =3D <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent =3D <&gpio1>;
> +            interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> +            power-supply =3D <&reg_backlight>;
> +            pwms =3D <&pwm1>;
> +            maxim,iset =3D <7>;
> +
> +            led@0 {
> +                reg =3D <0>;
> +                led-sources =3D <0 1 2 3>;
> +                default-brightness =3D <50>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58c7e3f678d8..606ce086f758 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max=
2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
> =20
> +MAX25014 BACKLIGHT DRIVER
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> +
>  MAX31335 RTC DRIVER
>  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>  L:	linux-rtc@vger.kernel.org
>=20
> --=20
> 2.51.2
>=20
>=20

--8J53olo9onoOkYiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ43jwAKCRB4tDGHoIJi
0tpBAP9NLDHquHkJaGHZdDJjqdtnkqN8QoB5tbL4dVfi7f3PDwD/aSxRFOqlWV2V
MTS/83/dLZduN46XgS8bQuVOD/bkww8=
=ExWz
-----END PGP SIGNATURE-----

--8J53olo9onoOkYiP--

