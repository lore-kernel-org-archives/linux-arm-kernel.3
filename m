Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBurEnEvJMYOvAHbhOlPjehgVnaQhBmizbnd1CUS3jM=; b=MNojpI5Qqk1MMmJcDDOcHAFWm6
	zeXgRkrmyCyfq80xck8msgxEtjFU2ncEXXyHYYpQyQYkdi4Bthq2smVKui0fyvTG2idope+ZyV9SF
	OFNOGdQndUv2wKRuhNVCz2EDzS5t3gPetYytjFz53IMSZIWUPcaPQodt0IN/KfsnD2kAo6FqMdZWD
	OlyFSL4mCFmrYZQsv5njuvh7o0uxsGDweIQDAd6EH3KoGe/thHvq3HEdPP7rzFbZKEd7Er6CAhOUp
	DdafzrYt3nrz/u1aHnZzRZj6Y5ID4rxy6CHpsgzWKLyflx0RhGMSkYCJUdjKQ3pEur9OgKP4uTfgL
	tl7FmhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whc5J-00000000dZv-3iqE;
	Wed, 08 Jul 2026 23:53:45 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whc5G-00000000dZV-1nV3;
	Wed, 08 Jul 2026 23:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783554809; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EZKBstcN1F6fnZqFsDNHlCQUaKES4Tn9QuVuH08cxFsetUDzN3JZw1RveOL1QbPoTfnIxfyow/v6Rk1iMmAARCIzbHBwUrfZcimxae1rwrkX3o3E7fuVjhtcq9mlLwp2UBKbZZbHfR2AMLUL8GYdS75xqFQMOFORGNIGAUJJiz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783554809; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GBurEnEvJMYOvAHbhOlPjehgVnaQhBmizbnd1CUS3jM=; 
	b=n93YZ4QSViJq87icdUBDd0zcvrv6DWK+8HzkJaeGXP4oA/RZPclj6IqkHodrado21aK9u1zuwgHxZyUF7pRuhxOQaK8eOaWy7ARAig9ntMDAFPgtl9xC/HKJV+zWAnaMGS5JYcGdEmDJM5JoSLrw4FjZDQYsHVbtYS0iHY9oQFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783554809;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=GBurEnEvJMYOvAHbhOlPjehgVnaQhBmizbnd1CUS3jM=;
	b=I8EfZUnqgcjz9wmxl8g/Y5zliHa57NtuwYbkRYlpGFt9WHgL/nbL5RP5pxEaza+p
	GqYXlr4AUTaYXqvcezS67liTyziAxM34alBG7jnkP9wqb3yDU61CsckJhSUKcReCrdL
	eltDAfj8PpdhkbmCOSuXwcedGIfwnRJjR3Pw0/vI=
Received: by mx.zohomail.com with SMTPS id 1783554806411232.87359725111776;
	Wed, 8 Jul 2026 16:53:26 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 0DAF81806CA; Thu, 09 Jul 2026 01:53:22 +0200 (CEST)
Date: Thu, 9 Jul 2026 01:53:22 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dawid Olesinski <dawidro@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Corentin Labbe <clabbe@baylibre.com>, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
Message-ID: <ak7g2_Se1tlLQJ51@venus>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260708175837.1718437-2-dawidro@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lnzb2w2bbzyesomx"
Content-Disposition: inline
In-Reply-To: <20260708175837.1718437-2-dawidro@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/283.531.57
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_165342_529565_D20E0357 
X-CRM114-Status: GOOD (  23.48  )
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


--lnzb2w2bbzyesomx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
MIME-Version: 1.0

Hi,

On Wed, Jul 08, 2026 at 06:58:22PM +0100, Dawid Olesinski wrote:
> Add a YAML device tree binding for the Rockchip second-generation (V2)
> cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.
>=20
> The IP block exposes AES-ECB, AES-CBC, AES-XTS block ciphers, SHA-1,
> SHA-224, SHA-256, SHA-384, SHA-512, MD5, and SM3 hash algorithms, each
> with a hardware DMA engine controlled via linked-list descriptors.
>=20
> The binding covers two compatible strings:
>=20
>   - rockchip,rk3568-crypto: clocks and resets are driven directly by the
>     non-secure CRU (accessible to Linux at EL1).
>   - rockchip,rk3588-crypto: clocks and resets live in SECURECRU, a
>     register bank sandboxed to TrustZone. Linux must request them through
>     the ARM SCMI firmware interface (scmi_clk / scmi_reset), as direct
>     MMIO access to SECURECRU from EL1 triggers a bus fault.

