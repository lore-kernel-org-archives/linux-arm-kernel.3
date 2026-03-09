Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E299F3C24F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsslNjPsniHPFq7y9ACqeRGOIicsFNpWA+I3qRFhHu8=; b=fjpy4syKCUplMsacq5QoQ0yZnn
	TdAw8eTYcmjBRdM5bfVfpqbOEEmFa4/KuP1KQ9aop8PL/L/5O5S3Rjqb9tUC13lrv8fUJkJ85m5jl
	lWJnsZNEurgMcMmpRMLNIcjAy8eM2txeCdUo7FO7PcNmaslc64vHq5MuGnVF7FeHPG0kJKHsEDBox
	de4z3pHwu2rWh28CjHCZNR4ctuskHhOealiu0iysLwl1ISttgLY6PHEaNBFXBL+AmizPSuZrWui/Y
	J7ua8uKqrxvCfYxbnsdtBWLKOOPWbYYItP43MXnS+hQZkLCZEJrW0hHrj1hEuE3Dg8ezZfCQBuzEx
	yxQXT/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaW3-00000007NSJ-2llS;
	Mon, 09 Mar 2026 13:19:23 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaW1-00000007NMZ-0dQN;
	Mon, 09 Mar 2026 13:19:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 173DE286152;
	Mon,  9 Mar 2026 14:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773062357; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AsslNjPsniHPFq7y9ACqeRGOIicsFNpWA+I3qRFhHu8=;
	b=j9ecNe94U9Em4IEwzKUh0fU8VAQGLclzvHLaHHqfT106fFGiQDskAYkhTzaE1I6qjgyzGB
	fzHSl3OV+SjCc2QfXwjyk3yMQLg7T39ghqRKxskqHiybQKxgOfaq5qCLdF/Ewkkym92M4i
	D9RG+xHxpH0Rcbc7ezS0pZE4VKZJpacQjXW291iNDzVEpnLXuikzBcl2FFHwLxgwYFWxMF
	RphLbS4y7iN4bji5qazjWyDImLHqnPZ1tXdm1UYNaVs6l13v8UoCR5wmGIbMJWqPjr5MfE
	SDf5XydOSUjXeliTSKntn/ovIe2m9Wdk7LS6oGl7bpbcJ8nEHlAZkjr2ABmwDw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 8/8] mips: dts: Add PCIe to EcoNet EN751221
Date: Mon,  9 Mar 2026 13:18:18 +0000
Message-Id: <20260309131818.74467-9-cjd@cjdns.fr>
In-Reply-To: <20260309131818.74467-1-cjd@cjdns.fr>
References: <20260309131818.74467-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_061921_605389_4F4FC243 
X-CRM114-Status: UNSURE (   9.51  )
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

Add PCIe based on EN7528 PCIe driver, also add two MT76 wifi devices
to SmartFiber XP8421-B.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 arch/mips/boot/dts/econet/en751221.dtsi       | 114 ++++++++++++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  21 ++++
 arch/mips/econet/Kconfig                      |   2 +
 3 files changed, 137 insertions(+)

diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
index 2abeef5b744a..72cb65654c34 100644
--- a/arch/mips/boot/dts/econet/en751221.dtsi
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /dts-v1/;
 
