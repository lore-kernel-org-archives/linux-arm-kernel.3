Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F10E1091910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFuhl2EegGg5yjAPx1H0OgwnRycKU3uqmSaApOJZW9M=; b=A07uxBHE4MszZWASJByjCNGVqM
	NBW+UgzDUu9ujpIANkkStboMdg2/joI9yY0k9wtvws05stJnBnCQuPEw80krrthDsYmikliLzLqph
	Ibmtm7qCuLWOXCUvOn01EhnfwF20ex6Zi2eodg4E5R8T6ho62gOjo4NLtrv95jtgV4U9p22Lem9Qz
	tDIYubE6B7GLp0/9HcjuC0H+fOnPKQ+fLChw0JQYDdVb/g3F8CKhWkHvLVvwGYWFcHHHLdk0sQ41N
	E9TyzBnR1JJzH7PPc182DlasyMBtLKauw17ZCMQrGTOAw9bO2jQvMXkxt+SnhLr9RiQLlQvkb8Rdu
	1krKRs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQ4-0000000BTJk-3Il3;
	Thu, 19 Mar 2026 19:52:36 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQ1-0000000BTI9-0Cuz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:52:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iay/1RCDO8G/oW2VIOCU1IGi8EKiI28BetjTlEA1hJ+QZdhXuwWzfuLTmMSI9aad69pHKSRHjPSTIrRXmrUy4LQsIC9eZsik37qBwPdYqcEs8hCRsPbo959gPCVt5XQWZAfYauqJn7s2s26ScN8rO1CD7MQrbTmTuVIfycQ8XPM3n3yVMQxkV/xafH9v2vR4rD53lvyXZN+nVKQnzW6R8To9vtjXL8I9AusEj5wLaJexsWqN3jljofqU1TwSd2nxuY4lKj79+I+Kk6Rv1MuFw1wr8wvLigldvOsR7oNJPQXmeieTPLJu9AZCFhS2eNvZnf37jxpuEI5fKqJpCXvyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFuhl2EegGg5yjAPx1H0OgwnRycKU3uqmSaApOJZW9M=;
 b=MX8+w6ZT0bWi5jvB4yCRCNyUiBwVlkU/5yL5KPExWgScyVN+YW7fr3GvbMRCg97m+E8oY1pyOs1PqCT0AqysmF8PvNubv7PceFUyxHEY6B0SHS7JoAz53lWq3PgQAUuHQYDMwtLLQkgyPmYe9vzPFDlxh8bdIL2gwpgF/5UKkdu6dyHxCllEEOQBljJI/2sq9yeSYFMxpattg6C4/NykZmwH5/e2jMfa+W7WHAUc3IFW5N+If5yTjtUmUE0F2V/cmRJpwmQMTiDaIYhUPPeNTOWPWQjitUecy9Nf1iFV78UvPoBT3YtGKn+sDjP4v8QFc4ls7M+xM0SISxuer7xffA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFuhl2EegGg5yjAPx1H0OgwnRycKU3uqmSaApOJZW9M=;
 b=kZoM/8b6aGpsZwR6Oe+eaeC5n/ZIjXCGnAFZ/7gPKkPam6BqSxbhccH/BVbuKJ5Q9jNRb4worUzRCnLn58lQXaMgS9Y4rX6z78dBXdcOYWyouiJ1GgfwCGLUNeOde45d4hRAuBnMb42Xpvc8eYS0sfM4MtumzQcXDv1U+N2eB5HNmNJk02k2ZVj2zffaZac9n++U82sclLLy/ni/3F3PNotkA+Uy68inp/wAQNW4Ev17IkMwt7zyAD+NPa5shYIF1k3Scx8a0S2XvBO8LxN+KlDKcuaI/TVCkEUAI/6ksGbi7Hhk/vZp9uiIgWwQzMGvKP5ChWYHtpku/eG6XJCNMw==
