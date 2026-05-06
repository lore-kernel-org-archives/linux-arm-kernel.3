Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D87ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 02:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zMOtIPPU4iAnPDt8+Drfz3OP1ZsA9NGC0YnvHaCH0+w=; b=NRXHBkzHjQySfzy8JNFaHieMn7
	YRzE/aR22jOjXMA6Zd8nwIZLM1FTvhetWRGDELaB/yv5aAUg5rAqGWYxdmJCYTSD+eQMs97JunxKv
	OSRDDZVE5n951dwaybjx54Kp6U50dOr74mRNQBFa7NE71Lo/im1sxV7/a32qGjcCTfeOyd9AF5MKq
	fMCHEpofF+Hr+dRtwsJblRpTJh4kcRuLSeY5q1vchJwK9KeDM3//SD/7ikWBcXtS0Yf500vrIgTkH
	YFKhOlHOsnqzAUl41zxOZkNpf5tAZ6uecnNrKbV+4/IgByKM4gZlvXU9+VDZthtm2LLd2PzAv9T5Q
	g/k5bu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKSNt-00000000YkQ-0EEJ;
	Wed, 06 May 2026 02:53:13 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKSNq-00000000Yjo-3Bj2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 02:53:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKSNvB+MJny4tOquukUQwjq95qrimmGVn/ZD8KcZVXj5P/8hT1f9QDeYS2QCEH4fWapBUsxl7BQ/rebn2UCEYkxrh8pAwznngxTt9kMlLTQRIK5CckbvWRWbFp23HP5p0UuOi+r7adQYKp27FGk59/uUOQcaz/8cDGd1HqXodeyDpENqd3yGbRVDP1op2qMYDhWiLJAGc5xAXqcnQHVYMypuIw5zDDP9oikBgyBo+h9NH1j1jtTm9LGg4YpGnJp764vfWMg0luupSTAJTV+nMcjQBv2ENIRRJh7CXtLYuR9mo2NlZL3ZOweUVPPulYpCLMRKfDj7N/NozcEI2qjqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMOtIPPU4iAnPDt8+Drfz3OP1ZsA9NGC0YnvHaCH0+w=;
 b=cz4DUNjzQMH58Xn7xP3Xc5gWnpMapr0kqAs4IccC2XSpReVI/819CYh1Ymd/uaIpjJ4NE1SLq6nZs3BJP4YJt700+Ks68VlbBfYswcKNijw6er3DJVH3T5vEFSZWJ+syQLVqfHZWb9KQUcaofQucL5NCIfQUb7kCHYDHwvvWWh8swoaXG0xuk7RcLiCURvfGy60f30IKSOJbmuxqNTJ12r2c+XvOGGXfK13JvBzAvHrETCAVWB4im+TmTwOTU3JvSqfIJQ+xW13EUy/l2FjrWWOOJ8BN9NcbHD0DQ2uZ3P0Bqh/WZm6YMuphjRtI87ezBIFgAzm0JLY6c3JwnS4kUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0078.apcprd02.prod.outlook.com (2603:1096:4:90::18) by
 TYQPR06MB8085.apcprd06.prod.outlook.com (2603:1096:405:2f8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Wed, 6 May 2026 02:52:57 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:90:cafe::3) by SG2PR02CA0078.outlook.office365.com
 (2603:1096:4:90::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 02:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 02:52:56 +0000
Received: from local (unknown [172.16.64.130])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B3B0F4115DE1;
	Wed,  6 May 2026 10:52:55 +0800 (CST)
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
Subject: [PATCH v2] arm64: dts: cix: Add SCMI performance domains for CPUFreq on Sky1
Date: Wed,  6 May 2026 10:52:54 +0800
Message-ID: <20260506025254.3602623-1-Devin.Li@cixtech.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYQPR06MB8085:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbaa4028-c7cf-49b0-975f-08deab1a9382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: BjJHD+Lxo6vO5NfLqcT229RSzA5y6DuXnRaT2wP/K+JiJGlwuaA2vV7S6ZV0qx/r6+Xok8jYBcEwgOvhgfrI+ywsqcNfyep9RMi/lkqlaaG9zoDMoNQGLLaVe5vxBovaoHY1k+I3UhS35pLRc6h6149fesK9wPaTNLHAba/QE9BetCj4levGDgcTCGE9/4QUHz7O8gvVVNJrkdxedDGywreXCyE7Eyy6FqjzF3Gb4w9CM0RcQkLhI26JxW8zITxQXNWe67fz2vWAzCg8g5S05DzQHoz+kjGct9GxLuQoBnHf/Tciwu1kCY8KTTDfnLpc2q3keNFy65i15kblsDKhUCh0YDgE3y6tayoGNrgaZSupYIVDj1MYWIB1TlDlrkVmzdJ3PR+glPzhS62tH7Z+OJ9qGt/aV9BUSPqaAFrTKHG5XGeh+Z5t6SSEemS867tYBKLpnTxpLIepm5bdA+yM8DyJPoX6qwJbbGmCFHwL6Q9CHOwneaXdbP+7nZBhwCqe1B9yABCTTobfB4YG797+XXX9jiYCfSVNRe+FFd794aNbk/Db2ELk7TYNt+9r8w5LZ9U2JBjmGY/IFSrDbgKnh8GZHWWLn2M1VML/1rs43PJnXBZjvUaCKzohsGwpA4Haps6FzwjKTClDoA6OT3fBEF4Kd7AbdFGOxRnQKgFTKBeAu8MRLXyGgM6NpgxwCe3mgCB5W4KjWgM8PqioYSjrG7PwhodH5CK6BHnN/h+68AA=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k4mj7Ud6TlPwe4xX19fRBowl6wQ7YZXTBaHE898XQNv/uLBAfqGdMqzd4SiIje+TvHtYazkNkVg1HnHregW6tcWBu+SK8gt2ge/UVFMqhmTV4i6ogZLbMrB88tY1YqZ29odLudodvyFDmKFe7A2jdHOmVQvRSqhdpiG2ssVW3cTf2w7DnwleDFbUegjpDuDV89k4n/+PkdmRmUKtbgjz5AMWOJ9Z42hoczEKt4qIvOmKyTe/NxTwJXE+3oV4qk5i2nlule8bx51jM+bltVyHDtEiEX4UZslclTd+2Qm/WMWFUyCQuUDrpbcPbXAKctUfRBUSIZvmoUOQFwHZuWD+SkDnl7UgLzdo/VlWzWuWckELsCjgIfsyTLq5Sm3xLXw/r3CKf+QOXvwHONRtIbmKKKr8/mQ8IjoCuuKIjF8g2H+C2F2qRjKWRK9K8Ms6lKaP
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 02:52:56.3214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaa4028-c7cf-49b0-975f-08deab1a9382
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_195310_798899_8C1208FC 
X-CRM114-Status: UNSURE (   9.23  )
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

Add SCMI Protocol 13 (Performance) node under ap_to_pm_scmi with
domains.

Define SKY1_PERF_* macros in sky1-power.h for all performance domain
IDs (CPU L/B0/B1/M0/M1, GPU, DSU, NPU, VPU, CI700, NI700), and
wire each CPU node to its corresponding performance domain using
power-domains and power-domain-names properties.

Signed-off-by: Devin Li <Devin.Li@cixtech.com>
---

Notes:
    Change for v2:
    - Use real name format "Devin Li"

 arch/arm64/boot/dts/cix/sky1-power.h | 13 +++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi    | 29 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-power.h b/arch/arm64/boot/dts/cix/sky1-power.h
index 53f4a3af36b3..144567579b71 100644
--- a/arch/arm64/boot/dts/cix/sky1-power.h
+++ b/arch/arm64/boot/dts/cix/sky1-power.h
@@ -30,4 +30,17 @@
 #define SKY1_PD_ISP0		20
 #define SKY1_PD_GPU		21
 
+#define SKY1_PERF_GPU_CORE	0
+#define SKY1_PERF_GPU_TOP	1
+#define SKY1_PERF_CPU_L     2
+#define SKY1_PERF_CPU_B0	3
+#define SKY1_PERF_CPU_B1	4
+#define SKY1_PERF_CPU_M0	5
+#define SKY1_PERF_CPU_M1	6
+#define SKY1_PERF_DSU	    7
+#define SKY1_PERF_NPU	    8
+#define SKY1_PERF_VPU	    9
+#define SKY1_PERF_CI700	    10
+#define SKY1_PERF_NI700	    11
+
 #endif
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0611098b5f05..a77c52296ebd 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -22,6 +22,8 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			reg = <0x0 0x0>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -31,6 +33,8 @@ cpu1: cpu@100 {
 			enable-method = "psci";
 			reg = <0x0 0x100>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -40,6 +44,8 @@ cpu2: cpu@200 {
 			enable-method = "psci";
 			reg = <0x0 0x200>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -49,6 +55,8 @@ cpu3: cpu@300 {
 			enable-method = "psci";
 			reg = <0x0 0x300>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -58,6 +66,8 @@ cpu4: cpu@400 {
 			enable-method = "psci";
 			reg = <0x0 0x400>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -67,6 +77,8 @@ cpu5: cpu@500 {
 			enable-method = "psci";
 			reg = <0x0 0x500>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -76,6 +88,8 @@ cpu6: cpu@600 {
 			enable-method = "psci";
 			reg = <0x0 0x600>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -85,6 +99,8 @@ cpu7: cpu@700 {
 			enable-method = "psci";
 			reg = <0x0 0x700>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -94,6 +110,8 @@ cpu8: cpu@800 {
 			enable-method = "psci";
 			reg = <0x0 0x800>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -103,6 +121,8 @@ cpu9: cpu@900 {
 			enable-method = "psci";
 			reg = <0x0 0x900>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -112,6 +132,8 @@ cpu10: cpu@a00 {
 			enable-method = "psci";
 			reg = <0x0 0xa00>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -121,6 +143,8 @@ cpu11: cpu@b00 {
 			enable-method = "psci";
 			reg = <0x0 0xb00>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -205,6 +229,11 @@ ap_to_pm_scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			scmi_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
-- 
2.49.0


