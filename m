Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5B5CA1011
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7FTaJZhLDxhmhQlwyhjmZLfj5m8XNLE0YLt4iyXpTw=; b=IEpgNktPVZDmuTDjnpP+tDjw8F
	sQKyH1QNgV+Wj9EzsC4zscsKeQ6EJI81jHiIR1ZLPIq/qX3trTkk963XFRMp4YwsfSnqBwUElxpEb
	lcxBJ6vWe4nNPyq7y421xsdG6EunXIHcv5d8YtmBL9R0NuYXDVpwzi9NFzRH6VyWTCkqT+fmi5YLi
	6kxv7VoQ5awhHyYMU1xRYdpflGKnlBmg0ReH8iRaLaUrGaJ/IV/dNvpJQieFkswnOuP53pcFAXv1A
	SSnm6LBrzUh5WlSb+fPG1p5WahMvq1ZV1w2OV5ZVzSAUC77ODbvx0Rd7oyW8zf+4DWed1xX3ppXyg
	Muw06dJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uth6B-00000004h8S-1rxA;
	Wed, 03 Sep 2025 06:36:03 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utgw1-00000004cdQ-1Kr1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:25:34 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5836PNM12766085;
	Wed, 3 Sep 2025 01:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756880724;
	bh=/7FTaJZhLDxhmhQlwyhjmZLfj5m8XNLE0YLt4iyXpTw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SkrobXqg64dGrGUv6flyM5/mxGBswNLgDfh4/5Aj/0u4At8UH5Q4G6uz24SB+6IfP
	 21MXLLIYBZCNt7ATAbaQPHtc3iXNTuV/DnLY1mZGoTgW9HtZ8eOjrTlNEXOZ7SLuN6
	 qEmuReUwg53CyRIq3O77zoY0QGropMQbWc77mS2Y=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5836PNlW2839192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 01:25:23 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 01:25:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 01:25:23 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5836PMNP829293;
	Wed, 3 Sep 2025 01:25:23 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-am62d2-evm: Enable USB support
Date: Wed, 3 Sep 2025 11:55:13 +0530
Message-ID: <20250903062513.813925-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903062513.813925-1-p-bhagat@ti.com>
References: <20250903062513.813925-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_232533_441009_790D110C 
X-CRM114-Status: GOOD (  11.17  )
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

Add pinmux configuration for USB1 interface and enable the node for
functionality. Also enable data transfer on USB0, on existing power
delivery configuration.

Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Reviewed-by: Hrushikesh Salunke <h-salunke@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index daea18b0bc61..9704c2d97f43 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -367,6 +367,12 @@ usr_led_pins_default: usr-led-default-pins {
 			AM62DX_IOPAD(0x0244, PIN_INPUT, 7) /* (D18) MMC1_SDWP.GPIO1_49 */
 		>;
 	};
+
+	main_usb1_pins_default: main-usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x0258, PIN_OUTPUT, 0) /* (D19) USB1_DRVVBUS */
+		>;
+	};
 };
 
 &mcu_gpio0 {
@@ -499,6 +505,11 @@ &main_uart0 {
 	status = "okay";
 };
 
+&usbss0 {
+	status = "okay";
+	ti,vbus-divider;
+};
+
 &usb0 {
 	usb-role-switch;
 
@@ -509,6 +520,16 @@ usb0_hs_ep: endpoint {
 	};
 };
 
+&usbss1 {
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_usb1_pins_default>;
+};
+
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>,
-- 
2.34.1


