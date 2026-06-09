Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CD8CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnBqr/oojprozlQZfNYplJlBKL2vf9+PvY5mWTT3dsc=; b=LdC7Zk6LUuskbjM0XJ0OlkTxPM
	yKHn4kkRv+8y4w1b/aXZ2tMJRdbhfVpk4Ecbp1kDqtp40OZgt9gYbafFas92QP94jRyxQOUrWRNIP
	RArV13re+b1dphwpVJheZxFhzSEfr1R7RjVLlHaHu9MmiR/otmFeCBhv3A2GCzSwvbZrxjHpVU7Uj
	w0gLwugPs4RLQNWosGW8hGUmQnRrg7rjif0CJSHTn/rjRySqSJNP/bOat/eK36IEUVl797ahp2SEx
	MysnhPKss/sVr4LX4195UVgyY0GRyXpkBrEnfDjCgJ/MDQdq2eTMJNs2AHSfpX/e550lBuEtny7RK
	f3enlhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzJW-000000062Zm-0d8P;
	Tue, 09 Jun 2026 16:28:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzJU-000000062ZZ-1qiy;
	Tue, 09 Jun 2026 16:28:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E866E40A53;
	Tue,  9 Jun 2026 16:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871F31F00893;
	Tue,  9 Jun 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781022507;
	bh=mnBqr/oojprozlQZfNYplJlBKL2vf9+PvY5mWTT3dsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGnbzpbq2ir2U0YUoU/MVcUkdXc64ZBJ+JQYXxd1mlBrNLidxG0iEGQtF794/JCSf
	 Cm87Zv+Kr0eeLuesxsB5NlkuHMBtBXm+Rl4JQvFG8eE4dXoCjapRwJCfklohYejAsN
	 Kl1bnCQmucj/MxHTBB8rqq1uRx5WVM8asYTBPM+OxIDwvzWxka4jWUJvTZQmKk3WWt
	 +YgG7EHJyx8UW0IIV9gZNkI+gzoBTNNSSfrDASZ33xMKUMu2Qgz0WP+P5J2GZbyk/t
	 gk/w5WmaVZ0OSwl/wWMwuEKu0Jo5cLTUzjIwysY9xH8sK/9E31SKoQqaqmVcBxoKYM
	 5uamaEaf/Nl5w==
Date: Tue, 9 Jun 2026 17:28:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: mfd: syscon: Drop custom select for
 older dtschema
Message-ID: <20260609-vertical-antarctic-e18a7ec91685@spud>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
 <20260608-n-dt-bindings-simple-bus-syscon-v3-2-4eba9ec1212a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ht75Ke9Mrmo6QJOk"
Content-Disposition: inline
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-2-4eba9ec1212a@oss.qualcomm.com>
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


--ht75Ke9Mrmo6QJOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 10:44:25PM +0200, Krzysztof Kozlowski wrote:
> Older dtschema <2024.02 required custom select to avoid applying this
> binding to anything having "syscon" compatible.  That's not the case
> anymore and this additional select has two headaches:
>=20
> 1. Duplicates all the compatibles listed in the schema.
>=20
> 2. Is error-prone, because it requires contributor to add the compatible
>    in two places, otherwise the schema will be silently ignored.
>    The select list already misses mentioning compatibles:
>    mediatek,mt8365-infracfg-nao and renesas,r9a08g046-lvds-cmn (with the
>    latter being reverted for different reasons).
>=20
> This requires bumping minimum dtschema requirement to v2024.04, which
> feels old enough to be a safe requirement.

