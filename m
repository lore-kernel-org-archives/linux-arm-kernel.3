Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F7BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df/mkGvazYYmooHOlct6HA0s/98Am3Slm04EgkXdYn0=; b=D66DuUZhczyIlLVgK+8MgBnKSr
	wqHREjPRB6O8bE4CjpSmxFkdwD+yi/Of9f3pHSzcvpyviuMbtbq0YZUnx8wbYFaxolkfUQT2C9dTJ
	gkfv25USzgYDXORs48IUjjuUizxXlexCL+CFsQRlV5pteH/Fna1obkRGcYCowWG6oRHJc5GiCN1nF
	WmfeTdZpBzrzntsEpMiQbryVT8tf3P+JaaxwbonA9CHfd9gFi3FSKLHS/Q5Wy8/Q1Vi711Gow5m7B
	aOqf4V2Djqk+5hjlYf9zx5ZZL33HYjwgHudzeZxJMEtgWvylJaOw9odjobCYG6IN1eGpdztAvl7Js
	fkqZvkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJG-0000000HatR-2ieL;
	Tue, 19 May 2026 03:39:58 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJC-0000000Hapj-0S5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:39:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSIcGPizVRy6ATjAZGJjb97MFNhRORapg2doN/j7BH5Zl+iQUEx9HnFz8gc8rI8Vn+48gCVmni/c4+AFGR7OnXY0t/y4kHUKbhQqpIz9nGi6xv/Dw00EnYFoiA422rg9VZT/u/XgLHcGH1N64T4uazZDEHDLJI+2wMu7rVE5A6WBDUEE9dA4VjY6IIJ0ihpJZ7CP6Rrk68iVROvJUc6T5IWIq7fR6BttXFeS91r2BeXT+UgNFzCvdXfhpJjUCxtgYgx1yscEwk+vxDHzEiZLes/D+La4n8tTr10NtrZOUbrA/w+i/ojPtLgtHN3KNvNwJCO44CyzTS0YozZLGK+7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=df/mkGvazYYmooHOlct6HA0s/98Am3Slm04EgkXdYn0=;
 b=UHamXF9Y9J1cJ2U1uUdg8FhGGYvFpM4dk1RDzGrbXw2VXxngxF4fcoCVd4n8HKbmFYTaj3erDAtsa5I6tepI6jWTVUnikgfLvPnIQQc/0sTTLoRo0JvkEEMvTasUgME6t3ThRgvtgzEvdxYVWwcz1zYJQK4o3cBIxbItVJplC/TgLkMp7r7wmYOMBn2YCq31WVRiZQaLC+vRqUbLLdwx2pV/WQiZVYgnOzOiSR2p/ULRHnHc3NnPJHAJXeyTQM7PX8OEKIyH8Y//pgcKn2EWnMkD5KdjMMA2VKVF7AJs/m12BqogW/6GTd0cxPUHt7c0PCuYzBwY7YmKhm2HYMIs0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=df/mkGvazYYmooHOlct6HA0s/98Am3Slm04EgkXdYn0=;
 b=CM1RuQoVnI4oNLPdgxB9Q3RJzj3DmKNj1FtKtRmsL8Bq7GE87hr+XldPZ0ScSt2mK8e5RvLdSv0ZwtFUI68dEdkYdSwLL9SkEaK5bIKAkzcA4wIO9ZXdAQOOnrxvZKZosGlcQpZNkW9VtVdtwawA9njjZyvq20STtXMjuqoeOsLCHljv5cfX7nkm81UGd26dIlraTKibrUrduezKND0ewvIs8sp8D3XuZ1BdkTRuK5xJq00xbDVEMtsGwZC/fvRS/7idHgA+0gybVSB0f717JNTVvVzl0tN0psgEwNV9tW0YDqINlxQ5uNjuBOH5NMAREH9vl6TXHooCHwJQ8AIXmw==
