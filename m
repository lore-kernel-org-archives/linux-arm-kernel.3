Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2906F364B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ/Gqg6jqYmEDe5NzgGKhFYnU1Mg9VMvHAH67YKla2Y=; b=tORbLAPxFPDpuyI9rRda0XzjJL
	G5Vc9j41Spu5bfekdznoBnFPAjePzzXCxRwAvz3QkmfONfsvNyo2kr/PSJk7nYzozfpjiAfPlA0l8
	pVfU3+gVFj3Kmnt4c4VTV1H4yHcO5maVBDQegqOYK6JbIgmTsbGsMM9plOo4mcoSBpdVl6jDnj5PC
	f9f0SZuIhtRPRwOs1ZIElMWjUBAuhthTIjiRcq31Hb2eYOQBTgshwRb7b/GXz4sTgWdHiWmU0VnI8
	9MhNpwRns7H/HJ2z4LnYk/fMT0hMm0tsdIvkeTWoYqGCqdxwkRYOcHCmjGNohsNBP5P/4HmpUV5qx
	lV3fTrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAvLk-0000000B9re-0aT7;
	Thu, 09 Apr 2026 19:47:36 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAvLi-0000000B9qw-0Edd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 19:47:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3nK8LDfuj9SjBnxs+i/grogITEwoH9fD43Q2ejBX0Bw3LKp3P5rv+qu0srmP7dCFaV74Il793fEtB3Ph5t0dPS/jcmENHiZtclR51oZzr1wwKdx2iQL1v4Ot+IxQXXhVNQXyfZCzsDmItFeYAvpj7/j6TlGvHKUAp4pALmTRsvQ2Lu0BeDe6S7fgHTrtn5XW9eSW9NKx6OTsI/hSsRulBozqTR0fY+FlizRRjykBMTK6EL7PCdWFAxnGphZaHngNtPhDJlE8S58mhH/pakduoFpOmrFrDBpsyKGMTpv33Ci/i8F4DdaQt6sKmW+nn7PQ+2v3/OE60aPpuqUOpUjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJ/Gqg6jqYmEDe5NzgGKhFYnU1Mg9VMvHAH67YKla2Y=;
 b=We/D9B9NfBQggIGk72NqylTm7VviR9gdEpkUN4urj+CZN+YU0xnzX2uY1h84YS/EjpEYsP4U81ZE7XiUctxKv1G7iC2SRWj3bK1IcOFqAWi6ZySxEJ/CVupv8HMypfkQDN77QLF09w85BN0s2WXHT55aIYOH5yB5OfdBBIvbgwfjw6zT4jBab+St28fK48F4M4pSJA130oOtxHGDckUsBsHmsjBNMbNal3SxJh6WB1EFhi06hFD0L9uN0nd++zYSBzNfHmGhIP/Bqt6hhH1udmehtP1J8+J6Zn5n6CwQk++iItwFny4cRXw/G55r1JsqDFXHBsMH/1QbQGXOtUhV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJ/Gqg6jqYmEDe5NzgGKhFYnU1Mg9VMvHAH67YKla2Y=;
 b=M8oIvR5vsqkRHQgoq/Xt7q4ESLHJL5BalxKXKtXRLYWkNGziZ/RX8Q6yS4ssAPfjOHhsw2M8A/kTac5Z1lIlBMz5fxDC62B2pHWy2C1S83p2jjkGRZK3/x2Ls/Jv+PiGOLkww+Wqb8dFZdC2CVd6RuUCe7OJBZ11xNZdiy/bDp0wBHchMSDkcrZN8PeVqb1qrcydXrA5kIpQ03kYmPlKN9DqgOOISqjNgbGOEo5F1b1rv/pqla1vVla/bF8QKgl342svRutPJqydvRq7xKCsbddhUe4e2QsNF1fWng3vokrErv758ZU/7Gz1bPwco59l/CmpKlZ7MdtrROUoRwrKbA==
Received: from BYAPR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:c0::44)
 by DSVPR12MB999192.namprd12.prod.outlook.com (2603:10b6:8:496::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 19:47:25 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::20) by BYAPR05CA0031.outlook.office365.com
 (2603:10b6:a03:c0::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Thu,
 9 Apr 2026 19:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 19:47:25 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 12:47:13 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 12:47:13 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 12:47:12 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <jamien@nvidia.com>, <joro@8bytes.org>, <praan@google.com>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH rc v1 3/4] iommu/arm-smmu-v3: Retain SMMUEN during kdump device reset
