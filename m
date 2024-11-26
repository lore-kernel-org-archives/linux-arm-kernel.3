Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FBBD3B9AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1lCcqDhc3X+5+dzLAMIuYRu0uvJ2mKqZGK05+8cj1Y=; b=4tjFEPtqAdqjs7j5mxKuHm6j5H
	O3iSyCrxX4zw5DXGwBGwaE4dzXPzcEExG++f70qhy15vQnfWm/n4/FjwMDscYISSZI5KlQfz6Sa6Z
	F/718wmwUIOp7iE4lhB3HHNzVIFuFzXxBkLFimkLPlglcXBLGjBrVzeTrYtqwbGsUKrurH1BHsvDF
	E4JKLO/jz21fRxVGIFVkvvdoCjwksvZwAKHB4luzM3aGkkR2Ho1Q7c55J1uHBT4BTt8SFFDgkpw4w
	qDgZwNNFb4jAGr2+oE3wz8+/3GFmj8QWGgL11hfxSUhoutDlGOYdxdzrHSoAFDxmtVo/tVPtYyO2H
	U8GNgqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFy2w-0000000B65O-0pmb;
	Tue, 26 Nov 2024 16:04:14 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFy1l-0000000B5mr-2D1U;
	Tue, 26 Nov 2024 16:03:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1732636971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fCOspcaM6yPhqjz+SUYSQNLVR26xd+MDfVEMYHbQPrvFJqj5ArPA18mc9Am32b0EoavUTncyV3DLeOB9h0+imz/rscXStXAkTrZeD/6PfLdxKb7r4QqGYVlV+JbN3Zuzbl/09boqNhURkGND5ALrB69jWNY4Nl5i0lHuEs6R3EI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732636971; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+1lCcqDhc3X+5+dzLAMIuYRu0uvJ2mKqZGK05+8cj1Y=; 
	b=fRMWjASLzECAYcReNbRC++32kh2tLRGuNrerhw4hgiG0KbeBjCBQPgNr+t08xQ8z7rF5dlX05RsgjTN3QWthBKy9SotjShlrBnpwP7tP5wOW/SaJIP2evUO15hwKP5rWKzjW6HnWNDX6Q/9IqQXZvNEEY5V3jy7VkSnkKDjovUI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732636971;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=+1lCcqDhc3X+5+dzLAMIuYRu0uvJ2mKqZGK05+8cj1Y=;
	b=e+WAFqvsZ+dszmLc48V3Bt9fuXyQ/uDZc0Piz/AlfVMeNvzMjaL4Wje/xYYokQSW
	7oPAU1Mdpaxl7QXzRq0Cr85MCMsF3+jBBZ0+SGlFb+nj9myQd93o1NOBEKXGnB36+PN
	148BNtHb44nKdh9mLDXEXJTdbSp/kbFcIN4/zTlo=
Received: by mx.zohomail.com with SMTPS id 1732636967514808.6210011319688;
	Tue, 26 Nov 2024 08:02:47 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 061E910604CF; Tue, 26 Nov 2024 17:02:43 +0100 (CET)
Date: Tue, 26 Nov 2024 17:02:43 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dse@thaumatec.com, 
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY
 schema
Message-ID: <kalgqphp4qdlzlb43rpxu3o2d7vrnej5xjhe7hgp3zwrbl6gfa@jheymyqgw4ny>
References: <20241126131736.465111-1-heiko@sntech.de>
 <20241126131736.465111-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnibaswrlt7ffbwn"
Content-Disposition: inline
In-Reply-To: <20241126131736.465111-2-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.1/232.605.28
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_080301_634302_A891B158 
X-CRM114-Status: GOOD (  18.09  )
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


--tnibaswrlt7ffbwn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY
 schema
MIME-Version: 1.0

Hi,

On Tue, Nov 26, 2024 at 02:17:34PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Add dt-binding schema for the MIPI C-/D-PHY found on
> Rockchip RK3588 SoCs.
>=20
> Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  .../phy/rockchip,rk3588-mipi-dcphy.yaml       | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588=
-mipi-dcphy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-d=
cphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcph=
y.yaml
> new file mode 100644
> index 000000000000..c8ff5ba22a86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.ya=
ml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/rockchip,rk3588-mipi-dcphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip MIPI D-/C-PHY with Samsung IP block
> +
> +maintainers:
> +  - Guochun Huang <hero.huang@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3576-mipi-dcphy
> +      - rockchip,rk3588-mipi-dcphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description: |
> +      Argument is mode to operate in. Supported modes are:
> +        - PHY_TYPE_DPHY
> +        - PHY_TYPE_CPHY
> +      See include/dt-bindings/phy/phy.h for constants.
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: ref
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: m_phy
> +      - const: apb
> +      - const: grf
> +      - const: s_phy
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon managing the 'mipi dcphy general register fi=
les'.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      phy@feda0000 {
> +        compatible =3D "rockchip,rk3588-mipi-dcphy";
> +        reg =3D <0x0 0xfeda0000 0x0 0x10000>;
> +        clocks =3D <&cru PCLK_MIPI_DCPHY0>,
> +                 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
> +        clock-names =3D "pclk", "ref";
> +        resets =3D <&cru SRST_M_MIPI_DCPHY0>,
> +                 <&cru SRST_P_MIPI_DCPHY0>,
> +                 <&cru SRST_P_MIPI_DCPHY0_GRF>,
> +                 <&cru SRST_S_MIPI_DCPHY0>;
> +        reset-names =3D "m_phy", "apb", "grf", "s_phy";
> +        rockchip,grf =3D <&mipidcphy0_grf>;
> +        #phy-cells =3D <1>;
> +      };
> +    };
> --=20
> 2.45.2
>=20

--tnibaswrlt7ffbwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmdF8R8ACgkQ2O7X88g7
+pocUg/+L8hx7vrrT2ksTCtr5qRsbq1rVu6ecj6wcJsN2PdTrqb146EXfib8wS1r
YFEdEr+oDlFwqQOYFF2eSh4YSaVk9fTuq6QsR+FGCWXxQ+zy11eOteBl4qWDe0f1
dN9MMo+DMUbqTOVdzTO/rW79N7LukovKDNR6R5dnrY6PIvdiJ4GsggMCw9OOE1xB
igc5nWfOjoTmDj3+8LpwCXd5fZt4hj/CJW/ogjKa8Z+pJ6Y/jzb83H8mE6qQb4QT
t+KFiIvR2lcUrWm+wL3fprpIm8B0txUESsw+F4pfm2+2l+IUa/+I4A3/ik9CqQb3
rPK/+Wny6moI2L5XfhG+xSsrUXocGBIkZRal2qpvJhvabgA1mXyeowMT922OazmQ
3w8G82u1A9k76Q992HmBxLFwHmDpQqI1LwaNk9gSrr9WecA65P28yFuUFa4dcF/o
x55W3CdZTVnJBW0MC3mAmHiaUVkFCgOChT+TUPt9T0xbZgLacMEqXGI0sibpL0IK
/u34tb12bdUrmHqUO2XWec1a08+xaJGWrx4z4Cqq9P9eywFTTf0Od2Ft7zFFgkMC
6O06mK4aUXzoyDBsSYslLakfj9jR/RN7KbB4qTr23a8L+AvxbyMVXi+wBfGDA03a
C7oL2vemx22RGx9yH5Bu7GfpfttdpFg+wa4t+0tBjXRln+duCSc=
=+KwH
-----END PGP SIGNATURE-----

--tnibaswrlt7ffbwn--

