Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A23C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0yXVRhwFXOnIIim8O8d/rmvnD8oZrbiiu074W2Rt8c=; b=02JBH5xMeI8SFN4D+yTO7uGqVj
	jZkv+CE+nSgssLH75L/OaJovJ3zE9lHN/rG5wrrEjzVYmFYxFwwO6dnzRX+X2nd6UGKMwHG4Hcvd4
	FXK4InLA6APTXlT8NuTOg2vChQ3YCluz2GEEw3MEc69zM1L03nhMphuNxA50Q8IGTDmqr8HzFx07S
	XMLXNcdu3ieY/nhNw6qNs3pLFW2myQyA+pyupObzymVK9yTyqdCex0S6w3Dew91Ken1Z6F4JkIa5Z
	Qz11/iY52t9k2VPZ+Vm4DjmbcRegMkTy4fS6hSKfpmk00cvkH1eT9fGxLXgqWz5XgiF7SM2rLHbss
	J9G8qBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSbA-00000000SPN-0Sn9;
	Thu, 13 Aug 2026 10:23:44 +0000
Received: from mail-westus3azon11012000.outbound.protection.outlook.com ([40.107.209.0] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSb6-00000000SKV-0mDW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPouUkvq1ZdPrJf/G0s9T0mIRdC7CYJSiN/IPxr6cFE5nuenfUDCktBSiKImAfkiaBSAV53XwVrAnsKqXLmB2wyv8em4J424ugVFtoACj+ooGR8gTNVYMQ22uqkZTyS95/DCloI1TNahUIJNLRnvA6NwpYT7YmXjIwOmKLh+zE347sA6CqrTwkz6cULrKKlKtCBl4K9nAiRzIUX4M3g9iifOyZdxIhSc0su2Fognh5ho+r33VnJXbc0s9kRgDMb3+05SO9RJjEGITrJfl5GAyV01cLLuXq9BU3buX1H/RrU3jEiKMwkNZ0UOtpKpsJ9TMZx9hucJ1rdZY1tEiTE2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0yXVRhwFXOnIIim8O8d/rmvnD8oZrbiiu074W2Rt8c=;
 b=D4HKKcDMEuc5rh8RwqUGr1yTnYIZd/qowBFQE5UhA5lEqO1i+8kwHH4L/CIF6a1zTjn30Y+BN/fNcjSoRbwVxxcVbsFdSEXlZLVrNak9m3YvBmWOLfz+r91g9dyDGmKIokl7bQhocVyx4EfsvMYmVz2TiqUspgLKAaxA1pZLPzSwX1PsjBpEXiu4lH+cg5CM3QfWL91iI4aEAKdcsU4k7KPhIUwqrVL5PMX5ao8wc5ICVS3vRk2n4H7k627/UNF1aWt/qCoobTGpmN1fW2Dkav44+SUC1RhW6AqQ/yVTm/3f1lU7ILWzE4JMvSSEmDv5fTKknecPpaO7DxDfIn7xQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0yXVRhwFXOnIIim8O8d/rmvnD8oZrbiiu074W2Rt8c=;
 b=tC1NEKKljWjLPTp/FA86BU8QV13Bc19ZNhwrW1gYYsSPxma0EQnkZac3D31fehpX52ps08CChiMLtLYRSKauVXwaJeo/p7RbXF9Hp+52tSGNZvFA8+LhS14yxF4S4ZSQAcKONPiuaIipQwLLq6ouJ673xcHYucte4LaBQMrZDYGEDCRVK9nQr2ADwON6+2buPMf0YV2E7I59husWJIxDawoSUIFvdqf6SugO/NVctDXnzsxg2o3Bru+0YN3HSVHCRoRshUcmZBLtoIm/qzQgNvKP7yH5JJPcdRvS6pElzupEgMc2asYyBsPSypAtHqW9QoQXTghtyNlK5qrd+knf6Q==
Received: from CH2PR08CA0009.namprd08.prod.outlook.com (2603:10b6:610:5a::19)
 by CY1PR12MB9675.namprd12.prod.outlook.com (2603:10b6:930:105::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 10:23:34 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::17) by CH2PR08CA0009.outlook.office365.com
 (2603:10b6:610:5a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 10:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 10:23:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 13 Aug
 2026 03:23:21 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Aug
 2026 03:23:18 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: [PATCH 7/8] ARM: dts: aspeed: Declare SPI NOR flashes on remaining boards
Date: Thu, 13 Aug 2026 19:22:32 +0900
Message-ID: <20260813102233.3088939-8-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813102233.3088939-1-jackyhuang@nvidia.com>
References: <20260813102233.3088939-1-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CY1PR12MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e834940-36d9-4e99-a7ad-08def924edd2
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|7416014|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RAVmijGytNnNHyiG9JE2H1OZl1qGjTn18qeVTVlf42XcbUhmsm5AAYUXWzBD359l747qsY0snK6gx+EmKuRjv5pDxS/ultT/HovrKLxQGhtfqVArWt204Nu/VvwWBvQijBqCCT3UkZri9qP5NXNuZcEdbdMcd346eqUE55GwFEWOQpGVcKaoZX2K7nl0JpYWRDdWT8TKUuNlIP67Plc9pe0dSqf/1rO3aFap2wsx/kW1kpi5G3mH+g0HCzsixm6lmVU5fjjpWCdwRh5suLFF+DcLdA16GH0tGqRkxVuMelwB8O5dDfaqCR8RMEMlTBxBiW6c1XBhcO11ypTx/1ixJQ8/JwTULxx0NKDQdTNw3tx7XtalRQeFaS8p1WWwKkY+3y9LFJEgqRKVyt2XKI9tJG3Go1olmwUNm/YVUvmdREyXkSnbShHoCKB3xL01jmOx/CrN3ZJjEI2JrYvHSeV1mnpA0c4IO/vFs98IfFnlVnhhzgoNoXdbVk5DTSZXZjPTs05dLPtVOpl9pxx7NLPWGVzQYfIsD3nrAhbtCPqRFZ2OJs7EuTzur8+Z29BwW4s38BYO3xnMAzhRKbeTl0nRQxuVY7kJ63pyu501p9v7xtDJWU33R1Sr5Zm/a0mJm0QlG5SRzIEpQvAsZZY+yRJ0i308fXI2tuMdys+tG7+BHNeVNq9hCn1qr/E1cNDWxvFlWEnAnItKy4OSq4/MxMtGjQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(7416014)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 31ntoej5A8sgfNntuUt/4/+l0bQOpqmp5B+UP3/DROOhibZjQ5CSmPJC0iNr655iGebQTiyV8+q991JEdgwdKknaLYuhyPRQSo43PIIWkIDyB9T5hUyGPaQyrZeJXa2NS6MUV8sayashFUMaFnPgZiUeWBLlPn6tNVrrwQJITzugQVsquq73OWIRYdpY5rQ+zPwCneI6WhIyQzOglFrDBapWBTdyNh+QkBaodNKiXJCHD1ttLgrgcMsz7jLwsEGhtQ1zDyDKGONWe5URFwujUTzFQLQlEfoPNdfjqoBndSJdJwAlT+0OAwuPObd/vveDm2JBOv57sBHqXFAhdZW9DhFSku+ySRBbxdqEWIgjKW8QIz0UMoTdlp6MICMdCVeNOTrfH9isOuZ7HcLDs2+TbrMSWLP8Gi534l06mI7MovX6SzPtRTHE97i+1RWdfL0E
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:23:33.5317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e834940-36d9-4e99-a7ad-08def924edd2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_032340_250223_61E2B4AB 
X-CRM114-Status: GOOD (  10.03  )
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

Declare jedec,spi-nor flash nodes on the AST2600 EVB, Qualcomm
DC-SCM, Quanta S6Q, and UfiSpace NCPlite boards with the properties
previously inherited from aspeed-g6.dtsi stubs. Keep status = "okay"
so these boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts          | 4 ++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts   | 9 +++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts       | 6 ++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts | 6 ++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index 3f2ca9da0be2..38f8d7c03d16 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -179,6 +179,8 @@ &rtc {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
@@ -194,6 +196,8 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts
index 259ef3f54c5c..882b68248e14 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dts
@@ -61,18 +61,24 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <133000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <133000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64-alt.dtsi"
 	};
 };
@@ -83,10 +89,13 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bios";
 		spi-max-frequency = <133000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
index 86451227847b..70791b3c0989 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
@@ -196,10 +196,13 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 };
@@ -211,10 +214,13 @@ &spi2 {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "spi2:0";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts
index 7ab29129d1e4..d8f7939abf8b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts
@@ -148,18 +148,24 @@ &mac2 {
 &fmc {
 	status = "okay";
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 
 	flash@1 {
+		compatible = "jedec,spi-nor";
+		reg = <1>;
 		status = "okay";
 		m25p,fast-read;
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64-alt.dtsi"
 	};
 };
-- 
2.43.0


