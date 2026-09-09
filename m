Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABA0C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfPLC7LxBXIKu6UWINxUOnVCDA0QnDVHOnXDNiYPnMo=; b=u51q0oFoMumKhxTZhnD88JuRtT
	y54ORQ/8MLhobZJiNRbs5M/OC2Iq0xe9Oh3e5xlE/TssrkSKM9sgr1G5p0t4OvlHNQRfqdt/M4WNn
	ACLK205IVnItf6NRi/Pp4KCqA4DaArxJJQET1N2hY2vRUUYi4XlFDti6xNXjPczb5BXEdLGmhewC6
	0YHprfHGLFM/7BTGIYOVxcvTnuvCF9raBc75LZ6wFWpXFfqEg5SjN5HxMhWJF7V2+I3vsEoeOumhQ
	MBPttr6YPnB3MN0Su+U6VCUFoUM/SnzmUom2tyBFmYu2JnE3oLCpp91rL6o95sgOQGfog4kFG0CRj
	1hFB4ubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eyx-0000000BLtA-0b7c;
	Wed, 09 Sep 2026 09:52:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eyu-0000000BLsE-0AQP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:52:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 832A143ECD;
	Wed,  9 Sep 2026 09:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BA61F00A3E;
	Wed,  9 Sep 2026 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947559;
	bh=KfPLC7LxBXIKu6UWINxUOnVCDA0QnDVHOnXDNiYPnMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l9z+DEYMVyZnb2Ord1pSC6/PixM9Uz8Plel5S5wVeD+W/h9sM2h801RMLqGTe1afi
	 7yN+95fLXz+h6p/1U+Oa/G8by4ShwqN05n/AwsOyXkR7cej4pYBit6txqPGp/o5noV
	 ZvBvmeo/JtT514X6p4/BvWhQuNsxUCPgPR+wygvYWe8TCgqOzxzu+Pg/lhonMqsjtq
	 mof5/fC5XkSKOQUO28A96qf/wZ1JFDY4F1GpjQrwDa3VdIUNKO2gDzUq2ywSAObbsR
	 tXo/vkGAgkz8USbbdyc4eGVKfkZovJOmBH4IaW+ukeLavs90GA3bMv2gqjYfg3101w
	 rGHtOBWr135Ig==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 32406198004A;
	Wed,  9 Sep 2026 05:52:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 05:52:36 -0400
X-ME-Sender: <xms:Yiyhak90MH7QKBND8ayDwoNu-jM5sBJkc9f8STMQJq9Wg_Q7ZBGOvQ>
    <xme:Yiyhajrd1xI9dvaUqTx8Ug1dZCZ3BLKj-XDYEBbpZIO8s-i1bLIn1B5bmc-U9Q2kZ
    V4NsYQ43INjy9zfpcbNSog8_NZJ4qAXh24V5sZu-6qLYNZAztaOjUSc>
X-ME-Received: <xmr:YiyhavGfEua_YL161_V_sdGkNmleA7e_E8aMp0KemqgqD8ONS1hv0jaliQM>
X-ME-Proxy-Cause: dmFkZTGqeNOVVHZrbxQ4pggyppp6Q446EtpSKkEOhxGsdxSIWWadPbbCe9P9ko2LM+3G5i
    LCC/bHJYsM5wx7Wzra3uc3Z2RukncahX55jK4LZQI/Azcsh5PzILbwy7MHuIPpHJKb3HjG
    RlUys8DO29e7sNNEwOZLBHALD+HW6ooPeK0qhyj6qiTDfr8jBI19kob9WJlTpKjinkA+7C
    ZiJG5eNg01J5D46nUERTmNjFVyMadFMfsqDJiLrgA48S3vPJ2RzNbbp7IrlZuJ5xVfvbOD
    hniz43S1Y3GhAGvw+FQreqDMJch+uBuqH67F/BmbZt11Zt0rX4ijzwdI0dqyQ0ykG/mXJn
    NSpQEhII9YekrrsK1RWuiyAuz4OBkKGvB3d38laHf0D46Qbw3nxbroaiZS5G1ZfrhVhSae
    sCL8zjOz3J4HD1ZxyuqDfn4TqOOzoZWSruObuzSLBieEhICR/x7y5NoScitl6jJ1pVPOOo
    fW/qrxxMLGaLn+pi04kmgyza2mnA9OI/UIBtQ3GgQ4y0CIZ2ytBpcQd//PcU5oepQD8n8g
    dkiHidJynkuk4DQEUyT4wOB5zECEPyNXQ3vH8LwTxwSRRfjiDsO7VVKlP8CTpzWiyJRDXK
    PnBOw5MK1Ngm8lPf8WqjKrDtBUPLWj08vU55XD51Ol9PFf/W1ZAPpEcZwSlg
