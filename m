Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72423C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 02:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oH1RvRMjxEH6ZqlTsao5HpMzwPE+IlOegNHjbSOc0c=; b=lilxi1C7feL35NDS4wv8ebooWl
	P/tMps4MP7n5MBHofm4abvK2sUPPRm06J+yil+1f4Iq4/b33IIg03pw8eOtQe2Q4ooBn1YbU9arPC
	ZA0ReG+7LpVV44w/klZFYQCtuZETR0KMl3jdXDBs8gfcE/p11Uu7GZoQHM9jjK1K0GfsFVCGAQ8Mq
	E0iOQ4zSYu90CWPM2+OizZh0DIiBepxFjCe3388xiOOkCnPRh+0nxPnVkbHzDVggKEQEN6FeNsMt6
	SWR8QAkokCMgmvbXV3dMKlPy7aFGkY1aJl5gN4ZyQCgpzfFxwhqrfG8BKodx4Ez2DQ1bifao+pv4E
	s+gNa8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xIv-0000000GDno-2kbV;
	Thu, 03 Sep 2026 02:35:53 +0000
Received: from mail-japanwestazon11022102.outbound.protection.outlook.com ([40.107.75.102] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xIp-0000000GDeU-0yr3;
	Thu, 03 Sep 2026 02:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUQgcjZMuYP3cuvoK968P6Mo1mBlq2928sBnMLY99o/KpbuyvvJO+8IGlORpKaLrzmaUWMlJYdnfhfNWWPRYlziDkopej07FjAd2yGa9XZFGNIMrm0eLeHiQ4WTGVX+xqny3DkUPsDH1t1fX7Nepez+YRqIo/PjmdhhV1dCMHB6cwgtphtGdl83jneqXyylGDaS/6kLScRzV9roXhvEsZFkt+IN7So365HsbWFRJy/al0sAsrSi/LQvmADh68uuJEiVzO9GTWe28t6stFFfqLzgSKwE3JrH19QAgeYo6bSCmYwccJal6g4uYDYWr2Rje0w5KIiDka6llBASz3kzWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oH1RvRMjxEH6ZqlTsao5HpMzwPE+IlOegNHjbSOc0c=;
 b=Km0sx7TzNy2c2mQRsaN0dqnlmAJXOiSavI5G1LBOQ+LElSW6COi4yHhrVTZtQLQJGXEPx3XHdLy3Rn7hqvoXy8uiO3CislpuN3WvOGPkEiC7EfaaIE6sxHC/2vXylje6pqrehpV5LNf36uNkEYpzBELJGyHBU0dz08rPBMxMfiOx3bnEuLqa+WSk8K/yGUkPfbm857E039VtD6J3LkzZlheMSDPR6nYy8aaucvr6AOdXEpwKBMRp5T/dKAmFmsW/eVR/WfCd7sxqskrizND+mqqEViUTnMkoKwhjTy7mJfl/PblYDGN8RetMMC78sxKmmxPsAtewF/t9UBvJxmjyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0021.apcprd02.prod.outlook.com (2603:1096:4:195::10)
 by TY8PR06MB9295.apcprd06.prod.outlook.com (2603:1096:405:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 02:35:26 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::29) by SI2PR02CA0021.outlook.office365.com
 (2603:1096:4:195::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 02:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 02:35:25 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2C9E94092108;
	Thu,  3 Sep 2026 10:35:24 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fugang.duan@cixtech.com,
	gregkh@linuxfoundation.org,
	hongliang.yang@cixtech.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	pawell@cadence.com,
	peter.chen@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v3 5/5] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Date: Thu,  3 Sep 2026 10:35:21 +0800
Message-ID: <20260903023521.2064986-6-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903023521.2064986-1-hongliang.yang@cixtech.com>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
 <20260903023521.2064986-1-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TY8PR06MB9295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e945f27-47a6-4fa0-8437-08df096402cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|23010399003|36860700016|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: ew2vEtyNM7zwHKPSxFsxMB5KZfrU47lgXGnL57hBBdEzkHTUgbXnncjlBkxEM2TVrxOzQEhOrUidQZHxSBDpP1xosEBwOdbV5TYtLxpLNddJs8UWcG6XSWvjqtF71maQ7fVYaY8MaMQ6vJNxUxjuW4g0v2NgoQAz00ej4qVYtKgJIjqFZDMYNjXQ/8AI1Ap4uKu5ohkjrZxHXNNuyvtwsqMmNU2KBMyg74SuXZHaV6fjgyh9s7eeczEwZlOe6Ak2/KiNNrfY2IdpvY0AwStikaVtwyjpq7l+VtXoTqyJL8V7jfkm2rS87nREhdoH6cSo7fQuu7DYiog1UJd8k6EUwQRluh9SitIonC67GXtYlunmV3QYG1UfzDuCEHEYmK/Ae5ZIFEtZa7R6tPLEdZc8bG70ReehbI5ekOlsekZEJYdpEUJRO1tVPbG3gz4Ms4RpZ982R8U66KBbyAcz/1aCunmRHHJILHGlvL/7P+HZan78NcDIUPELXwykwhmKGfvtmybFj1i6j1dCcKUND3Eo99gg0VUhogtLiFGR8AUp5a+SkFRADnNOLUWR48LxiTVbVutgBM9xErg+HqChtLapUPHBF5Cm+qGUw/5JFh6xpkfO+XharVKSKduQGNkcz7Gqhddvn7b0k0u3WN24SnDzjakHx+hyanmIdygtHAoEc/7ICHT9sruYkvlv4P6cpstOaWQz9e5oIuC74X7v+yNJsQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Oa+HZPGhBsR/iqOjGQUJCHODQIpYPka5BQcJjSQZc2k20j5w7SnaEko+ocxxxaL3G+++uMQaW2vWfqzwrReZFbBOyVRInWYo91YneWG4eQZtHbFx6n8IBKAkD7zEbFLL+2YhYSFqZCGt1c+6bpT1B0X/b6NAZRFGNQ4zxwD9dF3j+NYiUytPQWZbjCt79QiVvd8AJwcBUczErbAsruAqmYgihEnpRwdmxK28iZBkA4k+CwHajCC+NCe/7n57YbS5myc3sennHJzj81+o1X/8heT0/PogQiFIW/sIbkBs2CQPNPcQlbzaUQ0KhcJgxH3invBOk2lq5kbfucydKmCijfFfiKLolB/Ud7DOvJHwP8CK1fqQbiJ8hTOsgu4IAN1ADvqv9oCHbINIU4pD+Xs8T/Wk3mP6KT2f0acU1sxHuSiYgYcuKsVCzk2YkYqIEmY6
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 02:35:25.4783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e945f27-47a6-4fa0-8437-08df096402cf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_193547_308433_E36A42B3 
X-CRM114-Status: UNSURE (   9.76  )
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

Add USB4 and USB5 controller nodes and their associated USB3 PHY nodes
for the CIX Sky1 SoC. Enable USB4 and USB5 in host mode on the Radxa
Orion O6 board.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  54 ++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 118 ++++++++++++++++++++++
 2 files changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..4f47e8cd70fc 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -80,6 +80,22 @@ pins {
 
 		};
 	};
