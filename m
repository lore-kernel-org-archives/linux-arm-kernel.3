Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C91C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzZTwPkUWQko/76hoZ8i7bmwjOZAurOFzlsPkY6zz6Q=; b=jUaO+mtUY3vOgfK+P1bGSgR1uQ
	6eY0XUiSdLq0Ma53cvp7UqxoZamv3WdYOrg4KZnCIs1gmRg1eWKglGebvWwtuhAUHIONfIVK5utI1
	bY+rxfBs0WhQUK4zWOfdpkGUSKmswton5k7B3Th/vticeRyUCK4l+8rnI6Cz4GT/VMrHn5STjU1/B
	Wxu4IS8cOPIxrrgmDPNtJtbmJrV+LF+0NxUi+LoeQGHvVYR/VwwSly7SsTosounu1MWcvyv+RF6aL
	afZ3ieEXBC7KFKH43uB9FrkDBMcadPuj5YLOz+q/T6+56NDEnKvAZz2+NsifyjFbNC3wmvoT3TZML
	ZnA8SQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZlL-0000000EecR-1d52;
	Wed, 07 May 2025 08:04:19 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYyo-0000000ETf4-1LUL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:14:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id E85E743B60;
	Wed,  7 May 2025 07:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzZTwPkUWQko/76hoZ8i7bmwjOZAurOFzlsPkY6zz6Q=;
	b=XzHTdJ+w5vzs2pBbI02/0vKVgbNrQYK4IQ647HA/wNUPWHZZ67SHt1mhf5htu+fhc3B6rk
	8uD2bJ3KkSaC3wAQsoZmnzICvxKEpyxC9FkNjoDpz/BEYVVfnI3lzVniloCuv5GqFGUQUo
	9NW+Ikz6yOV16tcLfvXXi4YB8ddTV5dAtsTKluKQBymKg+hEAx/vRC/rVEv+QoNCQabIBY
	zZQKip1HkInKwnoIEuVKDwITWcs2lne7zHddTnMUO4WytEzdUfYld+awldZzaKYWF6a2bc
	vI4A9F+6/OZ6ebhWjysuFTgfhgxDqtT8wumQyKAmJiCbku7Dl7go1Uy90lg9pQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 21/26] misc: lan966x_pci: Split dtso in dtsi/dtso
Date: Wed,  7 May 2025 09:13:03 +0200
Message-ID: <20250507071315.394857-22-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudegnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsr
 dhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_001410_639694_6F2C8037 
X-CRM114-Status: GOOD (  17.91  )
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

The lan966x_pci.dtso file contains descriptions related to both the
LAN966x PCI device chip and the LAN966x PCI device board where the chip
is soldered.

Split the file in order to have:
  - lan966x_pci.dtsi
    The description related to the PCI chip.

  - lan966x_pci.dtso
    The description of the PCI board.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS                   |   1 +
 drivers/misc/lan966x_pci.dtsi | 130 +++++++++++++++++++++++++
 drivers/misc/lan966x_pci.dtso | 174 +++++++---------------------------
 3 files changed, 166 insertions(+), 139 deletions(-)
 create mode 100644 drivers/misc/lan966x_pci.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..b985f34bcde8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15813,6 +15813,7 @@ MICROCHIP LAN966X PCI DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 S:	Maintained
 F:	drivers/misc/lan966x_pci.c
+F:	drivers/misc/lan966x_pci.dtsi
 F:	drivers/misc/lan966x_pci.dtso
 
 MICROCHIP LAN969X ETHERNET DRIVER
