Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F3CD2FED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EsUegwYvh5X0cWkaY9RCge07+sCBL++7IVOrlemteE=; b=LVIxuHwFPgzDa1CQOnG4djYxc8
	FSGlF4shvAqOa34tufFAHIDfIDUqv9s5MkhSJMoi6GtblVx/Xarm/arN7CQWX+U2ijbYLVr6amRJT
	N+fCw6KUXWpJduZhwUFRzrScDUp7sGrXS7gFlMdPHesoP7aAkGfffK2ix9ITWIHS666xFt+TGuqlL
	SIZIadUacHPFuMjwToxgXF+Dj+SYpN7KewzIiU6SUxCaNINK5ZEKtB1bvFT9i3i9GvqSyF3zAlhwy
	vQV0vNPCxCcZ+JgX3QulSjmQcZq6bJdWTNHVwoMFLJFsO3R0Z1dHruV89fAlZRyFJ09PXBcvcFb6N
	Yr1gcfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoDw-0000000Er1T-2yFO;
	Tue, 27 Jan 2026 18:55:36 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoDu-0000000Er00-0Fhi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0kx925A3Ia4MxTkuhsvTs/IKcy0nEy31i7FB+/DyYkTtEH9EtSy9gn1DzR48UUvvg8IUv839BMiOcAJzbmh6FFGunbp+ZtsTOQSZXfzl/Cmg56xujK132UNz07QH4u3CIZUCDkCzDwg9eP8dv8za4JFObni7bpA2ne11ozyNkJ2ZPIvxmvcV3nJfSPCcIC6h7GfSD7HvYWriEScexPMzyh2ynm3/zbNhVtEkwEQXBfgWOUct68/N7yineYyABgXTXOzVbY8JeJ6yrEVJ0A635PAAFj1nkWL7r4vpUi8BpEJqFilwqwIj/xRcqq/nrcMqLAy2HFGRj/LaHn0Am9XLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EsUegwYvh5X0cWkaY9RCge07+sCBL++7IVOrlemteE=;
 b=AWWNgCWBZZCNuU7byFNbK6j63etl14oorK1RZcAsd7OKxYrHf9T6+3CeA/qcBb9BtaYGDJFPi2+rArHPoRAIpEp8LgdEVU29JhKzDJJwj5+ax6MPXIxE39FKzY0HJmkTHAysA588Hgna933cmFeqnqvg5FfAe59YvUax4T5BZE/zyeYe29/IQy1hVGUxVPfGvJZLgNjHt20i7dahTCLHUkq+CqVVOCfkpPkkYVmVWdg8TAgP+ESvOtooI3dWjM5wJNVZQrdm0TrzYLOkT1Q7gf8flJ7wYVKbL+FzgYd9WHVeNPxqFCVv8aqIxfNjaGh1agVMiUEfiTZm5IMn6Nk2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EsUegwYvh5X0cWkaY9RCge07+sCBL++7IVOrlemteE=;
 b=RAqbfJIA9iRP9TUImth60gFLAKB6Jv8bitn7OQhSuXWCK8yLFI6sTGiH96PuJSPHos45D0ITp63VfznDdU+ZHzm6ZvTEWeJKBo+DSB6RsRqEEkrZdwG3psbzgHjOqpu4p+t1sDs3NpqvNkZAn+8UaoRqJLNlzwjZXhCrdA/QKW2ir4H1pgFSaHdCV0J8HtopJAmIZFZW/Sj+a/zv2qcLjNyHBxF0YM3nQw6B+rewA2sqTVSsQLcCSxfOOpqCyNkLFrjClzP0UJKQ8pqCr8oV5NSKw/WLNEECXRe2O0iXXWJh7ZzyteD6WH6dCd+2uP612zWuRj2zuJpkIURUggrPIA==
