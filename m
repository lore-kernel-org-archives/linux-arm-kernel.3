Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0ADC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LW2HpJYaZjs9w/FFZTJghV+jHcxfHB/ef3dIdWSmXk4=; b=3qzZcV89b8MvDBS5AX/vb4H+X6
	6Thfl/9NC587LSUIx6xER1woNPIpl5JjvQ0+dImDfRuheWfrrJkk5I7+8RUmYogqg7hqq+3njdoNq
	n/yzO/dJPAoILcLLxFrCzAcf4i1Zj88xGjdRRX1cpHutykPbkdacdLK8tY8Vxpfk2pAJgZfHBSzdf
	AMWS6/q150zQPE+FE50gkE/8UbjggG/4qlmNVSS3PQWX6CHfzUI67qJTFaWzXnCX2LL0OjEyTrPXI
	SE0sPABdk/w4Fto8TaY5DKf+1wGHPO1B/KORf2UTMjTFjvAkAcjCFpHOHzeU9FpPiCIE8rR7Eq9mf
	/prEPk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tde9Q-00000009o2i-44aO;
	Thu, 30 Jan 2025 23:40:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde6o-00000009niE-3mHr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41F6CA42585;
	Thu, 30 Jan 2025 23:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F95AC4CED2;
	Thu, 30 Jan 2025 23:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280285;
	bh=cNlalbXYNDV6xKsFrZhu/iStGEI1hyTXWGl4GqKOsWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WacLaxVE833mJZhmeypQviKRFTg6/aODhz6V64rgVa8z+464/P0ddo13+Qra8ZshZ
	 39LsqlChbxg2tzlFiLEufCj8HEZq0RIR+gok4DFYH1WseQ2jEX1Zd6MnmMDfXIUAnE
	 XHIi9n2vGxCF+z8NY7SBk+bppTfGLkM7RVT7JurCGZvnngWoYEpZCzQy4LDQzSGMmM
	 e4x/g45PVLxBvmJF2KygNq/lLPl3bPprVzg3oVr+jEwoI8c4VlZp0v9J1SRNp9EWUb
	 Hll9jy0IKHwWEH7PLaaR3CKhc8v/j3z2HebF2p3o0a/9YAy7bnC/gSYwv5YTWTJ/ma
	 XdLGxuycQhmJg==
Date: Thu, 30 Jan 2025 17:38:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
Message-Id: <173828013202.1872493.8212881147597194221.robh@kernel.org>
Subject: Re: [PATCH 0/4] Make i.MX8M Nano OCOTP work as accessing
 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153807_077385_EA4E5997 
X-CRM114-Status: GOOD (  19.10  )
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


On Thu, 30 Jan 2025 14:00:57 +0100, Alexander Stein wrote:
> Hi,
> 
> inspired by [1] this adds the accessing controller feature to i.MX8M Nano.
> The OCOTP eFuse has bits which can disable particular peripherals, such as
> GPU, MIPI-DSI oder USB.
> 
> In OCOTP driver, the nodes under "/" will be iterated, and checked
> if property "#access-controllers" exsits. If not allow access, detach
> the node.
> 
> I successfully used this on a i.MX8M Nano DualLite which has GPU disabled.
> Without this patchset the default DT completly freezes the SoC if GPU
> is accessed.
> Using this patchset the GPU is disabled without any DT modification from
> bootloader:
> > imx_ocotp 30350000.efuse: /soc@0/gpu@38000000: disabled by fuse, device driver will not be probed
> 
> Adding the other i.MX8M SoCs is straight forward.
> 
> Best regards,
> Alexander
> 
> [1] https://lore.kernel.org/all/20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com/
> 
> Alexander Stein (4):
>   dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano access controller
>     definitions
>   nvmem: imx-ocotp: Sort header alphabetically
>   nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
>   arm64: dts: imx8mn: Add access-controller references
> 
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi    |   8 ++
>  drivers/nvmem/Kconfig                        |   3 +
>  drivers/nvmem/imx-ocotp.c                    | 107 ++++++++++++++++++-
>  include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h |  16 +++
>  4 files changed, 132 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250130130101.1040824-1-alexander.stein@ew.tq-group.com:

arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: dsi@32e10000: access-controllers: [[20, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: dsi@32e10000: access-controllers: [[20, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: dsi@32e10000: access-controllers: [[19, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: dsi@32e10000: access-controllers: [[16, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: dsi@32e10000: access-controllers: [[20, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: dsi@32e10000: access-controllers: [[17, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: easrc@300c0000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: efuse@30350000: Unevaluated properties are not allowed ('#access-controller-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/imx-ocotp.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: ethernet@30be0000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: dsi@32e10000: access-controllers: [[17, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: dsi@32e10000: access-controllers: [[17, 5]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: mipi-csi@32e30000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/nxp,imx-mipi-csi2.yaml#
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: usb@32e40000: Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: gpu@38000000: 'access-controllers' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#






