Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B77C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoTpd5CK7nvr6dHG5LWr9IC26BMOpRfFaLW3I7g0LVE=; b=C+ObJpUyR3/4e3OpLwtzci2WFq
	B5NorD82x238Tjno2z8rhFl5788EDWOCpPENmE2N+JNJ7b/WZU9rkF9JDKl/V0wIhPyT7Cm2V08C9
	4n5GJl76h035Zh2g4pSt9yr6TpmShirQQ3NZgRvOPHuaUXVVa+nxqdHooLpLtwkbiZwh4UndwJrxn
	3KsA9AEFYINZ/DzPA7HkOpO9KJyOiMZUbRUVObI95dWwPQ255KErElE54hjuNsEMKAv3vBnX4oaIh
	858jgBK/PbwZQz0oqIMYfjvQEBti7oD8DysmCHh1GDeGxls1T4n+LnBLucTJ5yYZGmTRxnOx41Qb6
	tTaEqbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ64L-0000000Gpd4-0314;
	Fri, 13 Jun 2025 15:11:49 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4n1-0000000GZ3E-0QXX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:49:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 728D642E77;
	Fri, 13 Jun 2025 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eoTpd5CK7nvr6dHG5LWr9IC26BMOpRfFaLW3I7g0LVE=;
	b=LDcUOrg9MTx4PnTEqqPoeSCtLZQktjp9lUIOW11e5gjhSwNqBcs0m3d574GbaGs383x4nK
	eELB4pk3Kfs+Km83BMXRmGXPe6WlVf+wGIXTxZUyN98AGG+OOele1Dvz6h8FuULdm5ZVHs
	qwA3mekMCaeFAWfUI+qcZpf+aineDKToa4nOsyOjmYrdkM4/C/NptiBTj3LEjGNO/2296r
	kN0m77YA+hdfMjcAtNSEMkb28gC9htbcifFyCZu9py8CH7bpD0V0tATVCew9ogFFLLKLlU
	X/XFink033xMMMXSmyWM9ipZYFNj00U8MP7QYM2egLJGYCmEZjw1bFculnrBCA==
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 26/28] misc: lan966x_pci: Add dtsi/dtso nodes in order to support SFPs
Date: Fri, 13 Jun 2025 15:48:06 +0200
Message-ID: <20250613134817.681832-27-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeduleenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrh
 hgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064951_271143_9F9156ED 
X-CRM114-Status: GOOD (  12.00  )
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

Add device-tree nodes needed to support SFPs.
Those nodes are:
 - the clock controller
 - the i2c controller
 - the i2c mux
 - the SFPs themselves and their related ports in the switch

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/lan966x_evb_lan9662_nic.dtso | 95 +++++++++++++++++++++++
 drivers/misc/lan966x_pci.dtsi             | 42 ++++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/misc/lan966x_evb_lan9662_nic.dtso b/drivers/misc/lan966x_evb_lan9662_nic.dtso
index b3de5f14d9cb..20e1fe4f78bf 100644
--- a/drivers/misc/lan966x_evb_lan9662_nic.dtso
+++ b/drivers/misc/lan966x_evb_lan9662_nic.dtso
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/phy/phy-lan966x-serdes.h>
 
 /dts-v1/;
@@ -28,15 +29,93 @@ __overlay__ {
 
 			#include "lan966x_pci.dtsi"
 
+			i2c0_emux: i2c0-emux {
+				compatible = "i2c-mux-pinctrl";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-parent = <&i2c0>;
+				pinctrl-names = "i2c102", "i2c103", "idle";
+				pinctrl-0 = <&i2cmux_0>;
+				pinctrl-1 = <&i2cmux_1>;
+				pinctrl-2 = <&i2cmux_pins>;
+
+				i2c102: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c103: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+
+			sfp2: sfp2 {
+				compatible = "sff,sfp";
+				i2c-bus = <&i2c102>;
+				tx-disable-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+				los-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+				mod-def0-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+				tx-fault-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+			};
+
+			sfp3: sfp3 {
+				compatible = "sff,sfp";
+				i2c-bus = <&i2c103>;
+				tx-disable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+				los-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
+				mod-def0-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
+				tx-fault-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+			};
 		};
 	};
 };
 
