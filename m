Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BA0CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D2sEVLgPPWmVbAsOE0EJqbTBa7l6XPHhjV1rtTJTUz8=; b=qf7j9xyoXIgaz/ciqCH6oIBdkr
	mrUpWXvEL5vdi/y8+Qa7MvdJotYSIOqCPBAqGDZmAkZRhssi0+STBVdXW+b1NAMQ2CZn1Rsi/D/gQ
	phAWEFLetPIPWJM2MnPZv+1aUoEpU4lvcnwvChyKgRBCYYdyy8DJtik86JxWZEHOtUR7QaGH2FJXr
	mJ1JsGAX62WAvqq75+Dv9m4zbkILm805xsFep+GchfvRIaQHWmAaOZrRgtyGJ0chxdUBhSozM5Vl6
	Fl6PvhopBXdgPd1dinYsNUtCRySkFJtcwxkcryJo15OPjd5kTV71XRvFb7iEFZne1yAgtbRzsJjtR
	YyKMKj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEj8B-00000003p3U-2XZu;
	Thu, 08 Oct 2026 08:05:35 +0000
Received: from mail-northeuropeazon11012025.outbound.protection.outlook.com ([52.101.66.25] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEj89-00000003p2q-1fa9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:05:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMU0GUKtf8tNkk6IbmnLxXl0jlTu36yVZtnUrLx5UQI6U4cPuinLpBbroe+aoxMxFrfvJYsh6iYBYaj8ze8JZVjFCBG2G8aeLXGiUB1ShvzJ6FkYruQmAPzQdsGI51X5yVI5UwBz28P3mKVyEEFSoCGDC4XdaBM+EVNrSIQVNSXbppeEh8Y1tQOubhVkBlAXGnWgbAwZBbArrRb1Nv4t9KQGAtV/2hdaUliOZxyzqIFUaMp4LF3AVc5xc8oXH4b/2oEfwR1tWhArWFVH6Kytlq4n7ixq0wxZXAa18WUrzVSu3IXocsUpCdaX7IAj204ZmALrTdA5i38C51xhRQVp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2sEVLgPPWmVbAsOE0EJqbTBa7l6XPHhjV1rtTJTUz8=;
 b=TuyMZJ3i3a5AfpJMLOyNPONTH+X5inB+plKsm/U4Euy5wGgi9IYeRIoLJCwN0TkhMlvcRJfh0uQDBUmlU4wspwC0kf6PEzri2oSe6W3l/JgPFBamkp4EEhBBHM9QFNRzKRpy+N+9mxVcggHX5WGFw3++a3Y2+378b2oKVHCIxxmuvRgvAzb/0HUmnMDw7xZVRuEju33jPQCHhqVmUx4DTEyD+Jiire6bP4ybdIKo1fMPIOXDoDOAbBpiE6ps6b0aK0a1nVUEBUekGzI5o6rO4YhhshPDUB0VuOuf7XEOuL/xWvrb6hIO/giITPpDfm4o5I3O9Dzo4ikB3I1NrPdcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2sEVLgPPWmVbAsOE0EJqbTBa7l6XPHhjV1rtTJTUz8=;
 b=YkVDNaLAI7X5umjRTjek//bm4bwFn6068Lv0pSQ+KMGpy93VSpUDiOQFRnsGeHz5g/RaFZ8nwiyij1q7N3YdRJPdEnNqCpUG+Md4lVxf3faqkZmW5/YMossMvnPy7KO2Iz6NkqdZmFMbO+Hn+krGwS12Hp2GMv3k0t0V5s+AW1IzzHnWLvv6qtTY1ThLCSxZc7D2haPobIPf6msQt1c2bsEBvL1rXNfGFmVbz71JkuJkYczvCKVF6y835C1WyFMpct7UH+az22Ge0jT/0C9zeOnwyu8lb+MKZlFHmyZ0swoqTb43i2mx02ho8/5Y5aonzPv9xukdQQ/qU41VHIEBbA==
Received: from DU2PR04CA0310.eurprd04.prod.outlook.com (2603:10a6:10:2b5::15)
 by PA1PR10MB8812.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:453::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 08:05:03 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::5b) by DU2PR04CA0310.outlook.office365.com
 (2603:10a6:10:2b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 08:05:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 08:05:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 8 Oct
 2026 10:11:49 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 8 Oct
 2026 10:05:02 +0200
From: <gabriel.fernandez@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<gabriel.fernandez@foss.st.com>
Subject: [PATCH] arm64: dts: st: add RCC support for STM32MP21
Date: Thu, 8 Oct 2026 10:04:37 +0200
Message-ID: <20261008080437.20270-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.14]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|PA1PR10MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 71edf1c9-db3b-4b63-fe4f-08df2512dbc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: bt9+GTbFVil42AbK02gxNDhr0H8uhJCNB/y06CmQ27t4wGl7EZnOrQ/JnlX1A8Q0x+Q03fVMQUHD+qlQ6fwfMMe/6/J7P3ygZy0LsEjCFeiyvl7N7SmkDLws7vquyaPUMdZcVo3hvUaDTE9v4StDZa8jQz3D8QCq9e+fJ6znYMkPHmSheW5+RtmtgrdjceJ+2GoNvmaK4EDbbWSSABpxZyZAGwLSL0FO3hncYWvrR9LLuzVRVQVyyR7bPdl0KuTrOjaT4VVwwcP7iOyhshJ8uy8ftnkDvGbl+qi93ALx/oVw25HaBzMjdzeTiFNkVGVVDP1pBBHny+z80wOE4n6+bXAGO2w1n5Nw+VeNg+CQcm5CfqVxx1DyjFM4dCDNkf0Rfb6Q5Wv3P/DLs7rVTAEGccZU6NJbFRUMIclxNP3+RO/EVPoSl1NKZwvHxeXCoeTh267iFsvUWuxBX1yuB9qgWsTG6Lrvf+2gh9YoIB7iVSVXqcv52jThUz7nO04NQ1+k6acn3mjh+IWPjTISOiNyja/isLRrsEuGqjqZeRLi7h4vh+MrX79P4+5K1/600ewKslTl7lSBT7kHVhclAvXi5K0fNI5CKpDJIEQryCoTHa8zaUZTiBBm7eVgeq0abLwm1jVN4LEj9vtD+GH/VC+HU3+0DF/XC+5lQ0kAzrjk38nRZCLftsfqTq+6KxotoDmulsjf404Qe9zFGihS8LIoww==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BC5WQGb7lcGbLPFJUy9gpZX1TD1O8qkuPX1meJePd/IrsltnDRMNvGnUyAsGj2SkcBpgYTCPN5Rub/ZhmXC1S4P/UFbH/lJdmzPn4lef02AShPbihjrN5CJect7nAoAIkaLVuyXsy2Yod+lErm3Z7I3t7oGnnquGhP3firm6OGum+bftpX4IxLmfdCe5F4ObFaa5iJ4gb6lvunFggyKU3v7jTYL9yWaKPj574wFbvqqX+fhOOmxAQmZKA3deYdD+hKHVn9B4dhT21LGJhKRwV9pyUNoYE8nOaBsDWzSn2bkfs7Dof8deauXAv0fwPu+gDcfwGoXV1HX8LRne2UcFxqn0sy+hAylFeQ2L0i3DHG3MDYMZ4YpcTrzsIxFXDlmOkwcIDBMTSLwcbRqOO2QyqFPn3pEgirOfA6PsObqOeCChzvy9ZOj66WJktPh2ifQt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:05:03.5288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71edf1c9-db3b-4b63-fe4f-08df2512dbc1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8812
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_010533_673318_320A0BA2 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Add the RCC node in STM32MP21 device tree files to provide clock and
reset controller support for peripherals.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 95 ++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..599fe7aaa414 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -3,7 +3,9 @@
  * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/clock/st,stm32mp21-rcc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/st,stm32mp21-rcc.h>
 
 / {
 	#address-cells = <2>;
@@ -34,18 +36,6 @@ arm_wdt: watchdog {
 		status = "disabled";
 	};
 
-	ck_flexgen_08: clock-64000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <64000000>;
-	};
-
-	ck_flexgen_51: clock-200000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <200000000>;
-	};
-
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -106,7 +96,7 @@ usart2: serial@400e0000 {
 				compatible = "st,stm32h7-uart";
 				reg = <0x400e0000 0x0 0x400>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ck_flexgen_08>;
+				clocks = <&rcc CK_KER_USART2>;
 				access-controllers = <&rifsc 32>;
 				status = "disabled";
 			};