Received: from SJ0PR05CA0153.namprd05.prod.outlook.com (2603:10b6:a03:339::8)
 by CH3PR12MB8210.namprd12.prod.outlook.com (2603:10b6:610:129::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 18:55:27 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::99) by SJ0PR05CA0153.outlook.office365.com
 (2603:10b6:a03:339::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 18:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 18:55:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 10:55:09 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 10:55:08 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 10:55:07 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v11 3/8] iommu/arm-smmu-v3: Add an inline arm_smmu_domain_free()
Date: Tue, 27 Jan 2026 10:54:55 -0800
Message-ID: <7e0e6c59e2cdcbdb9eeab642e878749dc6468807.1769539310.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769539310.git.nicolinc@nvidia.com>
References: <cover.1769539310.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|CH3PR12MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 0864eae8-7352-4a08-0e48-08de5dd5a282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J08BWCBTvn4E0iy8oaf/JsPrHrwzrMG0uUDLSghnAHxTNqYyIG9L9ZRdzB/F?=
 =?us-ascii?Q?N64bfX4jWTwBR4SZiEu0zq7+LE1BmukcvPXD6Em6HNDzPBzkgtaP8r7edATC?=
 =?us-ascii?Q?O2ziwKv9a+1zGUBvxZ5R+fIDZnEv60n4TA41UKG4h5b/Q4zwW1wyL/IJ5bkN?=
 =?us-ascii?Q?yaysfwpAipEtGpUPchBzPWqxbvIylFEpshvZcbEDZs4cxJ0ZDWjfIWK46LaS?=
 =?us-ascii?Q?n9OEjanxQlMAiZOPkgMBVNZPy9akJKt8Q3a9QfdGw+nqz/6b0wDg1KM5NMaA?=
 =?us-ascii?Q?S29KtNju1D+1ywLVO6vS/cCe/5fp3wQrQAtbiq4ZkNbjirDE/ebQXgk2Jml7?=
 =?us-ascii?Q?m8GWP1A6ZhcUQxpoTUZTEnPXTMbBsU50Mszba8wfSZmyudjVkYjj25zC+rq+?=
 =?us-ascii?Q?IucQxJlVfcCGr9ScmpbGi3v2WvJn4EsEaV/AahQZLn30FF/i0/IiBACOwLzL?=
 =?us-ascii?Q?qtdtoYHuQOydDM28+wr97HDGmcqInHeOSzHD6iXK0y1o5s1kEnm4HcJkzX00?=
 =?us-ascii?Q?VDk1QegSII11l7+zOlDSIF7SjjLX3dDRgsp6kLmsx3xxMK/FaXy+S/dl4PBY?=
 =?us-ascii?Q?A8bTAO+jHqhkxh8PpSd6mrhFfqXcJflKTaUc5I9v0xpRCKNX2HAVMW6KVZ8M?=
 =?us-ascii?Q?9PoZMpEYDiheGjpb+/DnnCqN0oaV7ynIy3Pn4DXfJemRLcr+KdpleE1OqUTf?=
 =?us-ascii?Q?+x8A5dz0lyFSYhx/PRHejyx8whQDM0ZPmOybMNKA8Gf85DsKLlldObsOnOwB?=
 =?us-ascii?Q?poXiTOpfU2GtnuXHEZ9ZlsZTGhxAFlI2FdaI0pXNWsG5BnHIpm0coRgQaeWA?=
 =?us-ascii?Q?H1I3XYDq7Hw0hUr/Qf3XPaKb9iD4f8w0Nm4xs89m7HLRQQChgyHJM5Ts/IIR?=
 =?us-ascii?Q?u6HNyKh3N7Gx2hFiyo0cUE+0VRPicAuNG/qXjnkDx3ON+Z1i1lhfRM4VsZ2y?=
 =?us-ascii?Q?WHHymdZYBbrsjN9UwyyRnrjCFP6+9OMBvWLlz44VLrEtYZcGC8WISgTM5uLf?=
 =?us-ascii?Q?g85thJOQSWOAgmeZaKJl/uMj5qG13wPe7yPg1TLzow0QaQ9BLEve+W2hWYZ2?=
 =?us-ascii?Q?Kh/2m26BFpXMe6GjoJBcpyJPjVi8InC3SSN0DtiBWTslaGM9E5sawyVR+MyK?=
 =?us-ascii?Q?ZF8gpPaokX8MfBZixbSHq4D12kEV5KPvj1dvUUQ1v42uvKTTfH2YjlLipKXf?=
 =?us-ascii?Q?8SAuQzmN5Ct+8RcaG4TA8uvARRaZzIReuPphvn0PfWhRejKLCwCWylLlY/1y?=
 =?us-ascii?Q?ZRLa2t2GfXOdbySUsKhp6EnQhx26w1OrWOyev2dzQqSfPdYkL7DwPA9fpQSk?=
 =?us-ascii?Q?ow2SHwwqo6FF4y5gqRwqdfUj9eAcyGN3eYGeUiKmNjya9wjSFb2Y8iuLxq3o?=
 =?us-ascii?Q?u22SpBFJv+W9cyc3E/BAfmcyQM/8veujHHuyLe74ZU6kgxiNj8y8FEwPiy6t?=
 =?us-ascii?Q?VxcY48P7IPzHrsu9or/JwGhBDKGycclUIsQar/zYx7urWfvPhUFOiXngNxgu?=
 =?us-ascii?Q?PUPhxGx76sWclhC1Yweq4Tlr+2ei6qzLM3zB/O17ul5CW7YcBFViiYVTDKmf?=
 =?us-ascii?Q?iSuieftlENIlM5XIu32aV2Ardri0DjXH8cvOWAp7qVObVY9eJQpmqsk5zZL8?=
 =?us-ascii?Q?pzk+JE8Uc/dwEFmmCUCs7BviDO3jR9TRzNtpoKwvwnM1k66AYvm/nw+JfGje?=
 =?us-ascii?Q?c+stFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 18:55:26.8716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0864eae8-7352-4a08-0e48-08de5dd5a282
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_105534_094630_5E714758 
X-CRM114-Status: GOOD (  13.05  )
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

