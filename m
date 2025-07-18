Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790E1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJbmqPoi0XrUEBsjnvwlELctu7zump00Hou5LrzAWTA=; b=f+Nx3bMAGHpU/u/bjszbwkG1V0
	7e8SD7IBpEK4yx03xYMO6UWmOn6DVfqfxhhEtP3yX1LSt8QdMjEY84tTEyShwhqYmWZS0nSZHQftA
	HoSaLh5t+kFvypc9xb8vHk1D8jBX0vOhWdlF5C3rC1SGmg6SP5qCn7fqHIU4g2ci7oQjenS/OjaFF
	DuSVBWRjzLRKvkOxY5wc1cRBicde07yTAEieWrZSae8CU8zV6gfJcV3Fn4xy8lPT5w2C0uzWGSaIZ
	7j3TnNEgCW7oPoivRBLT1jqZKO7aWNxO/t/qLw0cZtIy/vdSdNl0FME/XDJSkcLCx8FEuqYqjwa69
	vFGFqaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj0a-0000000CPA2-1mH1;
	Fri, 18 Jul 2025 11:12:08 +0000
Received: from mail-bn8nam12on2062b.outbound.protection.outlook.com ([2a01:111:f403:2418::62b] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciaw-0000000CKtr-494O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:45:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeQDxnNv0o89DfEOfscVGbh+2+KKU9X7uaww2hNbzF6gKjA8FstZDSg5RznI9r/J75JWf/8thYCB2Q3lH4E8xiMhyTGFKg39wbgWeHlEly+T9Fm3kKyy5zTZVAG/Q+xccGuhU5IQEtRBG5CrDQFc5cktYRN5mIgMjeUy8o5i9S+Q8zM6yCDMrSTVAFjHzr5lNwO/Z045Dnc/maUhU/RcZuB05Q9o1lky0WA1DbD6p/QjC7nvtZDQQvJ0o8fdWBKDtwmapqblpx/OGPG4V5DPCkSFeoYmRtt+TDsrWox6ha/q8KVW9YuleGtDwR2Ethn+Vq33ItoXwjyGu3chilQ/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJbmqPoi0XrUEBsjnvwlELctu7zump00Hou5LrzAWTA=;
 b=fbkGvqp1AguDgxbWra48gUAsdDxwPJfht4jGxcANhiCVQaZnh30St6CJ0Sz6//udxgSrD3+8GYO7EqUo75GSP+awvp+QD5dS9OFhReZWwmASSPU/bZ5Oss7qdwWOm7mazGvfHw/OAB2RDC0v75r3xEfpeCF2C3nbCGHR9n1Wp9U6bqi5mmAZxaA5oJbcy95AoTL1NsgO3KstgAW+Sn/NR2k+LBkR6OoIf0Ch8sOPqI824BH5UCqWTWUTxf/uEZ6M/nbyRnnfu53hefDdFcjAW0Tce5C7iXp4xKbxQgO+0xaQ/c8bkNEkKf0pdp0yLRyYCx9BVAtWtpcHV6KYeu+o1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJbmqPoi0XrUEBsjnvwlELctu7zump00Hou5LrzAWTA=;
 b=lWbjzEKdZlxayTUzqRaOIj7Erd5otKKBfKb/XDD7xzt9gl6IZ4afuvOmOO5jXyiIt4F3XMZ9WjGeQJrEmf+kwZQUpB2m/cRZBVV9vLLnPyOkcAuvgE5jnnotjFSBxCVqJ/itxzIjkgC43ReUafPlskHfhx/37eNxiPDaue+ObnM=
Received: from BYAPR08CA0015.namprd08.prod.outlook.com (2603:10b6:a03:100::28)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:45:32 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::38) by BYAPR08CA0015.outlook.office365.com
 (2603:10b6:a03:100::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Fri,
 18 Jul 2025 10:45:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 10:45:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:29 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 05:45:29 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/7] arm64: zynqmp: Remove undocumented arasan,has-mdma property
