Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C79CCA466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VVZGlsZIqsR8XCbbkxUjFMNMhFH8B9fEpFvm5P7Qik=; b=c03e7uHnpyFt8xL8uaeygjApsn
	PpT1bJB5T4zbbYyRU0q4bxlJP19gtzGJOxVo9YYQMhhUgXKJhWO7uVfzcwk+uDNzHZG0DfY7EiOAQ
	IJ7tl/fut+/eCzzQef1HKzqQ+NCeYwYGW5fX+dJVq3FzIxnVPYZzYGbIqH1NP2sT5FsC6Yq9DE+mq
	PkuxdinF6fl3mQ94O6UE3D2lYmVWrjkP2M9QTHCzoIJNJgHn35LSfOk1J2MAG3VCPRkI4fReJrj/V
	H4FRKq41krdm/yCw2S38XNb1qK5r87jgesHZtAKgnlYpTaqlT+Z4TFQeDCAL8AR9xOSGSe6DiLDzf
	1R5B6Dfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRma-00000001JNm-254X;
	Thu, 15 Oct 2026 20:10:32 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRll-00000001IMg-47KC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:43 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6b1a56fd429so2812786a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094979; x=1792699779; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VVZGlsZIqsR8XCbbkxUjFMNMhFH8B9fEpFvm5P7Qik=;
        b=YSXOSZyL8fZOt9MHk/CP75f7HCBRqC6oNLFz/AAgzqRpeeO7uv52jz/366sBdaWQQe
         6DcTFGQ+fh1tIwCGfpNSciI36rtZvUOIUg1naYZJ8dgyMWTFoU1tT1JXyj10JLrzI2n3
         pVySZwOWDm1lURSani3WBROEExTPsJozWQtMor7iAAofvRPuDi8yDsfrVdqGAtXgsG++
         g3uLa1qVkSrTZxqGkwSPt+vhm7MQxbou/fn66xwvpkphmd6bAXve26Ttf8uhbQKvxqth
         JEpS+wSMOt2h0Hb5lyJgYqg9DReRwkTucm2N8j0uSJFvYMp1GdHfncjPWq7F3ls/syg+
         yqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094979; x=1792699779;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VVZGlsZIqsR8XCbbkxUjFMNMhFH8B9fEpFvm5P7Qik=;
        b=vvK67jqg3GfdPXScUS9e+M2B3vMDPnkFmjCn2a9JbtnRZLIKNssBx8I15wCgtC1krM
         /YVuOIKt1/iQTPwxMOO7eRYGgz1RltmycRA3oqa+6exA/zFMAm1/T22tN8Ar2KtQYSqi
         1vUx7XB+JsQTwaierdAb1y/XpA5otTX7EsdPYa1uN1NQKDZ9oERzUFUpE0XZN/MnhEvd
         6CazrTezzlaCr5cHNfH5iPVLg3ne9C+xIsSA8Lheiii341kVRay9EJde3J44r160ZFfE
         YdHD5MM4gOQKC7NjrX2w0z/dqOxJLsxv6uDNSDawxGP/eaHFcyC3XCdVxPPCW9VHkHVT
         soFQ==
X-Gm-Message-State: AFq9FYJoJQPbvW25ti45a4r69IGBhzO26VMf2UBTDq9zALUI+/O1zKJJ
	THaWiVx0rGMP/yC9j5Yd/uQ3Rq1B7kEkzivpFMM2HZ+ey1h089ONLNdsHaW6gPPod/vaDAIFCuQ
	OiTchpkS+Dk5QttMWX1kel0CIplKQum6FaRvxaG9KkskE+pV3P12AgOfyWY7dIjcPO01hIDfA1N
	1uTgUer9qxIK7H963g7Oi8tPSFskzHq7GAQA3tLjnY+/EeUez3E3thiV4FsTbwezbzMA==
X-Received: from edze9.prod.google.com ([2002:a05:6402:1909:b0:6ae:201f:ff33])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2498:b0:6aa:ee55:a650 with SMTP id 4fb4d7f45d1cf-6b17c27c6e1mr15665392a12.37.1792094979040;
 Thu, 15 Oct 2026 13:09:39 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:54 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-24-smostafa@google.com>
Subject: [PATCH v9 23/25] iommu/arm-smmu-v3-kvm: Invalidate the SMMU TLBs
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130942_124893_49C7CD20 
X-CRM114-Status: GOOD (  27.07  )
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

Implement the io-pgtable tlb ops, which invalidate the shadow stage-2
in every SMMU.