There will be a bit more things to free than smmu_domain itself. So keep a
simple inline function in the header to share aross files.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 4 ++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 24894b163004..cfbedb76c8ba 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -956,6 +956,11 @@ extern struct mutex arm_smmu_asid_lock;
 
 struct arm_smmu_domain *arm_smmu_domain_alloc(void);
 
+static inline void arm_smmu_domain_free(struct arm_smmu_domain *smmu_domain)
+{
+	kfree(smmu_domain);
+}
+
 void arm_smmu_clear_cd(struct arm_smmu_master *master, ioasid_t ssid);
 struct arm_smmu_cd *arm_smmu_get_cd_ptr(struct arm_smmu_master *master,
 					u32 ssid);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 6097f1f540d8..440ad8cc07de 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -197,7 +197,8 @@ static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 
 static void arm_smmu_mmu_notifier_free(struct mmu_notifier *mn)
 {
-	kfree(container_of(mn, struct arm_smmu_domain, mmu_notifier));
+	arm_smmu_domain_free(
+		container_of(mn, struct arm_smmu_domain, mmu_notifier));
 }
 
 static const struct mmu_notifier_ops arm_smmu_mmu_notifier_ops = {
@@ -365,6 +366,6 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 err_asid:
 	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
 err_free:
-	kfree(smmu_domain);
+	arm_smmu_domain_free(smmu_domain);
 	return ERR_PTR(ret);
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a55f9ae95411..6beffa8e7c74 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2560,7 +2560,7 @@ static void arm_smmu_domain_free_paging(struct iommu_domain *domain)
 			ida_free(&smmu->vmid_map, cfg->vmid);
 	}
 
-	kfree(smmu_domain);
+	arm_smmu_domain_free(smmu_domain);
 }
 
 static int arm_smmu_domain_finalise_s1(struct arm_smmu_device *smmu,
@@ -3427,7 +3427,7 @@ arm_smmu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 	return &smmu_domain->domain;
 
 err_free:
-	kfree(smmu_domain);
+	arm_smmu_domain_free(smmu_domain);
 	return ERR_PTR(ret);
 }
 
-- 
2.43.0


