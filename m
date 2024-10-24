Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C83D0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwAI/VWjhGLZsVktX9+Rp5xHCbFG0SvmQxda7zhQt8o=; b=lvkcRJMFJpR9ntzSQulQHsRDY4
	w0yKCJRsVmhpEB9ZfyR3PaoxCcw8yG2FOjc7M0O1hovXDV1Nwx+EtWzYnG3vIyfNNU4hiuungcQEV
	ObQhL+KZgRU98SX304nBnXARdQH0OV4x3xuwCdz28MWXpAzCjNQ+wmE25nr5nPhzQon28+/OaF4/1
	CZOzSaVqWhqAADpN5NwOzd2xcVq3lh1NkInk8L/rMgX1h1KjUj6Ze2c4wb555N8jQPRks90sjn+h/
	tcGGfoqcbRZ2HbexhVnZk14tU4z1+Cq9ONpbkNqgSnuWIqpuqvAAJEbkMd2inoulfCKXj5JY64wJI
	gl7+WF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qZj-0000000GpJa-0yNX;
	Thu, 24 Oct 2024 05:39:59 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qIF-0000000Gn9m-3BTA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 05:21:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49O5LrIP015428;
	Thu, 24 Oct 2024 00:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729747313;
	bh=LwAI/VWjhGLZsVktX9+Rp5xHCbFG0SvmQxda7zhQt8o=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=R5huNr2BmX7xO2iCi24UGclnOSNUMzFlin4TBjl9pi4wmJbSxvdXLzJjYD60wIpVA
	 pR8oRm/nxWTgQ3HzRRWBbifMpSmyeNAkVzQ6NkFpMJR48SkeIjMP5EaHw2oYZHMFl7
	 neeX9zSR66gdAu03nbK7pfK4UW+h/dStydK0hbrw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49O5LqHh085086
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 00:21:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 00:21:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 00:21:52 -0500
Received: from [127.0.1.1] (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L4lI090467;
	Thu, 24 Oct 2024 00:21:48 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
Date: Thu, 24 Oct 2024 10:51:07 +0530
Subject: [PATCH v6 10/12] arm64: dts: ti: k3-j721e-evm*: Add bootph-*
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-b4-upstream-bootph-all-v6-10-2af90e3a4fe7@ti.com>
References: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
In-Reply-To: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Aniket Limaye <a-limaye@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis
	<afd@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729747264; l=6136;
 i=m-chawdhry@ti.com; s=20231127; h=from:subject:message-id;
 bh=YkoYsB9z0kCB3W0pfDiofnKczI4z+KXwjVWI+BKRyS8=;
 b=YC3KI4rR13j7HtbKSy5+T71/+jtaE+37SxvulHm7aK5mVPwDbaDQ9w/IbHvWVLIpSWTE9LP25
 YsvY52Bni9YD2zjFXbMKduwe+OS5z87v5CNIhnWdzgOkTkBd0KiM0yh
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519;
 pk=fsr6Tm39TvsTgfyfFQLk+nnqIz2sBA1PthfqqfiiYSs=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_222155_938457_7F90E93F 
X-CRM114-Status: GOOD (  10.37  )
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

Adds bootph-* properties to the leaf nodes to enable bootloaders to
utilise them.

Following adds bootph-* to:
- main_uart0, mcu_uart0(DM), wkup_uart0(TIFS) for Traces
- mmc0, mmc1, usb0, ospi0, ospi1, hbmc for enabling various bootmodes.

Reviewed-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---

Notes:
    R-by picked up in v5 ( Neha )

 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi           |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 8230d53cd69609d44b4a832cf214afdc2ee90e02..4c1e02a4e7a25c8fc6f55f06fe27d0f2b41483d7 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -193,6 +193,7 @@ J721E_IOPAD(0x1c0, PIN_OUTPUT, 1) /* (AA2) SPI0_CS0.UART0_RTSn */
 			J721E_IOPAD(0x1e8, PIN_INPUT, 0) /* (AB2) UART0_RXD */
 			J721E_IOPAD(0x1ec, PIN_OUTPUT, 0) /* (AB3) UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	main_uart1_pins_default: main-uart1-default-pins {
@@ -234,6 +235,7 @@ J721E_IOPAD(0x240, PIN_INPUT, 0) /* (R26) MMC1_DAT3 */
 			J721E_IOPAD(0x258, PIN_INPUT, 0) /* (P23) MMC1_SDCD */
 			J721E_IOPAD(0x25c, PIN_INPUT, 0) /* (R28) MMC1_SDWP */
 		>;
+		bootph-all;
 	};
 
 	vdd_sd_dv_alt_pins_default: vdd-sd-dv-alt-default-pins {
@@ -247,6 +249,7 @@ main_usbss0_pins_default: main-usbss0-default-pins {
 			J721E_IOPAD(0x290, PIN_OUTPUT, 0) /* (U6) USB0_DRVVBUS */
 			J721E_IOPAD(0x210, PIN_INPUT, 7) /* (W3) MCAN1_RX.GPIO1_3 */
 		>;
+		bootph-all;
 	};
 
 	main_usbss1_pins_default: main-usbss1-default-pins {
@@ -342,6 +345,7 @@ wkup_uart0_pins_default: wkup-uart0-default-pins {
 			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */
 			J721E_WKUP_IOPAD(0xa4, PIN_OUTPUT, 0) /* (J28) WKUP_UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	mcu_uart0_pins_default: mcu-uart0-default-pins {
@@ -351,6 +355,7 @@ J721E_WKUP_IOPAD(0xec, PIN_OUTPUT, 0) /* (J27) WKUP_GPIO0_15.MCU_UART0_RTSn */
 			J721E_WKUP_IOPAD(0xe4, PIN_INPUT, 0) /* (H28) WKUP_GPIO0_13.MCU_UART0_RXD */
 			J721E_WKUP_IOPAD(0xe0, PIN_OUTPUT, 0) /* (G29) WKUP_GPIO0_12.MCU_UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	sw11_button_pins_default: sw11-button-default-pins {
@@ -370,6 +375,7 @@ J721E_WKUP_IOPAD(0x4c, PIN_INPUT, 0) /* (C23) MCU_OSPI1_D3 */
 			J721E_WKUP_IOPAD(0x3c, PIN_INPUT, 0) /* (B23) MCU_OSPI1_DQS */
 			J721E_WKUP_IOPAD(0x38, PIN_INPUT, 0) /* (A23) MCU_OSPI1_LBCLKO */
 		>;
+		bootph-all;
 	};
 
 	mcu_cpsw_pins_default: mcu-cpsw-default-pins {
@@ -435,12 +441,14 @@ &wkup_uart0 {
 	status = "reserved";
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	bootph-all;
 };
 
 &mcu_uart0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_uart0_pins_default>;
+	bootph-all;
 };
 
 &main_uart0 {
@@ -449,6 +457,7 @@ &main_uart0 {
 	pinctrl-0 = <&main_uart0_pins_default>;
 	/* Shared with ATF on this platform */
 	power-domains = <&k3_pds 146 TI_SCI_PD_SHARED>;
+	bootph-all;
 };
 
 &main_uart1 {
@@ -487,6 +496,7 @@ &main_sdhci0 {
 	/* eMMC */
 	status = "okay";
 	non-removable;
+	bootph-all;
 	ti,driver-strength-ohm = <50>;
 	disable-wp;
 };
@@ -498,12 +508,14 @@ &main_sdhci1 {
 	vqmmc-supply = <&vdd_sd_dv_alt>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc1_pins_default>;
+	bootph-all;
 	ti,driver-strength-ohm = <50>;
 	disable-wp;
 };
 
 &usb_serdes_mux {
 	idle-states = <1>, <0>; /* USB0 to SERDES3, USB1 to SERDES1 */
+	bootph-all;
 };
 
 &serdes_ln_ctrl {
@@ -513,6 +525,7 @@ &serdes_ln_ctrl {
 		      <J721E_SERDES3_LANE0_USB3_0_SWAP>, <J721E_SERDES3_LANE1_USB3_0>,
 		      <J721E_SERDES4_LANE0_EDP_LANE0>, <J721E_SERDES4_LANE1_EDP_LANE1>,
 		      <J721E_SERDES4_LANE2_EDP_LANE2>, <J721E_SERDES4_LANE3_EDP_LANE3>;
+	bootph-all;
 };
 
 &serdes_wiz3 {
@@ -533,6 +546,7 @@ serdes3_usb_link: phy@0 {
 &usbss0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_usbss0_pins_default>;
+	bootph-all;
 	ti,vbus-divider;
 };
 
@@ -541,6 +555,7 @@ &usb0 {
 	maximum-speed = "super-speed";
 	phys = <&serdes3_usb_link>;
 	phy-names = "cdns3,usb3-phy";
+	bootph-all;
 };
 
 &usbss1 {
@@ -613,6 +628,7 @@ partition@800000 {
 			partition@3fe0000 {
 				label = "qspi.phypattern";
 				reg = <0x3fe0000 0x20000>;
+				bootph-all;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index cef47c67493fcc24f56f3cbd409a0268aaa5176f..0722f6361cc8b0bfd2c666cc5a9f1b70e3070859 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -151,6 +151,7 @@ wkup_i2c0_pins_default: wkup-i2c0-default-pins {
 			J721E_WKUP_IOPAD(0xf8, PIN_INPUT_PULLUP, 0) /* (J25) WKUP_I2C0_SCL */
 			J721E_WKUP_IOPAD(0xfc, PIN_INPUT_PULLUP, 0) /* (H24) WKUP_I2C0_SDA */
 		>;
+		bootph-all;
 	};
 
 	pmic_irq_pins_default: pmic-irq-default-pins {
@@ -173,6 +174,7 @@ J721E_WKUP_IOPAD(0x0024, PIN_INPUT, 0)  /* MCU_OSPI0_D6 */
 			J721E_WKUP_IOPAD(0x0028, PIN_INPUT, 0)  /* MCU_OSPI0_D7 */
 			J721E_WKUP_IOPAD(0x002c, PIN_OUTPUT, 0) /* MCU_OSPI0_CSn0 */
 		>;
+		bootph-all;
 	};
 
 	mcu_fss0_hpb0_pins_default: mcu-fss0-hpb0-default-pins {
@@ -192,6 +194,7 @@ J721E_WKUP_IOPAD(0x20, PIN_INPUT, 1)  /* MCU_HYPERBUS0_DQ5 */
 			J721E_WKUP_IOPAD(0x24, PIN_INPUT, 1)  /* MCU_HYPERBUS0_DQ6 */
 			J721E_WKUP_IOPAD(0x28, PIN_INPUT, 1)  /* MCU_HYPERBUS0_DQ7 */
 		>;
+		bootph-all;
 	};
 };
 
@@ -422,6 +425,7 @@ partition@800000 {
 			partition@3fe0000 {
 				label = "ospi.phypattern";
 				reg = <0x3fe0000 0x20000>;
+				bootph-all;
 			};
 		};
 	};
@@ -440,6 +444,7 @@ &hbmc {
 	flash@0,0 {
 		compatible = "cypress,hyperflash", "cfi-flash";
 		reg = <0x00 0x00 0x4000000>;
+		bootph-all;
 
 		partitions {
 			compatible = "fixed-partitions";

-- 
2.46.0


