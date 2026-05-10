Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5468ACD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVqVbClb1SEkK4dTzzZcTGVy/dogdPcOFtyZMsttvAc=; b=FytfvwAhsf+nb6LZRt9UYJ9EW6
	IpbDlqA43/SA2FQ5HOnkolMdr41cREqc/JrgBna5OdvwpUzLwUxYWtP0r86MAD6y+aQ8mN/vl85oc
	jOtm9DpjlUdFFcOPQgpWB5DxZ3hGuLTX6OYIRTF2o2q2Wjbr8l0Y0FlfzcDgPDYrtmc+YLEu+GOy9
	JN1dwkzaqu2QbGDlbS2JpQx4Ar27dQyIuRslwC0YVtSVK+nWc/DGsopGqOIUeabq0VygNxkIM/TDL
	6+nM9X2ctYtKRBj28yjtUxzdr09JI5a+BHlzXKRir5xVfTwFyoUlFsO1kIQonhcA0lVy4v312wVfH
	YIfQgCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBch-0000000Be0J-2oFX;
	Sun, 10 May 2026 21:23:39 +0000
Received: from mail-westus3azon11011021.outbound.protection.outlook.com ([40.107.208.21] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBcc-0000000BdwO-2M62
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 21:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9+9ET1XeOljcJPRRgvKnkhoDF5zrlEyt1e/2jepzi0eECrXwY4HB0D7NRN5jtXoVvTxgrkOCTtG+xDdq2wQUjXn294j5I1UknQBljJUFs3nTDR7nFQ5sXj9UAGo4jlrx8+V5Hbpdx/0mC+rk/+0x9nPpRRAsE4R1PfUdAqsCz9Yyh3CFtaES0BOFS+HYyHH5CvdhSonIZYCGd2hK2B1PiFYzRt7aiGzEH4k3UYfLlucAYuqQ7L/vh8pHm7XsE2k3ukkbcDNn2znJTDxvTiazC3/nCzf1SaNZaLXONk11g/B/hqh7bknB2kSPtsSzQs6HwT8AwmjTyK5IoA2pDyhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVqVbClb1SEkK4dTzzZcTGVy/dogdPcOFtyZMsttvAc=;
 b=cz5rJyWq95w2e+9f1xcPDoBlhYcgXLLGlouA+6OtkaQEC1AO7c0HEcdMpUsXIcEj02yrq9pBcIas9rYDDLwLQe9IGXq1/xPdjaqID3/7HLmioMfwKAcic9HwPsy3rIuinzf99WLvq7UKX2SnqeVAWVGWWyfVhvCbyBlyFHis8p/IGdjNW9C/kt5B7oaFe0D6j675lhTef9H0yi9kDaGjOadWDcVXhDj+80ZWOfgaA02STQrp5Xr7qfjRg/VL8dRIwFxEolzjKxUWqrFCbu752+dQpfCqAR1mgeSZnOMwOu58zfoLcs3LM3q5pZmpbU0qnjRdvilmH789Lzbrrl9+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVqVbClb1SEkK4dTzzZcTGVy/dogdPcOFtyZMsttvAc=;
 b=GXtVdA4t29PlroajmvNoyRTOBO+HddBbQxYeX0Lnm6pmsdcpOxSmTB5ZVhvzIrmv/dwue2h6cFkwWOLEfPd5ofZKhOmupHhMgACLC4m1aioIoc/rQqKO8QkRi5xwMDeG4d2GvwzXd3uDEh1A8PIDp0FRdiem9bVmHLlnXw7ajYxb0881S7MnFLAnQVpaXWOOnGgEQv2eHznUKBc9B8I9Di1AmLhQYnN05c5BO2l9obDtAM/kO+UTM3qm8eWSo5jUK1Gb2u4oipyJMOcxJPxGUt8KNqrDASs5tBPtiEB9+pXPzf6pKEbzJfWw6WZfFE8Svm3ml2ASAgW7yA0eP1AGLQ==
Received: from BL1PR13CA0202.namprd13.prod.outlook.com (2603:10b6:208:2be::27)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Sun, 10 May
 2026 21:23:24 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::79) by BL1PR13CA0202.outlook.office365.com
 (2603:10b6:208:2be::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.14 via Frontend Transport; Sun, 10
 May 2026 21:23:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Sun, 10 May 2026 21:23:23 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 10 May
 2026 14:23:16 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 10 May 2026 14:23:16 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 10 May 2026 14:23:15 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH v5 5/6] iommu/arm-smmu-v3: Retain CR0_SMMUEN during kdump device reset
