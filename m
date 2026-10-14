Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A819C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYBpgkegkWJ3CyqTzxpHF4GV7nXLkfCjAQXCSbyoKms=; b=WOAPPniGG+4w6O9v7+miz/s0re
	qSlI/IVWey7JeviyHWrPJdbAELDMNAeBpwKTYBTJY1RwAP69k7jrIfCdkSpSFzHsMQEa5Fei2y/gy
	joA28gfdUdUng/3v/h9o9xn7CDtoF+TI3bkardLERuhXJ/3UFXkefs+TcaaXntLDKFmmnDBaAdpYg
	vK8iaYMetvNpmKmUikaf19/oIz4okT20kiXfwN0PPyI50sj7HfTahFiKAgfdD4SuqNq6c3Ba8NV1C
	Z1Iel6TscwnhNTRjOqs0NIOwKOJ8e3bssp/UIFi0t3M0C36/ruppxmhX7pMrqE4z1jC2QSQHFMc+G
	rW6aakMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37v-0000000G6lB-2YZv;
	Wed, 14 Oct 2026 17:50:55 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37n-0000000G6hg-3P6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:50:50 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-3ac144119e4so1271923a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000247; x=1792605047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYBpgkegkWJ3CyqTzxpHF4GV7nXLkfCjAQXCSbyoKms=;
        b=oHgcvt0nG7KZGuXhLb48qzQLt6cxMSd4nIe6ujbzIo6Kgdg/bEnJveX+6piDDvYpRO
         YoLtIgvoj3fia4t8iktX6eD6X0h0YqPOBMK/PP1S5J/NB5GXVLXpS6Ov3t9bVxeV4Bu4
         gmxfqGSsffDXZUKhU2pnoGvKFN0rFLd/OZKt+mXpQbOyLuLQWGgi7p5NhaW/7q0acBgP
         0P5ZTk+92tmxSFesKsDQK2ob9EqxL0xELCbioKGzxBNcemr/9353DYu2B3qXkvMLWxg5
         CqRQLhTdc7fDCtUZUWVXCaKACkcN4YHdxf+CNKoxsWxyGhcF91KQpXiE55DsZvUPESZ1
         M+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000247; x=1792605047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYBpgkegkWJ3CyqTzxpHF4GV7nXLkfCjAQXCSbyoKms=;
        b=Zlgy7RefbgTE50RgrGaZbY6Uu88KaXmNpfyIciReNLfDvBiauA0Q5faCUDhrMo+dek
         d/8lPYUqlH41xhZrc3BT4+6BKyawvLazPh6OJuz0Y/m1ak2AGX2NxYVz9Jx0Y0aPng/k
         4mddy2+AgY/MaruYj51SrgUFXCDjyzpEWSKQfmuO4LO1fOAj7Kh5gkpHWU/oDlFgvupW
         gZIcVFckjpDHCcmlJgoQu2bNcSsLkaFqQDtQveZzNBGGz/RjSPH22Pg/PQDcl2ZXUEkg
         Vxnu/qe3d33TiE5qzEYPb+YPA1kNyZOeF6T2fY5n5F6z+aZtKMzmn11KrE2lWkXT+APR
         Eyfg==
X-Forwarded-Encrypted: i=1; AKwUvBwBqC/vu+gTtVYL6GNZNPQWk5ozlKKzsop74Be6tdKqusxnpQlM0TFJbmKVVk+bPt2xm4BX0XA77z/Z7lCJXaWm@lists.infradead.org
X-Gm-Message-State: AFq9FYLpRhG0rc1t9GdrvUXCTBQqrD4NYVEWVadWT9H0kTkvP/AbqRzm
	rC0WJGa9nVh5SRvEkO5aqh/1IZfadYn4Ij3XgTuw/2Ni6Fnn3OnDjLl+
X-Gm-Gg: AYBFou1arl9qFpQ19lSxLpm5XLt58GfH/kT138nPPyF7n5QS2jzHqqTDpdtdPD0xt4Y
	wnA3HbLfDwrkBfVgg5tSOjtkmKWFzTl87YoR/45VB8puhqXmdGQCZpbR8Joi14uW5VHYB3KqWEV
	yV9e3ao5pCG3ySVEfbdf9Z7HfNlqex8Vs3BwB2DMlTnnRqQ4/uF53bJnoUf5o6qpB/k4Q4/Eur6
	kRzoMpvIDPoPN1L/wyagdSma/AqjL0mEKyMdJ6AsdU5gS20InYifvk8YoYL/3Nuwke5idANLsoi
	tRHsuMldRSfMgWqac00gGMayZWczC/IDV8586/VUPq4pSSV4LeObxj+JQU2ndwC+bD+FW/fm1Aa
	sNGSGVqKpVDsb6L97PyVNnTuBx35zqfAmimd7m03uwk5IQpQzYGKMcBBh7bjxIMoQKKEXDd+P9G
	eXx3U7t2VKedTBaxLTgVwA1gWcj7Hh4MAL+1n+ZcwWcLbaTjNLnlUy2NXfLZGcrAGJkN0MORWad
	Nh+jYRJBarWHZQzpcYx
