Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D76C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WXZFRxNZDWtpz5rrPKd+TWEe9fkTrsRhSTnFfePf3g=; b=bTXMiseADzEGl4xosp4WBijhMG
	iu2QldsfeFfXqNp4rttC1fnnq/1T1LXqlw1U1hPpOiQHf5gy2ksI9nKuCkrr5cLDQwdCIKme0YGzf
	bHMHza9qDoKXwbvZrlHGBztY9X95rlKFuuVJ0BuTCfSkhhoB6xUrFtywbtM00/T2g5cM67Q7rNKUo
	DCaFagaF07o17A4R2DIL0XD9dQFK7st3xk78u1NGafuVkBU48PPOZ7qYmVua3Ny8VZJ9Qj/IV9+8s
	bn40wX8Quly7kSrmE8r/MCDTGtgqe5+nCbfTUMoUBZio7cJMqRnhBo0df1Z5+KY2m/K/YaIgxgKCv
	has9K+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhKp-00000004TSY-3Rwc;
	Wed, 05 Aug 2026 19:31:27 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhKn-00000004TPY-1uUl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxGgkBzdHea1IHuxpcOJMvvzVSyEaNYTnv90DT68UqToXLuxaAhK4cjeGY04dAISghBCiZwoNcorTmMsnEZlI20Q8fDiIw5yD9I9kWOiaJ+kppEtNDERe9fglU6RRfRaM5BikcQ06Ciig0Lfkw31KyGWftOgYq6/8tprCQm1RR4j53aN/JjYp8159tTDGkGeVAd0zpPD14oqfeFTqTrx7184dmKE2U6p+Ialrs0vx8UKrvLOCHM7QcrQQnwpgzsHBNQPCgOqHSpXslahQEGapsGQZJ7rE9UMil6JqREnVJCqtWqrPJ37j0+Q+GvxyEPTp4vYBVxmE2i2/y18rBL6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WXZFRxNZDWtpz5rrPKd+TWEe9fkTrsRhSTnFfePf3g=;
 b=sUpqeluRT0+eB7Uqq/zyzR1OJhxRFOZwDbrbPOhMB+qg9LbGB2eizykRTcP9zT4Me3F8tr9bTvjcV8Y9UkvAE+rHtkhJWD1g5xYlaDvSowHcPUiA35ixe0Oo9kTbs9vtBmlXt2BPtvlEJZhQNJd5kKJ3oUjDaJe9sikXNFsRGEg4Mg9gD6D2/O8hfhmr/dISXlHmLhnTA7LsMy+Y9XcmhTT6YTjaLoC0QUGb9++vq7xOBv3ggVU5mQqirgE+y+CjxkcuPw1cSobJl7SiNEAJ8SWr6TTb8wVb3oJVe2ubcEUmoAbI3bm91YgTkFMyaTOPVD+HSmXQwAQn2pK9WGDL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WXZFRxNZDWtpz5rrPKd+TWEe9fkTrsRhSTnFfePf3g=;
 b=tb5rwOnFtNBgLt1VB8JMmLcxDFz1Ff8WPk37zndJemSuYIh5FNK67ajxsPeJn/231LGQVIXzeMB1pwYh5KXFaVstDTZbY64R5AJUGQGD0QarL7cvl3GcoSdmHJRu7XPuZvy43cZBhG/7dDBQ9VapYfFO2Ykp6/EHmSFU/DAM09lVAdRrEuboDPrZXCm5Y7LqW4zyYQFf/dTjT16Oja1GsNQ73xmHVMfI8pqiXGgWnySEkGvCez+sOjgh8RRluTm8v2JlYc0afbn86USJDoM/eJyZnl3GNgw+j490l/E2vpimpcFJs5uyAScVeHnhbP24kJlJJakfG6aEoL4tsGZ0Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY1PR12MB9601.namprd12.prod.outlook.com (2603:10b6:930:107::16)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Wed, 5 Aug
 2026 19:15:30 +0000
