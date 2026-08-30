Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7530C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 22:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kHouXK6Nt6M9Rsk/xWF8aeIpWHaFYDAPur/bFB/sdI=; b=ClSLbSs6yl32Idya0E8sOfQ0KL
	yGJivaSVwUArY3z3zhBSU6TSp814AhMO55T7ozimoQs/kXz6jWbWKYAqZC/IMIeyWz8rD4ZMeSzGg
	UHhJ4gAfpoa8C9/ZDA06DQA+SNdzoMlhttX0/MMpEFpWV5Bv0VC/tt7IzwQTX+HUT7UPrxf/R4cNN
	8mPj8gwgnRUDgbWA95khz4sdl1yGBaEmFk34oCQhw3yVfNTu+LAVuXplM5CIAgyZFbQ5J9xwLEYlK
	keg9l1SMhsekErifxUxSDH1vgyrmfWjMPeZDmn6P2xcp/SDo+qB6vmaSWHwAwgEsfLVpjPQyrjwPn
	qsHJFMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0o08-00000008B35-0hbw;
	Sun, 30 Aug 2026 22:27:44 +0000
Received: from mail-southcentralusazon11012067.outbound.protection.outlook.com ([40.93.195.67] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0nzx-00000008Azr-3tgp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 22:27:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSQLfrZriFLUJituKAOWTFgrCzoccSDuX09DluRT2LK4M7oQEA71mNSErmk5zssKHe+5uw26DDgI0qgM/3X5aPFIQM4tCRwd3P7tS1LHDO+l+Qt7CKnK/X79jFmlJiWg5Gi2YdmUr1Cv4u1u+JXMozEJY0r0Od4ofCPZ3vrTxypaJzRiwTCOZ7Ue3OyAgEwRp0ng645j41JKnU1iOAYvaYFN7yPeMGExBVd0EFvANoDhBTu2sae9o1Dn56cJnrO51HbUxqgy4mrEeXyYHkBOdrUtF/7CcR0YZG5HciJlLUUCRJkKomYrCq6nr3HkwYGC2XvP7AEiW3TuCmN9eBF5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kHouXK6Nt6M9Rsk/xWF8aeIpWHaFYDAPur/bFB/sdI=;
 b=kQWQST6GIbrn+Qk0INk9+V238hi9Vkn7TOppK3EsfqJAKWYb6ho0FMqref45l7eMYx8uz331DCQAny67GTQbOY0ImxpPx0yU2nXCZ1Z8vzqxYHY8a9xTIGduvb3/4EtRdkj9lecBUjSbbvSHsfSHXAIXWPViCZko3egWYycx74BPtpetVOw/gmPQu5SBWIIE3BNY7vF92YdOY1l4mdRR4qWJN7nt+BRcvtBaQxX6TMRLF2BiR230BzMF+hnfGKhcyeAY0xKbUHs0KCjDu0/y96nhzcdAZfR9KbkHkiCHgfnMu1bfNMXd9MXxIMcgZwyfrGtx3PPFTgrWHqh6e0D4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kHouXK6Nt6M9Rsk/xWF8aeIpWHaFYDAPur/bFB/sdI=;
 b=hvWud7DMzEnf6dg3510pDxvDEtnZnREGGgbKoBFqr+DcnOagLlq9R2Jbk73h6EMRFyHEDccQIryNpHvJYFPvUxDfI9I/Tstv2PGd4WVrAySD9NVrLijJ0J07NOfMMir6J5/FjMop0ohiM+8zHRgZBlrtOfcPxTCCDCsim415jTIi2+L05m2KjCyhOHeEWzeYn2pSC+N1JgAPYwPYb8B+twt8ao3YZStm4M9VN35odkQiyT5qh0yafHBaYN48ZJssO440g63c1J8cBbkPdsMdLydvYCfoFor3P1Jtp0bXYB8XeYOlbdPFUlT4MEyUG25bB5TnyZLgur9n1w8bMicyCQ==
Received: from CH0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:b0::28)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 22:27:27 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::20) by CH0PR03CA0023.outlook.office365.com
 (2603:10b6:610:b0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 22:27:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 22:27:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 15:27:19 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 15:27:18 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 30 Aug 2026 15:27:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Pranjal Shrivastava
	<praan@google.com>
Subject: [PATCH v6 5/5] iommu/vt-d: Convert nested cache invalidation to the core array loop
Date: Sun, 30 Aug 2026 15:26:42 -0700
Message-ID: <1a668edccc94a2469df993d42609b5909f6f1dee.1788127877.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788127877.git.nicolinc@nvidia.com>
References: <cover.1788127877.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: a328ee0a-2da9-4ab4-7cc8-08df06e5df2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|10067099003|5023799004|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NmoPvn0dIxtGSHebxiuT6Vl4uXmOg/G52g++w7qotoohw4LjClSscZYpUa8tANyAR3sM1XHzuiQTXamD07pyU0tS2344zCecPhl1F/zdapmbL/QxUMAmQ5IiYS53edSFyVl5pDPVWG0RZdwE/smm7qdIDIcRILrI2BF4Gf+opjRvJzKD72OtgDdV5pMUVBABYHJ8UsA0DdEC9/qxu67tGk1irL9hqp6wOh6/+5wjT/PyPP089HWgjAKo59HdhM+XF3jKV9twR2IqgM12HCA263HpV18QmX7Uhy7mHP1OIs1QFJbJgV75+9skGnqyMF/wRwfLVNBRIu8mL0q5uxccT+zOWGnOBD9NAcO+j5Q1zUTRxlF2dcWs8VBnTS9QhIJZSg78XaQan3kduROyn/xStZhWwjMRz1xjJY8POhPu/IycrBB058aRB6w6BxDElDZZJ6HIpQPqhOWmXkRXm0QeWhZDPKonywSslA4L1esKzarevKuHaIx2x6Pa5OKKYn7n+smj/HZ/5sxKXf6VCpGQpYZ15eqWOTaZrBTDZ8B8Vn8BhvTtfIhWwRsCMIh10doLKVJpiBjyw8n7WZcpiYAamCOZET5P8M7bT3uW3brTyQ53WqztKHYNKFTF3undmJJAK5thSyAlvE287yzvgVhQQaSMijCLO4otp12fcFcojAxnMf0CY41fjxX4k4hTRZop1J0OcPlYCWzcEipYwGloeQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(10067099003)(5023799004)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +phTEdrRJuUR2t5XpKxnQavYQ/AGCFL9S0qulyXZkADgtSaqMGCK9g6Q3q1H0A2h6e3mAAhH/9ZJ06nU3+Kwp2fheJ7rJJGhnfbGKRyiHrym0nXG8yR29UrWKtv74OpbDV2qswIG04GV+LLfuLEaas2z5ROFCPA1CpYwo2Ge5f/fa3hSxiXAeAbkWhqflmX0P6kUXFniY3IFDeuwF4tuaSHT/x/yUpfyFssVd9DwoDfLaVJpWsSREuHE28IfxLKGNMwuVK64kgo9yTPqZbOjQS6U8JZpz66yScTgGp7ldNbgA8D2fNYLIM9lLIK9UX6HQTdqXlsUtnm5Sx5j4uImsxVdq0bB989AWWq3qqL+xUvsxjnGH9yHvlQ85tIjZrumRqGKWwSlhNgz5th+4Y+4N60oFAc8KTcT8SUY5DZj7QLdYsPir0048lpsIOJsPnUk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 22:27:26.9805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a328ee0a-2da9-4ab4-7cc8-08df06e5df2b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_152733_980400_2B268B08 
X-CRM114-Status: GOOD (  16.12  )
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

intel_nested_cache_invalidate_user() used to walk the whole request array
on its own, copying and then flushing one single entry at a time.

The iommufd core now iterates the request array itself and re-invokes the
op with the not-yet-handled sub-array, so handle just a single request per
call out of the front of that sub-array and report one handled entry via
the array->entry_num. An empty array keeps returning a success, used as a
probe of IOMMU_HWPT_INVALIDATE_DATA_VTD_S1 support.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/intel/nested.c | 54 ++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/intel/nested.c b/drivers/iommu/intel/nested.c
index 2b979bec56cef..36e0e8e85c065 100644
--- a/drivers/iommu/intel/nested.c
+++ b/drivers/iommu/intel/nested.c
@@ -93,7 +93,7 @@ static int intel_nested_cache_invalidate_user(struct iommu_domain *domain,
 {
 	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
 	struct iommu_hwpt_vtd_s1_invalidate inv_entry;
-	u32 index, processed = 0;
+	u32 processed = 0;
 	int ret = 0;
 
 	if (array->type != IOMMU_HWPT_INVALIDATE_DATA_VTD_S1) {
@@ -101,31 +101,37 @@ static int intel_nested_cache_invalidate_user(struct iommu_domain *domain,
 		goto out;
 	}
 
-	for (index = 0; index < array->entry_num; index++) {
-		ret = iommu_copy_struct_from_user_array(&inv_entry, array,
-							IOMMU_HWPT_INVALIDATE_DATA_VTD_S1,
-							index, __reserved);
-		if (ret)
-			break;
-
-		if ((inv_entry.flags & ~IOMMU_VTD_INV_FLAGS_LEAF) ||
-		    inv_entry.__reserved) {
-			ret = -EOPNOTSUPP;
-			break;
-		}
-
-		if (!IS_ALIGNED(inv_entry.addr, VTD_PAGE_SIZE) ||
-		    ((inv_entry.npages == U64_MAX) && inv_entry.addr)) {
-			ret = -EINVAL;
-			break;
-		}
-
-		cache_tag_flush_range(dmar_domain, inv_entry.addr,
-				      inv_entry.addr + nrpages_to_size(inv_entry.npages) - 1,
-				      inv_entry.flags & IOMMU_VTD_INV_FLAGS_LEAF);
-		processed++;
+	/*
+	 * The core re-invokes this op for the remaining requests, so handle one
+	 * request per call. A zero-length array only probes the type, validated
+	 * above.
+	 */
+	if (!array->entry_num)
+		return 0;
+
+	ret = iommu_copy_struct_from_user_array(
+		&inv_entry, array, IOMMU_HWPT_INVALIDATE_DATA_VTD_S1, 0,
+		__reserved);
+	if (ret)
+		goto out;
+
+	if ((inv_entry.flags & ~IOMMU_VTD_INV_FLAGS_LEAF) ||
+	    inv_entry.__reserved) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	if (!IS_ALIGNED(inv_entry.addr, VTD_PAGE_SIZE) ||
+	    (inv_entry.npages == U64_MAX && inv_entry.addr)) {
+		ret = -EINVAL;
+		goto out;
 	}
 
+	cache_tag_flush_range(dmar_domain, inv_entry.addr,
+			      inv_entry.addr +
+				      nrpages_to_size(inv_entry.npages) - 1,
+			      inv_entry.flags & IOMMU_VTD_INV_FLAGS_LEAF);
+	processed = 1;
 out:
 	array->entry_num = processed;
 	return ret;
-- 
2.43.0