+
+	pinctrl_usb4: usb4-power-on-cfg {
+		pins {
+			bias-pull-down;
+			drive-strength = <8>;
+			pinmux = <CIX_PAD_GPIO041_FUNC_USB_DRIVE_VBUS4>;
+		};
+	};
+
+	pinctrl_usb5: usb5-power-on-cfg {
+		pins {
+			bias-pull-down;
+			drive-strength = <8>;
+			pinmux = <CIX_PAD_GPIO042_FUNC_USB_DRIVE_VBUS5>;
+		};
+	};
 };
 
 &pcie_x8_rc {
@@ -117,3 +133,41 @@ &s5_gpio2 {
 &uart2 {
 	status = "okay";
 };
+
+&usb4 {
+	pinctrl-0 = <&pinctrl_usb4>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usbss_4 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb5 {
+	pinctrl-0 = <&pinctrl_usb5>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usbss_5 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb3_phy4 {
+	status = "okay";
+
+	usb-port@0 {
+		status = "okay";
+	};
+
+	usb-port@1 {
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index a77c52296ebd..e8febb9c558b 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -13,6 +15,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		usb4 = &usb4;
+		usb5 = &usb5;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -574,6 +581,117 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usb4: usb@91c0314 {
+			compatible = "cix,sky1-usbssp";
+			reg = <0x00 0x091c0314 0x00 0x4>,
+			      <0x00 0x091c0400 0x00 0x4>;
+			reg-names = "axi", "controller";
+			ranges;
+			#address-cells = <2>;
+			clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+			         <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+			         <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+			         <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+			clock-names = "sof", "axi", "lpm", "apb";
+			resets = <&s5_syscon SKY1_USBC_SS2_PRST_N>,
+			         <&s5_syscon SKY1_USBC_SS2_RST_N>;
+			reset-names = "apb", "core";
+			#size-cells = <2>;
+			cix,usb-syscon = <&s5_syscon>;
+
+			status = "disabled";
+
+			usbss_4: usb@91d0000 {
+				compatible = "cdns,usb3";
+				reg = <0x00 0x91d0000 0x00 0x4000>,
+				      <0x00 0x91d8000 0x00 0x8000>,
+				      <0x00 0x91d4000 0x00 0x4000>;
+				reg-names = "otg", "xhci", "dev";
+				dr_mode = "otg";
+				interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
+				interrupt-names = "host", "peripheral",
+				                  "otg", "wakeup";
+				maximum-speed = "super-speed-plus";
+				phys = <&usb3_phy4_0>;
+				phy-names = "cdns3,usb3-phy";
+
+				status = "disabled";
+			};
+		};
+
+		usb5: usb@91c0324 {
+			compatible = "cix,sky1-usbssp";
+			reg = <0x00 0x091c0324 0x00 0x4>,
+			      <0x00 0x091c0410 0x00 0x4>;
+			reg-names = "axi", "controller";
+			ranges;
+			#address-cells = <2>;
+			clocks = <&scmi_clk CLK_TREE_USB3A_H1_CLK_SOF>,
+			         <&scmi_clk CLK_TREE_USB3A_1_AXI_GATE>,
+			         <&scmi_clk CLK_TREE_USB3A_H1_CLK_LPM>,
+			         <&scmi_clk CLK_TREE_USB3A_1_APB_GATE>;
+			clock-names = "sof", "axi", "lpm", "apb";
+			resets = <&s5_syscon SKY1_USBC_SS3_PRST_N>,
+			         <&s5_syscon SKY1_USBC_SS3_RST_N>;
+			reset-names = "apb", "core";
+			#size-cells = <2>;
+			cix,usb-syscon = <&s5_syscon>;
+
+			status = "disabled";
+
+			usbss_5: usb@91e0000 {
+				compatible = "cdns,usb3";
+				reg = <0x00 0x91e0000 0x00 0x4000>,
+				      <0x00 0x91e8000 0x00 0x8000>,
+				      <0x00 0x91e4000 0x00 0x4000>;
+				reg-names = "otg", "xhci", "dev";
+				dr_mode = "otg";
+				interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
+				interrupt-names = "host", "peripheral",
+				                  "otg", "wakeup";
+				maximum-speed = "super-speed-plus";
+				phys = <&usb3_phy4_1>;
+				phy-names = "cdns3,usb3-phy";
+
+				status = "disabled";
+			};
+		};
+
+		usb3_phy4: usb-phy@9210000 {
+			compatible = "cix,sky1-usb3-phy";
+			reg = <0x00 0x09210000 0x00 0x40000>;
+			#address-cells = <1>;
+			clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+			         <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+			clock-names = "apb", "ref";
+			resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+			         <&s5_syscon SKY1_USBPHY_SS_PST_N>;
+			reset-names = "core", "apb";
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			usb3_phy4_0: usb-port@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			usb3_phy4_1: usb-port@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		pcie_x8_rc: pcie@a010000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a010000 0x00 0x10000>,
-- 
2.54.0