Received: from CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3]) by CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3%4]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 19:15:30 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v4 1/8] iommu/arm-smmu-v3: Pass the parameters for the invalidation in a struct
Date: Wed,  5 Aug 2026 16:15:19 -0300
Message-ID: <1-v4-1802653d8886+492-smmu_tlbi_jgg@nvidia.com>
In-Reply-To: <0-v4-1802653d8886+492-smmu_tlbi_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4P288CA0057.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::14) To CY1PR12MB9601.namprd12.prod.outlook.com
 (2603:10b6:930:107::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9601:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: aab02282-d998-4bd9-022f-08def325e970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: sJPu93fVCbjaV0N8mRhRZWWvq6LhqCSt4VXwgyVuRyG++Uib4ksAyOOatiJsQPuSN+7dT7bDQT1OCdsdgmdRGaR6Bt/AgCE0OVqmTe+TZ6gv29gNKtYkygqrh80vgj5YjuJlrs+i9pdSPBJqYvsjKRC8sy3ORvCn0ZXjKiDfGVeafTDm9DpblUiaLtsBTMVXJzVpYH5FzHjCo1kYXNL8wAdCM+CMInLIC+qgY9Z4LZ9t65qi+H1yZ808bI8fzk8QeehfQewlYaT1EBoc3ZuiDJAViFWgUiMo3IvAwoOOMNR7JSLJMJvkUgwHOzkkwQWvKm/tdA1Kp0d5rv8dzh6PZzm3F31sT30veMHur7QAuAn8dWEws6ye+c5vdib8wqMvhPNLfw0qStT11/BO7PtgJ9/cE3Q9R3ThAN1/WjmPSiwAv7NNIj7TXw6s7DAS4CYvD3nVxVcFZYAr9So6K3qQyPSLBRDORoh9R7gK5AX14eQ+w/HsxmZl6OkaYg6YNww+nM6fPsEwPT5syv2jPcQ3g0cMwB6/DHafck8ov810hun7xJzz83AXHoi01YyF9PeyD2dP5iZFTxkwjObT56gfBv8SBTmKV520JcUwWotG7QNE2KOTvBJhIHcHji8csGzoWn+J7pioFIfq9hPErWiC5oGXY8ijVJ41kWoCJNHEz1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9601.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WQpymaV3+wxY3LesTFvf4R8wjiTvs35x2Set72mM6KGBHj1YuSwQVDxGlwHC?=
 =?us-ascii?Q?9FPQ8fcFDQFzxNG6en1fzGCDJpbRVxQiroru+2XN9/eIxOYrrThlmufv2dHo?=
 =?us-ascii?Q?p6LLyOb1ruS3EsIcNK02UgCwPibpDzpFthagVJAchPlBRUUK8GFfsXRmSp62?=
 =?us-ascii?Q?N1OoJogFYxL3rJNtxKek7/AAulrLjhnFYRi82JF3YSmN10gHd0lciM6u49pO?=
 =?us-ascii?Q?rVsPcZErm3D5TiSJ+u2JmGOjQHLg8JwI1+50sEqS6+oYgYiX3PHlwDwMELTQ?=
 =?us-ascii?Q?OOt7Tmb2DzeRkB3SML23PcHmC0MRgtFwigCopkDs+5vcllVoY2R7Jokk+IaW?=
 =?us-ascii?Q?bzvPEmh61oYR79K/6zCsMtJOVTo79MYPrC/XvAK53j6aybBWZaCGmHTnTLMa?=
 =?us-ascii?Q?/TZWVKvc5v4upLGS3hMiSxPQ/IX65bLoROUZ5NLADYBdAf/A1UK2/N6r4Vk7?=
 =?us-ascii?Q?90UEHCSxG1WZL6Ps8br8VhG67Su1vYwY3cd9lU7q6UFXk362eiuNpihbTbMa?=
 =?us-ascii?Q?PgSsyKh+qvhv7ccg7e4UQY7K8JtydghBFEZ3NZ6MCE3/GEgIY1lDPAhIsYjO?=
 =?us-ascii?Q?54OhHy3WTWC7/efwYqDtDlGW2tPY4Du3YcvNe08IxwhCJyqH2jtMzN3KEZ2k?=
 =?us-ascii?Q?qbJPZjb8YTOow/inX933HdG6v3k8mWKGwhLW3uqCdVW6GIJeluTn85CgUhww?=
 =?us-ascii?Q?Qim5OnfPQVtPMQd2VFlZcUGA/cRAdX4dnvDtxjsbtG4nioWGmWYGTAnGyRew?=
 =?us-ascii?Q?d8+FBkbY5lnw417tnhfyYHYAEvP09q7X2w24cSf8wwvTRb8OriGYnw32cr6M?=
 =?us-ascii?Q?Jd8ML7ofXfEXAP70KabPZL7fkAY7B09NWUpXZ8xsFlv+UueCpYRT5QqLVKQT?=
 =?us-ascii?Q?/oebC5DjqtgQBZdH4OppYkK1BuLs4zy2LgsEFBTbx2+OK/kkbDpu3q+Wdakc?=
 =?us-ascii?Q?8jf2hRYVdyxIDLIvSUDMu/yE+1INehMVIzNtflTLCu+txzMCJvPX3YXzGyyw?=
 =?us-ascii?Q?W3yAwDMNziWzyHsLVPfaSKK2gLpW8Fq4cQDQiC0xZ8oOvRBRovwQrStCFvyI?=
 =?us-ascii?Q?q7t0Bc/oNKO4YzX3O7hSk/GlDPOFk1Z8qpyrv+mRqlTzvJPZUtHwEZr6VjqJ?=
 =?us-ascii?Q?xOiUEgrC/D68AuJEfBcxiHrvp0ZgdvsvHkmL9XS96cbeCEz4iJr5PEqubu/g?=
 =?us-ascii?Q?C7zqT19Rrw0lSPdXcPJ0fdMowlx8L+4SlQH0XIjwMWa/DenEINbzbmPtciAY?=
 =?us-ascii?Q?BUwMn38SjKw5ZPyqxs8CSRVWW44wJ43SLXIFF+s3Djn2Aklws8VHSOyW9ePy?=
 =?us-ascii?Q?jCIR1bzSdFaBlQ0nU82RiBZ4cl2NwnJ7ZnDE9zvYiqndEK/RyCANFAwStgi1?=
 =?us-ascii?Q?v8MDkluF+6BaiPdRCozkxR3HC/YiwvaxMjBmRR1wfJTJ9Sg7DGz8W1Cab12K?=
 =?us-ascii?Q?rBPch2pgBkMvPnNIVy3H4m4Lur3a/2ZV62mggW4mhgPngN/NO+h9tKEul2jv?=
 =?us-ascii?Q?L+X8AHpMZphADIAA+QN8MyAC4q1wm9RKL3+v/1UFhQs4efIAtMYd146G5Oul?=
 =?us-ascii?Q?s49wrNkBc5cDt0aRxXT1QHPm2Gm72iKbuQUwsM2sUd9UqovqK1+w/HCV9Tcd?=
 =?us-ascii?Q?6bxHxxuJm8BwvHQYlwgy/Q9F4vRLeV7eFqH5Q36rXvRegNpFgEdyvdqbbFIK?=
 =?us-ascii?Q?tJ3zCdYP9tCRxPwP1Z7529pUXdDuUe8hIbZS2hgppuFcmq0Xx0Wi6iQDkJr6?=
 =?us-ascii?Q?6mCwT6nDFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab02282-d998-4bd9-022f-08def325e970
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 19:15:29.2417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VE+1sXS+jPrZ8+4GvpjBqInavxhXGXBWjj+PB1EwrxcO9kp7YJSiguVad3Usc96k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_123125_517745_CA6F945D 
X-CRM114-Status: GOOD (  17.70  )
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

These parameters go to a lot of different functions and the next
patches will add more. Put them into a struct to keep things tidy.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 75 +++++++++++----------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  8 +++
 2 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2587c33c778fa2..f24138be6448d3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2363,8 +2363,8 @@ static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
 	return IRQ_WAKE_THREAD;
 }
 
