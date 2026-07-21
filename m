Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3337C44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic2DhKJuGcm0UPf8zApGgBw0OXgJPIeIu+S1+GgaEm0=; b=dQ3PCcUnfS5XreJs8v9VI1qj+7
	YBN75HEMaxFQQ9/eRbeMbos+qFbUyXpCXtTgTV3BLW2VAj3+2nikJOdUoVvfiigS8Bndx++OrX5kw
	4fhp10NFbvmue69NnUkfjuDgS/Q9SF7dX+cbbbLWJIBJ1eK7CUONSo6cOoqkyMSs6HnXpOD3IwEED
	P8I3h+LpGqp4o12mSzJGWF/GwAoVQgPU5y2XWjiLDr5oqU2slqGuPiKpQyCSugijU+3isGN6HqLX+
	9rkust8c9tc9sPweP8ipWOBIwQE6RB/Chn/6tGKKNxACwaeeA0gBjKTLpVIxKuVmnBNpxS+jahTJS
	oFPMq1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGTJ-0000000AJrz-26Yu;
	Tue, 21 Jul 2026 19:49:45 +0000
Received: from mail-eastusazon11011046.outbound.protection.outlook.com ([52.101.52.46] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGSo-0000000AJVE-3pn0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWwBCGTC/+zjOpwZLSjjgC2n8ksqRm4pLxYIqkAtS0ss3QQ72REoigCEMuo9MtqTAeFk5gqNC9pApYQ1RwdPY4xEq/Ia9CUeypWHmd6JwvrXYnhkqThdQpSOUGTJZZi3cg/r7/7KqdxQqUtTaWxIzbENX7yqZfr7oqgNTcTc0DnjZWDmCTIyLWt1MARrYOLN56QrXzwCs5j1qAEsPXguCImxeyPC85NxB/QDrouCcYgsL0ybN2CN+w5QQgi/RrS/+ZrHhOAFGUXCAE/mhk13Bv+wkPLZQf9AccSzRNF8bObs6SuCzbgk/kPw5pTefg4enkS17hfrIEfvg1ERhUdWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic2DhKJuGcm0UPf8zApGgBw0OXgJPIeIu+S1+GgaEm0=;
 b=vUagIBo6ygKCEkNqzDUSyhIPTFMRcl+/O6sOf8g1Ieq5jzL/LpaPpilBeFUcZ4IpBkan6HmXXrs6rt9LHX6dRpmQWWo2mwc7P/XYLcbmdN4ujnv7YNKJNU0o58s1SZtlLhQmtEJ2EQvpur1Xv71X6N3PIkSefJ4VtYARd6i3gIJ1f6CwmEYAZWH2VVyRJKVc1dSuN8+J/siKhK7U+kxZCT7YISeau34GEn72b3+O9haExQkuEeq8rjGgy3+D9RjgAlEqa9x3C4NTmv36X01j8G5fQnSxKWzK7X86RIv+B99bXPpKIJ6RFJfw9llgNhijin49w8sNW5irOyb15MEbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ic2DhKJuGcm0UPf8zApGgBw0OXgJPIeIu+S1+GgaEm0=;
 b=SIanxxfwLWFVWdgEMSXKKoKUvYMzmeM/r3B0TyjmtF9y7Nw6LIAIdfO/wJTWOuyq/RFD0Mi1gmGanUwC/pwJViXnNUeoalFApcjymDAZiJGSjbBGOQ7kP/vVkUBzytWpHMKcNyNJf7oIGDqPHN0NBIHrrcgU2s3ZkJLmkKgB7WdweL4nP/WO8f++1cfst9V8q2kaF0YjZM1x7fxD5YD3ZSMlnaqxT0v+Bs1qFbjtoR7PdzC64M3aKqImldk7YoJl6dclfb6pYPp4OXFOMI65LHU6/e/UTaUTW48zP97W/1j9NsvQH3YmXYnis3s/Zn5+qkw/t6j34ppzQ21ImNPP7w==
Received: from DM6PR01CA0020.prod.exchangelabs.com (2603:10b6:5:296::25) by
 CHAPR12MB999223.namprd12.prod.outlook.com (2603:10b6:610:301::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 19:49:06 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:296:cafe::37) by DM6PR01CA0020.outlook.office365.com
 (2603:10b6:5:296::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 19:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Tue, 21 Jul 2026 19:49:06 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Jul
 2026 12:48:44 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Jul
 2026 12:48:43 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Jul 2026 12:48:43 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH v9 09/12] iommu/arm-smmu-v3-kdump: Implement is_attach_deferred()
Date: Tue, 21 Jul 2026 12:48:18 -0700
Message-ID: <eb795edf2598c6df57122cd5951393ac1a860bcd.1784663184.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784663183.git.nicolinc@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CHAPR12MB999223:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afd3d34-86af-41cc-27d6-08dee7611fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: aeJVWDEHQe/Ue6DrXj/V5NiK4SIFl9p5t5BDm+gpTLjtRnNyIRdgw9KKvG3wcAwz5gkgMuX1uZosgkG3Y+kSEbEyl9vFSlggeuDVv56ebn8RBDF5r3+4mn5lX9jgRUQD+cX6oOfUk16fSsDZuT/j6I0Wehn1GVC5HFNWbbt1sbXdnT8lb89d8WV4o7VJW7cm+YfOfkJrYrOokGdXElzMrVP/oHnEcjtRDkL57YE3IaBDQQXEbasUiCH3BHiJ4P3AkWiDC0DH3Ts9PiN/VChIBFMbyg8XChjUm11IB9nu2sJ3HHhaB97EXJGV9Q/6fU3W6rn9n3B4CcbQYS6dVW+tjS9QSz+xnOJXbDAWtP1jAUPIEuuuLvT3nncMRhMNHNwt8AgmL7xgWnGSoYbaG/jTzsKgHjPW0hMAmN9qzF3khBnE2/7QCoUddzP1Xp/JmFyuPG3GHKeSg7n1wXntv3S3bHUflltRdULMOXeB3S742UTTSpo8pAkRyXLB0YHKJr+RtqFS3sAEtnwuQYD6d1JEsyMDOP5Y07Ehr4hs2mPbH45UH1yrsWsX96Gq6w5irq/nmHFYXDaXtakgY8bY9fRf1BUrlgJpdujwgz/J76Joqg7gmUKWjF8SmrY2qdqsXiuZ9LwR6dTVVL8jwNg7cx4eau8XImUflQHWvqCj4xS4AFi68SJ6FSAcZBBlMA4n48G0gznrm+yJfBqpYpGr/9ZQpw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zEj+OyIWc/h0vJ44vd9HxFPnj1ZQ514AYJA1SuPMNjwPVUz2ejm9l+L8XRCh0r+DYs+psT9TrYL0ZI7u6fvMgHRvdVtau5WxW5E8Boq473uA/ZkejqJDgDcy0osl3FVakfXQ2k54ZacZ2xqRgTgAiPxycgLUs9JLVgKFbWcipsWtHZ5svBhxC+deLHXpwibVe6nJ3n+d5oHApPlZlVQf2tsxtVzCcyoz2K2VLF5FtGAp2ZpZtFk0CPUMpwct3j30NyW6lCGMaaeXVSX7oV/hRChz+5eXVF5v4xqZP+791odA5RktsHtO+NxN3AkVOcKXC7f0CK6BGyEiSDnYp3IE68VQmsowzMWlwjAVgmFgyrVI4Q6pPTOdB7Y4nPYdR5m/oQEgBsiJPHbA8ZkEDu5IaEQr3MBzjhWxmsQzBjqoDihCg2WzNnwu4j98H5BYOIKj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 19:49:06.0044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afd3d34-86af-41cc-27d6-08dee7611fa1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR12MB999223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_124914_956957_773A7A1C 
X-CRM114-Status: GOOD (  18.31  )
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

Though the kdump kernel adopts the crashed kernel's stream table, the iommu
core will still try to attach each probed device to a default domain, which
overwrites the adopted STE and breaks in-flight DMA from that device.

Implement an is_attach_deferred() callback to prevent this. For each device
that has STE.V=1 and STE.Cfg!=Abort in the adopted table, defer the default
domain attachment, until the device driver explicitly requests it.

Also, move arm_smmu_get_step_for_sid() to the header for the kdump function
to use.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 22 ++++++++++++++++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c | 19 ++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 25 ++++++++-----------
 3 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 5c03de5aed27b..0bc1de6463785 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1208,6 +1208,21 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state);
 void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master,
 				  const struct arm_smmu_ste *target);
 
