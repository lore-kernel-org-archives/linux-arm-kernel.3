Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0788D116F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c99lV5XbwMeYCb6C/UXSekWsYjPQbNGy9E5UjxIMP/0=; b=3j54PtKg9qd5hDcEhGQ0JRFOsz
	ec+zCciGcrZDfnjMJwT90uxHT5wulG/opKlruEabsAYnkmey0x7It309Z7TT3H9sId8CPMV3MbS/k
	Q0p+IrTOyiBSzOD3dmPnI6CuWt33CPkv0i8BE7Oe2/g9AIshf+oUt5vYrThMqpUd3pgBygtfIKRzN
	5t/Ac9TPcvVdV2uMbJ61sy2zhFJPEmRELd70AeEstzABNwR1dpLwGnofUQEXM5k+xLG7Bc+ocxLo7
	HQ0zt1thj3pZnx+N1a+Kn8xxxgBLedBky65FVPh1f82lqD8q/MOoFGtQyooPE1rU7xhIqt/D6fPhv
	NYulufUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxPs-00000002yfU-3l6k;
	Mon, 01 Dec 2025 06:29:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxPk-00000002yY1-0jWM;
	Mon, 01 Dec 2025 06:29:37 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Dec
 2025 14:29:16 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Dec 2025 14:29:16 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 1 Dec 2025 14:29:13 +0800
Subject: [PATCH v6 3/7] ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-upstream_pcie_rc-v6-3-8c8800c56b16@aspeedtech.com>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
In-Reply-To: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764570556; l=2673;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=5iCz5vaaMTKJcJypZ4ZjGdGSe5ESf+2Fv7rlS6vHva0=;
 b=pmMVc9Pjl7aKt8mjp08QRyYwuf9eZSyZ/Pg0TW/D4OuKJ124QMIqv9jQa/t++Z1Xm5MLtqUnl
 MSJbH2fUP0aBXSWR1iGemO5bwJPGkxzXHLftlY5xm1pyBjAso0fgDyP
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_222936_226093_4BEB856D 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

The AST2600 has one PCIe RC and add the PCIe PHY for RC.
And add pinctrl support for PCIe RC PERST#.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi |  5 +++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi         | 51 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index e87c4b58994a..d46f2047135c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -2,6 +2,11 @@
 // Copyright 2019 IBM Corp.
 
 &pinctrl {
+	pinctrl_pcierc1_default: pcierc1-default {
+		function = "PCIERC1";
+		groups = "PCIERC1";
+	};
+
 	pinctrl_adc0_default: adc0_default {
 		function = "ADC0";
 		groups = "ADC0";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index f8662c8ac089..a525c63dac3c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -379,6 +379,57 @@ rng: hwrng@1e6e2524 {
 				quality = <100>;
 			};
 
+			pcie_phy1: phy@1e6ed200 {
+				compatible = "aspeed,ast2600-pcie-phy";
+				reg = <0x1e6ed200 0x100>;
+				#phy-cells = <0>;
+			};
+
+			pcie0: pcie@1e770000 {
+				compatible = "aspeed,ast2600-pcie";
+				device_type = "pci";
+				reg = <0x1e770000 0x100>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+				bus-range = <0x00 0xff>;
+
+				ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
+					  0x02000000 0x0 0x60000000 0x60000000 0x0 0x20000000>;
+
+				status = "disabled";
+
+				resets = <&syscon ASPEED_RESET_H2X>;
+				reset-names = "h2x";
+
+				#interrupt-cells = <1>;
+				msi-controller;
+
+				aspeed,ahbc = <&ahbc>;
+
+				interrupt-controller;
+				interrupt-map-mask = <0 0 0 7>;
+				interrupt-map = <0 0 0 1 &pcie0 0>,
+						<0 0 0 2 &pcie0 1>,
+						<0 0 0 3 &pcie0 2>,
+						<0 0 0 4 &pcie0 3>;
+
+				pcie@8,0 {
+					compatible = "pciclass,0604";
+					reg = <0x00004000 0 0 0 0>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					device_type = "pci";
+					resets = <&syscon ASPEED_RESET_PCIE_RC_O>;
+					reset-names = "perst";
+					clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_pcierc1_default>;
+					phys = <&pcie_phy1>;
+					ranges;
+				};
+			};
+
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2600-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;

-- 
2.34.1