-static struct arm_smmu_cmd
-arm_smmu_atc_inv_to_cmd(u32 sid, int ssid, unsigned long iova, size_t size)
+static struct arm_smmu_cmd arm_smmu_atc_inv_to_cmd(u32 sid, int ssid,
+						   struct arm_smmu_tlbi *tlbi)
 {
 	size_t log2_span;
 	size_t span_mask;
@@ -2386,8 +2386,8 @@ arm_smmu_atc_inv_to_cmd(u32 sid, int ssid, unsigned long iova, size_t size)
 	 * This has the unpleasant side-effect of invalidating all PASID-tagged
 	 * ATC entries within the address range.
 	 */
-	page_start	= iova >> inval_grain_shift;
-	page_end	= (iova + size - 1) >> inval_grain_shift;
+	page_start = tlbi->iova >> inval_grain_shift;
+	page_end = (tlbi->iova + tlbi->size - 1) >> inval_grain_shift;
 
 	/*
 	 * In an ATS Invalidate Request, the address must be aligned on the
@@ -2462,20 +2462,23 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 
 static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 					  struct arm_smmu_cmdq_batch *cmds,
-					  struct arm_smmu_cmd *cmd, bool leaf,
-					  unsigned long iova, size_t size,
-					  size_t granule, size_t pgsize)
+					  struct arm_smmu_cmd *cmd,
+					  struct arm_smmu_tlbi *tlbi,
+					  size_t pgsize)
 {
-	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
+	size_t inv_range = tlbi->iopte_size;
+	unsigned long iova = tlbi->iova;
+	unsigned long end = iova + tlbi->size;
+	unsigned long num_pages = 0;
+	unsigned int tg = pgsize;
 	u64 orig_data0 = cmd->data[0];
-	size_t inv_range = granule;
 	u8 ttl = 0, tg_enc = 0;
 
-	if (WARN_ON_ONCE(!size))
+	if (WARN_ON_ONCE(!tlbi->size))
 		return;
 
 	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-		num_pages = size >> tg;
+		num_pages = tlbi->size >> tg;
 
 		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
 		tg_enc = (tg - 10) / 2;
@@ -2488,8 +2491,8 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 		 * want to use a range command, so avoid the SVA corner case
 		 * where both scale and num could be 0 as well.
 		 */
-		if (leaf)
-			ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
+		if (tlbi->leaf_only)
+			ttl = 4 - ((ilog2(tlbi->iopte_size) - 3) / (tg - 3));
 		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
 			num_pages++;
 	}
