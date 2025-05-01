Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E45C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HddP0HhF4xzgeFJWHv4I6iAgtw4GC2FHhJ1cnTJYrkg=; b=O2ssin31lLN7LR+hZJ1kDUl2ty
	lofcmmw50iBS8AirK7+q4N5Ny0yUvok6TiAMsfMQleu/juhRN86FK6ftYWai+w3kPS+/Yy0jVq/zV
	pUM+SSoQDkwsxY2XRdID13T7ViF4F2X+HcCdaJio0ZxTcTRfKrDlAKrZCQ7DIGAvoxkNSXmFg3HqJ
	scsOv1fmgdwi8IYK7rVS3DNxL3YcZc00eAHi4SuR0l1HfSPwDr0Z4qFztEpS4Kxhgij+AqasGa2as
	Rhdqp5tkiEFZ5aeslYw62T9NzyHLOhvguZ11mBa0JAThgRAdeTFrxy+H+e0Xu/dZTzwwHs9r7ibQK
	4MDbmxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdxe-00000000LBx-1TzD;
	Fri, 02 May 2025 00:09:02 +0000
Received: from mail-dm6nam11on20606.outbound.protection.outlook.com ([2a01:111:f403:2415::606] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcvU-00000000AOO-2Pgk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBNPRriArHksgqe5ysFrP6AyWK0ssCUmrCtdP57Y3Hf3S8bpHAfAswKtuOM2MFjmESiUDHK2uCNGmmD6UxSdyEnF+cA9alAGZq/sxBWwPThQztM+rA2FG/7dPeATQmHV3+lFeOYH9iFQz7hbdMtzqYGE27KA5BWFbYHeH4NLMFXe/SntMGuQTOO8IpPVL9+fhSBUpV/uJsvSkQvLqI6jGTXTwBY0iAc2KFNewQ9GWTGK3AG1P8GKjuj6enRIE/s3Smk6YzyAslWoUwLctgsfTuIsdlsWNgzWA2dYm+Lp2ruvvobWKNssM2Dv+V7BwsGnLsK1z4rSvBQWfSMdEKmwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HddP0HhF4xzgeFJWHv4I6iAgtw4GC2FHhJ1cnTJYrkg=;
 b=Joa7GqUI+MLEfbNgVvcfdNliIbHRuUg01oHBYzT/zaMnclDtHvZczdzz181kgB2InaLvf8kVCCO8DRXuHKGebP7c6KdAFHUzsN4bG8NJGgX8qNy1YMVqzv2hoHHn4Z4fMSsGEg1NNVGBaN2q+KEuUqhtR5AiI+3L08BEPRrK7qe5SLHqB3DqoBAs52QG6Gjad9EcT47hmt9ywMmZxYX3rjHZh2TCXEenmLfAbCGoKm/BVFJLfWG+xdjPXD7cqZNPw74fFKik8k0R2fV/aR5mYk/t0ZTbKo5H8h9AjM/hFxrgKUiyfMjHgq2z/ax2rMTjv8cU3PqrMKa6LkF+lh24wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HddP0HhF4xzgeFJWHv4I6iAgtw4GC2FHhJ1cnTJYrkg=;
 b=DvrzL24VEVXjc4FL8lQzKEx1Zvf3WGXKjGPAM1QlHZhrYh3RrK2exV+42lzMjyv9qXT1l/LtK5XRHI2N4WZjJ8E3Qxpy7YLVF1laEQsbIK1NaWsykdirT/C1w88dgZ5bubbgG1OSfUuh510qt3669+nJ0CMVzyllCKQahqkjAgebEHkDR7glqJnuEmBZl9rplRQxcL/X+9OOCkoE7RgFGfzk64RjggHMm86yLhz4aLDpKykxiBq0V+9+dCD8aczgHz70SYdRrE1PuEhayg4sAidrLblDAPzXk300e34nmuev5F84VOaI0sBa6VlN4e+5kV6WQYT1FyCnIOPAEUsxkg==
Received: from CH5P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::10)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 1 May
 2025 23:02:39 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::5e) by CH5P222CA0021.outlook.office365.com
 (2603:10b6:610:1ee::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Thu,
 1 May 2025 23:02:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Thu, 1 May 2025 23:02:38 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 16:02:23 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 16:02:22 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 1 May 2025 16:02:20 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: [PATCH v3 20/23] iommu/tegra241-cmdqv: Simplify deinit flow in tegra241_cmdqv_remove_vintf()
Date: Thu, 1 May 2025 16:01:26 -0700
Message-ID: <e3ec1ae08d70edd511f902f2d0b6219ce07fdb6c.1746139811.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746139811.git.nicolinc@nvidia.com>
References: <cover.1746139811.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fc52f0-c7e7-42aa-5c49-08dd8904453e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?naeKYECZPWWbWhBYe9F2l79ftEPCSay9vdXUorGvhzwsP+JUCmrLFnyNNIZ0?=
 =?us-ascii?Q?IYuz+KPYEGfcgzj5GMqLh2PLhPOFYc6HS6eUbjsbfjA/gFkMKJBmMh+dEZA2?=
 =?us-ascii?Q?5+Ijqc2S3w8TzsAiqAljU6APL52poP6RjE3GNeen+5WrD72StW0TqM9IQE6i?=
 =?us-ascii?Q?hzM9IQ52/U2vWVH0v02KxOmYktaEhg3uqR/STIDQHdV9bxEcXsEOoViLBbnb?=
 =?us-ascii?Q?1qXVExF8lFkROfh3i0hZSerZ3S3JB8tmV7qTtDx9/6lp+W10bwbGy5Jh3PHs?=
 =?us-ascii?Q?RSPJB4vreQy3a3EzUsNfY28T+tbgu8aVj6PE50DPs4HnJqIhs/3GrDyYkpyS?=
 =?us-ascii?Q?fUJOMtINE5eptHwQ6GcHee026AgCis5waZXuIlkJZaaqLHzDMfTu55/YZ4qx?=
 =?us-ascii?Q?T8gAWZ4HMF2Rtny24VShjLBUKgaEV3QnDbu+qdfW+w/5TA1Wfdw6aQ0OoGrZ?=
 =?us-ascii?Q?TMD/KNisfgtOboZfji0brYVwo6zPBIYwHhrezKRaxIxfcqk6TQ0UZs5zBtk5?=
 =?us-ascii?Q?xQAZXjU3+BCzqn5WOaIiMX73892tT4rn7SocMOGmP/wGNgvWC5wuzTEvwdER?=
 =?us-ascii?Q?WJLeNqX/70/XsYmdaY0An+/b5TSUi49N6dZbH/wFGTKaBy85jYCxx/CR2diK?=
 =?us-ascii?Q?uqEJ5hWBra76ITRHy4CSLzLI2NukX2CPxz9Yny9dTFstW/deTz774TtnTAqA?=
 =?us-ascii?Q?pSwIwq9RlTgmDWjmDIGMMcNo473Hg4qUmwOouefUcYpWfPAlXih64LeNWJfB?=
 =?us-ascii?Q?HpBPse8cD0u5vPCpqEsKhh6NDxtQieMUDb6zQrUNUy3xQ676iuh+lILZWFoX?=
 =?us-ascii?Q?TUAYqRHR8U2eMr78PT9X5MX46AN3zQXDou8VcDMzPvyf+K6JCfrsxBoTO9rh?=
 =?us-ascii?Q?y68Tseq2YF0LljNejkrjMO4y4focsbtYzPMGhFiizmuBbqsAnDrUYd6G58+8?=
 =?us-ascii?Q?pwKcTP6FHWXR1t5vIVywYxQaOWGMonPTFMeVMJQ8vDB7zPzLq3mW1LMYJkho?=
 =?us-ascii?Q?vEtvUcxKK93DQdlu+AJjo+tpXPI3TSXutYkJZq6RSU8L5Tr+DbVNUNIMo0Un?=
 =?us-ascii?Q?ZvbtevihJXVn7tCaIWBE2/1tXf8S+XaoSLF/VEIm631Eh84qAfCyp31RW0Yh?=
 =?us-ascii?Q?GtAz+LVv3/vJgxUDUkvWgfnctmvlqGpd8ZLPU8fS5WL+pDzXVSvIS4yVMxq1?=
 =?us-ascii?Q?cnoyeFgeRchfm3FaElg2lGwnF7Hqc4wnbiKuQ497OqRyuiAAaqVGzbE4pWNQ?=
 =?us-ascii?Q?UdfF/6tchazzchgzp385U87kVPuFJTHwUkUrBSyFUkTDAEzu98+rRg/dboK3?=
 =?us-ascii?Q?xw8ZgJlDIl1+m0IppjoCZmEGfIKxsseqZ0gr7nOTuXtu18K96qCSpIf7AFKg?=
 =?us-ascii?Q?TYJXr0dngMQKaL9yErooUYO+O+EVjBNlaR5eGFsMNJCA2AZLcLmTKUZpu5BZ?=
 =?us-ascii?Q?ktjHg2/1qHY9mBuLNcKmm+Vewz+Jwmz65Jw0Ljr6Q4aAlz0WDHDfgNeQtn64?=
 =?us-ascii?Q?Uaa/5HQAv4EwdhmCBGrvdb7eSS4Z8vghBMLx?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:02:38.9562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fc52f0-c7e7-42aa-5c49-08dd8904453e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_160244_608846_00037451 
X-CRM114-Status: UNSURE (   9.70  )
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

The current flow of tegra241_cmdqv_remove_vintf() is:
 1. For each LVCMDQ, tegra241_vintf_remove_lvcmdq():
    a. Disable the LVCMDQ HW
    b. Release the LVCMDQ SW resource
 2. For current VINTF, tegra241_vintf_hw_deinit():
    c. Disable all LVCMDQ HWs
    d. Disable VINTF HW

Obviously, the step 1.a and the step 2.c are redundant.

Since tegra241_vintf_hw_deinit() disables all of its LVCMDQ HWs, it could
simplify the flow in tegra241_cmdqv_remove_vintf() by calling that first:
 1. For current VINTF, tegra241_vintf_hw_deinit():
    a. Disable all LVCMDQ HWs
    b. Disable VINTF HW
 2. Release all LVCMDQ SW resources

Drop tegra241_vintf_remove_lvcmdq(), and move tegra241_vintf_free_lvcmdq()
as the new step 2.

Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index ba029f7d24ce..8d418c131b1b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -628,24 +628,17 @@ static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
 
 /* Remove Helpers */
 
-static void tegra241_vintf_remove_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
-{
-	tegra241_vcmdq_hw_deinit(vintf->lvcmdqs[lidx]);
-	tegra241_vintf_free_lvcmdq(vintf, lidx);
-}
-
 static void tegra241_cmdqv_remove_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
 {
 	struct tegra241_vintf *vintf = cmdqv->vintfs[idx];
 	u16 lidx;
 
+	tegra241_vintf_hw_deinit(vintf);
+
 	/* Remove LVCMDQ resources */
 	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++)
 		if (vintf->lvcmdqs[lidx])
-			tegra241_vintf_remove_lvcmdq(vintf, lidx);
-
-	/* Remove VINTF resources */
-	tegra241_vintf_hw_deinit(vintf);
+			tegra241_vintf_free_lvcmdq(vintf, lidx);
 
 	dev_dbg(cmdqv->dev, "VINTF%u: deallocated\n", vintf->idx);
 	tegra241_cmdqv_deinit_vintf(cmdqv, idx);
-- 
2.43.0