+#include <dt-bindings/clock/econet,en751221-scu.h>
+
 / {
 	compatible = "econet,en751221";
 	#address-cells = <1>;
@@ -30,6 +32,30 @@ cpuintc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
+	chip_scu: syscon@1fa20000 {
+		compatible = "econet,en751221-chip-scu", "syscon";
+		reg = <0x1fa20000 0x388>;
+	};
+
+	pcie_phy1: pcie-phy@1fac0000 {
+		compatible = "econet,en751221-pcie-gen2";
+		reg = <0x1fac0000 0x1000>;
+		#phy-cells = <0>;
+	};
+
+	pcie_phy0: pcie-phy@1faf2000 {
+		compatible = "econet,en751221-pcie-gen1";
+		reg = <0x1faf2000 0x1000>;
+		#phy-cells = <0>;
+	};
+
+	scuclk: clock-controller@1fb00000 {
+		compatible = "econet,en751221-scu";
+		reg = <0x1fb00000 0x970>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
 	intc: interrupt-controller@1fb40000 {
 		compatible = "econet,en751221-intc";
 		reg = <0x1fb40000 0x100>;
@@ -41,6 +67,94 @@ intc: interrupt-controller@1fb40000 {
 		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
 	};
 
+	pciecfg: pciecfg@1fb80000 {
+		compatible = "mediatek,generic-pciecfg", "syscon";
+		reg = <0x1fb80000 0x1000>;
+	};
+
+	pcie0: pcie@1fb81000 {
+		compatible = "econet,en7528-pcie";
+		device_type = "pci";
+		reg = <0x1fb81000 0x1000>;
+		reg-names = "port0";
+		linux,pci-domain = <0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+		interrupts = <23>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scuclk EN751221_CLK_PCIE>;
+		clock-names = "sys_ck0";
+		phys = <&pcie_phy0>;
+		phy-names = "pcie-phy0";
+		bus-range = <0x00 0xff>;
+		ranges = <0x01000000 0 0x00000000 0x1f600000 0 0x00008000>,
+			 <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+				<0 0 0 2 &pcie_intc0 1>,
+				<0 0 0 3 &pcie_intc0 2>,
+				<0 0 0 4 &pcie_intc0 3>;
+
+		pcie_intc0: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		slot0: pcie@0,0 {
+			reg = <0x0000 0 0 0 0>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
+	};
+
+	pcie1: pcie@1fb83000 {
+		compatible = "econet,en7528-pcie";
+		device_type = "pci";
+		reg = <0x1fb83000 0x1000>;
+		reg-names = "port1";
+		linux,pci-domain = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+		interrupts = <24>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scuclk EN751221_CLK_PCIE>;
+		clock-names = "sys_ck1";
+		phys = <&pcie_phy1>;
+		phy-names = "pcie-phy1";
+		bus-range = <0x00 0xff>;
+		ranges = <0x81000000 0 0x00000000 0x1f608000 0 0x00008000>,
+			 <0x82000000 0 0x28000000 0x28000000 0 0x08000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+				<0 0 0 2 &pcie_intc1 1>,
+				<0 0 0 3 &pcie_intc1 2>,
+				<0 0 0 4 &pcie_intc1 3>;
+
+		pcie_intc1: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		slot1: pcie@1,0 {
+			reg = <0x0800 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
+	};
+
 	uart: serial@1fbf0000 {
 		compatible = "ns16550";
 		reg = <0x1fbf0000 0x30>;
diff --git a/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
index 8223c5bce67f..c633bf73add6 100644
--- a/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
+++ b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
@@ -17,3 +17,24 @@ chosen {
 		linux,usable-memory-range = <0x00020000 0x1bfe0000>;
 	};
 };
+
+&pcie0 {
+	status = "okay";
+};
+&slot0 {
+	wifi@0,0 {
+		/* MT7612E */
+		compatible = "mediatek,mt76";
+		reg = <0x0000 0 0 0 0>;
+	};
+};
+&pcie1 {
+	status = "okay";
+};
+&slot1 {
+	wifi@0,0 {
+		/* MT7592 */
+		compatible = "mediatek,mt76";
+		reg = <0x0000 0 0 0 0>;
+	};
+};
diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
index fd69884cc9a8..b37b9d25d5a4 100644
--- a/arch/mips/econet/Kconfig
+++ b/arch/mips/econet/Kconfig
@@ -13,7 +13,9 @@ choice
 		bool "EN751221 family"
 		select COMMON_CLK
 		select ECONET_EN751221_INTC
+		select HAVE_PCI
 		select IRQ_MIPS_CPU
+		select PCI_DRIVERS_GENERIC
 		select SMP
 		select SMP_UP
 		select SYS_SUPPORTS_SMP
-- 
2.39.5


