Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C515BC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrJYaXtqO1r2gwFAKi1gKDe+NsoEHbuBtIf1VyYdK0A=; b=vgZuUygsfeQXAxDEotYP+C9ruH
	+hjKjjC3ekOIWPqjAM2tKCqod8NFIle3lHC/8Ne+y+Lqcofou267xCj/JvIxlj/N0W3JMniEfjg8C
	T06gISiUKyfczaWN4busw2ohmdBq/K94vG9a18vowF96lFXPHHJ8IE3fn9VlVf8sWGJqot9WfmtDI
	tgJg1J2yJouoPj1fNINEoMBANVqeJoaitPHS6N36YvNf9qy/hby7QfjAjQNmNdnmSNrizH/LJmzaN
	6gAHWudZTOeoMtqJOx1jXm2swUW1Hp9CSOj33fRsuww8AYL5g+GuzwfCsio58qQoH5SJSYA/JMQqg
	G3J0HKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu94-0000000Cq45-0f5m;
	Thu, 26 Jun 2025 21:28:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsew-0000000CeWd-0Puv;
	Thu, 26 Jun 2025 19:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08E995C5516;
	Thu, 26 Jun 2025 19:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93113C4CEEB;
	Thu, 26 Jun 2025 19:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750967600;
	bh=gP/lLAielMQ0FzJZoQVZVvW32nn5aVh+e1xIp7tL+5Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mdJgSNJlTCiBsgp1QvD08F4fcua2wPsC395F4cWUyYK5vhobW4WMrk+HNckMyVVnv
	 SyBNxW8pmK1kHZyq62uSz+dqrTw1gWvGDX0uHKIZ95/VXLbqpGGbwJG74X91Vnjsi9
	 +lQzSu24MxCmAgiA8BskBo3XspT8PnF1p1j3naF6V3QQpXBRto/8rg8B0pXSV1nxy/
	 PS9dPFp7nBnSwxPAIaY4YnH4KsI93PilBkhbzyeokHcCVyvvCaYEyHKzk5JbxcnpQU
	 w7YqCokzH58UfMS+MSYQhnF//W+DCn8cHiJPcbX/eUqFZ0koRzligdhE7BpIk9cWlA
	 nEVqcKieCsypQ==
Date: Thu, 26 Jun 2025 14:53:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>
To: Max Shevchenko <wctrl@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
Message-Id: <175096753913.717927.14601371478727547482.robh@kernel.org>
Subject: Re: [PATCH v2 00/11] ARM: Add support for MediaTek MT6572 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_125322_215556_9F338D15 
X-CRM114-Status: GOOD (  22.06  )
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


On Thu, 26 Jun 2025 11:53:53 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
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
>  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 109 +++++++++++++++++++++
>  arch/arm/mach-mediatek/Kconfig                     |   4 +
>  arch/arm/mach-mediatek/mediatek.c                  |   1 +
>  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
>  13 files changed, 251 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20250626-mt6572-v2-0-f7f842196986@proton.me:

arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: spi@1100a000 (mediatek,mt7623-spi): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
	'mediatek,mt7623-spi' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt8516-spi']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
	'mediatek,mt7622-spi' was expected
	'mediatek,mt2712-spi' was expected
	'mediatek,mt6765-spi' was expected
	'mediatek,spi-ipm' was expected
	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#






