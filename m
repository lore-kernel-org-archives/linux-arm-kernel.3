Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791CEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8yVLhTNEHVMtNZQvE8C0mepFF5QZRCcqOIZQc7Y7/o=; b=si00npjq3HhiH9gTSiEKGCCvg/
	SOf4xH70kYM+2N3VF40Zh7nTWYeuSOyOYXM8rmJ8E69Gs6VDOKLvtpfeIMD/KcD8QuHKDFCxim2vn
	ladgqrrcrWzgvYKsucWFVgKR9VXRe+PyS6GmRZ1vIgLvqqYi3XlQ5oUcrxEe/ti8mCQp5TgjGJXJN
	5DEbbqRDQT9BseUX+PewfJc2m8Xry6tV1RoaF44emae7gUn4AiFLhwV5KubF6I9Yz+jL8BMHtsQRM
	Iu5A2Zv8yq8QSqrFn8qGmgKHHZQE5jckX+GvHZKFfjxn8/aodKMPIoLQXXIeIvNMHIlpBsu228wIQ
	/P1H7HPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYCf-00000000Hwt-1LJx;
	Wed, 08 Jul 2026 19:45:05 +0000
Received: from mail-eastusazon11012034.outbound.protection.outlook.com ([52.101.53.34] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYCc-00000000HuE-2ffo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 19:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOnZD5Y+QOo4dVprKREK48KcHLZP83pR1J11U/WRqKW7MezodiYm5Z7Hd3NLp8eNhzoYEWDetU2Q7CQeyGMYsldXX161x3ufTxk5GelbwhyeNZGg7pxMOjZf6/OFpZAckHnf4QMp9xrhirxLsYFiSqwM9h0yrUe1pgSco3ueEYW+RTg/47ULlsQnvlJ2VNWDH4gCKiggMDUPQCD4MCxDVqVpdrmmTT5z8KmRYj4vbHI5GaRUl3nlVWeL1x5rH3XgZ+X54FSM5zGiraHoIDbTNaTolzFVRxM2UcoW5HJi898j4H2N065t9niL5r0Au4xrpjIGmWP0P8SH1tlMxDtfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8yVLhTNEHVMtNZQvE8C0mepFF5QZRCcqOIZQc7Y7/o=;
 b=P8G2lV/IMRkWH3ZYEGW7EoYUTWHdQv62NfJKm/uqHpWiI74Tjq3VY4M0e+1bmRryJsxEWo+HThpzIfpX+dBJEvat2fb7JXMlzEmhnV20AAOcNwurbkLgnLKT0yyuEcIST0dOQ1UbCEkaoPCfHpE7F+o2C4yxzOJqk72yz7vjjqfRw3x6a0LTpQmlm9qP+1EiBVGY6C50LaPHkOa6yzDpHTP9RBuS4dB2S85KXBFQl/lr4hgypyJLMeu0Rm2RiRIWJoTbw9xZRCHC2ytp47ZHcz9/4uLwdPj4ibvO9PnqKE41rbjLO4kRm0FBb4omdjFbvtEbjNByn/NSdHw/rwMAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8yVLhTNEHVMtNZQvE8C0mepFF5QZRCcqOIZQc7Y7/o=;
 b=bWEmGoGuDE0JKCNX9fQXOXcdYhy2+ocSaL1QFK6cQnn9UvmurzHtIMSed2jBKJ52nZ5YV4fC+y5dNPwotkFmG8ZDN7ry/knZuoUW89uvwznYNB+XbBkimyH7WU+K6jcxk1Hzl6mOAfIyvmg5R6E4DwYAlFUSgFnk2cDUNjMWgJRCyaWVMVe74opVU2UPBAgI5+PnozeEz+qtVjSHbGC6nxmRn54bDojxYLKumsvTyRs+RclBQp6UxrIKQE32Q6zAdGnCwEY9zyz6T91vxK2RsfVrXWzSXYFX3obQE5Tcf2I7hNCD5iTVjOK7G15ZQlQQ+/fyTmmYW+guJhW2B5Qw0A==
Received: from SJ0PR03CA0130.namprd03.prod.outlook.com (2603:10b6:a03:33c::15)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 19:44:51 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::67) by SJ0PR03CA0130.outlook.office365.com
 (2603:10b6:a03:33c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 19:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 19:44:51 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Jul
 2026 12:44:40 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Jul 2026 12:44:40 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Jul 2026 12:44:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kevin
 Tian" <kevin.tian@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, David Woodhouse
	<dwmw2@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/5] iommufd/selftest: Convert cache invalidation mocks to the core array loop