Received: from SJ0PR05CA0207.namprd05.prod.outlook.com (2603:10b6:a03:330::32)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 19:52:23 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::e5) by SJ0PR05CA0207.outlook.office365.com
 (2603:10b6:a03:330::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 19:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 19:52:23 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:05 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:04 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 12:52:03 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jpb@kernel.org>,
	<praan@google.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<jonathan.cameron@huawei.com>
Subject: [PATCH v4 01/10] iommu/arm-smmu-v3: Add a wrapper for arm_smmu_make_sva_cd()
Date: Thu, 19 Mar 2026 12:51:47 -0700
Message-ID: <7889322d41b1d8fa83bb318df2bd705a6241f6b1.1773949042.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773949042.git.nicolinc@nvidia.com>
References: <cover.1773949042.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: a6935918-37f0-49d9-c8a9-08de85f109ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: W+T/daAbgq6pDDEMZF4c3I4iBWPx6lV9uibmkJS+BrNTZ1ieY0eIrVhwx3Zbv9oJD2COj87gUfkwW+X/oLWC+BZ6FJ/XTh75sqIEiGiAyStybJFS926EpigEKjSiqqzupaAQtOPbzlcrXyC8T+BvJavPgPfsLpttJCUO77z0+i3oqT3pr2ZYNsyFNIWqOBfQ9sK3UndLZe1V5bzQpSQiPiuFv8UsAIFKYkp+wizPTFl1HTgwZd1jaujR1lqxp764OgojjSq7ausR7TnvEqVvDDDvz27mTmauDsPoE2OPt8w1nLLtYLyBQ8sdjQQc1pydupG87J7camNVhCYeOk79web1f2YV2P7QP3nR2gvWrIszxURsX+mL4f1uANMFUxdYK63avc0892mVnNZMjbFbWiUetca7N0g8PZP7nj5kQmhs9Gqa7YPsdcXI7RNx526QOVRaw/7MHf6EnTSMXZq2MwIUW/3V9udPudVamrnrVHYWG2qgTEVcY/Vc+2bNiNF7Hb5qHpvo3UMDtuk4jrOpiGgQ1IyNIkktLU320MxOrqe6hmODE+Vv8L8goqx4PfpAKbKczrFkTcwZ6s8v+QZDJgxjdkBjU+ujFzgwo5fGQUjQ5CGfhzQmx79GgwrIBmD/T9mAl9m5YnYYLkVt5DUqbw5e3Cz9dJMitMXEw6htjem7yiFD4wAzKUdQFEEiJ6D0gXaFwmo/NUqA8IxmC1JKTL3mZreJAnxg6ebyRPTVRp3scbrkicVTqgDZ/uCYBvIreSIH5jUr/lS4tAMTIoSzAA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YmY0poHvKPkxKSgF+Wy3iMTtuj2al3QpMb4xLFiX5LG8abiQay3GcBSwT6yKWC0Ol4CnTBLM2flRohQNd7iQUEO90YzcUlwiGmmk1sDVgBEUFuzeEOJ/JffuVieO1+ySlwQ0W5sHD2aVEiz1D9MOH0LeZGc8wGZS3XH5DJTFrqWP/3BXyCIxWH1PeZd5kBYf7i1pWdpTS6SaUIJltDpTCUjZqcR/J62EO8k3oEuJS07GmWc8GQphtDT0rFogrKYlb9EoHywwVRPwkfrA/SLK69QtLoystTJyzsg4FUB2WDZcJBBW6akb3vU8nlriBPuluLsgUa0dnz3HXXKTVAd2EmGCBIf4tkUifnhvOZpnv02bymvB/CG9SCY74fS4B2igVTgv+5VAdwJGdEGK1En1C4su3TPVe8UEaSos8LYx2LNwXG33mx3IKBwBNqOerviE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 19:52:23.2157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6935918-37f0-49d9-c8a9-08de85f109ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_125233_437909_E356A2FF 
X-CRM114-Status: GOOD (  11.12  )
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

Rename the existing arm_smmu_make_sva_cd() to __arm_smmu_make_sva_cd().

Add a higher-level wrapper arm_smmu_make_s1_cd() receiving smmu_domain
and master pointers, aligning with arm_smmu_make_s1_cd(). Then, the two
function can share a common typedef function pointer.

No functional changes.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  6 ++---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 22 +++++++++++++------
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  4 ++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 36de2b0b2ebe6..dd5d2b5acf664 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1019,9 +1019,9 @@ void arm_smmu_make_bypass_ste(struct arm_smmu_device *smmu,
 void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 			       struct arm_smmu_master *master, bool ats_enabled,
 			       unsigned int s1dss);
-void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
-			  struct arm_smmu_master *master, struct mm_struct *mm,
-			  u16 asid);
+void __arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
+			    struct arm_smmu_master *master,
+			    struct mm_struct *mm, u16 asid);
 
 struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
 					  struct arm_smmu_invs *to_merge);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index f1f8e01a7e914..414fc899140f7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -48,9 +48,9 @@ static u64 page_size_to_cd(void)
 }
 
 VISIBLE_IF_KUNIT
