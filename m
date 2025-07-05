Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FACC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 01:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPX5OLpcfsjCdI3t+nTw3w4HEXttKkhit5rWu1qXvCQ=; b=4aC2tfmDUtNrOVOLThIUC99/i3
	Gj2TOuAxHOwQrN5Ve6s2BIDqPWvJUpU/7v8gb1z21MQ24LfCnGH5O3GBF/81nQ1Sr6N7/d9aKJS9O
	mupP9VSQJ1R6A3US/gnmkJHo8OtcjIlgsvoxj2B1MrqrlbmMhhi27gsHOmkPeZCPqZTlofA21wmWs
	oaxt+2IzkVFhmRCo9caWogu98iwxPkxJNjEhUJi9xm+2AHeu32p4guXY+cm1Ed8/XZKFDxRNMxcPS
	wF3sbuzg5UPLUhY3eXEk9iGKWzl6OnweiUX6eKqa8wuA2vq1dDK87ZUpuISeSuB+yMN6R81X45FoP
	7HYVcu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXrom-0000000FoxN-1es8;
	Sat, 05 Jul 2025 01:35:52 +0000
Received: from mail-bn7nam10on20627.outbound.protection.outlook.com ([2a01:111:f403:2009::627] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXrTz-0000000FlUQ-31gI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 01:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BayUMaUNkYv8/o+5P1V4Mm09mYm9SVTls1mWoseHx7Yiwp7ixaT0Ura9Pt9mb5HSn33XwiR+H4v3oTTOear9XfxUGuX1R15jhpTK18dD7l8yfQB/WlaDRByMyPbI1XxkxZcWFFZwnr6DWRZlvgTGXv3JcPosRcIGAFwyw2Uy1v/F/akf7ljo+0o79d74gkpUDIx11aFDSS+lJP4MIPR6AOQWIFPlq7aFOEBekiKeThSZK/aJM63zn0HAqgtH2sI+CALzxFglz34LAp/oKNxChRVhxVo+Vf+wkm/Oy+aQbp4k9MoXi8erYZoCyAefV1HBpFu415gEcS3J+yXpF9GxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPX5OLpcfsjCdI3t+nTw3w4HEXttKkhit5rWu1qXvCQ=;
 b=Zav8Zd8DaXR3V48TsLnf/gC06yZSgzC2Dgq4V9TqRfSi6qNM7z60DAkfm+J1yb0yvagQN4bEhYcuKhU/MivxwRu/l69VRKzY24OIqpmmsv2MP0xLdFVZSuLkT57pUmwrbXa+OJgcM27Tof/ySwR0dYgJ9PumZkFOesieywgNiGjxIVByl1k2eObL/fmikeSkzk7VtgzRUBKnefU6Pprog05tCWN7HMhbusk3AWFJbApe1laNpAonmWXc+NmuWWWElPqE5xyq6kU98uycxNt0SHjvnWI16oY/5MifHlU3trIjtIPnU0lCB3qNm6PBL8We7bOXSaz+blmBL2xvkAApgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPX5OLpcfsjCdI3t+nTw3w4HEXttKkhit5rWu1qXvCQ=;
 b=PyOd5+Y6ecAB/uog124DITi7/BVxOGVxHztJngOCick++RbwDRNBcY268KVBe1J0tL+GioeCZBuPySYOCov7YOntl5r6ayEXOIjutca+hsYWIJAjcJH9pF9QVViv37WRNvjkrjdk8qyH/m+IWQHNuWFjWXELHxdfwa+inuwKIeZFhVeHoGL3bizNFXU+Gpx67q62kdjWxUpcz/2u6me8ty+L43M49abVo1QAAKdmJk36dPveQ4o0ZVwKybvHPbEeZgDZ5eYRYQu7UNN4TVc03JbDm2gfgIPVsR2xHS16rn2kvc13b/dbhzr5DqZJV33fNvh6MC3+jleS0zBA2Q3gQg==
Received: from SJ0PR05CA0128.namprd05.prod.outlook.com (2603:10b6:a03:33d::13)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Sat, 5 Jul
 2025 01:14:18 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::45) by SJ0PR05CA0128.outlook.office365.com
 (2603:10b6:a03:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.16 via Frontend Transport; Sat,
 5 Jul 2025 01:14:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Sat, 5 Jul 2025 01:14:17 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 4 Jul 2025
 18:14:07 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Jul 2025 18:14:07 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 4 Jul 2025 18:14:06 -0700
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
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v8 08/29] iommufd/selftest: Support user_data in mock_viommu_alloc
Date: Fri, 4 Jul 2025 18:13:24 -0700
Message-ID: <946044ad6e5816cb7c743a82d2cf52740fbb93c1.1751677708.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751677708.git.nicolinc@nvidia.com>
References: <cover.1751677708.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SA1PR12MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: 41036f9e-bc1e-4230-fa13-08ddbb6143a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZJxMgndu9F3AEVngRH+CGdR0rF6M1dU8NVhXOd2a8qieFbFL9K/JSBf3D9/k?=
 =?us-ascii?Q?WUkg5HrK/r/DPh+xc8rz1wExjNQABMwUWaFhVCBc54stZ4JtWKXTGsZRpckE?=
 =?us-ascii?Q?BZe0Rpddunhj2HzCF5UXf/L1htNaZpSS6YwUZ87Qzc8JyaGHBr54dDrB0E+/?=
 =?us-ascii?Q?Gi2VZktrNXBKAXitv0C3+ArYAJ6H4c3BFmmqY5KD8w0CBrzCWzJ2c7NlqZ/E?=
 =?us-ascii?Q?YzsLC4TTPBsG57wVAKarTwYACBOqXLhlS06GtHuKGxLAeBz3UfaliQAK2Szh?=
 =?us-ascii?Q?eGpLPM/aYoGtUVoUMvytbdzjKRXp6l0aralHGP4gRlQc+ddRkQf9gNO9yuMw?=
 =?us-ascii?Q?5NzmJUhWXyS9aOZ79bhMWY1quELf44k5grSuPg2amCVyAdfdUQFqOT66Fntv?=
 =?us-ascii?Q?GCvu8NwKpGeXjP4VI8Gq/y1YoN51LO7SENpJ/QGzbKnSWgVAizXkZQw66V5R?=
 =?us-ascii?Q?As0jOFEW7kYsaDl7/uNGZNWyTnF7w2LpDI7XWmcKCPxkjf2QNt8bOgq6Bb9s?=
 =?us-ascii?Q?NDPlk+YISv6kXWP6bV1eJPtJwceX+4uMU4DdF/m+CHNjkDGtFjtAvm3lCJzW?=
 =?us-ascii?Q?VtbdMtOkH/xLvo9jZPOK5maOeMzyYIPfQCFleMW0WkbHwZmh5ctT5Vy6+2i1?=
 =?us-ascii?Q?rsbsmoms/CF0zKkp7ZtKTNK8l3FJ7BMdAA/N74B1qowlrflfCByrW3UNPNdS?=
 =?us-ascii?Q?zgjifPbTyzCvpSEto6lC8bcQB2g+RR9pIVH7AFbVX5Gpj10NPKZLcC/Vwktm?=
 =?us-ascii?Q?SafaG4kwzOD8TX8rEIwgzCGzuP2AdQlpWU48dUVzdQRthq8S94D834UzbO5x?=
 =?us-ascii?Q?tnlz4pBF2HlxvCE33EtAQ44wA1Oci3oOG/+b8Veqq+EwwLjyfmblGx4vgH7w?=
 =?us-ascii?Q?GZ/YMS77AVczpwrnY/ESfC1cbDr2nAcezo5YeDGdmNA82AsgohMr7yNTvkjL?=
 =?us-ascii?Q?oARMrz9X9NigmKX3nCBfMeMk9GY1LKvZKu4DOag9JlMAn3wEGUwwx06LDQpD?=
 =?us-ascii?Q?KFlUDJVWiFDb24JpmN7EnXBQvzMRarlcS5b3DP9cagfAK85LrDv6bF36YhrN?=
 =?us-ascii?Q?UNlCPjEK6W1iYK5aSUCFR0q4uJhuivWNOpBGnsRsMT0m3wk/v8HA/JpGK7GQ?=
 =?us-ascii?Q?KHc+hgaHri8pCCMuYXovTOudtoi5Kxc5iGcHUGEgOjRIN9qm3w1rbndjfB2w?=
 =?us-ascii?Q?YqtLO72JfLaKjIVkOKt6Uy1sDbXIhnzIFyG4FGn9RxCRH9SheF5egNvbuerN?=
 =?us-ascii?Q?0tRsljgjnuWGNaFA5B5fOx0ZjhITK7IVNrsUnJZtFcU2W/sSUJftbb/A3lqk?=
 =?us-ascii?Q?bmJLEy/juGBwLuhpoZ0OSBl7MQNhkxcC6yxb7SyIqYUNmJFCKAG1s0TWq6ZO?=
 =?us-ascii?Q?Zng5JHDixzNPHL9i1iWtY/2vbXsNzZacL14DuI0czwojSevaesfUlXFQ4FWW?=
 =?us-ascii?Q?R1t/vEtZMnpE93j3ewymPngC0fmr9ptrGZiTy5yay6T1I3LDk7mQj94NRmVn?=
 =?us-ascii?Q?KchRfsMFr+SPUpJ8goDO6JY8hPF9x+WjXCZd?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 01:14:17.6641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41036f9e-bc1e-4230-fa13-08ddbb6143a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_181423_775225_4D4AFF32 
