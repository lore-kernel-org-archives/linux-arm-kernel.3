Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96933C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqnIWeCAGaPUYlaZlk6L1OPF4VRf6Uq0c3BQIWypxoA=; b=d9M5+jDe6mv0onFIyqfg9ZugPl
	9BSLa87PLdK0PRuqoDpRYRlggI/jT4Gg7ni+z19hNuG3mIfrnxJmtKQVCFD1ORo9fx6Om0VVMwpRQ
	U854MxT1fJYqcshcQlervKFimti3oAIAeqnFtOFBUd4pK12z3pOLX/m0NsqQAL2ocMDC/AvIXmhiZ
	kkgq934RwkleAXS+prj5TBzpPNKMwStvhkXWhPk/zJ4nd+REtaivThZXiDyS3Xu0LRU9ukhuJbvDJ
	P7fwrO/+f/T1XiZq1xErNf6GUfIcI772zv/iknZAYuDJou6wTfqpCL7gzYy4fZDX2fAvq0RevdBTx
	3as0On3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7q-00000006PpE-0MA3;
	Mon, 07 Sep 2026 09:58:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7n-00000006Pn0-3oVm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D7CE60D89;
	Mon,  7 Sep 2026 09:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07231F00AC4;
	Mon,  7 Sep 2026 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775131;
	bh=BqnIWeCAGaPUYlaZlk6L1OPF4VRf6Uq0c3BQIWypxoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oMbfZ+DPKvFe0X8s6kwUNnC1NeJ1jwAr/6V+vXkcRc6iR7x+NpZqaVvLWw96+belB
	 +1NT+MlNFY9F+F4TFJodcW0Vps3xCgAQrem2VR+4RQ+1CCl0NQGUYtVV24rUAceM7A
	 5z2NXCRvdzJgG/ukEYj2t2Ch2sQeIz7D/qVIFXueH9TugVcJFzQXE7gD+hMAVM8IkA
	 WC3YXzZB1/+IjJhM3S8RCPGCJeXwX0nrmT0f3oceqgORqorfNE7mPsEYqbKjG38QE8
	 4CA0Tcoy+29jfOHozB1f0L+dk73F04dooIC0DAIT73xjINXKdlh9Xrdl3+PfB8SwFR
	 3QvtSHyQbnwHw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id EACA0198003A;
	Mon,  7 Sep 2026 05:58:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 07 Sep 2026 05:58:48 -0400
X-ME-Sender: <xms:1oqeanAtK-gOkFsE1aBfOLFFC9pXpzo0_Qe9O1FIZeZ2A1HjEHe2Bg>
    <xme:1oqeakdWWL0GWfydQXyrNBYjTLZ9S5v5kJOyUijVf5qRY4UXsG4_oXFB36xFhOnpI
    3d5KLWn_sjCO-JtAy5pjdKCbiSoU3utNwI86P_KdDsIif3_Y24RG4QG>
X-ME-Received: <xmr:1oqeanrYg8mzNtlwyuthz3qFkAU7LgF2mo4WD8PPxz6ZVWcKCtJ8S4_7QCI>
X-ME-Proxy-Cause: dmFkZTEfmTDj/r+7N3SoJC/vnCUjsKNijMe1VXFD0b88h55H2gBIFouQJkZSZK1yyk30Sm
    mIpo4+lqFBdKW9tiCpcqxnDvXOftY/uwGIbts6csXqNfxsNqOfnYnFu40A0wAOj35G9s+w
    IAMv9bbisiS7ei9Uc4aFfDLSUxZi6vkR+vpXkb8NeS63qvjIFlVzXVDhwHvtwaAOtbHyG2
    EUUfEj73JOAPxGIHZGnc8vHsjF2mphj6z1w+QhR+1XLYLXNDi1frGA6EeIrPkmhp8ZYVyp
    w0DvRbQmjeBcjm+uOYs5drfpJJgg1sHnCQ9G2soFC7z9xfrcgmKRrSpzbA16VZVaATLmjT
    G3X7mrluRu/OP7GWi6COueqWAS0H3GTAGJ/fm56NGzoGd7yk6zkLuzmNrmSMjr6442CP+y
    HnlPe3n8Xk+qYwbdJcNYCz0zhVGBp52fzd8usy6Fv9D8UkByjw9bqELipPUY49VIjGJE2y
    JcYI/8qNW7KnpCpfbw5A/XZmV7qwKjxVYos5Scwlkivj00woZwco40oiQ1DODWrecViyGZ
    ov5bIFs7u1nvBAMGn0nSs7osJZqBdFI2+Je/NL7bbI8gmBfKSV2p5aE0ilvuAaSk5uQcds
    Tvsfw7j9v1iyR6EXzbNGjAsmmJ+QAREUZ87tqDPg3s1zIjJQp39uQZ/tNe5A
