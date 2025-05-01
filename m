Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D52C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU11OE3E4SpdQOCjc1Ybedk8Pd2S1eUpQyPM5IxVvTc=; b=JDLkuUDTDWAYP7Nk9bKVwK/Y6R
	W2VeB3c1B8ylplX9JYxbygKLfZwHzQxHnjmA7uPmii3Q3bE+Yr9fH4ZzCvk+Y1CJH6DU+F85iWd+X
	7+poK45vB8tF8lT4rvERzxokOrd86sXSQ0uw7wwbfb/GFLOIxZNtbvMQXsWLwy+DT6IgnmnPZdFWx
	8mxpqbBRGMG0fJ2bWW4erQLzpoHYUsUpRTFepQo0v326fMHYIbt6n4cFKdqW7fh7yONJA4shuuEH2
	8u0kRPSrLd/Oue0lx5nbzDsNiWtOSwNMzO/z90nnniuX8Yq/QHMdDV2do1JC0NvuWIlDKOnrAA7RB
	HHJqlgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT4S-0000000Fg9u-3VzS;
	Thu, 01 May 2025 12:31:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASiC-0000000FPt5-2lAG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 148FE44C7E;
	Thu,  1 May 2025 12:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E2DC4CEE3;
	Thu,  1 May 2025 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746101300;
	bh=8D5TRtC5TmDQclk37a04XUySA9DOJFZV97XArHUgb1g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m6ZIIYnpnbH7GFwBoxMZ62dxGFIacdbrkIcdm4+VQ7CGdee5vu4z++rwdCTG5i/mc
	 p4I4moI6xTq8l0NUjHUDMr/giz6dmhV5SGQJqav3ZcCLdCYZJz4i2cMgtwOXJMjsm1
	 qHhYLwaolHV8hEH0TnMvdFEkBQJ6NZm+n1UdN0aQH37F17gkbQEkSzoLui7EDCTzBg
	 EJYt+dQOcjT/NFw4sNWj7lvTPqxN2ygLyAqYWJ9AOnNhPmtlNzyMd2qwb2caLTRfZ+
	 8K0JZn93sS995fr5xyMeIKhjCVw76zOekqVJocE+pIxB/W1ezoXMcSSkd3OYbuKSdh
	 EZ8p6CYd0IJOw==
Date: Thu, 01 May 2025 07:08:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, tarang.raval@siliconsignals.io, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
References: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
Message-Id: <174610123214.1957273.17506465011735193373.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing
 SD card timeout
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_050820_740403_8A8983EA 
X-CRM114-Status: GOOD (  16.21  )
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


On Thu, 01 May 2025 11:16:03 +0530, Himanshu Bhavani wrote:
> Fix SD card timeout issue caused by LDO5 regulator getting disabled
> after boot.
> 
> The kernel log shows LDO5 being disabled, which leads to a timeout
> on USDHC2:
> [   33.760561] LDO5: disabling
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.
> 
> To prevent this, set regulator-boot-on and regulator-always-on for
> LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V
> signaling for USDHC2 using a GPIO-controlled regulator.
> 
> Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM")
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
> 
> kernel hangs during boot with the following logs:
> 
> [   33.760561] LDO5: disabling
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.
> [   81.119872] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
> [   81.119876] mmc1: sdhci: Sys addr:  0x00000010 | Version:  0x00000002
> [   81.119882] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000010
> [   81.119886] mmc1: sdhci: Argument:  0x00844358 | Trn mode: 0x0000002b
> [   81.119891] mmc1: sdhci: Present:   0x01f88009 | Host ctl: 0x00000012
> [   81.119896] mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
> [   81.119900] mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f
> [   81.119904] mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
> [   81.119908] mmc1: sdhci: Int enab:  0x117f100b | Sig enab: 0x117f100b
> [   81.119912] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000502
> [   81.119917] mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000b407
> [   81.119921] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00ffffff
> [   81.119925] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x0076b27f
> [   81.119929] mmc1: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x00000900
> [   81.119933] mmc1: sdhci: Host ctl2: 0x00000008
> [   81.119937] mmc1: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x4003f204
> [   81.119941] mmc1: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS DUMP =========
> [   81.119944] mmc1: sdhci-esdhc-imx: cmd debug status:  0x21b0
> [   81.119949] mmc1: sdhci-esdhc-imx: data debug status:  0x2200
> [   81.119954] mmc1: sdhci-esdhc-imx: trans debug status:  0x2300
> [   81.119959] mmc1: sdhci-esdhc-imx: dma debug status:  0x2400
> [   81.119964] mmc1: sdhci-esdhc-imx: adma debug status:  0x2594
> [   81.119970] mmc1: sdhci-esdhc-imx: fifo debug status:  0x2608
> [   81.119976] mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2798
> [   81.119981] mmc1: sdhci: ===========================================
> 
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
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
 Base: tags/next-20250501 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250501054604.23368-1-himanshu.bhavani@siliconsignals.io:

arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: regulator-usdhc2-vqmmc (regulator-gpio): 'gpios' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: regulator-usdhc2-vqmmc (regulator-gpio): Unevaluated properties are not allowed ('gpio' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#






