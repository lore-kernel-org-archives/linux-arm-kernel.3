Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98FEC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EdSnhKnPHtaYZplucRJxtljkfqj5PWJhMvK/7p5w04=; b=g4oNKID52s/8b/TT57/GyGfELi
	FzwM6rXr/uij6ZKLCLn4S1HMRvwUteL4wwcRsp7ayawBcwG+Nzi5Dn3tEQvcMTqb3Fraf0lO62Lt3
	Y6OXy/8l8uS31GdjiahZTnmh2lxisF0GP6xR5Pk8GHcU4oGN4HwUiRmCowvh3g3+neIRgAEbxAWpO
	25GGZdgQWu4j9K4PoTk0fM6a8tWOMPOOnoPcIR4unu76o9QF2T9nJcC0x22QLfd2uQWleeVS4ikeV
	xi1dRa1h6XDuRGOql9yw1GL2o9T8UD/bloxFPipqF3qri4LLr0xyZG1kjUAqT82mk3ijObdZJfMw3
	XVSTBm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU4S-0000000BWuw-1rxu;
	Wed, 22 Jul 2026 10:21:00 +0000
Received: from mail-northcentralusazon11012035.outbound.protection.outlook.com ([40.107.200.35] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU4Q-0000000BWti-0EFp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:20:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZi2rutvC9KdB18QdP8NAjfMek/m7x3WSs+Sj9jO4uRsL99DG18hAEvyBIiFFNg1CPTFGkduI+3oIQ/yXvUMCWIGQ412SV7lwa2NAaE4Bh/SIN70fSGVMVvhXz7ATFlE1CtDpCPha71sPW0Hkel2yp79sWK9h9bYMhNwQBtgrP79eg+Kks8eiY72MUHlyM6dytRpSijcg/q5XD3bHbZdyHjjd7voWt1RlhYUnHh3nG1uyNwmPyzrnZlHu+5pkQHPAEMj3SSZbi84snLD14wL7Kv4mV4iRFNOV1/KxpNLeu79IJZDhlvoOKdAof+jyT+95cjX3L1ulPjFWRmFnJlObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EdSnhKnPHtaYZplucRJxtljkfqj5PWJhMvK/7p5w04=;
 b=GQDhll5nICI/yoc/893cpA9oWKr8x4yOh0tpHpyjmTr4PAxJiOjvFj1rkfTFZfPS1VV155DlWhYgUWhzAbEpMOY0EVb27xr3kWS4cn1x7qksSal795oCtDH2l7CtkVOtJZPe8XsuS/0AF73Vj2/FTcLYoz0kj9TNpidk9Km7fhlKSEZ2sWuVSBzPHK3/dMgVc46rPqv7TsbeojfO3hQZP51zg8vcc/v/XoN+ADwXqarVm/8Ubuq4YtSbTqf5mRsAMyO/v7L1P87UI4dDZiq90aAEvLM9j10xPc035zkAJZ/cpYm8AffKq6Sq1S2JvXtWGsvQ8vH4x0rd7+J8H8eHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EdSnhKnPHtaYZplucRJxtljkfqj5PWJhMvK/7p5w04=;
 b=E57iDbA4nzNEWSduHUrz+KH8P/SKMRWvBKsx0W0Xn9HQCi2mkfxRcmX/zSUz9S4RbYfB0qyM5nMSkoAnABqasXdRxd8nmmWdYHyj1mvsIayJOVc5XFm46IrkvAQAQkJ7MbHhvV1ktPwfdeP67nn3EqOrVCCtX5o8IO9bdzZ8T+2WyPRZYS8swNYzTPgPMZy9XdMqen/KCvC/tt5MIV2or4LBh6FEjQGK/loBargOzD2ciIekxDJ4M5A4J34jb7ICIDJdnFxlapZVFIEuEMhe44CJ7uz2yuCQfhGDiExcCSVCf9013ttXDxFCHv3Bvzv1ADj/GAuxWwykNIH/i/+SyQ==
Received: from CH0P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::10)
 by CH8PR12MB9791.namprd12.prod.outlook.com (2603:10b6:610:254::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:20:50 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::83) by CH0P223CA0020.outlook.office365.com
 (2603:10b6:610:116::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 10:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 10:20:50 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 03:20:36 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 03:20:36 -0700
Received: from build-amhetre-focal-20260716.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 22 Jul 2026 03:20:36 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<nicolinc@nvidia.com>, <jgg@ziepe.ca>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
Subject: [PATCH v8 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat workaround infrastructure
Date: Wed, 22 Jul 2026 10:20:32 +0000
Message-ID: <20260722102033.1122277-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722102033.1122277-1-amhetre@nvidia.com>
References: <20260722102033.1122277-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CH8PR12MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a5fad2-02b2-4aec-3855-08dee7dae743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|1800799024|36860700016|22082099003|18002099003|3023799007|10067099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Y6PMB8axBfL3oO+fL84kweGmcKMja+4evEWRdchF5poaNiwYGdO62mAVBz5dj1zbwAGDBscUxOHRtcgVcwD/uUcr1U3sG4fe1CR5IuHCyEeiHqaRHDGkEz1tJhHRPjAxuVGZ9f13mrT+i9cTqwQpX2zp48fOF1Vm1Knhbtfxq4gOXoMshRuUyJXmrgfAqwbaLEPA6Dqrl6uRByDGbPcDFKFyBc2Ql1HZ/13a6mKhUl/BMTsawsbFaLtvbOSuHXgfQaMAkOJsccE7tYca+/qGk2T3O8xz36J0Kwn1jCA+t2SlF8iYPN1ef7BV9AjtKzyJE85QEuZbwCTJxo1Pk0lPBG6LomHSCrGLM3ysRlUCovUE7ORUtWTkIL2ndOyh6tW1pCFKvlhxu7aWCySYrq/Mim1gemKVPn4d/CWMP7j4+RTAL/sDk/cZ1cI32RRLfD1/w/stYLioUqF5GYHbx1AlkNIuQihQnQnkJkdMOfBu4t/2Ong/RihoTNGXhGM0VGupsGstN4F1z2OhP6ajlWibV8Lf4t1hiNn8MlDuBN0b0sXukIWsoQBafPhtRvhRVT/MkXH5eQ2P0Z913eVjebIyDHlkxv3LayicvxyYMSRSaJvIcDYI6nTut7EC5h1CyMFY5xRNvLl+MvqpL1GMawnEgfA0an6Y57F5WboCuT5gBWbjO1LXYIjT4OFsirKNmkDt04D7OtliBVIQlw2wbXMLmQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SzLGOhbRCLnLR3BY8ZfITvC4N7+Ts4cfBLusPLWicKYOqxhZdxJjbjSncLitsL7ZEy7h38yIAJ8Jgs3IkWNOIKRezmIQ414ujIQwrBPkfJWLXGW2UiL8+JU+JDZfTVAE59eqbs42mK2+V5rjZ84UBbY2GwgxWo9Nm5/9d4Pxsygudj+3ifSxVZpabOUgU+e+qrxKJIFt3XYh80mp3eT62EHWCxAkAXdgaIcluD36v/Vsi0WfjZ+BDV86MX+uVvAq0bGAk/8+8r4xDDkernISqNdX//mvrQJ9kCD7SJEmGTStuLggh0oYw1M1+I97+OyBuZqX4WLoLRV5HI+aQ6mu1SDCTwbHbWKn72kOBywSLxTYqvh162wswGBPmCfNzO8VZKtCT86xEYoNPpfZrScWRQjI/rU4QJXj10ntvsDwr/i9OAh37iUOQqSz25GzDCXt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:20:50.0075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a5fad2-02b2-4aec-3855-08dee7dae743
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032058_149890_E84DAACE 
X-CRM114-Status: GOOD (  21.09  )
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

Tegra264 SMMU instances need every CFGI/TLBI command sequence issued
twice, with the second issue executing only after the first issue's
CMD_SYNC has completed:

    TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC

ATC_INV is not affected and must never be doubled.

Add arm_smmu_erratum_repeat_tlbi_cfgi_key and an
arm_smmu_erratum_cmd_needs_repeating() helper that gates on the static
key first and then range-checks the opcode (CFGI_STE .. ATC_INV), so
subsequent changes wiring the workaround into the CMDQ submission path
can share a single predicate.

Rename the existing arm_smmu_cmdq_issue_cmdlist() to
__arm_smmu_cmdq_issue_cmdlist() and add a thin wrapper of the original
name that re-issues the same cmdlist a second time when the predicate
fires. Host-internal callers go through the wrapper and get the repeat;
register the new condition with arm_smmu_cmdq_batch_force_sync() too.

The iommufd user-invalidation path (arm_vsmmu_cache_invalidate()) keeps
issuing user commands exactly once by calling the raw
__arm_smmu_cmdq_issue_cmdlist(). The erratum is reported to user space
in a subsequent change so an affected guest doubles its own CFGI/TLBI,
doubling them again on the host would be wrong.

No callers enable the static key yet, so there is no functional change.
A subsequent change will enable the key on affected instances.

Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 57 +++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 ++
 3 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 85ebfdb3d2a7..032d0c272f3f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -400,8 +400,8 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 			continue;
 
 		/* FIXME always uses the main cmdq rather than trying to group by type */
-		ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &last->cmd,
-						  cur - last, true);
+		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &last->cmd,
+						    cur - last, true);
 		if (ret) {
 			cur--;
 			goto out;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index dd7475c50afc..f0f8b2daf8d5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
 #include <linux/iopoll.h>
+#include <linux/jump_label.h>
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of.h>
@@ -42,6 +43,14 @@ MODULE_PARM_DESC(disable_msipolling,
 static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
+/*
+ * Repeat every {CFGI,TLBI};CMD_SYNC command sequence so that the second
+ * issue executes only after the first issue's CMD_SYNC has completed.
+ * Does not apply to ATC_INV. The key is global and is enabled from DT
+ * probe on affected hardware (currently Tegra264 only).
+ */
+static DEFINE_STATIC_KEY_FALSE(arm_smmu_erratum_repeat_tlbi_cfgi_key);
+
 enum arm_smmu_msi_index {
 	EVTQ_MSI_INDEX,
 	GERROR_MSI_INDEX,
@@ -698,10 +707,10 @@ static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq,
  *   insert their own list of commands then all of the commands from one
  *   CPU will appear before any of the commands from the other CPU.
  */
-int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
-				struct arm_smmu_cmdq *cmdq,
-				struct arm_smmu_cmd *cmds, int n,
-				bool sync)
+int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
+				  struct arm_smmu_cmdq *cmdq,
+				  struct arm_smmu_cmd *cmds, int n,
+				  bool sync)
 {
 	struct arm_smmu_cmd cmd_sync;
 	u32 prod;
@@ -820,6 +829,38 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	return ret;
 }
 
+bool arm_smmu_erratum_cmd_needs_repeating(struct arm_smmu_cmd *cmd)
+{
+	u8 opcode;
+
+	if (!static_branch_unlikely(&arm_smmu_erratum_repeat_tlbi_cfgi_key))
+		return false;
+
+	opcode = FIELD_GET(CMDQ_0_OP, cmd->data[0]);
+	return opcode >= CMDQ_OP_CFGI_STE && opcode < CMDQ_OP_ATC_INV;
+}
+
+int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
+				struct arm_smmu_cmdq *cmdq,
+				struct arm_smmu_cmd *cmds, int n,
+				bool sync)
+{
+	int ret = __arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, cmds, n, sync);
+
+	/*
+	 * A bare CMD_SYNC can be issued with n == 0 (e.g. an empty
+	 * batch_submit()), in which case there is no cmds[0] to inspect
+	 * and nothing to repeat.
+	 */
+	if (!n || ret || !sync)
+		return ret;
+
+	if (arm_smmu_erratum_cmd_needs_repeating(&cmds[0]))
+		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, cmds, n, sync);
+
+	return ret;
+}
+
 static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
 				     struct arm_smmu_cmd *cmd, bool sync)
 {
@@ -860,6 +901,14 @@ static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
 	    (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC))
 		return true;
 
+	/*
+	 * See the description at arm_smmu_erratum_repeat_tlbi_cfgi_key. Batches
+	 * never mix CFGI/TLBI with others, so checking cmds[0] alone is enough.
+	 */
+	if (cmds->num == CMDQ_BATCH_ENTRIES &&
+	    arm_smmu_erratum_cmd_needs_repeating(&cmds->cmds[0]))
+		return true;
+
 	return false;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index c909c9a88538..9508bf50d14c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1207,10 +1207,15 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state);
 void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master,
 				  const struct arm_smmu_ste *target);
 
+int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
+				  struct arm_smmu_cmdq *cmdq,
+				  struct arm_smmu_cmd *cmds, int n,
+				  bool sync);
 int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				struct arm_smmu_cmdq *cmdq,
 				struct arm_smmu_cmd *cmds, int n,
 				bool sync);
+bool arm_smmu_erratum_cmd_needs_repeating(struct arm_smmu_cmd *cmd);
 
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
-- 
2.50.1


