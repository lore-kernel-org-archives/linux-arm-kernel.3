Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51971CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Dy1Pfsk1SvWncy2BC7FHFnn0B/Q5qZ/WJ2dLv4i64U=; b=yLp47QDupsF4RZ2QYWHnc1puoR
	c5xzMvAlhLGsWSloSvriQ+B711KM2Pd2jZGGMnBMitVP/zd+bhin0nh7z4brrGVdhD+EHozWgQSdD
	lA245dcQIoN7ag9HdDUvqUYMyQnNmAMzihl5lDshRAP0pgQotAE8yR7O4/KqqvVokZcNYp5U9ISR8
	J76cEXCRtus6VhOVbOECcW6eNKWMWlDjaatBr2RVypvqf7PuswaSYxl9Q/NXP7xdHgqJLoA2okO27
	UjY3lRJOuqIX2dz4lWYPIOmM3/ZeGKRDHz0O73eyVMubkSc/GrlGJG3Oxg3nmsSW14ziiszQzB3tW
	JSrEzHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQdg-00000002Qv7-1v6M;
	Wed, 07 Oct 2026 12:20:52 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQdd-00000002QuT-3WDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8V3/q0dYRGmvZO+ZPr33zNi/rBVIYwr3FyazFWkomfv5bKK6jkFiOset3lGP5AkBRO+f/UWV4iacHpq7rmvHtOHsZM0EP0so+serDVLtHfqbGr2MRj1I7LAIVORFD0Q8F5eZkoJggs4+A9/sIxr3GShaU6djzSFkDh7xHL0cmNKEicklGMNcNsmfvNR/aUaQdz0sp701SUbYNapGgO2MlXwErls3MpxSrtOCBW+VOZDWKWe8MGZH6oGVxZEerG1pKJ3679tqumr8ZCm9DT97L/pyrj4FTzacT9VHYP9YOLJCAiECt0HsteeWHc0zQxMOhstg+fHzNey893UNS91Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dy1Pfsk1SvWncy2BC7FHFnn0B/Q5qZ/WJ2dLv4i64U=;
 b=MDuX3rlC4GGOVNih1iZQENjPlAtbiTBp067B86iCbjXmXNmEfMPoypwMK351+HzbcJZ2yTzdeSmF60RsYdSq/0osQaKpB68DzqzTmw3f7Ot5hH18KcOgf+qgz1U6v8PPylTLXGWWYLNmFlMK5AoRLPsSbkmPik3O9AZnPG+WfI3MY2shl/YqEqkQBQ5i60a4PVe0Mjd5uKs/YR3+ZsQW0ZIOX0A9Nn7aBQCe2Rfo2bM+UuwemXz1ApULe2LvtaR1ju2NCB+LYJtbmIIFlE4NCVrVy6/MT/g0r6J6b7kiTNHUHDozqhnnPOgU6PHtZKhie3y+xQVqv3gB1I4JofaXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microsoft.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Dy1Pfsk1SvWncy2BC7FHFnn0B/Q5qZ/WJ2dLv4i64U=;
 b=oyAKxouT4CD8G09vI7L2QkJUFSIR3sCRJIz5V0EVP+sA05AmNnSATl6Woi7K0Be6BalHPEaoIEAzbnJlTo+u89RmaHTuWX4upmJBFNit049BwVDp17+7SOlKb4J7dVb9VPsZVB8m6V8g6NhUGd8+ztYPq4Kcp10bRAY0AZjKgws=