+static inline struct arm_smmu_ste *
+arm_smmu_get_step_for_sid(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		/* Two-level walk */
+		return &cfg->l2.l2ptrs[arm_smmu_strtab_l1_idx(sid)]
+				->stes[arm_smmu_strtab_l2_idx(sid)];
+	} else {
+		/* Simple linear lookup */
+		return &cfg->linear.table[sid];
+	}
+}
+
 int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				struct arm_smmu_cmdq *cmdq,
 				struct arm_smmu_cmd *cmds, int n,
@@ -1263,6 +1278,7 @@ int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu);
 int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
 					    u32 sid, phys_addr_t base, u32 span,
 					    struct arm_smmu_strtab_l2 **l2table);
+bool arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master);
 #else /* CONFIG_CRASH_DUMP */
 static inline int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
 {
@@ -1276,6 +1292,12 @@ arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline bool
+arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
+{
+	return false;
+}
 #endif /* CONFIG_CRASH_DUMP */
 
 struct arm_vsmmu {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c
index 3e0d544c6bc53..ea7a2bdd77a58 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c
@@ -240,3 +240,22 @@ int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
 	smmu->options &= ~ARM_SMMU_OPT_KDUMP_ADOPT;
 	return ret;
 }
+
+bool arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
+{
+	struct arm_smmu_device *smmu = master->smmu;
+	int i;
+
+	for (i = 0; i < master->num_streams; i++) {
+		struct arm_smmu_ste *ste =
+			arm_smmu_get_step_for_sid(smmu, master->streams[i].id);
+		u64 ent0 = le64_to_cpu(ste->data[0]);
+
+		/* Defer only when there might be in-flight DMAs */
+		if ((ent0 & STRTAB_STE_0_V) &&
+		    FIELD_GET(STRTAB_STE_0_CFG, ent0) != STRTAB_STE_0_CFG_ABORT)
+			return true;
+	}
+
+	return false;
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 9d9fd11d26efa..fdfb69d2e51ac 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2898,21 +2898,6 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 	return 0;
 }
 
-static struct arm_smmu_ste *
-arm_smmu_get_step_for_sid(struct arm_smmu_device *smmu, u32 sid)
-{
-	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-
-	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-		/* Two-level walk */
-		return &cfg->l2.l2ptrs[arm_smmu_strtab_l1_idx(sid)]
-				->stes[arm_smmu_strtab_l2_idx(sid)];
-	} else {
-		/* Simple linear lookup */
-		return &cfg->linear.table[sid];
-	}
-}
-
 void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master,
 				  const struct arm_smmu_ste *target)
 {
@@ -4318,6 +4303,15 @@ static int arm_smmu_def_domain_type(struct device *dev)
 	return 0;
 }
 
+static bool arm_smmu_is_attach_deferred(struct device *dev)
+{
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+
+	if (master->smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT)
+		return arm_smmu_kdump_is_attach_deferred(master);
+	return false;
+}
+
 static const struct iommu_ops arm_smmu_ops = {
 	.identity_domain	= &arm_smmu_identity_domain,
 	.blocked_domain		= &arm_smmu_blocked_domain,
@@ -4326,6 +4320,7 @@ static const struct iommu_ops arm_smmu_ops = {
 	.hw_info		= arm_smmu_hw_info,
 	.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
 	.domain_alloc_paging_flags = arm_smmu_domain_alloc_paging_flags,
+	.is_attach_deferred	= arm_smmu_is_attach_deferred,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
-- 
2.43.0