@@ -128,6 +118,85 @@ package_otp@1e8 {
 			};
 		};
 
+		rcc: clock-controller@44200000 {
+			compatible = "st,stm32mp21-rcc";
+			reg = <0x44200000 0x0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks =
+				<&scmi_clk CK_SCMI_HSE>,
+				<&scmi_clk CK_SCMI_HSI>,
+				<&scmi_clk CK_SCMI_MSI>,
+				<&scmi_clk CK_SCMI_LSE>,
+				<&scmi_clk CK_SCMI_LSI>,
+				<&scmi_clk CK_SCMI_HSE_DIV2>,
+				<&scmi_clk CK_SCMI_ICN_HS_MCU>,
+				<&scmi_clk CK_SCMI_ICN_LS_MCU>,
+				<&scmi_clk CK_SCMI_ICN_SDMMC>,
+				<&scmi_clk CK_SCMI_ICN_DDR>,
+				<&scmi_clk CK_SCMI_ICN_DISPLAY>,
+				<&scmi_clk CK_SCMI_ICN_HSL>,
+				<&scmi_clk CK_SCMI_ICN_NIC>,
+				<&scmi_clk CK_SCMI_FLEXGEN_07>,
+				<&scmi_clk CK_SCMI_FLEXGEN_08>,
+				<&scmi_clk CK_SCMI_FLEXGEN_09>,
+				<&scmi_clk CK_SCMI_FLEXGEN_10>,
+				<&scmi_clk CK_SCMI_FLEXGEN_11>,
+				<&scmi_clk CK_SCMI_FLEXGEN_12>,
+				<&scmi_clk CK_SCMI_FLEXGEN_13>,
+				<&scmi_clk CK_SCMI_FLEXGEN_14>,
+				<&scmi_clk CK_SCMI_FLEXGEN_16>,
+				<&scmi_clk CK_SCMI_FLEXGEN_17>,
+				<&scmi_clk CK_SCMI_FLEXGEN_18>,
+				<&scmi_clk CK_SCMI_FLEXGEN_19>,
+				<&scmi_clk CK_SCMI_FLEXGEN_20>,
+				<&scmi_clk CK_SCMI_FLEXGEN_21>,
+				<&scmi_clk CK_SCMI_FLEXGEN_22>,
+				<&scmi_clk CK_SCMI_FLEXGEN_23>,
+				<&scmi_clk CK_SCMI_FLEXGEN_24>,
+				<&scmi_clk CK_SCMI_FLEXGEN_25>,
+				<&scmi_clk CK_SCMI_FLEXGEN_26>,
+				<&scmi_clk CK_SCMI_FLEXGEN_27>,
+				<&scmi_clk CK_SCMI_FLEXGEN_29>,
+				<&scmi_clk CK_SCMI_FLEXGEN_30>,
+				<&scmi_clk CK_SCMI_FLEXGEN_31>,
+				<&scmi_clk CK_SCMI_FLEXGEN_33>,
+				<&scmi_clk CK_SCMI_FLEXGEN_36>,
+				<&scmi_clk CK_SCMI_FLEXGEN_37>,
+				<&scmi_clk CK_SCMI_FLEXGEN_38>,
+				<&scmi_clk CK_SCMI_FLEXGEN_39>,
+				<&scmi_clk CK_SCMI_FLEXGEN_40>,
+				<&scmi_clk CK_SCMI_FLEXGEN_41>,
+				<&scmi_clk CK_SCMI_FLEXGEN_42>,
+				<&scmi_clk CK_SCMI_FLEXGEN_43>,
+				<&scmi_clk CK_SCMI_FLEXGEN_44>,
+				<&scmi_clk CK_SCMI_FLEXGEN_45>,
+				<&scmi_clk CK_SCMI_FLEXGEN_46>,
+				<&scmi_clk CK_SCMI_FLEXGEN_47>,
+				<&scmi_clk CK_SCMI_FLEXGEN_48>,
+				<&scmi_clk CK_SCMI_FLEXGEN_50>,
+				<&scmi_clk CK_SCMI_FLEXGEN_51>,
+				<&scmi_clk CK_SCMI_FLEXGEN_52>,
+				<&scmi_clk CK_SCMI_FLEXGEN_53>,
+				<&scmi_clk CK_SCMI_FLEXGEN_54>,
+				<&scmi_clk CK_SCMI_FLEXGEN_55>,
+				<&scmi_clk CK_SCMI_FLEXGEN_56>,
+				<&scmi_clk CK_SCMI_FLEXGEN_57>,
+				<&scmi_clk CK_SCMI_FLEXGEN_58>,
+				<&scmi_clk CK_SCMI_FLEXGEN_61>,
+				<&scmi_clk CK_SCMI_FLEXGEN_62>,
+				<&scmi_clk CK_SCMI_FLEXGEN_63>,
+				<&scmi_clk CK_SCMI_ICN_APB1>,
+				<&scmi_clk CK_SCMI_ICN_APB2>,
+				<&scmi_clk CK_SCMI_ICN_APB3>,
+				<&scmi_clk CK_SCMI_ICN_APB4>,
+				<&scmi_clk CK_SCMI_ICN_APB5>,
+				<&scmi_clk CK_SCMI_ICN_APBDBG>,
+				<&scmi_clk CK_SCMI_TIMG1>,
+				<&scmi_clk CK_SCMI_TIMG2>;
+			access-controllers = <&rifsc 156>;
+		};
+
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp21-syscfg", "syscon";
 			reg = <0x44230000 0x0 0x10000>;

base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.43.0


