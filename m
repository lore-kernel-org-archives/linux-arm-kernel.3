Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LNP5iY2W;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1ESHr/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ymJ1AjpTqeoWk/tTVM3gBUqx7BiYza0Z6w25PBMyBko=; b=LNP5iY2W8aWmo+C9wHAmMqrhoI
	xBOFJyYCMOLoOXu6E5QZBAh3BpX1oW2x67WeQXa/uVvMWIW5PHrBXpXmcYDDuvfWC2ZNbJ9eQQX57
	PL/oMOampqTJ3fjHqUS5pe0VtN1CpqFMrVeVDoaa/XcBdEaPu1YwInZWncRZO8SgI70cCYLYGUVyJ
	SDe7W6EUU9//6NiNEjByYRayOxB8L9wd1/8jyh3C2pU4bw502xB3rTC6Q/kh8smEtG3ItDjcifLbN
	gHoSXtxum1jixPLldXWuPpf2lHRSgDPeZdNhogfASJEmojfG3LIm8+a0k+lN9MmlLXsGG8lskSoWe
	6G7qJHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ4B-00000003O9j-3fJQ;
	Tue, 03 Nov 2026 18:17:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ4A-00000003O90-1oIf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:17:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 256A143D82;
	Tue,  3 Nov 2026 18:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5111F00A16;
	Tue,  3 Nov 2026 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729822;
	bh=ymJ1AjpTqeoWk/tTVM3gBUqx7BiYza0Z6w25PBMyBko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1ESHr/Uz7Crzr04SE1CSjEBSQFyo8EMtKRsHlnrdMc4atm4Dyia4o3cid5UpQQT7
	 nh4PWcVdi5h8SIYnqLRq1kpNHN52rxFSbAKb6JjeoFxJfdHI0ejb/LjA8u8DZvH+HM
	 Xb//jaIhBXkQBj4E/81e0teGNJkCwfGYBdxIxpGgtivdwnfy1vaAJfVe7/uonX3Dul
	 PUAhRAanqr/CZNJdHfVo56V6tzYAvw/w+TMKZfYhSZ/ydq2V20Yn1YjLeWh/1xJvml
	 olw8Ekfg8xCIF9jpEk2jNknpfTL1vrGVdy2hrJqf14kobOAo1e1b40ZHNkd/lLbCb4
	 N7fxu0IuW1Emw==
Date: Tue, 3 Nov 2026 18:16:57 +0000
From: Conor Dooley <conor@kernel.org>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
Message-ID: <20261103-handiwork-replace-25efd6b3d8be@spud>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BUQBIV/8nLJh11WY"
Content-Disposition: inline
In-Reply-To: <20261103042608.387626-3-vamshigajjela@google.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--BUQBIV/8nLJh11WY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 09:56:06AM +0530, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
>=20
> Document the device tree bindings for the SmartDV IP Solutions MIPI SPMI
> master controller ("smartdv,spmi").
>=20
> This controller IP is integrated in Google Tensor SoCs starting with the
> G5 generation (codename: laguna, canonically written as "lga"), so add
> "google,lga-spmi" with a fallback to "smartdv,spmi".
>=20
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b/D=
ocumentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> new file mode 100644
> index 000000000000..e0512e60d932
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SmartDV IP Solutions SPMI Controller
> +
> +maintainers:
> +  - Vamshi Gajjela <vamshigajjela@google.com>
> +
> +description:
> +  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) mas=
ter
> +  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
> +
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: google,lga-spmi

> +          - const: smartdv,spmi
> +      - const: smartdv,spmi

I hate compatibles for purchasable IP like this, particularly when
unversioned as they maybe become effectively useless when a new revision
releases. The standalone smartdv,spmi compatible has to go at least,
soc-specific compatibles are mandatory.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Core clock to the controller from which SPMI SCL is derived. Optio=
nal if
> +      the controller uses a free-running clock and clock-frequency is sp=
ecified.
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description:
> +      Input core clock frequency in Hz when the controller uses a free-r=
unning
> +      clock not described in clocks.
> +
> +  smartdv,master-arb-enable:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +    description:
> +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enable).

What aspect of board design governs the decision here?
Why can it not be determined from the soc specific compatible?

> +
> +  smartdv,master-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 0
> +    description:
> +      Master ID for the controller on the SPMI bus.

What aspect of board design governs the decision here?
Why can it not be determined from the soc specific compatible?


> +
> +  smartdv,spmi-version:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +    description:
> +      MIPI SPMI specification version used for transfers (0 for MIPI SPM=
I v1.0,
> +      1 for MIPI SPMI v2.0).

What aspect of board design governs the decision here?
Why can it not be determined from the soc specific compatible?


> +
> +  smartdv,arb-retry-limit:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 32
> +    description:
> +      Maximum number of times the master retries a command when losing b=
us
> +      arbitration.

What aspect of board design governs the decision here?
Why can it not be determined from the soc specific compatible?


> +
> +  smartdv,prescaler:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 0
> +    description:
> +      Clock divider value to generate SPMI SCL from the input core clock=
=2E Writing
> +      1 divides the system clock by 2; more generally, a non-zero value n
> +      divides the system clock by 2 * n.

What aspect of board design governs the decision here?
Why can it not be determined from the soc specific compatible?


> +
> +  smartdv,read-latency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 32
> +    description:
> +      Number of SPMI SCL clock cycles to pause during bus turnaround on =
read
> +      commands to allow the target device to fetch data.

What aspect of board design governs the decision here?
Why can it not be determined from the soc specific compatible?


> +
> +  smartdv,arb-scl-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 0
> +    description:
> +      Delay between arbitration and Sequence Start Condition (SSC) when =
the
> +      controller is the Bus Owner Master (BOM).

What aspect of board design governs the decision here?
Why can it not be determined from the soc specific compatible?


> +
> +required:
> +  - compatible
> +  - reg

I find it hard to believe that this is the set of required properties.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi@14853000 {
> +        compatible =3D "google,lga-spmi", "smartdv,spmi";
> +        reg =3D <0x14853000 0x100>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +        clock-frequency =3D <19200000>;
> +        smartdv,master-arb-enable =3D <1>;
> +        smartdv,spmi-version =3D <1>;
> +
> +        pmic@f {
> +            reg =3D <0xf SPMI_USID>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eaeb60c1e1c2..f44c597c2075 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25243,6 +25243,12 @@ T:	git https://github.com/cschaufler/smack-next.=
git
>  F:	Documentation/admin-guide/LSM/Smack.rst
>  F:	security/smack/
> =20
> +SMARTDV SPMI CONTROLLER DRIVER
> +M:	Vamshi Gajjela <vamshigajjela@google.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> +
>  SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
>  M:	Steve French <smfrench@gmail.com>
>  M:	Steve French <sfrench@samba.org>
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20

--BUQBIV/8nLJh11WY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauolGAAKCRB4tDGHoIJi
0gOcAQDsQ1S81lNbFKF+hbL7KWP92uZOOw4o1Kdv7epFP9KMzQD/VxhoccS0MiqW
z/2WV3krNOEzJP2OVv/r/nAYohN85ww=
=aTCw
-----END PGP SIGNATURE-----

--BUQBIV/8nLJh11WY--

