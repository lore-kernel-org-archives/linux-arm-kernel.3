Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7ADC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSvNW4KC0jILNq7/I9jV1syURG3TP6r5qeySe9d+kW4=; b=mJUEF/veYUX7j+Ci/gT2S0rodM
	+rfJ2LOOZx0Z6gZ6DDaIGYOGd4OeVUVSUTLrr8XVzOysIHgBEyBNqgtwhChXBGlEAhXCpvNsV6PJn
	G8JIE26VxNeFx0YmXLakwnZ198SY2WHkM/jqV7jfT/r+6xGY4HS0x3VKaOwwYkNQZudBuR3DUSuh1
	1yAnmqyuB0JAOO17MDNSPiLdih42GY8GYGn0E1CqNTj+GmA82Wyo3l2vQ7bMQ+yv7Fqc9aK0bnhR7
	osMvlQpSAiAgIrz4SELomi8AWSlVT9VoZ3fI/djdzTfGhVzQiezt2dGCf+qhyJkMw4L00+Z2tGf9v
	o6zKUK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6iP-0000000DYWd-0SeJ;
	Fri, 25 Sep 2026 14:15:53 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6iG-0000000DYUF-00UL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:15:45 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 45CD11400168;
	Fri, 25 Sep 2026 10:15:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 25 Sep 2026 10:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790345743; x=
	1790432143; bh=CSvNW4KC0jILNq7/I9jV1syURG3TP6r5qeySe9d+kW4=; b=c
	FdcGhfGwM72PqbT32460E1BwZRiHfv+1as0xeCO1B/Fy/N7LzMTdM+cVxx9J45Eg
	jEuqzVEvOY4wPtxGp0IIICGUHaSUCeM0LJ/vfo+1tdpefCYiH+OPYJqFzW270vqW
	fKyA8fqpBoDEVCBkltQWYDKDdzbX5aWloaxDl5k0nn+acivm2VU+4O85Xddno9AY
	7SzdwXLzggobGf9KgvoJM8P5142wvO0WQO6L+4gYqcnLG3AWXLr9mKlwK53KmLB5
	3+h1pQbrnY5tNm/N4QpFfkqy/3SnR7WU2Y/fBuyGnNaK/juEgzGWV50diijgpIPs
	8mEWBmt1/k3Kwx2sAh8kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790345743; x=1790432143; bh=C
	SvNW4KC0jILNq7/I9jV1syURG3TP6r5qeySe9d+kW4=; b=bNGQDokDhYo6Wnzd8
	uepseBC5jEaPxcmj8Ao0GMXeC2B6v/V91MiewK1WkdgI7RxWtZiroqFd9sVPS81H
	9f2PkqvovHto+Ot/NdGfeKGePORDxB4uregYOb8eqmOS+NvuGYQdsd+CublMc/89
	zBqbk4fOXJCVIhXdN+c+VyVeDQJK4qYiwQlnGu+Xb0ZZlzf2eAarTmcmEwlSGbEH
	X8MxqGhmCr/tWXpLC9ILdsarPA7NYV4ic+rc/WMjd9XIkE22Km8wUth46A88j0/F
	kh7MjEUos0EthaZ4LnHACAWwFGZTKcszwxN3VH+n0e8ledtZfVJ8KdZgZZ16zSKp
	fw3xA==
X-ME-Sender: <xms:D4K2argky54Wp1LPE_AkPAmu4DhN2sozWwUFEw4VCb_C063vj4oIgg>
    <xme:D4K2alNJVJ9zpA_jR4lMG8FyHkGLqtG--L7BkUG-vpamnjf2m6ATnIeTGhgTBKn3a
    OWoAVj2vv-wCSPB8ZDVaorOVlTjx4HJkxnzLi-Rm0chGU4urMTbQBHs>
X-ME-Received: <xmr:D4K2avlC_xoylEB7Swncbe2II-_vS7627u7rAPMydCQMcczhsppY761zJRg>
X-ME-Proxy-Cause: dmFkZTGKDwwNiF627+asCW7qlOfbc3YO4/BWQQAIa1dD7j4y1/LpRsbneXz52sgooVW2NB
    3cVSkvlr4fQi4SwiDMxRaBoBRNO6zHRHeGXMGxJYTRHb1PBeh27/Q3VWbCGBZujoWHPoE6
    R+Qc/6k1bBYz+Haf5IzKmyGQxC9qTL+WrK7JzMZqDmDHuiASYj35os3WnrFE1SWLZ6a+qY
    bCW2glHxjWyrurmiVGB62MJKctiau11N+au9WzHHk3KgIfj2lfSeRdK+MffwyEB0gNSuDN
    eSmAis7xZg1iofNwJ76iNU49c75bqPHfinmsayTQbADoZ6F/gk68t7NA/yonOE6sVDH8HE
    D3ftdBE7WnFsPxGcCrWYEQmSAbK7DmTVXeozDOm33abuyGIyUWUYmk42rWMIOSulW5MN5U
    r+bQ8LHYnJXbH1N1JBlBmKseL7dxUcK49tdAO5EHONR0qoxm8SRl9vmTzDDoKINrV6q1NO
    v+9uVOC68bBiJKHaZIqSsEIkN9+lFZz8a0ANE3olguIulErakGj3YNqcofh4GyHDCbHfeb
    bzNkJfo1dosM7+p857j3d16Oey7PxmHreAx04gx6kNEDsjaz2YX3jobUGkB8uhdIxfxWZx
    OIlwu1cuf1GpDQxmkBIhKPcoHqF/wRcEGrRzImSbCqjKAsFHjqnJeqbC0f2w
