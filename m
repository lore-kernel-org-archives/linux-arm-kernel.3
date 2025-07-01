Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825AAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZo3sdpuPwHDkQxoOdSiJhqwtfbwH2U8Ti4MZLZ3hpg=; b=TxikruKTekDwwFB4B5hUnQW4IG
	X9ElzdXxumxhdwWB/mRZB8OIyGCFTZl4mAsWphdNMq0NerG7M8blK8/5GxeCDOGfiSRSiYTjd2QoF
	ZCFM5n36QdFkd+qAalf04sQMp2jmUDNeibfCGR0DMKMT3UzF7PPQM+mr8BRKhILTqz/wS/cNiHOmj
	exCzK3WqWdJKm65yGvqkMSa+y1jCgebT5LJolaaGtKmHXOcI0c5bkAp79bSbwZEriiQRPQ+WJiQ77
	Ue/3CowJHWeTsyQmjKJ0QLSDc9D7DeFghKDNBaYHz5AwEmCQ3qPndIwifEwCiRL8Y+uPs9VprsSpv
	wKnFRyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfQX-00000006J75-14pB;
	Tue, 01 Jul 2025 18:09:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWctW-00000005swU-1FH8;
	Tue, 01 Jul 2025 15:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74B69A52CAC;
	Tue,  1 Jul 2025 15:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0580C4CEEB;
	Tue,  1 Jul 2025 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751383657;
	bh=deOOm4QcL7MGMhnnJDbv+UDHPY3BMHSo/frXEHKF5X8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rghLY/8BHAu53z3akbUfh1aMAkBQZxgMkqEvR+OZUhnTPwkM2hecE5v0hMasdd3TL
	 eet2X0VTNfi6/WccpbmNCHrQuWr7bB3gYn45raboZMyykkrF4onzn6PzPagia78UXJ
	 2nYcMg3k2RuhNokxkghYCwqxUV+kpT4WsXxIV/3blGBRYEDVFnAhl9BqTFyQXXpKQi
	 vV6bXV6C98xDztwRuqaWfxBgH7ceFnEtjEtHiwLvKSG5UNGuzS1FcHcBLcvGej5sDC
	 7/3nVq+QTD22caCiCd6v9VqGgOieyKTbK2GMrXFZK0gH77KtRIAj/lJzQhEne3N1jw
	 a9bLXzseQ/LmA==
Date: Tue, 01 Jul 2025 10:27:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-mediatek@lists.infradead.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
Message-Id: <175138000372.1627755.5505703571113478205.robh@kernel.org>
Subject: Re: [PATCH v3 00/11] ARM: Add support for MediaTek MT6572 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_082738_479231_763ECE61 
X-CRM114-Status: GOOD (  22.77  )
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


On Tue, 01 Jul 2025 09:06:54 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
> Changes in v3:
> - Remove the compatible property from the SoC devicetree
> - Link to v2: https://lore.kernel.org/r/20250626-mt6572-v2-0-f7f842196986@proton.me
> 
> Changes in v2:
> - Drop the status property for the board devicetrees
> - Add an soc node for the MT6572 and reorder the nodes and properties
> - Change the commit title to a more descriptive one
> - Change the cover title to the correct one
> - Link to v1: https://lore.kernel.org/r/20250620-mt6572-v1-0-e2d47820f042@proton.me
> 
> ---
> Max Shevchenko (11):
>       dt-bindings: serial: mediatek,uart: add MT6572
>       dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
>       dt-bindings: timer: mediatek: add MT6572
>       dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
>       dt-bindings: vendor-prefixes: add JTY
>       dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
>       ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
>       ARM: mediatek: add MT6572 smp bring up code
>       ARM: dts: mediatek: add basic support for MT6572 SoC
>       ARM: dts: mediatek: add basic support for JTY D101 board
>       ARM: dts: mediatek: add basic support for Lenovo A369i board
> 
>  .../devicetree/bindings/arm/mediatek.yaml          |   5 +
>  .../mediatek,mt6577-sysirq.yaml                    |   1 +
>  .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
>  .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
>  arch/arm/boot/dts/mediatek/Makefile                |   2 +
>  arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  61 ++++++++++++
>  arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  56 +++++++++++
>  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 108 +++++++++++++++++++++
>  arch/arm/mach-mediatek/Kconfig                     |   4 +
>  arch/arm/mach-mediatek/mediatek.c                  |   1 +
>  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
>  13 files changed, 250 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250619-mt6572-ef78a3d45168
> 
> Best regards,
> --
> Max Shevchenko <wctrl@proton.me>
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
 Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20250701-mt6572-v3-0-8937cfa33f95@proton.me:

arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pcie@1,0: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ethernet@1b100000 (mediatek,mt7623-eth): clocks: [[16, 110], [48, 2], [48, 4], [48, 3], [3, 8]] is too long
	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#






