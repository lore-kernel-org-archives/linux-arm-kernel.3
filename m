Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2E2CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jCJolrdlxtjpnWKS4C2Xoichd440aQTt7t6x1CI3flw=; b=2+RPZvKMZk05w7
	KL9le9zKGTG7cw4awLjuC+4IcZahniUrYjnfW5MUoqr7qCgNkEAZ5BY3G9T2pzuLvV0W2ZOSrKSMP
	OeF4OXDr1cYjk7W1ZDmVp9x+hWi6Dckz6+EU+CgTf3zEanQ0XP1UJxDPdYvDdZh7LJ8DjrYtRT41M
	+MrcMxQ/jeONTuO/2mXIEbOa/il83PG/O9XPSaxWR3AI9S3Cuwft90jLElriPQzv3Ei5rH3X2yaNd
	NDmmA9DppmdRFPlztfCOE+XP1orM0A1I5vbyTCCkwOA+4+EY3s5571hzOh0Slvw1gKX25ts8U0LOH
	13uZSBB7235lk6V1LBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSup-00000001n7h-3kd6;
	Wed, 22 Oct 2025 07:05:47 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSun-00000001n6i-4AJR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:05:47 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 22 Oct
 2025 15:05:43 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 22 Oct 2025 15:05:43 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, <bmc-sw@aspeedtech.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, <jk@codeconstruct.com.au>, Lee Jones
	<lee@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Nishanth Menon <nm@ti.com>,
	<nfraprado@collabora.com>, Taniya Das <quic_tdas@quicinc.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/6] Introduce ASPEED AST2700 BMC SoC
Date: Wed, 22 Oct 2025 15:05:37 +0800
Message-ID: <20251022070543.1169173-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_000546_029820_DA47377F 
X-CRM114-Status: GOOD (  13.35  )
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

This introduces initial support for the Aspeed AST2700 SoC and the AST2700
Evaluation Board (EVB) to the Linux kernel. The AST27XX is the 8th
generation Baseboard Management Controller (BMC) SoC from Aspeed,
featuring improved performance, enhanced security, and expanded I/O
capabilities compared to previous generations.

AST27XX SOC Family
 - https://www.aspeedtech.com/server_ast2700/
 - https://www.aspeedtech.com/server_ast2720/
 - https://www.aspeedtech.com/server_ast2750/

Bindings Dependencies:
- scu/silicon-id: Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
- gpio: Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
- mdio: Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
- intc0: Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml
- intc1: Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml
 - https://lore.kernel.org/all/20251022065507.1152071-2-ryan_chen@aspeedtech.com/T/#u (Reviewing)

v6:
- rebased on v6.18-rc1
- aspeed,ast2x00-scu.yaml
 - fixed dt-binding yaml issuse report.

v5:
- modify ast27XX 7th generation description to 8th generation.
- aspeed.yaml
 - modify missing blank line.
- Kconfig.platforms
 - modify ast27XX 7th generation to 8th generation.

v4:
- make CHECK_DTBS=y arch/arm64/boot/dts/aspeed/ fix.
- modify commit message remove itemlize.
- remove modify aspeed,ast2700-intc.yaml patch.
- aspeed.yaml
 - Add AST2700 board compatible.
- aspeed-g7.dtsi
 - modify all size-cells from 1 to 2.
 - add serial aliases, gpio, mdio, uart0 ~ 14.
 - add firmware for optee, reserved memory for atf and optee.
 - modify cpu@0 to cpu0: cpu@0.
 - fix intc-ic for yaml dependency.
- ast2700-evb.dts
 - update stdout-path = "serial12:115200n8";

v3:
- https://lore.kernel.org/all/20241212155237.848336-1-kevin_chen@aspeedtech.com/
- Split clk and reset driver to other commits, which are in series of
  "Add support for AST2700 clk driver".
- For BMC console by UART12, add uart12 using ASPEED INTC architecture.

aspeed,ast2700-intc.yaml
- Add minItems to 1 to fix the warning by "make dtbs_check W=1".
- Add intc1 into example.

Kconfig.platforms
  - Remove MACH_ASPEED_G7.

Ryan Chen (6):
  dt-bindings: arm: aspeed: Add AST2700 board compatible
  arm64: Kconfig: Add Aspeed SoC family (ast27XX) Kconfig support
  dt-bindings: mfd: aspeed,ast2x00-scu: allow #size-cells range
  arm64: dts: aspeed: Add initial AST2700 SoC device tree
  arm64: dts: aspeed: Add AST2700 Evaluation Board
  arm64: configs: Update defconfig for AST2700 platform support

 .../bindings/arm/aspeed/aspeed.yaml           |   6 +
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |   2 +-
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/aspeed/Makefile           |   4 +
 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi     | 516 ++++++++++++++++++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |  22 +
 arch/arm64/configs/defconfig                  |   1 +
 8 files changed, 557 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts

-- 
2.34.1