Date: Thu, 9 Apr 2026 12:46:52 -0700
Message-ID: <c116eba01bcd88ba3b8ba47dc08132c4546e91f5.1775763475.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775763475.git.nicolinc@nvidia.com>
References: <cover.1775763475.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DSVPR12MB999192:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7f8777-30de-40e6-1b87-08de9670d309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 60LccGDMmAWk2MQGqR9kuez4Yj6uxrgAOMQ9EHqhOCqnYQBIacpOeA+kbQn/tVfwQDGIOjoIkubZlSMb4mCC8KxG5G9yH2cWu2px75V/MKdL2VKTmjThXw34MQSGN8aMCrj+0oTGMd7NwMRqwWVaKvGIXZ4Ogi8vcCDwWxgzqMN1lOFuHsqMcMkVRf6mr+Ai9zzvf/MyDrcTqWficmBiH5StUKtT5O6OB/Ky5OklVeRz+M22n3W+BoWENisVtxTmLLtom/B2Yp7YmZQIgceQHppSvVnQVfLPrvx7NAkZ/5b0ZBiKlhpCoAgAkDW3QcbA9QxyezdguvxdRm55VIGmcS2y06ExhiWI8n61lfGabX8vnWGHU5i/VGtUMZYEy6dOgWdU5Zm4H11H5QaBzQhRbvcXVjQosSejmexMtiBzuMUMAKX3TzNuo+L0tTJUFs3LYfrQJlKjJN2FoV3oeGRBDYcs4Xv/kmnM8ysUtTcqoA18cRChQPjtlSkZLXU4YQ0Q86ez82i0mhgsdY4Cq6O0j2dBQA/qSvS3oWTFqh9KIc+uChyWiZ4PhONHnv7lNflPn0mJ2m0QYaBIOF6MGXGsN01lQsyM/AVb2+h7q5zMhXH8hWJlOWgdf86uPo5ksrdd1ZHfpLUORkP0ziiVHTOMsnZvZ+05E9pc1N1tY8MbfejHdtI8okzLHN5oWZjjbsGC91MQERQMo6h4Sgo4bhd8UZh8rAnipa9wFosiwQsBHMySNhOIniTU8KKnnmcmN9uB3OFM+SAJMW72iQaH00KvJQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0zlzX59H6lXZZyUSCoOWklLsNWfYa+5gd/D6L0SseOpTAnJubkxkGD05duqXnoENgKjuM50GpcnDKDApt6yOrXNTiFVKFUNwr+uuXcyEHyaMwr6S2ZbAyMSCS8DERQf3BP15fOCImUJ3ZWtC63gsqWQULwTOA49EEjhikbVwNseuQrOviLshbDMkPt11v0vecmcobYkQpCUsJ3kJjbIun4czTmYo9zMcuzuqQqHqkeY5LMQVYDZpoFgMsASyAkhqUFgAkWJBnT6EpIp5KosM+6n3yfYjiiJhCJA3dpSXx5vtXEZvsJCBNorkXyR4WjOS/7QRaV3e6kLH8KGDWMFp2PkD2xjIAisVewSFuabyXhIpvlFHZPnCoSWvuvHFtOtKlObxNfUap/ZrJpXlnFoX70ibyzaMEmQGgVBziK1PlsD3qIHLiyRU1tU26m+QlZDe
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 19:47:25.3880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7f8777-30de-40e6-1b87-08de9670d309
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_124734_126006_111A43AD 
X-CRM114-Status: GOOD (  15.78  )
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

When ARM_SMMU_OPT_KDUMP is set, skip the GBPA/disable/CR1/CR2/STRTAB_BASE
update sequence in arm_smmu_device_reset(). Those register writes are all
CONSTRAINED UNPREDICTABLE while SMMUEN==1, so leaving them untouched lets
in-flight DMA continue to be translated by the adopted stream table.

Initialize 'enables' to 0 so it can carry CR0_SMMUEN in kdump case. Then,
preserve that when enabling the command queue.

Also add a comment explaining why EVTQ/PRIQ are disabled in kdump cases.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ff3c1beb3739e..d0ef8fb876978 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4931,13 +4931,28 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables = 0;
 	struct arm_smmu_cmdq_ent cmd;
 
 	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
 	if (reg & CR0_SMMUEN) {
 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
+
+		/*
+		 * In a kdump case, retain SMMUEN to avoid transiently aborting
+		 * in-flight DMA. According to spec, updating STRTAB_BASE, CR1,
+		 * or CR2 while SMMUEN==1 is CONSTRAINED UNPREDICTABLE. So skip
+		 * those register updates and rely on the adopted stream table
+		 * from the crashed kernel.
+		 */
+		if (smmu->options & ARM_SMMU_OPT_KDUMP) {
+			dev_info(smmu->dev,
+				 "kdump: retaining SMMUEN for in-flight DMA\n");
+			enables = CR0_SMMUEN;
+			goto reset_queues;
+		}
+
 		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
 	}
 
@@ -4965,12 +4980,23 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Stream table */
 	arm_smmu_write_strtab(smmu);
 
+reset_queues:
+	if (smmu->options & ARM_SMMU_OPT_KDUMP) {
+		/* Disable queues since arm_smmu_device_disable() was skipped */
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to disable queues\n");
+			return ret;
+		}
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
@@ -5038,6 +5064,11 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
+	/*
+	 * Disable EVTQ and PRIQ in kdump kernel. The old kernel's CDs and page
+	 * tables may be corrupted, which could trigger event spamming. PRIQ is
+	 * also useless since we cannot service page requests during kdump.
+	 */
 	if (is_kdump_kernel())
 		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
 
-- 
2.43.0


