Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F1BC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfmkBA+TLrvmiqh2ByRxsu5V8RBe/hClcvxH9bp5+f4=; b=STdu8fA1dGIFBdSZQoMdtyRRcu
	j9OJoWq9reLm+bfnEO4z1F1OetyUpcIacJE2GAwUL6gf10xmUjOJUwQIJmaBMbRKpml/9fVM8Tzdl
	XLLSHKuPjp7aPEEcYlN8eero+qYXRYU+Zvgjzla46lXu7kK+2RIq5g4/8EkPosxqrjiLPPNzTzGNW
	aONlnMYB5M0UzUj7RvQlInqtfP1afwVFSeSToJ/MUcBCBrh5vDW4iKvCHQUKY68U7jdlCwJKPmiDc
	3U+v2kQ2ziTn6K41tUAHMbXRqif6Qsxx9Qbc72CCg1JNn/2hTJlIQ77ZyDxpU0vWZ2hKmw4BNegdz
	09Zx/WAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeTW-00000004WpS-1Re1;
	Mon, 09 Jun 2025 15:31:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdzx-00000004RkY-0RcH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18A735C4AE2;
	Mon,  9 Jun 2025 14:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4926EC4CEEB;
	Mon,  9 Jun 2025 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481275;
	bh=c3I1WqrC2X6JXYBDt3lNkCQiH8RtfeiJfdwPFjMBydM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=B1UeKD5f2qgZnRtBM7uUg1CIIJe0fJDbLLKHJthtFwxoWSKlIVE05iBPcexMl6pjw
	 hyfWn2VC42wKTrpRP9RmubnwBghnj/nCyyhwJi/9Gob5Ieu8l8tAXtG4Xx0SD27zYV
	 n3zsK2E/xSNE1CwpMyaIAzFnBjquZgcR7yQxZbGViPTwdCPlVyxoT087lwx7I8lngM
	 vrIBCE4E4XcRlMhzcMEfhBBjqeX35HvV8cOrZ3PicxY2HmGITs1XIkQ8+4tkZ1X5GS
	 1c5PH/WN1n13PG3Fza2EmU+GRGsvRiqTVwSzgcQ7LlFCTuwVLSSZAT5L/+Slrc+dtQ
	 /Uw5PWzgGFKyw==
Date: Mon, 09 Jun 2025 10:01:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Marek Vasut <marex@denx.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Eric Biggers <ebiggers@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, 
 Matteo Lisi <matteo.lisi@engicam.com>, 
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
 Primoz Fiser <primoz.fiser@norik.com>, 
 Max Merchel <Max.Merchel@ew.tq-group.com>, 
 Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Markus Niebel <Markus.Niebel@tq-group.com>, 
 linux-amarula@amarulasolutions.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
Message-Id: <174948105106.2282643.172324663412189128.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] Support Engicam MicroGEA boards
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080117_235331_D977760C 
X-CRM114-Status: GOOD (  17.98  )
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


On Mon, 09 Jun 2025 12:15:33 +0200, Dario Binacchi wrote:
> The series adds support for Engicam MicroGEA boards:
> 
> - BMM
> - RMM
> - GTW
> 
> based on MicroGEA-MX6UL SoM.
> 
> Changes in v2:
> - Change local-mac-address to 00 00 00 00 00 00. The actual value will
>   be set by the bootloader. The previous one was assigned to Freescale
>   Semiconductor.
> - Move iomuxc and iomuxc_snvs nodes to the end of the DTS files.
> - Drop an extra blank line from the DTS file.
> 
> Dario Binacchi (10):
>   dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
>   ARM: dts: imx6ul: support Engicam MicroGEA BMM board
>   ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
>   ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
>   dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA RMM board
>   dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
>   ARM: dts: imx6ul: support Engicam MicroGEA GTW board
>   ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   9 +
>  arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
>  .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 +++++++++++++++
>  .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 163 ++++++++
>  .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
>  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
>  arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
>  7 files changed, 944 insertions(+), 21 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> 
> --
> 2.43.0
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> branch: imx6ull-engicam-microgea
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250609101637.2322809-1-dario.binacchi@amarulasolutions.com:

arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#