Date: Wed, 8 Jul 2026 12:44:18 -0700
Message-ID: <4383c0afeba9795c9ae312826443fd7d5fc3fb58.1783539724.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783539724.git.nicolinc@nvidia.com>
References: <cover.1783539724.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a81231c-bdf4-47a8-1569-08dedd296063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|5023799004|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wmaZ294+PztdtTKbjT7KnoHM0fqOmR40sVNiQ9U2E3E9skCdeE1jRfRM4uvZlpPBjrvQ3ZB1vqoe5YaT8+ftIWADtN5RDVjgyI36RRMO17vzziPaYPG4NHBDZnay9KjU5Ra0fNLXFzJgYKAW8mjmlYJ/L8pD2SWnqVXOfgbze2LUtOj++xxM9m6T5Jn4IWjWlCIcUqsVFrL1FyB8dSrpZEbn6L70C0vAee3Lyt6JhaqNtqNpfuaQPTWPbfKwtM/1XSUnEM7gPlI14/p8gT76x7ej6eXjVGQxuD0vQ79zW64MmHAEqSETgdkLsaTAqz86s8Z2f4JfzX5IAy09Hf2hXhRHRJ1cWnisBMzm9G8AunlLB5hL+GmOXqSy4Ke3fOu7QVzY/SiYCD6pHCmF1WdoQmownpYgIA5IeViP4oEOIoIkCOH/iDDRyfsqHGL8pnJE3VbBsoijoQ1xBhL74Rt39qVtfNdYoWQZ0TCc5Ql3lnXY4qveHvIjhSzRqY+QBPK4NfCzvezP7f4dozoBpydwptO7W9mZBAspkNA9hz5AoVYSWFV1nCFFKSi9so8OEIa/1KgG4h2x4uRzJMG8xkGQamQXWmBzpHQHLD6QTe0PBFWbvksaN6dxQB1jkOHIbqEwmh3s+7+dCfT+xdRM5iTCO09ZUdGeJAbrXzhXWRTdJrpKoILEj7UqdhWtrNmvqPCQwFL8bdZWqiQYOaxYuos9zA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(5023799004)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GLbYQLLIjiAsV+kXNq/KuzwofdEOWSbdD+F7/PsVAsjG16BSDQo5FWJm2PKFKJ7JEYWGAdHELWoLn7ynUfoDgq/AfVso61LaWAEw/1xs/nHogHJ1Y3pzS2QJUHRtriEiDyKfOi1SE4hJcbfYPqofXgW0+PXEtZgRwqAC5Gv2jRQF+0Pp/NNViz+q0a7wWiXJ/ptmJIH6SmAfv9rL/kx94TPsKHli6b79MM00FsQmZJJCG3qjcEV3sLYsVCmVIZbRpz47F60W44nn62xvRePWZfLUZ/x+UzfP3T3j99qjJX0CuvLiQYLAbHjx0Ox/nKXzUMhLmL8jYqhuab7UwWEirxJ4XFRiBehObGegm2Ikf+q+WYs1/pdNCPzTu5B2bdJQI49Xb/RmC/DhR/3OJfRU2qRJSDOUHU3dWE2BYftmt3dzQ7h32U95LpJf6nCT6h19
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:44:51.3528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a81231c-bdf4-47a8-1569-08dedd296063
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_124502_682657_89A7EFB9 
X-CRM114-Status: GOOD (  22.54  )
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


