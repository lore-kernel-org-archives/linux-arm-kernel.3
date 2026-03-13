Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952B8107BCCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpIOygxm8SuZMQMVFVXVWuddScYuhQa44S97DIENxwE=; b=jIHB2E20kCSQgY6rChwUXFZXDZ
	fZihQ7qQMbMgAVArWd5bKXWqF05EJLSMcXqIN/sa2edO5r9jWD5ZktprNahUdRnWYaN3ngp6Ivn16
	XO7L3y3EwvQO/NBpkUe36lFkYOxtu0Fr/9R7ue43B3onVh9pPEiK87v2SJL9OGa2dzwVJW8Y/mEHM
	Hzp3a++47ODdw9Bl+KTQMTgAc0eu+VQuy7dLpdXrAXD5thafMSzqwaFuD+18pY1YO3kP2Z9EqIQfp
	mBjw0aI+reKbK08/cNr4yEC+BHjPQrQ2flf8SljVwrYdC+Ke1J9dGsnsIcn//L5bArL3z2UTwlJPc
	K1bqrtqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15ol-00000000hlj-1UfK;
	Fri, 13 Mar 2026 16:56:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oS-00000000hXI-1ouf;
	Fri, 13 Mar 2026 16:56:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 687BB60132;
	Fri, 13 Mar 2026 16:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733FCC19421;
	Fri, 13 Mar 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773420995;
	bh=hDVKbG9Yf6odh85cCwvUzR7BAHuhgj1Ew2MEys6Trsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciA1TzPqOu8BMfC8IHLbAebnVNcj7qsJeA4HLeopB9SF5bZuUpH12FIl1lsWRk6fT
	 sduRD5oZ773+hAT6bizbdxuZNmhDrS6lXoW6lWKQ4FKvU+s4N7NsFx6z6iIp2wH2AQ
	 Mq3j+AyrFMpJ6swAM3l0n6KJPBbH7dH17H9FbmbunEOHQ0so4amK1cKVklGLmf82Bt
	 zHgy9zcr2lUG2pDmsAIxvNuaUA0+Du3orJCN4UUZIK6P01Mp/p26yzCood5Fcuzf99
	 1ADNliAvl7tUqjRnvG8z1E2k8Y6e5yRFIv23/MwS8ew8JYEeYDAvF60yENQT6ARiSE
	 vJpDvtnZCpKeA==
Date: Fri, 13 Mar 2026 16:56:29 +0000
From: Conor Dooley <conor@kernel.org>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260313-quickly-imperial-47638c9f0d4f@spud>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
 <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U7yuErg2Ck8ZSJQ1"
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
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


--U7yuErg2Ck8ZSJQ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:20:44PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 257 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-vica=
p.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
> new file mode 100644
> index 000000000000..7fd4214921cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
> @@ -0,0 +1,256 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3588-vicap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3588 Video Capture (VICAP)
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip RK3588 Video Capture (VICAP) block features a digital vid=
eo
> +  port (DVP, a parallel video interface) and six MIPI CSI-2 ports. It re=
ceives
> +  the data from camera sensors, video decoders, or other companion ICs a=
nd
> +  transfers it into system main memory by AXI bus and/or passes it to th=
e image
> +  signal processing (ISP) blocks.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-vicap

Curious why this cannot share a binding with the existing 3568-vicap.
Looks pretty similar binding wise at least.
If it's an entirely different architecture or whatever, please mention
that in your commit message.

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK0
> +      - description: ICLK1
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk_host0
> +      - const: iclk_host1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 9
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to general register file used for video input b=
lock control.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The digital video port (DVP, a parallel video inter=
face).
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 5 # MEDIA_BUS_TYPE_PARALLEL
> +                  - 6 # MEDIA_BUS_TYPE_BT656
> +
> +            required:
> +              - bus-type
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 0 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 1 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 2 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 3 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@5:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 4 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@6:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 5 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@10:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the ISP0 input.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@11:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the ISP1 input.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        vicap: video-capture@fdce0000 {
> +            compatible =3D "rockchip,rk3588-vicap";
> +            reg =3D <0x0 0xfdce0000 0x0 0x800>;
> +            interrupts =3D <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
> +            clocks =3D <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +                     <&cru DCLK_VICAP>, <&cru ICLK_CSIHOST0>,
> +                     <&cru ICLK_CSIHOST1>;
> +            clock-names =3D "aclk", "hclk", "dclk", "iclk_host0", "iclk_=
host1";
> +            iommus =3D <&vicap_mmu>;
> +            power-domains =3D <&power RK3588_PD_VI>;
> +            resets =3D <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
> +                     <&cru SRST_D_VICAP>, <&cru SRST_CSIHOST0_VICAP>,
> +                     <&cru SRST_CSIHOST1_VICAP>, <&cru SRST_CSIHOST2_VIC=
AP>,
> +                     <&cru SRST_CSIHOST3_VICAP>, <&cru SRST_CSIHOST4_VIC=
AP>,
> +                     <&cru SRST_CSIHOST5_VICAP>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                vicap_dvp: port@0 {
> +                    reg =3D <0>;
> +
> +                    vicap_dvp_input: endpoint {
> +                        bus-type =3D <MEDIA_BUS_TYPE_BT656>;
> +                        bus-width =3D <16>;
> +                        pclk-sample =3D <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
> +                        remote-endpoint =3D <&it6801_output>;
> +                    };
> +                };
> +
> +                vicap_mipi0: port@1 {
> +                    reg =3D <1>;
> +
> +                    vicap_mipi0_input: endpoint {
> +                        remote-endpoint =3D <&csi0_output>;
> +                    };
> +                };
> +
> +                vicap_mipi1: port@2 {
> +                    reg =3D <2>;
> +
> +                    vicap_mipi1_input: endpoint {
> +                        remote-endpoint =3D <&csi1_output>;
> +                    };
> +                };
> +
> +                vicap_mipi2: port@3 {
> +                    reg =3D <3>;
> +
> +                    vicap_mipi2_input: endpoint {
> +                        remote-endpoint =3D <&csi2_output>;
> +                    };
> +                };
> +
> +                vicap_mipi3: port@4 {
> +                    reg =3D <4>;
> +
> +                    vicap_mipi3_input: endpoint {
> +                        remote-endpoint =3D <&csi3_output>;
> +                    };
> +                };
> +
> +                vicap_mipi4: port@5 {
> +                    reg =3D <5>;
> +
> +                    vicap_mipi4_input: endpoint {
> +                        remote-endpoint =3D <&csi4_output>;
> +                    };
> +                };
> +
> +                vicap_mipi5: port@6 {
> +                    reg =3D <6>;
> +
> +                    vicap_mipi5_input: endpoint {
> +                        remote-endpoint =3D <&csi5_output>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 237397f18f07..a972cd38c13d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22874,6 +22874,7 @@ S:	Maintained
>  F:	Documentation/admin-guide/media/rkcif*
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
>  F:	drivers/media/platform/rockchip/rkcif/
> =20
>  ROCKCHIP CRYPTO DRIVERS
>=20
> --=20
> 2.39.5
>=20
>=20

--U7yuErg2Ck8ZSJQ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRBvQAKCRB4tDGHoIJi
0r13AQCoM3uVNwIVEjtjwPRLuvb1Q7eV3oSbdVL/cG8OYj5qbwD+NdwtNy7/0O2I
quuV/nSJm2mqBUbcVELHXceOgTCGmQU=
=bxXo
-----END PGP SIGNATURE-----

--U7yuErg2Ck8ZSJQ1--