diff --git a/drivers/misc/lan966x_pci.dtsi b/drivers/misc/lan966x_pci.dtsi
new file mode 100644
index 000000000000..170298084fa5
--- /dev/null
+++ b/drivers/misc/lan966x_pci.dtsi
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Microchip UNG
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+cpu_clk: clock-600000000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;  /* CPU clock = 600MHz */
+};
+
+ddr_clk: clock-30000000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <30000000>;  /* Fabric clock = 30MHz */
+};
+
+sys_clk: clock-15625000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <15625000>;  /* System clock = 15.625MHz */
+};
+
+pci-ep-bus@0 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * map @0xe2000000 (32MB) to BAR0 (CPU)
+	 * map @0xe0000000 (16MB) to BAR1 (AMBA)
+	 */
+	ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
+		  0xe0000000 0x01 0x00 0x00 0x1000000>;
+
+	switch: switch@e0000000 {
+		compatible = "microchip,lan966x-switch";
+		reg = <0xe0000000 0x0100000>,
+		      <0xe2000000 0x0800000>;
+		reg-names = "cpu", "gcb";
+		interrupt-parent = <&oic>;
+		interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+			     <9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "xtr", "ana";
+		resets = <&reset 0>;
+		reset-names = "switch";
+		status = "disabled";
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port0: port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port1: port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+		};
+	};
+
+	cpu_ctrl: syscon@e00c0000 {
+		compatible = "microchip,lan966x-cpu-syscon", "syscon";
+		reg = <0xe00c0000 0xa8>;
+	};
+
+	oic: oic@e00c0120 {
+		compatible = "microchip,lan966x-oic";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>; /* PCI INTx assigned interrupt */
+		reg = <0xe00c0120 0x190>;
+	};
+
+	reset: reset@e200400c {
+		compatible = "microchip,lan966x-switch-reset";
+		reg = <0xe200400c 0x4>, <0xe00c0000 0xa8>;
+		reg-names = "gcb","cpu";
+		#reset-cells = <1>;
+		cpu-syscon = <&cpu_ctrl>;
+	};
+
+	gpio: pinctrl@e2004064 {
+		compatible = "microchip,lan966x-pinctrl";
+		reg = <0xe2004064 0xb4>,
+		      <0xe2010024 0x138>;
+		resets = <&reset 0>;
+		reset-names = "switch";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&gpio 0 0 78>;
+		interrupt-parent = <&oic>;
+		interrupt-controller;
+		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <2>;
+	};
+
+	mdio1: mdio@e200413c {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "microchip,lan966x-miim";
+		reg = <0xe200413c 0x24>,
+		      <0xe2010020 0x4>;
+		resets = <&reset 0>;
+		reset-names = "switch";
+		status = "disabled";
+
+		lan966x_phy0: ethernet-lan966x_phy@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		lan966x_phy1: ethernet-lan966x_phy@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+	};
+
+	serdes: serdes@e202c000 {
+		compatible = "microchip,lan966x-serdes";
+		reg = <0xe202c000 0x9c>,
+		      <0xe2004010 0x4>;
+		#phy-cells = <2>;
+	};
+};
diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 94a967b384f3..b3de5f14d9cb 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -3,10 +3,7 @@
  * Copyright (C) 2022 Microchip UNG
  */
 
-#include <dt-bindings/clock/microchip,lan966x.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/phy/phy-lan966x-serdes.h>
 
 /dts-v1/;
@@ -29,148 +26,47 @@ __overlay__ {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			cpu_clk: clock-600000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <600000000>;  /* CPU clock = 600MHz */
-			};
+			#include "lan966x_pci.dtsi"
 
