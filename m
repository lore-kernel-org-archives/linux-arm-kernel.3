Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91405C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qrf+cQHv5Vv+z0/Mz71+VHG/Bq7CHBbW0NMXtSbt1xc=; b=jF3JFzmjZkKxmVLiUysDxDsVk5
	WnOHkWwfOfFvEBF+IQiDgAmWlZftlagY40H6CU2eiUwC7SDgc0fqoIS8jVgfQeq14MiVkw5cUayCj
	oW+glz2HDKoe9ydMdoSaaeqCevu9UnhEuFzJdTsn5N/TMpmXb1JaFxk/7TvNWD5OfXOCFi8PErIrs
	OdseJEgABGe1+RHuVHJ6P6wK848iNJWh9OQIq3NFSmS8Yj9oDV/g0qqpUKX7iodHhtZql9SuJ2lQb
	WoNirqrBPwTBJQz/EzzlFeE8HIocVN9WyOxVp454GAuidb+yfFSzaDCWJt9vFguZbgTbxl5t5D0YP
	jDFNrk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKIx-00000002eud-3qLn;
	Mon, 27 Jul 2026 12:19:35 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKIv-00000002eu6-126h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcBx1i6ulJMvZm12Eokbhh+Ut2Bc+sJTFcKcco7jHeiTjDZOiJQTfEeDYDVeBhvASykd5FMHegyA5ui2ziMzFASK3+7MKGtiIMFuvSbr+HwzGN7lghLjnhXPk5ju6Jc8qZMHQkunseay5AugdTYrnkNVrbpBre6ADwtLQKajJ8IFPmu6DHBA21lH+l//0HiAiDLMKBZT6sukIllW51vurbRkJxI7wWtDbfRtDBVKTkgeq3B4cmcv+o+x6YyyRmcLjAdfX/hZpTeydYZ7CLTiwPDKwDFDObV33pzXwKyfIzdO/Zuxkp+YaKcLCmHASuQkkSvyEDKuX410awURCU980w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qrf+cQHv5Vv+z0/Mz71+VHG/Bq7CHBbW0NMXtSbt1xc=;
 b=zVYBY5hmFl/lZdC5jhIZeZIkl6IVnneYTKGZ5yq/X6nwpoMdeCAKEAffHiE8zdlKn267ztIDqJ/4GxA1W3AQTmWo4Le8fwwZuc6wB06czj9oDDOgJOtFd/CJQzIoHyjr2LxwBylI9FiBdodtg/3tU778zf58DIhHrn30y3+sGi9GqAaA9u96WwzOqeqk6PzVlIKlg561Skq/sqbEfbY77CdZ7bC/tFJ3m0RfSJg0gabS/Ni5dq5n6GD3B83C2QIut7u2cpT6vUNMtkUngv77dewxg3bOlJB23OvUtzifRaQjndaVicevkOfkehRB2J8rftM4pjCBxEb8y/mo3N8yAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qrf+cQHv5Vv+z0/Mz71+VHG/Bq7CHBbW0NMXtSbt1xc=;
 b=CdWKYNlBbDFNqVOhJ2a4ClU3YHxt5Q/Gid8G2mJSZbRvlj3EfGooZ2UC6YcVxyqblL1NLeQ0UPDUMUObtQaEJYrmGnNPQnGLHlqPB/TBXkwyF+mgoxNs9k4rKjyrSHkRE4JznBfcmrEojI47JZ0fvcNKlqkj8zStrGt8jYb27vU=
Received: from SJ0PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:33f::30)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 12:19:23 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::3c) by SJ0PR05CA0055.outlook.office365.com
 (2603:10b6:a03:33f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.9 via Frontend Transport; Mon, 27
 Jul 2026 12:19:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 12:19:23 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 07:19:20 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH] arm64: versal-net: Add retention state for cpu idle
