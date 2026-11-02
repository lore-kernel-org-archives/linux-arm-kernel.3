Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9C60A2609
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vN8c08nO;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FUFoqBx6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m1a9Z6vYZT9z/GfHStqVqyiC9Qq5U2tlJuw33tGl8gU=; b=vN8c08nObRL12KggB5dd8EwBXA
	Scmtw6iLa1gsw3pmqNTR7m8Jt/49+pbS3kM3ssaq7KKM2up+Kt4wzzX9gynqi1WMlV9YfKoT8dMF7
	WXnZm0eKmgTsWPvt+N6VD2cXdQl2YWwwu9OPuv59NeBBU2LRS3W9Q61FcRh+ogSsMzBPLQpE1Oy9R
	eMqBj7B5b5SiQZ3cZbILJw44V/SwkV6qxsR21JihxvlVJHhQ6wiq4CWWMqeQfOpwE/QplgVqrvxdd
	UXkSyFcP63qBq/NkUSpCKqRdHI3P3GkaPh4q71hSH3tO3te/kJ7AhNIuAYF13nTIkd/ktB7ClCuyr
	jxhLGaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSZ-0000000FYdu-0r35;
	Mon, 02 Nov 2026 05:19:55 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSW-0000000FYbb-1UV0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euWqkyt8HerwdvajazfxxPn3XnTm8Jnd7DTKcGfpRjHF/NeWbA6eq212UT1YdlsgoruP7JxzXyxVIpH52shY/k1K32VxomIGCj0cxsM9hi+d8JYpKAftpD50Mt5lIj1E9n5+KdlqngBa1cGiVC27FOMJ0Jvrt+HKToIzgy8rEJFJUgh2LxYEyqAra3F2ZqWTccpJq68eOVVDiOqr8vU8/4WwY2A122NA1JyDVyN+wDqnFiZSw6BMvavuQxOQKMtyViksZPowtg32NnYpMr/OYZZHCJdV6pQXBC1Pt8Axn8PHp7/UWgCzVkzPLqxL+MgKBQpSCS1r+RUPx3TLcK+3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1a9Z6vYZT9z/GfHStqVqyiC9Qq5U2tlJuw33tGl8gU=;
 b=Zig7IPI1I79zNcR9xwX8W1qQCoJinIH/qPzEXZ0HrE88o0Tu3ETBdLepkxXd3yfwWiSE4uyij0wqV1HHEqfPucoOdeAdJxqm+ClepQsvGB1N63KKjryyk/CzyKYb4lBohY4qfTicqM98Mpnxnv4wkQ9sBgEwtij4+EpLV0mdgKMwo7YIa8330b/xdvVDzZVBOel8u6kShJMI1uLcCsDIFB1pUp5tIDXbW7CxYprNBrHrDmxNgORyBytOS4a2tOkkVVjlRLhHSlLH1OEg0GSPF9lrX/ACabqLuxQY3ltTkrOq5U4VUF13UxLVL8W6OQPq9K1VGu9sbNqbwbM0T2yaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1a9Z6vYZT9z/GfHStqVqyiC9Qq5U2tlJuw33tGl8gU=;
 b=FUFoqBx615g1NkYQPDGOrGylHClJy3/QyCO80RyTh1tTFvf9lcvH8R5PPpTuYcCjEugU5o4MDofjIPEXAZKTL1WmgfdwTzY0SVeYyhfYB7L9Hu/vi7oGJ4KwyN8PQ+EV7Cz2XSLWivoBYksjhZEHbokjPOCT4Ng7ZA67bNWXOy0q/V8lh/nWL2vS9thGXU/WOZzbXRRM/9XnEFRlE7s3S3TlzlWlE3zWTS1fmE+6aaaOUlXQjwkBiqTWqB4G7eeODO9nZFPaS15ZkmnaJT8qmmfaTZXOqMFsxsV0bys7P3dC9LoU/aZcn+5c/tRiid8qM9XbL+gyC0P5IAW8ZUu4ZQ==