-			ddr_clk: clock-30000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <30000000>;  /* Fabric clock = 30MHz */
-			};
-
-			sys_clk: clock-15625000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
-			};
-
-			pci-ep-bus@0 {
-				compatible = "simple-bus";
-				#address-cells = <1>;
-				#size-cells = <1>;
-
-				/*
-				 * map @0xe2000000 (32MB) to BAR0 (CPU)
-				 * map @0xe0000000 (16MB) to BAR1 (AMBA)
-				 */
-				ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
-				          0xe0000000 0x01 0x00 0x00 0x1000000>;
-
-				switch: switch@e0000000 {
-					compatible = "microchip,lan966x-switch";
-					reg = <0xe0000000 0x0100000>,
-					      <0xe2000000 0x0800000>;
-					reg-names = "cpu", "gcb";
-
-					interrupt-parent = <&oic>;
-					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
-						     <9 IRQ_TYPE_LEVEL_HIGH>;
-					interrupt-names = "xtr", "ana";
-
-					resets = <&reset 0>;
-					reset-names = "switch";
-
-					pinctrl-names = "default";
-					pinctrl-0 = <&tod_pins>;
-
-					ethernet-ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port0: port@0 {
-							phy-handle = <&lan966x_phy0>;
-
-							reg = <0>;
-							phy-mode = "gmii";
-							phys = <&serdes 0 CU(0)>;
-						};
-
-						port1: port@1 {
-							phy-handle = <&lan966x_phy1>;
-
-							reg = <1>;
-							phy-mode = "gmii";
-							phys = <&serdes 1 CU(1)>;
-						};
-					};
-				};
-
-				cpu_ctrl: syscon@e00c0000 {
-					compatible = "microchip,lan966x-cpu-syscon", "syscon";
-					reg = <0xe00c0000 0xa8>;
-				};
-
-				oic: oic@e00c0120 {
-					compatible = "microchip,lan966x-oic";
-					#interrupt-cells = <2>;
-					interrupt-controller;
-					interrupts = <0>; /* PCI INTx assigned interrupt */
-					reg = <0xe00c0120 0x190>;
-				};
-
-				reset: reset@e200400c {
-					compatible = "microchip,lan966x-switch-reset";
-					reg = <0xe200400c 0x4>, <0xe00c0000 0xa8>;
-					reg-names = "gcb","cpu";
-					#reset-cells = <1>;
-					cpu-syscon = <&cpu_ctrl>;
-				};
-
-				gpio: pinctrl@e2004064 {
-					compatible = "microchip,lan966x-pinctrl";
-					reg = <0xe2004064 0xb4>,
-					      <0xe2010024 0x138>;
-					resets = <&reset 0>;
-					reset-names = "switch";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&gpio 0 0 78>;
-					interrupt-parent = <&oic>;
-					interrupt-controller;
-					interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
-					#interrupt-cells = <2>;
+		};
+	};
+};
 
-					tod_pins: tod_pins {
-						pins = "GPIO_36";
-						function = "ptpsync_1";
-					};
+&gpio {
+	tod_pins: tod_pins {
+		pins = "GPIO_36";
+		function = "ptpsync_1";
+	};
+};
 
-					fc0_a_pins: fcb4-i2c-pins {
-						/* RXD, TXD */
-						pins = "GPIO_9", "GPIO_10";
-						function = "fc0_a";
-					};
-				};
+&lan966x_phy0 {
+	status = "okay";
+};
 
-				mdio1: mdio@e200413c {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					compatible = "microchip,lan966x-miim";
-					reg = <0xe200413c 0x24>,
-					      <0xe2010020 0x4>;
+&lan966x_phy1 {
+	status = "okay";
+};
 
-					resets = <&reset 0>;
-					reset-names = "switch";
+&mdio1 {
+	status = "okay";
+};
 
-					lan966x_phy0: ethernet-lan966x_phy@1 {
-						reg = <1>;
-					};
+&port0 {
+	phy-handle = <&lan966x_phy0>;
+	phy-mode = "gmii";
+	phys = <&serdes 0 CU(0)>;
+	status = "okay";
+};
 
-					lan966x_phy1: ethernet-lan966x_phy@2 {
-						reg = <2>;
-					};
-				};
+&port1 {
+	phy-handle = <&lan966x_phy1>;
+	phy-mode = "gmii";
+	phys = <&serdes 1 CU(1)>;
+	status = "okay";
+};
 
-				serdes: serdes@e202c000 {
-					compatible = "microchip,lan966x-serdes";
-					reg = <0xe202c000 0x9c>,
-					      <0xe2004010 0x4>;
-					#phy-cells = <2>;
-				};
-			};
-		};
-	};
+&switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tod_pins>;
+	status = "okay";
 };
-- 
2.49.0


