Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F321AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw/jCmn/KOE2LoDFpFWah+rvYGMtWOdmte3fTa9ScuY=; b=jbIkX0PKaVMIiCKqdmt/hhOevK
	izra3hkEjW0RWsU2c9ItqS4uC81DB27MNHH6tfmUoOvI449ar1oRDXiNhdgn/F35f5DPnepwUFPWO
	4e9k3wVAQpOX8czYRcpEZQrcpzfiS3869q8i28s+6kWc/J/N7V8wb+FhWXPy2hYTVHdNYYJZKp2gM
	KjnzJXJe7K+zZ1MCsl/s81nKCZjxNl64Zg6sYrTJ6nja4UjyCzJrx0Uvai+xaDLeb293Xqbbzj0v5
	4OYqj0Ldq6FHtA20knwS9V5rmJ1G6CbgYE9cv7pg3+4udwP+BBSmMbHSP6CyKUp+7ux9QYb+p0ZSC
	DkIroR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzzmO-00000006EVc-3asa;
	Fri, 28 Aug 2026 16:50:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzzmN-00000006EVB-02YY;
	Fri, 28 Aug 2026 16:50:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32D3F60200;
	Fri, 28 Aug 2026 16:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8101F000E9;
	Fri, 28 Aug 2026 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787935809;
	bh=Hw/jCmn/KOE2LoDFpFWah+rvYGMtWOdmte3fTa9ScuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XxoRvS/pWD7EfKWlPLkqW8pWjkuekfNHrSvJvmaAdzI5X8auF7Qn5/jEDekj4ncxI
	 2jEmHqbY3k4YyvyXFuSacz8f8GpOr7bqT67VdFZfNvMpbBr1Ekt7XVD73tEKN2eUKb
	 mrJyA7yxMSBDWNzDtpoXYtfBlsXgO8CLsP3kkvES3ibm8QHxvHfkJ9foYSiyUY5swe
	 lxSlvUTKJINxWvdGnb28E0bCU3fKxWhlYhaehUcNWzno23zxRoF5GIpX36pmaU6UDe
	 2Z7/6zpZ9xXAYLv2qcsQ3bADDJhCoO/spbT0lR0/z/+3Qt/+wvjx6mJiJ+/AKg1mbk
	 pnYtXn7scph8A==
Date: Fri, 28 Aug 2026 17:50:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Andy Yan <andyshrk@163.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Graham Markall <hello@big-grey.co.uk>
Subject: Re: [PATCH v2 03/15] dt-bindings: mfd: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20260828-tribune-unguided-672ae7ade441@spud>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134819eucas1p2c8e2bb95dd957981ec5e60e1da03223c@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-3-331680c8b9d1@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cg0ACwIa4U5WfwqO"
Content-Disposition: inline
In-Reply-To: <20260828-jh7110-clean-send-v2-3-331680c8b9d1@samsung.com>
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

--Cg0ACwIa4U5WfwqO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 03:47:27PM +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
>=20
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map and
> populates its two children: the PHY and the controller. This is
> necessary to resolve a circular clock dependency between the HDMI block
> and the VOUT clock generator.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../mfd/starfive,jh7110-hdmi-subsystem.yaml        | 116 +++++++++++++++=
++++++
>  1 file changed, 116 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-s=
ubsystem.yaml b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-=
subsystem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..01f079160ab8c13c6fa4ce3ab=
aac6607021b3792
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsyste=
m.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/starfive,jh7110-hdmi-subsystem.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 HDMI subsystem
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The StarFive JH7110 HDMI block is a monolithic IP containing both
> +  the digital controller logic and the analog PHY logic in a single
> +  register space.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-hdmi-subsystem
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      NoC display bus clock, which gates access to the whole vout
> +      register region.
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      NoC display bus reset, which gates access to the whole vout
> +      register region.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains

Here you're willing not to have -names properties?

> +
> +patternProperties:
> +  "^phy(@[0-9a-f]+)?$":

These are not pattern properties at all, given they have no variance
because there's no unit addresses involved!
pw-bot: changes-requested

Cheers,
Conor.

> +    $ref: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> +  "^controller(@[0-9a-f]+)?$":
> +    $ref: /schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.y=
aml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/power/starfive,jh7110-pmu.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        hdmi@29590000 {
> +            compatible =3D "starfive,jh7110-hdmi-subsystem";
> +            reg =3D <0x29590000 0x4000>;
> +            clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
> +            power-domains =3D <&pwrc JH7110_PD_VOUT>;
> +            resets =3D <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> +
> +            controller {
> +                compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                         <&hdmi_phy>;
> +                clock-names =3D "sys", "mclk", "bclk", "pclk";
> +                interrupts =3D <99>;
> +                phys =3D <&hdmi_phy>;
> +                phy-names =3D "hdmi-phy";
> +                resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +                reset-names =3D "hdmi_tx";
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&dpu_out_dpi0>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&hdmi_con_in>;
> +                        };
> +                    };
> +                };
> +            };
> +
> +            hdmi_phy: phy {
> +                compatible =3D "starfive,jh7110-inno-hdmi-phy";
> +                #clock-cells =3D <0>;
> +                clock-output-names =3D "hdmi_pclk";
> +                clocks =3D <&xin24m>;
> +                clock-names =3D "refoclk";
> +                #phy-cells =3D <0>;
> +            };
> +        };
> +    };
> +...
>=20
> --=20
> 2.34.1
>=20

--Cg0ACwIa4U5WfwqO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG8NwAKCRB4tDGHoIJi
0hpkAP9IEPsKXNupV8il/GXzWDWNOrSDzHB2OymOU4fR89rhBAD+LI4SNgwfyjrP
7lvK3nlFJ0fQqo4ZtM5vpnIawQnoNwE=
=PKQG
-----END PGP SIGNATURE-----

--Cg0ACwIa4U5WfwqO--

