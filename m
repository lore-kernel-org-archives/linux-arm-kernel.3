Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982251091912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSCJb9fj/bA2al1NtgZsspYNEQ+WA6J8eK2VqPpjUIk=; b=L5TdEJaG2KbrSvOO1lgN3AcxV2
	PshisCGbnFv27FhaMyetxq+UZ1KM6DbWbg01fyDpxCzoYmH03NMiFB6UAc6MW4o2W25ll+3G4xHCO
	CZWifv7Kk307/BSu0osOrKa3zDNLtFV7axeBTBuqbJflleXvhExwcDrKuR0c8Cge+iLPkYawIFkko
	rbrX1uoMeCfa4hahiNWR6mjBpVbcwJG35SQcAl4wZZ5iOfqhKiwzIpyZBhap508ztcC8dBd5Zuap3
	+mXezbOP581+2rUfb8EHinVAB0CyEjIlfs+4B/UHspZx6RSt1/ettC/jrBVc4W0Q/zu4+diCAcknR
	eTmkSQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQD-0000000BTPB-1kOR;
	Thu, 19 Mar 2026 19:52:45 +0000
Received: from mail-westus3azon11012060.outbound.protection.outlook.com ([40.107.209.60] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQ5-0000000BTKP-3r0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQWWcqCCxXDYFZ1Klfv9+4XbbUKcNrBV2pUkHjiTMcmT0czfh0fzYGvCTIupM/2VlAeYIf9XnKFH/BE1qRnvPVo7XP1Ewr0TT8Bdey6GcVe0Eac4vYNnSN84cISSGRb7xifunJiDtpIua/LJyVOgLwGjYt4+16TfBKEJRXij1d6tmNuNliKLQS3TdAeIhw+mF4/YieKa7E1Zt+E7EgwZjqxVx2soYXfVk2GI+zwM5UEQP0ENdJ7tmOlPi/zEss/X/41+lJgzUUYK5wKMtNoa/vnPzWjvw8WzdgY3/4VXBlBqxjx739p7nfU/2k47B7TKr5IKaIt3QEV2E6w1L8GVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSCJb9fj/bA2al1NtgZsspYNEQ+WA6J8eK2VqPpjUIk=;
 b=vLj1+ctSixyUNOHMN9vH2fkkjsJIiv41mUAIhNQ+w2Q0ykkmiu1poPFc6qhUEMKRLaqGagRckLdufh6wBGL/lj9m7GcrzWVmbAa0WK4BMgVEltsTeD9T3UbAqKJOmKsu/rfSDjZ401AYp3bAITfvw4Uni+1ZaYjAFq/YMkoX+dSFJXrVEh+qOf5WxoCJSlbv7UZxEtEANbM5HZQqzm+Da8CxEZOi3kksd2JRuln8mVmFYhsGoBb76DApNh0tCyyN/P9oI7iYyKMlrtJ7GrzeYlegSZ5uM6ikH7kqUZezKg4/xtwdV24fGfrzoeAuJuLgc/foqjIsAR5WqfROjqv2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSCJb9fj/bA2al1NtgZsspYNEQ+WA6J8eK2VqPpjUIk=;
 b=NgJ74Wc6bV3GX4FJwrzygErat7P5vuxBgxmlpo3q7CduAZY6SXB5UCA5Wbty4Zf8Qr+mM2X/BwhqFnjIG1InoTI6ZX8yPuu5BQl3Mol7gtlTvFhsTjR+GdrxL1IckH72gejl8A4OTfPT0lBl5Bg3e7ZPwrU+OQFF3kD42DGYvROn2qBEHrQWG6akyTW5VWy1Tj6UVLfWJV1aO3LE7Lf37ECtoYWaTr2GxavbAj3E23nccC1gce5aKjUBA/VYZPMMgwj3KRqnRgM18BvMbIUO78Ji/FPKAXavsBz0tkuecksLt8b+Hn++3o1GKMCZf0VmR9hYcw7sTXqHa8dWGMOiMQ==
Received: from MN0P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::30)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 19:52:29 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:531:cafe::d3) by MN0P222CA0028.outlook.office365.com
 (2603:10b6:208:531::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 19:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 19:52:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:07 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:07 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 12:52:06 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jpb@kernel.org>,
	<praan@google.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<jonathan.cameron@huawei.com>
Subject: [PATCH v4 03/10] iommu/arm-smmu-v3: Store IOTLB cache tags in struct arm_smmu_attach_state
Date: Thu, 19 Mar 2026 12:51:49 -0700
Message-ID: <ceb8150f229ee7bd355ec42d23e422ae2185492e.1773949042.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773949042.git.nicolinc@nvidia.com>
References: <cover.1773949042.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b299986-41fb-435d-fca5-08de85f10da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gttujjYMPgj/qrV+a7EXUGJLp2qqp1IES/686lpwIg6fAC7zoYNrYLJq4EAAhTjG45Wu9+wQaNqVAKkmZGaZPif9wqXt5QdurE5OS2RCS2EQIWz9lroax+9UrfWyjf6Ivh05ci9bsM8Ng47IFuYEiHF1weA3N5wKoiDyM6WZtJWKOkPJWcCOUrB6UMpbzPI9FVjYFEqhxEA3Ks3Ihkgb57PT9Tt9hhlJ8W4uTb2lRumJtFLooHVsf7ItgjYDTLA5EZa2Ml/2kHnNeCxjVv63oqWewOo8pMH9mgSVIn3PoEGW+Kyp0QCHdd5/nCVohOgMZFiQrUU3JlWYmMw4oP/Al1wCDXvQ5cvjzI8pYwwia0AW4QYqrPI9e8z4CaQxYeIfACadbCTh6ihW+NuxhCRYp+mO5z1Da3hDTg0TxUYHv9B8GKhagsHyoriM/W42baFs1cWrEZlBPZs+BYrpZhI7YaBgj7mfWexafzJMDi+pb5xmabvXEhNemJJGb57+85eOwgFdi2WGEB6hPHlyFfgSXSuGGpGE/WDVDJzAfSadBz6btAuB+z+kmpS4Q0wZAlFKCXQspnOEEcNFwfLG5F/qEPTeo7OVF0JYDW89PjIxOJ1q+OeS7YZQ1Q7Xv/Cem9Hb8lUv3BQBYr0bpEUcARlhWHUBNSMMXnG4nnINzv2YrVc401MO7fy5JiLfAwnVHt3n+tsIwYXRYH5+sn9VAY2QbXqywkQ6nJm1FLlWhMhPJCTkodB0Q7sxioLIXJgjzc9TAmb5VUhJbcY7oYDjTMAhLw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pIUaosFY8dXK0CoRHFeR47X0yym8y0sPKPHqSBULbLLt47zrkMY13xowdnigDRqsMAIgi9sDnL/53JpeKQQqC2R75qbvrglSxN9Z/K9+HYMh01SyaWt/0aQ6JvhdOatOzdVdHii1Y+T4/gYBXY84SElS/9doNhd9O63KQvXcnZicaH/uJCTDSkBoeFiR3zMFdp+5+ZdNJzDrP632UxaEx3z77Mmzj+VNBeH9MzhRBopGUkl2i0tNfEVXb8bNqgbnwsxL6yarukJFo+cGKZULaG8flmOid6+aVrBYspw3a3c0lzyxGCZ600/Ydr/xUiuc+Nz4IKBsgNNziPJbLmryGW0YMG5Mwu1y/GoPaRU84sfSCpyDQ6h1NxpIc4ua+MJwmHxka9CagLiP1LX8ZnBSwwAwM4EoTarfgQjXOND7Kq5TVppYXxDWpIF9xStwLuwr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 19:52:29.3918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b299986-41fb-435d-fca5-08de85f10da4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_125237_981339_32BF9CD0 
X-CRM114-Status: GOOD (  22.43  )
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

So far, an IOTLB tag (ASID or VMID) has been stored in the arm_smmu_domain
structure. Its lifecycle is aligned with the smmu_domain.

However, an IOTLB tag (ASID or VMID) will not be used:
1) Before being installed to CD or STE during a device attachment
2) After being removed from CD or STE during a device detachment

