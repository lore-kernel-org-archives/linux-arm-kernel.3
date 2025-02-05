Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C015C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wagIzksQ0xcPOl077x3GIf0usKoHQ1GXfFVnLE292SM=; b=r2v3JyrAsJ7KB9hqOOjNZiq2KY
	p0PezlDGVahln/NqISi6oCVyKiQqT+/lYxlSiEkQxLtb2i+zBQs7lQMCR5daENRuzLUA3AUeg+Fvt
	dn0RIq7StV6dTV/zlSDGqe2PlbLWZ8Cv42h2PUjsnz4vYw+rW2S6nZ3W5uEXnwwum0GZ5MRGaJxM1
	s+D+uiAyZ7yJIrC9jrfmGwQovD8bwlIirn+8cLyint9qOzIyDFpXd1QYe02xl8H1aHlC0OQtuZd1m
	Nc7G6xzWStO+mtyu021ptJlscwHrt5AyS7331wbUNbtNZDMSsy+TpIcdiH3QN6qF60Ilr2qzic6YY
	fcoNYC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl2l-00000004P23-1B0Z;
	Wed, 05 Feb 2025 19:26:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfktb-00000004Nz6-0l9s;
	Wed, 05 Feb 2025 19:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 076055C5CD0;
	Wed,  5 Feb 2025 19:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7EFC4CED1;
	Wed,  5 Feb 2025 19:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738783029;
	bh=RudzayPq+ls6/2gLbJyVXITOTNOFPZ85hq9AVF8CDPk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IjjsPKkNuj+m+6+KbEQVTd5oah6lDbVouJ+AINnzPPejRrf0UEdXRphc6v8FnI1iW
	 +nZ8CXSNlCnKnRGGRVTdtknEw6UovKVQ6EsYqce5wU8HU5w6xTXytyp9MJtnkz2ePb
	 OekZI8Bx1yAa9IzEJux67Z23K9mNzNoiYUXh02YSrCrLaXN1g7VMxf2nW7pluGnMcH
	 yyADoxA4no0dTX/JpxTrV2m5p4JGqmi9P9H294IF3ym/EBnXysL6sdebN8vB+Myy75
	 jPiRJdszx0agZ8ARs+zX98RHGdjOb150rI+YVtrXaoaehkVzRVhpYVNNZNCaSZfxSh
	 uquOSOauvi96Q==
Date: Wed, 05 Feb 2025 13:17:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
 linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, 
 Albert Ou <aou@eecs.berkeley.edu>, Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 devicetree@vger.kernel.org
To: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
Message-Id: <173878294158.2545960.16253374239758023814.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] Support for Allwinner V853 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111711_314741_7F70AB5C 
X-CRM114-Status: GOOD (  24.03  )
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


On Wed, 05 Feb 2025 13:52:15 +0100, Andras Szemzo wrote:
> V85x is a SoC from Allwinner with video encoding targeted for the field of
> IP Camera. It integrates the single CA7 core, and a T-Head E907 RISC-V mcu.
> The SoC has the usual Allwinner peripherals and a Vivante NPU.
> V853 is a BGA package without DRAM, V851s/V851s3 has the same die with
> co-packaged 64MB/128MB DRAM (in a QFN88 package).
> 
> This patchset tries to add basical support for the V853 device family.
> 
> Changelog - v2:
>  - rebased on 6.14-rc1
>  - add a needed gate with key support to sunxi clk
>  - rewrite the ccu-r driver
>  - fix license issues
>  - remove the pinctrl binding, as it has beed applied
>  - rework the pinctrl driver, use the new sunxi dt based mux support. This new pinctrl
>    driver depends on the new sunxi device-tree based mux support patch series [1].
>  - remove the new usb phy binding, as the v853's usb phy is very close to d1/a64
>  - add a board dts
>  - ccu: add module description
>  - ccu: fix PLL enable bits, and min multipliers
>  - ccu: change PLL flags to CLK_SET_RATE_GATE
>  - ccu: use SUNXI_CCU_M_HWS at peripheral PLLs
>  - ccu: convert the VIDEO and CSI PLLs from nm type to nkmp according to BSP
>  - ccu: cpu axi clk use pointer
>  - ccu: fix comments
>  - ccu: swap i2s1 and i2s0 bus clocks
>  - ccu: fix indentation
>  - ccu: fix RST_BUS_SPIF order
>  - ccu: convert RST_RISCV_CLK_GATING from reset to gate
> 
> [1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/
> 
> Andras Szemzo (10):
>   clk: sunxi-ng: allow key feature in ccu reset and gate
>   pinctrl: sunxi: add driver for Allwinner V853
>   dt-bindings: clock: sunxi-ng: add compatibles for V853
>   clk: sunxi-ng: add CCU drivers for V853
>   dt-bindings: power: add V853 ppu bindings
>   pmdomain: sunxi: add V853 ppu support
>   dt-bindings: phy: allwinner: add v853 usb phy
>   phy: allwinner: add v853 usb phy compatible
>   ARM: dts: sun8i: add DTSI file for V853
>   ARM: dts: sun8i: add DTS file for yuzuki-lizard V851s
> 
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |    3 +
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |    2 +
>  .../power/allwinner,sun20i-d1-ppu.yaml        |    1 +
>  arch/arm/boot/dts/allwinner/Makefile          |    1 +
>  .../boot/dts/allwinner/sun8i-v851s-lizard.dts |  196 +++
>  arch/arm/boot/dts/allwinner/sun8i-v853.dtsi   |  656 ++++++++++
>  drivers/clk/sunxi-ng/Kconfig                  |   10 +
>  drivers/clk/sunxi-ng/Makefile                 |    4 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c       |  120 ++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h       |   14 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.c         | 1145 +++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.h         |   14 +
>  drivers/clk/sunxi-ng/ccu_common.h             |    2 +
>  drivers/clk/sunxi-ng/ccu_gate.c               |    6 +
>  drivers/clk/sunxi-ng/ccu_gate.h               |   14 +
>  drivers/clk/sunxi-ng/ccu_mux.c                |    4 +-
>  drivers/clk/sunxi-ng/ccu_reset.c              |    7 +
>  drivers/clk/sunxi-ng/ccu_reset.h              |    2 +-
>  drivers/phy/allwinner/phy-sun4i-usb.c         |   10 +
>  drivers/pinctrl/sunxi/Kconfig                 |    5 +
>  drivers/pinctrl/sunxi/Makefile                |    1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c    |   53 +
>  drivers/pmdomain/sunxi/sun20i-ppu.c           |   15 +
>  .../clock/allwinner,sun8i-v853-ccu.h          |  132 ++
>  .../clock/allwinner,sun8i-v853-r-ccu.h        |   16 +
>  .../power/allwinner,sun8i-v853-ppu.h          |   10 +
>  .../reset/allwinner,sun8i-v853-ccu.h          |   60 +
>  .../reset/allwinner,sun8i-v853-r-ccu.h        |   14 +
>  28 files changed, 2513 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.h
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
> 
> --
> 2.39.5
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/allwinner/' for 20250205125225.1152849-1-szemzo.andras@gmail.com:

arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: /: memory: False schema does not allow {'reg': [[1073741824, 67108864]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: /: memory: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/memory.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: /: failed to match any schema with compatible: ['yuzukihd,lizard', 'allwinner,sun8i-v853', 'allwinner,sun8i']
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: /: failed to match any schema with compatible: ['yuzukihd,lizard', 'allwinner,sun8i-v853', 'allwinner,sun8i']
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: /: failed to match any schema with compatible: ['yuzukihd,lizard', 'allwinner,sun8i-v853', 'allwinner,sun8i']
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: cpu@0: compatible: ['arm,cortex-a7', 'arm,armv7'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['arm,cortex-a7', 'arm,armv7']
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: pinctrl@2000000: uart0-ph9-pins: 'allwinner,pinmux' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: pinctrl@2000000: spi0-pins: 'allwinner,pinmux' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: pinctrl@2000000: i2c2-ph11-pins: 'allwinner,pinmux' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: pinctrl@2000000: mmc0-pins: 'allwinner,pinmux' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: pinctrl@2000000: mmc1-pins: 'allwinner,pinmux' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@2001000: clock-names:1: 'losc' was expected
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@2001000: clock-names:2: 'iosc' was expected
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500000: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500000: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500000: Unevaluated properties are not allowed ('dma-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500400: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500400: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500800: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500800: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500c00: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: serial@2500c00: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: syscon@3000000: sram@20000:sram-section@0:compatible: 'oneOf' conditional failed, one must be fixed:
	['allwinner,sun8i-v3s-sram-c', 'allwinner,sun4i-a10-sram-c1'] is too long
	'allwinner,sun4i-a10-sram-a3-a4' was expected
	'allwinner,sun4i-a10-sram-c1' was expected
	'allwinner,sun4i-a10-sram-d' was expected
	'allwinner,sun50i-a64-sram-c' was expected
	'allwinner,sun8i-v3s-sram-c' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
	'allwinner,sun8i-v3s-sram-c' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
	'allwinner,sun8i-v3s-sram-c' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
	'allwinner,sun50i-h6-sram-c' was expected
	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: /soc/syscon@3000000/sram@20000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun8i-v3s-sram-c', 'allwinner,sun4i-a10-sram-c1']
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: hwlock@3005000: '#hwlock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-a31-hwspinlock.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: hwlock@3005000: 'clock-names', 'interrupts', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-a31-hwspinlock.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: hstimer@3008000: interrupts: [[0, 55, 4], [0, 56, 4]] is too short
	from schema $id: http://devicetree.org/schemas/timer/allwinner,sun5i-a13-hstimer.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: phy@4100400: reg: [[68158464, 256], [68163584, 256]] is too short
	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: phy@4100400: reg-names: ['phy_ctrl', 'pmu0'] is too short
	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: phy@4100400: clocks: [[1, 94]] is too short
	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: phy@4100400: clock-names: ['usb0_phy'] is too short
	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: phy@4100400: resets: [[1, 38]] is too short
	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: phy@4100400: reset-names: ['usb0_reset'] is too short
	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: phy@4100400: 'usb0_id_det-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@7010000: clocks: [[4], [5, 2], [5, 0], [1, 10], [1, 19]] is too long
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@7010000: clock-names:1: 'losc' was expected
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@7010000: clock-names:2: 'iosc' was expected
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@7010000: clock-names: ['hosc', 'iosc', 'losc', 'pll-periph', 'pll-audio'] is too long
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@7010000: clocks: [[4], [5, 2], [5, 0], [1, 10], [1, 19]] is too long
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: clock-controller@7010000: clock-names: ['hosc', 'iosc', 'losc', 'pll-periph', 'pll-audio'] is too long
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: intc-nmi@7010320: $nodename:0: 'intc-nmi@7010320' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: intc-nmi@7010320: Unevaluated properties are not allowed ('#address-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: rtc@7090000: clocks: [[17, 4]] is too short
	from schema $id: http://devicetree.org/schemas/rtc/allwinner,sun6i-a31-rtc.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: rtc@7090000: clock-names: ['bus'] is too short
	from schema $id: http://devicetree.org/schemas/rtc/allwinner,sun6i-a31-rtc.yaml#
arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dtb: rtc@7090000: 'resets', 'wakeup-source' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/rtc/allwinner,sun6i-a31-rtc.yaml#






