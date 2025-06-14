Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FECC71141
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LstwTU0sPtdKxub48BtLSzz6XQmmMJhh4IHJYdY9nNQ=; b=g+AQYYiFvt8blQfo0kO7gIZDR5
	Ruc0S2ioNHeC9abin3RZqpdcZXKWC85zvhPlNhJW2ll5e4OfTwm9AnOHIqkTQQU8Ujl0Vxmzy9eaG
	SDCRHYs3ibDABLhCeaMedxdhMYuH7Qx/Nw7A6Ht9gr6SIenL5OUO25ro4ajMjMR1SU28HK1qXAU9C
	Drh//qSEJXSn5N2AbhQPuBpiH7uqu75Zurn67KUbZHo7lP9ieSSVH9XCEMrmYJU8aReZ5QOCJM46s
	0km50vEMG9InnNe9OUbv6Vy8zf86W76LpyHw8VYZpIjoNuLmKrh7BXX6uXvnsP+J7M41/eIHr/Z88
	GOcWCfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQKvZ-00000000qXP-0YMb;
	Sat, 14 Jun 2025 07:03:45 +0000
Received: from mail-bn8nam12on2062b.outbound.protection.outlook.com ([2a01:111:f403:2418::62b] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQKUi-00000000lrh-2vpR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 06:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8QMhfDTZwy5eFSubnXa1ZQ5OPhHuL7hQhLwe9W+XubjCes3rbBprih6i+TxHikay8HPl4O6YeI++vMWDmB+Ii4RX5s+GFwdd4+mgNCok1scFBcfXCsMrYmLyW0HfQVN+559kGd+VOOQrcU33LQ3q93NDS/NRviHQZP0czdh7og08eHIte2VvARG+6LLXyhz/iYen7iG16+4iWk3RT9Pi9DMyROmAFF8Gjw+Z7Xtlukeo2yuY5vdEeSlewK1Zzg3dSuP8hy2pv8YKc9vIo7SaQ/m1DGOLA7SklpiIo8PTKM1W2UjQF7bVv3B9seInfgpAeg8217uJYdnKHtiFVl4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LstwTU0sPtdKxub48BtLSzz6XQmmMJhh4IHJYdY9nNQ=;
 b=CVuxNihWOZfA1LfreHBjEBdkAQsL1HvEoo5efa6DcDm5882yRZrimmm6psVDhCQUNx2A9WDQ1grriIiE6GHXXSzHSfQx6s+XNxrAidXX8EAOsjwtvxT+cEBGvaumM8mqpr1S8dSdgLDu9YgvyQghTO7GTrPcR8HnCQvrfLMGcEpOzeb6ibTKUXQcYEsMUDq/j2crHBEL3a4x/uiNrd1zfBMzbGVrY1VafYmQmorDH/sHt4gYCtDz2JGwyCaKoASTw7ZNkIYkJuEL0tpWoYhYZRPhKzI/mIZJ/a/KohIgOR0t03Xc3WZznjCfZsMEkbNLLbIYkam856pW2Lb0z+lxSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LstwTU0sPtdKxub48BtLSzz6XQmmMJhh4IHJYdY9nNQ=;
 b=ZW8r6TQICjLMJ6nCgBhma5mOF21jQsZ8Yy8U/1Y8iXB3XmKv+5TKAAxjAIjR4ofypZV0wwe1QFf/979g+FiUf2bDdgtGZ5fxroALD+1YG+/4Dv9Q7F939ndwFSpcbddFDlPYaAp3hrLHLXlvE2b2NgtRAKaXHkEDjdgk3bUoJTjtKDUGu7SC/7qhezJlXW9woL2G7+f2uezMzxe0uNxAFD5mFIp/eiXoqRhWCPxFcWYtvINqKxI4dhBRE3Fu/ajd3rHTZb3ciG9bHVaiAf0AT9YnkXsTVzOhj8EBrqZKf+WE2d0v0BwrVOvmyIqa9UBIfBiXnynxBT2M5rHA4pMr4Q==
Received: from BL6PEPF00013E0F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:13) by LV3PR12MB9440.namprd12.prod.outlook.com
 (2603:10b6:408:215::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 06:35:54 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2a01:111:f403:f901::4) by BL6PEPF00013E0F.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Sat,
 14 Jun 2025 06:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 06:35:53 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Jun
 2025 23:35:38 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 13 Jun
 2025 23:35:38 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 13 Jun 2025 23:35:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<praan@google.com>, <yi.l.liu@intel.com>, <peterz@infradead.org>,
	<jsnitsel@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>, <baolu.lu@linux.intel.com>
