Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5980C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fakP73+t3wZ6cPJO5poZuRakmtAoPG29U0ZRKZK9GnU=; b=JTSCgV+dp0fbFPjsVfofuoIzMe
	e4ToI1Tai/PxH9WmfMTeL9tIkL/GBVzTyEcxxTa6RmvBsvZlQcVnL8CR9dYz++X3sQupGnqUkdm1b
	glshTMf8aJWRn9j6khGW6as/RNY5rWXdqnF0Oeos+CcjBPkiC5sK/zRbXhvXr+CjyaUoW1MRpzg3q
	aZIYiYQjkUwl4sxD14JQKJ8fRpnlVLUlqaElsHkBftVcJ8DmvIdXVPLgfQxTUyDS8hdQdE+rtsxI1
	58DUQcWGF8YiHqIVGAQGj1A2rqJ7EkFTYPMywGslsgyI+OkLscG5fOr+QPZEhXieQSg5uzYAvWm+L
	TWaAoMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfD4-00000003CVv-3i5i;
	Mon, 10 Mar 2025 15:38:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treEw-00000002wm1-1gD2;
	Mon, 10 Mar 2025 14:36:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3F695C66D4;
	Mon, 10 Mar 2025 14:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD09C4CEED;
	Mon, 10 Mar 2025 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741617381;
	bh=7EEMVaFexgLc6pVJL7mrzAPNCcixahyfiK4unhrdXiw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AFQ+7R+aRontN6fPv0/HgRdTHM+2jCP8gLb3fFNBIIqBjJgaSNZTzlJCpJtDit3DX
	 /k7CpIG8MNvyoClOmWfI+0zuclf7yQvycIW8C7dCSVE75gQbDGVXqUYFk6G6pnF3Fv
	 5ttun5Y6xWEc0030EoS7Cryb86LEPT61w+DREAfr0zc8NtCYArA7opqJPX3zZejakD
	 y7lymlPh1tiGqaRt2rlgq3lbTbJZNgSCfbFvAoBdqj23xJ8aEtQ2yAWxmfYgybRN/j
	 aY+SDuFXh1C5SKGHOmd56vXuuGxCtD+0MwvNpdeO3bVdearATPNJLwGPKz0vpjUM1a
	 ZnNR0JNtov2pw==
Date: Mon, 10 Mar 2025 09:36:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, 
 Ben Hutchings <ben@decadent.org.uk>, Conor Dooley <conor+dt@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 upstream@airoha.com, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>, 
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 Nikita Shubin <nikita.shubin@maquefel.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Danzberger <dd@embedd.com>, Yangyu Chen <cyy@cyyself.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
Message-Id: <174161712595.4185316.12073621496624773779.robh@kernel.org>
Subject: Re: [PATCH 00/13] airoha: en7581: clk cleanup + USB support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_073622_526565_D33DCF1E 
X-CRM114-Status: GOOD (  25.42  )
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


On Sun, 09 Mar 2025 14:29:31 +0100, Christian Marangi wrote:
> This series implement all the changes required to correctly handle
> USB support for the Airoha EN7581 SoC.
> 
> The first few patch are cleanup for the clock driver and the
> introduction of the SCU SSR SoC driver.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> To correctly handle this, the SCU is changed to a simple-mfd
> implemenetation and the clock controller updated to follow this new
> node structure. Both implementation are supported to handle old
> binding.
> 
> The xHCI USB is based on the Mediatek implementation but the PHY
> handling although conceptually similar, is indded different compared
> to Mediatek due to SSR checks and different port power up.
> 
> The SSR driver expose an API to poll the current status of the Serdes
> port and the USB PHY driver validates it. Refer to the specific commit
> for additional info.
> 
> Consider that there is currently an inconsistency as AN7581 and
> EN7581 refer to the same thing. This is due to the fact that
> the SoC born under EcoNet but then was acquired by Airoha.
> 
> Christian Marangi (13):
>   clk: en7523: convert driver to regmap API
>   clk: en7523: generalize register clocks function
>   dt-bindings: soc: airoha: add SCU SSR Serdes port binding
>   dt-bindings: soc: airoha: add Documentation for Airoha AN7581 SCU SSR
>   dt-bindings: mfd: add Documentation for Airoha EN7581 SCU
>   dt-bindings: clock: airoha: make reg optional for Airoha EN7581
>   clk: en7523: support getting regmap from parent node for EN7581
>   soc: airoha: add support for configuring SCU SSR Serdes port
>   dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
>   phy: airoha: Add support for Airoha AN7581 USB PHY
>   usb: host: add ARCH_AIROHA in XHCI MTK dependency
>   arm64: dts: airoha: en7581: convert SCU clock node to MFD
>     implementation
>   arm64: dts: airoha: en7581: add USB and SCU SSR nodes
> 
>  .../bindings/clock/airoha,en7523-scu.yaml     |  13 +-
>  .../mfd/airoha,en7581-scu-sysctl.yaml         |  68 +++
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 106 ++++
>  .../soc/airoha/airoha,an7581-scu-ssr.yaml     | 106 ++++
>  MAINTAINERS                                   |  15 +
>  arch/arm64/boot/dts/airoha/en7581.dtsi        |  74 ++-
>  drivers/clk/clk-en7523.c                      | 258 ++++----
>  drivers/phy/Kconfig                           |   1 +
>  drivers/phy/Makefile                          |   3 +-
>  drivers/phy/airoha/Kconfig                    |  13 +
>  drivers/phy/airoha/Makefile                   |   3 +
>  drivers/phy/airoha/phy-airoha-usb.c           | 554 ++++++++++++++++++
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/airoha/Kconfig                    |  18 +
>  drivers/soc/airoha/Makefile                   |   3 +
>  drivers/soc/airoha/airoha-scu-ssr.c           | 195 ++++++
>  drivers/usb/host/Kconfig                      |   2 +-
>  include/dt-bindings/soc/airoha,scu-ssr.h      |  24 +
>  include/linux/soc/airoha/airoha-scu-ssr.h     |  17 +
>  include/linux/soc/soc/airoha-scu-ssr.h        |  17 +
>  21 files changed, 1355 insertions(+), 137 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  create mode 100644 drivers/phy/airoha/phy-airoha-usb.c
>  create mode 100644 drivers/soc/airoha/Kconfig
>  create mode 100644 drivers/soc/airoha/Makefile
>  create mode 100644 drivers/soc/airoha/airoha-scu-ssr.c
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
>  create mode 100644 include/linux/soc/airoha/airoha-scu-ssr.h
>  create mode 100644 include/linux/soc/soc/airoha-scu-ssr.h
> 
> --
> 2.48.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/airoha/' for 20250309132959.19045-1-ansuelsmth@gmail.com:

arch/arm64/boot/dts/airoha/en7581-evb.dtb: usb@1fab0000: compatible:0: 'mediatek,mtk-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: usb@1fab0000: compatible: ['mediatek,mtk-xhci'] is too short
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: usb@1fad0000: compatible:0: 'mediatek,mtk-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: usb@1fad0000: compatible: ['mediatek,mtk-xhci'] is too short
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#