X-ME-Proxy: <xmx:1oqeag4Az8IE3i1krUREylLDILUEbfW7dkcW1CaAGsjwR1DL-Ly7Sw>
    <xmx:1oqeanCOdjfvxxZvT36qwvehRFKmPrKF7gQvR3GoKQ-qrlDkWl_hmw>
    <xmx:1oqeaiYdhQ3Fxw6SiYkbkGC_fPKuSWHl02pJZCbdBTWCeKVMDB3F0g>
    <xmx:1oqearLVMWATyBz1DjlLACTAyFKCiDw1mxgsZSbfxI7njkhAQ7pv5g>
    <xmx:1oqearA3UfMNpPQTwLpiEqugOEzXKL3E_KY3Yt5Q3Fh4g57KL8KnO63f>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 05:58:45 -0400 (EDT)
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
Subject: [PATCH v5 2/2] iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel
Date: Mon,  7 Sep 2026 10:58:35 +0100
Message-ID: <20260907095835.1233352-3-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260907095835.1233352-1-kas@kernel.org>
References: <20260907095835.1233352-1-kas@kernel.org>
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

All three queues are sized from the maxima the hardware advertises in IDR1
and allocated at probe, up to 4 MB each on a 4K-page kernel. The capture
kernel already disables two of them: arm_smmu_device_reset() drops
CR0_EVTQEN and CR0_PRIQEN. It still allocates both at full size.

A kdump capture kernel runs from a small crashkernel reservation, and every
SMMUv3 instance pays that cost again, up to 12 MB apiece. It goes to queues
that either serve the handful of devices used to save the dump or are
switched off outright, and it is memory the dump itself needs.

Default all three depths to one page worth of entries when
is_kdump_kernel(). The queues carry commands and fault records rather than
DMA data, so dump throughput is unaffected. A shallower command queue only
bounds how many commands may be in flight before a sync, which does not
matter for the few devices that save the dump.

An explicit cmdq_max_entries still wins, so a capture kernel that wants a
deeper command queue can ask for one on the command line.

Suggested-by: Kyle McMartin <jkkm@meta.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Assisted-by: Claude-Code:claude-opus-5
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4550b1105e9c..67dca0cb487b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4424,6 +4424,9 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
  * @ent_sz_shift: log2 of the queue entry size in bytes
  * @entries: number of entries to cap the queue at, or zero for the default
  *
+ * The default is @ceiling, except in a kdump capture kernel, which defaults to
+ * one page worth of entries.
+ *
  * @entries is rounded down to a power of two and floored at one page, because
  * coherent DMA is page granular: a shallower queue occupies the same memory as
  * one that fills the page, and arm_smmu_init_one_queue() stops shrinking at a
@@ -4433,11 +4436,32 @@ static u32 arm_smmu_queue_max_n_shift(u32 ceiling, u32 ent_sz_shift,
 				      u32 entries)
 {
 	u32 floor = PAGE_SHIFT - ent_sz_shift;
+	u32 new_ceiling;
 
-	if (!entries)
+	if (entries)
+		new_ceiling = max(ilog2(entries), floor);
+	else if (is_kdump_kernel())
+		new_ceiling = floor;
+	else
 		return ceiling;
 
-	return min(ceiling, max(ilog2(entries), floor));
+	return min(ceiling, new_ceiling);
+}
+
+static inline u32 arm_smmu_evtq_max_n_shift(u32 ceiling)
+{
+	/* Capped to ensure natural alignment */
+	ceiling = min(EVTQ_MAX_SZ_SHIFT, ceiling);
+
+	return arm_smmu_queue_max_n_shift(ceiling, EVTQ_ENT_SZ_SHIFT, 0);
+}
+
+static inline u32 arm_smmu_priq_max_n_shift(u32 ceiling)
+{
+	/* Capped to ensure natural alignment */
+	ceiling = min(PRIQ_MAX_SZ_SHIFT, ceiling);
+
+	return arm_smmu_queue_max_n_shift(ceiling, PRIQ_ENT_SZ_SHIFT, 0);
 }
 
 /*
@@ -5196,7 +5220,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR1_ATTR_TYPES_OVR)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
-	/* Queue sizes, capped to ensure natural alignment */
 	smmu->cmdq.q.llq.max_n_shift =
 		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, reg));
 	if (smmu->cmdq.q.llq.max_n_shift <= ilog2(CMDQ_BATCH_ENTRIES)) {
@@ -5211,10 +5234,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		return -ENXIO;
 	}
 
-	smmu->evtq.q.llq.max_n_shift = min_t(u32, EVTQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_EVTQS, reg));
-	smmu->priq.q.llq.max_n_shift = min_t(u32, PRIQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_PRIQS, reg));
+	smmu->evtq.q.llq.max_n_shift =
+		arm_smmu_evtq_max_n_shift(FIELD_GET(IDR1_EVTQS, reg));
+	smmu->priq.q.llq.max_n_shift =
+		arm_smmu_priq_max_n_shift(FIELD_GET(IDR1_PRIQS, reg));
 
 	/* SID/SSID sizes */
 	smmu->ssid_bits = FIELD_GET(IDR1_SSIDSIZE, reg);
-- 
2.54.0