@@ -2528,7 +2531,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 		 * command and something would be very broken if iova had them
 		 * set.
 		 */
-		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
+		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
 			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
 			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
 			       (iova & ~GENMASK_U64(11, 0));
@@ -2538,13 +2541,13 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 	}
 }
 
-static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
-				      size_t granule)
+static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu,
+				      struct arm_smmu_tlbi *tlbi)
 {
 	size_t max_tlbi_ops;
 
 	/* 0 size means invalidate all */
-	if (!size || size == SIZE_MAX)
+	if (!tlbi->size || tlbi->size == SIZE_MAX)
 		return true;
 
 	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV)
@@ -2557,19 +2560,17 @@ static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
 	 * invalidation feature, where there can be too many per-granule TLBIs,
 	 * resulting in a soft lockup.
 	 */
-	max_tlbi_ops = 1 << (ilog2(granule) - 3);
-	return size >= max_tlbi_ops * granule;
+	max_tlbi_ops = 1 << (ilog2(tlbi->iopte_size) - 3);
+	return tlbi->size >= max_tlbi_ops * tlbi->iopte_size;
 }
 
 /* Used by non INV_TYPE_ATS* invalidations */
 static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
 				       struct arm_smmu_cmdq_batch *cmds,
 				       struct arm_smmu_cmd *cmd,
