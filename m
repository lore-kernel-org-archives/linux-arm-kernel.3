Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47D8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLxHJYCPwn5SnqXQz6iIEYMTj85IYLdXONEgk/ouAeQ=; b=FRa4Carv8OHbH6vPn8Q5EyXaOQ
	SudHQg1KXEGcR/3vQbtOPNiRNdn+HJzhXlkqKomLKfopM/+R4ugZDspm3TJj0P88sOQr02FDDmzKb
	gdmdoUww7BsW9P6GMP+FdbeIyc5xRysnJrogBIwWAwfKDwaS/CPCbjCGGQIZ9rnmU1FWm1xYWgOuo
	SMo3ELcCAfxzGmL74dVLo1WOpNFctbLSqzVG+TeVkcZXjDt1gfFIdvJi4vrZ8YqMUjPCB8nKkJ4nv
	eRW+Sm8sAryeCzDZGiZJMoFEikdzHai7l7lSqlLf8kodIHYL3QIb5SYZEAmKcwvdphNa65Z9/0mlL
	q2ii9RVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxcc-0000000AbLb-2PHf;
	Fri, 28 Feb 2025 10:29:34 +0000
Received: from mail-db8eur05on20717.outbound.protection.outlook.com ([2a01:111:f403:2614::717] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxS5-0000000AZ2j-29m8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:18:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdBo5sCUD5q9Ll8H7NhtUrXt0fU/dY9e4f+t5HjQPiDseIRdRB4rEef+WS1bvzJgG3HXN4PdwwhEoXi0e7ymNVuj25dmOGriH0ZapBU9dWzXOLzyRh9fiME6i90ux0dRcfqpGBfG/U/P1k0xDblWoaAgtaAB2kuCj+g1jQPweXknvfGaDWr8rCP4oKeVm+w3PBXQUk6W58AhWC8bP2efpYMCtizCWR97xOUrmIBJx5C+bYxCvRIjXYkbpjWSQhETqlB1wpMMTTmVPwRk6tmw56qev+KiETWFx4xSm/MCCdTD3awaYBFbHVcchZZqmcbuqawh2y4o+SV2FmbkWdqwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLxHJYCPwn5SnqXQz6iIEYMTj85IYLdXONEgk/ouAeQ=;
 b=jF6kOSvT0cCcsYFMDUtMV6rdFSozpB5hv6w5Y5vL+wxyyBygXC8UMLbHy3EtlO2WZn7SD6oxpwXDe81Tm575F7s3mIvlAGwbw/QwIKZ0mULcdjBfRZuqvcHmfEEtnMLboiTXOAL85BQaLgAMaXWBincVMOee2J/bu8eFeYL5s9cSUJVIc7gPGAFCVzqQ8bljSbR1htSEfOK24H/M3oc9efau/wXQIZxLmqSdtOrgX9LwyOoSf+oaGsHuE2frGBEB85FJhONpXvdOcNQ01X7J0rpz64yYThzLWub/9G+r82A3G7TcZwVf8GgCdzPa8mggHbL9J0WzPIoiPi8B/pjiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLxHJYCPwn5SnqXQz6iIEYMTj85IYLdXONEgk/ouAeQ=;
 b=jOsaLEJjgWActrMQYgy15V73pAteLfIPW764iCNZsaQ0k4Yg6ken4Y0+RtB3Wd5T1aSlIsmSOYbkw6CNJG59hXAiJsuJgLVHhFFPo/WFBEeprS35p9XRKgnklWQ3bnPADnmbO73B3N6Mid4lrbmi5+BLoNs/B9LSkyRj/N9tszmMaZPVGPlYbqE/cuNivq6Di7gnheTBdfakt47QTT7b8a/I/ACnjYL8tQKLPR05f8qcmCgIsw1kcGrtFDYleSd+1Us4Y+aDKr69oXQnDKxtpXMWF+HOIZFVBonQhUjmNnAO1nSFhODk35BZMHqMhWvfnACT3K6IAj9JYgoCmKn38A==
Received: from PR3P193CA0011.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::16)
 by PR3P195MB0814.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Fri, 28 Feb
 2025 10:18:34 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:102:50:cafe::29) by PR3P193CA0011.outlook.office365.com
 (2603:10a6:102:50::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 10:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 10:18:34 +0000
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
Subject: [PATCH 3/5] arm64: dts: ti: k3-am642-phyboard-electra: Add boot phase tags
Date: Fri, 28 Feb 2025 11:18:15 +0100
Message-ID: <20250228101817.865811-3-w.egorov@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|PR3P195MB0814:EE_
X-MS-Office365-Filtering-Correlation-Id: fabffd7f-c228-4691-a9ee-08dd57e14226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mcn3BHHji/ZOPbFgGgA+xAONwlIbItbJauPCnnAwiAG2RKVJhaDdr/ckOpbg?=
 =?us-ascii?Q?5JSiZeYoPLvNznq6o6/6QMgb1ZnMAW5rEuqzEUSuj/UYE3BhwOi0ERK5TDEc?=
 =?us-ascii?Q?oFwXENS9D6XOmZeCG94dbWYqQ0CX1jYERk1B31KvRv+J644Md3DrAJP4TZlf?=
 =?us-ascii?Q?nefJDCbed7xRuFoEf6AUZajLUhexslmC+C9Ej0r9DWXXFy7IWa/qRUtTHJfX?=
 =?us-ascii?Q?LsETNzSfGqkpj5+VWgQkI5GvoqB3FFGR0Q19PI4SXtJJjy0iSWKpgdaVDJnj?=
 =?us-ascii?Q?426g0gFwHTnFEvsCFeep1l61PrvPjUTNRz0BaVL0F92UWkVr4JSAcxdlv15S?=
 =?us-ascii?Q?6wPi0LsASe0611cRi/wo2AXYY9b/5XU93jWdstBGB8iPrx4fsaIq/HXuaex0?=
 =?us-ascii?Q?1OOFyDBlTsESMsSjxH71LsPhsHruQcwis4q0nWxvapHHiOsEt5hgyxavqoES?=
 =?us-ascii?Q?M6/MYGXKPkbRGkO7mtGxdG11/5+c3kw979mdnofrRcCtbW4EjgcxOUku1SFh?=
 =?us-ascii?Q?NFU0pzIlEVus+AOhWF8QBiofJJhVPaKeH46rPAMwW9t7iPm056k6knE6b4ap?=
 =?us-ascii?Q?+aqeuZ0L5L5BhB4Cwpfa37H1OJiFa9VytrsR1D1Cx4WKjC9n6GM/z4o94F3/?=
 =?us-ascii?Q?Vx96NFwHRfArkatmTd+tN9lrN4cByAgKhNclxMAwI4Z1MQW7UdKkXIXCKu6U?=
 =?us-ascii?Q?IGv0Q2E+jgYenr1MdqIcX4GKLhNZdge2KSYoda6saaUuwKuY2HEgjUCnGb51?=
 =?us-ascii?Q?nmV1tcWkGRvhhopNrkhoEUaaN97QLxP02u8xm/FSkZPZlVmJFXYNy1UvKq5v?=
 =?us-ascii?Q?U2V2ZEevdBeQnQMYPTBWbsYD+nL5sowLoQMYstJgWpm/pv2JeI0NY2OJ1inL?=
 =?us-ascii?Q?gbvqWOszhChrTIu8AZVlM3FSh63ttb9x9Lwy2o/txbbK7MMAnE0FXFWOgWu+?=
 =?us-ascii?Q?v/z/v5YnFpmk99g9gV3DuPVBmXbOrfrNrxJmISizup5eP0SqIQEpgyZSDp4V?=
 =?us-ascii?Q?lopvADdCZlT2+WvfxSMExLMilgTHJ+d5KcVPNZaKLLHXUB+i4fwT6a2R9bKD?=
 =?us-ascii?Q?Mad2iIgUV1aAZfWBj/+sK/BqAGXPkDgjlbZkthME7jGX6mUuR+YOFO2wxLa3?=
 =?us-ascii?Q?dZd9ar+C9+W+RXUFPrMOZZGPg2pmUzU54fXBd41gveNzWuY8Oi7y7qnRGYPi?=
 =?us-ascii?Q?lezkIhrYcSYd11ztJuXzw8sN6Y0/QSikj1JWZhmENY47J88DS7no22ebRBAC?=
 =?us-ascii?Q?+88uf/F1miO5KRVpnCwV5wwZ5BdVcltSYgXCeEta14bacsrspN3ErLh/ZZzb?=
 =?us-ascii?Q?GRy93Juy5eiGut52wcIEkjKit3g1RhRRVrft6NiUtGwMN2gdhmF38HlnTr/U?=
 =?us-ascii?Q?sCJlYfw2miB9fdkOGE9zLDiuJt/CdxgWFRsigfFohQmNBsIFhZ7qB5jOYhbN?=
 =?us-ascii?Q?rquhLtTWOdneew1xhWZguBXY6tTrbycIDWFBYz6QY7zNBR1uH9sm1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 10:18:34.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fabffd7f-c228-4691-a9ee-08dd57e14226
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0814
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_021841_557631_19140F18 
X-CRM114-Status: UNSURE (   9.38  )
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
all sources, including UART, Ethernet, uSD card, eMMC, and OSPI NOR Flash.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi      | 12 ++++++++++++
 .../boot/dts/ti/k3-am642-phyboard-electra-rdk.dts    |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
index 99a6fdfaa7fb..52d53b690ac9 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
@@ -27,6 +27,7 @@ aliases {
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		bootph-all;
 	};
 
 	reserved_memory: reserved-memory {
@@ -132,6 +133,7 @@ AM64X_IOPAD(0x01f8, PIN_INPUT, 4)	/* (P5) PRG0_PRU1_GPO18.MDIO0_MDIO */
 			AM64X_IOPAD(0x01fc, PIN_OUTPUT, 4)	/* (R2) PRG0_PRU1_GPO19.MDIO0_MDC */
 			AM64X_IOPAD(0x0100, PIN_OUTPUT, 7)	/* (V7) PRG1_PRU0_GPO18.GPIO0_63 */
 		>;
+		bootph-all;
 	};
 
 	cpsw_rgmii1_pins_default: cpsw-rgmii1-default-pins {
@@ -150,6 +152,7 @@ AM64X_IOPAD(0x01f4, PIN_INPUT, 4)	/* (V5) PRG0_PRU1_GPO17.RGMII1_RD3 */
 			AM64X_IOPAD(0x014c, PIN_OUTPUT, 4)	/* (AA14) PRG1_PRU1_GPO17.RGMII1_TD3 */
 			AM64X_IOPAD(0x0154, PIN_INPUT, 7)	/* (V12) PRG1_PRU1_GPO19.GPIO0_84 */
 		>;
+		bootph-all;
 	};
 
 	eeprom_wp_pins_default: eeprom-wp-default-pins {
@@ -169,6 +172,7 @@ main_i2c0_pins_default: main-i2c0-default-pins {
 			AM64X_IOPAD(0x0260, PIN_INPUT, 0)	/* (A18) I2C0_SCL */
 			AM64X_IOPAD(0x0264, PIN_INPUT, 0)	/* (B18) I2C0_SDA */
 		>;
+		bootph-all;
 	};
 
 	ospi0_pins_default: ospi0-default-pins {
@@ -185,6 +189,7 @@ AM64X_IOPAD(0x0024, PIN_INPUT, 0)	/* (N18) OSPI0_D6 */
 			AM64X_IOPAD(0x0028, PIN_INPUT, 0)	/* (M17) OSPI0_D7 */
 			AM64X_IOPAD(0x002c, PIN_OUTPUT, 0)	/* (L19) OSPI0_CSn0 */
 		>;
+		bootph-all;
 	};
 
 	rtc_pins_default: rtc-defaults-pins {
@@ -197,6 +202,7 @@ AM64X_IOPAD(0x0278, PIN_INPUT, 7)	/* (C19) EXTINTn.GPIO1_70 */
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cpsw_rgmii1_pins_default>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -204,6 +210,7 @@ &cpsw3g_mdio {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&cpsw_mdio_pins_default>;
+	bootph-all;
 
 	cpsw3g_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id2000.a231", "ethernet-phy-ieee802.3-c22";
@@ -215,12 +222,14 @@ cpsw3g_phy1: ethernet-phy@1 {
 		reset-gpios = <&main_gpio0 63 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <1000>;
 		reset-deassert-us = <1000>;
+		bootph-all;
 	};
 };
 
 &cpsw_port1 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&cpsw3g_phy1>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -266,6 +275,7 @@ &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
 	clock-frequency = <400000>;
+	bootph-all;
 
 	eeprom@50 {
 		compatible = "atmel,24c32";
@@ -377,6 +387,7 @@ serial_flash: flash@0 {
 		cdns,tchsh-ns = <60>;
 		cdns,tslch-ns = <60>;
 		cdns,read-delay = <0>;
+		bootph-all;
 	};
 };
 
@@ -386,6 +397,7 @@ &sdhci0 {
 	ti,driver-strength-ohm = <50>;
 	disable-wp;
 	keep-power-in-suspend;
+	bootph-all;
 };
 
 &tscadc0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
index bc8e1ce11047..6fbd8d932396 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
@@ -171,6 +171,7 @@ vcc_3v3_mmc: regulator-sd {
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
 		regulator-always-on;
+		bootph-all;
 	};
 };
 
@@ -275,6 +276,7 @@ AM64X_IOPAD(0x0290, PIN_INPUT, 0)		/* MMC1_CLKLB */
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0)	/* (J19) MMC1_CMD */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0)	/* (D19) MMC1_SDCD */
 		>;
+		bootph-all;
 	};
 
 	main_spi0_pins_default: main-spi0-default-pins {
@@ -291,6 +293,7 @@ main_uart0_pins_default: main-uart0-default-pins {
 			AM64X_IOPAD(0x0230, PIN_INPUT, 0)	/* (D15) UART0_RXD */
 			AM64X_IOPAD(0x0234, PIN_OUTPUT, 0)	/* (C16) UART0_TXD */
 		>;
+		bootph-all;
 	};
 
 	main_uart1_pins_default: main-uart1-default-pins {
@@ -413,6 +416,7 @@ &main_uart0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
 };
 
 &main_uart1 {
@@ -429,6 +433,7 @@ &sdhci1 {
 	pinctrl-0 = <&main_mmc1_pins_default>;
 	disable-wp;
 	no-1-8-v;
+	bootph-all;
 };
 
 &serdes0 {
-- 
2.34.1


