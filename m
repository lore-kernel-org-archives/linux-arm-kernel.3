Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31381C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 02:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHRP5v/VtkFeSiIV7E0m7moG4UEVXxAKFT2RtvO9tRc=; b=Mtv2DS//oRMUKPjIIovElIYz0Z
	N4WGA8aXY5+bzy+eOARSiqClD1HZDlIIiTiQvJgEks0LJQQMaZq2A1kIQMfiGLm8AzsWrFH25XA6o
	8AesSAuBf7Lix4f5gR9cMBltMMAU2u8T4WvcVx+K/Cmh5IFyfcUmAhZvpgU4BTq6iQ0sKCQ1jzeX6
	49Gjh6s/Lso/7m75ilYydV5ZnJDePysPpaGy4efddh9t8ej/xRMyFaXjoN21No1aApaSG3SHqIGRL
	0uQIUucyqJsEow3yOm6fzrAVTTllLzz7Z/cMYEf2vJn51PpD7jJcAtqAnZ+G9fhEcfiuS/V/Wn6r5
	oVhwprww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTXCN-00000001SS9-2pUI;
	Mon, 23 Jun 2025 02:46:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTX5S-00000001RhP-2Fxj;
	Mon, 23 Jun 2025 02:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74FF4A4F5FD;
	Mon, 23 Jun 2025 02:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A615C4CEF1;
	Mon, 23 Jun 2025 02:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750646349;
	bh=Fvdn22+aLwNt5IcX7plkjuYY6MzRdeiquj8xeSPIR2A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Kdm5nweSN23bTVlDMGIMReXxN4GS3yWfedMLMBuQO7ca+w72Y5ovB3tnUqRWM7gPB
	 AY6DnY76QvHN0OxJ9hLv/cOQf+s48Tey4xdfal9Jp0c/44XjKj4LRJSqNXXrAOaGSh
	 A0fIsDdL1faLQjYHfJUSHFZW28h0fhn3ToCz2Ceq1n8VjrJDygu0/7dveF2P1ZmZj1
	 dUMfsSf83yt/CF5D3MH/pzr6lvx1SYttFn8iH3Yn/TX2HaPsC7HSUC/8cBKIFY0FRf
	 Ly3bm5Dz3a3HwHsFT/9cr50wErRo48wbJF0Lg6hAC5VkYCPSHK7eAiZPAFhBA8t3Y1
	 P5PRYsBHYAqkw==
Date: Sun, 22 Jun 2025 21:39:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-watchdog@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@armlinux.org.uk>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
Message-Id: <175064594753.881101.7250770438494415279.robh@kernel.org>
Subject: Re: [PATCH 00/11] ASoC: mediatek: Add support for MT6572 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_193910_713575_404714DE 
X-CRM114-Status: GOOD (  19.16  )
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


On Fri, 20 Jun 2025 18:40:39 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
> Max Shevchenko (11):
>       dt-bindings: serial: mediatek,uart: add MT6572
>       dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
>       dt-bindings: timer: mediatek: add MT6572
>       dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
>       dt-bindings: vendor-prefixes: add JTY
>       dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
>       ARM: mediatek: show the hardware name for the MT6572
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
>  arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  62 ++++++++++++
>  arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  57 +++++++++++
>  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 105 +++++++++++++++++++++
>  arch/arm/mach-mediatek/Kconfig                     |   4 +
>  arch/arm/mach-mediatek/mediatek.c                  |   1 +
>  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
>  13 files changed, 249 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20250620-mt6572-v1-0-e2d47820f042@proton.me:

arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#






