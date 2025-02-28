Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B737C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqFKbvFAx+2Z4XSqCDOOTIBXD79DK1oW2Zqw/NuPORs=; b=00WSd0TXBTvtTUkNYSVeqqG2Ct
	FKr9voJ2/OuNz3SLh6hJTYYOHolj+8JuS9K4DNh27wQobJysvM4+vgao6r+rxAk6ajJUt8lFOl6XM
	qtkxTPG5Ko/+8aIIGZKKdbmZXsWosbQM6Czo6zQQ7KOdUej3Oliqn8Z89Ta5MVe9DKZyaMDHGR0Ye
	LKT5hWAXVXD6IifX2P90hTVfkp8n6SqIo1qIoION+bUUvpRqL9CF8vWFB/6WOhFDcoF155wLoaW1R
	WBUcFpc6k9g1qW6vH2zUur4LEXg/a0hiF5Ot7sSGYvEPOxkH55xv/Y6n56g+nkeFmMvs7DNBWmowU
	0eTD8Kfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZY-0000000Aacj-18J9;
	Fri, 28 Feb 2025 10:26:24 +0000
Received: from mail-db5eur02on20713.outbound.protection.outlook.com ([2a01:111:f403:2608::713] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxS5-0000000AZ2g-1SUL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:18:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWIsHdHm6xZebatCMHPJ6Ke59/kZSXy/vBNuyh19Er3zkJRXG2nt2LoSPyc0vNteKgjzEI+JSgtu3eWy9RGQflfunCsWim9Fg0CJEuB3H5mg02YBSW86V6HciKYLMQE6fZnle+L5OfKrevWNWsC9Yz5Ne2vG0cYGM+o21s2GlVrYnM/DmGyG58ECEHOgZGGglLaytevoZ+xfnE6ukDqIwzfnGomcEIUt7DVoGsY59g6NQBFAfNCoWlgL1EGoEhqdT1O7BueL5G4WVXiSjrTyKdFcRwls4Hrj/UvBlQsCY2kUQYMJ5ctcERageDVgxoF2xNkamT9nYynZR1f72Q6o/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqFKbvFAx+2Z4XSqCDOOTIBXD79DK1oW2Zqw/NuPORs=;
 b=DTAyNa7kfX1uWLVzGdT/vzafx5ATpCZGDTz4xVf2WtDfat6h7hM3zBOB8QivaTrpaCrBRADcxBctxMSOgWRCJyBkq3LWc7o9xIQ1t68kV73FTvV0MP8TxHfDKII4wT6QHBrUy0O1b9zQKUrUrxpu+5x1IewFRHt8XUxsySuwcarGsg2ROg9RI1N1X/dY/VEieJVh79tKar/j2Nr6gWFotR5StzoMh2h2qmhBbRlUv/4VCTEXKSzLt8QeHd7KSrBZO+TAhI8mYNO1605HtBCsMcKJSd1gv1hxoPCU1lo/tFYnznBjF1VcvDz6OY6P1A+t9U0iUxvLAzcv7EJjnjRd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqFKbvFAx+2Z4XSqCDOOTIBXD79DK1oW2Zqw/NuPORs=;
 b=Jn1hfQ9qit4BHidfvkAICRsjHqIVIkXsz6fOS6W2A43vIo3UeG561NyzYJ8CyJyHsZ3oZAB6p2AGwtqMa25TXUzPiuI+DOR2A+L4T//wMZDXk4N5IIQn51l6X7O9UaCQFq7kvj9wbwMKNcycf0jeSMXqe0ZVe0WIGflyjdnkefnLQepwje1j2PxkT6XVsnGqbsgeELfE49VXALhEn61ldYPLHsmqx53vHT2nOQ3zbhQX9h8xNJVNlax8HiDI1SmuucK1nWLFm6jn3IhbbA4pQqBEFtn6QQlbGPMNkEKmuMNNQDuR4DJf2zon/lY3awfFrjxnlTPlh31l8ykQ4zMeyg==
Received: from PR3P193CA0007.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::12)
 by DB9P195MB1777.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:399::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 10:18:34 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:102:50:cafe::b0) by PR3P193CA0007.outlook.office365.com
 (2603:10a6:102:50::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.22 via Frontend Transport; Fri,
 28 Feb 2025 10:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 10:18:33 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Feb
 2025 11:18:32 +0100
Received: from phytec.de (172.25.0.51) by Florix.phytec.de (172.25.0.13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Feb
 2025 11:18:32 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 2/5] arm64: dts: ti: k3-am62a-phycore-som: Add boot phase tags
Date: Fri, 28 Feb 2025 11:18:14 +0100
Message-ID: <20250228101817.865811-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250228101817.865811-1-w.egorov@phytec.de>
References: <20250228101817.865811-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|DB9P195MB1777:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd2374a-07b1-463f-6014-08dd57e141bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pxotY0S+Z3cm2DjdVZZcTji+ioPQvIeGIrkxooRkxjsx/UjFfUdO71i9LFfd?=
 =?us-ascii?Q?vajlaBp6bCyJa1AY3My5zjYErVImwliGMLNFkCKBT5UQBjeiq6FS8+1NZUHm?=
 =?us-ascii?Q?3GQCBHhEvwvbbtsjEue15UDqKs37n+NTQ/EkXbJv7JckoJSnB0PLaw/RxpnV?=
 =?us-ascii?Q?CchbmBPyC6t1m3hc3hV4oYJeSdWQdOeCL1LUnMUW8XGWcFdbQYoDkFOMn2ZC?=
 =?us-ascii?Q?bakqiZVEGbSuQBGn3ZwLBJHDUep21BzolllCzDrvpIUysT3IW/5NgOvG6N2d?=
 =?us-ascii?Q?oysVZmDhyDGq0aB0UozAphUE8D8MGIpSqe/ivkDAqQSqsw16GMz7Hi8FZcBG?=
 =?us-ascii?Q?EiSYD9hCajCNYvKkLc8ljwKjaq5VMbIJV5bP/aNuadbJC/OsLEYhY3fkd4cj?=
 =?us-ascii?Q?6acFqV+V0bmzf8ZV4q6NO3M8ufegR/DB2gwfxCzJ+jsLvOJxgbwCvZaYVt09?=
 =?us-ascii?Q?pbFPz8d0J0JJeCtwGD8RoON9Sb/7xZM7Aap4Xo5rXeJZHJWvyWjPBRUB0VHi?=
 =?us-ascii?Q?Z0mQ+8pn1De2dvnTSDST+bv9Ved7t1D2p8jemD7nF3QK+0+M3HQv/zzvipHU?=
 =?us-ascii?Q?2oaujeCK+9Myz1TKzza+pEYNxNTO/4MP8pTlCQ92cfnrKSXaEDBmvvz+5pV+?=
 =?us-ascii?Q?KJvGAX6W8jF3H6AzY4IvMd7h1jSdBPN7o8wab7WHWtt2Db0pzx1lRiT6Zd+B?=
 =?us-ascii?Q?qKTFYuYFbfQ4GQ9pUon453WcRNJuJLBR9seUxVBHU0OFKzT7SyGk+yuzfFBw?=
 =?us-ascii?Q?bqjF0AXHMTuEePjAFz3ts/nEeQaEbxzbTsly8bHHdRPAYkEgYm/eHeT26lDP?=
 =?us-ascii?Q?rrdokOcBz4xBRAaDPneHxc9r8osU2dGytBd2nXEKk3aQPrEpt1qHsQ/Ai+sH?=
 =?us-ascii?Q?RaZWXhH8Qaq5WFBX7Z8FbQL2t95ZSXooN65vzOl0LPWlka16/jQHPWeVhqxA?=
 =?us-ascii?Q?g1UzNL89o1wvqrC/RlgDaPd8Wm+nli8wpVaK+NlIh97Kl76981KYZLGbHF55?=
 =?us-ascii?Q?Jss/+ZHKIPzLqUZjrqrNPqMqqooc+VidhYpAWtz5fEEZVYeW1hwUZBif8AxA?=
 =?us-ascii?Q?SvyD+id7tuq6cFuiwlbl/13VpdfjxRepWeymIkFTxLjLrZXVBieokH+vhVaG?=
 =?us-ascii?Q?yGlrZ2TqXNYVfJXj58apn7i8Dd+z4QfCrSF68plPzjgkCSnqyL3R3pKUkNiN?=
 =?us-ascii?Q?ypvJ+ZXFPn8P4hYO0/FyffT3jOWgaNARV1BOCZMEGId9h48DyhyQ8d+T9dY5?=
 =?us-ascii?Q?13lfuiwrBRUiGupYVR+FN2wy59GsyUanW2yZyD8BTE2vjZRAh8gNNepxX718?=
 =?us-ascii?Q?bW8P6JRvmUeSAPP65354YEaJsXgkYp+zyEaEGE3bqtAq9p0Vzs3U3BKEz3Gu?=
 =?us-ascii?Q?2T3XIwZlRZeBCzNLmblxBCZgMZ+/DtFd+pnZsJqhA9o2Ms6PuU3CPidNb0wA?=
 =?us-ascii?Q?KA48Ell05HXtS05ku6PB9zlfUGVx6Ug6i0Q+Dr7Wcv90tq+v4FYOzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 10:18:33.8067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd2374a-07b1-463f-6014-08dd57e141bb
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_021841_384520_6A0FBAF0 
X-CRM114-Status: UNSURE (   9.07  )
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

The bootph-all and bootph-pre-ram tags were introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across different
boot phases.

Add boot phase tags to all required nodes to ensure boot support from
all sources, including UART, USB (DFU), Ethernet, uSD card, eMMC, and
OSPI NOR Flash.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index a5aceaa39670..1387d11f9a78 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -42,6 +42,7 @@ memory@80000000 {
 		device_type = "memory";
 		/* 2G RAM */
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		bootph-all;
 	};
 
 	reserved-memory {
@@ -99,6 +100,7 @@ main_i2c0_pins_default: main-i2c0-default-pins {
 			AM62AX_IOPAD(0x1e0, PIN_INPUT_PULLUP, 0) /* (D17) I2C0_SCL */
 			AM62AX_IOPAD(0x1e4, PIN_INPUT_PULLUP, 0) /* (E16) I2C0_SDA */
 		>;
+		bootph-all;
 	};
 
 	main_mdio1_pins_default: main-mdio1-default-pins {
@@ -106,6 +108,7 @@ main_mdio1_pins_default: main-mdio1-default-pins {
 			AM62AX_IOPAD(0x160, PIN_OUTPUT, 0) /* (V12) MDIO0_MDC */
 			AM62AX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	main_mmc0_pins_default: main-mmc0-default-pins {
@@ -121,6 +124,7 @@ AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (W7) MMC0_DAT5 */
 			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (W9) MMC0_DAT6 */
 			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AB8) MMC0_DAT7 */
 		>;
+		bootph-all;
 	};
 
 	main_rgmii1_pins_default: main-rgmii1-default-pins {
@@ -138,6 +142,7 @@ AM62AX_IOPAD(0x140, PIN_OUTPUT, 0) /* (AA17) RGMII1_TD3 */
 			AM62AX_IOPAD(0x130, PIN_OUTPUT, 0) /* (AB17) RGMII1_TXC */
 			AM62AX_IOPAD(0x12c, PIN_OUTPUT, 0) /* (W16) RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	ospi0_pins_default: ospi0-default-pins {
@@ -155,6 +160,7 @@ AM62AX_IOPAD(0x024, PIN_INPUT, 0) /* (J20) OSPI0_D6 */
 			AM62AX_IOPAD(0x028, PIN_INPUT, 0) /* (J22) OSPI0_D7 */
 			AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (L21) OSPI0_DQS */
 		>;
+		bootph-all;
 	};
 
 	pmic_irq_pins_default: pmic-irq-default-pins {
@@ -168,6 +174,7 @@ &cpsw3g {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>;
+	bootph-all;
 };
 
 &cpsw_port1 {
@@ -182,6 +189,7 @@ &cpsw3g_mdio {
 	cpsw3g_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id2000.a231", "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		bootph-all;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
@@ -196,6 +204,7 @@ &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
 
 	pmic@30 {
@@ -318,6 +327,7 @@ serial_flash: flash@0 {
 		cdns,tchsh-ns = <60>;
 		cdns,tslch-ns = <60>;
 		cdns,read-delay = <0>;
+		bootph-all;
 	};
 };
 
@@ -326,5 +336,6 @@ &sdhci0 {
 	pinctrl-0 = <&main_mmc0_pins_default>;
 	disable-wp;
 	non-removable;
+	bootph-all;
 	status = "okay";
 };
-- 
2.34.1