Date: Mon, 27 Jul 2026 05:18:42 -0700
Message-ID: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CH2PR12MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0f96c7-6e68-495b-4b73-08deebd94aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 28Sr+1Y/r8jQto9m8VOJy37fRoDa+U2WNPdlmzTAhC2u0spxTsWvPf4xpBnddiRZGc0EwckWeTx3x6+gvc0/alu3yfxsCO71tz5ujnRKBveO6KFOL5gz+GPHD27JJde0k16SfHV9gTB/kvwAmyxVz0BdDPqFNf9DwlfVcV+mY7GVWA07qm8Jy9ixP4kCxQ8/HmGfH1dcxigAIWAE46dlna+CdSsVFUlyb8ESzSRxGu2ZiM8lC7H2/Rmyzn14GFzl/OtgHixSVC2Jgm3FOEhnWRk3mB7UWgIlcyadlOG/vAyf4hGMwDf4ckrIHxQpw4JRt6Oh7LVqYuU+c1O/NJS5hcH+WY+/owWM04FHKN4ZrJrwZ+NwyW8JbEqNjymMcHiYDbraBBdxaLkroFEZ4/M7FMEg9YNb4NqY1ZNmlKaLHVND/FfDSLzW57Mf1ZSGfkm6Iq9FeAj3ZBPmS8jBEYD/XeZfg603WZCEi8Zpjid2UaHg+UVmqaZZAlYBEjn2IqVLlQhaTvvcDqZr7tbHWVLSRhuzC6ZceRfxrrSY1fJJB+49O8mV5hf5Z/YmoJFFrN9uEpf8HS91BYfjkWAHyIBbHyiOyiJu8Zn86Arm1m5EaOTwPXTt37n6vLF050NoQQgpbtajtz9cmHWGVS0S0wkuwoOYuowep69u+x5VrFeGQZoak8kCd7xa8FkE54ZAab8sxfIjJMZjcuSCUHCH+rAxzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p5f/mhxLWjKeBl9iNbAPkzKoRqT8r+ImgssIfsZ9P+7zl1qRVkk0Imsp0734CVuvloeeeMz7o6g/Pq+9jdL2GPTeegWxIU7rzyJrmTa0sWq9vbJmQJUIaummoHdyG4fh8URNWpLtQFMhqvVEzX6kqMeaA40xltcb4Y2v5eO+qYL5102rlYtBrH8faGc5rLaGV/XKjtb3yQ0/CjzDpt695IdJ/UtocYr9dtNmYvW8dj6oULVSAG+EOrpRm5CChQ8uk35n4WIW8wt2tJJBtqIvEh0Ppvf1ccsFh5SBl94k6GxYsQkGtEOOkc6V/Zh7X0cq9XJuvzRbXK02hx5TNWQOQFXXVYvuqycqXQLziWywUHHS0JE2tETCOKRL6Svc//0MorrJGejeQpy6H93Ssfwlvb4UnZbTTbUxMfYeG3WFUzY4dXSRzxtbNtB2C3+1rA6X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 12:19:23.0507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0f96c7-6e68-495b-4b73-08deebd94aff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051933_334787_E1DEA20C 
X-CRM114-Status: GOOD (  14.96  )
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

Remove the sleep state and replace it with a retention state for CPU idle.
The sleep state powers down the CPU core, and the wake-up time cannot be
guaranteed because the firmware may be busy handling other tasks at the time
of the wake-up request. This leads to unpredictable and potentially high
wake-up latency during CPU idle.

Replace the sleep state with a retention state to avoid this dependency on
firmware. The retention state uses a PSCI suspend parameter of 0: the
core simply executes WFI and retains its context without being powered off.
Since wake-up from WFI is handled entirely in hardware, it is effectively
immediate (a few cycles) and does not depend on firmware availability.

As the core is not powered down, the local timer is retained and
"local-timer-stop" is dropped. The entry/exit latency and min-residency
are set to the nominal minimum (1 us), allowing the cpuidle governor to
select the state even for very short idle windows.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 43 +++++++++++-----------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index 15f767608e67..792bed588ae1 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -103,7 +103,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			reg = <0>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -133,7 +133,7 @@ cpu100: cpu@100 {
 			enable-method = "psci";
 			reg = <0x100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -163,7 +163,7 @@ cpu200: cpu@200 {
 			enable-method = "psci";
 			reg = <0x200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -193,7 +193,7 @@ cpu300: cpu@300 {
 			enable-method = "psci";
 			reg = <0x300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -223,7 +223,7 @@ cpu10000: cpu@10000 {
 			enable-method = "psci";
 			reg = <0x10000>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -253,7 +253,7 @@ cpu10100: cpu@10100 {
 			enable-method = "psci";
 			reg = <0x10100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -283,7 +283,7 @@ cpu10200: cpu@10200 {
 			enable-method = "psci";
 			reg = <0x10200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -313,7 +313,7 @@ cpu10300: cpu@10300 {
 			enable-method = "psci";
 			reg = <0x10300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -343,7 +343,7 @@ cpu20000: cpu@20000 {
 			enable-method = "psci";
 			reg = <0x20000>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -373,7 +373,7 @@ cpu20100: cpu@20100 {
 			enable-method = "psci";
 			reg = <0x20100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -403,7 +403,7 @@ cpu20200: cpu@20200 {
 			enable-method = "psci";
 			reg = <0x20200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -433,7 +433,7 @@ cpu20300: cpu@20300 {
 			enable-method = "psci";
 			reg = <0x20300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -463,7 +463,7 @@ cpu30000: cpu@30000 {
 			enable-method = "psci";
 			reg = <0x30000>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -493,7 +493,7 @@ cpu30100: cpu@30100 {
 			enable-method = "psci";
 			reg = <0x30100>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -523,7 +523,7 @@ cpu30200: cpu@30200 {
 			enable-method = "psci";
 			reg = <0x30200>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -553,7 +553,7 @@ cpu30300: cpu@30300 {
 			enable-method = "psci";
 			reg = <0x30300>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-idle-states = <&CPU_SLEEP_0>;
+			cpu-idle-states = <&CPU_RETENTION_0>;
 			d-cache-size = <0x10000>; /* 64kB */
 			d-cache-line-size = <64>;
 			/* 4 ways set associativity */
@@ -636,13 +636,12 @@ llc: l4-cache { /* LLC inside CMN */
 		idle-states {
 			entry-method = "psci";
 
-			CPU_SLEEP_0: cpu-sleep-0 {
+			CPU_RETENTION_0: cpu-retention-0 {
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x40000000>;
-				local-timer-stop;
-				entry-latency-us = <300>;
-				exit-latency-us = <600>;
-				min-residency-us = <10000>;
+				arm,psci-suspend-param = <0>;
+				entry-latency-us = <1>;
+				exit-latency-us = <1>;
+				min-residency-us = <1>;
 			};
 		};
 	};
-- 
2.34.1