X-ME-Proxy: <xmx:YiyharnXgkZJPv_t8iGvEXoU2RoReUpeR9X-ySmEKovjPVxpnQUm7g>
    <xmx:Yiyhaj8Ecfo-qR_R-PiwZam8ubqzy0ag4hLBBDNZzn0Vria7kMHB4w>
    <xmx:YiyhaklA1TTcm9qgXdZqToj0_NyjPCN98VM1iWQrAKIxRzSlzQ_jfA>
    <xmx:Yiyhapk9Jtsd0PQWqWyeUiXCE7uSp7W62l3_m69lQ4tZmBbYLY7tCA>
    <xmx:Yiyhagv_rv33YLyU9u1orGNFYSX1fjX15itGrgXsSl0shvUlnQ4Rt6Ty>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 05:52:34 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v6 1/2] iommu/arm-smmu-v3: Add a cmdq_max_n_shift module parameter
Date: Wed,  9 Sep 2026 10:52:27 +0100
Message-ID: <20260909095228.2174031-2-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909095228.2174031-1-kas@kernel.org>
References: <20260909095228.2174031-1-kas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The command queue depth comes straight from the maximum the hardware
advertises in IDR1, which reaches megabytes of coherent DMA per queue.
A system with several SMMUv3 instances pays that per instance, and the
Tegra241 CMDQV pays it again for every VCMDQ it preallocates.

Queue depth only bounds how many commands may be in flight before a sync.
A machine driving a handful of devices, or one with a tight memory budget,
has no use for the maximum, and no way to say so.

Add cmdq_max_n_shift, a cap on the depth given as the log2 of the entry
count, the form the hardware itself takes in the LOG2SIZE field of
CMDQ_BASE. Decide the depth in arm_smmu_cmdq_max_n_shift(), which caps the
IDR1 value for natural alignment and then applies the parameter, so the
queue is allocated at the requested size. The Tegra241 CMDQV sizes its
VCMDQs from IDR1 itself, so route that through the same helper.

Floor the request at one page worth of entries. Without the floor, a small
request trips the CMDQ_BATCH_ENTRIES check in arm_smmu_device_hw_probe()
and the SMMU fails to probe. The floor also costs nothing: coherent DMA is
page granular, so a shallower queue occupies the same memory as one that
fills the page.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 43 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..78618a9dfa8b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -40,6 +40,11 @@ module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
 	"Disable MSI-based polling for CMD_SYNC completion.");
 
+static unsigned int cmdq_max_n_shift;
+module_param(cmdq_max_n_shift, uint, 0444);
+MODULE_PARM_DESC(cmdq_max_n_shift,
+	"Cap on the command queue depth, as log2 of the number of entries. Zero means the hardware maximum; the queue never shrinks below one page.");
+
 static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
@@ -4412,6 +4417,40 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
 };
 
 /* Probing and initialisation functions */
+
+/**
+ * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
+ * @ceiling: default log2 depth ceiling of the queue
+ * @ent_sz_shift: log2 of the queue entry size in bytes
+ * @shift: log2 depth asked for, or zero for the default
+ *
+ * @shift is floored at one page, because coherent DMA is page granular: a
+ * shallower queue occupies the same memory as one that fills the page, and
+ * arm_smmu_init_one_queue() stops shrinking at a page too.
+ */
+static u32 arm_smmu_queue_max_n_shift(u32 ceiling, u32 ent_sz_shift, u32 shift)
+{
+	u32 floor = PAGE_SHIFT - ent_sz_shift;
+
+	if (!shift)
+		return ceiling;
+
+	return min(ceiling, max(shift, floor));
+}
+
+/*
+ * Command queues are also allocated by the Tegra241 CMDQV for its VCMDQs, which
+ * need the same depth decision.
+ */
+u32 arm_smmu_cmdq_max_n_shift(u32 ceiling)
+{
+	/* Capped to ensure natural alignment */
+	ceiling = min(CMDQ_MAX_SZ_SHIFT, ceiling);
+
+	return arm_smmu_queue_max_n_shift(ceiling, CMDQ_ENT_SZ_SHIFT,
+					  cmdq_max_n_shift);
+}
+
 int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue *q, void __iomem *page,
 			    unsigned long prod_off, unsigned long cons_off,
@@ -5156,8 +5195,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
 	/* Queue sizes, capped to ensure natural alignment */
-	smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_CMDQS, reg));
+	smmu->cmdq.q.llq.max_n_shift =
+		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, reg));
 	if (smmu->cmdq.q.llq.max_n_shift <= ilog2(CMDQ_BATCH_ENTRIES)) {
 		/*
 		 * We don't support splitting up batches, so one batch of
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 50f8321e979c..11ae4d8f4ad2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1165,6 +1165,7 @@ static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
 
 void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
 			      struct arm_smmu_cmdq *cmdq);
+u32 arm_smmu_cmdq_max_n_shift(u32 ceiling);
 int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue *q, void __iomem *page,
 			    unsigned long prod_off, unsigned long cons_off,
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 6644075c1431..710a4c694b94 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -663,7 +663,7 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
 	/* Cap queue size to SMMU's IDR1.CMDQS and ensure natural alignment */
 	regval = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
 	q->llq.max_n_shift =
-		min_t(u32, CMDQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_CMDQS, regval));
+		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, regval));
 
 	/* Use the common helper to init the VCMDQ, and then... */
 	ret = arm_smmu_init_one_queue(smmu, q, vcmdq->page0,
-- 
2.54.0


