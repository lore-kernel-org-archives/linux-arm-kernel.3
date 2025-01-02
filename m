Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7CFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0iSidzEjR686c/vyQi1Lc8/oYdHsXDCCjNpZCNq3ASM=; b=XyLq758Id+4Icb82xa7LsCnaoe
	yNNPgDb+b+ghp6vwbhBikfeefOPvrRDPQTajcAdHKIsKdL/rm4Gl1j79IS/K6Bc2JR7Ep69aO6xxz
	ecexQyYWArne9erpO2x/vceQhCRRMfDbU5YfAPrBo2+TBAqEwMafQESaBH5GgR0bJuAoWKGZ+lQ7b
	MZcTCXJB5+5m8hWigr67Pq2KbwZAjjOzX6S6SujRIVBe5X21ZJ1kJZ6DzUsZGwLGg7/nTYgFQp7tN
	/8m5nWO/eZOq2jOqCNVTUq4InlcTsTHCKCscjwd0sxHxV8JR/8Ob3A6O+4QuIK6/X8/FQuWe3qLHi
	UqmVT+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIcX-0000000AB0Y-1vY0;
	Thu, 02 Jan 2025 10:40:05 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIbI-0000000AAox-0Nra
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 10:38:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502AcSiH1876284
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 04:38:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735814309;
	bh=0iSidzEjR686c/vyQi1Lc8/oYdHsXDCCjNpZCNq3ASM=;
	h=From:To:CC:Subject:Date;
	b=w+/f+EQTua8qiy1Z/gqMF8wqQgCIURitqPmQG14j3KHOkkIHz3gSIscIMRHUaY6S9
	 h9zMsFuWKtVKzvUxk9xjYuctPmjZBNKKtgubBXdqcv3OXvi5UkwImUPMv1VScijcuA
	 XUmpcyxhFlMuTa8hc6gdMrTct8lsqggRn4Uvzwbs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502AcSUQ089480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 04:38:28 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 04:38:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 04:38:28 -0600
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (udit-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.6])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502AcPZK093067;
	Thu, 2 Jan 2025 04:38:25 -0600
From: Udit Kumar <u-kumar1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Udit Kumar
	<u-kumar1@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable PMIC
Date: Thu, 2 Jan 2025 16:08:14 +0530
Message-ID: <20250102103814.102499-1-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_023848_395602_CCE8DDF6 
X-CRM114-Status: GOOD (  10.22  )
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

Add support for TPS6522x PMIC family on wakeup I2C0 bus.
This device provides regulators (bucks and LDOs), along with
GPIOs, and monitors SOC's MCU error signal.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
Bootlogs
https://gist.github.com/uditkumarti/961cdece09f176e1e1806efef7799cf2

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 88 +++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index a00f4a7d20d9..691c6560ec04 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -359,6 +359,13 @@ audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
 			J722S_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
 		>;
 	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x030, PIN_INPUT, 7) /* (K23) GPIO0_12 */
+		>;
+	};
+
 };
 
 &cpsw3g {
@@ -459,6 +466,87 @@ &wkup_i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";
 	bootph-all;
+
+	tps65224: pmic@48 {
+		compatible = "ti,tps65224-q1";
+		reg = <0x48>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		ti,primary-pmic;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		buck12-supply = <&vsys_io_3v3>;
+		buck3-supply = <&vsys_io_3v3>;
+		buck4-supply = <&vsys_io_3v3>;
+
+		ldo1-supply = <&vsys_io_3v3>;
+		ldo2-supply = <&vsys_io_3v3>;
+		ldo3-supply = <&vsys_io_3v3>;
+
+		regulators {
+
+			buck1: buck1 {
+				regulator-name = "vcc1v8_io_buck1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+				bootph-all;
+			};
+
+			buck2: buck2 {
+				regulator-name = "vcc1v1_ddr_buck2";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-name = "vcc0v85_ram_buck3";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-name = "vcc0v75_ioret_buck4";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: ldo1 {
+				regulator-name = "vdda1v8_pll_ldo1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2: ldo2 {
+				regulator-name = "dvdd3v3_ldo2";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3: ldo3 {
+				regulator-name = "vdd1v85_phy_ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+	       };
+	};
 };
 
 &k3_clks {
-- 
2.34.1


