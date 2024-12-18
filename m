Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4223E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 05:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLFWnsrYARGfxlSa8XyyJGyfIrvyXtFZaN3aeRVrNxA=; b=FC1bYtl3AoHEqJ97DZSptxKEDI
	obvPBx5NVTR/JRFods2tnchNbNiv9hMj7uC5hUXzKmOJjQhS/fmxIs7sU43PZoZordObd+1KDK5bY
	Ahc6OIWBeH6O5humPIOkvtV4H5nYNRCV86jgQQRN5GeJzMnnOf3VP5Nr4q+EwW81p3SXTrC3e1WSj
	fFXYKzZlN/hSggyrMBf9uxO4y0TJRfZI+HdZh51ZrVnIQal/+o/jC/wsok7PebcwqEsCiyRSHTEyt
	74lbHVvn7UX0D3dCIOD1WRPTqE1osXLBNL0hk8glOfhQWkZmrr3yxMZGKvVP3b7ISPNktBZrsZOli
	scNhzLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmMR-0000000FcA7-0eW2;
	Wed, 18 Dec 2024 05:12:39 +0000
Received: from mail-dm6nam12on2060b.outbound.protection.outlook.com ([2a01:111:f403:2417::60b] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmC2-0000000FaJR-1jAg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 05:01:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUHEk/2Z51KMslY1jx+7TVShXHjQQU0xYifMIzgd1SKfzgvLwCePMhHejxfGFPxuRGUSgIBjjjBAtxxLd6bx0LnxvedgR6LE/eDgIhUbIls2uD3C2DIaaWVihNArDeYPXDBrbzDESZTUwMH4P4v8o+9LaCGSqM30cQg9whxvG9Yefk4CAGfevKqbajbsRzDFXRz0u3g1Xn7moXNlWX8soC8k9USE/uO0vov4+TY/Trj0NCQ4p/gvBeMoEGpND/T6j05x9l1c0c203ItJ2FkT9xCScHLrk12Sa2hfo9vTpKflui2cMneUiYttOUclyrLcb+s8GajXMQYV21Qj7jmxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLFWnsrYARGfxlSa8XyyJGyfIrvyXtFZaN3aeRVrNxA=;
 b=c2Ch7w0QbH9pPu0KKexMunzUH6yQnH7OevZsMD1za6mrDCB4f4Q9pNM/GziZNgXAJSwjBMFwOC9G37kyiNGz5Sg8RZeUKtMhisSrrN2rOk20m5NIXWeuQqBxAIXr/qQlfrgo+4CUhSyC2msHBakLdXoc14F33ivXrasjhgTLmzsIAoMQFetGtLQOkkqhSvCDMQM2j7/kVHvjR3h2wSK0zdOeWDrazY8UzgyWMywwIcL32ydDtcX+giCqLwSXpMoVvP8uiVEsQs9/0TVODRBC18Y7t329e0U3FnjagSfeC+SF9f5ipTQhz6XHXmYEfaPw3CxDOpypx1qKg+8JxDNrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLFWnsrYARGfxlSa8XyyJGyfIrvyXtFZaN3aeRVrNxA=;
 b=pbPxyLdwnZsCWIKA0sgL57D7gMrkYo6rS7X6AAqhRX6vAARjVf6/m61qis1MxP6LRQZgznGR6mXWPh8FQfd7zo6DHbH9uGaqqeBKakm338sN3Q8ZeGDpwoBuBqR9seZpFQ5bZn4qCPd210eMmj6JEjqnNeDMn/dydHQhrWPqhLNpSUEe+H+sBKcP64djtYRrGVGuXSgzFgeXE+YlPcAqXmjSL8jd3EJJDmy327O8suwifH69s+x3DvH8GeBbfz+umNhwCXu7fV9tGoywWouuP0fcqHw1u4Mg8WIrh9TuuhDs/KyMks3G4ysclGKzf0Bhr8kE+z7FE2Wn/gZ8961rjg==
Received: from CH3P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::15)
 by MN0PR12MB5738.namprd12.prod.outlook.com (2603:10b6:208:371::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 05:01:49 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::e1) by CH3P220CA0022.outlook.office365.com
 (2603:10b6:610:1e8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 05:01:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 05:01:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Dec
 2024 21:01:36 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Dec
 2024 21:01:36 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 17 Dec 2024 21:01:34 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>
CC: <corbet@lwn.net>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v3 09/14] iommufd/selftest: Require vdev_id when attaching to a nested domain
Date: Tue, 17 Dec 2024 21:00:22 -0800
Message-ID: <c20899ecf9adf3cf5bf7ddebad40e9c8c6fccec2.1734477608.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734477608.git.nicolinc@nvidia.com>
References: <cover.1734477608.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|MN0PR12MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1c0aa9-aadd-41ee-2f6a-08dd1f211442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RM0KaLcNzaTGbskHl03o8I4Yb51RUV/5vv+hqipswzTv//D3xRskkcNOmVRk?=
 =?us-ascii?Q?sYcc47zEQ9iOtjxGyLt+a87pCrWs2NpXyOCJ/XQ9++HvAFsSlxfZCgjUw8uz?=
 =?us-ascii?Q?uwu0ggiBpT6tCL67gH59coIGE62fFcQvafxGUj8I/jF4hDgRMy3RozzbNWmu?=
 =?us-ascii?Q?PncLJ0RohHYMHqWPeNJ09NzaiJH2TSClcGlvak6Tv5QEyuVXmAMBAYByILXT?=
 =?us-ascii?Q?TUVH4dsZ3B5Ir/ZXp+475OgTgfm1Q7DpVt+41WJT1L8iztcaf2eVn1YNun5J?=
 =?us-ascii?Q?xoeixwqF2SH7q705hMUxUqCeec3A9N8vwgGgsZd3TUBuRzVrQGNDCijYU8n/?=
 =?us-ascii?Q?v1Qp96+TiDzL1aJCjOXsm4qhr+/WY8z1gKTTRxhsVyID8vori5h9Vn2hdhuF?=
 =?us-ascii?Q?BztMuMrLz67OUOxxS3PFeDFYsuMswz1Ii65bY9Y/HOAKMVMAMRnl1RPqREEq?=
 =?us-ascii?Q?+YgvdFH0SLINXBdCzIxmBU/x075kor0E7YdAyp1dtkzmej3hZ3Da5ztvpsjQ?=
 =?us-ascii?Q?1mq/kjJcW6kIvnfc56c3cLcfWx/MQzZQJjw4+G6fPPPxHkZ3kMec2VkP4aaT?=
 =?us-ascii?Q?rRjgvREpwQoknCkJGyOFjwIbsqLT5wjzbn/a9AWJpQrRYjOwJHoitIjmqNYb?=
 =?us-ascii?Q?sdgmVqRIT/HSIIyOG1RDF3PbrkzylM9QyUSGrl1atJBLUMhl5YezpPekkyWA?=
 =?us-ascii?Q?SyAUH/vG/Esb8/nA0P+1iz1izRuu5+qVdkqcrqKsGCwZrRa8EGUKHSKGealW?=
 =?us-ascii?Q?tjuwZx/W8aU+CKA7BVSdjL22BYovqybJsWa3OKqcTznp7kSWvcTVIYGux/NH?=
 =?us-ascii?Q?NRWzRROmRwHfVRtVNspJd/o3iB2q/K0KWy/ZFet4y53Gg4MTDBQKW6TUwG/5?=
 =?us-ascii?Q?Ym5edfxSObuTBJnwBAJ5S/3punDFkWaig3JAJ2mOLr0Ee+NkDt3toKzdCACh?=
 =?us-ascii?Q?ZsvkdQpJTaP/GBwqBme4XYwQ5bqVVvJgpSWdbwhmjgDM/HBRG0TrVISPRSOl?=
 =?us-ascii?Q?pOTBA0JqW90VeWiI6m03BqfEYBEA91hZnabcxawyx3o3/IAqnjh8uZrd+ex4?=
 =?us-ascii?Q?g1WU1jhmZTLSiF2AHm/YIwD8s6lcnd8u3HZnBNHcLZB1c5BJ7jguGWUHtQBK?=
 =?us-ascii?Q?dVATgMl2olvQbK5iPtwg4f42J8inuzmifyUuyBPgY+4W5buX6QSKu8ZLHp53?=
 =?us-ascii?Q?qXpgGx5k+bYv9VPLbiKgyjBkebmM5IBE6ThGe35TKCcDhmPYZojvCzBE/3ad?=
 =?us-ascii?Q?3ROwZqJldELiY7sJwqGGw4WDarb7ROqAKJqJ5CMNHxN4wZmFScbZeJxWXDXN?=
 =?us-ascii?Q?34d16ryKuTOUDU9YO3nMqwDe0Fx3TqiDL/g+UbuCrW87gDM5aPue2oKDSSSE?=
 =?us-ascii?Q?W845vQq0ZJ1/Y0YesSGKbRxHBbp5JmmnG3ip2Exfa/ekIHQWOn5QwWfCPWQO?=
 =?us-ascii?Q?CAHWtS4QHAS5dd1VFEzlvNpmWq74W2I4XPRQ7BCESf7gAid+h48Shnmwv/xb?=
 =?us-ascii?Q?CX7IaERSOgi9ruw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:01:48.9648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1c0aa9-aadd-41ee-2f6a-08dd1f211442
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_210154_458260_079900F0 
X-CRM114-Status: GOOD (  14.36  )
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
present. Add a piece of code hard-requesting it, for vIRQ support in the
following patch. Then, update the TEST_F.

A HWPT-based nested domain will return a NULL new_viommu, thus no such a
vDEVICE requirement.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/selftest.c        | 23 +++++++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index a0de6d6d4e68..d1438d81e664 100644
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
@@ -193,10 +196,29 @@ static int mock_domain_nop_attach(struct iommu_domain *domain,
 				  struct device *dev)
 {
 	struct mock_dev *mdev = to_mock_dev(dev);
+	struct mock_viommu *new_viommu = NULL;
+	unsigned long vdev_id = 0;
 
 	if (domain->dirty_ops && (mdev->flags & MOCK_FLAGS_DEVICE_NO_DIRTY))
 		return -EINVAL;
 
+	iommu_group_mutex_assert(dev);
+	if (domain->type == IOMMU_DOMAIN_NESTED) {
+		new_viommu = to_mock_nested(domain)->mock_viommu;
+		if (new_viommu) {
+			vdev_id = iommufd_viommu_get_vdev_id(&new_viommu->core,
+							     dev);
+			if (!vdev_id)
+				return -ENOENT;
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
 
@@ -861,6 +883,7 @@ static struct mock_dev *mock_dev_create(unsigned long dev_flags)
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