-				       bool leaf,
-				       unsigned long iova, size_t size,
-				       unsigned int granule)
+				       struct arm_smmu_tlbi *tlbi)
 {
-	if (arm_smmu_inv_size_too_big(inv->smmu, size, granule)) {
+	if (arm_smmu_inv_size_too_big(inv->smmu, tlbi)) {
 		struct arm_smmu_cmd nsize_cmd = *cmd;
 
 		u64p_replace_bits(&nsize_cmd.data[0], inv->nsize_opcode,
@@ -2578,8 +2579,7 @@ static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
 		return;
 	}
 
-	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, leaf,
-				      iova, size, granule, inv->pgsize);
+	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi, inv->pgsize);
 }
 
 static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
@@ -2598,9 +2598,8 @@ static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
 	return false;
 }
 
-static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
-					unsigned long iova, size_t size,
-					unsigned int granule, bool leaf)
+static void __arm_smmu_domain_inv_range(struct arm_smmu_tlbi *tlbi,
+					struct arm_smmu_invs *invs)
 {
 	struct arm_smmu_cmdq_batch cmds = {};
 	struct arm_smmu_inv *cur;
@@ -2630,18 +2629,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 		case INV_TYPE_S1_ASID:
 			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
 						     cur->id, 0);
-			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
-						   iova, size, granule);
+			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, tlbi);
 			break;
 		case INV_TYPE_S2_VMID:
 			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
 						     0, cur->id);
-			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
-						   iova, size, granule);
+			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, tlbi);
 			break;
 		case INV_TYPE_S2_VMID_S1_CLEAR:
 			/* CMDQ_OP_TLBI_S12_VMALL already flushed S1 entries */
-			if (arm_smmu_inv_size_too_big(cur->smmu, size, granule))
+			if (arm_smmu_inv_size_too_big(cur->smmu, tlbi))
 				break;
 			arm_smmu_cmdq_batch_add_cmd(
 				smmu, &cmds,
@@ -2652,7 +2649,7 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 			arm_smmu_cmdq_batch_add_cmd(
 				smmu, &cmds,
 				arm_smmu_atc_inv_to_cmd(cur->id, cur->ssid,
-							iova, size));
+							tlbi));
 			break;
 		case INV_TYPE_ATS_FULL:
 			arm_smmu_cmdq_batch_add_cmd(
@@ -2683,6 +2680,12 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 			       unsigned long iova, size_t size,
 			       unsigned int granule, bool leaf)
 {
+	struct arm_smmu_tlbi tlbi = {
+		.iova = iova,
+		.size = size,
+		.iopte_size = granule,
+		.leaf_only = leaf,
+	};
 	struct arm_smmu_invs *invs;
 
 	/*
@@ -2723,10 +2726,10 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 		unsigned long flags;
 
 		read_lock_irqsave(&invs->rwlock, flags);
-		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
+		__arm_smmu_domain_inv_range(&tlbi, invs);
 		read_unlock_irqrestore(&invs->rwlock, flags);
 	} else {
-		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
+		__arm_smmu_domain_inv_range(&tlbi, invs);
 	}
 
 	rcu_read_unlock();
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 50f8321e979cef..0eb90c26ff8697 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -805,6 +805,14 @@ static inline struct arm_smmu_invs *arm_smmu_invs_alloc(size_t num_invs)
 	return new_invs;
 }
 
+struct arm_smmu_tlbi {
+	unsigned long iova;
+	size_t size;
+	/* page or block size of the leaf iopte */
+	unsigned int iopte_size;
+	bool leaf_only;
+};
+
 struct arm_smmu_evtq {
 	struct arm_smmu_queue		q;
 	struct iopf_queue		*iopf;
-- 
2.43.0


