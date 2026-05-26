Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27903CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSq4iY8zIV2K2GhGFXql6/hx2Yc8zdu9ALh8mL35N9c=; b=VAdS1ynAhNOmuesH5ghikdKocQ
	gzFSEvnMooxj7Z7XPTIH9br2WBpMS7vDApJTQwsWsf/jHFiKP7j5ZcU0GpV9yJLcbgBWO03ZqxThX
	w3iNlu0Yxr9szP8rrOMeSUiH+v4WaGsPQQqRLNZ5eb9rHbuewM7orD5g8NQHLuoJtoX3mvChU/HAJ
	UnW59w6stJF7ZlqKMUDFLO03Eqwz7On/q9rWnMCss9353FzZJ5h6EISDRoe67YzrVcftqZ2pyXgf8
	CUN+1hILowNv7ZbKUBV/G7Zprff46iV2mQjR7ST1uZqR99yGgom8bBr7twYe/LjA0C1B3jaAnDFaP
	1fL763AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo40-00000001VB3-2G3F;
	Tue, 26 May 2026 09:27:04 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo3x-00000001V7k-0hMI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:27:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjRv36ix5Jvub1DOq33ydGQnDyy0EwQSp/11ongkXMpT6Roqxki13V+2SpWwwfgRLp+Be3IbdjsQfr7/kpYqsxD2iCQZmjxpysjXi7bK0nvuFOIQhziM/FE/QrcjfKgrGKjkHg0A3+3K9fido+0Kb/77r5KeWTc1lTNGIMsEkb7+CoJQ3BrlbEAZYKAAwpxEybY5kww1TXNA/X+P5xAh8LPYubCI6BjA088z5qX73xtzPiWjRMlpLXO/slwUy2GaVoa8LvdWVQ0JdUNj/geOnw0wY2q3vkQSMtAKPjcF/+HEwg5312VKnsSEC14pCcMhx3I2rTU++Xv0Ah/yoAPjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSq4iY8zIV2K2GhGFXql6/hx2Yc8zdu9ALh8mL35N9c=;
 b=b5Q5cYOnYw2YbsZx23G/H9ewG2SoJI+ZIQhbV3hnnuqVIzRs0d4955UAVRRc7Tnnr2vaCnAUb+w0etdNQT6i1537M/+Fh2MErVytcpR9L2rplYgKE3Dxul15NXipy/ZOVs7CkKHgpSiSJWCTSv5liD/JJN/ACW6CM1GIgxuVZw+Gd0BNoJCAf0i261945+O6m8iACXanGsXaXpff0xwql8abxA1Rd+xQhzAwwDpyjg9nzvsTatbpc4FjyK9Sv4rlBAWnNE5co7xUS97XvqXt+gFhilLdkdHIknqIr/Trj1/KEzZEOyzFTPWBdzt6Q1MsROPdbiDgyozkC5tAhRdicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSq4iY8zIV2K2GhGFXql6/hx2Yc8zdu9ALh8mL35N9c=;
 b=fQH1od4k6gqCtzSDLH5/kEg+lAfGTRtgvuXkcL1hilj0pody+edoh4tntx3L8nrD93lfQaFesXNN3pUl/6Qq0vcOFs0FuFe9ZYt9CN0CFSJAI1k38J0TIT78t1RAxHGk0Aa3h4mUAEzfSFyqZgjsHyv4cQEpc/L1s4BX6msn29dxFgRtsVngH9K/eeogD2pTd3gdT1MqEKPbeLGQyKCeSTsvdUR2xldb231ZMGN8osgUXRNH+qPpzlALPsfCqJ4fYmYaYCSfgprfb/bL8S1RHFC1q88Kt92DjP9ElUnfc3irinDsbBYwcYnRYTxtPWXzzw9SnGcU5Sa6diaCjjpwBA==