Date: Sun, 10 May 2026 14:23:04 -0700
Message-ID: <7e617d6227e5fc3ca431dcb2febe9f0692c5d6ae.1778416609.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778416609.git.nicolinc@nvidia.com>
References: <cover.1778416609.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|SA3PR12MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 0beb1941-c54d-45ae-b6d1-08deaeda5e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: BD+uMR+mco5YfVRKn0qx+H8M7pHo2KSKwGzk7ZhnTRny67/DtbElWtpMpou5PCBFrdrtFHShVzeuXn5c6imRBT5gKdogB+INIFhaXlKrasbYbkV73WQSPvXl0hVkGC/6y+Vz/JhuPzUTYwC+le3noCpHNzTLg3inJpYXsu7q6eMqX7pAVg1No5cMEKVP+AGfw/qi7KejLzu5ejXaz9oiNVevF+QVxy/YAHhcuV8E8okcBQ1t3arM9Es/+lLJuN++BWcTsTz27JrD9cVSCHZADC370J7bH7qqkbbXdpmW32e3BlZtTDDnfKxJ8CvnqPynIF0EiW67hORdG9zCUYM74Ku5RhPFEkrjaF6BP731cM2YoFV4/iA+JaGdK4oMKM1IB11xcVRa3us0iToRNoi0YpgPl5Ke9H8Zc7mhCcdKQZq26nrnVwPdQIw/IxKlEspOzHk6SZG2lK3KkKS23rHj+Na5n2n01NydlACWQ+mSjgsxGAEeXh5tgBdMFA5t/1Fl6NQrqleW66iEO9tiNNEzzBJyzhwLiA/nNqcHzJlIlt/I4WYfmQscAOgcHp1S2uHdeE1ODK2LM2Ak113R+PxorB6fh3hZ3ZFFQ0HzwZcC0xhdIbze3X8210/q6NdkYCaXpcNdvnmqmhF89i2TfKMTcXmCl14TEDMyG3jUiurpa9b+mEFhYaXYCxqH030p8e8835H9P+9vN266ZIWzVxUAtxOlocAVh5dlUF0tXuLcGVc=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DnnHXeASZWiZQQTI2rnfzRyMKtrZWCmWT1soGmteuka6roegP7qBFoHjgzw6M4rmkjN8QBA2GWM6Ge5mZOJUP4zuHuFXDQIJWk2Ne4vWIhWeyIKhtWpAALl/MMUiX/PbdUmqfXmHjo4I6vADgqC9FgKEQATAevWbc/zOpePU3hML/slqlQSHPnw6YqDCdp/u7/rvfo/+igrvO96H1r1RaBlWxLyltoE3RDi49o7HS5Q9HS9Q2RCcKdKrsTBpdvqRLcjLmmEyofDlnFlQRV0xudzXU4/dw9IozfEyrUAgTm9Q4fLoGocfkLHmzVYFL7YecUYsHONzBrG9MlpG+LTDUa+MfdZBYPGzgaG57yjZsEOJoyeVapr20ZD0P0iZ1so0kfJA3OJLp2htoRyu+UAA/4CS/VBDjXX+7qSN5cLO6Ycf3nkY/c1PehzD7r3KS4cH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 21:23:23.9485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beb1941-c54d-45ae-b6d1-08deaeda5e4b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_142334_603817_42EE9DA5 
X-CRM114-Status: GOOD (  16.21  )
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

Initialize 'enables' to 0 so it can carry CR0_SMMUEN in kdump case. Then,
preserve that when enabling the command queue.

Clear latched gerror bits if necessary.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 47 +++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b7298218bac9a..bb8cc580e7ad8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5151,11 +5151,28 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables = 0;
 	struct arm_smmu_cmdq_ent cmd;
 
-	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+
+	/*
+	 * In a kdump case (set when CR0_SMMUEN=1 and !GERROR_SFM_ERR), retain
+	 * CR0_SMMUEN to avoid aborting in-flight DMA, and CR0_ATSCHK to carry
+	 * on the ATS-check policy.
+	 *
+	 * According to spec, updating STRTAB_BASE/CR1/CR2 when CR0_SMMUEN=1 is
+	 * CONSTRAINED UNPREDICTABLE. So, skip those register updates and rely
+	 * on the adopted stream table from the crashed kernel.
+	 */
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
+		dev_info(smmu->dev,
+			 "kdump: retaining SMMUEN for in-flight DMA\n");
+		enables = reg & (CR0_SMMUEN | CR0_ATSCHK);
+		goto reset_queues;
+	}
+
+	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	if (reg & CR0_SMMUEN) {
 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
 		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
@@ -5185,12 +5202,36 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Stream table */
 	arm_smmu_write_strtab(smmu);
 
+reset_queues:
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
+		/* Disable queues since arm_smmu_device_disable() was skipped */
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
-- 
2.43.0


