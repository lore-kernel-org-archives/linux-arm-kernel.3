Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54714C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4/G8/exgOOvkgKjAj+UibFwMMH8hTvH+jqgXzucqWA=; b=QfTK0MhwJPwTUEoo/OS76S1OyD
	hL9hm0J4TCdVCrM0et0L99lT2XOoD0i93bsJsMMWxYa4oUxe1/WRRFB89sjgzfuXhNnLC7gmYRtR9
	wkJqK04zVKmRNHzb9e2pK9cwQYGksKIDcWD+U0xfV3//D55fU0rvViWVqwEGSxIZiIIhMknQX6kTP
	OVLHAey+3DnS3e/idHvSzWMBesQ0wrRSIpudjeGOAonLFd7GGVqpOw3gTMzJhmMtYzOo1cq7tFedo
	vpKGG0XKBw0tbG2hOolx9QnOieskgUpAwREHKzQ0uiTVP1tTK3xsiQzk1jZnZA818jbyss/2i9u7M
	zyMyzUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1K-00000001V4e-3ZFx;
	Mon, 07 Apr 2025 18:16:30 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ntt-00000000psy-2iRu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 14:56:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id B56C544329;
	Mon,  7 Apr 2025 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744037795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4/G8/exgOOvkgKjAj+UibFwMMH8hTvH+jqgXzucqWA=;
	b=NL/lwJGY4IhVWDGBQIV4jX9Elf9DXdzMg6cgxl1zajKwlwt/1xNlIhdwJI3yHsUYWBZaKX
	lBwJlii0OyrvJgo2UXJ/y374HpPZJnGGOQJ/pHX8XYWI8MMAKp3LPHAk0IeKBauALvaoub
	fLd+NDugNMAfWeYw1RAh5RmcsJeUDv1NZV2fCHJy0xS8fic0T9oyQQCdBOIOGd/J5oaw+r
	Sb4z5MVtFeS85WS7uRRnZAN5/Mov83wGdbYo8mEmvhC67kRv3LAKP5sgSzEuzp2xEkamE6
	hIYKZ2E8wVBh+bMAovBsEnc28So1BO7dy7i6n5kvZETvoEz8QLXb7osFozn23Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to support SFPs
Date: Mon,  7 Apr 2025 16:55:44 +0200
Message-ID: <20250407145546.270683-16-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407145546.270683-1-herve.codina@bootlin.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrt
 ghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_075637_874636_073570F9 
X-CRM114-Status: GOOD (  10.89  )
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
 drivers/misc/lan966x_pci.dtso | 111 ++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 94a967b384f3..a2015b46cd44 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -47,6 +47,47 @@ sys_clk: clock-15625000 {
 				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
 			};
 
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
+
 			pci-ep-bus@0 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
@@ -95,6 +136,50 @@ port1: port@1 {
 							phy-mode = "gmii";
 							phys = <&serdes 1 CU(1)>;
 						};
+
+						port2: port@2 {
+							reg = <2>;
+							phy-mode = "sgmii";
+							phys = <&serdes 2 SERDES6G(0)>;
+							sfp = <&sfp2>;
+							managed = "in-band-status";
+						};
+
+						port3: port@3 {
+							reg = <3>;
+							phy-mode = "sgmii";
+							phys = <&serdes 3 SERDES6G(1)>;
+							sfp = <&sfp3>;
+							managed = "in-band-status";
+						};
+					};
+				};
+
+				flx0: flexcom@e0040000 {
+					compatible = "atmel,sama5d2-flexcom";
+					reg = <0xe0040000 0x100>;
+					clocks = <&clks GCK_ID_FLEXCOM0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x0 0xe0040000 0x800>;
+
+					atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+
+					i2c0: i2c@600 {
+						compatible = "microchip,sam9x60-i2c";
+						reg = <0x600 0x200>;
+						interrupt-parent = <&oic>;
+						interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						clocks = <&clks GCK_ID_FLEXCOM0>;
+						assigned-clocks = <&clks GCK_ID_FLEXCOM0>;
+						assigned-clock-rates = <20000000>;
+						pinctrl-0 = <&fc0_a_pins>;
+						pinctrl-names = "default";
+						i2c-analog-filter;
+						i2c-digital-filter;
+						i2c-digital-filter-width-ns = <35>;
 					};
 				};
 
@@ -103,6 +188,14 @@ cpu_ctrl: syscon@e00c0000 {
 					reg = <0xe00c0000 0xa8>;
 				};
 
+				clks: clock-controller@e00c00a8 {
+					compatible = "microchip,lan966x-gck";
+					#clock-cells = <1>;
+					clocks = <&cpu_clk>, <&ddr_clk>, <&sys_clk>;
+					clock-names = "cpu", "ddr", "sys";
+					reg = <0xe00c00a8 0x38>, <0xe00c02cc 0x4>;
+				};
+
 				oic: oic@e00c0120 {
 					compatible = "microchip,lan966x-oic";
 					#interrupt-cells = <2>;
@@ -143,6 +236,24 @@ fc0_a_pins: fcb4-i2c-pins {
 						pins = "GPIO_9", "GPIO_10";
 						function = "fc0_a";
 					};
+
+					i2cmux_pins: i2cmux-pins {
+						pins = "GPIO_76", "GPIO_77";
+						function = "twi_slc_gate";
+						output-low;
+					};
+
+					i2cmux_0: i2cmux-0 {
+						pins = "GPIO_76";
+						function = "twi_slc_gate";
+						output-high;
+					};
+
+					i2cmux_1: i2cmux-1 {
+						pins = "GPIO_77";
+						function = "twi_slc_gate";
+						output-high;
+					};
 				};
 
 				mdio1: mdio@e200413c {
-- 
2.49.0