Received: from MW4PR04CA0121.namprd04.prod.outlook.com (2603:10b6:303:84::6)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:19:44 +0000
Received: from BY1PEPF00026964.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::a2) by MW4PR04CA0121.outlook.office365.com
 (2603:10b6:303:84::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 05:19:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF00026964.mail.protection.outlook.com (10.167.244.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 05:19:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:32 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:32 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Sun, 1 Nov 2026 21:19:30 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v12 03/12] iommu/arm-smmu-v3: Make the ASID space per SMMU instance
Date: Sun, 1 Nov 2026 21:19:11 -0800
Message-ID: <9295479f55d247961b25d913b6f4de1d7a72e0ad.1793593923.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793593923.git.nicolinc@nvidia.com>
References: <cover.1793593923.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026964:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: a117f52e-6601-497e-3aeb-08df38a0e79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|11063799006|5023799004|56012099006|261009223027099003|261009221227099003|261028144727099003|261021121427099003|261021123027099003|261021135927099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3J+JZUbRZnKjQNMsd34klmalzKXoszVvm5ED5lWD37Ir+IWS3cJ8uRWsUWUmtabKqnnJ3ukuwhagB41ZQirFsrMaAMqwBg6ALBSBuKpSBfMwRkN1YWEoXc0Se0nFYt2h8nQ094lNty3ze/DrWhHrimSjliEwYBuX+A7xMrRf8Yk1oLhxb6/CMWJCaIbBaFnslhQc3JUc/WtlRztDCgrU8wAvYfMO0J/lLBADDbY5oXvw1kkTrTDpNpHJOYccCE53pRPKuYeTyvFlHF0rIdOnSyhPt7tYf1BEWTEr+mCf1RVJRV62y5vMWpZ7ckX0AvS5HD0RIjQc2mfoH3Il6SnCYogdDj7FY5r/Ug+rAe22gVTBTb1t8U9f4VfmS8/Z8Hmc53IGI/iCB3981DHv4+Y56lVwCbiqCTcAIrLC/Fepn1ugax+iclGZLi6KD+lBKBAbXRrHFXbCXFMVhWgA1pLTi41yedQOwKSp4Xkm+kQt2kOo1aw74fOGhkEAEzCon37M/8N7Na006Pk72Pj4OHXo56huOH0FfqwuO8mYvDhGXeBY4NEX3qIoWiyNiMNv0qkb7q4UXIL8d+MvZ3KuH6PpFb7S+AhJbEST9VY7coqLSZlSQXlUuNzGEHRarWVA+/lQjrWTM8eXtyzulBcjM/XjTz7zdPEI5Tm2hrsNJMa4QEGz/ojexpRBYLmDyPg670WIDqEDwsL4xQciaCy6QCSLJw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(5023799004)(56012099006)(261009223027099003)(261009221227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hrjpgzDjGBeXh8ZJEJ0TgGJV4AzPTxikpT1zRD3dSJI6x0iuPOWwBLGhKNjlQb7zwk7cr/EwuwNphGKm9Kg9Eo8fcfrgv9aKESk2K7Kw4jUnjbXjtfvvhoDoHxH14k/o/6iBGiq3iLlcn6XHuBVwfgA+iPcdoy9PDAdlEqjJ3Oe3+yAjoi5jFMAZwXCQG/2ghEqPrlLjn4uIyqHQSzfICOjW5RTxhaGZapVbi/JRfIB86mFU2EKWVkxGMC/BLUHYC1hKhBcff6GqPfbhru7HYUDxtdA1P5gXJw3/xfYYfZC4bhpM/kgUJ57h98uMezmdEfm0/w/K6xNQlIzRe6CmIn3bIWVD5sVV909Uvxf5MdLI/l8L/IYrn1SOX+2wkJRRhXiSwSD/aTNXTSQcgUZ1xnEwL6lu36ks10MBNInZdfEb3/fZfqkc1BVK6JiyUwVy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:19:44.1327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a117f52e-6601-497e-3aeb-08df38a0e79c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026964.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_211952_422889_FFFC43A0 
X-CRM114-Status: GOOD (  16.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An ASID tags the TLB entries within one SMMU, so two instances can use the
same ASID without ever aliasing each other. Yet the driver allocates them
out of a single global xarray, which makes the instances share a space that
the hardware keeps apart, and lets one instance exhaust the IDs of another.

That global space is a leftover from the BTM support that shared ASIDs with
the CPU. Now ARM_SMMU_FEAT_BTM is never set, nothing looks a domain up by
its ASID, and a domain is pinned to one SMMU at the attach.

Give each SMMU its own asid_map, mirroring the per-SMMU vmid_map, and clean
it up with devres, so that both of the ID maps get the same lifetime as the
SMMU device structure that holds them. An upcoming change will need this,
to reserve the crashed kernel's in-use ASIDs in the new map during a kdump
kernel's stream table adoption.

This also eases the BTM work that Jason's working on:
https://lore.kernel.org/linux-iommu/20261004162219.GA4064@nvidia.com/

Note that arm_smmu_asid_lock stays global, as it serializes the STE and CD
updates against any ASID change rather than guarding the map itself, which
does its own locking. Giving each SMMU its own lock looks possible now, but
that would touch every attach path and belongs to a separate change.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h    |  2 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c    |  6 +++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c    | 18 +++++++++++++++---
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index bb048e08d613d..8f2c0b1cc4a8d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1003,6 +1003,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_MAX_VMIDS		(1 << 16)
 	unsigned int			vmid_bits;
 	struct ida			vmid_map;
+	struct xarray			asid_map;
 
 	unsigned int			ssid_bits;
 	unsigned int			sid_bits;
@@ -1180,7 +1181,6 @@ to_smmu_nested_domain(struct iommu_domain *dom)
 	return container_of(dom, struct arm_smmu_nested_domain, domain);
 }
 
-extern struct xarray arm_smmu_asid_xa;
 extern struct mutex arm_smmu_asid_lock;
 
 struct arm_smmu_domain *arm_smmu_domain_alloc(void);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index faeec656da9e7..489531e0027bd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -311,7 +311,7 @@ static void arm_smmu_sva_domain_free(struct iommu_domain *domain)
 	 * reused, and if there is a race then it just suffers harmless
 	 * unnecessary invalidation.
 	 */
-	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
+	xa_erase(&smmu_domain->smmu->asid_map, smmu_domain->cd.asid);
 
 	/*
 	 * Actual free is defered to the SRCU callback
@@ -352,7 +352,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
 	smmu_domain->smmu = smmu;
 
-	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
+	ret = xa_alloc(&smmu->asid_map, &asid, smmu_domain,
 		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
 	if (ret)
 		goto err_free;
@@ -366,7 +366,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	return &smmu_domain->domain;
 
 err_asid:
-	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
+	xa_erase(&smmu_domain->smmu->asid_map, smmu_domain->cd.asid);
 err_free:
 	arm_smmu_domain_free(smmu_domain);
 	return ERR_PTR(ret);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5cabbe5652dc6..cb45bd154c9e5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -90,7 +90,6 @@ struct arm_smmu_option_prop {
 	const char *prop;
 };
 
-DEFINE_XARRAY_ALLOC1(arm_smmu_asid_xa);
 DEFINE_MUTEX(arm_smmu_asid_lock);
 
 static struct arm_smmu_option_prop arm_smmu_options[] = {
@@ -3015,7 +3014,7 @@ static void arm_smmu_domain_free_paging(struct iommu_domain *domain)
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		/* Prevent SVA from touching the CD while we're freeing it */
 		mutex_lock(&arm_smmu_asid_lock);
-		xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
+		xa_erase(&smmu->asid_map, smmu_domain->cd.asid);
 		mutex_unlock(&arm_smmu_asid_lock);
 	} else {
 		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
@@ -3035,7 +3034,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_device *smmu,
 
 	/* Prevent SVA from modifying the ASID until it is written to the CD */
 	mutex_lock(&arm_smmu_asid_lock);
-	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
+	ret = xa_alloc(&smmu->asid_map, &asid, smmu_domain,
 		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
 	cd->asid	= (u16)asid;
 	mutex_unlock(&arm_smmu_asid_lock);
@@ -4741,6 +4740,13 @@ static void arm_smmu_destroy_vmid_map(void *data)
 	ida_destroy(ida);
 }
 
+static void arm_smmu_destroy_asid_map(void *data)
+{
+	struct xarray *xa = data;
+
+	xa_destroy(xa);
+}
+
 static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 {
 	int ret;
@@ -4848,6 +4854,12 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 	if (ret)
 		return ret;
 
+	xa_init_flags(&smmu->asid_map, XA_FLAGS_ALLOC1);
+	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_asid_map,
+				       &smmu->asid_map);
+	if (ret)
+		return ret;
+
 	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
 		ret = arm_smmu_init_strtab_2lvl(smmu);
 	else
-- 
2.43.0