Received: from DS7PR05CA0014.namprd05.prod.outlook.com (2603:10b6:5:3b9::19)
 by CH3PR12MB8353.namprd12.prod.outlook.com (2603:10b6:610:12c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 7 Oct
 2026 12:20:38 +0000
Received: from CY5PEPF00000E7A.namprd02.prod.outlook.com
 (2603:10b6:5:3b9:cafe::12) by DS7PR05CA0014.outlook.office365.com
 (2603:10b6:5:3b9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 12:20:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E7A.mail.protection.outlook.com (10.167.247.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 12:20:37 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 07:20:34 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <git@amd.com>, <ptsm@microsoft.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<sven@kernel.org>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: xilinx: versal-net: Remove CPU idle states
Date: Wed, 7 Oct 2026 05:19:32 -0700
Message-ID: <b9213a36eb1d28f3e7b8610592c085f627f5c7cf.1791374721.git.jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
References: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7A:EE_|CH3PR12MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 88307661-cb89-4406-bbfa-08df246d6550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eH+OJVa3m5EZnUo9M0LaiX65I4OcPda6+iK3TwtKXsNf+33rkR3k/tRpuE9XJV+Vy5WfT28itMrNQnat0kp7PwgB7UDGptnitFR0MgcCthnpdcZeIUztRmJ/2dLTF2fj6eCYCClZqs+qvykgG/JmNu0ugkkytlCS7YG5k5uyUztH4q+X4ucGmOtZ48rPNS+vL3QL+KwqQkyWnjXTjbO/c0H9iS6HDJTB0OmC0gOrBIPjHxhWJVf2XmZTtu2rGrsDcKgeff+pfcazQZRxrWDurSYRshwq6B3iaxxgsffTBC4VOcgP2NKEWBrcOgAyMK58FVGlC9IG5NYIwdjfxRpXxiNBxkp+uZdZJp86HbtzEeyRPpWSUYbm33NpAquqU9NuiOccMdrZSAFRDkCxJDrOs/qdQw12oQUJU0tcYnpN7kKzdBWFl9dIw/5JJmsMgodJtfE0iG3uP4Pjt9nX/ip+hNtjy9pOHFEvWS6n6oe/f5xbiW/AeGc1YZ0Bmr+0ZIHhll5pocHYOCKRqqwCpCPdpUapwpUIQkL8WqjUJQFC32J/R0ulTuAmnyu7mh0MfFEL4oU+6U+iUSBlXaLxUC75GGiBRXiLL1YSpBAH5Au1kTObud+mzs2z/UHe5RpQ2RtyE3ajjBgoL2preGbSAO0g7+g7pKG+zkMuJJ89O/VFuuxNyzaBwrmeUfzQ3AUYqU24W3fJ0mLMoe5VFLfqUekQ2g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Q6CrhFXJVxKTmGcVR6EcG/AnPCSelhbPxHAmM6jiUO/A1Yu2nOY+NZdjjHn8lenPmuUQiImsEwK1PrsgPVO+fGuyBN//Nv1W06ALzzGMuX1tqk+WytOKVGWOpxvPU6nYCaJ77GNcfAH/g5o0AGWSoJA3MzJytdWH6T75mu118Dc0j4Vab3C7pihci86sIECd6RAlN8rpTQkpmsdVrpwgy0cWnBNAQVBP8PZ24PLWE7sjbveMMS8p48EN/oqrgo5nyGeGlieyz/rxryF05kUHvpGpzfLggNfVuLVPwj42BXuoJGZCD5tm482q++62H8AWGEPLjN8mdGRYRBUkhYyv0GmPIhZPaR/8tB1FOxjtSuHLpKI9jdhI4K+xwoV+gifIJFCtKmnFghw41jI9v1M2euPmq0TETa48A1A4KbdDzfbYbXtkTcLM1xucFwn0SlLl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:20:37.8843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88307661-cb89-4406-bbfa-08df246d6550
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY5PEPF00000E7A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_052050_028024_8407EE46 
X-CRM114-Status: GOOD (  14.11  )
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

The sleep state powers down the CPU core, and the wake-up time cannot be
guaranteed because the firmware may be busy handling other tasks at the
time of the wake-up request. This leads to unpredictable and potentially
high wake-up latency during CPU idle.

Remove the sleep state to avoid this dependency on firmware. The default
backend CPU idle state simply puts core in WFI and retains its context
without being powered off. Since wake-up from WFI is handled entirely in
hardware, it is effectively immediate (a few cycles) and does not depend
on firmware availability.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
Changes in v2:
- Remove the idle state instead of replacing it with a retention state.
- Update the subject and commit description.

Link to v1: https://lore.kernel.org/all/20260727121842.3410495-1-jay.buddhabhatti@amd.com/
---
 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 29 ----------------------
 1 file changed, 29 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index 21bb917bcba1..9b74e59fd64a 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -103,7 +103,6 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			reg = <0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -133,7 +132,6 @@ cpu100: cpu@100 {
 			enable-method = "psci";
 			reg = <0x100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -163,7 +161,6 @@ cpu200: cpu@200 {
 			enable-method = "psci";
 			reg = <0x200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -193,7 +190,6 @@ cpu300: cpu@300 {
 			enable-method = "psci";
 			reg = <0x300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -223,7 +219,6 @@ cpu10000: cpu@10000 {
 			enable-method = "psci";
 			reg = <0x10000>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -253,7 +248,6 @@ cpu10100: cpu@10100 {
 			enable-method = "psci";
 			reg = <0x10100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -283,7 +277,6 @@ cpu10200: cpu@10200 {
 			enable-method = "psci";
 			reg = <0x10200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -313,7 +306,6 @@ cpu10300: cpu@10300 {
 			enable-method = "psci";
 			reg = <0x10300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -343,7 +335,6 @@ cpu20000: cpu@20000 {
 			enable-method = "psci";
 			reg = <0x20000>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -373,7 +364,6 @@ cpu20100: cpu@20100 {
 			enable-method = "psci";
 			reg = <0x20100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -403,7 +393,6 @@ cpu20200: cpu@20200 {
 			enable-method = "psci";
 			reg = <0x20200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -433,7 +422,6 @@ cpu20300: cpu@20300 {
 			enable-method = "psci";
 			reg = <0x20300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -463,7 +451,6 @@ cpu30000: cpu@30000 {
 			enable-method = "psci";
 			reg = <0x30000>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -493,7 +480,6 @@ cpu30100: cpu@30100 {
 			enable-method = "psci";
 			reg = <0x30100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -523,7 +509,6 @@ cpu30200: cpu@30200 {
 			enable-method = "psci";
 			reg = <0x30200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -553,7 +538,6 @@ cpu30300: cpu@30300 {
 			enable-method = "psci";
 			reg = <0x30300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -632,19 +616,6 @@ llc: l4-cache { /* LLC inside CMN */
 			cache-size = <0x1000000>; /* 16MB */
 			cache-unified;
 		};
-
-		idle-states {
-			entry-method = "psci";
-
-			CPU_SLEEP_0: cpu-sleep-0 {
-				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x40000000>;
-				local-timer-stop;
-				entry-latency-us = <300>;
-				exit-latency-us = <600>;
-				min-residency-us = <10000>;
-			};
-		};
 	};
 
 	cpu_opp_table: opp-table {
-- 
2.34.1