X-ME-Proxy: <xmx:D4K2akdBMJa3Facg3DOoIz6JDOY6ry7GkEBjaF93mWnspULoGUIoZQ>
    <xmx:D4K2apt6Z3NjDmal7ROY-eN189R4s7kDDDWeid-i5p0kxm5gssQLNA>
    <xmx:D4K2auAcLFLs_EQOB7Ln75jmG7x4MzmIDLX2VL2Jlk_22cgL5ooHNg>
    <xmx:D4K2aswnNEslbozeNf2fj0VMJ_WgNrk9Z0RT2DhF8fJhj0teYytXbA>
    <xmx:D4K2akcLDs96m2lcv7rRT4o3jVImLbNhJJ2vlYi141oR2I9Hbk-weImB>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 10:15:42 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Breno Leitao <leitao@debian.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Yuanhe Shu <xiangzao@linux.alibaba.com>,
	Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel
Date: Fri, 25 Sep 2026 15:15:30 +0100
Message-ID: <20260925141532.1274962-3-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925141532.1274962-1-kirill@shutemov.name>
References: <20260925141532.1274962-1-kirill@shutemov.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_071544_266926_5BC5C796 
X-CRM114-Status: GOOD (  19.06  )
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

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

All three queues are sized from the maxima the hardware advertises in IDR1
and allocated at probe, up to 4 MB each on a 4K-page kernel. The capture
kernel already disables two of them: arm_smmu_device_reset() drops
CR0_EVTQEN and CR0_PRIQEN. It still allocates both at full size.

A kdump capture kernel runs from a small crashkernel reservation, and every
SMMUv3 instance pays that cost again, up to 12 MB apiece. It goes to queues
that either serve the handful of devices used to save the dump or are
switched off outright, and it is memory the dump itself needs.

Size all three queues at one page worth of entries when is_kdump_kernel().
The queues carry commands and fault records rather than DMA data, so dump
throughput is unaffected. A shallower command queue only bounds how many
commands may be in flight before a sync, which does not matter for the few
devices that save the dump. The cmdq_max_n_shift parameter therefore does
not apply in a capture kernel.

Suggested-by: Kyle McMartin <jkkm@meta.com>
Assisted-by: LLM
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 30 ++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 810d3ce75089..a5ad57432dfd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -43,7 +43,7 @@ MODULE_PARM_DESC(disable_msipolling,
 static unsigned int cmdq_max_n_shift = CMDQ_MAX_SZ_SHIFT;
 module_param(cmdq_max_n_shift, uint, 0444);
 MODULE_PARM_DESC(cmdq_max_n_shift,
-	"Cap on the command queue depth, as log2 of the number of entries. Defaults to the hardware maximum; the queue never shrinks below one page.");
+	"Cap on the command queue depth, as log2 of the number of entries. Defaults to the hardware maximum; the queue never shrinks below one page. A kdump kernel always uses one page.");
 
 static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
@@ -4424,6 +4424,8 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
  * @ent_sz_shift: log2 of the queue entry size in bytes
  * @limit_n_shift: log2 depth to cap the queue at
  *
+ * A kdump capture kernel gets one page worth of entries whatever the limit.
+ *
  * @limit_n_shift is floored at one page, because coherent DMA is page
  * granular: a shallower queue occupies the same memory as one that fills the
  * page, and arm_smmu_init_one_queue() stops shrinking at a page too.
@@ -4433,10 +4435,27 @@ static u32 arm_smmu_queue_max_n_shift(u32 hw_max_n_shift, u32 ent_sz_shift,
 {
 	u32 floor_n_shift = PAGE_SHIFT - ent_sz_shift;
 
+	if (is_kdump_kernel())
+		return min(hw_max_n_shift, floor_n_shift);
+
 	limit_n_shift = max(limit_n_shift, floor_n_shift);
 	return min(hw_max_n_shift, limit_n_shift);
 }
 
+static inline u32 arm_smmu_evtq_max_n_shift(u32 hw_max_n_shift)
+{
+	/* Capped to ensure natural alignment */
+	return arm_smmu_queue_max_n_shift(hw_max_n_shift, EVTQ_ENT_SZ_SHIFT,
+					  EVTQ_MAX_SZ_SHIFT);
+}
+
+static inline u32 arm_smmu_priq_max_n_shift(u32 hw_max_n_shift)
+{
+	/* Capped to ensure natural alignment */
+	return arm_smmu_queue_max_n_shift(hw_max_n_shift, PRIQ_ENT_SZ_SHIFT,
+					  PRIQ_MAX_SZ_SHIFT);
+}
+
 /*
  * Command queues are also allocated by the Tegra241 CMDQV for its VCMDQs, which
  * need the same depth decision.
@@ -5191,7 +5210,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR1_ATTR_TYPES_OVR)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
-	/* Queue sizes, capped to ensure natural alignment */
 	smmu->cmdq.q.llq.max_n_shift =
 		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, reg));
 	if (smmu->cmdq.q.llq.max_n_shift <= ilog2(CMDQ_BATCH_ENTRIES)) {
@@ -5206,10 +5224,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
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