Subject: [PATCH v2 07/14] iommufd/viommu: Support get_viommu_size and viommu_init ops
Date: Fri, 13 Jun 2025 23:35:19 -0700
Message-ID: <35c5fa5926be45bda82f5fc87545cd3180ad4c9c.1749882255.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749882255.git.nicolinc@nvidia.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|LV3PR12MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bf9c32-839b-4121-f5e6-08ddab0db681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G+NjaIuUn759s3+Sl5XXlYLBMxtEKbD0ZjNKwfQ3nuAcNMH7AlJ38U6FqSWA?=
 =?us-ascii?Q?/LpWBO7tNJY1WLOMmuyqHhqPW0nOZ3adbHA/qfBV0CCLsl7NxP7qUdKtHgYg?=
 =?us-ascii?Q?jmyMEY9m7CJRvSbraEfZK56I7R+i00q76UqqxUZIQv9aQNrr4Aa8KBR2GKbI?=
 =?us-ascii?Q?DRVaBDMALssM1MwDE8IT5jL2eO6x0ezOSvCzfdeLar23pmpojzPu2jBhq4g7?=
 =?us-ascii?Q?FuXPn5NenBWMYZXHIqPR7dNRRp52DQN3myZYtUZIzaKrsytCeplu0b4VUjs0?=
 =?us-ascii?Q?obOuOrDB1PtI1Y+MMrpYuGUVmTLgXEdWsjLRRbEA028itRg09TgKP87xxiT7?=
 =?us-ascii?Q?DqHSiPoP09wfGHmNejPM8xQEHkVyfP9LfJZ8SdTsCXnDBIIvW2dKUqRSkWqN?=
 =?us-ascii?Q?mqEgA5fkEQFFyVoxpjJfZ2W2k4kOLE4qFp2yZ6cljyRhj6qP2GOWuGJuyNXv?=
 =?us-ascii?Q?X6UofVasN9t6XWmWv5odcVYrVCt8SxLabHJD642ZiEoXfM7mp6k4MC2NQZPZ?=
 =?us-ascii?Q?0wyx3nqUERULWnjDpOfQhkytQYmj/dfflM3wVRV0J7lGiXipzNHAn6/e0Umr?=
 =?us-ascii?Q?tFIrUw2qyzLo0AbjQCAXtPPUjV2XcuGHPB8DmgfaJ3depkRQdQGf6ulZatEL?=
 =?us-ascii?Q?Whdb9f+W96c1fLU98kMnw3HJOC/sIZ3gv+Yyx+SuRFsC3ioo7wOCrn/dKX+5?=
 =?us-ascii?Q?+r8VkcJU4iQYBii8l2Bjfk0rCA+nYVrAxz4L5mP/csMfhbBAq3jjO0EA5akz?=
 =?us-ascii?Q?ekLyGjdqNrL9AoilEL3mtEJq/+/DeNBRZQGND/Y+VYSXMnr79CVeZaxU3aW2?=
 =?us-ascii?Q?JbRLo9QzUubfAFLiCc7FK2TnkeL/8G51L0+koupMjU0RUxNiqCz1wXxeZwTt?=
 =?us-ascii?Q?iRQn/cM+MChejtGPqqwW7cu1vqN3vUYjEsFxr9D/zoWdwkxwxhxQGbtxh3gF?=
 =?us-ascii?Q?u0sm66lfeYYK0FQyZKxKHpNdNWW88gMZjDhctkKNw81qsE/Xfuz6ZEDEANtl?=
 =?us-ascii?Q?e2FjJIyukFowIFKwKicwpBope9QvLRzXQmSfq5P3yYxNqMX5o8+hnZTv5sBD?=
 =?us-ascii?Q?sZ/cVqGFfsAjn1ydh1FsSg7geppXuO1xKiR4yMT6ujXRsrdGDQPL0vfaMZTl?=
 =?us-ascii?Q?MeyOdP+ojd9/geloftaYgfPff4F6wPYVrhTxEd1bJiu3CL1F11hHoB1IpaLG?=
 =?us-ascii?Q?0guc9ldYMGsi7NMzXGdHjoSdjs0jT4phOefYnodsNYioQII6dxWiEgHUzUhI?=
 =?us-ascii?Q?TsZAGCVqcTsf3isZQxzh66aWULHkOUwboFPjWpgp3gEhx2HZclYPpxm8lFU2?=
 =?us-ascii?Q?SRLCl3MKV5B6qcJSyI4IckyBMQdDiLmWkmuN3ev0aDJSSJin1fQBWFobrxVV?=
 =?us-ascii?Q?OHieaSZicbkOknWWQGKVF/UPZ3DiOitbyiY/m3IeZVqUK0CLdLDL1veXocv7?=
 =?us-ascii?Q?8aPvA1M6/5Z0Hq4mOArOoFNSYgXsKvSUSDAWZapQ4xMwLRJot1hzebmRFDuy?=
 =?us-ascii?Q?8jOpu3++lTHeO1ycavrHUWv4gSAX6VIYCNhi?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 06:35:53.9381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bf9c32-839b-4121-f5e6-08ddab0db681
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_233600_770252_F66EF79D 
X-CRM114-Status: GOOD (  16.21  )
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

