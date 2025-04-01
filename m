Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BB9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xehNX9F75Y+d8q5JxBHR/dVDBM27asphoKI6TKD5Qwo=; b=mQ4F8fdIJt7yVt1v8FACM/Z1WD
	J2+jbdjRogJzJoUMNVn7+sCrqlK9aFjVONuRcJCYtr+/DUvUY9ZKHfC5T0P1Nn9lQGSga4ZZ3daQL
	/sbm72BFF3aieCWpvXF9w3svH6+ges+VEYPc2GQ8KaV0pv41HkwiKFarDmPTkdk+S+7MqkKYuteaT
	DQiWxqyBJ4uxpZZauhoRnIOP+ERm6VRGD5x3z+t8Sos2dzEThMosPIzEM7QN+SKEMxw/G8bLiwDQB
	WjrzdREhUVxg66M2ahj3/TsXlF4qqYx0CNghqg2Tgl44nmgN3EIvpcSuQQrd0M7ayMXPxindTEon2
	+7Zzyjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tza4y-00000002pkG-487N;
	Tue, 01 Apr 2025 11:46:52 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZzo-00000002omb-08oB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:41:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531Bf8We3088794
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 06:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743507668;
	bh=xehNX9F75Y+d8q5JxBHR/dVDBM27asphoKI6TKD5Qwo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DIE/oo+aVZL4R50gKcIR7+bQp0lcPwrYrpjSiXSLy1WF4Adt0P/KUqoGXqlqO7YSb
	 v3TcOw4PpHzdzNSmcYDSPYzziISDIz3KfD9VA5ZyJjEWB41HE7j1hyiip0CNL4ggD5
	 nbtE8BM71GdVxqPoYTSCjIIa+k11KkXPUZvwlMpI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531Bf833065343
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 06:41:08 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 06:41:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 06:41:07 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531Bevm1099961;
	Tue, 1 Apr 2025 06:41:04 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 1/5] arm64: dts: ti: j721e-sk: Add DT nodes for power regulators
Date: Tue, 1 Apr 2025 17:10:49 +0530
Message-ID: <20250401114053.229534-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401114053.229534-1-y-abhilashchandra@ti.com>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_044132_166245_A51B3ACD 
X-CRM114-Status: GOOD (  11.44  )
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

Add device tree nodes for two power regulators on the J721E SK board.
vsys_5v0: A fixed regulator representing the 5V supply output from the
LM61460 and vdd_sd_dv: A GPIO-controlled TLV71033 regulator.

J721E-SK schematics: https://www.ti.com/lit/zip/sprr438
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 440ef57be294..4965957e6545 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -184,6 +184,17 @@ vsys_3v3: fixedregulator-vsys3v3 {
 		regulator-boot-on;
 	};
 
+	vsys_5v0: fixedregulator-vsys5v0 {
+		/* Output of LM61460 */
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vusb_main>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vdd_mmc1: fixedregulator-sd {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -211,6 +222,20 @@ vdd_sd_dv_alt: gpio-regulator-tps659411 {
 			 <3300000 0x1>;
 	};
 
+	vdd_sd_dv: gpio-regulator-TLV71033 {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_sd_dv_pins_default>;
+		regulator-name = "tlv71033";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		vin-supply = <&vsys_5v0>;
+		gpios = <&main_gpio0 118 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x0>,
+			 <3300000 0x1>;
+	};
+
 	transceiver1: can-phy1 {
 		compatible = "ti,tcan1042";
 		#phy-cells = <0>;
@@ -613,6 +638,12 @@ J721E_WKUP_IOPAD(0xd4, PIN_OUTPUT, 7) /* (G26) WKUP_GPIO0_9 */
 		>;
 	};
 
+	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
+		pinctrl-single,pins = <
+			J721E_IOPAD(0x1dc, PIN_INPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
+		>;
+	};
+
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
 			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */
-- 
2.34.1