+&flx0 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&fc0_a_pins>;
+	pinctrl-names = "default";
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	status = "okay";
+};
+
 &gpio {
 	tod_pins: tod_pins {
 		pins = "GPIO_36";
 		function = "ptpsync_1";
 	};
+
+	fc0_a_pins: fcb4-i2c-pins {
+		/* RXD, TXD */
+		pins = "GPIO_9", "GPIO_10";
+		function = "fc0_a";
+	};
+
+	i2cmux_pins: i2cmux-pins {
+		pins = "GPIO_76", "GPIO_77";
+		function = "twi_slc_gate";
+		output-low;
+	};
+
+	i2cmux_0: i2cmux-0 {
+		pins = "GPIO_76";
+		function = "twi_slc_gate";
+		output-high;
+	};
+
+	i2cmux_1: i2cmux-1 {
+		pins = "GPIO_77";
+		function = "twi_slc_gate";
+		output-high;
+	};
 };
 
 &lan966x_phy0 {
@@ -65,6 +144,22 @@ &port1 {
 	status = "okay";
 };
 
+&port2 {
+	phy-mode = "sgmii";
+	phys = <&serdes 2 SERDES6G(0)>;
+	sfp = <&sfp2>;
+	managed = "in-band-status";
+	status = "okay";
+};
+
+&port3 {
+	phy-mode = "sgmii";
+	phys = <&serdes 3 SERDES6G(1)>;
+	sfp = <&sfp3>;
+	managed = "in-band-status";
+	status = "okay";
+};
+
 &switch {
 	pinctrl-names = "default";
 	pinctrl-0 = <&tod_pins>;
diff --git a/drivers/misc/lan966x_pci.dtsi b/drivers/misc/lan966x_pci.dtsi
index 170298084fa5..d5c2056e4e5c 100644
--- a/drivers/misc/lan966x_pci.dtsi
+++ b/drivers/misc/lan966x_pci.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2025 Microchip UNG
  */
 
+#include <dt-bindings/clock/microchip,lan966x.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 cpu_clk: clock-600000000 {
@@ -61,6 +62,39 @@ port1: port@1 {
 				reg = <1>;
 				status = "disabled";
 			};
+
+			port2: port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port3: port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+		};
+	};
+
+	flx0: flexcom@e0040000 {
+		compatible = "atmel,sama5d2-flexcom";
+		reg = <0xe0040000 0x100>;
+		clocks = <&clks GCK_ID_FLEXCOM0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xe0040000 0x800>;
+		status = "disabled";
+
+		i2c0: i2c@600 {
+			compatible = "microchip,sam9x60-i2c";
+			reg = <0x600 0x200>;
+			interrupt-parent = <&oic>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clks GCK_ID_FLEXCOM0>;
+			assigned-clocks = <&clks GCK_ID_FLEXCOM0>;
+			assigned-clock-rates = <20000000>;
+			status = "disabled";
 		};
 	};
 
@@ -69,6 +103,14 @@ cpu_ctrl: syscon@e00c0000 {
 		reg = <0xe00c0000 0xa8>;
 	};
 
+	clks: clock-controller@e00c00a8 {
+		compatible = "microchip,lan966x-gck";
+		#clock-cells = <1>;
+		clocks = <&cpu_clk>, <&ddr_clk>, <&sys_clk>;
+		clock-names = "cpu", "ddr", "sys";
+		reg = <0xe00c00a8 0x38>, <0xe00c02cc 0x4>;
+	};
+
 	oic: oic@e00c0120 {
 		compatible = "microchip,lan966x-oic";
 		#interrupt-cells = <2>;
-- 
2.49.0


