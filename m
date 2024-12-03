Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFC1E69EBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLFWnsrYARGfxlSa8XyyJGyfIrvyXtFZaN3aeRVrNxA=; b=4Q+7FZX3mFwtJE72J1geYijyXz
	SEzHxYc2RPht8EIQCDM0LiG7GmuMvWaV+dCDQUA1sGLS6PmtoauC6vSpIJ2GkcbwArY3C5BHwKrRg
	q8o9JCDkJW9eE6cR49nyuEwAi+cKqeZx3MHDpmGO8NuxQdZDGWPsPcG52fF+obpDMnzj7Wpgvjf1K
	vIHOFjDnmOERzP44T0KS0dwAV9QAdgXNZaktsB8u7u/2PK/K+JSdIahFDIuQhKWCKHItPDG+ASfH0
	qm5/65uhqLEuq6qtFsT0ircF48dDR/1Rf8UpJ6wnZXkoem7e/VZ//Y2sDp9+mUD5erJI/MfRTyqgy
	pbmlN8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbDk-0000000AtXm-3y26;
	Tue, 03 Dec 2024 22:18:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIb6z-0000000Aryj-1XP4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Dec 2024 22:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VLFWnsrYARGfxlSa8XyyJGyfIrvyXtFZaN3aeRVrNxA=; b=XB92/pt9IFND8N9VvEkE/w/la7
	CZR+wiDPN0vFohkD0IozvBys7wxm4tlC7KnLKojDGdt4ztFLfGwEa3BEq/JSeHBX83eD3BO3NewSn
	27QV2bQwoYsPhlcwCBwYSkXjcp53wg7+lJt17V4xfoPORTpSErJEGZ6D3naWBjamX4NpOiyKRHTl1
	gY4HEP7LmKGZx47FB4lZJVPSslLxxsczTfH9v3kImqFnvXRgdANi0r1ahDqqx10EpQH2eG7hNRs/h
	/1eAp4xZPWpGDnU2psd+hUp76ZvboEP+OgJKhZpra/aMZgPem52I4tULSI61EEwDWrB1bXV6dZTdR
	N+giDoEQ==;
Received: from mail-bn8nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2414::62f] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIb6v-00000002Sud-1UOz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:11:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPPHqmqt/tWmLyaq0vHeuna9aulkP/8wjOtv2AsuZZO1Fr6Nxva+1rdqpunK0LahHu26fXLZTzRAa8vJz4DNnJDmE54VgVGB86lq9E+6vQkOHQMCRNK/bxbckQdfGahXJH7XFprw9A/I5fZ+xL+kmsHsd7lHCju/jS+bBxtrjtCgLhnTRjae/N7Pf4R84frnVDLjB3tNDGzx5tgBCBcwkpQEbVueTngQzFXdZjb8iTBAymqJDdQ2imGmyCUiXrPbdJYKOP3HjLYKPl2ySoihrL7o0lpsxyrz5ei+8M5yt02/cHW6kh6QPH60CYj4dHjqGT1UUtLjs7Ixvdja8xAFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLFWnsrYARGfxlSa8XyyJGyfIrvyXtFZaN3aeRVrNxA=;
 b=zA+M93+zV1rWXM/y3bsoYV9+sR9/plg4ztaAGUFkxIs9dF93xzPvGEr5m4PxXS/7OYdArZo6CGTKk8SQDrnbj6GJU5yF8LA1U3oVj5EYX6k+ICHlSU6rYuuoC6o3mhah8b6KQCdU5lWZ0vUMEaLhdaEjMwFTl0kUmMT+cZO7fDkoCaA+kYohgWD46YUJzxP8o7B3ZvQoOw2ZbgkNY1gsM/Tj4ktVadryZZEsgizrvvJMkcl9FnMC74ReLwTIw4BtEyIik3v1qDFwkFUsHV6Y7QjvwWQYxXbjon7fO1EmBMcBBbupdVyMGDHIe5zzIp0zuukaScnCps+6LSAJlBYANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLFWnsrYARGfxlSa8XyyJGyfIrvyXtFZaN3aeRVrNxA=;
 b=GSOKOy08kITQtuNkdb4GsoHFxe53l1SeON+BkDodwy4ddMmgmybcHPx6PCmZY8H1ww96Rko3t6NNFUKh4MDIOqgoA3+ScJxGfXXllSdVBpm9gZtk3KO9zPBEAB7gmr5r+pWVP+xWmL8P5FsSN6nndrkbO0jt9li7PRh4gk3cooqdDbPIY1CqZupJogCbuI9n/Ott++72LmGL+sV7mVKuh9azsIs4sW0PWGWNaeCQ/X+FztypmYZZTjWFKi6CofpFnguNu5kGsZ1076+8nw2Jy1UpHFM6bqsXYMgrAd+N0Na3RJTnu5rpb+0PlDRjb+lx5zgIppoPsQVOpcjAoMeDvQ==
