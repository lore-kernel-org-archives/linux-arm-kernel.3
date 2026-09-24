Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2337C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB1GdzP+8thSPMeWIKodQA64CDM1Tul3nzGc9hJIyLg=; b=UNxKjpkqoeEWAAUg5M2j3ewb7B
	zWmFIF5QPFo1n5/IvzU32sEnOG6/GsBowb5XT8XYitZRU7ACMxgaxe6rnXC9Cqy7+c7gn5QruY8uM
	E8b8qhcsnn7umGTjkIM8Ua39lQtw5QZc6Z7mv92jAiuaFccZ1q8z0MZfBGMrXcgk3efedgCGGrRhZ
	Sx7p3jMShNgJaHJiSbIQF4Vy4JrV6X/LNU6HRB0+JODuqU/sVuqdbrge3MG0LvQGJwf0+og6HQ1Bb
	DYl883kf+0JpZfZgH84zQUxWDorhxpbIjxJFlJs8WVBZGBEh1r1tp584fZ00WOouIpL9BWJ6GQXEQ
	C3iAw8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nMx-0000000BnSP-1Vzt;
	Thu, 24 Sep 2026 17:36:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nLu-0000000Bmfp-3OPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AD4B437C4;
	Thu, 24 Sep 2026 17:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4951F000FF;
	Thu, 24 Sep 2026 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790271322;
	bh=iB1GdzP+8thSPMeWIKodQA64CDM1Tul3nzGc9hJIyLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QVyqtnTFgJ1OrhUvXnt/50bN1+ev4REPE0V4chjSMh13CZFHvUBTT5udqrxIr2sY8
	 sNsv0BtIkH9cZoYfmEQBe27Tw126iuARvLFcEaSAxrphRluLxrjP0IpR+8suOdUhG4
	 8zo9ZasonLhEGey91Jt/Kpdk9ZWULkRnFoGb1mAVxQqSDhfg0+xoxxDMgastegnav2
	 8P5nj0/wHesA9muawmp952KPVhNTLUVVwKy4MVje607sHePwR3KTIqg1rex39+j12h
	 XLNUl3glZOsmG195yNaJ/gypajXXCZ+DWILZHIMOm6Tbx+vL6HFyMbOlyimvHankhJ
	 f9VNlg0LCsRgA==
Date: Thu, 24 Sep 2026 18:35:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20260924-bonding-chill-81ae9424c06d@spud>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C56Zomom5CajsRz1"
Content-Disposition: inline
In-Reply-To: <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
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

--C56Zomom5CajsRz1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
>=20
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
>=20
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
>=20
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
>=20
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 46 ++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote pr=
ocessor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the p=
acket
> +  structure and communication flow between Linux and the remote firmware=
=2E Those
> +  controllers are managed via this transport protocol. For more details =
of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio

Is this even used? Your dts patch doesn't have it.

> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio

Sounds like, if linux are the arbiters of what this protocol is,
"linux," should be used as a vendor prefix.

> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Sin=
ce
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..5c82255b92a5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,29 @@ properties:
>        This property is to specify the resource id of the remote processo=
r in SoC
>        which supports SCFW
> =20
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Cont=
ains
> +      a group of RPMSG devices running on the bus.
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^gpio@[0-9a-f]+$":
> +        type: object
> +        $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +        unevaluatedProperties: false
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
>  required:
>    - compatible
> =20
> @@ -150,5 +173,28 @@ examples:
>                  &mu 3 1>;
>        memory-region =3D <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, =
<&rsc_table>;
>        syscon =3D <&src>;
> +
> +      rpmsg {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        gpio@0 {
> +          compatible =3D "rpmsg-gpio";
> +          reg =3D <0>;
> +          gpio-controller;
> +          #gpio-cells =3D <2>;
> +          #interrupt-cells =3D <2>;
> +          interrupt-controller;
> +        };
> +
> +        gpio@1 {
> +          compatible =3D "rpmsg-gpio";
> +          reg =3D <1>;
> +          gpio-controller;
> +          #gpio-cells =3D <2>;
> +          #interrupt-cells =3D <2>;
> +          interrupt-controller;
> +        };
> +      };
>      };
>  ...
> --=20
> 2.43.0
>=20

--C56Zomom5CajsRz1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVfUwAKCRB4tDGHoIJi
0i0GAP97j+i7FWor0B5kx0k5Y61hsIbG5rpgbILtHtQonkqb+gD+Jw/HBv1cg7JV
KEqTudUMhBrAYU4Cx+DsgAN/vYAzRgU=
=ljte
-----END PGP SIGNATURE-----

--C56Zomom5CajsRz1--

