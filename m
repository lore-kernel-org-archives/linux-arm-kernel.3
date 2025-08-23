Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED04CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+MLiM7EUbI3t1OpzggJOR4OBB9Y1zswUtgZzzSde6c=; b=IfFP7M9D1PAMdEksyDcf+h4IdQ
	BYMLUTl518CBVHV7pwIHE/xhdiH0eS5FSSvQFuKeasgoVXsEgSGIp9Y3B2/ajAtAu+5lVjpbCpsq5
	ItsosZsbMtOcHrMGj1rfHN0JtlbEERi9sJjfslzqrkFtJ/5Crs0vf3GXQcsL5mUmgF2WlCqIaupiK
	k+kDLfLXGxCLkg2GmiEB6L8kfnn5zth36VclKBBKk0HPVXv3jb1UYZB5Pj15FGPlsu65fUzqQBNAl
	6p6qB7BPYKTdl2u0OzdE59A5DEXDPaRCBSi3edZssVK5DxhmeuxNS1Nxv7DyEWG86w/53c/tn23bl
	6blvsTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgs-00000004XLZ-3i34;
	Sat, 23 Aug 2025 09:37:38 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upeqm-00000003q6A-0ozc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 03:23:29 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57N3NPuG848517;
	Fri, 22 Aug 2025 22:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755919405;
	bh=w+MLiM7EUbI3t1OpzggJOR4OBB9Y1zswUtgZzzSde6c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xT1HTvgmryKpZp2SfvfspbTM1qf14V+ebRa/z11qjn5L1XO7V1OfhnScOvAEbChvx
	 igPR8Pnj360KqppOf7VJ8wJvU8ajsNZHcWIw4gsEk9Vm9a6cuT6Ipab1D5ei00EpqQ
	 Q3GqXgNlGnih99IhQ8NC6QczNY46G8M91u8rHOmU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57N3NPFl3726678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 22:23:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 22:23:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 22:23:24 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57N3NNjF288146;
	Fri, 22 Aug 2025 22:23:24 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am62d2-evm: Enable USB support
Date: Sat, 23 Aug 2025 08:53:04 +0530
Message-ID: <20250823032304.1085775-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823032304.1085775-1-p-bhagat@ti.com>
References: <20250823032304.1085775-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_202328_326329_1E2FCDED 
X-CRM114-Status: UNSURE (   9.97  )
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

Add pinmux configuration for USB1 interface and enable the node for
functionality. Also enable data transfer on USB0, on existing power
delivery configuration.

Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
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