Date: Fri, 18 Jul 2025 12:45:07 +0200
Message-ID: <6567a0855ad73b5ff01d9945063014fbacdcc845.1752835501.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752835501.git.michal.simek@amd.com>
References: <cover.1752835501.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=michal.simek@amd.com; h=from:subject:message-id; bh=lu54kFv+xXSN72T7GgpVOnDQpZAcMHFK/XfnU8b68T0=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRUqW5n2b4lbY5LcbLelfrla6Kk4q32LnmnnnVYdO20q tNnvh7X6yhlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJeK1hZHiUFvH8YpMiq1qx 3mym10wLv0uvDHGKUXY6uv1Ryqz3d4oYGT5ePcPTrdxy2yo1xXr6zWxZrY61VkVLLtl8jGK5JKT Qxg0A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b58ddb9-e040-4ec8-9263-08ddc5e837c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F+4IS21CE8UbiKT0uTuzs7EbeYm+B0onu8kufPykg5+QXH+oaNzxUMducpbl?=
 =?us-ascii?Q?VdBXnD6WCX68ufuhe8esKiu/ot5xgrSyvk3z3IvCMOupOqyCGME24Tbr5Q59?=
 =?us-ascii?Q?KyThxpi+EAVIlMzr+H3nmmvx0b1Gc4voNIbznQUDyKi4Eu8Vo2nXaYy/nkkQ?=
 =?us-ascii?Q?qEAdu8CY0B3mCllWu9OUYKPjwtPDYZYo04ea9D3SbeGwVOi2+bwHHGTGtt+2?=
 =?us-ascii?Q?CZHBzLktFCxc3x7tmE4kdrd58UHA/boONr/jM++4xLxB08CJQxMf2L221OH9?=
 =?us-ascii?Q?UGfMron9X1lNnEwqn5t+o3uqBP8qUci6ielKXMDzEXgofkYEgosK3FTNak+e?=
 =?us-ascii?Q?5F5BdAZdHfMGLSwF8dgcuT1dLflD4FqeF4mkiN84sKJRg0AmypHKEO6f3nvb?=
 =?us-ascii?Q?/uduzWEdEhVlaRfiIdcg1QWRKoHAOgDcskw7WIbEmn/j4AqtDUuHEYM6Q7qU?=
 =?us-ascii?Q?scwSr0sB/3ozWcgoUr6+ViX3o7/0hK9/+6iTbmN1n/9GXI9TuRVD/BpSW52t?=
 =?us-ascii?Q?NWQc1m0/zEiEYlvOFT+mEUg4UGcYCLWZDApOi7ngz5DFwybnxT4LX6nzix5F?=
 =?us-ascii?Q?nF7ZEGMtJEeinKFYYknRERxHVhoft2LZeLWIDuNKhx8mdwoh5+h4TRHhHJVQ?=
 =?us-ascii?Q?hqQ5B6jkRpw+sUAnlNxmK0ocuNMEZ+K2ja1XPGiLM7aJti0YBwfkU0zssp4z?=
 =?us-ascii?Q?RAX1+/i2jnFfPtg0EIWf/9bAtzfXiwiIkEkiNIwsQ/TLPY7Umbmi9XrJQE3Q?=
 =?us-ascii?Q?gWxSY3H0rreh+pzo7llrcQE4+deTkR+eDARI5yqF2+MpB4oO0ILg3eVgaJnp?=
 =?us-ascii?Q?pmWQNH3gh0uSVQOSS9m6+b4XKJm3Njppla8FA/uNUN7q5cG45ihvLvVaJ2jj?=
 =?us-ascii?Q?BVl7NivJs9ppm2upH2qp3dhGLl2lwxcNy77pOVTnTm7w9dizlhWIIzinV0z2?=
 =?us-ascii?Q?iUgHDTd1tkVbjXcI80G+NY4WzUhI49N5rOweHeRsRPT2nSDO/+DxWNapW6vI?=
 =?us-ascii?Q?dJyNeGQ7Gh2ecRHOFIfZk77G5gQWGBY0xlB2Q+dHcAZ1x7uj5cytYg+5XaTb?=
 =?us-ascii?Q?xjjOu4wBqFfpN/UW7HdtKI5/ph8MpcuwVIvj5CDWnndXNLvTGC+2R3Xn05Mz?=
 =?us-ascii?Q?EtVIDXZXPFnPxQcZ1pwA/p0BozsOTJyKEtSBKgIi5n4D5ihYJNGHL85ewng/?=
 =?us-ascii?Q?B70W7I6ur2MnmC2y+KuRGZNcHVWM9LsDWR9PGVHrkJeoz75I+2UZgvWg6PJX?=
 =?us-ascii?Q?3Ma73kTLpoeNdxOoiZkn3XRdj8DCOPHXSxaE4XtlMm5/pYW+vsG51RI79bCp?=
 =?us-ascii?Q?mrdJe302E8b5/0etYcpPNMsTOG2dq/NUURImql2jP4afQQsBKB8swIAuutLU?=
 =?us-ascii?Q?+zw43NRscvOoTjM3yxuZuh2GZcIioobzA/7w5TzZG1tAuQVjYHTNyw6r4xhE?=
 =?us-ascii?Q?yBPRtWkI+ddw37JBH9DC7rBtDW3L6oM+p0fAaxiK5r/XBRDBNagNP5UnDLxX?=
 =?us-ascii?Q?7Yeyk8xkGmPdy+JOaaWfe09rf2uEHw+dW2xh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:45:31.4524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b58ddb9-e040-4ec8-9263-08ddc5e837c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034539_028119_74B72249 
X-CRM114-Status: GOOD (  10.46  )
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

arasan,has-mdma is not described in DT binding that's why remove it.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
index 1850325e1d6c..2ad7423c2f05 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
@@ -135,7 +135,6 @@ &nand0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nand0_default>;
-	arasan,has-mdma;
 
 	nand@0 {
 		reg = <0x0>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts
index f553b317e6b2..8fbc33562bc4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts
@@ -129,7 +129,6 @@ &i2c1 {
 /* MT29F64G08AECDBJ4-6 */
 &nand0 {
 	status = "okay";
-	arasan,has-mdma;
 	num-cs = <2>;
 };
 
-- 
2.43.0