The range invalidation commands come from arm_smmu_tlbi_calc_range()
in the common lib, SMMUs without range invalidation get one command per
entry.
The hypervisor also needs to invaldiate all of S1 after S2 invalidations
by IPA to invalidate combined entries.

Invalidation needs the command queue, so track whether it is enabled in
cmdq_active. It is updated with hw_lock held once the CR0 write has been
acknowledged, so it cannot change under a concurrent invalidation. For
the same reason the host is not allowed to disable the command queue
while the SMMU is enabled, as the hypervisor would no longer be able to
invalidate. As invalidation is skipped while the command queue is off,
flush the TLBs every time the SMMU is enabled.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 156 +++++++++++++++++-
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |   2 +
 2 files changed, 155 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 75b2b1477a4f..01f23fce6be5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -209,7 +209,6 @@ static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
 	return smmu_wait(false, smmu_cmdq_empty(&smmu->cmdq));
 }
 
-__maybe_unused
 static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 			 struct arm_smmu_cmd *cmd)
 {
@@ -223,17 +222,118 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+static int smmu_tlb_inv_vmid(struct hyp_arm_smmu_v3_device *smmu)
+{
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_S12_VMALL);
+
+	return smmu_send_cmd(smmu, &cmd);
+}
+
+static int __smmu_tlb_inv_range(struct hyp_arm_smmu_v3_device *smmu,
+				struct arm_smmu_cmd *cmd,
+				unsigned long iova, size_t size, size_t granule,
+				bool leaf)
+{
+	struct arm_smmu_tlbi tlbi = {
+		.iova = iova,
+		.size = size,
+		.iopte_size = granule,
+		.tgsz_lg2 = __ffs(idmap_pgtable->cfg.pgsize_bitmap),
+		.leaf_only = leaf,
+	};
+	unsigned int i;
+	int ret;
+
+	arm_smmu_tlbi_calc_range(&tlbi, false);
+	if (tlbi.range.use_full_inv)
+		return smmu_tlb_inv_vmid(smmu);
+
+	for (i = 0; i < tlbi.range.num_cmds; i++) {
+		struct arm_smmu_cmd range_cmd = tlbi.range.cmds[i];
+
+		range_cmd.data[0] |= cmd->data[0];
+		ret = smmu_add_cmd(smmu, &range_cmd);
+		if (ret)
+			return ret;
+	}
+
+	return smmu_sync_cmd(smmu);
+}
+
+static int __smmu_tlb_inv_range_pages(struct hyp_arm_smmu_v3_device *smmu,
+				      struct arm_smmu_cmd *cmd,
+				      unsigned long iova, size_t size, size_t granule,
+				      bool leaf)
+{
+	unsigned long end = iova + size;
+	int ret;
+
+	/* Same threshold as arm_smmu_tlbi_calc_single(). */
+	if (size / granule > 512)
+		return smmu_tlb_inv_vmid(smmu);
+
+	for (; iova < end; iova += granule) {
+		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
+			       (iova & ~GENMASK_U64(11, 0));
+		ret = smmu_add_cmd(smmu, cmd);
+		if (ret)
+			return ret;
+	}
+
+	return smmu_sync_cmd(smmu);
+}
+
+static int smmu_tlb_inv_range_smmu(struct hyp_arm_smmu_v3_device *smmu,
+				   unsigned long iova, size_t size, size_t granule,
+				   bool leaf)
+{
+	struct arm_smmu_cmd cmd_s1 = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NH_ALL);
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_S2_IPA);
+	int ret;
+
+	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV)
+		ret = __smmu_tlb_inv_range(smmu, &cmd, iova, size, granule, leaf);
+	else
+		ret = __smmu_tlb_inv_range_pages(smmu, &cmd, iova, size, granule, leaf);
+	if (ret)
+		return ret;
+
+	return smmu_send_cmd(smmu, &cmd_s1);
+}
+
+static void smmu_tlb_inv_range(unsigned long iova, size_t size, size_t granule,
+			       bool leaf)
+{
+	struct hyp_arm_smmu_v3_device *smmu;
+
+	for_each_smmu(smmu) {
+		hyp_spin_lock(&smmu->hw_lock);
+		/*
+		 * Don't bother if CMDQ is disabled, this would be useful for the case
+		 * when RPM is supported to avoid touching the SMMU MMIO when disabled.
+		 * The hypervisor also asserts CMDQEN is enabled before the SMMU is
+		 * enabled. As otherwise the host can prevent the hypervisor from doing
+		 * TLB invalidations.
+		 * When the SMMU is re-enabled the hypervisor cleans the TLBs.
+		 */
+		if (smmu->cmdq_active)
+			WARN_ON(smmu_tlb_inv_range_smmu(smmu, iova, size,
+							granule, leaf));
+		hyp_spin_unlock(&smmu->hw_lock);
+	}
+}
+
 static void smmu_tlb_flush_walk(unsigned long iova, size_t size,
 				size_t granule, void *cookie)
 {
-	/* TBD: Invalidate the range in all the SMMUs. */
+	smmu_tlb_inv_range(iova, size, granule, false);
 }
 
 static void smmu_tlb_add_page(struct iommu_iotlb_gather *gather,
 			      unsigned long iova, size_t granule,
 			      void *cookie)
 {
-	/* TBD: Invalidate the granule in all the SMMUs. */
+	smmu_tlb_inv_range(iova, granule, granule, true);
 }
 
 static const struct iommu_flush_ops smmu_tlb_ops = {
@@ -721,6 +821,33 @@ static int smmu_update_ste_shadow(struct hyp_arm_smmu_v3_device *smmu, bool enab
 	return smmu_unshare_pages(strtab_host_base(smmu), size);
 }
 
+static int smmu_flush_all_tlb(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 cr0;
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NSNH_ALL);
+
+	hyp_spin_lock(&smmu->hw_lock);
+	/*
+	 * This must be called when the SMMU is getting enabled.
+	 * First enable the cmdq and then invalidate the TLB.
+	 */
+	cr0 = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+	if (!(cr0 & CR0_CMDQEN)) {
+		cr0 |= CR0_CMDQEN;
+		writel_relaxed(cr0, smmu->base + ARM_SMMU_CR0);
+		ret = smmu_wait(false, readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == cr0);
+		if (ret) {
+			hyp_spin_unlock(&smmu->hw_lock);
+			return ret;
+		}
+	}
+
+	ret = smmu_send_cmd(smmu, &cmd);
+	hyp_spin_unlock(&smmu->hw_lock);
+	return ret;
+}
+
 static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	/* Enabling SMMU without CMDQ, means TLB invalidation won't work. */
