Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939CAE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nUTvbLqFG3P5dqEXf9s+/gQtk4LElMRnbl9rdSZqyg=; b=CMq3SVgihvh+GHEUfyqp6JTbkq
	QgGH1WdVOR0R4XM9QGw+SwNz8UpwhmIZLLXTCIotas+cNcwkTfYfPMSdUAL2hvyfS70t7RQ9Xcu4D
	wJSqXlconig+4YdYcpB+0Ee1Qka6nZ90w5ZhljwCmL4vBUdN+v57mZ/kCrni21HjF0EKLDBJVgYRF
	guZuJF8lRn0FpAsaVULNgu6WzuNuiZoKU+fLIaclCdoV1fwfyv54WRUoFItFray0TTc6xSzRYkphM
	VSCiHUCf73f10s7QOAmyITMmwE+CWaDbuFu+WI/TFRpLLdJKQRJ+XN62BrRzbmZK5Wiv9PhJGV9r0
	Noi4vAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJE2w-0000000GcDp-31Wc;
	Thu, 05 Dec 2024 15:45:42 +0000
Received: from mail-dm6nam04on2061b.outbound.protection.outlook.com ([2a01:111:f403:2409::61b] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJE0w-0000000GbZZ-1QPu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:43:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD889nzeQp3MyjCmWvcl0DgX7OKwA1/zD3JXMWR0QYPFboLIQcNWl2walB94boQbyh32v5+jk8j19UQ+3YSRbUTrjpu8gZ30SwDwh8j56vhxC9cP5UjG7sorSE6Lah+Hhwh6xl5ab1hs0WZYpn616l0pNP+6hpEQHvxn5RvtzIVat2EQaJuCYi/HTUcWIhbYn/3H4nPLY7HQRZHeJ98CsAcB96SFtdxWtJ3MpWIUjNQPCXEiPWpPSW/ah1hNr5Q00Z7EAvEJWHVgMiIF78U+zjY6vDfjAJucT1fFbk6v8d773N7ecH2P7vZZ09wltDZMlXffClxkRHbTOUPhf5m2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nUTvbLqFG3P5dqEXf9s+/gQtk4LElMRnbl9rdSZqyg=;
 b=ZhaQeoRPDK049t5MJtqZlqnzVUJhbZucAtLyecURH281e8DAlODipHStS8/JLmgTWa9jyGcKvHFP1wssVafyC7cWG2xL8HLhm9/iQHD/3CnT1umhM9OniSTmml/OprcVdpenJmqLmv7Z+T7vhv17Zjxs9wCe/IaJg3zsYx8vANraBrgoS65GHvR750k9b5H2QGfQAmopPB7ySKvpwA+1OMXk0ilOrfnGhCESjMUzDN6hDBFZLHKR/jYnWvI9ICYTVWuTZi50PqOEZtDnvBh5zM0D8IN1y1p+2VqEmm8FwP0ljhC/KiX7LS62A1KZ61pLRoO2I7TlMqWidPFOf5xhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nUTvbLqFG3P5dqEXf9s+/gQtk4LElMRnbl9rdSZqyg=;
 b=EroYZC6fAPmi3WIj2j7LEVreqP4z1G3kcX9au8wBazw69NmkSIsPDwV9OAo3K9ubXxAA4aMbcFgQ3AX3KdoYuaKwx3fQNBOBUD6OhlmLaRp19+cETdFnOMm59fUT5GwL180cEbBL7iq8TFUnf+SnqFQgR7BRn+X0Ces9z6mb96lIBpWb8FctHw7LHleVAU2YS/k/aNBGSRZD2v0/Ucx0GxSfYq3TPGeFcEN1JVMj1zYl9vRuSlPHODxSZ+Z9vLDE6iu2vWsrtp1kPYZPJYgeKDuwBoEbMdCEYPmdPQqegMdeA0dW9WQNSrbMr8nBrB2ArpXjjGXrUy8cKEq9tz0GHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 15:43:32 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 15:43:32 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: patches@lists.linux.dev
Subject: [PATCH 2/3] iommu/arm-smmu-v3: Make domain_alloc_paging_flags() directly determine the S1/S2
Date: Thu,  5 Dec 2024 11:43:28 -0400
Message-ID: <2-v1-0bb8d5313a27+27b-smmuv3_paging_flags_jgg@nvidia.com>
In-Reply-To: <0-v1-0bb8d5313a27+27b-smmuv3_paging_flags_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:208:32d::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: ef08b2b4-7366-4507-d776-08dd154391bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C+BH2UvTSdk71V9zAANcybP/S9YNmnhp5ewKV6b7EFKCpoF7EKk/rJlOnwDq?=
 =?us-ascii?Q?/johlL669mVh8zXHtZfB7wJjD4kH1IeX7zqKCRzQnj+lqfBpTFOCXrjV2G8t?=
 =?us-ascii?Q?oS3fiVZs0MzF149ZbYDvmFsYpi+7v71kqwQVkXSELw9cEhVuqfjl6EuVQM7t?=
 =?us-ascii?Q?ljNKucRgYPorlsUfXd2+oF8ft6n6+Nn6G7698MNP0ITfmfMdq+wvnSgbrbi2?=
 =?us-ascii?Q?A+iQlvNttgsV+HB3GKeaqfYnAaWdIAB0ihqk1srXI4lJojb/Us4QzTzT36bH?=
 =?us-ascii?Q?qBBFj6ExXf4uzVUwkTt+5bUhFegI77d67FAELafsQ589t0pdEOFruyOoGAE3?=
 =?us-ascii?Q?5R1hLGJ7Ynyk1iIvjLWS9mLisuFlz1pEYx9Esx7Iu2Wx1OZJ4/6+qejJOy4V?=
 =?us-ascii?Q?Hj86JUPvw4XAXPpyvHJX69ghFt856a6zLiXgUOEdYf/BwIb6uFwvkW8DrglH?=
 =?us-ascii?Q?WUPFiP+G8n3V92wGpiXFZYK6Qd0Zs69ahqtms+WYgCVHPMZpHdDOMgMhol0H?=
 =?us-ascii?Q?cR8wypx6QmmZcb7tGE/oDDJ5uflnIpT63rs2FoSK3RyyUNNtyW5T8aosLAeU?=
 =?us-ascii?Q?udCqfF2Q947uKMe5mgDd51gxLvc/qXCdH0tlucadlYm+hctx5vWpnXf5Jw0H?=
 =?us-ascii?Q?kPS6v0XU4rRbYrZkOom3DxuZUdJCwzQa+FlqPbJBq3fRuEUusTH2ocWR6wHx?=
 =?us-ascii?Q?z1yE+7+wK/rzErPd/9eLgeYYVHjLpKHRwA6WfaEMbENdxLaXgX2JRnvzpFsX?=
 =?us-ascii?Q?Zzg5imjpjGQebOx8ru3yeZkgdxXpYsWl5PgM2BJ7H5tZ8wLqWQdRPZ2aka0D?=
 =?us-ascii?Q?79yCb07JC19tn+Znso/hR73a0XWbSdPvYX0/xAobEBKpwECvvjbzUx9RziA2?=
 =?us-ascii?Q?g7YyMkdq6gD6cDxC3knMsijubapVTEooaTjkqpDEvSd/YbsTUd4TjYdXJrJs?=
 =?us-ascii?Q?NjBnRBOJ1iRkkl8y5vbXk06PLqWrmWn5z5CFrg6dbvjNlAZWJJqhmwpvQhKz?=
 =?us-ascii?Q?eJbkc1Y/lVV0BdUGgIaVZWf1OANGv7atM1AEEnnRd3er8+V+BcPVBLxMSDxi?=
 =?us-ascii?Q?zCDoRVaDlFsrgP8iEx8MxL+MPaBhlNtB4nlydVFVSVS4Js5a0T3DtjBBn0u2?=
 =?us-ascii?Q?OcVYHTK8JCT6fMBLc9xlBb7cWmoI0Ug0wD1GMay+eo/5zU5hk62FOsil/Bae?=
 =?us-ascii?Q?rq0XyvUG/MNDjFBrQLYvSLhipbL3/p8NUl4q1XOatSJhV0hiuuYeZmqFhJCP?=
 =?us-ascii?Q?iDu5GmYXV2FXogc6hZg1m5D7nm0SYr8Az3yoG+a0BmqQZWhA1x2mXUSXo/Nj?=
 =?us-ascii?Q?wpPc1g7N7LC3lMIPHVQkxb47n1r/6RmBCjo8cxAo1Znyag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?njWtRJarMqd8VzsH3RZV2YEPgwOH8DLxHlla8N/adiUlz+fyjLhGXghKIbEZ?=
 =?us-ascii?Q?IYANMVaGVCs3XQUP4ydvUhL9pqaKLVqQGna4EAD00dhzP5+sGJP70GchcqH8?=
 =?us-ascii?Q?xYVek582NCdIlsrTPt7d2xiAVnL4BOCV/6O7dO09OfJ1IOqpyaygEZG3NiPN?=
 =?us-ascii?Q?YwvIt8fe97uHyj7untrCyKYIAM3OZmi440z1EiP/iZOFePNAC7BlmEzjSyxD?=
 =?us-ascii?Q?Ic3LuBexmR1+96YUOJ+HO7yGmRspFbv/uXXU06Ukbkq5wGjG6/9II3Z/k7ck?=
 =?us-ascii?Q?DP60d9rXLATBXFBQvwmUB/SdGPxNjXpDbguNqkXO6h/pej1ah4N2Qa/73f7c?=
 =?us-ascii?Q?VU0mhbZfEuBTYJ5bJy7SOsf7F1AoWMfo0QFzKaR3iq0pLFkcq9rPCn5aYyFo?=
 =?us-ascii?Q?mBeTE3X28hG8fa0GcdDYcnWJP39bdED05kdAmEnw/LMpj/mTvdC9nnaQfdJf?=
 =?us-ascii?Q?M2Lhw8Df9dgojoZvEgVhzH0RbasRqCwXp1woHckuUjXmE9JaSdoUgtjPQzvs?=
 =?us-ascii?Q?BGFDr82XKHQx83DqBdahi5yMlO5UIw9kizrPGxt1oaNmQIQDA86FWn3gh0po?=
 =?us-ascii?Q?Ki4yiZPd3q8OgopTr/7+cCaltlytb9Ez0SA8y/LqaAoxUXJowuaTjoI2sDgh?=
 =?us-ascii?Q?bj0a7VErhDFyyvI1IOoIfeoeRlI9jEGiLLWIL+B+W2jlYJkoV5gFfpNIj4f3?=
 =?us-ascii?Q?RIiorSCvoRV59V2Zh4L2IpBsrgUbt+RqEi/qQuu9unhe1V1mnl6MUU/ikzpV?=
 =?us-ascii?Q?c+ofUHnHrjtm+s/q0haVsbrKE+/QGnKjw/+S9I/AAZ4OQu2SBb8WeFiOpZmL?=
 =?us-ascii?Q?rVbBPBFJMxnl3VQGPVlGP7orl9ZTCDj7tfijgKwuvp0XQVwGSFfePd8FHlXF?=
 =?us-ascii?Q?ji+gH77V1gnQFGccYRYgC5ZAxNb0cZP01OLBorl1yb9EyEzHmNVo3cuHFA8/?=
 =?us-ascii?Q?nB06NZDgl5wzsPKFfgZ4ZNB+9OD4T7qDhI5W6ca4XRnZsz3t3vT4RyIfWxSH?=
 =?us-ascii?Q?TkKTSgEusVwshKNy3OKT4T8/RcfT6nFEp9qTWWpG4p1vDIuE01a+ceor0uzf?=
 =?us-ascii?Q?6yKjZXQzrqG32NJ3A3O9aYHWDoEa+hNeTm97yPgOKNMJIM6r/UbmeCfrNhNB?=
 =?us-ascii?Q?9O8uoMR0fr1sFkK/9EiHmVAGbVFNYdHsAx++fhorTg9DXFIIxVF195behmX9?=
 =?us-ascii?Q?FAc1TmWZn3d9vjHBp3OCxfYg9q2wffuoJMy+oVveep9xBot1zqAL+O6CSM5n?=
 =?us-ascii?Q?m2PIxhp//uKv8vPMFToAZqy563ZpdVFlKk4vopfSmH9B1BDK90ggS00FvTxd?=
 =?us-ascii?Q?SaZoe58AWvxVX3H9gCIzzXhrdnXkkJMkGvWwdFXZ3tXsHaWZfQJ5kvZ3igJ9?=
 =?us-ascii?Q?0Kd7b8YiMK1GXC4i/uzcHjAQ8Gm694laDzMFAE4+LByLXp6IrNsPwMgcw8OX?=
 =?us-ascii?Q?ql9WBwwlJGGaqQ/7fvhO3YiM7t1kA2xRQ5miaRw/U4dbHBmUBxqfnE6fofIc?=
 =?us-ascii?Q?lMPDpCEA7v1XrFNcq7l2PSUE7YJR3Gax+R/0eyFSlosLPCQKD8RAsQoIJObn?=
 =?us-ascii?Q?J2h0YmDoOPc/AQtS/yMYr9QCIMJR7PFgF5QYDdKb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef08b2b4-7366-4507-d776-08dd154391bc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 15:43:31.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrAWvwRCpAOQNq3dgBCyV1qrOtFpwsAWF0gTety/hqlgL86QS3vUnKQefk6mOTT2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_074338_381745_04B0DC36 
X-CRM114-Status: GOOD (  15.20  )
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

The selection of S1/S2 is a bit indirect today, make
domain_alloc_paging_flags() directly decode the flags and select the
correct S1/S2 type.

Directly reject flag combinations the HW doesn't support when processing
the flags.

Fix missing rejection of some flag combinations that are not supported
today (ie NEST_PARENT | DIRTY_TRACKING) by using a switch statement to
list out exactly the combinations that are currently supported.

Move the determination of the stage out of arm_smmu_domain_finalise() and
into both callers. As today the default stage is S1 if supported in HW.

This makes arm_smmu_domain_alloc_paging_flags() self contained and no
longer calling arm_smmu_domain_alloc_paging().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 42 +++++++++++++++------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e62c8d0f47a903..00105ccadc8b2b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2374,6 +2374,11 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 	if (IS_ERR(smmu_domain))
 		return ERR_CAST(smmu_domain);
 
+	if (master->smmu->features & ARM_SMMU_FEAT_TRANS_S1)
+		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
+	else
+		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
+
 	ret = arm_smmu_domain_finalise(smmu_domain, master->smmu, 0);
 	if (ret) {
 		kfree(smmu_domain);
@@ -2447,12 +2452,6 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 				 struct arm_smmu_domain *smmu_domain);
 	bool enable_dirty = flags & IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
 
-	/* Restrict the stage to what we can actually support */
-	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
-		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
-	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
-		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
-
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
 		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
@@ -3124,6 +3123,7 @@ arm_smmu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 				   const struct iommu_user_data *user_data)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
 	const u32 PAGING_FLAGS = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
 				 IOMMU_HWPT_ALLOC_PASID |
 				 IOMMU_HWPT_ALLOC_NEST_PARENT;
@@ -3135,25 +3135,43 @@ arm_smmu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 	if (user_data)
 		return ERR_PTR(-EOPNOTSUPP);
 
-	if (flags & IOMMU_HWPT_ALLOC_PASID)
-		return arm_smmu_domain_alloc_paging(dev);
-
 	smmu_domain = arm_smmu_domain_alloc();
 	if (IS_ERR(smmu_domain))
 		return ERR_CAST(smmu_domain);
 
-	if (flags & IOMMU_HWPT_ALLOC_NEST_PARENT) {
-		if (!(master->smmu->features & ARM_SMMU_FEAT_NESTING)) {
+	switch (flags) {
+	case 0:
+		/* Prefer S1 if available */
+		if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
+			smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
+		else
+			smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
+		break;
+	case IOMMU_HWPT_ALLOC_NEST_PARENT:
+		if (!(smmu->features & ARM_SMMU_FEAT_NESTING)) {
 			ret = -EOPNOTSUPP;
 			goto err_free;
 		}
 		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
 		smmu_domain->nest_parent = true;
+		break;
+	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING:
+	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING | IOMMU_HWPT_ALLOC_PASID:
+	case IOMMU_HWPT_ALLOC_PASID:
+		if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1)) {
+			ret = -EOPNOTSUPP;
+			goto err_free;
+		}
+		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		goto err_free;
 	}
 
 	smmu_domain->domain.type = IOMMU_DOMAIN_UNMANAGED;
 	smmu_domain->domain.ops = arm_smmu_ops.default_domain_ops;
-	ret = arm_smmu_domain_finalise(smmu_domain, master->smmu, flags);
+	ret = arm_smmu_domain_finalise(smmu_domain, smmu, flags);
 	if (ret)
 		goto err_free;
 	return &smmu_domain->domain;
-- 
2.43.0


