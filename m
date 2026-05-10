Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F0CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCacEnv3jFgTu+llFs1ktz1QQR/9JDZVdeP3XUil9go=; b=R7KX1EDgGllZlR0jzXTc9gHtvm
	H4EBIhGdQICbTXdMwG5aW2hCCJkLXdb/xi6SII7Vn+dRGcl58CEH8AKm/pFnts5j8dQaMtPtzMRxi
	+G5J1mNpsyMAiUvb7kOp9eBPzjamwqxPv0k4Vl89nMapYV1nrhzSsIYlPvrLgBvMi/YBtZbx3hU7T
	2Mi7utJQh0r0rBsO6k7In29pSknkTlCTMJ4MH4PwwOvhLB6HC/IeNxms0oVWLY7baTNu1hPJRxNs1
	bKqQZQCl/XtDLYPBvjna5grHlbz88DHs21bOE/r2Utgpduy7A9McsIcSV6Om0x5QQFk4370Qco7lt
	f9ryNhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBcf-0000000BdyQ-3dcU;
	Sun, 10 May 2026 21:23:37 +0000
Received: from mail-centralusazon11011031.outbound.protection.outlook.com ([52.101.62.31] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMBca-0000000BdvO-3wpL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 21:23:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkmxhvqSjpjEM1Ry5YXSRFFMZfnSqgFgbjXsnXgvCbhKT5zwBwXSS29YHzHtOiKgjFCjD281W2/HWlxZx+wkDo/Zw6TnsbazMJRoD1LVu4iltiBceYW0UgKICBh0MyAedmB6/c6+Zo5/UTIsRF5ZQi/EvIUNvWlpb3YBVnfcDMGp/+K3jxUej/jWZcuY9B53FYu+3fhZMSzzDK1eD9fznMd3e7WWFr7xskmy1sHolA16rGvWpF1qjQW9P0AO8DzmuW7PquT9E7J+/dOrBLFYfcmGVAEzY4kIGZwnpxPIXFGIBKjGT0pb6aPxhUurfA/ir2C2d83yepAozImG2vcXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCacEnv3jFgTu+llFs1ktz1QQR/9JDZVdeP3XUil9go=;
 b=Vc0aM9azAw9/WRfGUNdgDiPs5RM0aHJp6tmquo2Lngs6bymz70/WHvArxfjiEGR5jKynvA6eAhBk7vySNBKWz/vMAD/VBiD6c1chMvsSUNYGhBhpE3CR3BeBG8MatYmFiiEeGwJk5L7MeuagEa6OOFjLi23DJK/ouBabzFQQlzsK7OsImlIOO/cc1P7xdfI8GhbD+fFwNic4qFwRwmhUnhs2FaGTg2yvwXZSAD/K8fRlyz/7HKOmsRCC7CQknssq6WTp+kO6lOawyRQfpn7r7bVb9GS10vk+Td7UNwqL68rWDS+81KqJBE7eQ0b15qwW8R3WU5OJhnJAGDFmsCs1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCacEnv3jFgTu+llFs1ktz1QQR/9JDZVdeP3XUil9go=;
 b=Uh25NjGk9tEzGkoYeJRW6BS5e4Rkbo2Yd9UfyPFyDamfrNoBbNGdq7k96LZYqME8USyVkfp3MLUkzpr2IuYOBhZ13HKwYnFRFHKD0fTgMlnDMxqjvKp/rSdOyW+hsP5SeH4TWw4z+gnz3X1e4GAXyjh39/6IYVSt343gxsAWBefp17D8TMSvvcyj7sm/D0LMqtpTLzoQzTUTC9ozwu924A2B4KRZBQuhQqrpWTnVE9ZGYAU6ZOTYjyWi/fyss5SGVzbhYCcw3d9EcuMP8PQuI6CG0fBXRpYCkIKj972fnEfB0N/VG9sg+Lro4D2a3RxTOqSqhAWJlbhxvhVgoNUMsQ==
Received: from BYAPR02CA0062.namprd02.prod.outlook.com (2603:10b6:a03:54::39)
 by LV8PR12MB9617.namprd12.prod.outlook.com (2603:10b6:408:2a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 21:23:26 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::5a) by BYAPR02CA0062.outlook.office365.com
 (2603:10b6:a03:54::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 21:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Sun, 10 May 2026 21:23:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 10 May
 2026 14:23:15 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 10 May 2026 14:23:15 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 10 May 2026 14:23:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH v5 4/6] iommu/arm-smmu-v3: Skip EVTQ/PRIQ setup in kdump kernel
Date: Sun, 10 May 2026 14:23:03 -0700
Message-ID: <8de5639630e5723d6f371093cef93733f0ca534d.1778416609.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778416609.git.nicolinc@nvidia.com>
References: <cover.1778416609.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|LV8PR12MB9617:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c9f1f1-bd69-4567-01a7-08deaeda5f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: bTEc642wjMn05CM4a748muOUGFxuYR/dP85welu+3RhzmuDetiYtM83Vgd4DwMHOKbpTQ3Y49qjBMJZB1yuwE+WIpMKVjYDr2aQTvnNXq/7SXfujf1srB8vnMAPUo7VPvzABzWqrT9RZ5dF07SPGhj105dXXGbfXSPqHwFg6SCuO9qKQCfU3whK0ZufB51yWUMLHrLot1qAPiNjVthURiqFw/iYYuDySzfsAXEDzb9j8J9oVLHXp0uvkqIdXHy3veZZ4htXcEM3eEvK1PWyQjfHhl28iMbQ67ae6vBNF7PbHvd21HPx9h2pkfG4zLAf1PovzelCyfNVTIIiufi8awFeGmxltX55HlI4F0wPnu1t6KJrLUrZAX3bv626M/RIvGN+ibf5/Dm6nneLeFJQcYCy5qKkdVUjdyR53hHRfslGJMZ2Z8CJc1eSnC2o2+ITnUKr+LaVpWFhVgMN1UWoOi3tiF7QEZ8IymcIq0xLDDRLK6HrB8E5imo75YfQBJtlSJUK3EDHCNzAKZ1jAzxktWLOCBnZFMjmIhG7kszy97knuXc3fvGn64UQ/WeaKTBfZdIsROcoYXeTwFrp6aTwxjjp08g6RftXewjuw2TIpVqjxPLalHt3oxrWumLygH3eaR3UvbENPqMpTSWnKpgtrOJ5JfWqZJWqKmkridl/mkjLEgTq6BYM2q3ZllSY/rJgJzz+Ju+ZCIO4UPMTx5zHctiT58Slg86b902Z6LjEdaAc=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Bt0berCGqy9QKPtNqHbM/O1PM5xrhjV6Kk0trO5gRb50SY18rqBg4D9d87kUrCQtQcHod1E4oVRE5nHL/uiqHTCbdYdqbMTxmMADWV9W8lI0/SNZBV9hKuueJ3qcrMethjq9A8TA23M9eIIUfKu+ZbP36tEDiLYbb4B8kYuC/CULyWpeNRXMrQUXonCkPrreUY+Oz/T6IH+eTKyfTeRWCny7fiDQlO7Az4DDPXCPT3koM01byaDn1NvnpUasir0GOACXSCJhR/T7uL/CfWMrbJkcIFzTnFebeb+yjm5XfKR9yitpC7B1oGCgkcYsfXHR8kJ1BuRoTtDxsB4DO4CnCUcEyLjkNrsahQJB1kJK5f5KKDx4EsBTBBKiMMzihHzCerBru31HGbgFLUINmhqe2jvmTdPvR19fKwC/KC2ydTZT2ljg+8gy1GYhmsDWoeOg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 21:23:26.0581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c9f1f1-bd69-4567-01a7-08deaeda5f82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_142332_980664_0DCE63FD 
X-CRM114-Status: GOOD (  12.15  )
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

In kdump cases, the crashed kernel's CDs and page tables can be corrupted,
which could trigger event spamming. Also, we cannot serve page requests.

Skip the EVTQ/PRIQ setup entirely rather than enabling then disabling them.

Also add some inline comments explaining that.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Suggested-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 43 +++++++++++++--------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ebb0826d74541..b7298218bac9a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5211,21 +5211,35 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
 	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
 
-	/* Event queue */
-	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
-	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
-	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
-
-	enables |= CR0_EVTQEN;
-	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
-				      ARM_SMMU_CR0ACK);
-	if (ret) {
-		dev_err(smmu->dev, "failed to enable event queue\n");
-		return ret;
+	/*
+	 * Event queue
+	 *
+	 * Do not enable in a kdump case, as the crashed kernel's CDs and page
+	 * tables might be corrupted, triggering event spamming.
+	 */
+	if (!is_kdump_kernel()) {
+		writeq_relaxed(smmu->evtq.q.q_base,
+			       smmu->base + ARM_SMMU_EVTQ_BASE);
+		writel_relaxed(smmu->evtq.q.llq.prod,
+			       smmu->page1 + ARM_SMMU_EVTQ_PROD);
+		writel_relaxed(smmu->evtq.q.llq.cons,
+			       smmu->page1 + ARM_SMMU_EVTQ_CONS);
+
+		enables |= CR0_EVTQEN;
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to enable event queue\n");
+			return ret;
+		}
 	}
 
-	/* PRI queue */
-	if (smmu->features & ARM_SMMU_FEAT_PRI) {
+	/*
+	 * PRI queue
+	 *
+	 * Do not enable in a kdump case, as we cannot serve page requests.
+	 */
+	if (!is_kdump_kernel() && (smmu->features & ARM_SMMU_FEAT_PRI)) {
 		writeq_relaxed(smmu->priq.q.q_base,
 			       smmu->base + ARM_SMMU_PRIQ_BASE);
 		writel_relaxed(smmu->priq.q.llq.prod,
@@ -5258,9 +5272,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
-	if (is_kdump_kernel())
-		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
-
 	/* Enable the SMMU interface */
 	enables |= CR0_SMMUEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
-- 
2.43.0


