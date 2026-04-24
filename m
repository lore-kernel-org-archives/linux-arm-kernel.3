Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B40FB44A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 04:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pxgxQyyKWqZBx7IdmmZQX+12pRTGINVK28rje9OnCZM=; b=qS6bjQ0dvyxpxNOV/F3Skw2XaT
	4LHaF/aLubC6YAsLIXwzEOWhVKYRsarJdRtg1BVKExAOxsG/lWO26AIzC12ZfPPZp0IZn939WZ6iC
	JSpCGyRkwfwPMml95eu/2Iww+A8LXHf95klcGV/3tXmzRXLty92b06+BhjFNWskTazKMGlhfgvvbg
	J0G5cEAa2PdhVngRvHsdR9cqklv+/WtavKUsdQ8C9u7vDWV0b663DlrkBMouB4aTzbv/SjRA6QmL2
	sGp6KUE1e+qPhqUMb8IqIJc7AG7Er+3h/E+f5OSc5wXn2SsBQP+Yuc7lmy57SayvCaZySdW+Mb1er
	nkQJsuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG8HI-0000000Cdrw-3gpk;
	Fri, 24 Apr 2026 04:36:33 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG8HG-0000000CdrX-1U08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 04:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFR36WgZF4m2eDEZKB7tQuGlAnIxGlMCrULGNQn2cTOvlNpGZTfaH5L2oFky18VhlwTpmtwkGBpNOqchv8nlpuSqEB8z1k6iR9ryI63njI+gTlZFqw0U3vwn8X3Fc6EcdFN9KdmZzqOPunBgKe+bkzCIBOdCUWzZYS0diP2x/nggWLkNxXCPBG9rSdJgiRee1SNz0DDMXa/BkXydYnKHbAob28coER4fKhBWK5FzrsSIaVqyG7UgvaQMCzRzK+PZaOtQmsjLU0yaZOmKLQ6q+G43iOHxce6N9NwWJ0WaopNpArDwlE2aETr6BH0A30COtRMHQfPxIbY1R5yZ9wR+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxgxQyyKWqZBx7IdmmZQX+12pRTGINVK28rje9OnCZM=;
 b=bMKq3pCJG+D6w3CpX4bEVnvGG+uQZ7Pj6TQOjqbGs/OP/Z3fnqvU8NEC743res1jdOibtfAGvWCL3Wru8fQf2z3b72g4kU6S0tXcsx4nMlsMU5FkzgaJetRtsanATZCZTDrPckH25AFTEW9cxn+gcZPaLavOvTPtItY8c7lqDngQZ7T6UEaG/UjizvYblbLpTcqOuTv4c6cT5xSgVKzxclq4FMCNayFAAjbsz3t8R6mv7L5ZC83+mF+dYd10VOYyYJGI6e6dp7dBJE5Adc4fYYzKi7/2hrcUfXP0Vw2DiWRNtAhC4/0ZMyY00PMGKZNRSqTvqhrbccgG3rc4SymOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS0PR01CA0150.jpnprd01.prod.outlook.com (2603:1096:604:27::25)
 by KU4PR06MB8411.apcprd06.prod.outlook.com (2603:1096:d10:7c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 04:36:03 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:604:27:cafe::66) by OS0PR01CA0150.outlook.office365.com
 (2603:1096:604:27::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 04:36:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 04:36:02 +0000
Received: from local (unknown [172.16.64.130])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C0E5942D9460;
	Fri, 24 Apr 2026 12:36:01 +0800 (CST)
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
Subject: [PATCH v1] arm64: dts: cix: Add CPU idle states for Sky1
Date: Fri, 24 Apr 2026 12:34:36 +0800
Message-ID: <20260424043436.162009-1-Devin.Li@cixtech.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KU4PR06MB8411:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 82b3b829-b132-43a1-73a8-08dea1bafdf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: hI6S1LUloO6ukXxGXj3aeiyIu5oV7MX+ENLI3167lhNT9CEAlB/0rrBhIwGoKLt/EJ5Orv9BDD5l9nFA64cSfmbRKHXcfggtvITCEyfDCVZoxSkm7iKREYWx1X8a+U3xCrk9eJHLGlNgTyUzAdi/J89Wv1Npq9aitoi8tov647bdFLOJs7cXZ3hKh5SRRCS10KN3dGoT3WbbjPF6UKDcvvwZBfvXWN2uC98RdT2EyhE4dtZaJLGx5NgI1bHEkXIHEs0M/Fy76fq7GN4fWGlv9o5sXbkUm8X2qsmaHHx5ffguyPNFvnWpHB5AkqFEAVt0dXOKks11ibbwQeI6DjetoxG0AgQTyOHIWLuHEJhN7OhQbrVz3RGB7MTV0Ow6/kBKVIdOtGZ6BHezus3uU8RMyI9IXIPVrMEtcWv/S3Gl8+efwd3hr3VAEwDYYlW+UlJ15FzqbPU7j5WBXIHb23vC+cbZRJTwhit63/HRu7IpMx6gq2xOQ3GE5eTlEqw0SpsTGjSCGraIXHj7ZX4+AINROYKZz7vE5/GNJafVwOUIwqk8exoFkEvPeBfAQEOUVobz/YSqkD1n4amvPQ2QEp5zxALI3ZYHhqI6/cinV7+6qjjX6aQz++R51fc+UgZntcWd05E6YnlANe0L8ml4W/vjjbvJDXGodBake5tIN+ccyq5oTX/i1TKqa6Qe4IVnCG9SP+qsZqWdcdjZ0yvIBFO+Wvf3MjRO6V1IVU/YuS/Wu2bZT8OiHPuZSRzeJkoKaG+BY3PH9M2MbTFqD0Ew6bBssQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k4e6ER95WTxYrosmFjbDBNMK3vR7E5ycKJFCymtF3wvHzFSu0LSUduvJ6LrR66/znPdb1f4luQUFbMY/4gmo0GSIdzhdmBINsbL7qXUJS/D0PW9Zvtq2ZGEXWsVjh1VG+5HedE9QAtzI2XnOUCoK4Y0yUqAi6kYxyR2YTmwBGDwoGcd2lnAkSJICuihfOJ/hBjaSpr54NnVAkipCNZSfpwJ50ccQWGbflxPZ04k+IF2Tvd12+5iXRLwCbIhbVixoHTwIwCHfc1hMdC/JctYhL67aaoOKud0a5Y0uoInFKNsOZMiyNsFeLPA8TS2+2oGTTykciamY9GZfZd0C1DT6z34PRBIE91M25hMXYb8hT1pYHJNaaI/L+iGSdXnl9wyiQo+mEfpfEmVsMc8DYKvDUwTUAqrlBGjaYhMgbk4becHzJMP1MnUdrfbCncXGc/n0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 04:36:02.6656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b3b829-b132-43a1-73a8-08dea1bafdf0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_213630_400473_B2D12649 
X-CRM114-Status: UNSURE (   8.32  )
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

From: "devin.li" <Devin.Li@cixtech.com>

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

Signed-off-by: devin.li <Devin.Li@cixtech.com>
---
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