Received: from DS1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:8:44f::16)
 by CH3PR12MB8210.namprd12.prod.outlook.com (2603:10b6:610:129::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 03:39:44 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:8:44f:cafe::29) by DS1PR04CA0002.outlook.office365.com
 (2603:10b6:8:44f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 03:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 03:39:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:29 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:29 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 20:39:28 -0700
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
Subject: [PATCH v4 06/24] iommu: Defer iommu_group free via kfree_rcu()
Date: Mon, 18 May 2026 20:38:49 -0700
Message-ID: <a65846f5514fd3b7ef6c19e060ed3a25af75bf03.1779161849.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779161849.git.nicolinc@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|CH3PR12MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 9244b3e8-542d-4e3a-7e9d-08deb558446c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: tbA8GZCndwQZkrzb7uZx44Aatpe+e+5pa+LPqxZ1GOGgJDDaBavI0M3QKdRmoD2UXz4X1UBVrO1BPqH5aIusJJFUZVFrA6weUFNwKq9nIUcJwiUCBCj4W3kfnyxrdXuWyZDGqR99GUkTA8Qd/rBFq7Nl/y53aDKaNw0M2gEfnKITvGDatTwPNbgpFdTOpJI2ac7e7Akn5mXlb3wQL4XyPWSey7fSVjmFnwmorZgg3wXr9l7ou6oiyEQox7rdifUZhc0iWsnOIDdrIMylY06bkw8g/NsEbgcen8NKiRdgMRxVw0tm2dQkISx5Zs9sSBKZHWrSP1tb5mk0ZPey2L1cnAu4PlVz2zUjXHSNTVHv3idX2ss5kofeZ6qKycLb3LMGhdfOHTpG2myVDW/CgI9VYJoUHob3MGJZd6CPmqZbhWe1PDYNZAm21goYs0U6zGygt9jwYb5KIHDpe2RyrBD7R6Cht8rQhlVEQz/BiKDx8toHHNw8Mr/wtlsjtDpvt18lON7f1xhDD8T6NKXG8GbIY92miLB+efITfFRurV9jsvZH7oohcamVGHlxNVQwYHdIgnDpbzQ6vHFnsOdiWOtTtQITuwP5jSs5yY7Llqh5ghch3tYs6nYbleZmfEyCW5u5JbqUi9hCmmfTnxoCsBjWzLYIAmgEeZp1ptd9fAa8WQpR3rplA8zoX8LR1VJLP6lenZomQDzwiqjRtLkQjn5rYjQrsXTlg1OIql3PmogGhqY=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: elS+npFLbi9AFYb8StXOLGM4q4lGAOj2ItY4j/o+6WkZ86S0hh2jDkpOVOWuCgxWsmjZLraYnTVD3a1+GPjCQr+ANg9czTydwk4f2Q6fN5izKZs3Ti6vb1sGIWva0A27LUlLLes7zhm2wr4D/CsRaVWkRYhxBYX2EarZgWYuQNB9omhg02ZVql/zudZ+HhZsqimh4L/1mp7mBFL4lYJVk0QDzxJgJ5Le5JyqiqshCsYnA6UiUchuoCaRUdCGLFBwlcpKsL54v4pmuPROEhRv32eiP+JRHGyIdA+FXTccaVtq7EahqvlRFYGXzPf0upkktbKmZq+dEo407SKyIgneYM+DMoNYX0ksnejUxJOeLJt40RPfmRZC9GLxN0ZUmrSjbnCMCERv0LLk7YqVgrXCFazwWBRKaRajLOc2M5Fgih347/0WG2cysWdLCv64ZsuZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:39:44.1320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9244b3e8-542d-4e3a-7e9d-08deb558446c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_203954_151718_BBC98D82 
X-CRM114-Status: GOOD (  15.71  )
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

dev->iommu_group will be read in an ISR-context to look up a group_device
for fault reporting, in which case mutex cannot be used. For that read to
be safe, two things are needed:

 (1) The iommu_group memory that dev->iommu_group points to must outlive
     any in-flight rcu_read_lock section. Add rcu_head to iommu_group and
     switch iommu_group_release() to calling kfree_rcu().

 (2) The publication of dev->iommu_group must pair with rcu_dereference()
     at the upcoming reader (cannot hold mutex but rcu_read_lock), so the
     writers must use rcu_assign_pointer().

Existing readers do not use rcu_dereference(); they retain their current
synchronization model. Apply a __rcu __force cast at the writer sites to
satisfy sparse without forcing every reader to convert.

New reader added by the subsequent change uses rcu_dereference() only, to
reach group->devices for a list lookup. And it does not touch group->name
and other fields. The kfree_rcu() here is supposed to keep group->devices
alive across the read-side critical section; other fields will not affect
the reader.

Note: this change alone does not yet make group->devices iteration safe
under rcu_read_lock(); a subsequent change will convert the group_device
list to RCU and switch struct group_device to kfree_rcu().

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e68c7b142ad5a..6727b6f7797bd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -71,8 +71,12 @@ struct iommu_group {
 	 */
 	unsigned int recovery_cnt;
 	void *owner;
+	struct rcu_head rcu;
 };
 
+#define dev_iommu_group_rcu(dev) \
+	(*((struct iommu_group __rcu __force **)&(dev)->iommu_group))
+
 enum gdev_blocked {
 	BLOCKED_NO = 0, /* Not blocked */
 	BLOCKED_RESETTING, /* PCI reset in flight */
@@ -531,7 +535,7 @@ static int iommu_init_device(struct device *dev)
 		ret = PTR_ERR(group);
 		goto err_unlink;
 	}
-	dev->iommu_group = group;
+	rcu_assign_pointer(dev_iommu_group_rcu(dev), group);
 
 	dev->iommu->max_pasids = dev_iommu_get_max_pasids(dev);
 	if (ops->is_attach_deferred)
@@ -613,7 +617,7 @@ static void iommu_deinit_device(struct device *dev)
 	}
 
 	/* Caller must put iommu_group */
-	dev->iommu_group = NULL;
+	rcu_assign_pointer(dev_iommu_group_rcu(dev), NULL);
 	module_put(ops->owner);
 	dev_iommu_free(dev);
 #ifdef CONFIG_IOMMU_DMA
@@ -772,7 +776,7 @@ static void __iommu_group_remove_device(struct device *dev)
 		if (dev_has_iommu(dev))
 			iommu_deinit_device(dev);
 		else
-			dev->iommu_group = NULL;
+			rcu_assign_pointer(dev_iommu_group_rcu(dev), NULL);
 		break;
 	}
 	mutex_unlock(&group->mutex);
@@ -1059,7 +1063,7 @@ static void iommu_group_release(struct kobject *kobj)
 	WARN_ON(group->blocking_domain);
 
 	kfree(group->name);
-	kfree(group);
+	kfree_rcu(group, rcu);
 }
 
 static const struct kobj_type iommu_group_ktype = {
@@ -1344,7 +1348,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 		return PTR_ERR(gdev);
 
 	iommu_group_ref_get(group);
-	dev->iommu_group = group;
+	rcu_assign_pointer(dev_iommu_group_rcu(dev), group);
 
 	mutex_lock(&group->mutex);
 	list_add_tail(&gdev->list, &group->devices);
-- 
2.43.0


