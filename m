Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA30CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kArzFMIcBIxePD2xmZid//yzmrcW+b6mkQsi9y+ZwnE=; b=sLSBJQ6lFOMwzENoiykEIWJlXC
	jcdHE7Izv2OwjLMfS5zXbqM1doUi9WwdmGXnzEyhPt28JrEhDnOQpIB4lrPWE+Fg5DtWE58RBiSau
	9Y0DpgUuQp0p3v4fwaMtC2vwRDNfzPPcrQT0teAshf6Fn/eWeP+rzQTExH+IAs+sjw6f0WtkH6803
	4qukMiAlrNNjVAmtxKAi+1d/v1CGclABxAQVaBmqdB8aD8Mj9aNhJJAJYBohGM97KaAS3DNMyvCme
	I4LvPPRFzTJDymYwbJWLO/pb29hKVw5RYeChMAqVgAvWuuCYGrPuQddh9TyUAB0XyBtRB+6Vo40Hm
	5+P5IcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWO8-00000001a8D-1I6C;
	Tue, 02 Sep 2025 19:09:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQtU-0000000Ha4H-2lmh;
	Tue, 02 Sep 2025 13:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F9941ABF;
	Tue,  2 Sep 2025 13:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28A0C4CEED;
	Tue,  2 Sep 2025 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819072;
	bh=0xocXOa6y0rnRdA2Z5T9f2V5CZOoroCxOVuasw3Mk80=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ov/uQ46s6uLHRT28cJtvqU4C1PYT6pAHKmdPbhEkLxQlRXtMtWdx3n/NT86WxYUNQ
	 /QemBJckw/cd0Kl7IM9F6QuvSHXE1xkDjxkNDX1RU6bzAnw8GvZJBFagAMj7t9RJ9M
	 5irkdLBSAGWfn56K8XDFA+9HD217jMMXhBD2QmxEd7NxHslC4kVXBuMX3tbaYS1okJ
	 c5IpMkelGqNn2SlB3WCRqMLWKbBNSHiG+m//O67IJcgJWMMILEBtsIIEfO04POm8Ps
	 fsbG2OdRJEAMGPNcPbHwfNMVJuRY6k0ECarHwiOlaL1DmrRVkHAeqE5HfoW+7mKXhC
	 YZCNwUpN9YqYw==
Date: Tue, 02 Sep 2025 08:17:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Samuel Holland <samuel@sholland.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
In-Reply-To: <20250831162536.2380589-1-lukas.schmid@netcube.li>
References: <20250831162536.2380589-1-lukas.schmid@netcube.li>
Message-Id: <175678730955.877897.3145791714848835564.robh@kernel.org>
Subject: Re: [PATCH v8 0/5] Add support for NetCube Systems Nagami SoM and
 its carrier boards
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061752_739828_21BD100D 
X-CRM114-Status: GOOD (  24.18  )
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


On Sun, 31 Aug 2025 18:25:29 +0200, Lukas Schmid wrote:
> This series adds support for the NetCube Systems Nagami SoM and its
> associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
> Carrier.
> 
> Changes in v8:
>   - Use a gpio-mux instead of the gpio-hog for the USB0_SEC_EN signal
>   - Fix the dt-schema issues
> 
> Changes in v7:
>   - Fix the gpio numbering for the USB_SEC_EN gpio hog
>   - Fix the gpio-line-names for the keypad carrier
> 
> Changes in v6:
>   - Add 'usb0-enable-hog' to the som to enable the USB-OTG port by default
>   - Update the keypad carrier dts to match actual board revision
> 
> Changes in v5:
>   - Re-add the non-removable property to the ESP32 interface
>   - Add the mmc-pwrseq node for the ESP32 to initialize the ESP32 correctly
>   - Remove the unused ehci0 and ohci0 nodes from the Keypad Carrier since
>     USB port is peripheral only
> 
> Changes in v4:
>   - Disable the default interfaces on the card-edge but keep the pinctrl
>     definitions for them
>   - Split the pinctrl definitions for the SPI interface into the basic spi
>     pins and the hold/wp pins
>   - Move some mmc0 properties to the Basic Carrier dts
>   - Remove non-removable property from the ESP32 interface
>   - Fix typo in the keypad matrix definition
> 
> Changes in v3:
>   - Add missing dcxo node to the SoM dtsi
>   - Rename the multi-led node
>   - Change dr_mode to "peripheral" for the Keypad Carrier
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
>  .../devicetree/bindings/arm/sunxi.yaml        |   8 +
>  arch/arm/boot/dts/allwinner/Makefile          |   3 +
>  ...n8i-t113s-netcube-nagami-basic-carrier.dts |  67 +++++
>  ...8i-t113s-netcube-nagami-keypad-carrier.dts | 129 +++++++++
>  .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 250 ++++++++++++++++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  48 ++++
>  6 files changed, 505 insertions(+)
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
 Base: tags/next-20250829 (best guess, 2/3 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/allwinner/' for 20250831162536.2380589-1-lukas.schmid@netcube.li:

arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: /soc/i2c@2502800/keypad@34: failed to match any schema with compatible: ['ti,tca8418']






