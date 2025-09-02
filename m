Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC923CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQW3/aY2u9o1vyBBGFhdfMivnRKVOreRPGLjsgiFn70=; b=tkH0O0IQA5M09lQZWXVZJPIjib
	BunMihjW0Mhz2WU85otpheqwsT+X/8aD7qoBwVa0/MfOcYe6oqbI/M9YeQ9g8nQejoP2063FEonRN
	tUrpya10HDqyYQyxJfxQz9UqfOLY6Eo1IlZ9R9RdIhT5A6fGNC9asKsIp2oK7ttRSDVB+vuuI4dIx
	lRhStfYfvOfrgXFbnyUZ3p1l2mFWY5/Rx4bi1K13pcoLlj2niu8K0UfSCHczNaeEPW3s0TkRQ5F0Q
	BxZqWaNBzj6dfH375DHNPTr8mBQshs9BcjGk3HLXZlxnctJqdDOVTOwQFSjslHV4xgNDMpG68xcOB
	9w5OICiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmC-00000002Akc-1NY3;
	Tue, 02 Sep 2025 21:42:52 +0000
Received: from mail-dm6nam11on20627.outbound.protection.outlook.com ([2a01:111:f403:2415::627] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSY1-00000000YvU-1cWO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jbf8wdE+eXTaMum8nFxu5OJ8IWlApWDZuet1tYezbXEQGjR1dIzwtLMz4QVW1MfzqCmgnP0U5tWu0E4BsNwlzKxU/141BHBJWJkfJb2FsQceRqE3gmMw2bELCIdEj9KFib3OSipKIBqpI6MdDfgLjukPhj1OYrCQX3wNOwAAbR+QHo64451iCRqbeI8cSCZ2jXot5+OSsuxaD1GDKI+SAAPnoktP6m8diYOIezYSFLAXQmISh7yi7My5EkK5lw/fkVwyqIYYge4c+nItEJMrx7Oa8YAW6MM3T+gmKVRq1QvZJWJXn33es9NXfvSk3R2PsK8Qh8oYGySR8+AB41mNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQW3/aY2u9o1vyBBGFhdfMivnRKVOreRPGLjsgiFn70=;
 b=fiLZsmXkWHGDojZY+8rrH0+DNTMiktJrjJVunxqjrc6TUPzwVA6Ei7cofaoLNVdqM9ktx/tcIOE2XFEdv1hS0oBQZroUXh+W02wNVQLSyN8g/inCYoCaiZQVGvoD4X61w8LuUkWMoTEK10t7lBQhRNRQ0ICYUZ9yzl/r0oSqYt1eBCvYMUqEntEn34PDPZCNN/Uc8AE8FCY676h3FCS5YXv47WljOGjwVmOMSVJ3dY019+ryKwQn5JSr57VoUozxWoIHjt6Z2vwnNw2C8Y97N1zPu6+zTkbA1uxI5NfNzHeAPY6VfSXk3vtAGoE/lVQXtRyLQM7+TfOhHjz+GTFOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQW3/aY2u9o1vyBBGFhdfMivnRKVOreRPGLjsgiFn70=;
 b=BdDt7jYlGu2TjPTLdwfsYhRgDdqsj8SrYzlS1Esv6x/qAwBjzfu3wFtWibfVZxlue4+16CTIjXxNJcbs5XwflMK/VSpiOxqWmQlFwQxSt/XkmRsfokr3HSWzJPiuDIKeLU9uQmY+Us002VOmxqAen+iejD7S6Zk09ph4M0Yl0WE=
Received: from MW4PR04CA0349.namprd04.prod.outlook.com (2603:10b6:303:8a::24)
 by SN7PR12MB7274.namprd12.prod.outlook.com (2603:10b6:806:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Tue, 2 Sep
 2025 15:03:39 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::b2) by MW4PR04CA0349.outlook.office365.com
 (2603:10b6:303:8a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 15:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 15:03:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 10:03:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 10:03:24 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 10:03:23 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: versal-net: Describe L2/L3/LLC caches
Date: Tue, 2 Sep 2025 17:03:10 +0200
Message-ID: <f2ee23526349a0674149c969a2176c906e529402.1756825388.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11258; i=michal.simek@amd.com; h=from:subject:message-id; bh=ewz4w44qG8bsdtiUORF3cJqFxzCzReNDxhy/WSoGmhg=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRsZzeouOXzuZ7lXbOC2aF/Diypp5QDp6za4a/swlG89 P6TZTtmdpSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEuk4yMjTvZQ1t2lE0p0ZS ap+kwMtDf66/bTpZsn3r0o2OBiwnxM4x/GY3OMUYnp1WnTDB+sdFQ1WfTJ83jk8EpT/Pj5t0sHF yNTcA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SN7PR12MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c063834-9419-4146-dd5d-08ddea31e626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4osb2w2oWeBQzTdJZRGwDo/egoQutaEdXrhTohYEhohtlleplM8xAF5U0VWX?=
 =?us-ascii?Q?aCv93HeFGCUrU4hBT9f4WQGrze/aVCraB+JghDXsrNNVtWeWyyRFgJWYT3gn?=
 =?us-ascii?Q?4CCOa9Ch3UhfLGLQbPdjXtGo05LgqXb86pAWa3zFnypI2NbsHnIfFo+neunA?=
 =?us-ascii?Q?cO/zw8k6OaJ+2GyxgpFdN9enIBw0yfvwKH4Zn/dtVrqH5ReuP/K1nstEjWLA?=
 =?us-ascii?Q?tqJz7R9CCATvaWDMUDxb0Q1S3DCT3k5V+wkQzgZnGMFXiLforRlCjCHIMwnh?=
 =?us-ascii?Q?kSts5C7vKGsahJOeInM2kgUFplHJtxdjqgkFLd0uTRvZbIN7hQMepyN51dQm?=
 =?us-ascii?Q?41+yf+0IMDpi+tXiaZpSPNQIKyqQfhcgH7g2O1xd18/5cl5FBSwnxYgPG794?=
 =?us-ascii?Q?KqgrixzIR8FwqiVTb9dZixXUTZRbbUOM66C58StrWxgj2WY1oEvYJGdS7P80?=
 =?us-ascii?Q?M/Bw38nixuNimvT/ryJvAOn+rYfyymTuWCaIcvkXv96hZEbektDeFhAQ8IYx?=
 =?us-ascii?Q?uoLuKEEBFh2/RqhPx81LBi8h0bCqvoCfNdE43OGYna7d05iJ5dmj4JTyk29j?=
 =?us-ascii?Q?s1zOT2jiFZL6Azn0hHOKZPKg5+FlVztgsrSaupKCijJzV3MkirnUvBFhrCDT?=
 =?us-ascii?Q?20s1VOGDGzQG4xCSW1TaeUgzWIzaRphrvDyX6UB1gFlx7N4JCPPbCwqTVVSc?=
 =?us-ascii?Q?NELJLa9bF6NToaJKAxciEJGPlcGM12EXf1TXABH58OcMyt8P+FTxx0iZ2Svq?=
 =?us-ascii?Q?OBGozYVm9DIWjVi4ffFDGQ82dmdE4kh6cbSZ+uqFkKlhSHyrbPviavh/snQq?=
 =?us-ascii?Q?taCPFsUy4OwoW0g1YLzy0EOXE1nRxZo23fpizEVdi2Vgbw1VwK1NE/gZQjvF?=
 =?us-ascii?Q?P6YBPkTNLcwxeQ4cS3Z1dMhRJ2rVxJOkAel5QCFcwCKbZvlcHlC53A8ClTey?=
 =?us-ascii?Q?/hXifz+JMWv49RGuA3LtI3/fSdjR2tv9/0It1tXiGOMYiSvGqCVWgubJ9FmK?=
 =?us-ascii?Q?HNrkpY6zzyQn7H+/qr5rzT8Swc3ZccW0+e4o4q291YBcQJ0zuLA+YpzT0Jar?=
 =?us-ascii?Q?xYhOlLOy19az3nq2W+CY17F5ziVJGLZv3/Tkb8VFk9EqtnWVdDYWZjmFtmyi?=
 =?us-ascii?Q?vbVK/OWI4rija0qhpmjsNV5Fjb/XsP4KVj/ctP+ayUk+gXqYpRroZsQKE65d?=
 =?us-ascii?Q?lfmhigmBhC18yz+L8Vt6LhNlV78ER52tU+43nq/XT/CnOlB0TDUCfvZKoBgj?=
 =?us-ascii?Q?FqxhnbI6Y4Rr+M+8aWRioWbbrh4QyDG8Jq8U7pQI96shUFyFtz2xVuKL6+e1?=
 =?us-ascii?Q?Lz0+cxXI4suAfcRVy88llAu44uBE9UVNqK+YNecIeRTzy/FQ457SOicAIR+o?=
 =?us-ascii?Q?1eV/68YCCcBd/fcz+LDiEFUqehqSHwf4KGjaQzwLDv2kGrzwJL+tPX3INQ0a?=
 =?us-ascii?Q?K7fgXBJGaoq2f7SqOAoo7F5uOoI4pa4gE9xfiFGVKfEOOaIdGZY3xDznZ5VH?=
 =?us-ascii?Q?KelYk1xpuXH441k94owbxqldwCwj6rzzNd2t?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 15:03:39.0731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c063834-9419-4146-dd5d-08ddea31e626
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_080349_779870_ED6E00C7 
X-CRM114-Status: GOOD (  10.30  )
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

Add missing cache layout description.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 248 +++++++++++++++++++++
 1 file changed, 248 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index c037a7819967..62861138c8f4 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -104,6 +104,18 @@ cpu0: cpu@0 {
 			reg = <0>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_00>;
+			l2_00: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
 		};
 		cpu100: cpu@100 {
 			compatible = "arm,cortex-a78";
@@ -112,6 +124,18 @@ cpu100: cpu@100 {
 			reg = <0x100>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_01>;
+			l2_01: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
 		};
 		cpu200: cpu@200 {
 			compatible = "arm,cortex-a78";
@@ -120,6 +144,18 @@ cpu200: cpu@200 {
 			reg = <0x200>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_02>;
+			l2_02: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
 		};
 		cpu300: cpu@300 {
 			compatible = "arm,cortex-a78";
@@ -128,6 +164,18 @@ cpu300: cpu@300 {
 			reg = <0x300>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_03>;
+			l2_03: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
 		};
 		cpu10000: cpu@10000 {
 			compatible = "arm,cortex-a78";
@@ -136,6 +184,18 @@ cpu10000: cpu@10000 {
 			reg = <0x10000>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_10>;
+			l2_10: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_1>;
+			};
 		};
 		cpu10100: cpu@10100 {
 			compatible = "arm,cortex-a78";
@@ -144,6 +204,18 @@ cpu10100: cpu@10100 {
 			reg = <0x10100>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_11>;
+			l2_11: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_1>;
+			};
 		};
 		cpu10200: cpu@10200 {
 			compatible = "arm,cortex-a78";
@@ -152,6 +224,18 @@ cpu10200: cpu@10200 {
 			reg = <0x10200>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_12>;
+			l2_12: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_1>;
+			};
 		};
 		cpu10300: cpu@10300 {
 			compatible = "arm,cortex-a78";
@@ -160,6 +244,18 @@ cpu10300: cpu@10300 {
 			reg = <0x10300>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_13>;
+			l2_13: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_1>;
+			};
 		};
 		cpu20000: cpu@20000 {
 			compatible = "arm,cortex-a78";
@@ -168,6 +264,18 @@ cpu20000: cpu@20000 {
 			reg = <0x20000>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_20>;
+			l2_20: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_2>;
+			};
 		};
 		cpu20100: cpu@20100 {
 			compatible = "arm,cortex-a78";
@@ -176,6 +284,18 @@ cpu20100: cpu@20100 {
 			reg = <0x20100>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_21>;
+			l2_21: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_2>;
+			};
 		};
 		cpu20200: cpu@20200 {
 			compatible = "arm,cortex-a78";
@@ -184,6 +304,18 @@ cpu20200: cpu@20200 {
 			reg = <0x20200>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_22>;
+			l2_22: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_2>;
+			};
 		};
 		cpu20300: cpu@20300 {
 			compatible = "arm,cortex-a78";
@@ -192,6 +324,18 @@ cpu20300: cpu@20300 {
 			reg = <0x20300>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_23>;
+			l2_23: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_2>;
+			};
 		};
 		cpu30000: cpu@30000 {
 			compatible = "arm,cortex-a78";
@@ -200,6 +344,18 @@ cpu30000: cpu@30000 {
 			reg = <0x30000>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_30>;
+			l2_30: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_3>;
+			};
 		};
 		cpu30100: cpu@30100 {
 			compatible = "arm,cortex-a78";
@@ -208,6 +364,18 @@ cpu30100: cpu@30100 {
 			reg = <0x30100>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_31>;
+			l2_31: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_3>;
+			};
 		};
 		cpu30200: cpu@30200 {
 			compatible = "arm,cortex-a78";
@@ -216,6 +384,18 @@ cpu30200: cpu@30200 {
 			reg = <0x30200>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_32>;
+			l2_32: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_3>;
+			};
 		};
 		cpu30300: cpu@30300 {
 			compatible = "arm,cortex-a78";
@@ -224,7 +404,75 @@ cpu30300: cpu@30300 {
 			reg = <0x30300>;
 			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			next-level-cache = <&l2_33>;
+			l2_33: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>; /* 512kB */
+				cache-line-size = <64>;
+				/* 8 ways set associativity */
+				/* cache_size / (line_size/associativity) */
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&l3_3>;
+			};
+		};
+
+		l3_0: l3-0-cache { /* cluster private */
+			compatible = "cache";
+			cache-level = <3>;
+			cache-size = <0x200000>; /* 2MB */
+			cache-line-size = <64>;
+			/* 16 ways set associativity */
+			/* cache_size / (line_size/associativity) */
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&llc>;
+		};
+
+		l3_1: l3-1-cache { /* cluster private */
+			compatible = "cache";
+			cache-level = <3>;
+			cache-size = <0x200000>; /* 2MB */
+			cache-line-size = <64>;
+			/* 16 ways set associativity */
+			/* cache_size / (line_size/associativity) */
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&llc>;
+		};
+
+		l3_2: l3-2-cache { /* cluster private */
+			compatible = "cache";
+			cache-level = <3>;
+			cache-size = <0x200000>; /* 2MB */
+			cache-line-size = <64>;
+			/* 16 ways set associativity */
+			/* cache_size / (line_size/associativity) */
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&llc>;
+		};
+
+		l3_3: l3-3-cache { /* cluster private */
+			compatible = "cache";
+			cache-level = <3>;
+			cache-size = <0x200000>; /* 2MB */
+			cache-line-size = <64>;
+			/* 16 ways set associativity */
+			/* cache_size / (line_size/associativity) */
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&llc>;
+		};
+
+		llc: l4-cache { /* LLC inside CMN */
+			compatible = "cache";
+			cache-level = <4>;
+			cache-size = <0x1000000>; /* 16MB */
+			cache-unified;
 		};
+
 		idle-states {
 			entry-method = "psci";
 
-- 
2.43.0

base-commit: 3160658ea2c4dd09a1d68918271177cf55437a8f

