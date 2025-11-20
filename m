Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA8BCF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEt9a45sClyLrlTmjBzgZYE5qser2oSEsyO4ZnUSTvE=; b=k/EUofhB4/6EjUWeVlpBd2+AGC
	Go9nIlY6c02eHYvdWrvcIfd8Z+Y88sFfkSE958+mH75RZ3br2YIFt9/I7SYVBlq2EaQJe9VV0NK5S
	p3LoZg4pF70RT3VjB6+9F4Ws89/07CGMo41XmeaUOd8rwySKHLZAwC9zF4HsXPYrr5Q57rTk3b4Ca
	p+CH5CvC4VUXlkSZRoIGTOCHXFQ9pfAu4Qf8vvtKiL/i6fAtbws+Gzl8exVQ8jhPvmSx8QmwHdeZu
	7CfklsMRWa2h7dfftdXzFw7bYsSfLcjg89TGipRQWf0mht3oUIQ1xVH47inwp/cVmaguKZa5P9Wwx
	ScsqxReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5R7-00000006ots-2xxD;
	Thu, 20 Nov 2025 14:15:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5R5-00000006otR-3hea;
	Thu, 20 Nov 2025 14:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0594A60052;
	Thu, 20 Nov 2025 14:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB91C4CEF1;
	Thu, 20 Nov 2025 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763648097;
	bh=qU7RjS/DzcEXt2yvqfX9/EuoZ/kS5C70NOZsPJM23CM=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=aCHFlep+obOacq9TNPHc+io8b4D9ktDULkeWfb8itwnFyzTURMHh3MdMawAhdwEIK
	 V/d1rkIa07bFO4rJAtQ68Z9qgkZJMJT4QKyqFVvbSXxH505v/b0iNxvI4lUx3LZ2e5
	 Djk3QPDWrcsyj2zsxIIRD+Y0WXej7SUhMauXFezc6FpKlg3E+Ln1Zd82VUgAOMMyeb
	 m5aOuglHuQh/2TMoc380/5GVrsyOJRs+D0M2OXESXIAo+dbFMLq4Ul7FRQQIvlV+Ni
	 UWxf5uOs8oF7zwnklatk5MLJkFex93bQ207ea3b0LTVtwu4NfIEjNGZsjUbCxu1WBa
	 FvCQYufrPzqzw==
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Nov 2025 08:14:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>, 
 Vince-WL.Liu@mediatek.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 devicetree@vger.kernel.org, sirius.wang@mediatek.com, Jh.Hsu@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ot_shunxi.zhang@mediatek.com
In-Reply-To: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
Message-Id: <176364782296.1171084.17820068069366614095.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] rtc: Enhance RTC driver with BBPU bit
 definitions and shutdown handling
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


On Thu, 20 Nov 2025 20:17:56 +0800, ot_shunxi.zhang@mediatek.com wrote:
> From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> 
> (1) Add new bits definitions for RTC_BBPU register.
> (2) Add new functions to reset the BBPU alarm status in mt6397 RTC driver
> (3) Add mtk_rtc_shutdown function to handle RTC shutdown events.
> (4) For the V1 version comments, the following modifications are made:
> (4.1)the formatting changes are separated into a distinct patch.
> (4.2)Since the rtc-mt6397.c file is a fusion of multiple RTC drivers
> for the mt6358, mt6359, and mt6357 RTCs, the definitions of certain bits
> in the RTC_BBPU register differ among these RTCs. The mt6359 supports
> the alarm status bit, while both mt6358 and mt6357 do not. Therefore,
> the alarm-sta-supported property is added in the mt6359.dtsi file to
> differentiate between the different RTCs.
> (4.3)Additionally, the operation to disable IRQ in the shutdown function
> is removed.
> 
> Shunxi Zhang (5):
>   mfd: mt6397: Fix formatting of RTC_BBPU_KEY definition
>   mfd: mt6397: Add bit definitions and struct members to support alarm
>     status
>   rtc: mt6397: Fix formatting of platform driver structure
>   rtc: mt6397: Add BBPU alarm status reset and shutdown handling
>   arm64: dts: mediatek: mt6359: Add alarm-sta-supported property to RTC
>     node
> 
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi |  1 +
>  drivers/rtc/rtc-mt6397.c                 | 32 +++++++++++++++++++++++-
>  include/linux/mfd/mt6397/rtc.h           |  5 +++-
>  3 files changed, 36 insertions(+), 2 deletions(-)
> 
> --
> 2.45.2
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
 Base: tags/next-20251119 (exact match)
 Base: tags/next-20251119 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20251120121805.6775-1-ot_shunxi.zhang@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): rtc: Unevaluated properties are not allowed ('mediatek,alarm-sta-supported' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml






