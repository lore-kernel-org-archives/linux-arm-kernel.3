Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F2CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvOavTmLsxbLCzi/JCd40p2NDYk9BHp9kQutDBNisiI=; b=PAjA0fPRjtFuBFfAVDnjCRezxA
	C1UZfojfLIJGqQpDLYxi32BcxyU62hdJXHRCFr6tpj7UrffrDAglgPQTNspHhxe4B7RQaylhReGyg
	NpIq0k8jqPKY1pXJy3JgZ+NCn/Gd/6vVxY3oZCsLttULZ/ylPeSnsyB1RX+NduTbx7epVbtFaqic/
	dbneuvp9VAfSetbFDQ0e/Gwbzg7Oc+O/LzM9MHunsus1h7ILyiXT3VZI9566Yy5ZFwGoRO+5e7QVH
	al1sRNTag+AIMSrYPcKwnvgfLWtD/rb6DE2NAPOpcbmYCf4bBktSn4LPHgkzIjqRL7n9jt0WuYc7c
	/lk//2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLa-00000005FVd-0fqD;
	Wed, 20 May 2026 17:04:42 +0000
Received: from mail-southcentralusazon11011061.outbound.protection.outlook.com ([40.93.194.61] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLE-00000005FG9-2CqC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:04:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnM5y+wae9d8s+zAeOirZw+YCLPGlTqcSq+k/hlqS1ycWVmnonp4liI4xCdGje1UsWf+0ecC6Ym9CHs/7DDqEbjdxBXcLpx0KG8tFgEV/klgu1kxUZXDouiZCOeM8wjeuDcEDvDPcCo6G257lgS4W/VNvqpUORGIZzChYOfZFhPUALOy97WZzbRY3eGXpVAi3KCSJm57xlgym7i+dT0p6Np2RKsjdduz8OVeLrr3qdf/JDS67CVEi/36PStY0aCUwvvldMerN9ax0U6kH99ZeXW2qwGjgT9tkZG1ALMUA3eHWwRp+g8GPfJF5ocSx/Os73STfVvWQcO4i5BMHwpt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvOavTmLsxbLCzi/JCd40p2NDYk9BHp9kQutDBNisiI=;
 b=fL3bq6QvxTQTrXbkD0nHD6h3/A7oZDiZun9ZVy54KDSCH5nHodugtc3KrlkaDAvToZ+SvpZGw3+5nnoizJ9tjGw4Lqv7wvb3+3pXzMrTE35ttr+uEuGxozKFXtobRL3sFcWRvCJtd3oqS1dJPmnOo5I3zinQqLQaqpkJBjMGiR9aqwW3S67O1ZFSLtIZwCn6UJLBQo05n8PWHBMFvO/PepzAWdkC+J9o0TT+nv4DTZOVxpWESRPQYnkPGqTcHxz1YvsoDraIxrky6SnpusZgYLIKvcWm8LjmENTtoqQipF6RRwKppoBTxipg6Usxkm65DFCAQFKAKN8NeOZgPAHxBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvOavTmLsxbLCzi/JCd40p2NDYk9BHp9kQutDBNisiI=;
 b=PllL2kuTGo4d0egqoEDlTQ/1HyDHL2wTnKJFZusyu7LBVFvHMdkbI56RgpGhhwy6ud9huu5ic1beblUFQZfGcObNWpTr8LwtikSrsmK6NdzOOGwC47C11gcjlzDVKVXWwIk9UEKd0ITcvAH6/mUD0+gZihrYbFJNkMBwEDXpQuVi6n3aHt3dvDoJTZOW7NKIHYGuXqMS+C2tViqP/ye6bTi0CXrE/vmW7LZqHHJKLzXmVQm6sCGjhohixIX1RB8TV/U4jx3GTP7Q/Et/w8xzpWu16ef1R0nv56mqtdzsf1aPBc3ahKY9QQkZtSByD1scg/SJozxWpOeMQHE1LxmIxg==
Received: from BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::13)
 by SJ2PR12MB9211.namprd12.prod.outlook.com (2603:10b6:a03:55e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 17:04:10 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::46) by BY1P220CA0007.outlook.office365.com
 (2603:10b6:a03:59d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 17:04:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 17:04:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 20 May
 2026 10:03:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 20 May 2026 10:03:49 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 20 May 2026 10:03:48 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v6 6/7] iommu/arm-smmu-v3: Skip RMR bypass for kdump adoption
Date: Wed, 20 May 2026 10:03:23 -0700
Message-ID: <88e75018e94adc2eb3db8c1fd97c3cc738c170bb.1779265413.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779265413.git.nicolinc@nvidia.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SJ2PR12MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: d8917b4b-8cbe-4119-8e97-08deb691cfed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|22082099003|56012099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: W0YqxzuF2M8P7OIUIdVYf2H01xEFNH/a3DP7OfZnO8KbkcH7sd7wBrG1/hZj4NpLd4RNejDmTaamhNiaXIuHG0lwtcrdu4lB0upjmbeYvW+4h+A1YjAIFH9w4iNQuXtEjDgQuxCOxRC0WB2UygFgVBWmkCaVSqifWMDEKZgp/3ZHHxXOH9xKUKS4kPbRF+HtAk3eBe/tGKfLKgrsbdSABkZOic46QMKFQ3dFKsi8SqvrPSYcduALWjPvjcSvfK2DGUFkH/CeaAhIzdstl2HRf18XEgBZ8O9TiFMhgXZYOJpgD1ItdcQst7XPjKRTBCcjAWmlKw30jepv/Zw1F5jALbVaRTad1eN1crA3Z61poQLXgkOEstDqL/qsNcPO+lBMtcEpneQ3iugIiWM8nesRS8IEtuQjJrV//e//2U+0KFJ5VD9UYPxzbZtc+62WBy533wraUGqQncRc9keDdcR5IdYU2ntL4ghEVVG4ixyRN6djlaumKxun3qKMlsdxYVwgraV2B4qPdYhM8zprLj4eGkC1sUxMm0i0mqFACU9oTlDIjGXAIHNHRPeL2IFTcUTRCZvZHEkH7XjzKPnbzF09gD8PAD5QDsgLfcSC3T3daA0hCWVa9JdEDiB4SBHX81QqGL/EastQuL5C2sCqBWngx6ouE+Gp8kz2lIB6PeqUcZULIYgLsBRVrMWm62vdte6ZHk3ZpQHTGW142P9RbntvxnHmmU+Ncleg/ieq9tTVnSk=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(22082099003)(56012099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YZcX64FyAz3bUbtUPlUM52DBZrOWfEpWrXg3OnmDGeG4DyqKxSa2N6btPdnpVmACzuPgyx2PLrbvufhJ5jC0560m+3/8wD08Gig69mPrhJs6QFZyV0e+6s5ZxaNYeXXvk4eQbPU6QipnNOwi4NBN2h/iAbVLdW2xscBpk0wb2A6CPS1xpjhIi2oWriWJW0lWt4+n7jqhgGj+AEPutFJvDrupqAtyAZMI/VL4g6D85rAiMczi0wTY8Wxyj/vZ27WiCLqqgMJHlg4xBRi4b30aXM27P94WTRZ7Nlk9mVTAHnHHLyRee58QS+8zR6cWnYXd/pLIoH7DhTjrzdysEZZP1kKc2RBXpRteRWL0HOsknJpZyVgQIIg3WqV1T6FHE7xbLrWk/1I9dcEAOebPqC2ejhsliho6xSiIFzXF4hTDyRmZljis5Apky05xy5D2N/wn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:04:10.7976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8917b4b-8cbe-4119-8e97-08deb691cfed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_100420_583056_869F243B 
X-CRM114-Status: GOOD (  15.78  )
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

RMR bypass STEs are installed during SMMUv3 probe for StreamIDs listed by
IORT RMR nodes. A normal boot switches the driver to a fresh stream table
whose initial STEs abort, so those RMR SIDs need bypass entries before it
becomes live. This preserves firmware/guest-owned traffic, including vSMMU
guest MSI cases built around RMR-described SIDs.

ARM_SMMU_OPT_KDUMP_ADOPT is the opposite case: the driver keeps SMMUEN set
and adopts the crashed kernel's stream table, so RMR SIDs already have the
only translation state known to be safe for active in-flight DMA. Replacing
an adopted STE with bypass can turn translated DMA into physical DMA, then
point it at the wrong memory.

arm_smmu_make_bypass_ste() also rewrites the STE in place after clearing it
first. While the table is live, a concurrent hardware STE fetch can observe
V=0 or mixed old/new state.

Leaving the adopted STE unmodified keeps the kdump kernel using the crashed
kernel's translation. That gives the endpoint driver a chance to probe and
quiesce the device.

If the old STE was already abort or invalid, installing bypass would create
new DMA permission; leaving it alone is a safer failure mode. Later domain
setup still gets the RMR direct mappings through the reserved-region path.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Assisted-by: Codex:gpt-5.5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index f9220c007ad25..851bcebfdb3d4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5731,6 +5731,14 @@ static void arm_smmu_rmr_install_bypass_ste(struct arm_smmu_device *smmu)
 	struct list_head rmr_list;
 	struct iommu_resv_region *e;
 
+	/*
+	 * Kdump adoption keeps the crashed kernel's table live. Rewriting the
+	 * adopted STE here could expose an in-flight fetch to a transient V=0
+	 * entry, or change Cfg=translate to Cfg=bypass. Must skip here.
+	 */
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT)
+		return;
+
 	INIT_LIST_HEAD(&rmr_list);
 	iort_get_rmr_sids(dev_fwnode(smmu->dev), &rmr_list);
 
@@ -5747,10 +5755,7 @@ static void arm_smmu_rmr_install_bypass_ste(struct arm_smmu_device *smmu)
 				continue;
 			}
 
-			/*
-			 * STE table is not programmed to HW, see
-			 * arm_smmu_initial_bypass_stes()
-			 */
+			/* The fresh stream table is not yet live. */
 			arm_smmu_make_bypass_ste(smmu,
 				arm_smmu_get_step_for_sid(smmu, rmr->sids[i]));
 		}
-- 
2.43.0


