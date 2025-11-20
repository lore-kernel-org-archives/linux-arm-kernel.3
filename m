Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F035BCF8549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnJYelhQ6X6OK2yrVn42M1VcsGQ42sheXT1pV4tSfqc=; b=MQbGbcIstWUpJCJKlt688vltBc
	9rIiKM0sJkICLgi1GHiiA6cHUqJYH/zjCHS+hK/Ri4XVpdyMOhU/mnSjfHF0XwsnMlLNq2X28+Rf/
	h2ore5B11s1Em2IiiKS21TENTQz052vizlfw+WUgXIDHFEg2I3lCtdkUqk4uJ5NO40liBofNKO7Lk
	o1HOxxlRvXjVJhSKGWdVIjoB/P2r6NAu1qnfquBA8qtA3CZFm7NC/uWUV7lJCxcEaLBunilXFdwMh
	3hZ/ucp56D/gXXNcxzGoc4yoJb+tSiE8Yh9nX/Uf92EYQYedNpzqTOpXw+depcaM4ELbCHc814iGo
	Gywqsdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Bh-000000073t3-0wz9;
	Thu, 20 Nov 2025 17:11:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Bg-000000073sk-2VOL;
	Thu, 20 Nov 2025 17:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BABE8601D3;
	Thu, 20 Nov 2025 17:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A38C4CEF1;
	Thu, 20 Nov 2025 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658675;
	bh=TMLntoU8iUOS/qsRpXy6ReTJ0gjhyOEPYkzAMR3tBsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aqLfR4iUeq0dB4adf+THdyDTXEYLPmrUzBfkTi+siE4FErR83JFGTcLfKnZPwMODP
	 zj2cUYj3WBLrInuLNgbziXnA7+G9xs8XtvV8dheiKGDn0HgJZReHIrRT/oWGXTphBw
	 jav2dXGGvpcDBBZpIT1RCdSYwVNydmY44mIGqMAlNo1AsrYfgc5+mcS8i3aaEEr2ud
	 4TUiRefxrRVy12nbdxe98sT9eFv8FdR5zFScbGQQFtJSC3KnpPv1GWm214oV8dZjgT
	 NBl/XpNE1EKX2BLhLbdvZITRXTf7HBvkVza3ncDhy4jxeipTFt+dX7P+f3c6f1D9CH
	 5vSYkUHWrDl8w==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sjoerd Simons <sjoerd@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
Subject: Re: (subset) [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt
 One AP functionality
Message-Id: <176365866697.207696.9870186215211079064.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:06 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sat, 15 Nov 2025 21:58:03 +0100, Sjoerd Simons wrote:
> Significant changes in V4:
>   * Drop patches that were picked up
>   * Improve mediatek,net dt bindings:
>     - Move back to V2 version (widening global constraint, constraining
>       per compatible)
>     - Ensure all compatibles are constraint in the amount of WEDs (2 for
>       everything apart from mt7981). Specifically adding constraints for
>       mediatek,mt7622-eth and ralink,rt5350-eth
> Significant changes in V3:
>   * Drop patches that were picked up
>   * Re-order patches so changes that don't require dt binding changes
>     come first (Requested by Angelo)
>   * Specify drive power directly rather then using MTK_DRIVE_...
>   * Simply mediatek,net binding changes to avoid accidental changes to
>     other compatibles then mediatek,mt7981-eth
> Significant changes in V2:
>   * https://lore.kernel.org/lkml/20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com/
>   * Only introduce labels in mt7981b.dtsi when required
>   * Switch Airoha EN8811H phy irq to level rather then edge triggered
>   * Move uart0 pinctrl from board dts to soc dtsi
>   * Only overwrite constraints with non-default values in MT7981 bindings
>   * Make SPI NOR nvmem cell labels more meaningfull
>   * Seperate fixing and disable-by-default for the mt7981 in seperate
>     patches
> 
> [...]

Applied, thanks!

[03/11] dt-bindings: phy: mediatek,tphy: Add support for MT7981
        commit: 80ac0fba0f1a72be2c7b532b8e2ad61300a165c3

Best regards,
-- 
~Vinod



