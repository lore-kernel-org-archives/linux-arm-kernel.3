Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AC4C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiclCy2Pvqs887MUeI2RLeXZ7Xgu1N2DKJojilcqc7A=; b=lzHoAagwtc6V265xyvNXvGfXwd
	uENo0twsNc6HptKzYYTaDHiFf/gKJBJ3UoSdn1J5eJrmWnZxE5/11vIIqwQhxQJfSb+zqLX6h/oeQ
	Q9fOr/X+5nBAtRXn/D/OMxL1tjaYeLJ0hi7sidchU/w+QR6ZcQhzeneS9OBFjqLd0luYMFBuNLID1
	7wah0CoehieFfHH9njQOKDfGhClsbgxVglNgpGo7zPTsxoV/GVbxBO9XXJpPlyzTNxJ5zoOvdv5pI
	6yOKiFK/dfKD77UPZdKvlwuvP3Frqd3lnh24Vny0pr8fhDjKoMiMKPSsC0NSEGyWu6U2W2OU/w78q
	x0iufWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqlL-00000003Kcn-17xz;
	Mon, 07 Jul 2025 18:40:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYq3t-00000003DzL-0PSL;
	Mon, 07 Jul 2025 17:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BF2261464;
	Mon,  7 Jul 2025 17:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0731EC4CEF1;
	Mon,  7 Jul 2025 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751910928;
	bh=4i3GwwYmMwd8rgyfXHO3jnhHMlDIeHEAOL0OdWiCZs0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZK9sXsM8/2KLy4877qvvhXzU663uegkJK0fCwXksNxOOSx49qQic8lwOQ1jCddztZ
	 xkXUryp9zl0ZVQUAd5SWytFQCGbNBaAOpe+z9MMasq2x06hI2Cl+5Z37wj1fbAoZrh
	 55aHAfof3fOKnGn8LBjX1TWs7ZRHvZlgKUi2qh6vZdAJ/izndrVP68pvXxH21o85X5
	 /HaOtlzbWOQcTDCDvxPbCHh0PdRw9xJFDOQgcDqRwCygmjk+baWyPZms4NiUew8cHb
	 KdqSxP50knRFjCxQZIueoMEP8J/0vE12M3npqwyue4LEHAvIshFXbwEWIrToOEjJ/U
	 VQJpIfWB/ePdw==
Date: Mon, 07 Jul 2025 12:55:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
To: Lukas Schmid <lukas.schmid@netcube.li>
In-Reply-To: <20250706183601.157523-1-lukas.schmid@netcube.li>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
Message-Id: <175191074348.3364659.3018850166698272326.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] Add support for NetCube Systems Nagami SoM and
 its carrier boards
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


On Sun, 06 Jul 2025 20:35:53 +0200, Lukas Schmid wrote:
> This series adds support for the NetCube Systems Nagami SoM and its
> associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
> Carrier.
> 
> Changes in v2:
>  - Squash the binding patches into one patch
>  - Fix formatting of the phy node in the SoM dtsi
>  - Add description on where the phy is located in the SoM dtsi
>  - Fix the phy address in the SoM dtsi
>  - Move the carrier bindings into the same description as enums
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
> Lukas Schmid (5):
>   dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier
>     board bindings
>   riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube
>     Systems Nagami SoM
>   ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
>   ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
>   ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |  17 ++
>  arch/arm/boot/dts/allwinner/Makefile          |   3 +
>  ...n8i-t113s-netcube-nagami-basic-carrier.dts |  63 +++++
>  ...8i-t113s-netcube-nagami-keypad-carrier.dts | 165 +++++++++++++
>  .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 227 ++++++++++++++++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  36 +++
>  6 files changed, 511 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> 
> --
> 2.39.5
> 
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250704 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/allwinner/' for 20250706183601.157523-1-lukas.schmid@netcube.li:

arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: dcxo-clk (fixed-clock): 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: gpio@20 (microchip,mcp23008): Unevaluated properties are not allowed ('interrupt-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: usb@4100000 (allwinner,sun20i-d1-musb): dr_mode:0: 'device' is not one of ['host', 'otg', 'peripheral']
	from schema $id: http://devicetree.org/schemas/usb/allwinner,sun4i-a10-musb.yaml#
arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: status-led (leds-group-multicolor): $nodename:0: 'status-led' does not match '^multi-led(@[0-9a-f])?$'
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: status-led (leds-group-multicolor): Unevaluated properties are not allowed ('color', 'function' were unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dtb: dcxo-clk (fixed-clock): 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#






