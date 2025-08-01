Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72652C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUGUrDD3yqAXEB+MJqcSJagi/HoDBMj1fc3/9AwmW3M=; b=E1qIwMg/F8QjXIH3avsNaZA4t1
	JQews4VbLOysjQyWFOsBHlRCKtXJhW4kr+JePFFXqmSIMjww+l5ZfCZViEWFGTLndfwQleLN+bkM+
	IJrMsl1tUTNZDwtM9UIe3Hp/wQkSUxuClsGSJN8ATLQ/jtd3UpGF4BMKJNxa2uifyabN9CDraof3q
	SMn+c3z2l0JuBl+/gYx39xTD2Li9rv13/NHve/1SVtjQFz1vVXn6rXXd/SgewOzUYcC2FRzig47DV
	NDuVgJDl5ZL+KBgqWskxUjKIrz25aS0wetERZhj0y5dGVE3ZqWj8+y6O/etC5BSYQxjmcUuj1/MD5
	lXLwlqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhppn-000000066yD-1w1F;
	Fri, 01 Aug 2025 13:30:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpls-000000066d3-0QqI;
	Fri, 01 Aug 2025 13:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 538E66111F;
	Fri,  1 Aug 2025 13:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F4AC4CEE7;
	Fri,  1 Aug 2025 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754054762;
	bh=3fkoib6zS9k9KGl4QspNIQJTwl5g86vgWf3jffF3XSM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nHamCO91sZ4nOP4TKoP5gN7kz+NwDMa6OK1ibw/pFxSvb0kGOabs1lZ5LnTwP+Sm4
	 Vw//MEhcpDvBxEjpm8rfb+bKSOO+4LFDQpZXhsi44aA0TZjfCQiOTA85fBrmG3xhis
	 m7e2r+1JMTUCUp98KH5ppDL10szg0hr/U7r6NyxC/Xla075gq7O0gtKEtxCAyncedP
	 f4CoT5/yLf23mx941rx5wORqIy8VqxIJJXGUGJHmMfBQsMrzLhCFTxBRln/3H/JyhL
	 m1BqsgVOBWp4LmyhbZ/U7Lg8OutyrLh9mCOFclok/G85nb9Zqjm26tknD//0vame4u
	 KdYeBV0RRs2IQ==
Date: Fri, 01 Aug 2025 08:26:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-sound@vger.kernel.org, 
 Eugen Hristev <eugen.hristev@linaro.org>, Ikjoon Jang <ikjn@chromium.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 kernel@collabora.com, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Julien Massot <jmassot@collabora.com>, linux-mediatek@lists.infradead.org, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>, 
 Sean Wang <sean.wang@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
Message-Id: <175405458876.3005254.17331851790078510513.robh@kernel.org>
Subject: Re: [PATCH 0/9] MediaTek devicetree/bindings warnings sanitization
 second round
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


On Fri, 01 Aug 2025 13:18:02 +0200, Julien Massot wrote:
> This patch series continues the effort to address Device Tree validation warnings for MediaTek platforms, with a focus on MT8183. It follows the initial cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)
> 
> The patches in this set eliminate several of the remaining warnings by improving or converting DT bindings to YAML, adding missing properties, and updating device tree files accordingly.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
> Julien Massot (9):
>       dt-bindings: clock: mediatek: Add power-domains property
>       dt-bindings: arm: mediatek: Support mt8183-audiosys binding variant
>       arm64: dts: mt8183: Rename nodes to match audiosys binding schema
>       ASoc: dt-binding: Convert mt8183-afe-pcm binding to YAML
>       dt-bindings: sound: Convert MT8183 DA7219 sound card bindings to YAML
>       ASoC: dt-binding: Convert MediaTek mt8183-mt6358 bindings to YAML
>       dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names
>       arm64: dts: mediatek: mt8183-kukui: Fix pull-down/up-adv values
>       arm64: dts: mediatek: mt8183-pumkin: Fix pull-down/up-adv values
> 
>  .../bindings/arm/mediatek/mediatek,audsys.yaml     |  17 +-
>  .../devicetree/bindings/clock/mediatek,syscon.yaml |   3 +
>  .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |   2 +
>  .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
>  .../devicetree/bindings/sound/mt8183-afe-pcm.yaml  | 225 +++++++++++++++++++++
>  .../bindings/sound/mt8183-da7219-max98357.txt      |  21 --
>  .../devicetree/bindings/sound/mt8183-da7219.yaml   |  49 +++++
>  .../sound/mt8183-mt6358-ts3a227-max98357.txt       |  25 ---
>  .../devicetree/bindings/sound/mt8183-mt6358.yaml   |  59 ++++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  22 +-
>  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  22 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   4 +-
>  12 files changed, 378 insertions(+), 113 deletions(-)
> ---
> base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
> change-id: 20250801-mtk-dtb-warnings-157d4fc10f77
> 
> Best regards,
> --
> Julien Massot <julien.massot@collabora.com>
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
 Base: using specified base-commit b9ddaa95fd283bce7041550ddbbe7e764c477110

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com:

arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefault', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefault', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefault', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefault', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: clock-controller@11220000 (mediatek,mt8183-audiosys): audio-controller: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: audio-controller (mediatek,mt8183-audio): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#