To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
are introduced to replace the viommu_init op.

Let the new viommu_init pathway coexist with the old viommu_alloc one.

Since the viommu_alloc op and its pathway will be soon deprecated, try to
minimize the code difference between them by adding a tentative jump tag.

Note that this fails a !viommu->ops case from now on with a WARN_ON_ONCE
since a vIOMMU is expected to support an alloc_domain_nested op for now,
or some sort of a viommu op in the foreseeable future. This WARN_ON_ONCE
can be lifted, if some day there is a use case wanting !viommu->ops.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/viommu.c | 42 +++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 01df2b985f02..27a39f524840 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -21,6 +21,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	struct iommufd_viommu *viommu;
 	struct iommufd_device *idev;
 	const struct iommu_ops *ops;
+	size_t viommu_size;
 	int rc;
 
 	if (cmd->flags || cmd->type == IOMMU_VIOMMU_TYPE_DEFAULT)
@@ -31,11 +32,29 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		return PTR_ERR(idev);
 
 	ops = dev_iommu_ops(idev->dev);
-	if (!ops->viommu_alloc) {
+	if (!ops->get_viommu_size || !ops->viommu_init) {
+		if (ops->viommu_alloc)
+			goto get_hwpt_paging;
+		rc = -EOPNOTSUPP;
+		goto out_put_idev;
+	}
+
+	viommu_size = ops->get_viommu_size(idev->dev, cmd->type);
+	if (!viommu_size) {
+		rc = -EOPNOTSUPP;
+		goto out_put_idev;
+	}
+
+	/*
+	 * It is a driver bug for providing a viommu_size smaller than the core
+	 * vIOMMU structure size
+	 */
+	if (WARN_ON_ONCE(viommu_size < sizeof(*viommu))) {
 		rc = -EOPNOTSUPP;
 		goto out_put_idev;
 	}
 
+get_hwpt_paging:
 	hwpt_paging = iommufd_get_hwpt_paging(ucmd, cmd->hwpt_id);
 	if (IS_ERR(hwpt_paging)) {
 		rc = PTR_ERR(hwpt_paging);
@@ -47,8 +66,13 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_hwpt;
 	}
 
-	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
-				   ucmd->ictx, cmd->type);
+	if (ops->viommu_alloc)
+		viommu = ops->viommu_alloc(idev->dev,
+					   hwpt_paging->common.domain,
+					   ucmd->ictx, cmd->type);
+	else
+		viommu = (struct iommufd_viommu *)_iommufd_object_alloc(
+			ucmd->ictx, viommu_size, IOMMUFD_OBJ_VIOMMU);
 	if (IS_ERR(viommu)) {
 		rc = PTR_ERR(viommu);
 		goto out_put_hwpt;
@@ -68,6 +92,18 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	 */
 	viommu->iommu_dev = __iommu_get_iommu_dev(idev->dev);
 
+	if (!ops->viommu_alloc) {
+		rc = ops->viommu_init(viommu, hwpt_paging->common.domain);
+		if (rc)
+			goto out_abort;
+	}
+
+	/* It is a driver bug that viommu->ops isn't filled */
+	if (WARN_ON_ONCE(!viommu->ops)) {
+		rc = -EOPNOTSUPP;
+		goto out_abort;
+	}
+
 	cmd->out_viommu_id = viommu->obj.id;
 	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
 	if (rc)
-- 
2.43.0