-void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
-			  struct arm_smmu_master *master, struct mm_struct *mm,
-			  u16 asid)
+void __arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
+			    struct arm_smmu_master *master,
+			    struct mm_struct *mm, u16 asid)
 {
 	u64 par;
 
@@ -120,7 +120,15 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
 	if (system_supports_poe() || system_supports_gcs())
 		dev_warn_once(master->smmu->dev, "SVA devices ignore permission overlays and GCS\n");
 }
-EXPORT_SYMBOL_IF_KUNIT(arm_smmu_make_sva_cd);
+EXPORT_SYMBOL_IF_KUNIT(__arm_smmu_make_sva_cd);
+
+static void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
+				 struct arm_smmu_master *master,
+				 struct arm_smmu_domain *smmu_domain)
+{
+	__arm_smmu_make_sva_cd(target, master, smmu_domain->domain.mm,
+			       smmu_domain->cd.asid);
+}
 
 static void arm_smmu_mm_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
 						struct mm_struct *mm,
@@ -162,8 +170,8 @@ static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 		cdptr = arm_smmu_get_cd_ptr(master, master_domain->ssid);
 		if (WARN_ON(!cdptr))
 			continue;
-		arm_smmu_make_sva_cd(&target, master, NULL,
-				     smmu_domain->cd.asid);
+		__arm_smmu_make_sva_cd(&target, master, NULL,
+				       smmu_domain->cd.asid);
 		arm_smmu_write_cd_entry(master, master_domain->ssid, cdptr,
 					&target);
 	}
@@ -265,7 +273,7 @@ static int arm_smmu_sva_set_dev_pasid(struct iommu_domain *domain,
 	 * This does not need the arm_smmu_asid_lock because SVA domains never
 	 * get reassigned
 	 */
-	arm_smmu_make_sva_cd(&target, master, domain->mm, smmu_domain->cd.asid);
+	arm_smmu_make_sva_cd(&target, master, smmu_domain);
 	ret = arm_smmu_set_pasid(master, smmu_domain, id, &target, old);
 
 	mmput(domain->mm);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c828..546138f1efb1b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -546,7 +546,7 @@ static void arm_smmu_test_make_sva_cd(struct arm_smmu_cd *cd, unsigned int asid)
 		.smmu = &smmu,
 	};
 
-	arm_smmu_make_sva_cd(cd, &master, &sva_mm, asid);
+	__arm_smmu_make_sva_cd(cd, &master, &sva_mm, asid);
 }
 
 static void arm_smmu_test_make_sva_release_cd(struct arm_smmu_cd *cd,
@@ -556,7 +556,7 @@ static void arm_smmu_test_make_sva_release_cd(struct arm_smmu_cd *cd,
 		.smmu = &smmu,
 	};
 
-	arm_smmu_make_sva_cd(cd, &master, NULL, asid);
+	__arm_smmu_make_sva_cd(cd, &master, NULL, asid);
 }
 
 static void arm_smmu_v3_write_ste_test_s1_to_s2_stall(struct kunit *test)
-- 
2.43.0


