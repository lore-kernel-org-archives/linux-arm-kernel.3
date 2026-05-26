Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BA6CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzI55iJCbyZtyJyjBplbYUD0YP6XX7CoeSsP+uWuQhg=; b=SSTzMtrvWeUGTM3RopolmgVUnE
	kWeyJKj56SeHmgFz2hBFn+j0yPUDGKlCKXACxht8+FI3V5nyfLB3msfXL77CJGAk/5MTbQMctaqX2
	oVLwsf0WOfgc+j5+hZo9gYQqtSGstd3LNaLuz4g8bzHD2fWPyojejCPtB4LYlmgLytOENGr0zz9SM
	4kHaYvSOXZOaXmhnV7pXk8KBloq2wO4vskYxPD7Lem9YHlrfthopTA8Pdj69FPHby3dJSM/JR8XWR
	CCNuN4NrSU2HLBjyRtHUmdXgpwgwB1oDYLxxU6ZiudRKPIkSUQ/wr/+COLEPXZVlGogvfbbBudHyr
	3baUvB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo4O-00000001VRy-3FsI;
	Tue, 26 May 2026 09:27:28 +0000
Received: from mail-northeuropeazon11010021.outbound.protection.outlook.com ([52.101.84.21] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo3y-00000001V7s-1hwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL/LItmBAKGfTw5XW/YQp3LmnwZ38ejXFFG7V29oRZ71pCZ00Dx+hAf2e62zuI/e+M+bA83Fh5Li72xLqbddz7DBCjzh4SbrHibNx5ElGgs4gwl5yVrLojLTeFkW5Na9ITLiu/Eesj67i5JQc2AG6njhVQN2MGWFLCgEmwz67DADQmx3DDuc21eObRd7f4ZatF8QXo+PR4pO/6yc0NL3U2MLTxT/v3ZAgRPWo5difGY4rMsk7RW+E32w4uIPP0iv9T8r4z/r6A17g+8yRK5WT/qJWdPnojBWzvlND9/Fo52sSkGwmKDkULkHVnnhEfZK8YcHhgnL1kUbGxL55175Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzI55iJCbyZtyJyjBplbYUD0YP6XX7CoeSsP+uWuQhg=;
 b=oSPWtcocsem5/Wkzhv6xEyunH3Jn8ggO80UqiEBTQ0NWogpngBWHEUZgmJNOcVIItFg2S13dQLVLa+71Con+apOdpSUl/S9P9NOaM3HXgJpzQzGQ1sHsHhESIrQwchPy1948lpZHGfZxC1jjfpV9omgEwZGG6rAFwMsTRZ/q+4KeM2FuVGTeyk8BrV/Rkag0sY1KOj0iT4EWVIrMZ6+KEg1WJhIsHf4ZEmyJ1pyFmwBIGzXb/aXTzZHkwCt68xamvY71tsumEwKhKDzKB9KxhWPRXUxnWOWnnbOvMgAES5uhrFehQF0ntU04VICnG2Sr9j7MqPv61Mtml/hmzTZJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzI55iJCbyZtyJyjBplbYUD0YP6XX7CoeSsP+uWuQhg=;
 b=hLcaVhpywbXqrNWZhmNmx/Qv+7dncvzGtWcCyO/KQ7rt7Jo9yLJgl2nEW1ZGk1NWDjlMCRij8DJmMzl/w+Sfocz2KLRreigIDGaBJg2AFbUdq+t1rSZhejqy3tbNznFzVrYOymSYWj7hbssYhZLHhnwnUOsjphRDusH1GeAmxVd4J9ymTIhkTi5U7Fp59qOCSkmHyVFWQqd9x8Ir/Nks7L6mxXBvlyNeApat0lxinnzRnvMPJXfDn+lutfquWJ10CjFwyPQSyl70NzpPnMdVO8gy5V6fLnOraZ5xklskjKzwFeK4kOt+NDtUm0BzcMH+8RAv5HkDFFDQ4+FvHPbqRg==
Received: from CWLP265CA0409.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::8)
 by DB9PR10MB5504.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:307::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 09:26:52 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:400:1b6:cafe::a) by CWLP265CA0409.outlook.office365.com
 (2603:10a6:400:1b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 09:26:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:54 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:49 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:47 +0200
Subject: [PATCH v7 7/7] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-upstream_uboot_properties-v7-7-e17cd424d5db@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DB9PR10MB5504:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d53bf13-e14e-459e-c976-08debb08ec08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700016|3023799007|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: VfKHGIBZT85nHqLPl2V18+DqryDhwrhzUT+uSx/Y/xn6uryJE+ho211hU9Dg1Q+LhKUSvYHw4nkpD4Oem0Zh5PSP6mkctibhZ2rTfS2GDPWfUrMCN1677naPb9uxPswUzrFrmiAvgE69ZdIN47AYGk4g5MdMybk6OLYmQ6LcILz8zfIANmd1L8xEWE0zHDagC4qYw+Keu4dRxJnqrZRSVYftq4xx3un9L2fyD4OEvHcAT+hEt6/o+QUKlCzhL12jNt81Y74aGGwCtindrRjzphl4bBXerBBTHWPr819M4hoIOclug7ZKDP70Jus5ioXdw+BVjCYs86USSW87g1kDWhoG3WiFDUQaVK528fdMkfyW9FMfEuqU4n8F6jhZeStGHN15u5/ggRqRhBdx2q/5TOPwqefZWFCSjouq4v5Au1Aeja8TYx2+ccWKJBYdKASb88sFfnaC5mcK3f1F5YYb5BliS4RZzdqVPuL6UBKWbRVR+Voazkii/ZCLRvrYjbnsox1/qg/wjHypmnTN3QQ0dsKis/Fwfi32YzeU9mNa1Iz0XxmwvxKlt/Njug21ghMzAxrdOlE3pgpk4o86fvztJh1GBsK4NxcT3F3guDT/IRR6hVmo9udl6LwBxjQYrieIYCT3DwhS2klMrAFyYCzEze5FvLKDi07TY0vUNdVRQ0oQg+RVU7ds6Yi7SJHBWCcX94C+9ga2AEigMwzL8CROYtzFYacqkrQQh3YUXyZXk2E=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700016)(3023799007)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gk9tLZbWW/6bDJ/4lUjt2ZU9yn/uSE4Dm/cnARrc3kxb1+5SS/D7bNOOgdcWRr3XCZtKreD9vN8FCXICl2xHRwhXdBcKDN5PmMBv3iSNVlM9dFFQzPhm6yV8e/hQaBU6JOiU64hKvg+opsjjqOQ8J8+/dWaj2pbFi92CLaeANKx4GTtzmjDPJg/gfGlvrda61Ikavjc3oGJnUrrtnnMLMePJPGjtUIDpmhAnDGTyXdPws/WNalJdKdoydSsA3LN5v3gP2lFvWUXszdX8WGGE3L69tVyYzLyOmH0/DR1Jra9Pq8SgjJtTvDJO80PWmY3OeqxtcTEiA2to5efq7fYg1A1wwgfh+xuDj4hpTcO2HDop362h7DF+qq4oiK88tXnvd7tuiwlaXXziR0z+WxV48BiHr6/+zVoh7yYWbZ09dlE2iboBpfnl0Ga3LLWny8Pm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:52.6478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d53bf13-e14e-459e-c976-08debb08ec08
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_022702_638162_6DC5FA61 
X-CRM114-Status: GOOD (  11.09  )
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
 arch/arm64/boot/dts/st/stm32mp211.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  29 ++++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  |  95 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi     |   2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 103 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 105 +++++++++++++++++++++++++++++
 8 files changed, 339 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..a79c056fdfb1 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -47,7 +47,7 @@ ck_flexgen_51: clock-200000000 {
 	};
 
 	firmware {
-		optee {
+		optee: optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
 		};
@@ -70,7 +70,7 @@ scmi_reset: protocol@16 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index a1285abc80ca..100f787168d6 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -48,6 +48,35 @@ &bsec {
 	bootph-all;
 };
 
+&optee {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
+&scmi_reset {
+	bootph-all;
+};
+
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
+	bootph-all;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..8942a5a29a1c 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -65,7 +65,7 @@ optee: optee {
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
-		scmi {
+		scmi: scmi {
 			compatible = "linaro,scmi-optee";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -117,7 +117,7 @@ scmi_vdda18adc: regulator@7 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index dd4efbe5a46e..0608b978cbe5 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -131,6 +131,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -153,6 +157,46 @@ phy1_eth1: ethernet-phy@1 {
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
+&gpioz {
+	bootph-all;
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_b>;
@@ -219,6 +263,38 @@ lvds_out0: endpoint {
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
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -258,6 +334,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -272,12 +352,27 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..190877cec012 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -68,7 +68,7 @@ optee: optee {
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
-		scmi {
+		scmi: scmi {
 			compatible = "linaro,scmi-optee";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -139,7 +139,7 @@ v2m0: v2m@48090000 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..3ba4e6166586 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -40,4 +40,4 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..7e0b6502467e 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -138,6 +138,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -160,6 +164,54 @@ phy1_eth1: ethernet-phy@1 {
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
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_b>;
@@ -226,6 +278,38 @@ lvds_out0: endpoint {
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
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -265,6 +349,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -279,12 +367,27 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..dab54742e01c 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -167,6 +167,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &combophy {
 	clocks = <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>, <&pad_clk>;
 	clock-names = "apb", "ker", "pad";
@@ -253,6 +257,54 @@ phy0_eth2: ethernet-phy@1 {
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
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_a>;
@@ -344,6 +396,7 @@ timer {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 	port {
 		ltdc_ep0_out: endpoint {
@@ -353,6 +406,7 @@ ltdc_ep0_out: endpoint {
 };
 
 &lvds {
+	bootph-all;
 	status = "okay";
 	ports {
 		#address-cells = <1>;
@@ -374,6 +428,10 @@ lvds_out0: endpoint {
 	};
 };
 
+&optee {
+	bootph-all;
+};
+
 &pcie_ep {
 	pinctrl-names = "default", "init";
 	pinctrl-0 = <&pcie_pins_a>;
@@ -395,10 +453,38 @@ pcie@0,0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
 
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -430,6 +516,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -444,6 +534,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &spi3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi3_pins_a>;
@@ -521,11 +615,22 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart6 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart6_pins_a>;

-- 
2.43.0


