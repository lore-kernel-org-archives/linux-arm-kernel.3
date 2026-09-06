Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AABC79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAZ2/zNsNc+Vxiz06Ze1k2i8mY2D1Ji01KhcawZaPLc=; b=m5wlaJdPM7xkKHYX9vj8KMhRXe
	ai3OB+cCSegnV9++ey5r2rkpF67Yk9gvqhAfOkmd17ZBCobW4C++roLk7CKuXYQEg88rHLGRp3OI7
	wus124w6ww3tIw685Lu9zA0TUgYqA8DjVlsk7s76oQOihFBl7CKeJ/o5nNLT7JF+7eHjqsCRdOGZl
	lzrxWTzWCWrxKtm0jn6CK4R1HBc2LbqwsUlvSrSnwEaMuECAmzDH5iyOAhaS9KjBducuZjrnLNhRf
	wkDofu3GUBWsWPGyqw+7bBQLMaIy5+Jq1r1Zz0uq0akOaAhe2C/iSG3kcwEVxpAGYEP66vLWHEZfw
	F4jFP73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33VA-00000004cOp-1hM5;
	Sun, 06 Sep 2026 03:25:04 +0000
Received: from mail-japaneastazon11023137.outbound.protection.outlook.com ([52.101.127.137] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33V5-00000004cJp-1aO9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 03:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5xS6hS0yqIU8sdNcFsBhKWGllzimWHQv0L+PY13RZbyho/VY8D+3uEEYVXSoKb7XFiB/XEFkQaVgrgSHTB1Oy+ePfmNyj2FxoiO55d0Bg9Z0p7ycS+dLWb+bZbP+Q0vCryWxTQsEQVO8hmO9TWKQMpfFonbxMDqesbcsRGoJEuK4GtrDhkNL2xbnMKsWQ0dMGlLsKfhpNYO67LbxhqPLhWKCmL1YNjy2FAMG42dsh/5lZ7XjGFohGicKKwhSB/lmCjHK4lhL84g1F0PGAmoroyX3uxgGO300A6bRmrclDn/ZIZZ0FuKpzV+qMvN08PatGV7tq7cT/KY9XfwGzMgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAZ2/zNsNc+Vxiz06Ze1k2i8mY2D1Ji01KhcawZaPLc=;
 b=yE9I7sm+vkLv97bJVgxJs2hbpIwc61S82OGdkU+rvRHgQoMEG1/RngBTW0ZFnZQRyPANWvwytL403jkoYLiAxZvJuDcSxQs79qSZiHw7zJzmxQthxOcOEAo2GgMDnh3j22fCJFfV4K2flSWgOgbeCKenVbqGeMj0Qe+Yy++4BbGl/d/t+1jGeeHOrVWeIVisktKV4cDZ7Fk/x3Gzcz4g2FMAsYbcMKablf0U5/B5ISLlbIQfaIRD+M2kyNT4N2dE46KpHSkbTC8uphktpID3fwBfKjne8EeZHhQqGyJXeszVIVLHHSXrxYDmM20QPtY2TO2aIqpyr2l5FKNYMv7aIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:381::18)
 by SG2PR06MB5083.apcprd06.prod.outlook.com (2603:1096:4:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 03:24:46 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:381:cafe::65) by TYCP301CA0021.outlook.office365.com
 (2603:1096:400:381::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 03:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 03:24:44 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4CBC24092118;
	Sun,  6 Sep 2026 11:24:43 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	pawell@cadence.com,
	rogerq@kernel.org
Subject: [PATCH v4 4/4] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Date: Sun,  6 Sep 2026 11:24:40 +0800
Message-ID: <20260906032440.470788-5-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906032440.470788-1-hongliang.yang@cixtech.com>
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SG2PR06MB5083:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 896c9bad-0d90-4b46-822e-08df0bc6660d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hh2lTMz9afGBgANYZSVwoDjC9396CaQ1dtbXue07Mjsgy6X13LHI6AtI4KDdCiujbHp8D1mK2o6mRTYSOXj5BNMeXr0ATUatIMkDmS7p9iV9pPwc7IrihGdmzrgU6TaAT3Q182kMZpMypbH9FxCrbTleVSSTSFCiwn3BUCuyQr8z6yl7qp1NvWPHA2J/X8/goCZWYUF6lBNumKfv/ubZFhxg/EeXLZMt2yLa5X3I4XMBs6SkF8Adp6ymVEayw47rpUR3UvAnCgvFU+0AGs6wPqOURlFTgLAQj1W8vTb4BHdHahNwX0h4yNaOQSRgC7mI/72v+46qx1UbQjWvtYn3hZW8Bh2Kva8WbGyuf7xAoEfBphi/pmtqWJc4kkOiE2f3wvxKHHe7zkCyL/nXGEu2m9hgL+DhNwHpuGeZ4PYlcOvSNUpvroW9o3DJ6+bNih1PUxdQhULVnPIiwgQJPIsUHP7iD6ON1y/dU07AA5m2uXf6QHE5srYt9OBbcmeVyW6HxmTtsHBh24IiiO5o3iyYgJTjahh7w5R1CUu676QfERsYgMwK6fQyXzP5PslptiZrUmOScUCgtWUWJYM/uEdg15FwMQbRKjwFrcP6XqPyag4qDK8neZ8dpB7wcWloN47mUBJLgRbbtgURZP3KXNSQmSJBkuVq6M48hO7uLyXiKvc5Vk4dtG05SnyEEqTgZXGGpB/FmJKn19WrhM4f6j5dnJfHh0U5J6c6ugW46F+qCP+85jI8xs3lVCheaAUtARFf
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RI3DdVRvxwou2u1aPpXLwFGmc7hXXfmK6e+ISbg+Zcl8UqsfI+fVK8dGizzI6HeyoU6srfJENTwjXmwFy2BmqUiJX+6MF988N5ZYbX2CiE+jk/QGVfBN+zKTqZsI3WOUwOzaFA2oig00wetpdDIHIBYpFmbMijXcx9ScYcifPaN9eKKiv25kSVOLt3cQqV8sJEMysI+GCjjSoRlGPOHmziS9ptl5ollQUN44mnBYdWbJRxZ3ersxFJ+fU3SFNpVUn1+KFxmWrRxiqsJ9nPDdh7zw0bjEYrktWbMycecqaKhKlW4HCU19KduDrTlWK6vZs2+HLvNCIUczC4xlcyGdjBdT7Qh7/wslizH0aYdqZ1nJ5ada8RQqmTIXXlDGUv8wZz1KHbJ1ktrQ94YTZccDTCtAFgikDeiE2DxLsk+onGu23mHTVFw8QwvH3VlS2vEy
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 03:24:44.7993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 896c9bad-0d90-4b46-822e-08df0bc6660d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_202459_432412_0CF11A36 
X-CRM114-Status: UNSURE (   8.78  )
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

Add USB4 and USB5 controller nodes for the CIX Sky1 SoC. Enable USB4
and USB5 in host mode on the Radxa Orion O6 board.

The per-controller RCSU registers are accessed through a syscon regmap
referenced by the cix,usb-rcsu phandle.

The shared RCSU slice of the two controllers is described by a syscon
node; each controller references its registers through the cix,usb-rcsu
phandle with offsets.
Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 42 +++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 88 +++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index b152942aaa60..4f47e8cd70fc 100644
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
@@ -118,6 +134,32 @@ &uart2 {
 	status = "okay";
 };
 
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
 &usb3_phy4 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 478c726fae96..2fe9e8244447 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -15,6 +15,11 @@ / {
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
@@ -576,6 +581,89 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usbss_rcsu45: syscon@91c0300 {
+			compatible = "cix,sky1-usbss-rcsu", "syscon";
+			reg = <0x00 0x091c0300 0x00 0x200>;
+		};
+
+		usb4: usb-4 {
+			compatible = "cix,sky1-usbssp";
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
+			cix,usb-rcsu = <&usbss_rcsu45 0x14 0x100>;
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
+		usb5: usb-5 {
+			compatible = "cix,sky1-usbssp";
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
+			cix,usb-rcsu = <&usbss_rcsu45 0x24 0x110>;
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
 		usb3_phy4: usb-phy@9210000 {
 			compatible = "cix,sky1-usb3-phy";
 			reg = <0x00 0x09210000 0x00 0x40000>;
-- 
2.54.0