@@ -728,6 +855,8 @@ static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
 		return;
 
 	WARN_ON(smmu_update_ste_shadow(smmu, true));
+	/* Clean the TLBs each time the SMMU is enabled. */
+	WARN_ON(smmu_flush_all_tlb(smmu));
 }
 
 static void smmu_emulate_disable(struct hyp_arm_smmu_v3_device *smmu)
@@ -748,6 +877,13 @@ static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 
 static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
 {
+	/*
+	 * We can not enable the SMMU if the CMDQ is disabled and similarly
+	 * we can not disable the CMDQ if the SMMU is enabled, as that can
+	 * lead to stale TLBs.
+	 */
+	WARN_ON(is_smmu_enabled(smmu));
+
 	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
 				   cmdq_size(&smmu->cmdq_host)));
 }
@@ -1033,6 +1169,20 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		else
 			writel_relaxed(val & mask, smmu->base + off);
 
+		/*
+		 * Make sure writes to CR0 are immediately observed, that is important
+		 * when synchronizing with TLB invalidation as reading CR0 is not enough
+		 * to deduce the SMMU state, and we have to enforce the ack with the
+		 * hw_lock acquired.
+		 */
+		if (off == ARM_SMMU_CR0) {
+			u32 cr0 = val;
+
+			WARN_ON(smmu_wait(false,
+					  readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == cr0));
+			smmu->cmdq_active = !!(cr0 & CR0_CMDQEN);
+		}
+
 		hyp_spin_unlock(&smmu->hw_lock);
 		return true;
 	}
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index 2fb478e9233a..9ccee7fb710f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -27,6 +27,7 @@
  * @cmdq_host:		Host view of the CMDQ, only q_base, base_dma and llq used
  * @cmdq_max_shift:	Max shift for the CMDQ probed from HW
  * @cr0:		Last value of CR0
+ * @cmdq_active:	CMDQEN as acknowledged by the hardware, under hw_lock
  * @host_ste_cfg:	Host stream table config
  * @host_ste_base:	Host stream table base
  * @strtab_cfg:		Stream table config as seen by HW
@@ -60,6 +61,7 @@ struct hyp_arm_smmu_v3_device {
 	struct arm_smmu_queue	cmdq_host;
 	u32			cmdq_max_shift;
 	u32			cr0;
+	bool			cmdq_active;
 	dma_addr_t		strtab_dma;
 	size_t			strtab_size;
 	u64			host_ste_cfg;
-- 
2.56.0.176.g3575e65682-goog