Both (1) and (2) exactly align with the lifecycle of smmu_domain->invs.

The bigger problem is that storing the IOTLB tag in struct arm_smmu_domain
makes it difficult to share across SMMU instances, a common use case for a
nesting parent domain.

Introduce arm_smmu_find_iotlb_tag() helper to find an existing IOTLB cache
tag in the smmu_domain->invs array.

Introduce arm_smmu_alloc_iotlb_tag() helper provisionally copying an IOTLB
tag from the smmu_domain (cd->asid and s2_cfg), which will be updated later
to actually allocate a new IOTLB cache tag from the ASID or VMID bitmap.

(Note only the new_smmu_domain pathway is allowed to allocate a new tag.)

The returned tag will be stored in struct arm_smmu_attach_state, which will
be forwarded to arm_smmu_master_build_invs() and eventually set to a CD or
STE accordingly.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 11 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 84 +++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index a31f9f7f39d3a..7f86be3144805 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -674,6 +674,11 @@ struct arm_smmu_inv {
 	int users; /* users=0 to mark as a trash to be purged */
 };
 
+static inline void arm_smmu_inv_assert_iotlb_tag(struct arm_smmu_inv *inv)
+{
+	WARN_ON(inv->type != INV_TYPE_S1_ASID && inv->type != INV_TYPE_S2_VMID);
+}
+
 static inline bool arm_smmu_inv_is_ats(const struct arm_smmu_inv *inv)
 {
 	return inv->type == INV_TYPE_ATS || inv->type == INV_TYPE_ATS_FULL;
@@ -1117,11 +1122,13 @@ static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
  * @new_invs: for new domain, this is the new invs array to update domain->invs;
  *            for old domain, this is the master->build_invs to pass in as the
  *            to_unref argument to an arm_smmu_invs_unref() call
+ * @tag: IOTLB cache tag (INV_TYPE_S1_ASID or INV_TYPE_S2_VMID)
  */
 struct arm_smmu_inv_state {
 	struct arm_smmu_invs __rcu **invs_ptr;
 	struct arm_smmu_invs *old_invs;
 	struct arm_smmu_invs *new_invs;
+	struct arm_smmu_inv tag;
 };
 
 struct arm_smmu_attach_state {
@@ -1138,6 +1145,10 @@ struct arm_smmu_attach_state {
 	bool ats_enabled;
 };
 
+int arm_smmu_find_iotlb_tag(struct iommu_domain *domain,
+			    struct arm_smmu_device *smmu,
+			    struct arm_smmu_inv *tag);
+
 int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
 			    struct iommu_domain *new_domain);
 void arm_smmu_attach_commit(struct arm_smmu_attach_state *state);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 78d45952db7da..29b1310786244 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3205,6 +3205,77 @@ static void arm_smmu_disable_iopf(struct arm_smmu_master *master,
 		iopf_queue_remove_device(master->smmu->evtq.iopf, master->dev);
 }
 
+static int __arm_smmu_domain_find_iotlb_tag(struct arm_smmu_domain *smmu_domain,
+					    struct arm_smmu_inv *tag)
+{
+	struct arm_smmu_invs *invs = rcu_dereference_protected(
+		smmu_domain->invs, lockdep_is_held(&arm_smmu_asid_lock));
+	size_t i;
+
+	arm_smmu_inv_assert_iotlb_tag(tag);
+
+	for (i = 0; i != invs->num_invs; i++) {
+		if (invs->inv[i].type == tag->type &&
+		    invs->inv[i].smmu == tag->smmu &&
+		    READ_ONCE(invs->inv[i].users)) {
+			*tag = invs->inv[i];
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+/* Find an existing IOTLB cache tag in smmu_domain->invs (users counter != 0) */
+int arm_smmu_find_iotlb_tag(struct iommu_domain *domain,
+			    struct arm_smmu_device *smmu,
+			    struct arm_smmu_inv *tag)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain_devices(domain);
+
+	if (WARN_ON(!smmu_domain))
+		return -EINVAL;
+
+	/* Decide the type of the iotlb cache tag */
+	switch (smmu_domain->stage) {
+	case ARM_SMMU_DOMAIN_SVA:
+	case ARM_SMMU_DOMAIN_S1:
+		tag->type = INV_TYPE_S1_ASID;
+		break;
+	case ARM_SMMU_DOMAIN_S2:
+		tag->type = INV_TYPE_S2_VMID;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	tag->smmu = smmu;
+
+	return __arm_smmu_domain_find_iotlb_tag(smmu_domain, tag);
+}
+
+/* Allocate a new IOTLB cache tag (users counter == 0) */
+static int arm_smmu_alloc_iotlb_tag(struct iommu_domain *domain,
+				    struct arm_smmu_device *smmu,
+				    struct arm_smmu_inv *tag)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain_devices(domain);
+	int ret;
+
+	/* Only allocate if there is no IOTLB cache tag to re-use */
+	ret = arm_smmu_find_iotlb_tag(domain, smmu, tag);
+	if (!ret || ret != -ENOENT)
+		return ret;
+
+	/* FIXME replace with an actual allocation from the bitmap */
+	if (tag->type == INV_TYPE_S1_ASID)
+		tag->id = smmu_domain->cd.asid;
+	else
+		tag->id = smmu_domain->s2_cfg.vmid;
+
+	return 0;
+}
+
 static struct arm_smmu_inv *
 arm_smmu_master_build_inv(struct arm_smmu_master *master,
 			  enum arm_smmu_inv_type type, u32 id, ioasid_t ssid,
@@ -3370,7 +3441,9 @@ static int arm_smmu_attach_prepare_invs(struct arm_smmu_attach_state *state,
 	struct arm_smmu_domain *new_smmu_domain =
 		to_smmu_domain_devices(new_domain);
 	struct arm_smmu_master *master = state->master;
+	struct arm_smmu_device *smmu = master->smmu;
 	ioasid_t ssid = state->ssid;
+	int ret;
 
 	/*
 	 * At this point a NULL domain indicates the domain doesn't use the
@@ -3384,6 +3457,11 @@ static int arm_smmu_attach_prepare_invs(struct arm_smmu_attach_state *state,
 		invst->old_invs = rcu_dereference_protected(
 			new_smmu_domain->invs,
 			lockdep_is_held(&arm_smmu_asid_lock));
+
+		ret = arm_smmu_alloc_iotlb_tag(new_domain, smmu, &invst->tag);
+		if (ret)
+			return ret;
+
 		build_invs = arm_smmu_master_build_invs(
 			master, state->ats_enabled, ssid, new_smmu_domain);
 		if (!build_invs)
@@ -3406,6 +3484,12 @@ static int arm_smmu_attach_prepare_invs(struct arm_smmu_attach_state *state,
 			invst->old_invs = rcu_dereference_protected(
 				old_smmu_domain->invs,
 				lockdep_is_held(&arm_smmu_asid_lock));
+
+		ret = arm_smmu_find_iotlb_tag(state->old_domain, smmu,
+					      &invst->tag);
+		if (WARN_ON(ret))
+			return ret;
+
 		/* For old_smmu_domain, new_invs points to master->build_invs */
 		invst->new_invs = arm_smmu_master_build_invs(
 			master, master->ats_enabled, ssid, old_smmu_domain);
-- 
2.43.0


