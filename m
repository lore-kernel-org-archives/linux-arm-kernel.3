Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB84FD12D6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCbZx7O3tZD/3E2j++V4l9iia2T/kRfi5M5uCjd1c+k=; b=F8YVANgMr6RNQZTwedTTdVWb2G
	8NFAyKHMjokHhLii4HofM9xVo83CCq71ecoQIxbtDfeW8KENDBysvIKrzyeU3xy9wMVZI1jIL3jh1
	nswj9/ClMFseEBGIWErKob5cOSpUgXDVcO3pgsyMIMI3fyiSTfRm2zFkLmVY+PnV9znssh4ym5yLe
	Eyd9xHZQSa5GFdZwsToFsKQPJMdOw5plszzSttWDHKJLxDfVJp6onZvEOc50N8g93LTb0oceFdfUT
	KNwhAc+DS2CMPb9/19X5ac0AvcUVJfc+IEP80MCAieYkezzn5onZ5QsuYOk/XNmiNx3gGYbJb3nHY
	kO4ktdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWRD-00000000TUt-2Szr;
	Mon, 11 Nov 2024 15:34:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWPQ-00000000TBA-3O7G;
	Mon, 11 Nov 2024 15:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E174FA41782;
	Mon, 11 Nov 2024 15:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86B5C4CED6;
	Mon, 11 Nov 2024 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731339175;
	bh=r8avJOgeVnHmCQ1tIPDEAoD6KMM+18rldtBBgroTd4s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Dq4ZRtgXjHZZ63uC5JzTAgqwfrl+cT85RYM80IhD1SuvaTaZaAeWymI4w9P6DAtyb
	 TK1RZx6nYV1FxYpZ2aCtjgxxUCP/FbEZXXYrDW+kY48Ze7jqHHx9MnFr6+Vo9D/DYT
	 xC8VqlmWRzcf330Zg8HtIFjZHdSJEa8lDToAg/uItkY36sJhJmX+HMKE8twd/OQCpP
	 HqFCFnUYebC4+kGGiTc6mdU0mSguLM5NBK1yRokiZLRHEDxX+g4zLO+PUnJnObDVND
	 1XeHxRM2JIENzbyjH6qgry5qx3hmAOZntzliUZw957ALIbxfB776IHt7LZEiIiSJps
	 yk14S8C0s4gCw==
Date: Mon, 11 Nov 2024 09:32:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org, 
 linux-mmc@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-watchdog@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 linux-usb@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
Message-Id: <173133346581.1281779.16221268010355943435.robh@kernel.org>
Subject: Re: [PATCH 00/14] arm64: dts: allwinner: Add basic Allwinner A523
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_073257_008151_BB32E792 
X-CRM114-Status: GOOD (  38.93  )
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


On Mon, 11 Nov 2024 01:30:19 +0000, Andre Przywara wrote:
> Hi,
> 
> this series adds basic DT support for the Allwinner A523 SoC, plus the
> Avaota-A1 router board using the T527 package variant of that SoC.[1]
> Functionality-wise it relies on the pinctrl[2] and clock[3] support
> series, though there is no direct code dependency series to this series
> (apart from the respective binding patches in the two series').
> 
> Most of the patches add DT binding documentation for the most basic
> peripherals, the vast majority of them actually being already supported,
> courtesy of identical IP being used. This includes MMC and USB 2.0, so
> with the above mentioned clock and pinctrl support this gives an already
> somewhat usable mainline support for this new SoC family.
> The watchdog is not completely compatible, but is an easy addition, so
> this bit is included in here as well.
> 
> The A523 features 8 Arm Cortex-A55 cores, organised in two clusters,
> clocked separately, with different OPP limits, in some kind of
> little/LITTLE configuration. The GPU is a Arm Mali G57 MC01, and the chip
> also features a single PCIe 2.1 lane, sharing a PHY with some USB 3.1
> controller - which means only one of the two can be used.
> The rest of the SoC is the usual soup of multimedia SoC IP, with eDP
> support and two Gigabit Ethernet MACs among the highlights.
> 
> The main feature is patch 11/14, which adds the SoC .dtsi. This for now
> is limited to the parts that are supported and could be tested. At the
> moment there is no PSCI firmware, even the TF-A port from the BSP does
> not seem to work for me. That's why the secondary cores have been omitted
> for now, among other instances of some IP that I couldn't test yet.
> I plan to add them in one of the next revisions.
> 
> The last patch adds basic support for the Avaota-A1 router board,
> designed by YuzukiHD, with some boards now built by Pine64.
> 
> The mainline firmware side in general is somewhat lacking still: I have
> basic U-Boot support working (including MMC and USB), although still
> without DRAM support. This is for now covered by some binary blob found
> in the (otherwise Open Source) Syterkit firmware, which also provides
> the BSP versions of TF-A and the required (RISC-V) management core
> firmware. Fortunately we have indications that DRAM support is not that
> tricky, as the IP blocks are very similar to already supported, and dev
> boards are on their way to the right people.
> 
> Meanwhile I would like people to have a look at those DT bits here. Please
> compare them to the available user manual, and test them if you have access
> to hardware.
> 
> Based on v6.12-rc1.
> I pushed a branch with all the three series combined here:
> https://github.com/apritzel/linux/commits/a523-v1/
> 
> Cheers,
> Andre
> 
> [1] https://linux-sunxi.org/A523#Family_of_sun55iw3
> [2] https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/#t
> [3] https://lore.kernel.org/linux-sunxi/20241111004722.10130-1-andre.przywara@arm.com/T/#t
> 
> Andre Przywara (14):
>   dt-bindings: mmc: sunxi: Simplify compatible string listing
>   dt-bindings: mmc: sunxi: add compatible strings for Allwinner A523
>   dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
>   watchdog: sunxi_wdt: Add support for Allwinner A523
>   dt-bindings: i2c: mv64xxx: Add Allwinner A523 compatible string
>   dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI
>     controller
>   dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
>   dt-bindings: usb: sunxi-musb: add Allwinner A523 compatible string
>   dt-bindings: usb: add A523 compatible string for EHCI and OCHI
>   dt-bindings: rtc: sun6i: Add Allwinner A523 support
>   arm64: dts: allwinner: Add Allwinner A523 .dtsi file
>   dt-bindings: vendor-prefixes: Add YuzukiHD name
>   dt-bindings: arm: sunxi: Add Avaota A1 board
>   arm64: dts: allwinner: a523: add Avaota-A1 router support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
>  .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
>  .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  40 +-
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  10 +-
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   4 +-
>  .../usb/allwinner,sun4i-a10-musb.yaml         |   1 +
>  .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
>  .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 386 ++++++++++++++++++
>  .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 311 ++++++++++++++
>  drivers/watchdog/sunxi_wdt.c                  |  11 +
>  15 files changed, 751 insertions(+), 26 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> 
> --
> 2.46.2
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


New warnings running 'make CHECK_DTBS=y allwinner/sun55i-t527-avaota-a1.dtb' for 20241111013033.22793-1-andre.przywara@arm.com:

In file included from arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts:6:
arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:6:10: fatal error: dt-bindings/clock/sun55i-a523-ccu.h: No such file or directory
    6 | #include <dt-bindings/clock/sun55i-a523-ccu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:129: arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb] Error 1
make[2]: *** [scripts/Makefile.build:478: arch/arm64/boot/dts/allwinner] Error 2
make[2]: Target 'arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1399: allwinner/sun55i-t527-avaota-a1.dtb] Error 2
make: *** [Makefile:224: __sub-make] Error 2
make: Target 'allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.






