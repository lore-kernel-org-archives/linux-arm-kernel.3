Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA293CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rqkByc0jcgGmIempquzeuZVTUdtIdrSyq8yebHSqXo=; b=bxK81T/VO5w3fgb4i4mRE+anqy
	vC5fOZrjPkzRV9zlnPOXFUK+kD7BswOw1arZaUCUMPapRuiD1VAPChSzvgAsCx38DsmOyIFdYClbo
	ELSvzsS0ctjNOcl7ciekgO8PAJIza4/x+O0OEGRApEPfJchQ41uMup9RqHAZvNt0I1aGJ6jHKUCvF
	s3XKXirQ+WoXATdQjEu/n3YpZ12I58DNnNtbLJ0BRMnDb9HPO5XFn5dX7OH++8NEF2EsHGynWYlji
	b6kHCgBo50DRBEloynlo83IDtafSusVq6S2+SnfCbAN3TRrQPy9pP2waf5kvJ4JBR2shStgavmCle
	KXp6xJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM2p-0000000Fvkw-2YZb;
	Tue, 02 Sep 2025 08:07:11 +0000
Received: from mail-bn1nam02on20600.outbound.protection.outlook.com ([2a01:111:f403:2407::600] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsg-0000000FrWN-395n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYGGnkQWPtCdxpbIFFBXfPMGfjpK0ZsaZ9E4HUn4Gpj2f3Ui21Hpah5BHx6Bl+VZ9FmdY2PT2e6hLbVcNOW3qlsi6svIkSsbseNso1zkjKiJkuzftL2rTf0H1NlURDWw7mcdK7iZFiCUl48HqgZ1ey0e3res9+Q+ZYkyhQ448SuePBjA52ol3KdurXEeY2tWQCwKYQNWbXtISSO9p7TQoV24uQ4nPgAombYUT75cpLvttxtULdDwKoRy/i0tlbbzs58j2p0nKv6NyilpnnPDD5avREWJH2Qx9/hlf78oX3h22CylBDXt/p0I6sd2jYeevJUtsJ5VG0ZfpNWkwBUo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rqkByc0jcgGmIempquzeuZVTUdtIdrSyq8yebHSqXo=;
 b=oLpwsdu2L6/Lm33HTMU4hek6C7PwoItN23HPAYPPxUTUB01gEMFvMyvWRZnkia4C87MHNioSFLZXwlxf1mTdGMwGU4oPF9AP3MzI87wnnwubzGnENPNf9Nvcb51LLFwE+vn0eNGX9UeHnYgxrAZ1bzdVRqCkJO4ISvdSbU8HI462L246UBpqyoD98FpCyiNMKXKOUpATR11ZSgdtHvcwOGpTLlTrNR9Ve7mIgofrCGQ4AZSaDsS03NQJQGAC5Hy1hAOJf7KKbscAm+QrcY42MGw9O0pDmMPFDAv5br61arMzNAwd2CWGv1j3FxkylXJjbuG15NuA+hhkyIuIJYVHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rqkByc0jcgGmIempquzeuZVTUdtIdrSyq8yebHSqXo=;
 b=1cV5Yw/CqfDsImjNiPDgazejyA4z3TdTGPIvD5q8EjqrlIZ69R1xnz3dlJ/WHV5uUJIgLTaPVxYgIGM8wzgtDBXm2meGo0Zi9EODEeYtp/w7dR7THllZgjZsvWV6o+/1RnEr8AlJRlrocL4WmGlUcFF1O0OUtHZ9u7Tm2Kr+630=
Received: from BY3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:254::10)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:56:35 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::52) by BY3PR05CA0005.outlook.office365.com
 (2603:10b6:a03:254::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Tue,
 2 Sep 2025 07:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 07:56:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:56:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 00:56:32 -0700
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 02:56:31 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Quanyang Wang <quanyang.wang@windriver.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/4] arm64: zynqmp: Disable coresight by default
Date: Tue, 2 Sep 2025 09:56:18 +0200
Message-ID: <7e308b8efe977c4912079b4d1b1ab3d24908559e.1756799774.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756799774.git.michal.simek@amd.com>
References: <cover.1756799774.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408; i=michal.simek@amd.com; h=from:subject:message-id; bh=TYsqEefDGjNyozfb/G0JJAC6zN+zOsI97PTO5fmYW34=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRsW6z8VqaeWeyGcuJZW5l318q6bsxwdYzX3XSaQ/q7k G3OjHLbjlIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZiImTXD/6T+z2YBV4892lb5 MpPd9dH/aezJZ+/4sXIxHf54ZvvJlIcM/1P4H3mV/2z9Vanxpuuc8uVjFwsL115341G+OTk6qM7 ZkBUA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4cc545-53a3-4bce-0064-08dde9f63cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dibG0XKohGGoCV+6k2w2yRvZMkssR/v6Lm+GAPlgssZfPnLXr9yFsNI2xYEh?=
 =?us-ascii?Q?J3fWfKO35zneNGSeLwMYWVre86tgXxRFpLB8fgA/khLe4i7B46E6enztU32Q?=
 =?us-ascii?Q?UwwBdSh9klpqCnwAW4UlvoUDnUFTOPEAG5tV2GzVBhsVMOBWKnIt14X/P2U7?=
 =?us-ascii?Q?bjxV+rjL9HdTcqw8xktE+v5KSclHFWqYNpqiP/kj0DgTBQuUfCL4qnisMxFx?=
 =?us-ascii?Q?EKtW+xSGKlCCmPTZ4TR/j09TlMhVCDGGPMY8f76cqrr4TIAad7Pbo2h/j4Zf?=
 =?us-ascii?Q?NYbJmmFpCDpJ+mm7RFeTvdM5y/LE6hr5enXY0YdBB+X6TB60bqOASvAOJd61?=
 =?us-ascii?Q?NGtOK83N5OoVgK+CerBL53+N9Pq1QzvJ14TliVfUAl1xDDbXWkefo1zn9XCX?=
 =?us-ascii?Q?RZH2JWeRGH4FPJmYwgnwn+MlQvQNmI0n4EeqGit1auZ821PE6n2gesXp1zeQ?=
 =?us-ascii?Q?B/rE/y7KylRd9No21JrOFOLOaEwFJXbKwVeCL924RhslYOGb1aIDVnzroLCT?=
 =?us-ascii?Q?Cl56hy0TV3dD3iugvALW67eKrCmz9F9kAx7UtRxeQVWdQTqNzui1VOFdLAbA?=
 =?us-ascii?Q?Ht/SfYluu+y5/6QEod3SjnIkiwn5zMYjAqH97L+UfAr/qmznNuS+NCPPh8pp?=
 =?us-ascii?Q?kcn6hr4BWL3I4+kBFRFySXIVLAysO8l77ppcx5UelMIty13w2tFi2MIj1vRT?=
 =?us-ascii?Q?meGS/RwWSdWJYSdrfpubbixPr3OieN6z5ZkB1gg1yJj6pufaJoOsHX7/8br9?=
 =?us-ascii?Q?Z51w7O7bZN1Sc7EQ3Z/AYQgNimDP9TSyrOrW00VJyxl03UY6+/7xhNB1QJ2d?=
 =?us-ascii?Q?r47/g9fs6KHplfJncLw3FzRZx4yw5EYkm8Cuzr6DzTTfznYetK9Fz05hVVwp?=
 =?us-ascii?Q?L7q51OMcUXl8tK3GiWy6RJ72PudySPr1MEuYUAmPjMRgg9YQ5SwE1i+Os8+I?=
 =?us-ascii?Q?2GACyIGn0/4LzgY46KL/+Zial42Yn1+/4Rapey5xlpyS8VgejhvgCNIL8/vT?=
 =?us-ascii?Q?BinBq2e7aWVnssGVflszi1iYNMzPfYYGjULGlb1EsSWcE1PrPOATQRI2LMTn?=
 =?us-ascii?Q?T0bTDjBaccGr6eIprXPoBbA3gQ/O5cZGxTvaBTA3tS9Rb11wePW/UeteXD+j?=
 =?us-ascii?Q?VTHQAqOhf2zxyPu1HTlM6mGNA9Fe7tyVf4C7FPm3eEfbdiLlSZG2r0jODlRY?=
 =?us-ascii?Q?teFJNmMNNUnUDY1WsCBKxsercLK8xkpxK99JXGAsRluOA7DV8UUREDMs9/jo?=
 =?us-ascii?Q?HCArTCtFUzoNXEjsTCyNmB9XZvsWZfgPM4Raok9JY2mOjJBfd0M7sB5pGUdf?=
 =?us-ascii?Q?3rIfrGDBHo38jxD5arDp/n+x3xJSyqWWSsABu70hmMnYRQW6jSEXhm4KROQW?=
 =?us-ascii?Q?B/8EqvYa2udlWsvlGZOaamWzgcS43LQW2wKZhXAnszY/WLVG+kLnX4WtQgO7?=
 =?us-ascii?Q?38uAQHMJQq/03hSF365yOwEY1ySgqJzk+iNY33I5gqgV1nbf+QdDUS/9EDmq?=
 =?us-ascii?Q?bp5cR7p4CobO4QpwA2PD7CAbFdqpClr204QR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:56:34.7221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4cc545-53a3-4bce-0064-08dde9f63cd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005642_830606_0CDCA5AF 
X-CRM114-Status: GOOD (  11.18  )
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

From: Quanyang Wang <quanyang.wang@windriver.com>

When secure-boot mode of bootloader is enabled, the registers of
coresight are not permitted to access that's why disable it by default.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 5f26649c9e11..938b014ca923 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -550,6 +550,7 @@ cpu0_debug: debug@fec10000 {
 			reg = <0x0 0xfec10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu0>;
+			status = "disabled";
 		};
 
 		cpu1_debug: debug@fed10000 {
@@ -557,6 +558,7 @@ cpu1_debug: debug@fed10000 {
 			reg = <0x0 0xfed10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu1>;
+			status = "disabled";
 		};
 
 		cpu2_debug: debug@fee10000 {
@@ -564,6 +566,7 @@ cpu2_debug: debug@fee10000 {
 			reg = <0x0 0xfee10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu2>;
+			status = "disabled";
 		};
 
 		cpu3_debug: debug@fef10000 {
@@ -571,6 +574,7 @@ cpu3_debug: debug@fef10000 {
 			reg = <0x0 0xfef10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu3>;
+			status = "disabled";
 		};
 
 		/* GDMA */
-- 
2.43.0


