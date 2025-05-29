Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15667C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=; b=XARj+dPhJhrboKEr3g2TmuydsE
	cf+40FKo2HEFqntY60Q23/MN7IiZdLlWEAwtumo6kCFZ1D0nFjtErLV3nRJB9GNzI2lPdaWvFnvkr
	dOFSBNVJo3TGioKg7Lde4KxO58gdQ2tUPaCjBodN2oL9uE9/1zCOWWWHy5zko/ZfWyKP83y6+zcoh
	PEC7v/V0IGFmwtyyPyNXfHd6ScB30qtFBxFc5eDuN7oNF1wMANRalQi7H1QUaIjydjjSZcvS1XL72
	N7fTMkbyLkAjc5OpHSMwV2WMdnSY4zMv16yarYdRu3wOTRmJYKABm2dKRxdj3CEV3j9Ps+Ri6Oskb
	HuIEgeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKb8p-0000000FZuy-36wG;
	Thu, 29 May 2025 11:09:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKanz-0000000FXdj-1sRh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:12 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so1460250a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515690; x=1749120490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=dmrkeKDX+YOOiZz0ORVA6jVNgwBlRlYgd1KT0jEEAFFe0l2us68U2TW+28K7CfPZQ1
         PRXZAevWwC2vlw7Wc4mp2ZVlrxvSvPe76BaPWxgM0Q9KmsIyHbQx3GuGN/ddvU8bOew0
         0nzhVONopuq70a3ZquhvZ0CehVoLhko3UIe09XBTmCAYM4fmDNhP1D5FghF8TAbNIL2o
         G+qpKyfiZhFNocJhs58nF7STgH5xiJUdnCkFBrgotBNeclZ8faWmopXtyhrtuBEA4e2D
         IGsKslLY4fT1ZVWwoh2QgekMKytj8/TNO+rSV0ezyqPhTT9fPW3uq1oGo68pDTaNI0FW
         32RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515690; x=1749120490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=rGxRZpKxfzxOTCgMtXB+hT9IqpyYyip7wMwH6YAl0J5JFDHfHrrZlGJcfAkIbkVGu7
         a7BM7yxnYMwo9KrrfkJmUUBNVKxCe6M0+LL7UGmagAhp0IgIFfIlA3nfw+Zb7jay48fc
         JbEGuKbBsk3XM8e6JPeZV5HxZAOjJuqHJ4QhVZ+WVPZ+AaH4QUVafO/DbT3SYMfDGnPL
         eGqpbYF91iClhKXTme4+/l77wJMQkFYHgSyaR6yEOla+6korhWEvn/sWOCMqKYZGPYo9
         0eNcLxOFStpu1SOpXy34euYedfs9QeG0FdHedSTfz+pB9heVm3J2OlcWDM3n4NklhX2h
         tS+g==
X-Forwarded-Encrypted: i=1; AJvYcCXudNchEtnbhylBF8u0RbLaGj1ULCwCd03cQeESPuNGp0/6k2wWZPcCMZIDDzRdrMPjyfTWGZw4HN27s69JTe2J@lists.infradead.org
X-Gm-Message-State: AOJu0YxPyZutfNanvZJBWWPnJDxGgkF1ANXsucQoAdOeKJrSCu6Rkh7i
	5deOJHy6Q7BGi1G+GMBqkYDH733+c9ylAr72E/eJVEdwV1WFQNWOrTYS/v9RhdwiLTU=
X-Gm-Gg: ASbGncs833gFS7uX9fj3keL3Yu4KopB14zSo+CVcxmhJ6VwcvqCxjKId1aWxYttu96m
	in2COsg47LtFN31Ozp+mWgiS6Rwpws8I4/OUJV4lIAqL6WzpbIcOAhIEmPV3vSm2Oh/84rgnl+B
	xLO/KP/2eccyeZrwaCeIlEZ+B+39ioS+nrvvZR7TBWw6EWKtSeUz0I9LhDlblb6Q5R57+lAu4XA
	pvcu2pIdzfHbK73zOpd7ZUAggdmnDKXx2mOAyMmnnWeoDqCQDMJOdJ2WQkMpjymtn9busX8A8cP
	llQ66IVyOdz3I4GgomrJf/FLbyDSYqs9MbHB1Jc8lax5+yvtDSFqW2TIxSwX1gXUX5REpG5gd1G
	Kbtf6uTp7FSKs+9aZ+J0vt/dQa3R+hldN
X-Google-Smtp-Source: AGHT+IEqctQn6JYkD2OU2g3E86TiXNt7YciFPiTRUFr7ZULRQQIqdNiEQCdQ6/MquQBqItelOVzh2Q==
X-Received: by 2002:a17:907:9806:b0:ad2:2146:3b89 with SMTP id a640c23a62f3a-ad85b185b5fmr1527064066b.47.1748515689516;
        Thu, 29 May 2025 03:48:09 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2c842b9fsm21581266b.143.2025.05.29.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:09 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 09/10] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
