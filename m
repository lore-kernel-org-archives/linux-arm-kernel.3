Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE9FC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRcBAX5gHZTkjKW6bEA60cfRVbw8eYq+BgSG0rpxf04=; b=LfyKxtd4EIN74fCPYLx0/jc1V6
	Vzutm+Wn8yxmzsiO9ZMPXYu08dhCsFmbZyhvGj+30N8HpNkhDwR826ndsq4ooNVmZmAQTb0LLfOjj
	cXRhSrDT9wfxesRm9tbYVSBkm+aBTnMBBgmT51kYYYBRJaqinyk5lRNQfGmv85BofORqtCHHbRlVd
	HsAabibqRTlrTNh0jx0ooP5Kw+7PJ16RTfbJxHM6jI143y21VrNzffSUbYlio7RNYyk4ISotFEEKF
	MNdx67krSpcBvGx5Uiq+zewh1SHkq5VGjP8K1h6JUQytAaGYtZiJo+KDvQtk/aLLGI3kEXU1kEnVk
	sQC1MK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSb9-00000000SOq-44A0;
	Thu, 13 Aug 2026 10:23:43 +0000
Received: from mail-westus2azon11012021.outbound.protection.outlook.com ([52.101.48.21] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSb6-00000000SL9-3aWe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4bIhnEBfLs+DgbHnx5NewWwB+hYLGmjsTgXvTbFWIt9GcYP0TWktn5EpyAV2OzUdOLwMBNW20vnMxJkXYApoKIT1TzhItB+Un/bAzhDWWbY3eYpfRcCh68bsLqEqDv6Ojtbi9/PT/CrBI1ixnNRcJecCkF1oCfX5v1AjdgeCxJABU2bGc/Y7IrrZ5Mzzam3+mED8LKx64BRKYS7tuwOyv7FC5TwQyc2Y8rANkO/Bq/qYW1htkeD1i4vJ8OepEbD7AIUKZM6aIImlDIjdUMlqsv5N0fORLts9TR+zGL//iC/gIeICH1DYjHgHck7M3tSLuk1L1pjQP+eSoEkthauqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRcBAX5gHZTkjKW6bEA60cfRVbw8eYq+BgSG0rpxf04=;
 b=hoK4E7QjQAMITbLyY1akLSusU9FYI07ATe6yh3AAJp3K/dDkhlZJVzc7pRa3BfVa+aBov5E1kO46R5DG/2n+QW8jyiiqirem4UC2z3LP/MWZPWvCwxmN73K/oXIdjsl3u4IuarKHyrbDCzOB6RRJd+F+HO5Jdanu7vVAn00dy2WLpiR/CUklSbo02BO/utvtJNZIAG1m8YpcFYfGkjgtFGdRj/1gAKXa3xdbKZyXG+M77vFg1dMkEBULvxUf1V5Z11HGM34Au+RQPoxOUhdH9H1YLTtt7pp79VYp+dteeNy1JzGOZEZq9FQmwen1xwhnV7+D/u0Zw6y1Y/3WETaY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRcBAX5gHZTkjKW6bEA60cfRVbw8eYq+BgSG0rpxf04=;
 b=WnS4gQ286vJk9FP09lIYK/GAlMJyHmiK6+nQnn7efJU7DFkDYyWC8+gqlTwLOLAaUoIaoRkZ8h+nmYVpY3//J32Pvqr+NaYZ+Qu6czYVRQaZ5g9Z09zfmVTgh06lwpmVRpLUE65wybE1pb3o3KR7hvBJQX3oaZrX/QFe+pm9JC0Li+5k8Z4wFJbp/dMTNCd2S7TfHeni4ugrglsX9HbjOGWPGyLZsLCned8s9PNJ4ZsHM1SW7pdLi56jUgVF2d2mAyQZYfAdkgGiJgDVCWumFmPplDlhPzQcGRHFXmUNJbL3P9QUrIEvB0zxQxt7Q7/ymc8krPADoCjy8nhZznxCkA==
Received: from CH0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:610:cc::21)
 by MW4PR12MB7166.namprd12.prod.outlook.com (2603:10b6:303:224::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 10:23:28 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::2c) by CH0PR03CA0076.outlook.office365.com
 (2603:10b6:610:cc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 10:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 10:23:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 13 Aug
 2026 03:23:13 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Aug
 2026 03:23:11 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: [PATCH 4/8] ARM: dts: aspeed: ampere: Declare SPI NOR flashes on boards
Date: Thu, 13 Aug 2026 19:22:29 +0900
Message-ID: <20260813102233.3088939-5-jackyhuang@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|MW4PR12MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f473a03-375f-46d4-5f6e-08def924ea5d
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 98EGf8VDHK6zRYqDRrSwMgNBBxxF81uNmC9XPNbJsvvo3DXCIE9Kmw6vQpuHreu0MX8XeoYBU/qq6wqfPbLanTdZrz0UlDXQakprP14NXt/WH+2C46Twg4zJCkijELvZdOQHnXMc0tju60S0RCjPpWrHZFgR3WXu44eABWoO726I/sCJbGHBjYbRa7Ql9wmr5JR5/xNNU5iM5Sw6zBuwJUgFca/ZVpu7CIFDg6X8P0p/kKRZPMWx30Jv8EUi1IcukhdMjgos42lOjs+vk+fjUX0MOvpYDFTRNLkSxYmrC/T4Jv7kQgUWsVZYlvA0CLrtdzwtTQ35KrmKPYAb82Mu3GioNrbLTNqAEgl+Fu/ODMqmcfbMn6k4n1YYoXMgXkLQFacp2khUlexfUw6qyZpY8mChCnO34TJEf4ipAUqH4EF8eP1Id2hG4tUWAzRWITSoqlfDZ2IVehKl5rPI5sb8z31CS/mPOsq7UqBhs69jJpMAZYOks1s+iocjtbnx4WSbwin4fTDZm+dNGOO2fw+6bGu7IyK5vnnCdhMGbxi04pG2kuZPE3RIHROe1ajEP7ejJnRoOjJR+AB1M4OMf1tn+pfh3ZmjZgLA5vdHvgMjXxIsCRFLUqQBoSkcyfSMvaq7dAwRMICy/n9TCDL0zR+/TEpXyvBQ25/lSQeoLo1UY9ogQfEW6sgDtCqWz6zjx24fJ32YYd8wjobPGTFqIQisDA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0yiGS5qx/hymgCFsDGjoSjUhDNp8uV+oR0WNjhlSi6oqSQR0PB8rSciZQ+GfaYe/s3ehI4beNdxi+L0Xskiq/b9/0Yo1nWO/lDWSwvqSUxnnSFGYhItQ6aQkcSYY1Q0MrXlYA5MtuTws3+6syc0Lv6DIKWgWNDr8J2Ln8NDpS1N8Mzm04lzgFrYMcdHYbouJTzBUkeaiO7WCPYmrMwDr5sJsMYH2oXr9JcxYyTHWKi1xmRxd6sjXKzoVwdpepMUEBPBo5SKGwAQKBOMJmyGRvoYVrNQyCRtunc5DFpa3kvmrdNivQ6g5YfVNA7sUJQFvuHBJmqzR4XJk2G1zArTsnWJ5wX0yZlIHPgiLMi+0gRy+Qkus1TymJLbdno/kC+41bGR7z29KzID9vec3P31GhGqRO/4ElLsY055do8stOe+VWP5LfP4c1DxzB3Ds7x9Q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:23:27.7760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f473a03-375f-46d4-5f6e-08def924ea5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_032340_899271_2D0B2C97 
X-CRM114-Status: UNSURE (   9.78  )
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

Declare jedec,spi-nor flash nodes with the properties previously
inherited from aspeed-g6.dtsi stubs. Keep status = "okay" so these
boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts    | 9 +++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
index 53b4372f1a08..44332d1ba9f9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
@@ -149,18 +149,24 @@ &mac3 {
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
@@ -171,10 +177,13 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 2b336aa0146d..cd7cd012d295 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -379,18 +379,24 @@ &mac3 {
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
@@ -401,10 +407,13 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
 		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
-- 
2.43.0


