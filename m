Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B92C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bssftA5XRFlAN1N8d939rzfrgVyf+942s/j0hVlMLBE=; b=tbbPttOd+zIO5tEg9U9iUsswDc
	pq06l7G2GsePb6x+cBazncSI9li3NDNcSIh9ZMT0a0fQDt18U+czy8gK2O2RqG/5pTYBDo/owqYqU
	xOXf23KP3H0T37ZEoqFwH8w2mVybg9NsL8q2/PDbOBVwfKZY3wCGbiageXldZiFzvYJCdSnDzB2vp
	wUD2PPykficqtdXUqGMibcCwhfmjaWXeYkOTGlNAU/NNK4g8uVX9b7q5dwLahZ0isMSDxmK7UPQhm
	5GqlYSEno9ZvAqd+NY1DAJEUuXl28Pt5AwQ9XmKX0casTgWYWAvF2tR6v43gKQ/yvaSGzbmD+JxAD
	Va8U81Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiCm-0000000CvZp-18tv;
	Tue, 14 Jul 2026 18:50:08 +0000
Received: from mail-eastus2azon11011016.outbound.protection.outlook.com ([52.101.57.16] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiCb-0000000CvQy-1tAX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:49:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZXtKceVSbD5KkeZXs66Pu8N7frIjet/UWjXn3mY3CA8qy7bPjNl6+r0FaCf8/jtZbglxX4XlA1qRrO0EY3Wtdu+JmX1EwcG3kLgaMh8F1AIojKKnFvZkU7FsWf+fF207PtUlUISDjDH0e+yev81oS1uI04K7RQUGQjtvhf0RSU8NIYMkmrzZhMROXRtkzPNW7znDsnkVFKGeqd8QhsSXC5Z6BS0O7HQWdeyBfspfzHvZTo86ECQL/FhcRrVurKeS1HYy4k8FDYO1KgyaPP4yiJklflRS6dfmP5bKHqFY6tF9zOLYspBWkYj7R/ZSdeRJ5iFFPuYcKvGuinLrQ6b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bssftA5XRFlAN1N8d939rzfrgVyf+942s/j0hVlMLBE=;
 b=li/yfcR07PZmRjpPtrSxwyX2jEduGVhzw46mQclI50o00H4uGbhk7rB/NOXQ5kBfTkjJ7vVpjoOYydwIcF7ROtiOA7E/rZNBOEdd1+1bbRFqajn78af4vENARxYYxBkTvHSHb/5QE9WFEiBRcZSrKLWabc5463XTpqvMTlfRM5Pq8M8sTqIg0pMOFplqPwKJeuEDnJvrzi+A0STIrDSjEbhsD5by3lVu0ysJn/y+Cp3UOrYdX3C7Qar5BIgOoxe2RdIIiRFca3CezsW4pMY3LrapxIdnpfxaLuzFcfZEHbva0xUYw3h05k72Q9rP8g80UyvjBUeeQGm243VO0s5l1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bssftA5XRFlAN1N8d939rzfrgVyf+942s/j0hVlMLBE=;
 b=svmX0FBF78jLz2MX3BLq1NTCBYgVdjLkLg/ztepfn0yvLePeyII++yE7y4UXh0ioX0sw5KdyZ2HrWV0+SxbbH8t5laz/SqQd/ACMJLXoqlkHjV1RK8A01hgknmWXSxSTxF9KQWCRjUhs8lO/36emsaCWQ1A/fWDQiKo9ZcyZEZR5qo/ZfgChevzmapTl1DCqWQ7nTbNwTkHD6v351AxrdxdQ8Wqixri6d526RCAjdx1EhLTAYv70O/jSwuXPT3UN+V8kro17skuQ8BrVZxGKJWCfmMyHupYWIRdPZhesi2YC02H8ixurkbkG71UdkSEosDPdZQI/XfQuXKOplZXisw==
Received: from CH2PR02CA0018.namprd02.prod.outlook.com (2603:10b6:610:4e::28)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 18:49:46 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:610:4e:cafe::97) by CH2PR02CA0018.outlook.office365.com
 (2603:10b6:610:4e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 18:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Tue, 14 Jul 2026 18:49:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Jul
 2026 11:49:20 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Jul
 2026 11:49:19 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 11:49:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kevin
 Tian" <kevin.tian@intel.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, David Woodhouse
	<dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Pranjal Shrivastava <praan@google.com>
Subject: [PATCH v4 4/6] iommufd/selftest: Convert cache invalidation mocks to the core array loop
Date: Tue, 14 Jul 2026 11:48:50 -0700
Message-ID: <96168e6523d81dec0b69e1ae3b22ed5cc51afe97.1784054606.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784054606.git.nicolinc@nvidia.com>
References: <cover.1784054606.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df66313-9ca3-48ef-d138-08dee1d8aca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|11063799006|5023799004|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: /2oImZNk9icsU6fIXyFt/Vd9MSH2P/xXZY9iJcRTrK9G9/dnZZZ8ejLPzCWZFJ346v8mSIuOiGOZHAmBOTyZIpqU1XRme+1+eU9Cvi+ZIbddTmOX21sa61IcWzB3sSZPmXEj3pLEX0aYzL9Ahl1x3oTf1Yg8Vjb3yFBcSYGBCZCnd9W4qEyTu2KYrPWwXUHxLS2L2I18MkTfmt4N5IodROt3nbjg2OlirPGMPTyNiu0+bYYHVvo2ujT3MA4np+f3aGR1Pjh+eVo7x7+kMzM0zClLyR29id528KxtofYWkE2/JT15rrMA8qgLsFeGt3sLGzVC709LU8aM9IxxV+fqCn1uV1fj57Za14/86q/zTr8UIR2TNoLLXnrmv0/u8N1lkqBb57cJdJEUgMbPlQzzZlp3+RnFf8wRQul7j8SVtPJSyA1VMm8V3RWpDOvSDlQXCWpid3kDMMMjnqYwlgfpZ+/ZGECVM1Kj/Gk/OVQ00u4/SZp3220ZI2aqO2OK0ijIr7B/2rrGD8LSLPvzwTWbiXuB6L/ZtfjlEtLhEasfQQhKjkr532Kn7XqJbMTcmgGGi3TVQf0FphGOp2+yVZ5Aw2SgSavWZZZuz8fBglP4IbYhAjA8GP2+znmso0mGttMQlCAvj/CJz0BmeyXKudbgrXipd9FSdnRw8xa1vPpIvJQewQytyd8W/xYaw1wH5jNTjCrSj8ZDhegNES4rs3t6jQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mJegaz4fVbOz1cwD7yWDpVK+E5VxHL/zMwQ53luVB/0RtSmqZ1/+TSL+iomeQCFERb8oJCSinDxIlR6zUqSxBbjqDmZC4857ObqPM39D2blOLOdqqEIR0nONbNRggSvrUJ8igTfFV1rSMker/8PkHqXupXTNud9YIAN7aogunGGMolqluJWpXsDr21ha1fYY2P/gnLvPxX0yge0O0+L8Rfml07g29Hv/LTW/r/fYxdjfx0UMuW55cM1Frj/88mZpiEzfrSUZq9xRG8A4g8+/2YvbrxjRcC5acMRG/tiWnyh76hZjX4Pe0JTDU/vHIdKiP4CnYVgHYxQTwIc1sWlJkq8AAO84shVAG6bRi+OAjOO4jpYDy9no4o28SAQ8pvdYUHTXSXT1s9D4EEj++5of+XuodnV5flM5Q+brw9TW2D3ZYI6oA/DKwXKngfdXqbuJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 18:49:45.6893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df66313-9ca3-48ef-d138-08dee1d8aca2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_114957_608567_F34F5D36 
X-CRM114-Status: GOOD (  21.46  )
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

The vIOMMU and the nested-domain selftest invalidation mocks each used to
walk the whole request array on their own, with the vIOMMU mock even
allocating a buffer sized to the entire array in order to do so first.

The iommufd core now iterates the request array itself and re-invokes the
op with the not-yet-handled sub-array, so handle just a single request per
call out of the front of that sub-array and report one handled entry via
the array->entry_num. Drop both of the loops and the kzalloc_objs() in the
viommu callback function, and keep returning a success for an empty array
as a probe of the selftest data type.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/selftest.c | 147 +++++++++++++++----------------
 1 file changed, 72 insertions(+), 75 deletions(-)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index af07c642a5260..75846cf1f9c44 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -631,70 +631,63 @@ mock_viommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
 static int mock_viommu_cache_invalidate(struct iommufd_viommu *viommu,
 					struct iommu_user_data_array *array)
 {
-	struct iommu_viommu_invalidate_selftest *cmds;
-	struct iommu_viommu_invalidate_selftest *cur;
-	struct iommu_viommu_invalidate_selftest *end;
-	int rc;
+	struct iommu_viommu_invalidate_selftest cmd;
+	struct mock_dev *mdev;
+	struct device *dev;
+	u32 processed = 0;
+	int rc = 0;
+	int i;
 
-	/* A zero-length array is allowed to validate the array type */
-	if (array->entry_num == 0 &&
-	    array->type == IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST) {
-		array->entry_num = 0;
-		return 0;
+	if (array->type != IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST) {
+		rc = -EINVAL;
+		goto out;
 	}
 
-	cmds = kzalloc_objs(*cmds, array->entry_num);
-	if (!cmds)
-		return -ENOMEM;
-	cur = cmds;
-	end = cmds + array->entry_num;
+	/*
+	 * The core re-invokes this op for the remaining requests, so handle one
+	 * request per call. A zero-length array only probes the type, validated
+	 * above.
+	 */
+	if (!array->entry_num)
+		return 0;
 
-	static_assert(sizeof(*cmds) == 3 * sizeof(u32));
-	rc = iommu_copy_struct_from_full_user_array(
-		cmds, sizeof(*cmds), array,
-		IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST);
+	rc = iommu_copy_struct_from_user_array(
+		&cmd, array, IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST, 0,
+		cache_id);
 	if (rc)
 		goto out;
 
-	while (cur != end) {
-		struct mock_dev *mdev;
-		struct device *dev;
-		int i;
-
-		if (cur->flags & ~IOMMU_TEST_INVALIDATE_FLAG_ALL) {
-			rc = -EOPNOTSUPP;
-			goto out;
-		}
-
-		if (cur->cache_id > MOCK_DEV_CACHE_ID_MAX) {
-			rc = -EINVAL;
-			goto out;
-		}
+	if (cmd.flags & ~IOMMU_TEST_INVALIDATE_FLAG_ALL) {
+		rc = -EOPNOTSUPP;
+		goto out;
+	}
 
-		xa_lock(&viommu->vdevs);
-		dev = iommufd_viommu_find_dev(viommu,
-					      (unsigned long)cur->vdev_id);
-		if (!dev) {
-			xa_unlock(&viommu->vdevs);
-			rc = -EINVAL;
-			goto out;
-		}
-		mdev = container_of(dev, struct mock_dev, dev);
+	if (cmd.cache_id > MOCK_DEV_CACHE_ID_MAX) {
+		rc = -EINVAL;
+		goto out;
+	}
 
-		if (cur->flags & IOMMU_TEST_INVALIDATE_FLAG_ALL) {
-			/* Invalidate all cache entries and ignore cache_id */
-			for (i = 0; i < MOCK_DEV_CACHE_NUM; i++)
-				mdev->cache[i] = 0;
-		} else {
-			mdev->cache[cur->cache_id] = 0;
-		}
+	xa_lock(&viommu->vdevs);
+	dev = iommufd_viommu_find_dev(viommu, (unsigned long)cmd.vdev_id);
+	if (!dev) {
 		xa_unlock(&viommu->vdevs);
-
-		cur++;
+		rc = -EINVAL;
+		goto out;
+	}
+	mdev = container_of(dev, struct mock_dev, dev);
+
+	if (cmd.flags & IOMMU_TEST_INVALIDATE_FLAG_ALL) {
+		/* Invalidate all cache entries and ignore cache_id */
+		for (i = 0; i < MOCK_DEV_CACHE_NUM; i++)
+			mdev->cache[i] = 0;
+	} else {
+		mdev->cache[cmd.cache_id] = 0;
 	}
+	xa_unlock(&viommu->vdevs);
+
+	processed = 1;
 out:
-	array->entry_num = cur - cmds;
-	kfree(cmds);
+	array->entry_num = processed;
 	return rc;
 }
 
@@ -875,42 +868,46 @@ mock_domain_cache_invalidate_user(struct iommu_domain *domain,
 	struct mock_iommu_domain_nested *mock_nested = to_mock_nested(domain);
 	struct iommu_hwpt_invalidate_selftest inv;
 	u32 processed = 0;
-	int i = 0, j;
 	int rc = 0;
+	int i;
 
 	if (array->type != IOMMU_HWPT_INVALIDATE_DATA_SELFTEST) {
 		rc = -EINVAL;
 		goto out;
 	}
 
-	for ( ; i < array->entry_num; i++) {
-		rc = iommu_copy_struct_from_user_array(&inv, array,
-						       IOMMU_HWPT_INVALIDATE_DATA_SELFTEST,
-						       i, iotlb_id);
-		if (rc)
-			break;
+	/*
+	 * The core re-invokes this op for the remaining requests, so handle one
+	 * request per call. A zero-length array only probes the type, validated
+	 * above.
+	 */
+	if (!array->entry_num)
+		return 0;
 
-		if (inv.flags & ~IOMMU_TEST_INVALIDATE_FLAG_ALL) {
-			rc = -EOPNOTSUPP;
-			break;
-		}
+	rc = iommu_copy_struct_from_user_array(
+		&inv, array, IOMMU_HWPT_INVALIDATE_DATA_SELFTEST, 0, iotlb_id);
+	if (rc)
+		goto out;
 
-		if (inv.iotlb_id > MOCK_NESTED_DOMAIN_IOTLB_ID_MAX) {
-			rc = -EINVAL;
-			break;
-		}
+	if (inv.flags & ~IOMMU_TEST_INVALIDATE_FLAG_ALL) {
+		rc = -EOPNOTSUPP;
+		goto out;
+	}
 
-		if (inv.flags & IOMMU_TEST_INVALIDATE_FLAG_ALL) {
-			/* Invalidate all mock iotlb entries and ignore iotlb_id */
-			for (j = 0; j < MOCK_NESTED_DOMAIN_IOTLB_NUM; j++)
-				mock_nested->iotlb[j] = 0;
-		} else {
-			mock_nested->iotlb[inv.iotlb_id] = 0;
-		}
+	if (inv.iotlb_id > MOCK_NESTED_DOMAIN_IOTLB_ID_MAX) {
+		rc = -EINVAL;
+		goto out;
+	}
 
-		processed++;
+	if (inv.flags & IOMMU_TEST_INVALIDATE_FLAG_ALL) {
+		/* Invalidate all mock iotlb entries and ignore iotlb_id */
+		for (i = 0; i < MOCK_NESTED_DOMAIN_IOTLB_NUM; i++)
+			mock_nested->iotlb[i] = 0;
+	} else {
+		mock_nested->iotlb[inv.iotlb_id] = 0;
 	}
 
+	processed = 1;
 out:
 	array->entry_num = processed;
 	return rc;
-- 
2.43.0


