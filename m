Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E65606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DUcrrAis;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8au5m+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xy2U26Mne6M5YW3gXWwYO3+KzvxuP8VoL+G09hFdvhk=; b=DUcrrAishXP0fRU1m+LMWYeF11
	SB+CXcXVqawYJkJxHe1i8re/vyo6s7URkeefkBRocuL7qx3eg1L1ZWD25u1CwZQbJ9bqSb+ALEW8o
	WkXSdf9DgyMAy7hHq86/imzyH3a8s0oeQuYet34BMIQL3Id1cnU/AQx4KT82LSj4gxDz8qtPnSGMO
	tZRbb0GppRGQfjO4Q7YrgmWgxax2x+6XdunScwu0guX+/Szg5JgPmF23tFuBFax+c8o/z6wFqF24Y
	6ti/2/byjORErxgsQ6f3PIHqdwDxtj1JE0D7Mo5FAJj4kkf02HRdmlAZGg11oqWGQU9K2fRlRrIB5
	htnWGN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZCr-0000000AWKO-2IxY;
	Thu, 29 Oct 2026 23:06:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZCp-0000000AWK8-3MI1;
	Thu, 29 Oct 2026 23:06:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32FAD437AB;
	Thu, 29 Oct 2026 23:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6191F01824;
	Thu, 29 Oct 2026 23:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793315206;
	bh=xy2U26Mne6M5YW3gXWwYO3+KzvxuP8VoL+G09hFdvhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f8au5m+kyaX+MsBYWeZmjmWrABpfpcSUO75UyTcFSkgugktEXglr2BfkxmILKQ0+f
	 P5wqwuxpLHGn8FuTl3/LQbqQyS/FiVvYEGXQlkF4rpFwTvCPwJRltypcvPMKJDD6fK
	 TBa+rvdM2/hpSgwDCSLMMuz3X8jUDg7KA8o/6kRRHD/yJdWFOK0ZYqp7GsleAnsU0X
	 th0gqTn1s3aR859qD+mZiJECMuKlo7/DTaQdQft1fG7kihyicsSC+Raam4oNDDYVRz
	 UsueypUmyVlI9zoRELsGj2sn0Q/9LFbjLI9RcqHfZSUBObA18dFfYVhBuMJWl+mbE+
	 UTOdpdKfmZHRA==
Date: Thu, 29 Oct 2026 23:06:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Yakir Yang <kuankuan.y@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v6 04/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20261029-flinch-header-bad94288c71b@spud>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075358eucas1p111293c602fc3aac9c6a044fc41488919@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BltxCjlw5sIY5QTf"
Content-Disposition: inline
In-Reply-To: <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--BltxCjlw5sIY5QTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 08:53:38AM +0100, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
>=20
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map, and its
> two children: the PHY and the controller.
>=20
> The two have separate resources. The PHY takes the 24 MHz reference
> clock and provides both the pixel clock, which the VOUT clock generator
> routes on to the display controller, and the phy the controller uses.
> The controller takes its clocks from the VOUT clock generator. What
> they share is the register space, which the parent maps.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++=
++++++
>  1 file changed, 95 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh71=
10-hdmi-subsystem.yaml b/Documentation/devicetree/bindings/soc/starfive/sta=
rfive,jh7110-hdmi-subsystem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2ff8b0b920aec41a83f0aeaa0=
ed9c4249fe87f46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi=
-subsystem.yaml

Why is this in bindings/soc? I feel like it should be in
bindings/display or something along those lines, since it's the display
subsystem of the device?

Cheers,
Conor.

> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-hdmi-sub=
system.yaml#
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
> +  register space. It sits inside the video output subsystem, which owns
> +  the NoC bus clock and reset gating this region and the power domain it
> +  belongs to.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-hdmi-subsystem
> +
> +  reg:
> +    maxItems: 1
> +
> +  phy:
> +    $ref: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> +
> +  controller:
> +    $ref: /schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.y=
aml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - phy
> +  - controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        hdmi@29590000 {
> +            compatible =3D "starfive,jh7110-hdmi-subsystem";
> +            reg =3D <0x29590000 0x4000>;
> +
> +            controller {
> +                compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                         <&hdmi_phy>;
> +                clock-names =3D "pclk", "mclk", "bclk", "pixel";
> +                interrupts =3D <99>;
> +                phys =3D <&hdmi_phy>;
> +                resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +                starfive,vout-syscon =3D <&vout_syscon>;
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
> +                clocks =3D <&xin24m>;
> +                #phy-cells =3D <0>;
> +            };
> +        };
> +    };
> +...
>=20
> --=20
> 2.34.1
>=20

--BltxCjlw5sIY5QTf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauPRfAAKCRB4tDGHoIJi
0q9aAQDv07UymcETvBZlVghJCL8rpRoohfFFCoPKCAXQf1RVRAEAxilNjF3B0oMe
r04GfPnJ8scs0S42SIRPrV01ClukYAM=
=ziB+
-----END PGP SIGNATURE-----

--BltxCjlw5sIY5QTf--

