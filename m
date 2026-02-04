Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79C2E83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6CjbY7ZSbcfTjteJn/6vcnGUe9CFES+q3Gv63lHmwQ=; b=o4a1U+wQzZdpWGZAU9TNYI3vro
	+RcnPrq3Tmx2g5uuwBK8Tl+FcTJ9XZgXxbXcqzTH6FdBojeW0jx4U84ybua3kk3R+ByCpl+E7RJoR
	jdiV2n1E2Kj9zCi6fnU1dZfAFoqdO9UHBQl2tNsIwU04xS06gDOYAmZsT6gfqn40A8t5tOSlpW4Ae
	Ud0DeYpwzYqVBrG/BR6C7IBrbxMiUfBTSSR/+nt6dtyzy5YLGC3ELu+UGGL70J6d/9rKdpfwS2RwE
	jPXxsUJAvvSy/xIUemfGG0dX64/+x2Xn5+RxJq357vyay9R6eTNIoseP2LF0FaQDZ1Av8DHz+xy8d
	AFJzR3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhM1-00000008ulV-1yWO;
	Wed, 04 Feb 2026 18:11:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhM0-00000008ulN-47NV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 18:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 099B760018;
	Wed,  4 Feb 2026 18:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF901C4CEF7;
	Wed,  4 Feb 2026 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228710;
	bh=qCuNCw5IkJNixUvOBqrReN5HqNAq3KCu5sG7c619BoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBQayiqjrTOR6s+iPhx0yVASon0LRlZgSCzxydu5vTbotYR8Oc+yeHSv9sCh8BQWm
	 Ye53SZFibKIuXdefnyTN5bJJnMmAHIrjnAehj7I130jis5FTKJIaLro273Yr2nXf74
	 VX7JJTAkkNrR7+oxxLTgW7FMYHU04LASVyDGr/6K8YKnq8dNSxm//z5YKTG6Vid5W2
	 7DG/LwE6w7Y1/eK8wuND7aOeOwtJFTYVLjjD30uIoYUfQ1KjYmzlOevtFn9osFdOUF
	 1nSSRSfqY7iyYE3VcWQoOm6gWYWaKS1yjWk4zOIAQ+tHeng3hgOsT7VaEgyvzm4j8w
	 24py92m7Age6Q==
Date: Wed, 4 Feb 2026 18:11:44 +0000
From: Conor Dooley <conor@kernel.org>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Add AAEON embedded controller
Message-ID: <20260204-feminize-agility-60c8463b849f@spud>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
 <20260203-dev-b4-aaeon-mcu-driver-v3-2-0a19432076ac@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HXLOdRZlhDXypzvT"
Content-Disposition: inline
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-2-0a19432076ac@bootlin.com>
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


--HXLOdRZlhDXypzvT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 05:21:11PM +0100, Thomas Perrot (Schneider Electric=
) wrote:
> Add device tree binding documentation for the AAEON embedded controller
> (MCU). This microcontroller is found on AAEON embedded boards, it is
> connected via I2C and  and provides a GPIO control and watchdog timer.
>=20
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---
>  .../bindings/mfd/aaeon,srg-imx8p-mcu.yaml          | 67 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 73 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.ya=
ml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d109fb0d53cb2a859f5a908a=
35611394eb87807
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8p-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AAEON Embedded Controller
> +
> +maintainers:
> +  - J=E9r=E9mie Dautheribes <jeremie.dautheribes@bootlin.com>
> +  - Thomas Perrot <thomas.perrot@bootlin.com>
> +
> +description:
> +  AAEON embeds a microcontroller on Standard RISC Gateway with ARM i.MX8=
M Plus
> +  Quad-Core boards providing GPIO control and watchdog timer.
> +
> +  This MCU is connected via I2C bus.
> +
> +  Its GPIO controller provides 7 GPOs and 12 GPIOs.
> +
> +  Its watchdog has a fixed maximum hardware heartbeat of 25 seconds and =
supports
> +  a timeout of 240 seconds through automatic pinging.
> +  The timeout is not programmable and cannot be changed via device tree =
properties.
> +
> +properties:
> +  compatible:
> +    const: aaeon,srg-imx8p-mcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 19
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      aaeon_mcu: embedded-controller@62 {

Drop the label here if you respin,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

--HXLOdRZlhDXypzvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOL4AAKCRB4tDGHoIJi
0me5AP0Q4Vynal5/kaTGfbXrTSrgT5VjBcR+EW/KnfBt6y4CjgEA6Q3hjEEHMGbs
fKUHq0HWTVrOfpWRRc0bmTyLQLv51wk=
=0QQX
-----END PGP SIGNATURE-----

--HXLOdRZlhDXypzvT--

