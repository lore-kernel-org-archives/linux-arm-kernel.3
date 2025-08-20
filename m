Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DC4CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weQAueA4hmHDZvKZ3RiNTiHK/0dkmQeiIX+hZC1f8hY=; b=y4flVR8o0rlQFrpLzjNbeSBbp1
	rSY0JHNH5TLbCfZTQ43xYZ1xzfZt8YPSUBvXJktljIDgqu0DBINRLdkMKeJ633uS5EeYpKWYYr0Gs
	jU8V3rimSgXpzp0yAcwvStWuvLDi+mvqQH18MbRBPG0DxxJj6jtt301jwpZBk3/IiWJ0MWr9+0k3p
	+B6ApZLZP+VrMLeBBRLF/7EFV2JPfYjjaF52ulgV8+659Ldr0ZJhECaARVoxMRkeSlHKud6Dx3i4k
	lHlcbznrpComCUio3rmUmzAluLBIRSzAuaqTM60GN+juVQthxe0Ib8aZ2kCtEmf7V2Cxs5txvfR1I
	Y7kdMtcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofdy-0000000D4Sr-0nlT;
	Wed, 20 Aug 2025 10:02:10 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeGv-0000000Cl7L-1BNA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:34:18 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57K8YC90210348;
	Wed, 20 Aug 2025 03:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755678852;
	bh=weQAueA4hmHDZvKZ3RiNTiHK/0dkmQeiIX+hZC1f8hY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x8jhm7mDmimU1mlTp2Nk/m8SdzpGf+9VjE6zf+vjM+FSNzTONMA1yIuPchUrcERbo
	 xAruAkqfB5anHtK2512UsZDW1L82XPXxsMV8iRQQjXEwiOwsjhAWEMD7fGJivsyaMx
	 fNcZeIwmEPv7BB3RCrkY8XbB0EJjRSBKJVxbJnHM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57K8YC2P1223587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 03:34:12 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 03:34:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 03:34:11 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57K8YABb228442;
	Wed, 20 Aug 2025 03:34:11 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-am62d2-evm: Enable USB support
Date: Wed, 20 Aug 2025 14:03:29 +0530
Message-ID: <20250820083331.3412378-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820083331.3412378-1-p-bhagat@ti.com>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_013417_414897_C0C46D1C 
X-CRM114-Status: GOOD (  11.27  )
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

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
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


