Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBABF3380D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymQGXcai2IVo/VzioFKJCpzaIgTPx9PQhVLKTfUKg8I=; b=GI2YkhPHVWKJPnb1lFOME+TMuQ
	GmJa9jrLAilDvDbuPyMAVBU1ZhH9Ckws2HFkUMQmq90UneyA52adstM91F7itG3+gM91kQyWb4HQy
	VB/TwCutoLQiD7q1rn0FVV0xZ86Ps890ZUShk8sYcElB3v/tjI8iH1UY2+9FEFqxxCNbBkED0ts7T
	JvjJhE1jCrj3++azUJ2g/eYa2H39/4fl2x/a9pd1PW7i2IqtrkHAagQasXyyYmvLU2RFU0NxJtIaB
	k/+FdwKOLrzl+DKXhO8BtuippxkMR7W67SQrXMC5azC3QCNupjeMae2h9NyVxzAN8sh3y7P2LOGlL
	GkG8I42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PLJ-00000005ft8-2Z58;
	Tue, 17 Mar 2026 07:59:57 +0000
Received: from mail-westusazon11010009.outbound.protection.outlook.com ([52.101.85.9] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PLF-00000005frR-20di
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:59:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrBJZFQ2WLE1JnRPUt3YPaTacuXe4NvNNxqepjYV2L7Uk/zhWBkRxpIAot+oB4Dxx+0ktN4l1ThLXpPM3AdhA7sx2gE7Du1yekTrALYbS2jf4jafhwAQ0YEdCZx9NLT0nlvGplu0b4GOFRrmejJTUCZABfmKGQPbk5kS5E1a2JMvemH5B8UD6ZyUAwPVVbTBtKZuyTRHOJfsYnbKzq/GSnhM1/CKtTvT7H7eQnMsHNOpuKK6JZel2uvMYQpklwuC5Q0dFxnrLFAAxOhSTlBz/znNzckyGxEb8ZCW3RSGLy6srTiLsCF00GomeBLkras8HH9+aSDz5sfYlZ2e/kuZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymQGXcai2IVo/VzioFKJCpzaIgTPx9PQhVLKTfUKg8I=;
 b=DJ6EVsJyQh7xN2u5ej3BYpR9NizDLgR0PEA2IqNLoWWpGJXI3mU+47GkUEPGseyttb3qB/S/9d+O/3j1TF0o/8Ivt6Yh+j2zvQ0HKTvgtuohjXTRUjmRFCUqqv/Vo6neWjn8d/IRH135lEOYabQnWp0tuxMoL9jVfy739s8oNLL47yaXRB3uhAK8t+i6u6tKX6cjGfDk4Z86bhZMA39zvPxoZ8oX/3xPmgN+sBPi/nEM/IKKrjb/RF2Tgb1fvs40elPfCfPD9RZY3k9A9cmo1GMPP6z0lFjucvFW8/A10KVbkpPFuQWAZ+LDIHbZDftxSyATc+yJP/rSr5kz9vpxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymQGXcai2IVo/VzioFKJCpzaIgTPx9PQhVLKTfUKg8I=;
 b=pKTpxJV1hs8V8YjBa2PkKgtZGyHt6+5mcjtEQvKVAufkgDZFmeif2Nz4dQ2ZpZF69o3z2/0+P6xD1hTh6wwJl905pMBHGK0rnVAOjRmaQ34xD7y36wAKqQIWpFePQITaqKQn+xQfVLnN2vD1YTjBd8PnjLegK0xgHEpBn06uV4rn6Js1hQOCd3I3UR91heTTHWg9taw71BrY1iOnwrr/Rf66K74uJ40EZ1q+Mb6Zo8OCMVQc7uv4PCW2LcFgrt/jEwrHVnhY1d0yznmN8nAxpX1cTDQ/Qj1lzXo2HgJK4sxazRE8AcAXlfxEpSgxgneZ9ljiEWMfEbnEvXWKFiC6yw==
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by DS5PPFFF21E27DC.namprd12.prod.outlook.com (2603:10b6:f:fc00::66b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 17 Mar
 2026 07:59:45 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::95) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 07:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 07:59:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 00:59:32 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 00:59:31 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 00:59:30 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jpb@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <catalin.marinas@arm.com>,
	<praan@google.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<xueshuai@linux.alibaba.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <mshavit@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <peterz@infradead.org>
Subject: [PATCH v13 1/8] iommu/arm-smmu-v3: Add a missing dma_wmb() for hitless STE update
Date: Tue, 17 Mar 2026 00:59:16 -0700
Message-ID: <131b813acdfac4db4587538530a877358e634a2a.1773733797.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773733797.git.nicolinc@nvidia.com>
References: <cover.1773733797.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DS5PPFFF21E27DC:EE_
X-MS-Office365-Filtering-Correlation-Id: ec80fa0c-f0e4-4f16-ff01-08de83fb2773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: MCy1Xe4J0MpeOuaZTo3sS5N8+1FtMdGNxtKgKaU9pi+hJFH7oq/7Kj0IZhOQQJEspY5z5DyjOatJQ5zHlvNEkXAT+3BcOI5eIBVT7BBQ07pA/jZJ6hMTdPhkeHIO3sYMWwUaWBBmXOwQ8EECrcPi7EpNm5t3HnDkCpAAhKZCXBikIRRMPSiupnHBqLmTqHEDdxsP/nRvyAAh29hY6yCXdDL3bqKf1B+J+7a+wfOPOKQ7/UVew/UPQdh6ZIxF+tRS7t1FuHhEKs93s39ImJQ7lejsw7TSrMl5mOndrD5QU7VvwGDxxAabTHpFB+q35UK+2C0p/7s7uDdpChVzrZfSHcruFL1RL0dF2DOI4mWeELqpqHayjKbcWdAw9UQPrCcxE0fMtkVRfwkiQA7JHIheH/g/5Mk88OH4bMmdRYRM6+o1KrxDBxESxT9XAtrPNZyIGVsLvVc8RWaPlp/XD0X8E1buRZ7D6OIP2IM4t0z5KvHpULdWwibC50d6t/0YlMqVeXQysabU2ANwtP3AXb5EdIiIUwYf1D17dOtg4IDa/sCPpHslfkDYXBr4KwFqNhb9JXaYYkW12zfgTCIDbEkOmFJ5pwjXdsGBWyGIvmWY0BFeJtKxkaP4XriGFsM7s9AUT2Hlw+I7d9PeJfWimujGkkVK6ozgHwXFaKcDT3JuXb+A+PXN5ZNlkhds7ZrESqxTRIncOW47xGXuozyL0cBpgKSGuaJO2vG6IwDvOVZtnU6UtWTQZoe8jxFLDiHZzelzwH3WcfukQFYmZPjEo94/GQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4Hug8Lb50fgYdwgtHeua7gsyj5x9zGSPtIgKOrDHJag4h9hd49EroosT8k8vvKHTuPeTH+T6QxyCHK71aDjkjIW06c8c0EJMrpI0DziuXaOP0mF3EVkHZM+lFuLA0Pc3ybyIWc6v/NCpZR5j0Yw+HPqOemUJsbml82K5gBQ67NW0luq3Bjodh6KWjDvvBZUb7gWRmbgl2GSl2mK5gmmPqYnGR9AwkuLF2CDUbYICeGLaGs9BAfRvyNqO4my+QJ9JzFm/XpP0KMAYKXoUAE200sqrWUrRDBuYRIzFkYfB28+Icu7hJHGAWipFDg5A0PFVJ3O+7EVLrm/yXMt7QQ17c6nX+pCCxRljO7Pqq95mSOY+FyIySr4se0lOwd+lqnNmn0kNrAueh1dZheGfeMt0aXUhRxwyB/DU+s8bIU9qHaVqu9qU+uj/ngfGmpF5av7p
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:59:45.4862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec80fa0c-f0e4-4f16-ff01-08de83fb2773
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFFF21E27DC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_005953_520124_1FBCDE95 
X-CRM114-Status: GOOD (  12.22  )
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

When writing a new (previously invalid) valid IOPTE to a page table, then
installing the page table into an STE hitlesslessly (e.g. in S2TTB field),
there is a window before an STE invalidation, where the page-table may be
accessed by SMMU but the new IOPTE is still siting in the CPU cache.

This could occur when we allocate an iommu_domain and immediately install
it hitlessly, while there would be no dma_wmb() for the page table memory
prior to the earliest point of HW reading the STE.

Fix it by adding a dma_wmb() prior to updating the STE.

Fixes: 56e1a4cc2588 ("iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry")
Cc: stable@vger.kernel.org
Reported-by: Will Deacon <will@kernel.org>
Closes: https://lore.kernel.org/linux-iommu/aXdlnLLFUBwjT0V5@willie-the-truck/
Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d00d796f0783..606abe051e68b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1236,6 +1236,13 @@ void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *entry,
 	__le64 unused_update[NUM_ENTRY_QWORDS];
 	u8 used_qword_diff;
 
+	/*
+	 * Many of the entry structures have pointers to other structures that
+	 * need to have their updates be visible before any writes of the entry
+	 * happen.
+	 */
+	dma_wmb();
+
 	used_qword_diff =
 		arm_smmu_entry_qword_diff(writer, entry, target, unused_update);
 	if (hweight8(used_qword_diff) == 1) {
-- 
2.43.0