Received: from CWLP265CA0413.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::19)
 by DB9PR10MB7593.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:26:48 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:400:1b6:cafe::3e) by CWLP265CA0413.outlook.office365.com
 (2603:10a6:400:1b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 09:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:52 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:47 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:45 +0200
Subject: [PATCH v7 5/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp13 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-upstream_uboot_properties-v7-5-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
In-Reply-To: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DB9PR10MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: bab0f95a-311d-4bc0-b522-08debb08e993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700016|18002099003|56012099003|22082099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: I9CEGUICZxX5i1oh4NC48RVyw+VZ1G/QdFz7Op93zuZ42eRUUiREuYbHf/2sDGDITTg+IQGliuOxSe56ZVYrJN1FVcffstLf9JgplkYZc6sUn4ahKJryZeho1/H7BacFw8ce2os1hmPjXLcaPbuv+HyCAlh3I3bcmH55tK66BCu/JAP6UaywIMcbVkujXvjxpGg/Mf3h15H7CLT9bZ2BfL/gJEh/HcEWB1dbd4/2eAeLCHSp0XhwohVNlQPP8h1tW0yMQDSLYorb2l/lpvGf9wd2mTEyPVVx61stNtudb0N5oqvUxuHR+4XotAjp4p+hSSmx0qIopd9njGD8SWHSTCXe4okr9JWL7/gOrk4aHqe/bDVazyN3PMcpW8Z01eBKlGuFGHl+H64jAbGMXIIRScxyfIZJx7S7uFact9Hs9pExuDYY30FH+qWN52WYmu8dQNziVc/iW8gI6acGWxlZKnaV8MBix3vwebx8SZ6ylowVwm2zGU/yYEgnBISjASppecVma43Rd2J+xMdEfrbmytsvmiT0pSIgoBzqHaHn2mkypYd0PJkRAaf+bKjVlqWsdm2RAB594066ttgTdkRfDTOMiGQvVMqQ1arTMS6sURUySvLlysHbDiqNwopf9aEbrz8QpwHxoeeB5wmAjo0Hl/kvZX2z/utdc6nNCa01nJRXF4n46rZXYgM7CBE9ZQDbb5FgbjVZmooE5SeI1ZzoA1YUR3ynJm5x3+BHyh6/z24=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2gW5lECWqsG9rdZiG+IMiNllSWmHYtqlHuizUcafqiSmQdvwmI+66daZccq+Y1r1wGYrQrzapVuhv/z/Zh7WyMm6twFHOLG6ArnFN7rOCJqMBfsmCBFF5tAK89P2jdrxPBgAYcTW7PQ3/vgVqJg8DGr1cudQ0YnvWkqKRHjzoMwbk5UVkKw/5v1OucoiezcUdyrHIXc182Ad4BlI1ZK9GZmA19eWYi/ive1rM78wtUnJvjresmNW4MWrau1ABI3Hfb578lc4VKj1j0O0gF6V8Kl3vU3pWIFWzlmTO+fDop09jI/1MUrVunj8dNbz7Kf2t/J0CpnBM6Z8dWfvx+HY42pCui57Bolrd/HTN0yAnsGrnIrbEK7I6kkyHLcKHJS+CRtc/S/kTYYdBlpnjjpd4tf6b2TFqM+iTOEGLLo/An+Zk6qpDWwx4MrMOuXZXm+p
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:48.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab0f95a-311d-4bc0-b522-08debb08e993
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_022701_400115_3CBDECE7 
X-CRM114-Status: GOOD (  12.62  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi             |   4 +-
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts |  21 +++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts          | 101 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi  | 101 +++++++++++++++++++++++
 4 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 83ae59b73dd0..ec1e91101971 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -37,7 +37,7 @@ arm_wdt: watchdog {
 	};
 
 	firmware {
-		optee {
+		optee: optee {
 			method = "smc";
 			compatible = "linaro,optee-tz";
 			interrupt-parent = <&intc>;
@@ -92,7 +92,7 @@ intc: interrupt-controller@a0021000 {
 		      <0xa0022000 0x2000>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 70d85af46735..06b5b68e5f78 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -354,6 +354,21 @@ timer@12 {
 	};
 };
 
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_b {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart1 { /* Expansion connector: RX:pin33 TX:pin37 */
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&usart1_pins_b>;
@@ -371,6 +386,10 @@ &usart2 { /* Expansion connector: RX:pin10 TX:pin8 RTS:pin11 CTS:pin36 */
 	status = "okay";
 };
 
+&usbphyc {
+	bootph-all;
+};
+
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
@@ -436,6 +455,7 @@ connector {
 
 /* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
 &vdd_ldo2 {
+	bootph-all;
 	regulator-always-on;
 	regulator-boot-on;
 	regulator-min-microvolt = <3300000>;
@@ -444,6 +464,7 @@ &vdd_ldo2 {
 
 /* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
 &vdd_sd {
+	bootph-all;
 	regulator-always-on;
 	regulator-boot-on;
 	regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..43b8a7eed01b 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -182,6 +182,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -253,6 +257,42 @@ phy0_eth1: ethernet-phy@0 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-names = "default", "sleep";
 	/* SDA on PE8 = CN8.27, SCL on PD12 = CN8.28 */
@@ -388,6 +428,7 @@ goodix: goodix-ts@5d {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -395,6 +436,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -404,6 +446,22 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&optee {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rtc_rsvd_pins_a>;
@@ -415,6 +473,14 @@ rtc_lsco_pins_a: rtc-lsco-0 {
 	};
 };
 
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vdd_adc: regulator@10 {
 		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
@@ -438,6 +504,10 @@ scmi_v3v3_sw: regulator@19 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
@@ -448,9 +518,24 @@ &sdmmc1 {
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&scmi_vdd_sd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 /* Wifi */
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -482,6 +567,10 @@ &spi5 {
 	status = "disabled";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers3 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -575,9 +664,20 @@ &uart4 {
 	pinctrl-2 = <&uart4_idle_pins_a>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	bootph-all;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
 	/* TX on PE1 = CN8.37, RX on PF9 = CN8.33 */
@@ -645,6 +745,7 @@ usbotg_hs_ep: endpoint {
 };
 
 &usbphyc {
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index 54ece71085c1..4efaca84a72c 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -54,6 +54,46 @@ vin: vin {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
 &i2c3 {
 	i2c-scl-rising-time-ns = <96>;
 	i2c-scl-falling-time-ns = <3>;
@@ -216,9 +256,18 @@ eeprom0wl: eeprom@58 {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
 &qspi {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&qspi_clk_pins_a
@@ -229,6 +278,7 @@ &qspi_bk1_sleep_pins_a
 		     &qspi_cs1_sleep_pins_a>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -238,9 +288,35 @@ flash0: flash@0 {
 		spi-max-frequency = <108000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-all;
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&rcc {
+	bootph-all;
+};
+
 /* SDIO WiFi */
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -285,6 +361,10 @@ &sdmmc2 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 /* Console UART */
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
@@ -312,3 +392,24 @@ bluetooth {
 		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
 	};
 };
+
+&vdd {
+	bootph-all;
+};
+
+&vddcpu {
+	bootph-all;
+};
+
+
+&vddcore {
+	bootph-all;
+};
+
+&vdd_ddr {
+	bootph-all;
+};
+
+&vref_ddr {
+	bootph-all;
+};

-- 
2.43.0


