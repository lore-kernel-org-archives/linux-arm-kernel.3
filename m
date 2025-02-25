Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110D8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1PBtA0nWPMf1GqEAuJn+ZSwJlfKukhl+iKUn1Pwuzk=; b=KACXgBQScqvgmL+gQVV4Y07eUL
	OoSc0cPlefImS5vcfH98dG0z9szqm/zu86VZsQ8Y3Vr/Y1T1oXDEPvy0dh40hKA0DTj3FmCLz/5OM
	jCIA3wb7V9h+fBdaNU1RIzR2dutb72xzHFx8VlYAMyRhXu9wK61JrCaV6Vxu2ZniyBYNEowQnJRfp
	weB6amSa+cTL4KlFWDX7y3Nkf83In+BXxMpfALGBT13dsSuIxE7kI6Esuxh+Nf/fdOPzpIy81bx6z
	8W3NUsDZq1lP1VL1TM2B6Y2U8+zgaSi8jmu7BYy50sTFBZY/PaOn18mL9C++/3Zkpcpg9atpBvSqQ
	8AYDg8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzF4-00000000npK-39bA;
	Tue, 25 Feb 2025 18:01:14 +0000
Received: from mail-mw2nam10on2061b.outbound.protection.outlook.com ([2a01:111:f403:2412::61b] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyhZ-00000000dKm-09e0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:26:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjFR9nw94fmVjU8/TPRMpI+8vJyATH7UyV9Gu2AmU41upCD0mXc2wCOvXAzhkRH/OQPr9qUaIoflQtMey+rsOC8L2Qj8QHbtCNZhQ9qzFh6dK0suEhVB/AkB0TwdhCghTQVpXEcmSWmjVdmAcVQkCSkVMy7veZRi/F51ZjAp7t8Kw5dbQVoY+B3Y2EfbVnZeWMK2DGmYKNZ/g1u0DDHn/ISs6sVz9r8OMmN4vepLwK3yiScKTkTjFvprf7X+rpPeOhZnenUQvteJqBuBm26SY3GL3FjqUkQ7QMWWBeH0PGQGwSYoESCH1pOkM+fiLtnxVy/nvLi41oz15tR7W+oMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1PBtA0nWPMf1GqEAuJn+ZSwJlfKukhl+iKUn1Pwuzk=;
 b=VdOwFMzxKse7bruQiqdyw3r9JlMxTLBe61lFxr8W3BSc8OwPB56UXY//mc2Z087HPlYCAqxWuZgjsDoV2AXfPU3frNwxjqUXtGa3VKztbrYf/wSK5Lq800IKPMuExkrDHIXyzuID+oiud3PP/tV1DwbtmXzuKFr/BciprkoU4USqxxJIWq+F9WjDB2EWQlhPh+op7aZnVUYoGlsdJKfYaqtwlw4jj9PpfQcwMSBXfPSyHYRU8N9FbknTQA3qfeiFozrj8tlGtkg2spKd3MFcqTIKDGTAoBpmZwlL5yyBiklO2xJ+EdS3GuFnQ3yUMq0sEgRf//1BIOw4Blwttm4HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1PBtA0nWPMf1GqEAuJn+ZSwJlfKukhl+iKUn1Pwuzk=;
 b=HfAOsLXHq4Zx9JGlD2cX973OpNg74uLJ4z8blGtwnTaHbyrA1BFvC4zDfTCieNQEU0wKB8abE99v0PFpmwu+scxiuY1aGo886icI5DgJr6Y2jvhpwqVT76mOu5bhZWay3dvchsNdhEYMhrt/KPDulGRL+uXj4v4aFKVfdMbHWPD6V9npVr+oyfWTo5uhwH0VdfWncWdzSQgkuNDsKoRpRdT/kI7k23UZIfQEc7dKuNz0NG9uWqlaueV/U/pY8Zu5FTzUgOLUHtp4xgHUVvNBEXTd4/3tSBiCDoFRbuRk5mpvyXH3MVlj6PSLtVjkORImrfCvMmoPCJOC1trkaNG6OQ==
Received: from BN1PR10CA0020.namprd10.prod.outlook.com (2603:10b6:408:e0::25)
 by DS0PR12MB9059.namprd12.prod.outlook.com (2603:10b6:8:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 17:26:33 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::d2) by BN1PR10CA0020.outlook.office365.com
 (2603:10b6:408:e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.17 via Frontend Transport; Tue,
 25 Feb 2025 17:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 17:26:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 09:26:05 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 25 Feb
 2025 09:26:04 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 25 Feb 2025 09:26:03 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v8 08/14] iommufd/selftest: Require vdev_id when attaching to a nested domain
Date: Tue, 25 Feb 2025 09:25:36 -0800
Message-ID: <037fe78b0de0d6aeece6ded3a384cdd0ef8f0d3d.1740504232.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740504232.git.nicolinc@nvidia.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DS0PR12MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f3c410-7d01-47e3-16be-08dd55c18c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BFD+ZbgthvXFaImy9LkFShc26TgJcEpOHh0tZL0uRBf/PFPiNCjRSLLW8k8w?=
 =?us-ascii?Q?fkm8duDKyjZ0oT0EAqqle/6K3anHLG7N0NLlL5XqaGKH6dMGBCH6a2v95Apd?=
 =?us-ascii?Q?tluK5a8bwbS0PQVA5NckvU7WebaaI343EdxX7WtYaylDPTKsJCcmczLhWaEU?=
 =?us-ascii?Q?fcBqiiItoJlPjvqYn2g+H/B0QkkYstVzi4GzMUh5PA6y/rs35RfhXAdO5J7b?=
 =?us-ascii?Q?/fVuBcrmoginU3lMfWj+237OmzUZ3mz3wcenpDtnVMJzQrXvDvxWPut1nP9r?=
 =?us-ascii?Q?mNBrEegsuV5PlEysBLXgMondh9QHoE8hYL7wimVW+y2p9ZU3nJF+Y8hJFqoj?=
 =?us-ascii?Q?TRKY/I6v/rrmcg8dDlbneaboidU0JQELsBKClCBVk4wVK7k0Vktd6VktSe8Y?=
 =?us-ascii?Q?dvFERBNbI8bbI107o7vp4yfKlVY9oFJb54rCuGwDbhvBvXXN3O9kFaLsb23B?=
 =?us-ascii?Q?vlg62tLziLas3arSmy7aY2rquibHbbEhRCCEd6logOWOSwnP5d6oaKSrDwHR?=
 =?us-ascii?Q?tiT/KMYSX/kCIq+YbaNt3Q1ggPfVkff5zy29Nju/E0bI83UQF1dvU/rsBoC+?=
 =?us-ascii?Q?p14r1ulGQ8tThT0AE5sDZSk72lT2k291sI/dzMvgtHDV7Fl+WqgcDaHaT1OM?=
 =?us-ascii?Q?gRHxpMd1mqGYrqoVfnH5ACG5aGQS44dcSj8x0KPVm9S0mF0ZfsS1t+jbJjHY?=
 =?us-ascii?Q?exM0W33N5oSO2YNzGlYQ4CzSoB9R7O0zHkYX5OVK65/u6/sswvv5UR5JGfU3?=
 =?us-ascii?Q?qn26vwMeUfdiX7E8qqiyz6v+08yHyj0bGppOohoQQNFt8TKIruwyqZnj83mk?=
 =?us-ascii?Q?/HOnQHHSLfE5EHO3PNL0aGNwiO9qSPjtrDj+0a83ACKb3bl/JCfUb2xuh1yi?=
 =?us-ascii?Q?G1rULSWDuG7tLTT5FnkmisZv2BpY1cIA119Tuf3maHLqSP3yS1ryvTRTBDtZ?=
 =?us-ascii?Q?myrSl3GFN7mFQ1IbyVgydSo/DhQ+NhVIFYhmHHAz9WMXKky7ffW0kYhhkVbZ?=
 =?us-ascii?Q?2h5P+INb92yLht0H0B9+8OpuTLTFMFBcInyfe3zID5mSaM1Wl2XaqLZeA6Xg?=
 =?us-ascii?Q?IUR3lxgMZt0oodAPfx7gr80vy3cMDENriXbp//BbdQJ1KFPDl4P4l7TQJ/SR?=
 =?us-ascii?Q?hpAa5gWEijASzBu7aolWatXC+7Y+6XjKuFASx3VVrjpFI5So1TuZs9Kj3MdN?=
 =?us-ascii?Q?YPEK1eUJuzURGUYZBHllvGsKyVWXP4U/4/6yKt96BRvnxddi1Mx5foysi8Tz?=
 =?us-ascii?Q?ghvWYYLTerGMz9e12++tQktv0w8FdJSz+4fCuSgKs07pZKTcRx9Ic+QssxM2?=
 =?us-ascii?Q?yKYG+tdrEZYmkyptuo2hSJ6uOlFNELflQzhhQGUiKQOfBkyGgLqyh1q2Gafo?=
 =?us-ascii?Q?UM9B+pI66wcf9RbfLV6BJx59r3VP8glL+ALv76md7PkJRM7HNNLP46WX6hLa?=
 =?us-ascii?Q?y/mXG5kuB8EMb2Tazz4n+4YeX+XpKxLD36pI+qKMqm9LlxxSdsw0oFX6umYv?=
 =?us-ascii?Q?YMFR8M9t0R5IWeg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:26:32.8217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f3c410-7d01-47e3-16be-08dd55c18c7b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_092637_079214_63EABCC7 
X-CRM114-Status: GOOD (  13.66  )
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

When attaching a device to a vIOMMU-based nested domain, vdev_id must be
present. Add a piece of code hard-requesting it, preparing for a vEVENTQ
support in the following patch. Then, update the TEST_F.

A HWPT-based nested domain will return a NULL new_viommu, thus no such a
vDEVICE requirement.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/selftest.c        | 24 ++++++++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c |  5 +++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index d40deb0a4f06..ba84bacbce2e 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -161,7 +161,10 @@ enum selftest_obj_type {
 
 struct mock_dev {
 	struct device dev;
+	struct mock_viommu *viommu;
+	struct rw_semaphore viommu_rwsem;
 	unsigned long flags;
+	unsigned long vdev_id;
 	int id;
 	u32 cache[MOCK_DEV_CACHE_NUM];
 };
@@ -193,10 +196,30 @@ static int mock_domain_nop_attach(struct iommu_domain *domain,
 				  struct device *dev)
 {
 	struct mock_dev *mdev = to_mock_dev(dev);
+	struct mock_viommu *new_viommu = NULL;
+	unsigned long vdev_id = 0;
+	int rc;
 
 	if (domain->dirty_ops && (mdev->flags & MOCK_FLAGS_DEVICE_NO_DIRTY))
 		return -EINVAL;
 
+	iommu_group_mutex_assert(dev);
+	if (domain->type == IOMMU_DOMAIN_NESTED) {
+		new_viommu = to_mock_nested(domain)->mock_viommu;
+		if (new_viommu) {
+			rc = iommufd_viommu_get_vdev_id(&new_viommu->core, dev,
+							&vdev_id);
+			if (rc)
+				return rc;
+		}
+	}
+	if (new_viommu != mdev->viommu) {
+		down_write(&mdev->viommu_rwsem);
+		mdev->viommu = new_viommu;
+		mdev->vdev_id = vdev_id;
+		up_write(&mdev->viommu_rwsem);
+	}
+
 	return 0;
 }
 
@@ -850,6 +873,7 @@ static struct mock_dev *mock_dev_create(unsigned long dev_flags)
 	if (!mdev)
 		return ERR_PTR(-ENOMEM);
 
+	init_rwsem(&mdev->viommu_rwsem);
 	device_initialize(&mdev->dev);
 	mdev->flags = dev_flags;
 	mdev->dev.release = mock_dev_release;
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index a1b2b657999d..212e5d62e13d 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2736,6 +2736,7 @@ TEST_F(iommufd_viommu, viommu_alloc_nested_iopf)
 	uint32_t iopf_hwpt_id;
 	uint32_t fault_id;
 	uint32_t fault_fd;
+	uint32_t vdev_id;
 
 	if (self->device_id) {
 		test_ioctl_fault_alloc(&fault_id, &fault_fd);
@@ -2752,6 +2753,10 @@ TEST_F(iommufd_viommu, viommu_alloc_nested_iopf)
 			&iopf_hwpt_id, IOMMU_HWPT_DATA_SELFTEST, &data,
 			sizeof(data));
 
+		/* Must allocate vdevice before attaching to a nested hwpt */
+		test_err_mock_domain_replace(ENOENT, self->stdev_id,
+					     iopf_hwpt_id);
+		test_cmd_vdevice_alloc(viommu_id, dev_id, 0x99, &vdev_id);
 		test_cmd_mock_domain_replace(self->stdev_id, iopf_hwpt_id);
 		EXPECT_ERRNO(EBUSY,
 			     _test_ioctl_destroy(self->fd, iopf_hwpt_id));
-- 
2.43.0


