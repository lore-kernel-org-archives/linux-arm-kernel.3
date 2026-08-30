Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B57AC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 23:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Fkep9t6+jCMzd5o9pZoJwfHDXWh3zUfkZ22r+Nftes=; b=BzIgsbAbR885VKlc54IvySFck9
	gCaKzWeH2Kn7XJ8Cqoq+xhxBmREjy0Lp74/vgPcgs2CfopFQaMDZhmN+R13y5v05V8JCbXE6TkFiG
	A5npnu5A7fFu3fs8q1d1Gk/LJxhUNzZ126bg9gYWGh8BhWjNhwNUpf7kaOgTYOa7KpWI2HAf6/Kyu
	+f3FhZXmVFjtCBpyU2WPtEcwLXD9WsCBUkpfk0ySzToxSxz1Ceylt9NpEACqZL2o6Fb7xiZOLG6cc
	qLMq4svuZU2jjIcJpu9+c7r9wSNLp9cUhC9695AdNApYELumKleUDk2iuJMlqJXbEkNOi0vpBKxHA
	2UdtX/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0onp-00000008Dr0-1sZq;
	Sun, 30 Aug 2026 23:19:05 +0000
Received: from mail-northcentralusazon11012021.outbound.protection.outlook.com ([40.107.200.21] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0onf-00000008Dj0-2sTL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 23:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULotJUvxCBQkAb7/5UuHpfePBSxkKsa+yYcs74QekhXSlzWToXMCtTN0Mtme5kCZIltjbwT/UVz03By4jGt7czgnxurGS5mrHeO5vtw0/iyJ3AuEo02WX4qA7aPBQzMVUPOOzJlVUU4tTKZwvNSeyt7n4aUzB1OU/aUmuoz7Xj6orzaTEU3AjFVSi6TiIkaHBkAVU8Nl2EMW7Leu85YRjNB0omlGWBtfzFO5HbynC9YNdMHcW6lCxoM0+xcooe2puKz8OXZV85K3qkhJjCGrO0AvcE1jcs1TQTOy3QgsmvdYfl2tn+Z88ZFkz5h9ezSAJhvdYS6gARfkDx6xnk0U4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Fkep9t6+jCMzd5o9pZoJwfHDXWh3zUfkZ22r+Nftes=;
 b=bEuzqwWEsXfM5fSOQxFpU3j0I5H+CTN6e+MHSRwmvt7LzFw1x9mFhbXj4riF6zxi2RyKj2FXWGewU9IJvJa4bBlkZY08asY4WneoEKUB2WTIInSDZxVb6bXoQ3Jr4kEDvf84GOIEdhNJvPJfK7CvOIy+4c3q7I9rEvZB2kUXdWGPA3vHa5+AUAefqQOel+VQUhOIOumCVFO/oVZd3nlg4fmjFnCBJFvzwElwY6cEWxMrY8IPcFNcDANStsBl4tAgyk6cJQSEWxJWR0mns0CPMx8KRIHbQCvKSusyxBEnaNkTO3Mp8hHf4qpKf0bq8xiLmnZNjKzscR7b0Jqee66sqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Fkep9t6+jCMzd5o9pZoJwfHDXWh3zUfkZ22r+Nftes=;
 b=GYtO2F9owCbHwffhHzm0OaglciERaBFxT6NGpYvg8jV0fPUsf7FdYS3dQAuWZDMCbyMtq/kV5jXFA7QEek9+4F3Ri6EZTpouTxG+WeJjA1r3ogQGAClyR5zuACJGEXlrHFNwJwtOYSjxve0KhiUhRQpFYZRDXObIAS35PCMeGYYM5+wODQb/qn7J94XwCJ7Uf3OgzKYm8Cc5VBMnPKFRqm6OxNKfO1pz9s+MOf/nFICkyGAEpWKNHj6SReYbkgbJIOougKcqgxABiqSUi8K25GUzmLiVPtgp71lUgU1rl7xtRoQ0MZBdxPWLb4yYCrQeLn6tOJhv7AMkLqsKfAGo1Q==
Received: from BN0PR04CA0051.namprd04.prod.outlook.com (2603:10b6:408:e8::26)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 23:18:48 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::54) by BN0PR04CA0051.outlook.office365.com
 (2603:10b6:408:e8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 23:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 23:18:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 16:18:41 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 16:18:41 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 30 Aug 2026 16:18:40 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>,
	<kas@kernel.org>
Subject: [PATCH v10 11/13] iommu/arm-smmu-v3: Retain CR0_SMMUEN during kdump device reset
Date: Sun, 30 Aug 2026 16:18:12 -0700
Message-ID: <8280230c0906b4c62635c5eb2760bd0e25bbd1d1.1788130528.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788130528.git.nicolinc@nvidia.com>
References: <cover.1788130528.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: d290b097-660a-4a31-050b-08df06ed0b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|7416014|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bkR5qa2AVcQ6uAHWRoJz+y4myB9xgNHToxRVOp7VoRMwidbj1u3JTNjQPTcqXBSSe7/vCas67+2bm6qO2Kq03tT0T+dGUeEe+djapnHByeeuzJkoqqVUD/T3Ua6TPJnahX0snCtJEXlNOCR+ZXhfK0kNKCWICuF9CaSX4sWl4as5+Lw5sqikY3u8n+x/0eDbiJiXogTI0yvnZNwQfLNl33uMU8yPZYE6BRtKbmmJEKDlPF0Oe1p6WBf39Gu07U5tF0rJBKcB5Mj5YJcXbIvxaCGvPXGpgVrYvZTium+hdXvC+iac/QDLXQ/mt5+2+tieJlhdspt23+iNFG8yd+USW1PlXqEUrN9Rt26KsH/vsM6CinHjys+YCnOVL0bytTnePKpAoCyRM4z3Vl8avvskYMv6VVKTJvR6ufu1VHhmoEpxxz6XXkw0TaA6+s5D5ZqYm+5X4nLcp/aXcIl0LJoQV+YhUompBV7RXTOTbdkTqdIxIiHik91swfh0IgLiaDqHck3ntKEvSotU4VEMLBpP9VWi1Adq45Z4QwN+6Ad7M1K9/JDxAyD/SC5pVfUyX+lHzITzfLeC0vJEWqZX99QKeoVld2O49EqeuJ346kF2qr7o2foo3mlD6H/EPV8IveIS58Z7vrxyFz+q72epPmsEBJClpd7RDFUuxu6S2k6dHV46YKcxK2/V56AqRHjtxNmt8FjWPQ/jw0jNgoWVuDrOiQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(7416014)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v7JbT+R1Aufrfc8dRaHVrkfdwFQfP3ggXflRJF/R4uREDe8JWwIkaRAT3+fXzparDZyv5h5xNLt/mI7SIxId6a9SUTvh72fmVRyrTQnEykaxwXTTLsX4bHMgf9M1LdlsZNbzeAXP/2X/Acv9ofjtqHmzd1nSEe5JjI0zjPj9kclBuQEn+KbPdgGep8gC3lpXKqYgVs1IqMo3tyROduA8YxL+W+ce7+tr1Syj3sitjCqCJ7QkrE5XANi2Pmj+7Ighhb5TKc1ubJF4Gzxv3AhPlxnk9zl+JKSqs7i0PdHTlwzQT7E4enqEzmrMQ4pJ+eGhfbxIcMIf3HNv//pUgwbL7QXsbxN2V1NzRA0o1MfI+WpaV7FaVvDz8AF9htfa1Ij0Tai5s37Jy+380HxYJmu55qWK4ZiAcxn8XW7lIdyVjBIGFy+ML/uErQucxydGqUoE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 23:18:47.9421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d290b097-660a-4a31-050b-08df06ed0b96
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_161855_746890_872E4DCD 
X-CRM114-Status: GOOD (  18.56  )
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

When ARM_SMMU_OPT_KDUMP_ADOPT is detected, do not disable SMMUEN and skip
the CR1/CR2/STRTAB_BASE update sequence in arm_smmu_device_reset(). Those
register writes are all CONSTRAINED UNPREDICTABLE while CR0_SMMUEN==1, so
leaving them intact lets in-flight DMAs continue to be translated by the
adopted stream table.

Initialize 'enables' to 0, so it can carry the retained CR0 fields in the
kdump case, clearing only the queue enable bits. Then, preserve them when
enabling the command queue.

The retained CR0 keeps the crashed kernel's ATSCHK too, which selects the
fast (0) or the safe (1) mode for the ATS translated traffic. Switching to
the safe mode would start checking the in-flight traffic against STE.EATS
fields that the crashed kernel never set up for a check, aborting the very
DMAs being carried.

Clear latched gerror bits if necessary.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 60 +++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ef1ef4d452949..0fb8c60526699 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4882,10 +4882,28 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables = 0;
 
-	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+
+	/*
+	 * In a kdump case (set when CR0_SMMUEN=1 and !GERROR_SFM_ERR), retain
+	 * all the live CR0 fields, e.g. CR0_SMMUEN to avoid aborting in-flight
+	 * DMA and CR0_ATSCHK to carry on the ATS-check policy, while clearing
+	 * only the queue enable bits for this kernel to take over the queues.
+	 *
+	 * According to spec, updating STRTAB_BASE/CR1/CR2 when CR0_SMMUEN=1 is
+	 * CONSTRAINED UNPREDICTABLE. So, skip those register updates and rely
+	 * on the adopted stream table from the crashed kernel.
+	 */
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
+		dev_info(smmu->dev,
+			 "kdump: retaining SMMUEN for in-flight DMA\n");
+		enables = reg & ~(CR0_CMDQEN | CR0_EVTQEN | CR0_PRIQEN);
+		goto reset_queues;
+	}
+
+	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	if (reg & CR0_SMMUEN) {
 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
 		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
@@ -4915,12 +4933,41 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Stream table */
 	arm_smmu_write_strtab(smmu);
 
+reset_queues:
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
+		/*
+		 * Disable queues since arm_smmu_device_disable() was skipped.
+		 * CR0 fields are independent per spec, so the queue enable bits
+		 * can be cleared while retaining SMMUEN=1.
+		 */
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to disable queues\n");
+			return ret;
+		}
+	}
+
+	/*
+	 * GERROR bits are latched. Read after queue disabling so that unhandled
+	 * errors would be visible. Ack everything prior to re-enabling the CMDQ
+	 * as a stale CMDQ_ERR would halt the CMDQ and new command will timeout.
+	 * Acking SFM_ERR is defined too, although it would not exit the SFM.
+	 */
+	if (is_kdump_kernel()) {
+		u32 gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+		u32 gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+
+		if ((gerror ^ gerrorn) & GERROR_ERR_MASK)
+			writel(gerror, smmu->base + ARM_SMMU_GERRORN);
+	}
+
 	/* Command queue */
 	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
 	writel_relaxed(smmu->cmdq.q.llq.prod, smmu->base + ARM_SMMU_CMDQ_PROD);
 	writel_relaxed(smmu->cmdq.q.llq.cons, smmu->base + ARM_SMMU_CMDQ_CONS);
 
-	enables = CR0_CMDQEN;
+	enables |= CR0_CMDQEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
@@ -4976,7 +5023,12 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	if (smmu->features & ARM_SMMU_FEAT_ATS) {
+	/*
+	 * In a kdump adopt case, retain the crashed kernel's ATS-check policy
+	 * captured above rather than forcing it on.
+	 */
+	if (!(smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) &&
+	    (smmu->features & ARM_SMMU_FEAT_ATS)) {
 		enables |= CR0_ATSCHK;
 		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 					      ARM_SMMU_CR0ACK);
-- 
2.43.0