X-CRM114-Status: GOOD (  12.02  )
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

Add a simple user_data for an input-to-output loopback test.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_test.h | 13 +++++++++++++
 drivers/iommu/iommufd/selftest.c     | 15 +++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index 1cd7e8394129..fbf9ecb35a13 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -227,6 +227,19 @@ struct iommu_hwpt_invalidate_selftest {
 
 #define IOMMU_VIOMMU_TYPE_SELFTEST 0xdeadbeef
 
+/**
+ * struct iommu_viommu_selftest - vIOMMU data for Mock driver
+ *                                (IOMMU_VIOMMU_TYPE_SELFTEST)
+ * @in_data: Input random data from user space
+ * @out_data: Output data (matching @in_data) to user space
+ *
+ * Simply set @out_data=@in_data for a loopback test
+ */
+struct iommu_viommu_selftest {
+	__u32 in_data;
+	__u32 out_data;
+};
+
 /* Should not be equal to any defined value in enum iommu_viommu_invalidate_data_type */
 #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST 0xdeadbeef
 #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST_INVALID 0xdadbeef
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 0d896a89ace7..38066dfeb2e7 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -784,6 +784,21 @@ static int mock_viommu_init(struct iommufd_viommu *viommu,
 {
 	struct mock_iommu_device *mock_iommu = container_of(
 		viommu->iommu_dev, struct mock_iommu_device, iommu_dev);
+	struct iommu_viommu_selftest data;
+	int rc;
+
+	if (user_data) {
+		rc = iommu_copy_struct_from_user(
+			&data, user_data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
+		if (rc)
+			return rc;
+
+		data.out_data = data.in_data;
+		rc = iommu_copy_struct_to_user(
+			user_data, &data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
+		if (rc)
+			return rc;
+	}
 
 	refcount_inc(&mock_iommu->users);
 	viommu->ops = &mock_viommu_ops;
-- 
2.43.0


