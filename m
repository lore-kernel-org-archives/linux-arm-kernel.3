Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F36DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYRntXu32Q6izfHxxzfXSiTNRSSg5NonQdMdse5RyvE=; b=teU358kd2TjZb1ZyBYWGH8HkzR
	V8MCExCQ+TckpWaHG2ixCid1UkdDLh2Fo6l7nWaJ6JOZ+4FqBCpQD3SSW61IPC1XFd0TjTe4tw30u
	HKyTnSuzCXnnbLzaPDn6LSNKKU3KKtBzptID+/7kjmESSa6HIyM8Ue50lJioy1Vf7YQIaclkVb38M
	xSqpCFPNqYSVF6voQM1Duu8spYfVs0D3QZSjElMIJkL9rG2owO7zXFYOQK6tuTUN4wZkwTyzCaJxO
	iK9TgQSERXmLyGiI8dCHB9Q8b5PAumqWCpbXWQtUWCLmDvfYOa51V5orItWO38Jwty63zqvI9uA6B
	tKw8Resw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJS-0000000Hb4E-0Fek;
	Tue, 19 May 2026 03:40:10 +0000
Received: from mail-westus3azon11011051.outbound.protection.outlook.com ([40.107.208.51] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJI-0000000Hau9-0IGX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FME7+UIMRovuA1l0Pz3AWkuWiNahZrNEd/9FUKW0gyUoDRVP/Wy7qAKtAQqlqdeQlqjJqAxGL+y06EGrYGEc/nkEO0oNeZivekUo817Nqe/C/cfCRPlPqoD6kEoQx1ZaroY1P1zyFCxwSHC1fM2mkGpzPUzQLNgma52XoYjZIQn0jTF8HRQNofxzlgfIPeIACVBBR4Ut1JxgWSfnaw8hl8SPNNxKpIO3krw55PVDzy4Pq/l/x088lm/jVpw0LbqljrxPXOLeQNbhDS0IMv+ybc4soYDOsuIX1cLElVF/CwjeSbsWHyP/Ac4jqnvyCzeIq2pk69wr3Fgptk481lfv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYRntXu32Q6izfHxxzfXSiTNRSSg5NonQdMdse5RyvE=;
 b=AcLxAp8B1b/fvdvpWvvm00VhzNsOqOVcLovr4hMV6vrVXp+qTwlHrNMv9sZkuh10kzgsLORcbR8CvHMgOz40pr8CXlSK+ph4l4n6Ku0oPcnvTJF+Vvlf7LE/KbKw0ZmVIietpw2oLl9cuGQMXWTaPXv5p00i0Y5y/zKXj1xmzX49bPT6wb6VXAJoD1t7vLP6yoYnq0uYbbbI1O3hNo65BlDKbIb9yDWLGESnVF4Ubwsr+qB3mUXPmsGCvoH0vTq45WL7tWO5nL5+9xGL2rrLsQcE1Pgxta0X0xuwad/1UX2ZT+if+RjB8GsLO7nZaOwsPJw/L0FzMv6h4AbAFTDoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYRntXu32Q6izfHxxzfXSiTNRSSg5NonQdMdse5RyvE=;
 b=MGmQWa0okHOcbe1cgUbRddVWykvP/zw0dMz2bxYiz+/FPxlheJo2dh5aa1i91NrAOQ+ygLZzCa8zA/Tub72MMQNMJHTJTWVPBMgJhuBAhOyo+CWnNGS119uouYVIiT5vF2V3tc58A5uF6VTu5QmLs2KGY5+pNtbNoXT8ZbWVFBPr9KHEicOlEmocf8WJ0I6xtUhJYRxGFDRRMGoCjhv4Fu87PZVi/G/g2t9DNhtjV3ktZo2/3lv263vDomDWFPhPAtljRTu9D5RWY9I7bLec56Rxunb/u0gONrifrDHuV2mfTQGJjnWod1MLHoNnf8Y0kETi9IWKE1z/7PprIornmw==
Received: from SJ0PR03CA0188.namprd03.prod.outlook.com (2603:10b6:a03:2ef::13)
 by PH8PR12MB7328.namprd12.prod.outlook.com (2603:10b6:510:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 03:39:51 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::4b) by SJ0PR03CA0188.outlook.office365.com
 (2603:10b6:a03:2ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 03:39:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 03:39:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:30 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 20:39:29 -0700
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
Subject: [PATCH v4 07/24] iommu: Defer __iommu_group_free_device() to be outside group->mutex
Date: Mon, 18 May 2026 20:38:50 -0700
Message-ID: <bae489d600425a014bfed1c2290ee7c0c657f198.1779161849.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779161849.git.nicolinc@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|PH8PR12MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: fe79e014-dd60-4ca2-9357-08deb55848b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|7416014|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: H6MmkUqvXKFUmgdj2JnVn9rrdb/j1fUZCtZ+mQR66paslWaVWZrXZJLk4vWk2biZjZBOvloVuvT74cRqcsuYbJ3VsYCtQrlk1CRl1uTBQR+kwo/il2VE3xbtbWrli34b0FNaYDWtpgy4ffhTR3i0HSuM+AP4DkulQotn6IiO90RACBIGnAcTiIUIMdljzLJMsiGzd3D2YPNLOfudjhpJqkcrqapzab+WYxa9a96Qq68gliBuvspAuEPKhlaY0B6kyFpKEjvJ8Cj/KoIXR0Lt2xx+gZEDXPEkIHh0v2G/w9NF+sL/f0gb9dOYbawIzby9eMJwGkKE7yfCqGxxO7i2b1lT+dawMCq/LDfZWmyABSVtD6bLvnpjFWljdQVNmC0QpqaKKmObOHopQ9ux7walMrrEQjTX9GJpFrc8xmHrM1oW9sh/MrfwEmxcE/E9sscIjy2XOdJxXCizwaJjY3toD7s/iP/14a/b35CIpgwcnILXCzxzJC1J7HuJ+/V1rlxSiTCIm8mmAjvzLkdHjwdqxh5dbUDsNmi/1OIMF3I0N+Bcl+8qr5hMYqfq1uNGPUmdGW67xIJgCDGuIrWCvkh/efu1mD2QsGYY3omGYn6XnU/DkfcZa9HCyIglFydUwf9WOue6hOchAgX+vTT9EJBB3B+elju5a2iOlp8IF/ZXHK9/RpA6+dYzeI3jrogbq4b2s7D9ycBOOlwdfy+V4uCqVffp9dxmruc5bKOf/vABt+k=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(7416014)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /3QLgt1x9Abq7gMRq+1HNYnuGF2vhKQNllcs4LnPsHiElQMOKHsvJE6pINQ1J/8Mby1ZGEI2dZ24hAfAGKCU9g9fzO4vT76jX0Q4ms3eYNY63rLgqVn6OFGfjXmQk2E5Hpg9kdgtA5geWx01CImcIg6Bo3DYh5cGac5aiLKAc1vgwzChdnT7s2pwMg0wGY+vXKY3thUh15gJCryLjF6sKl0pmQVGMafImn03NK+D3w07EMwqdhA5qDlhdC4her+B1BT9x1oINTIq/pJqjM1fPrHxQKjx/cKczvLxL0bWxm55ugZMBGUvDwzzOmegkyg5rHMPweBOwz97PQoqjXZDdT8snD+Bxg7gXMdQrl5YXa0vDP6dBLmTOilaSWmY1IyUYTrlizefrFjPrmCu2KhlCbn49bo4REQnjVK9R4Tiwo+ZyHBRi57/DNYpWEm/9uga
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:39:51.3406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe79e014-dd60-4ca2-9357-08deb55848b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_204000_116468_67F33377 
X-CRM114-Status: GOOD (  16.93  )
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

__iommu_group_remove_device() holds group->mutex across the entire call to
__iommu_group_free_device() that performs sysfs removals, tracing, and the
final kfree(). But in fact, most of these operations don't really need the
group->mutex.

Subsequent changes will introduce sleepable operations to this function:
 + synchronize_rcu() to defer the gdev->dev put past a grace period.
 + disable_work_sync() to cancel a future broken_work.
Neither should run while holding group->mutex. Thus, move them outside.

Separate the assertion from __iommu_group_free_device() to another helper
__iommu_group_empty_assert_owner_cnt(). While moving it, revise the inline
comment a bit to make it clearer.

Defer the __iommu_group_free_device() until the mutex is released.

This is a preparatory refactor with no functional change.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 6727b6f7797bd..2f8f3ea13f490 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -634,6 +634,19 @@ static struct iommu_domain *pasid_array_entry_to_domain(void *entry)
 
 DEFINE_MUTEX(iommu_probe_device_lock);
 
+static void __iommu_group_empty_assert_owner_cnt(struct iommu_group *group)
+{
+	lockdep_assert_held(&group->mutex);
+	/*
+	 * If the group has become empty, the ownership must have been released,
+	 * and the current domain must be set back to the default domain (which
+	 * itself can be NULL).
+	 */
+	if (list_empty(&group->devices))
+		WARN_ON(group->owner_cnt ||
+			group->domain != group->default_domain);
+}
+
 static int __iommu_probe_device(struct device *dev, struct list_head *group_list)
 {
 	struct iommu_group *group;
@@ -707,10 +720,12 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 
 err_remove_gdev:
 	list_del(&gdev->list);
-	__iommu_group_free_device(group, gdev);
+	__iommu_group_empty_assert_owner_cnt(group);
 err_put_group:
 	iommu_deinit_device(dev);
 	mutex_unlock(&group->mutex);
+	if (!IS_ERR(gdev))
+		__iommu_group_free_device(group, gdev);
 	iommu_group_put(group);
 
 	return ret;
@@ -739,20 +754,13 @@ static void __iommu_group_free_device(struct iommu_group *group,
 {
 	struct device *dev = grp_dev->dev;
 
+	lockdep_assert_not_held(&group->mutex);
+
 	sysfs_remove_link(group->devices_kobj, grp_dev->name);
 	sysfs_remove_link(&dev->kobj, "iommu_group");
 
 	trace_remove_device_from_group(group->id, dev);
 
-	/*
-	 * If the group has become empty then ownership must have been
-	 * released, and the current domain must be set back to NULL or
-	 * the default domain.
-	 */
-	if (list_empty(&group->devices))
-		WARN_ON(group->owner_cnt ||
-			group->domain != group->default_domain);
-
 	kfree(grp_dev->name);
 	kfree(grp_dev);
 }
@@ -761,7 +769,7 @@ static void __iommu_group_free_device(struct iommu_group *group,
 static void __iommu_group_remove_device(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
-	struct group_device *device;
+	struct group_device *device, *to_free = NULL;
 
 	mutex_lock(&group->mutex);
 	for_each_group_device(group, device) {
@@ -772,15 +780,18 @@ static void __iommu_group_remove_device(struct device *dev)
 		if (device->blocked && !WARN_ON(group->recovery_cnt == 0))
 			group->recovery_cnt--;
 		list_del(&device->list);
-		__iommu_group_free_device(group, device);
+		__iommu_group_empty_assert_owner_cnt(group);
 		if (dev_has_iommu(dev))
 			iommu_deinit_device(dev);
 		else
 			rcu_assign_pointer(dev_iommu_group_rcu(dev), NULL);
+		to_free = device;
 		break;
 	}
 	mutex_unlock(&group->mutex);
 
+	if (to_free)
+		__iommu_group_free_device(group, to_free);
 	/*
 	 * Pairs with the get in iommu_init_device() or
 	 * iommu_group_add_device()
-- 
2.43.0