I agree, seems reasonable enough given it's a jump from 2023.09 and not
some large jump.
The diff is nice too!
I assume Rob will be taking it, but just in case..
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> ---
>=20
> Changes in v3:
> 1. Bump dtschema requirement
>=20
> Changes in v2:
> 1. New patch
> ---
>  Documentation/devicetree/bindings/Makefile        |   2 +-
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 116 ----------------=
------
>  2 files changed, 1 insertion(+), 117 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/d=
evicetree/bindings/Makefile
> index 7b668f7fd400..40c2094f47c2 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -6,7 +6,7 @@ DT_MK_SCHEMA ?=3D dt-mk-schema
>  DT_SCHEMA_LINT =3D $(shell which yamllint || \
>    echo "warning: python package 'yamllint' not installed, skipping" >&2)
> =20
> -DT_SCHEMA_MIN_VERSION =3D 2023.9
> +DT_SCHEMA_MIN_VERSION =3D 2024.4
> =20
>  PHONY +=3D check_dtschema_version
>  check_dtschema_version:
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index 9c81010d5a74..b70018bf1bcf 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -19,122 +19,6 @@ description: |
>  maintainers:
>    - Lee Jones <lee@kernel.org>
> =20
> -# Need a select with all compatibles listed for compatibility with older
> -# dtschema (<2024.02), so this will not be selected for other schemas ha=
ving
> -# syscon fallback.
> -select:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - airoha,en7581-pbus-csr
> -          - al,alpine-sysfabric-service
> -          - allwinner,sun8i-a83t-system-controller
> -          - allwinner,sun8i-h3-system-controller
> -          - allwinner,sun8i-v3s-system-controller
> -          - allwinner,sun50i-a64-system-controller
> -          - altr,l3regs
> -          - altr,sdr-ctl
> -          - amd,pensando-elba-syscon
> -          - amlogic,meson-mx-assist
> -          - amlogic,meson-mx-bootrom
> -          - amlogic,meson8-analog-top
> -          - amlogic,meson8b-analog-top
> -          - amlogic,meson8-pmu
> -          - amlogic,meson8b-pmu
> -          - apm,merlin-poweroff-mailbox
> -          - apm,mustang-poweroff-mailbox
> -          - apm,xgene-csw
> -          - apm,xgene-efuse
> -          - apm,xgene-mcb
> -          - apm,xgene-rb
> -          - apm,xgene-scu
> -          - atmel,sama5d2-sfrbu
> -          - atmel,sama5d3-nfc-io
> -          - atmel,sama5d3-sfrbu
> -          - atmel,sama5d4-sfrbu
> -          - axis,artpec6-syscon
> -          - brcm,cru-clkset
> -          - brcm,sr-cdru
> -          - brcm,sr-mhb
> -          - cirrus,ep7209-syscon1
> -          - cirrus,ep7209-syscon2
> -          - cirrus,ep7209-syscon3
> -          - cnxt,cx92755-uc
> -          - econet,en751221-chip-scu
> -          - freecom,fsg-cs2-system-controller
> -          - fsl,imx93-aonmix-ns-syscfg
> -          - fsl,imx93-wakeupmix-syscfg
> -          - fsl,ls1088a-reset
> -          - fsl,vf610-anatop
> -          - fsl,vf610-mscm-cpucfg
> -          - hisilicon,dsa-subctrl
> -          - hisilicon,hi6220-sramctrl
> -          - hisilicon,hip04-ppe
> -          - hisilicon,pcie-sas-subctrl
> -          - hisilicon,peri-subctrl
> -          - hpe,gxp-sysreg
> -          - loongson,ls1b-syscon
> -          - loongson,ls1c-syscon
> -          - lsi,axxia-syscon
> -          - marvell,armada-3700-cpu-misc
> -          - marvell,armada-3700-nb-pm
> -          - marvell,armada-3700-avs
> -          - marvell,armada-3700-usb2-host-device-misc
> -          - marvell,armada-3700-usb2-host-misc
> -          - marvell,dove-global-config
> -          - mediatek,mt2701-pctl-a-syscfg
> -          - mediatek,mt2712-pctl-a-syscfg
> -          - mediatek,mt6397-pctl-pmic-syscfg
> -          - mediatek,mt7981-topmisc
> -          - mediatek,mt7988-topmisc
> -          - mediatek,mt8135-pctl-a-syscfg
> -          - mediatek,mt8135-pctl-b-syscfg
> -          - mediatek,mt8173-pctl-a-syscfg
> -          - mediatek,mt8365-syscfg
> -          - microchip,lan966x-cpu-syscon
> -          - microchip,mpfs-control-scb
> -          - microchip,mpfs-sysreg-scb
> -          - microchip,sam9x60-sfr
> -          - microchip,sama7d65-ddr3phy
> -          - microchip,sama7d65-sfrbu
> -          - microchip,sama7g5-ddr3phy
> -          - mscc,ocelot-cpu-syscon
> -          - mstar,msc313-pmsleep
> -          - nuvoton,ma35d1-sys
> -          - nuvoton,wpcm450-shm
> -          - nxp,s32g2-gpr
> -          - nxp,s32g3-gpr
> -          - qcom,apq8064-mmss-sfpb
> -          - qcom,apq8064-sps-sic
> -          - rockchip,px30-qos
> -          - rockchip,rk3036-qos
> -          - rockchip,rk3066-qos
> -          - rockchip,rk3128-qos
> -          - rockchip,rk3228-qos
> -          - rockchip,rk3288-qos
> -          - rockchip,rk3368-qos
> -          - rockchip,rk3399-qos
> -          - rockchip,rk3528-qos
> -          - rockchip,rk3562-qos
> -          - rockchip,rk3568-qos
> -          - rockchip,rk3576-qos
> -          - rockchip,rk3588-qos
> -          - rockchip,rv1126-qos
> -          - st,spear1340-misc
> -          - stericsson,nomadik-pmu
> -          - starfive,jh7100-sysmain
> -          - ti,am62-opp-efuse-table
> -          - ti,am62-usb-phy-ctrl
> -          - ti,am625-dss-oldi-io-ctrl
> -          - ti,am62p-cpsw-mac-efuse
> -          - ti,am654-dss-oldi-io-ctrl
> -          - ti,j784s4-acspcie-proxy-ctrl
> -          - ti,j784s4-pcie-ctrl
> -          - ti,keystone-pllctrl
> -  required:
> -    - compatible
> -
>  properties:
>    compatible:
>      oneOf:
>=20
> --=20
> 2.53.0
>=20

--ht75Ke9Mrmo6QJOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig/JQAKCRB4tDGHoIJi
0oLlAQCHwNbINj7drMDGPuJbu0+4qMK+maKGF6EB/ix0tWHZuAEA142K2XiPf6pe
EJkgVBoshBZ7NIiPUqXP5uO/FD3ooQM=
=4Xd/
-----END PGP SIGNATURE-----

--ht75Ke9Mrmo6QJOk--