X-Received: by 2002:a17:90b:3c04:b0:3a8:a190:a18f with SMTP id 98e67ed59e1d1-3ab3a735fc7mr14363006a91.21.1792000246707;
        Wed, 14 Oct 2026 10:50:46 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:45 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: zynqmp: Add ALINX EdgeBoard FZ3A
Date: Thu, 15 Oct 2026 01:50:20 +0800
Message-ID: <20261014175020.62907-4-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_105047_864898_8A4FEB04 
X-CRM114-Status: GOOD (  18.77  )
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

Add device tree for the ALINX EdgeBoard FZ3A, a single board computer
based on the Xilinx Zynq UltraScale+ XCZU3EG SoC.

Supported peripherals:
  - UART1 debug console
  - eMMC (HS200) and microSD card
  - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

Tested on hardware with Linux 7.3.0-rc5: the board boots from SD card
into userspace over the serial console, gem3 negotiates 1000Mbps/Full
duplex with phy-mode = "rgmii-id", and the eMMC runs in HS200 mode.

The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
dt_binding_check.

Link: https://ai.baidu.com/tech/hardware/deepkit
Link: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Add public board documentation and product links in commit message
    and DTS header comment (Michal Simek)
  - Conform to DTS coding style:
    - Sort compatible before model in root node
    - Sort children in natural-sort order
    - Reorder properties in canonical order (phys before phy-names, etc.)
    - Add required blank lines before status properties
    - Alphabetize pinctrl children and pin configurations

Changes in v2:
  - Rename to 'zynqmp-alinx-edgeboard-fz3a.dts' using 'alinx' prefix
    (Krzysztof Kozlowski)
  - Describe the board as a single board computer with the SoC, DDR4 and
    eMMC on one PCB, not a carrier board with a MYIR SoM (Andrew Lunn)
  - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle (Andrew Lunn)
  - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and mmc-hs200-1_8v
  - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
    which only produce spurious warnings on pre-2023.1 PM firmware

 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 360 ++++++++++++++++++
 2 files changed, 361 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index 70fac0b27..3e07b36ef 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
+dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-alinx-edgeboard-fz3a.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1751-xm015-dc1.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
new file mode 100644
index 000000000..6cad90091
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device tree for the ALINX EdgeBoard FZ3A
+ * based on the Xilinx Zynq UltraScale+ XCZU3EG
+ *
+ * Product info: https://ai.baidu.com/tech/hardware/deepkit
+ * Documentation: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
+ *
+ * Copyright (c) 2026 Pufan Jin
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
+#include "zynqmp.dtsi"
+#include "zynqmp-clk-ccf.dtsi"
+
+/ {
+	compatible = "alinx,edgeboard-fz3a", "xlnx,zynqmp";
+	model = "ALINX EdgeBoard FZ3A";
+
+	aliases {
+		ethernet0 = &gem3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		serial0 = &uart1;
+		serial1 = &uart0;
+		spi0 = &qspi;
+		usb0 = &usb0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	dp_aclk: clock-dp-aclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	gtr_refclk0: clock-gtr-ref0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	gtr_refclk1: clock-gtr-ref1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	gtr_refclk2: clock-gtr-ref2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+
+	/*
+	 * Vendor TF-A 1.8.1 does not register LPD_LSBUS (ID 31) into CCF.
+	 * Provide a fixed-clock fallback for bus peripherals to probe.
+	 */
+	lpd_lsbus: clock-lpd-lsbus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	dpcon: connector {
+		compatible = "dp-connector";
+		label = "mini-DP";
+		type = "mini";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
+
+	vcc_3v3_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "pcie-reset";
+	};
+
+	reserved_memory: reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x0 0x7ff00000>;
+			reusable;
+			size = <0x0 0x20000000>;
+		};
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x7ff00000>;
+	};
+};
+
+&ams_pl {
+	status = "okay";
+};
+
+&ams_ps {
+	status = "okay";
+};
+
+&dwc3_0 {
+	dr_mode = "host";
+	maximum-speed = "super-speed";
+	snps,dis_enblslpm_quirk;
+	snps,dis_u2_susphy_quirk;
+	snps,hsphy_interface = "ulpi";
+	snps,usb3_lpm_capable;
+
+	status = "okay";
+};
+
+&gem3 {
+	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
+		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
+		 <&zynqmp_clk GEM_TSU>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_gem3_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0022.1620";
+			reg = <1>;
+		};
+	};
+};
+
+&gpio {
+	clocks = <&lpd_lsbus>;
+
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
+
+&pcie {
+	phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
+
+	status = "okay";
+};
+
+&pinctrl0 {
+	status = "okay";
+
+	pinctrl_gem3_default: gem3-default {
+		conf {
+			groups = "ethernet3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		conf-mdio {
+			bias-disable;
+			groups = "mdio3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		conf-rx {
+			low-power-disable;
+			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
+			       "MIO75";
+		};
+
+		conf-tx {
+			bias-disable;
+			low-power-enable;
+			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
+			       "MIO69";
+		};
+
+		mux {
+			function = "ethernet3";
+			groups = "ethernet3_0_grp";
+		};
+
+		mux-mdio {
+			function = "mdio3";
+			groups = "mdio3_0_grp";
+		};
+	};
+
+	pinctrl_i2c0_default: i2c0-default {
+		conf {
+			bias-pull-up;
+			groups = "i2c0_8_grp";
+		};
+
+		mux {
+			function = "i2c0";
+			groups = "i2c0_8_grp";
+		};
+	};
+
+	pinctrl_i2c1_default: i2c1-default {
+		conf {
+			bias-pull-up;
+			groups = "i2c1_8_grp";
+		};
+
+		mux {
+			function = "i2c1";
+			groups = "i2c1_8_grp";
+		};
+	};
+
+	pinctrl_sdhci0_default: sdhci0-default {
+		conf {
+			bias-disable;
+			groups = "sdio0_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		mux {
+			function = "sdio0";
+			groups = "sdio0_0_grp";
+		};
+	};
+
+	pinctrl_usb0_default: usb0-default {
+		mux {
+			function = "usb0";
+			groups = "usb0_0_grp";
+		};
+	};
+};
+
+&psgtr {
+	clocks = <&gtr_refclk0>, <&gtr_refclk1>, <&gtr_refclk2>;
+	clock-names = "ref0", "ref1", "ref2";
+
+	status = "okay";
+};
+
+&qspi {
+	clocks = <&zynqmp_clk QSPI_REF>, <&lpd_lsbus>;
+	num-cs = <1>;
+
+	status = "okay";
+
+	flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&sdhci0 {
+	assigned-clock-rates = <187498125>;
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	clocks = <&zynqmp_clk SDIO0_REF>, <&lpd_lsbus>;
+	disable-wp;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&pinctrl_sdhci0_default>;
+	pinctrl-names = "default";
+	xlnx,mio-bank = <0>;
+
+	status = "okay";
+};
+
+&sdhci1 {
+	clocks = <&zynqmp_clk SDIO1_REF>, <&lpd_lsbus>;
+	disable-wp;
+	no-1-8-v;
+
+	status = "okay";
+};
+
+&uart0 {
+	clocks = <&zynqmp_clk UART0_REF>, <&lpd_lsbus>;
+
+	status = "okay";
+};
+
+&uart1 {
+	clocks = <&zynqmp_clk UART1_REF>, <&lpd_lsbus>;
+
+	status = "okay";
+};
+
+&usb0 {
+	phys = <&psgtr 1 PHY_TYPE_USB3 0 1>;
+	phy-names = "usb3-phy";
+	pinctrl-0 = <&pinctrl_usb0_default>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&zynqmp_dpdma {
+	status = "okay";
+};
+
+&zynqmp_dpsub {
+	clocks = <&dp_aclk>,
+		 <&zynqmp_clk DP_AUDIO_REF>,
+		 <&zynqmp_clk DP_VIDEO_REF>;
+	clock-names = "dp_apb_clk", "dp_aud_clk", "dp_vtc_pixel_clk_in";
+	phys = <&psgtr 3 PHY_TYPE_DP 0 2>,
+	       <&psgtr 2 PHY_TYPE_DP 1 2>;
+	phy-names = "dp-phy0", "dp-phy1";
+
+	status = "okay";
+};
-- 
2.56.0


