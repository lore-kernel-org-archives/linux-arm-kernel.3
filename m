Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277CBCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1I6MJJ7eXUYP5Wbgmv+5afjvyAwBbM8Yx7jw2H5YAw=; b=C2XiHLEFxa6DtlYyV/QMyECIJT
	xs6LZcQAQAptxlIjZEsABUuUi0YNk0QtNWir3MztsjDKysjOn2BWfoVkYrtpASg84M3HyxTXMXo6s
	eKcxlfvnQdEIiCCB+lwbCrQ7/QGq4rTV067wwHvMhf9uxdzyTjV1UOodoZJNhHVpI6TAnelRn380/
	/Uxc40ujMoBAl8wz8UTBYnoHM7nIooLsfVQT/WAmQhZJTKa0rJRomKJYX15wAeLjD4CD1/bznHOYE
	CnEtrzjYT/wCHhm32R0smAHJuysIkFfFttzKuVgCn3jPbYToCn36Die1LrGE18lKtfI+R7mT3okDf
	2EQ7RDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsiQ-00000002yfZ-2vdE;
	Thu, 07 May 2026 07:00:10 +0000
Received: from mail-japaneastazon11022079.outbound.protection.outlook.com ([52.101.126.79] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsiP-00000002ye5-0jgj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 07:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX9MiMD7I7iWzLVH1cApjZFHHsq6BoV459AVQeZBGGXpEtHqjSfNmP+iOBiB6d1lbSFy/2UGuQHK0w0ZyCFPTXB7JxPiKwlVDIDXbSjT7HMw7X97U74kVEY8qveyj4xaym9lEVvzHa1LUu4f8j9sZ2GsKj1hUExs6c9wr2UT8I6/OtJA4rSG/DIDFfHcLNNeDVjlXqBs+LlTaXbBGpNsiNiLtsKNdWJo12WfXZ/VUvzlcjV08a0wCq8KV7mJszI5cSzIavayyIoBD3ysaYZjIG3rSALbSYWCTqPRL5FCIaYdBo1sDYJDf251x4EvHCZ49Uef2qEEkGFoYuyb+qWlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1I6MJJ7eXUYP5Wbgmv+5afjvyAwBbM8Yx7jw2H5YAw=;
 b=BoXwhItgHA1+cf51l7ysaSxoAvWzsG1nvf7gK5q1jOInSxNyIPqz2I4AjhbZwP40Vv9BqyWEjfxw5DuQ/Y8oGFIxj0P+r9wzbqisbzXzvCGOfHfbzsG2QV6ridfUUzyNGf3iGwonpd61jpkOpcW4jkew0RIP8tHlUiZFQeH9M+cATfJmQgga05puK45fwOJARwuPn1Mh8nPPazcqlokjq2PQNALMUqEerRWB3inzz35knD4Ll/Vg3tcGh8xqke/jQ5/Rw44Dy+UJzJP8BW4TpKLQeL9Xy6kW8IZzE9qOZhI37LgZcyZz9JHB/ytSV8xP0qfF1eKEIcdl9ll4Fz0F3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0036.apcprd02.prod.outlook.com (2603:1096:4:195::15)
 by SI6PR06MB7218.apcprd06.prod.outlook.com (2603:1096:4:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 07:00:01 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::d3) by SI2PR02CA0036.outlook.office365.com
 (2603:1096:4:195::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 07:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 07:00:00 +0000
Received: from local (unknown [172.16.64.130])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0281040A5A01;
	Thu,  7 May 2026 15:00:00 +0800 (CST)
From: Devin Li <Devin.Li@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cix-kernel-upstream@cixtech.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guoyin.chen@cixtech.com,
	robin.wang@cixtech.com,
	hong.guo@cixtech.com,
	Devin.Li@cixtech.com
Subject: [PATCH v2] arm64: dts: cix: Add CPU idle states for Sky1
Date: Thu,  7 May 2026 14:59:56 +0800
Message-ID: <20260507065956.3900087-1-Devin.Li@cixtech.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SI6PR06MB7218:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e1c666c8-acc5-47d4-22e8-08deac06420b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: GyMfe8pIU8ArdTfPh04X3AwoxqNUd+fAnlRLjMen0rgUCU90s9SOQW5rnN4iS7FicMQjZJWzcIKk3HmjVvP6Feb7nXaTA9NRHqsMI/bTSvrKmMrRQ8pLt8LWCIU3ePGKlAZvRhEoLU0w1MLUyhLg1xpJ2lpMshhTKO7/jPOmNIL7bBaGBL4Zlz5/Wrpse4h3LCzY2306ocXFgo+tkDkT/MCxq5JvdFOvIhzHIsjmBDQdyfmjqgRqm3cPaT468eLJKYWynIZNW0EI7BPSbeE6OtryIXcBbFi4msK6gkmP8nZo1uTydAzSvvLd14UgxPPJwexbXP7t8BS8D7hXEiLNLIFPP7rrF7eXBi2JLn5kKPZPx0vKKBnqmQr7h/1e5J8IdwPc78SCP3NGc1yLlzIi1R4giEYSAAkS+rqNNvngeoGcpHBUyWeCjghsZ5545T8H7kewgxS276P3q+kzEQ7vmhLZsbpn+/kybHIWslRfHAkG/yAC2zUv4hjeF24eaPrywx9NWMZgFa7IfXOQViwXTvu2QGrvtOQB0vyj2/rk6Je+u2dSSvoAQ735FLoRfs1XDIeJYFiLs/MWB7jfWt7RG+x5kbhu+CE33+RbBLYBH6TFcniV0jqbfnQgoM3xQOjX4Z7nwRMZUcduYqGQGxuWiyt/gAPXd1kvCFjgQZRxjQCPeUlXDeBs0DuU2Lip8/lM15DLLc9smGvmh4rPxMIuvVPsRnM+0P5wvjWIOB4h96I=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JD4/PP9PzvNIjt5++fgr7lCDV/FLZlaQefcd6zI4g/qsfdJvuL7MSYnq5KcnTCqZTVd1VxVvRKemER+QTajFMb2r5FsuPzUgC36jcxK+oyCb71x3GCX6u7u3HjlYaxPs58qn8Tt7A+YWyvKBDXSnF7jG/3SVhoVhrGVHn8BiUX0umOLeaqjZVYTVG60ighnbZ73KIlyKCImnT1kIEaWsJ750B2TWLMhWYHwW0QUo3dg4hSGU9qGJhax6QYaWXBvE3VfzhhNzDw24KgqS357NdroAlQAkIIr5JRp50uaLk+JUykHOtey5EfXN/32H/0P01HAw4k8u/6Z/u7yTAmjtCjMqqohHvqQpWDOOMw+dMRS/d2RNMGs4s0H7Kpy2ELq7qdHNgk5InlyhAnARTiYzOnTtK3Fdc6DMRvo+5gG7hrLwmI2FXOxAihtPHMuNcZq0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 07:00:00.9130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c666c8-acc5-47d4-22e8-08deac06420b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_000009_218364_7C20094A 
X-CRM114-Status: UNSURE (   9.34  )
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

Add PSCI-based CPU idle state definitions for the Sky1 SoC,
enabling core and cluster level power management through
ARM PSCI firmware.

Three idle states are defined:

- CPU_SLEEP_0: Core idle state for A520 cores
  (psci-suspend-param 0x0010000), entry-latency 34us,
  exit-latency 100us

- CPU_SLEEP_1: Core idle state for A720 cores
  (psci-suspend-param 0x10000), entry-latency 31us,
  exit-latency 79us

- CLUSTER_SLEEP_0: Cluster idle state shared by all cores
  (psci-suspend-param 0x1010000), entry-latency 41us,
  exit-latency 104us

A520 cores (cpu0-3) reference CPU_SLEEP_0 and CLUSTER_SLEEP_0,
while A720 cores (cpu4-11) reference CPU_SLEEP_1 and
CLUSTER_SLEEP_0.

Signed-off-by: Devin Li <Devin.Li@cixtech.com>
---

Notes:
    Change for v2:
    - Use real name format "Devin Li"
    - link to v1: https://lore.kernel.org/all/20260424043436.162009-1-Devin.Li@cixtech.com/

 arch/arm64/boot/dts/cix/sky1.dtsi | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..0611098b5f05 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -23,6 +23,7 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <403>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu1: cpu@100 {
@@ -31,6 +32,7 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <403>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu2: cpu@200 {
@@ -39,6 +41,7 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <403>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu3: cpu@300 {
@@ -47,6 +50,7 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <403>;
+			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu4: cpu@400 {
@@ -55,6 +59,7 @@ cpu4: cpu@400 {
 			reg = <0x0 0x400>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu5: cpu@500 {
@@ -63,6 +68,7 @@ cpu5: cpu@500 {
 			reg = <0x0 0x500>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu6: cpu@600 {
@@ -71,6 +77,7 @@ cpu6: cpu@600 {
 			reg = <0x0 0x600>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu7: cpu@700 {
@@ -79,6 +86,7 @@ cpu7: cpu@700 {
 			reg = <0x0 0x700>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu8: cpu@800 {
@@ -87,6 +95,7 @@ cpu8: cpu@800 {
 			reg = <0x0 0x800>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu9: cpu@900 {
@@ -95,6 +104,7 @@ cpu9: cpu@900 {
 			reg = <0x0 0x900>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu10: cpu@a00 {
@@ -103,6 +113,7 @@ cpu10: cpu@a00 {
 			reg = <0x0 0xa00>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu11: cpu@b00 {
@@ -111,6 +122,7 @@ cpu11: cpu@b00 {
 			reg = <0x0 0xb00>;
 			device_type = "cpu";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
 
 		cpu-map {
@@ -153,6 +165,35 @@ core11 {
 				};
 			};
 		};
+
+		idle-states {
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <34>;
+				exit-latency-us = <100>;
+				min-residency-us = <3000>;
+			};
+
+			CPU_SLEEP_1: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <31>;
+				exit-latency-us = <79>;
+				min-residency-us = <3000>;
+			};
+
+			CLUSTER_SLEEP_0: cluster-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x1010000>;
+				local-timer-stop;
+				entry-latency-us = <41>;
+				exit-latency-us = <104>;
+				min-residency-us = <4000>;
+			};
+		};
 	};
 
 	firmware {
-- 
2.49.0