Looking at the driver, the two implementations are compatible. The
clocks/reset line source being different is not a reason for not
being compatible. So the binding should look like this:

  compatible:
    oneOf:
      - const: rockchip,rk3568-crypto
      - items:
          - enum:
              - rockchip,rk3588-crypto
          - const: rockchip,rk3568-crypto

and then in the RK3588 DTS, use

compatible =3D "rockchip,rk3588-crypto", "rockchip,rk3568-crypto";

finally in the driver only bind against "rockchip,rk3568-crypto".
The RK3588 specific binding is only added in case a difference
requiring custom RK3588 quirks is found in the future.

Greetings,

-- Sebastian

> Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
> ---
>  .../crypto/rockchip,rk3588-crypto.yaml        | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3=
588-crypto.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-cry=
pto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.=
yaml
> new file mode 100644
> index 000000000000..fc09f21b0654
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/rockchip,rk3588-crypto.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip cryptographic offloader
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +  - Corentin Labbe <clabbe@baylibre.com>
> +  - Dawid Olesinski <dawidro@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3568-crypto
> +      - rockchip,rk3588-crypto
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Core clock for the crypto IP internal logic
> +      - description: AXI interconnect clock interface
> +      - description: AHB interface clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: core
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      crypto@fe370000 {
> +        compatible =3D "rockchip,rk3588-crypto";
> +        reg =3D <0x0 0xfe370000 0x0 0x2000>;
> +        interrupts =3D <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SE=
CURE_NS>,
> +                 <&scmi_clk SCMI_HCLK_SECURE_NS>;
> +        clock-names =3D "core", "aclk", "hclk";
> +        resets =3D <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
> +        reset-names =3D "core";
> +        };
> +    };
> --=20
> 2.47.3
>=20
>=20

--lnzb2w2bbzyesomx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpO4uoACgkQ2O7X88g7
+poLJw/+Pzk9eEzX1y1FHDir56xZ0SvkUnHcQd6hDSo/cYXoDPI/bEjvV1FkUWdb
UY5J/me4DR+Z9K/6o4Ny/3r76y1+iegrQxsAZ/57Bk1UXX4nEMEQgIlZB+R5Tz6p
u983ikG6w0k6mKWvitDqoX6Eashfc7iuDDIxdsg6qli28cbTAuKLAf4B9+FO7vtS
waRRXo7FGBtcEcGaQ4tlP4oDEblKPW4V2vqvZi0g+499VXzVqk/ZuC6p7PWqV0/P
BwOKQ4i6KN/gLlIVwvZZTpZmPtJwf0ysUfac3IGaMx4etm/4VpfMgStSUOhunP5g
PdMqBd+ngHhi5qsz4UV2SBUQTkyoxud8R17wyNNrFkVXSPcoWp7sHRFK+1TL9NEJ
7051bUQAj9SgKPhLwWRqzbuXyBGO7JcOf8hrSEZOiK+oZ2prh/5MrBIvkUqqncWC
9p3ofgB8GUCaIIJxFTtUlDiJq+Dv0myOCILfFf4yQ0DpiI6KIgjiv/WPqFbfzTtm
0fTMntcelQq0pfs5xuJVIrvhr4A03iOBTHV6WcdaAp8J6CLrM5Kp7mZ7itucFcYH
xikiyHPIFO9ma/wddIH1BPyXujMdWetPCeQ0MYNURRDuWDJlOKl7NuvwBLiWCNHL
GhShK6+gbDc9PzA1WI/61mXVDhjO8fxjSc+6K9u+WEL0/J1A91Q=
=aDYy
-----END PGP SIGNATURE-----

--lnzb2w2bbzyesomx--

