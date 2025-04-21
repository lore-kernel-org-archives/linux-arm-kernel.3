Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CA4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nzgjSnII7gQ+iWpSmA9wkL9kXhQVA8NGz0aFRA7zpU=; b=NgnRHSyfdfmEiDaCQgJzaSKIaS
	GE/dC81HmqOeBVq/71/KXXEujlDYeQRAbB5Wi5vs2cCZQ6SErgR9mQEBNY+NNW2NJa8HNT8YhdrCO
	MTSAMHpCXH7l5r27JqtrI0p4UZSU8DFRz1mxGP7fceFGLN6OU+Pm3sy01BotniAeqG9LtleUtOsL4
	q22lfT50UWvoFhevGxeZLD+oJ5t+9daobJUksbQmIJlWd5/EgT3M5P5tmz8s2zJWQ4byTaLVQPH1T
	sgLhYYzuYflTb6rOATzvVqtfncGuJhFsuDegjbZvf13+Wdf/XWeQj/jvEms5fuL8M06I57QbFJL/z
	UGImt98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sqn-00000004ZCP-1srR;
	Mon, 21 Apr 2025 15:14:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6skI-00000004Y5B-2Ct8;
	Mon, 21 Apr 2025 15:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F108F614AC;
	Mon, 21 Apr 2025 15:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE09C4CEEA;
	Mon, 21 Apr 2025 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248061;
	bh=lc5bcB2qS+BayGAd67CTq4rDRW3vovdCcVtSqCmpb44=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Cr3TZhNvwmMUJ/5U8n99+jGNWC4DSKVZNDIWmg+ISk8Fek2esnCH3kqwdOVmqiD4o
	 BcLniD9UC/zRaQNBCbPnn2+1i2DatdPiaqH0ykCfZeYknmwEcXHHB13FCNigg6vc4Y
	 IIEm5an35XL3v5/XTiFx8mvbz3puSfnNR6Hsw9JHMARMsTurT2cMLMLCoIfwEyKVq3
	 +Kbo5z5xkNS5GUWDvBCusCmx2kCXjFVcx5u6sIMVSMOS5sz2hoI5oWdPmkKKLu5JyR
	 5gERLoA2lbr1oCfGx5LfpxQLKcoQVEK+20y/EaXrgX2SUG7bJFhB7CYLEXyak/guC9
	 A5BkryMbnmpeQ==
Date: Mon, 21 Apr 2025 10:07:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Douglas Anderson <dianders@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
 chrome-platform@lists.linux.dev
To: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Message-Id: <174524752509.2425965.7536195118424945972.robh@kernel.org>
Subject: Re: [PATCH v2 0/8] arm64: mediatek: mt8186-corsola: Consolidate
 and add new devices
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


On Mon, 21 Apr 2025 18:12:38 +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v2 of my "component probe for Corsola devices" series.
> 
> Changes since v1:
> - Reworded commit message for Elan I2C-HID binding change
> - Dropped I2C address constraint from Elan I2C-HID binding completely
> - Dropped enum from new compatible string entry in Elan I2C-HID binding
> - Picked up Rob's ack on two binding changes
> - Rebased onto next-20250417, resolving conflicts with "spherion
>   component prober" changes
> - Link to v1:
>   https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/
> 
> Here's a follow up series of the I2C component probers for Chromebooks.
> This series enables the component prober for the Corsola series of
> devices, combines the two existing Voltorb SKUs, and adds a new
> device, codename Squirtle.
> 
> Patch 1 adds a new HID-over-I2C touchscreen from Elan.
> 
> Patch 2 merges the Voltorb entries in the device tree bindings into one.
> 
> Patch 3 adds a new entry for the Squirtle device to the bindings.
> 
> Patch 4 fixes up the existing device trees for the component prober to
> be active.
> 
> Patch 5 merges the device trees for the Voltorb device.
> 
> Patch 6 adds a device tree file for the Squirtle device, with I2C
> components ready to be probed by the prober.
> 
> Patch 7 enables the prober to probe trackpads on some devices in the
> Corsola family.
> 
> Patch 8 enables the prober to probe touchscreens on Squirtle.
> 
> Please take a look.
> 
> 
> Thanks
> ChenYu
> 
> 
> Chen-Yu Tsai (8):
>   dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
>   dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
>   dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
>   arm64: dts: mediatek: mt8186-steelix: Mark second source components
>     for probing
>   arm64: dts: mediatek: mt8186: Merge Voltorb device trees
>   arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
>   platform/chrome: of_hw_prober: Support trackpad probing on Corsola
>     family
>   platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
>  .../bindings/input/elan,ekth6915.yaml         |  12 +-
>  arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
>  .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
>  .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
>  .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
>  .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
>  .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
>  ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
>  .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
>  11 files changed, 167 insertions(+), 33 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
>  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
>  rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)
> 
> --
> 2.49.0.805.g082f7c87e0-goog
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
 Base: tags/next-20250417 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250421101248.426929-1-wenst@chromium.org:

arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#