Received: from MW4PR03CA0316.namprd03.prod.outlook.com (2603:10b6:303:dd::21)
 by PH8PR12MB7253.namprd12.prod.outlook.com (2603:10b6:510:226::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 22:11:00 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:dd:cafe::c5) by MW4PR03CA0316.outlook.office365.com
 (2603:10b6:303:dd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 3 Dec 2024 22:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 22:11:00 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Dec 2024
 14:10:44 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 3 Dec 2024 14:10:43 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 3 Dec 2024 14:10:42 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>
CC: <corbet@lwn.net>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>
Subject: [PATCH v2 08/13] iommufd/selftest: Require vdev_id when attaching to a nested domain
Date: Tue, 3 Dec 2024 14:10:13 -0800
Message-ID: <cb654aaceb5976ff34b80e3c783182ebd51840d4.1733263737.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733263737.git.nicolinc@nvidia.com>
References: <cover.1733263737.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|PH8PR12MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fac7154-1e23-4275-7800-08dd13e75e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nMfysyHc6C4zBZm/GUEyo8TJTo3a8Q8/KBlrabBlunfKzxw06tk6YzZKXXUX?=
 =?us-ascii?Q?gbVjjBEm/csBj/rXsdV1ybpzAMqyd7fJfV+bWOjOfnjtlidYwg5ISlOgv9XQ?=
 =?us-ascii?Q?753Fxbzyp3vytICLGpY5FKxrzZ8PXyOyrjqgnNWAFLQyLokikOoFYaDFLJc0?=
 =?us-ascii?Q?S+KGZtnR7Sv2bo+CBpia4oLZG6Xvv7wc6dTEhC5eGwtFF0iD8mpyJzQflucd?=
 =?us-ascii?Q?DQ6ZB9Di02/AG9rnbFACro4KIBTrZXJi8erxrryDmy90UrD0g9YwapQIhnCl?=
 =?us-ascii?Q?J/pqF4o7s/LqQgEjz01DMfnH298hLx7IJEKo13VV5rg6I+ARQaEykNwL8HxZ?=
 =?us-ascii?Q?pq/b/Z8/TQdn1AzPLrnKP2y1MDjHFrwn0iv2YpYKzJUbIQ8v9Z+gYAu6N5g/?=
 =?us-ascii?Q?ZgMVUbIG1/PPXMOdqBzXuJFTIjNbW5pm1JYnjNR31aQQ867xXzN3ENBZ+yh4?=
 =?us-ascii?Q?k8B00ZG6ULei10lQFNDm7rMIcoSnE6ASPFAiHCOKqnB5Cqfz3Su6s4TG70S/?=
 =?us-ascii?Q?QW8UzDgZAAOEZzvw3hTX4LvFjgpbVx9KmUMf3hWyC4d2zkxWVNOKsb11jo86?=
 =?us-ascii?Q?5eihFxOP46JOerJM+CFTgjVylKG0lvkZInD74jlJi+ji4Z13gVScn0dum2ve?=
 =?us-ascii?Q?BJ7E6Y4MqOwJdUY03DbY6QAc1ictfQEY1SEvhIEjInHAlpW61mzvkWnfNGFF?=
 =?us-ascii?Q?aliOpAWN9kIbyaLCjSpux+p/92iil9xxWqUOnDNKgpmfTOh1y/Xc1pNwXR2n?=
 =?us-ascii?Q?5l+F3Dx2wiUIzeXcnAInfE4qQLdaQx+tk8qPsNrnV/2CvAO+vYO2b6ItAPgv?=
 =?us-ascii?Q?mgTDsGR9qKl5jiEsMQg+IxPKzYHYG84awQ8Gw5dbOGfYQSYRdU79XYRZEHjD?=
 =?us-ascii?Q?ce1W7Pu2q8j499mSSC+J25HinwKacKDQNpHiPxkTLdDMShpT5vY85fb1450e?=
 =?us-ascii?Q?mR7ZwTNGcECh8wjahlaRsmAqKNbdAObn/Act8AtJBf8310dS+K/1wRDYExWx?=
 =?us-ascii?Q?B3Gssi+sVdv8fGEDNc39qnaQIxjOciHItWa9v0poTX4H/PuFHFL6LymjIddl?=
 =?us-ascii?Q?sIruDkXwUEqrpLShgigjTBBIE9ox4Yh5UI8Vladt3jWD3icDzJiFhwJa41hZ?=
 =?us-ascii?Q?slC9vW/4Jzoknc6SwGFsSpJ06PGd3adbEhMg0UZugzBugbwGcG9sh6kKmhCm?=
 =?us-ascii?Q?4pSyfZqVbRtRmZ0L4mFS0iIUNC77RwOqg4g6UUJOPuHfg7K0zhkALMLGG/KE?=
 =?us-ascii?Q?7o51cZCYwZ72YxQXPtqZXuN6lisoYXi+YEifryLhtHdTs+cHqixm9buvFlvf?=
 =?us-ascii?Q?q/YDgPy/rG73sHTxZ2Ixd6cG9/HudOUBTneCSh+Iq/2JOkWvQoU0zgMavdjv?=
 =?us-ascii?Q?jeFUrIpZSywauw+CHrHG/Ixq/k/ImxJzFlaZ1PNzOH5Vdo0cErECcPhT+Ysf?=
 =?us-ascii?Q?2KYvcFArU74x+K9EaR8Zouh+nqLWJzCR?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 22:11:00.0172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fac7154-1e23-4275-7800-08dd13e75e80
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_221113_608763_DB818941 
X-CRM114-Status: GOOD (  13.97  )
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


