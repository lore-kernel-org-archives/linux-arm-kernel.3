Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFA2F8E48F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 23:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v98KoNOsXSoGeFPVYMYy1ve31A6imaK8SVF0nJNIZYU=; b=kc+qJRPaxWLCOM4KaK0nMyYJbk
	6sBbTeqjaMmP8ru93PrzSny9sWoZ1RtbtTp/XfLyeAoYk45x0l62iIP2dSIC0EDZYhwzHmEfL2iTy
	U9PFLVUu15jOXrQi85Y9h9YjbGXhygnECnm6WRc/4xFAYNtj1hFJnAurkGeI9CBPFd8fG91DFLG0V
	RyD9pi4jjo/Mah+nQAlplfRWbmIQM5ZpQmsLmamfL1/tVDG1CUZji1pHqY/6InuTYpCXlGRYfRkyf
	NJBbfs76JvGlcmPAdo94JTDBs6EKebmEAz8tK1rTQgxkduEm0ovdV6O8CadCSpmy3CstbG9zZygHf
	npi6dODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDW9U-00000003BA6-3fvX;
	Thu, 16 Apr 2026 23:29:40 +0000
Received: from mail-westus3azon11010056.outbound.protection.outlook.com ([52.101.201.56] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDW9S-00000003B8b-11oI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 23:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgtfLaqw+Kmr/A6bbWyvJgMkpApb5sF7dFS+GeElckpw0fwvytcnWPqiRgru1f2ZcUycVMz+nVAA7aNTOQnh7zyh+z0qyLIpdlqMQQ6EUtJLa1DcuqTZk8nwJIbUb6mMSYsOU5A9E5/aHWSv/6LUItwpud5aHHU9vJk9FQmxE5hl7v1vHoEPSZGEPeAwt9IwQjEKiR+g70j5CYihpmGZ6aGR41QqqXVpLLNwA11sjcI19si6J2vh661t9lZ83QSc9n2oh0Tx0W5O0kT5gQqBfzGDKAr+InMxcWLMBfkhF7KXbrxkABNasrtWL2YmBg9wW1o/GQ3piJk4JVBqtdr8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v98KoNOsXSoGeFPVYMYy1ve31A6imaK8SVF0nJNIZYU=;
 b=TPOEt24K1MSHgI5IQh55gKPoHsz9p+VFUHg8KKn8UUseSNrzbCbGLcD5YHuP6MI3+IhR/qv7JmmVWPz/Oks0BmCX9mxvKYzGHDG7u7B6kBg8gG/1EQjWvr8mqZp167jz0VmmC+HXj7oF2V5M2WkfW0tkWseq9067hwWj+UhxqEEtc2pDEAwHMSIywOrKb+zgsTxCRiy6fUY9myVgwHT+DHvuRUuFkLf43VJ7S+W6eexi4lUox9NnyNqavbUKcmd37nowzt7np/6GE6QxfVXtCOHAJjcQEWoanLREc60FSLTsMn3topAD6PmJGuLtUMJeaZ6ZwTtBltNUkaPzQhh0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v98KoNOsXSoGeFPVYMYy1ve31A6imaK8SVF0nJNIZYU=;
 b=QkkrE/iPPNP2xihADeZp5dZ0cnV1kq6tD0zRf1QAN36tosyxk3D1zikRwhCOathyXSjKLVYxCfX2ZBFmEkOF8Googj380k1txim8FCDsTd088nBvz63YlzWjPcmOI5T12Wdx6091UiF7x9wRYtegu0CXgbMwYJz8AfdUqXH0tRqf+tzeSKcLGX/qFz722IvIrukhoCjaSeM3z8ai9uI1xzQTs117aVYPY304YjUiiySkMiGCCc4l+Q5LyavFm4NbYHJT7ojwYqgZEQkJ1SgZqwg0I27zZbkX4TuC9jacV5G6Tc0GzQDn5uFMyrTX8wZaVfv+7v/rYiVaKm0OvpP0Eg==
Received: from SJ2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:a03:505::23)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 23:29:28 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::9c) by SJ2PR07CA0021.outlook.office365.com
 (2603:10b6:a03:505::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:29:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:29:08 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:29:08 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 16:29:02 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: [PATCH v3 05/11] iommu: Change group->devices to RCU-protected list
Date: Thu, 16 Apr 2026 16:28:34 -0700
Message-ID: <12a224061de4fff9e0725909fd0ba4e14996ff08.1776381841.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776381841.git.nicolinc@nvidia.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d50827-81c4-45b4-9464-08de9c10012a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ar4FtKo+QGeP4I7FLvChpx4QXC8eNBF9epcMYm87z17EnaygXXDt++8/5zUIice34ZaMhuGvn1SLlUj7M/MptD/cRMm250+kNjtJ6GZLHSuqW806asxmwPlfwXavRM80Ma+pMo94V/UT60GPLws/H3iIIzfrH9puWhEdjjeo6lzzUrEhVaCkePs/Dbp6VLfxplCRkLDjnJwjpr8ubP8F6lKY033MTwSF9LrTzpdLHJ/eRKPDR6xQRFHPz1YHd6e27zsdraW4Y/M5sDCbX9gBoWP5AMlm+8uEy2oMogxr3bCkAJLunp7Tl176bdBgZGp+hQZjKem+4sv+L/kvabjt1clj1mGm7UBWwvpU/6xa2uX7eC0/HidnpthgrJIdkhJ4A2fxYWVsso1wC29uBKt0BFvAZs0In3EAVyMxdP2qiGnWafl+JpJZkv+/6aJnGKl4Tl2paeHOgMVVBWRHz+5gn3GwIoH+EQa4qQnMxqRmrbaywed7trS4LTVsbYdtmKQUOexYrPCc6ukNLinB4RCAxBH3iDMWx2Uk6Z4p4S5Pwf5dCFLLz0d/hdj42WcIfgMzyi1Nnyqr2ZmYuMLxr8G7gxGJGpe9zKwn/jalKx3C4c2AkE7prkse70A+IvntHV5OdqbaEqDUxLM+wkSzgAQRcCo+Uk0nIQ4pUGEVDlaWW2+2QTxvQTw8+lLtpTmuVhv5Afdk9D//o19LPtI8hRDSz9vlKgxnRwZKbHhNP4ysGLUG+vd0VXRLtDtOMvqUj7SOlXzy4OSniVYWOJo6VlOvXQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: R+a7cUsTqsfN5ONYdFhoWchu2GHPlEpIqSX8M8EZCF27MxhuJYPVM7lpdv2m32CgAY0NHbOjZQPtpneiXVPvtPORpD3gJe3nBl6SRB4hQrHSQHdVKcrZK2HBM8VOqJ5hRnR/d5MMxry4LQ9a36fFIQ9E0D1ShLNkMrB7jYfEA5P+NDFbQ+bK19jOL/9dX7FuphzKSbT9VwVdJD3B1TriVOvQRQHLRkSP1eTdyPuzyZd5Rf4l92iHGrFevWzQpBwbFQFFfnIF5OQNuSs0iTpSo3lrtJpfrqJ8s4T67ePm9HFY6mcuejcfzESV6afRl9rJ1okRM/gS2sR2cE5XIDuEB8teqi75f3Ink3VesGJ4Rd/AmHZyBlXM8kNOUAP6meg+D7agk8upkIuTDz9ijlib73/GP087NEVFIqoD/W/MaVMSsaoC3BrMptYmiuX8yadj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:29:28.4851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d50827-81c4-45b4-9464-08de9c10012a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_162938_286123_35B94C86 
X-CRM114-Status: GOOD (  12.56  )
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

To allow lockless iterations of the group->devices list in an ISR context
that cannot hold the group->mutex, change the list to be RCU protected.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 768ac728b4cc3..d1be62a07904a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -84,18 +84,20 @@ struct group_device {
 	 */
 	bool blocked;
 	unsigned int reset_depth;
+	struct rcu_head rcu;
 };
 
 /* Iterate over each struct group_device in a struct iommu_group */
 #define for_each_group_device(group, pos) \
-	list_for_each_entry(pos, &(group)->devices, list)
+	list_for_each_entry_rcu(pos, &(group)->devices, list, \
+				lockdep_is_held(&(group)->mutex))
 
 static struct group_device *__dev_to_gdev(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
 	struct group_device *gdev;
 
-	lockdep_assert_held(&group->mutex);
+	lockdep_assert(lockdep_is_held(&group->mutex) || rcu_read_lock_held());
 
 	for_each_group_device(group, gdev) {
 		if (gdev->dev == dev)
@@ -666,7 +668,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	 * The gdev must be in the list before calling
 	 * iommu_setup_default_domain()
 	 */
-	list_add_tail(&gdev->list, &group->devices);
+	list_add_tail_rcu(&gdev->list, &group->devices);
 	WARN_ON(group->default_domain && !group->domain);
 	if (group->default_domain)
 		iommu_create_device_direct_mappings(group->default_domain, dev);
@@ -697,7 +699,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	return 0;
 
 err_remove_gdev:
-	list_del(&gdev->list);
+	list_del_rcu(&gdev->list);
 	__iommu_group_free_device(group, gdev);
 err_put_group:
 	iommu_deinit_device(dev);
@@ -745,7 +747,7 @@ static void __iommu_group_free_device(struct iommu_group *group,
 			group->domain != group->default_domain);
 
 	kfree(grp_dev->name);
-	kfree(grp_dev);
+	kfree_rcu(grp_dev, rcu);
 }
 
 /* Remove the iommu_group from the struct device. */
@@ -759,7 +761,7 @@ static void __iommu_group_remove_device(struct device *dev)
 		if (device->dev != dev)
 			continue;
 
-		list_del(&device->list);
+		list_del_rcu(&device->list);
 		__iommu_group_free_device(group, device);
 		if (dev_has_iommu(dev))
 			iommu_deinit_device(dev);
@@ -1335,7 +1337,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 	dev->iommu_group = group;
 
 	mutex_lock(&group->mutex);
-	list_add_tail(&gdev->list, &group->devices);
+	list_add_tail_rcu(&gdev->list, &group->devices);
 	mutex_unlock(&group->mutex);
 	return 0;
 }
-- 
2.43.0


