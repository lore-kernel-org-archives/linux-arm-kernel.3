Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFE2C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0Mh8BiC5jUFlfWCTp2Te2k+siOOqT50yR4bR3/zYEM=; b=UZVrJr62U770gj7C74ZNJ8oZLX
	Tq8EaBRsVxJWJXFJNc9LgjBGJUsiiI8oAoSB3R9B1USq1PPR9VvdYYGMWBr2FWvvnyBpebSLchhkH
	vVzHx9o5A7yhRsJJlUDL/o2cTSMMke3Aqe/XpPzROuJz7SVOTJCBFYbj5HEGzAcfKdlfeAi0xAAc/
	uyFxurIsMe8IwoT6rGeNJ0PZdhGzx4wtiYMZicSqHfawv0GHrZ0qkfVWjKkL+v+tcpuhTaeCvqTFZ
	WN4MQVMDrLBfJoe7yUAM/sycJ/w9D+dS1RSdHAMDW9keSkl7Mm1rI0R4gMPkgXBUrbpsvCZ6lhsb4
	DXOG4LTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpY-0000000DgEw-3SH7;
	Tue, 06 May 2025 23:36:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMxP-0000000D5q9-29LN;
	Tue, 06 May 2025 18:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4D5E5C4605;
	Tue,  6 May 2025 18:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB20C4CEE4;
	Tue,  6 May 2025 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555833;
	bh=ZEAGjwIFjybc/HGuQRpeGkvdPGM1CPmJpu83eTHjeHY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J2Axxfi7zb9TfRjQzYpz4uELBa1yRNXuJU2ZPxuI+nYb26O0ECUNZSZS6C5YYlBZo
	 IMVZgxTBOuHoYLXXKxrxqfTFCLQCAXOvI45dc/Q3IQaUQdl6deseQnjljgop1uvTo/
	 A/+9EnnfP9+WPeNv4aX98MskcNF/yhIGWJDIl7XdyDmN1LdMQXZ6nQVt4GBCEImAbv
	 UXq5igTpjIrBkTGvu36607jrTnccYqTpiRXLpvJxu874m2HlocpzEVD73+GR9WZWBf
	 9MmX4teM14pxvLlQp0PztgVQHt9SDAhS7qD0X1pnlcoQ0Oedcj4HUjx4O33ziLmPJl
	 0Hh0zIv4dsoqw==
Date: Tue, 06 May 2025 13:23:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: heiko@sntech.de, linux-kernel@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dragan Simic <dsimic@manjaro.org>, Yao Zi <ziyao@disroot.org>, 
 Junhao Xie <bigfoot@classfun.cn>, devicetree@vger.kernel.org, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 Jamie Iles <jamie@jamieiles.com>, Guenter Roeck <linux@roeck-us.net>, 
 Frank Wang <frank.wang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Jimmy Hon <honyuenkwun@gmail.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <didi.debian@cknow.org>, 
 Shresth Prasad <shresthprasad7@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Johan Jonker <jbx6244@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20250506025715.33595-1-kever.yang@rock-chips.com>
References: <20250506025715.33595-1-kever.yang@rock-chips.com>
Message-Id: <174655575165.2171034.16453137338500014976.robh@kernel.org>
Subject: Re: [PATCH v5 0/6] rockchip: Add rk3562 SoC and evb support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_112355_643044_069442DF 
X-CRM114-Status: GOOD (  25.27  )
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


On Tue, 06 May 2025 10:57:09 +0800, Kever Yang wrote:
> 
> Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
> scmi-shmem from soc node to reserved memory.
> 
> Patch series V4 remove patches already landed, and remove dts nodes for
> modules still under review.
> 
> This patch set adds rk3562 SoC and its evb support.
> 
> I have split out patches need driver change for different subsystem.
> And all the modules with dt-binding document update in this patch set
> do not need any driver change. I put them together to make it clear we
> have a new SoC and board to use the new compatible. Please pick up the
> patch for your subsystem, or please let me know if the patch has to
> send separate.
> 
> Test with USB, PCIe, EMMC, SD Card.
> 
> This patch set is base on the patch set for rk3576 evb1 support.
> 
> V3:
> https://lore.kernel.org/linux-rockchip/20250227111913.2344207-1-kever.yang@rock-chips.com/
> V2:
> https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/
> 
> 
> Changes in v5:
> - Collect review tag
> - Update scmi-shmem from soc to reserved memory
> 
> Changes in v4:
> - Collect ack tag
> - Collect ack tag
> - Collect ack tag
> - remove gmac and otp nodes
> - remove gmac nodes
> 
> Changes in v3:
> - Collect reveiw tag
> - Collect the Acked-by tag
> - remove i2c/serial/spi alias
> - add soc node
> 
> Changes in v2:
> - Update in sort order
> - remove grf in cru
> - Update some properties order
> 
> Finley Xiao (2):
>   arm64: dts: rockchip: add core dtsi for RK3562 Soc
>   arm64: dts: rockchip: Add RK3562 evb2 devicetree
> 
> Kever Yang (4):
>   dt-bindings: watchdog: Add rk3562 compatible
>   dt-bindings: rockchip: pmu: Add rk3562 compatible
>   dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
>   dt-bindings: arm: rockchip: Add rk3562 evb2 board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |    5 +
>  .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
>  .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
>  .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
>  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>  .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  488 ++++
>  .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1270 +++++++++
>  8 files changed, 4126 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
> 
> --
> 2.25.1
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
 Base: tags/next-20250506 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250506025715.33595-1-kever.yang@rock-chips.com:

arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/usb2-phy@ff740000: failed to match any schema with compatible: ['rockchip,rk3562-usb2phy']