Date: Thu, 29 May 2025 12:49:26 +0200
Message-ID: <20250529104940.23053-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034811_487764_7EC8BE74 
X-CRM114-Status: GOOD (  22.56  )
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

Add the fully populated DTS for RaspberryPi 5 which includes
the RP1 node definition. The inclusion tree is as follow (the
arrow points to the includer):

rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b-ovl-rp1.dts

This is designed to maximize the compatibility with downstream DT
while ensuring that a fully defined DT (one which includes the RP1
node as opposed to load it from overlay at runtime) is present
since early boot stage.

Since the preferred board DT is the fully populated one, name it
bcm2712-rpi-5-b.dts and move the previous one into
bcm2712-rpi-5-b-ovl-rp1.dts.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/Makefile         |   1 +
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 121 ++++++++++++++++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 118 ++---------------
 3 files changed, 133 insertions(+), 107 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 01ecfa304184..031875a277d7 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b-ovl-rp1.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-2-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
new file mode 100644
index 000000000000..6ea3c102e0d6
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "bcm2712.dtsi"
+
+/ {
+	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5";
+
+	aliases {
+		serial10 = &uart10;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial10:115200n8";
+	};
+
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
+	/* Will be filled by the bootloader */
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0 0 0x28000000>;
+	};
+
+	sd_io_1v8_reg: sd-io-1v8-reg {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-sd-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-settling-time-us = <5000>;
+		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>,
+			 <3300000 0>;
+	};
+
+	sd_vcc_reg: sd-vcc-reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
+ * labeled "UART", i.e. the interface with the system console.
+ */
+&uart10 {
+	status = "okay";
+};
+
+/* SDIO1 is used to drive the SD card */
+&sdio1 {
+	vqmmc-supply = <&sd_io_1v8_reg>;
+	vmmc-supply = <&sd_vcc_reg>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
+	sd-uhs-sdr104;
+};
+
+&soc {
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mboxes = <&mailbox>;
+		dma-ranges;
+
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
+		};
+
+		reset: reset {
+			compatible = "raspberrypi,firmware-reset";
+			#reset-cells = <1>;
+		};
+	};
+
+	power: power {
+		compatible = "raspberrypi,bcm2835-power";
+		firmware = <&firmware>;
+		#power-domain-cells = <1>;
+	};
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
+	clock-names = "core", "disp";
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 1850a575e708..adad85e68f1b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -1,113 +1,17 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/dts-v1/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include "bcm2712.dtsi"
-
-/ {
-	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
-	model = "Raspberry Pi 5";
-
-	aliases {
-		serial10 = &uart10;
-	};
-
-	chosen: chosen {
-		stdout-path = "serial10:115200n8";
-	};
-
-	clk_rp1_xosc: clock-50000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "rp1-xosc";
-		clock-frequency = <50000000>;
-	};
-
-	/* Will be filled by the bootloader */
-	memory@0 {
-		device_type = "memory";
-		reg = <0 0 0 0x28000000>;
-	};
-
-	sd_io_1v8_reg: sd-io-1v8-reg {
-		compatible = "regulator-gpio";
-		regulator-name = "vdd-sd-io";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-settling-time-us = <5000>;
-		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
-		states = <1800000 1>,
-			 <3300000 0>;
-	};
-
-	sd_vcc_reg: sd-vcc-reg {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc-sd";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		enable-active-high;
-		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
- * labeled "UART", i.e. the interface with the system console.
+/*
+ * bcm2712-rpi-5-b-ovl-rp1.dts is the overlay-ready DT which will make
+ * the RP1 driver to load the RP1 dtb overlay at runtime, while
+ * bcm2712-rpi-5-b.dts (this file) is the fully defined one (i.e. it
+ * already contains RP1 node, so no overlay is loaded nor needed).
+ * This file is not intended to be modified, nodes should be added
+ * to the included bcm2712-rpi-5-b-ovl-rp1.dts.
  */
-&uart10 {
-	status = "okay";
-};
 
-/* SDIO1 is used to drive the SD card */
-&sdio1 {
-	vqmmc-supply = <&sd_io_1v8_reg>;
-	vmmc-supply = <&sd_vcc_reg>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-ddr50;
-	sd-uhs-sdr104;
-};
-
-&soc {
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		mboxes = <&mailbox>;
-		dma-ranges;
-
-		firmware_clocks: clocks {
-			compatible = "raspberrypi,firmware-clocks";
-			#clock-cells = <1>;
-		};
-
-		reset: reset {
-			compatible = "raspberrypi,firmware-reset";
-			#reset-cells = <1>;
-		};
-	};
-
-	power: power {
-		compatible = "raspberrypi,bcm2835-power";
-		firmware = <&firmware>;
-		#power-domain-cells = <1>;
-	};
-};
-
-&hvs {
-	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
-	clock-names = "core", "disp";
-};
+/dts-v1/;
 
-&hdmi0 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-};
+#include "bcm2712-rpi-5-b-ovl-rp1.dts"
 
-&hdmi1 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
+&pcie2 {
+	#include "rp1-nexus.dtsi"
 };
-- 
2.35.3


