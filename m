Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02720D41C3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpSWmqw3p8VllNYjzA+947ctA38mYUrYavCrKBPZoRg=; b=3EXBmjLng8XNQIaAISZixlHyaj
	WHUYrkeqmwHpol8AF/JGdhN5zTWcCskErBYR35kRagLICWYytBqqo+JV9SPW4eCqyHdclJD7n6urt
	lid9leuKtClIByHv3G1ckRihHoRkiU0o9Eo3hIrQ6qK+93kvJYxXUnOeQryckGVaswiOVejgbAkbM
	ZDlren7mju5z5v0NWCyPyql42ekj6Lc7nNss9f24V+R5msccV8iW4J7GBEiEtErpKgWwxf00tFAHd
	7Ak7ZK3A+KaE71t4y8E27we4QA+04X7OG9HCwbAfH0hjnaeLPuGZu2WatBXqqjA9K73FVKTgy7ves
	UI6Gqw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThKi-0000000Ghge-3vwp;
	Thu, 11 Dec 2025 14:07:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThKe-0000000GheS-3ktR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C496443E1;
	Thu, 11 Dec 2025 14:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0558FC113D0;
	Thu, 11 Dec 2025 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765462068;
	bh=hx7b5hrK/t1h1EGBuhSZdXxMqefCkNpMbXzh1Pxl/GQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=F4nRF+jILoOBJXDsreY4/ec1oenpKVgurmtPrhus5kXNUIYF/WfF+26aLVpRCEnQk
	 J4bn4I+pf4emRNZ0naH44bYtNweuoB/BPCoO29fYQZW4zgjopbjuhSfMPxX8r5C9Sd
	 HwiRVfqG44YlO4jVout14vF5bi56Uq4IBV1g4d1e8jNEULYuOm9QaZbHrg4GJYPUpk
	 Ce+TKRcAdNShbHb98RYKQRWl5VNC4J8FTWcRlsMdsY0irxv1iN+gSAv0F5xjGF1tDo
	 8pyIosatEszKp+OVkMh46qLMQx878RXXrVhSFpV2S8RGMxXc1tSS1ag6GbVr2JfXPM
	 l7Gbv0noZ03iA==
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Dec 2025 08:07:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, Linus Walleij <linusw@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
Message-Id: <176546188070.971010.10583431722134708925.robh@kernel.org>
Subject: Re: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600
 EVB devicetrees
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060748_993408_C465A75D 
X-CRM114-Status: GOOD (  33.20  )
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


On Thu, 11 Dec 2025 17:45:42 +0900, Andrew Jeffery wrote:
> Hi all,
> 
> This series removes the remaining warnings produced by `make
> CHECK_DTBS=y ...` for the AST2500 and AST2600 EVBs and their related
> DTSIs. The tidy-up has the usual benefit of making it clear to
> contributors that any warnings are likely their own to fix before their
> patches will be considered for merging.
> 
> I've framed it as an RFC with all patches contained in the one series
> so the goal is clear, we can see what's needed to reach it, and we can
> decide whether and how it should be split or merged going forward.
> 
> As it stands there's little in the way of code change, except to
> pinctrl (though also not much there). As such I've included the
> binding maintainers and subsystem lists as recipients but not yet Cc'ed
> subsystem maintainers directly because there are quite a few and I hope
> to avoid mostly uninteresting patches being a source of irritation.
> 
> The patches fall into several groups:
> 
> Patch 1:
>   Rob's conversion of the PWM/tach binding to DT schema with fixes
>   applied for the license and typos identified by Krzysztof.
> 
> Patches 2-5:
>   Fixes for the warnings related to the LPC and pinctrl nodes, touching
>   relevant drivers and the devicetrees.
> 
>   I expect that if this approach is acceptable that we'll need to split
>   application of the patches across successive release cycles, with the
>   driver changes going in first.
> 
> Patches 6-8:
>   Fix MMC/SDHCI warnings, touching the relevant binding and devicetrees
> 
> Patches 9-10:
>   Clarify the relationships between the ACRY and AHB controller
> 
> Patches 11-16:
>   The remaining pieces that eliminate the warnings
> 
> I'm at plumbers so don't have hardware on hand to test with, but some
> brief smoke tests under qemu look okay. Given that it's all RFC that
> should be enough for the moment. I'll do more testing after discussions
> and when I have boards at hand.
> 
> Please review!
> 
> Andrew
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Andrew Jeffery (15):
>       pinctrl: aspeed: g5: Constrain LPC binding revision workaround to AST2500
>       pinctrl: aspeed: g5: Allow use of LPC node instead of LPC host controller
>       ARM: dts: aspeed: g5: Use LPC phandle for pinctrl aspeed,external-nodes
>       ARM: dts: aspeed: Remove unspecified LPC host controller node
>       dt-bindings: mmc: Switch ref to sdhci-common.yaml
>       ARM: dts: aspeed: Remove sdhci-drive-type property from AST2600 EVB
>       ARM: dts: aspeed: Use specified wp-inverted property for AST2600 EVB
>       dt-bindings: bus: aspeed: Require syscon for AST2600 AHB controller
>       dt-bindings: crypto: Document aspeed,ahbc property for Aspeed ACRY
>       ARM: dts: aspeed: Drop syscon compatible from EDAC in g6 dtsi
>       ARM: dts: aspeed: g6: Drop unspecified aspeed,ast2600-udma node
>       ARM: dts: aspeed: ast2600-evb: Tidy up A0 work-around for UART5
>       dt-bindings: iio: adc: Allow interrupts property for AST2600
>       ARM: dts: aspeed: g6: Drop clocks property from arm,armv7-timer
>       dt-bindings: mfd: Document smp-memram node for AST2600 SCU
> 
> Rob Herring (Arm) (1):
>       dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT schema
> 
>  .../bindings/bus/aspeed,ast2600-ahbc.yaml          |   8 +-
>  .../bindings/crypto/aspeed,ast2600-acry.yaml       |   7 ++
>  .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++++++++
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml       |   3 +
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  18 ++++
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml      |   2 +-
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts    |   7 +-
>  .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    |   4 -
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |   5 -
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            |   8 +-
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  17 +---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  32 ++++---
>  13 files changed, 165 insertions(+), 125 deletions(-)
> ---
> base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
> change-id: 20251211-dev-dt-warnings-all-bd5854b04d60
> 
> Best regards,
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
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
 Base: 5ce74bc1b7cb2732b22f9c93082545bc655d6547 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au:

arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@14', 'fan@15', 'fan@16', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@14', 'fan@15', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml






