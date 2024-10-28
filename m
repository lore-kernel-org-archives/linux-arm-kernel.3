Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8974DD13597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ixb85Zg1wi33Ybq/Oj9u83ymgLGI30K4HkUvDy4gHrc=; b=DJNGwzc4FI1qKjzuMd/T/F/bnA
	FNmvWKgEL7F54gtZdinty99gAfmeQOG+yKXOcQvqIf9eZYXJ7TMYHy1HEKj88HETDrlmtEr9JvSRT
	3/+YpgZhVgruYQuO905rkF232/UI9O1jQADGt/j9GNWJj3RkJdreQaql37xoN3N6MJ/4cWF09GKBc
	mlfVAXzL39KoGRLADPKOaBMa8JkNt2p4MA5sUA36DOmpO1bwL0t43rC4raWkfVgyzedtFLiihKO6l
	l8jYjaCh2MMEEa64MA/sw6oGbVqdg5gXDf94xJLg74WEfOZ8feo8ylPFv54g7S04vtCPYMGE7jQ1z
	lMuQKwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7F-0000000A5e4-2gz8;
	Mon, 28 Oct 2024 08:28:45 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L3I-0000000A4tT-1yic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 08:24:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49S8OSaE039569;
	Mon, 28 Oct 2024 03:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730103868;
	bh=Ixb85Zg1wi33Ybq/Oj9u83ymgLGI30K4HkUvDy4gHrc=;
	h=From:To:CC:Subject:Date;
	b=hHa1cZzdwrdWrevZCDnMaqsVv9WP/0Pus+/mOBLji3MK2jfO1FYTaomlXJLDY39lo
	 AiLDIaJ++dXRQjih8DSY2n9dc/aQEc4BdJ3ebuTYvOyjrQYp3Kqw0r7QhfQ75j05wl
	 YvJ8ACn2r3Yxlye+8VOZItQt7gPt6d9p5Mz4WRQE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49S8OSAa030888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 03:24:28 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 03:24:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 03:24:28 -0500
Received: from localhost (a0498981-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.216])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49S8ORXL038840;
	Mon, 28 Oct 2024 03:24:27 -0500
From: Bhavya Kapoor <b-kapoor@ti.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <s-sinha@ti.com>, <ankurbaranwal@ti.com>, <b-kapoor@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Add pinmux for RPi Header
Date: Mon, 28 Oct 2024 13:54:26 +0530
Message-ID: <20241028082426.1551816-1-b-kapoor@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012440_742281_C3E559E9 
X-CRM114-Status: UNSURE (   9.08  )
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

Add pinmux required to bring out the i2c and gpios on
40-pin RPi expansion header on the J722S EVM.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---

Rebased To - next-20241025

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index a00f4a7d20d9..7dce021a8a3c 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -359,6 +359,32 @@ audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
 			J722S_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
 		>;
 	};
+
+	rpi_header_gpio0_pins_default: rpi-header-gpio0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x094, PIN_INPUT, 7) /* (P26) GPIO0_36 */
+			J722S_IOPAD(0x088, PIN_INPUT, 7) /* (N22) GPIO0_33 */
+			J722S_IOPAD(0x0ac, PIN_INPUT, 7) /* (P21) GPIO0_42 */
+			J722S_IOPAD(0x0a8, PIN_INPUT, 7) /* (R27) GPIO0_41 */
+		>;
+	};
+
+	rpi_header_gpio1_pins_default: rpi-header-gpio1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1b0, PIN_INPUT, 7) /* (F24) GPIO1_14 */
+			J722S_IOPAD(0x1ac, PIN_INPUT, 7) /* (C27) GPIO1_13 */
+			J722S_IOPAD(0x198, PIN_INPUT, 7) /* (A26) GPIO1_8 */
+			J722S_IOPAD(0x1a4, PIN_INPUT, 7) /* (D25) GPIO1_11 */
+			J722S_IOPAD(0x194, PIN_INPUT, 7) /* (A25) GPIO1_7 */
+			J722S_IOPAD(0x1b8, PIN_INPUT, 7) /* (C20) GPIO1_16 */
+			J722S_IOPAD(0x1a8, PIN_INPUT, 7) /* (C26) GPIO1_12 */
+			J722S_IOPAD(0x1a0, PIN_INPUT, 7) /* (F23) GPIO1_10 */
+			J722S_IOPAD(0x19c, PIN_INPUT, 7) /* (B25) GPIO1_9 */
+			J722S_IOPAD(0x1b4, PIN_INPUT, 7) /* (B20) GPIO1_15 */
+			J722S_IOPAD(0x1bc, PIN_INPUT, 7) /* (D20) GPIO1_17 */
+			J722S_IOPAD(0x1c0, PIN_INPUT, 7) /* (E19) GPIO1_18 */
+		>;
+	};
 };
 
 &cpsw3g {
@@ -387,6 +413,8 @@ &cpsw_port1 {
 };
 
 &main_gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rpi_header_gpio1_pins_default>;
 	status = "okay";
 };
 
@@ -443,6 +471,25 @@ J722S_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0)	/* (C6) WKUP_I2C1_SDA */
 		>;
 		bootph-all;
 	};
+
+	mcu_rpi_header_gpio0_pins_default: mcu-rpi-header-gpio0-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x01c, PIN_INPUT, 7) /* (B5) MCU_GPIO0_7 */
+			J722S_MCU_IOPAD(0x020, PIN_INPUT, 7) /* (C5) MCU_GPIO0_8 */
+			J722S_MCU_IOPAD(0x00c, PIN_INPUT, 7) /* (B12) MCU_GPIO0_3 */
+			J722S_MCU_IOPAD(0x010, PIN_INPUT, 7) /* (C11) MCU_GPIO0_4 */
+			J722S_MCU_IOPAD(0x008, PIN_INPUT, 7) /* (A9) MCU_GPIO0_2 */
+			J722S_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (C12) MCU_GPIO0_0 */
+			J722S_MCU_IOPAD(0x004, PIN_INPUT, 7) /* (A10) MCU_GPIO0_1 */
+		>;
+	};
+
+	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x048, PIN_INPUT, 0) /* (E11) MCU_I2C0_SDA */
+			J722S_MCU_IOPAD(0x044, PIN_INPUT, 0) /* (B13) MCU_I2C0_SCL */
+		>;
+	};
 };
 
 &wkup_uart0 {
@@ -810,5 +857,20 @@ &main_mcan0 {
 };
 
 &mcu_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_rpi_header_gpio0_pins_default>;
+	status = "okay";
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rpi_header_gpio0_pins_default>;
+	status = "okay";
+};
+
+&mcu_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcu_i2c0_pins_default>;
+	clock-frequency = <400000>;
 	status = "okay";
 };
-- 
2.34.1


