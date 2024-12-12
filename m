Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2E7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JvanTJSMR+XI/Wjo2HTOKln5DEsfQoh3Hho27FSuog=; b=xUbjXMvskVqcZIOtnbbj88qR+9
	5JrIg/9BI71w/Mni/O2jI2Uf1xBgZHfNUuhumJi/2e348pWRjlMqpqSYRQwKiZcFZjXzT2FjcXIiW
	CTRELKlr1ygU8Nc8hiG0+GI421x7eIkqoGcu6jGPYNwPXb+rlugKx3MKANzliS1A++gTMR9+upT2Y
	W0bWc1DCFWuYEg+3qVreW5aTa2hAP982BffBLvbN3E8N48optFQfCYKLckMX/j4/hm6OPnCT3MB9u
	SD1jQLhMPuwkhzYsIelRs7RcmTLRKnyLHp+tZIxFmAzlcMPF1vnYPWcFbzSEsL5VBJne7dK0cBMFU
	OF/qAi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo9B-00000001TYt-15W1;
	Thu, 12 Dec 2024 18:42:49 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZS-00000001Jtl-1uqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361b090d23so5677715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026752; x=1734631552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JvanTJSMR+XI/Wjo2HTOKln5DEsfQoh3Hho27FSuog=;
        b=szUtE3rFRK99R1TlbWLQWnfRsGZkkuxJpLSij7yU9dx2tRuEBG92rtFxYNqrR6naTJ
         Q5OyMEq8fp0TPZeTG17dz1HaBCWQp4aFB8oJDF9u/IdBZbmcPReyOaxRMgXm2BX4ZcSO
         XfdBlqunZsxq3xIB8yhO0vE/VnD7Zba5dgy0U1oc+8M3ZyhVXop2TcMqWrc7L/K7xJG4
         xZF1iPVodwEryN2DHasJB7U0w4DbGXYXRiDNblPPfUrWM4WK4J505mUOe++xUt+kJohI
         U53jHqA4oaXpnBzliBbTnRhTHhmsAyUe7eiaG0dUE94ytb8X/3RKtgdTMSN8jTAtLfDN
         MRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026752; x=1734631552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JvanTJSMR+XI/Wjo2HTOKln5DEsfQoh3Hho27FSuog=;
        b=ewV9+DQK5f6tL0alK5e/pH67tL5VdstB9liN1pwrVxXXeUIlnC+UNxdLJ+BDtgnsdZ
         BgfWYJhvP21sjJ0Vib+6o1yJk7jD+WETs3FKXWwLXPH+Zp2+U6xojq+uknSHAK0SBqBG
         TvDeugIkPHDHelXZken6gU8jbKg+FOFX/irfKTgkxWgkbwe81Dqhh7MyNLyV2UNg2d6P
         EpaPxBuqLyjA0ku+X/2ZDQmjxghUHLlxkVxT0Ll0xkVQ0MeHtRnxvgK4irSfRc1uzRc1
         +zA6HvB+GlpfepbRBhY4VWojolc4hJQDJ03AUPaLQnjtpySkuJda7Y39XCYOfb6gc1fu
         cd+A==
X-Forwarded-Encrypted: i=1; AJvYcCV4J+/lIotpRmB60EJYmrkDcc3p51N0ffDDNCZhHmyvDPKMN1UDz9Lqo6+1yRLxJeOfcNvibqsbLbiNikeNRV0H@lists.infradead.org
X-Gm-Message-State: AOJu0YxwPjrtvDPk0IheaWComDevWbxAWfFipSdUNgiV/DP5W/j2HSKS
	EhVd7yH5Oyd37hRQxfu+XFLpf71JS9Y9rzC6wTcA6RBNOr9qSMso+0I16a1pb0OfrD88c05XM/Y
	SlMEzv2OegA==
X-Google-Smtp-Source: AGHT+IGWGdZgTY7Fu4Fy8oS8GVUUpzVpI6h6GF8Kt9ZH/qx6w2Z6AjSEvrQ/zUVQNCjYoCTIQFsDcTLIxiWTaw==
X-Received: from wmkz18.prod.google.com ([2002:a7b:c7d2:0:b0:434:a15f:e7ea])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4b:b0:434:a239:d2fe with SMTP id 5b1f17b1804b1-4361c400c1bmr52688975e9.28.1734026752664;
 Thu, 12 Dec 2024 10:05:52 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:57 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-34-smostafa@google.com>
Subject: [RFC PATCH v2 33/58] KVM: arm64: smmu-v3: Add TLB ops
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100554_494974_88F4C062 
X-CRM114-Status: GOOD (  22.39  )
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

Add TLB invalidation functions would be used next from the page table
code and attach/detach functions.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 167 ++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index 3181933e9a34..5f00d5cdf5bc 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -602,10 +602,177 @@ static void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
 	hyp_free(smmu_domain);
 }
 
+static void smmu_inv_domain(struct hyp_arm_smmu_v3_domain *smmu_domain)
+{
+	struct kvm_hyp_iommu_domain *domain = smmu_domain->domain;
+	struct hyp_arm_smmu_v3_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_cmdq_ent cmd = {};
+
+	if (smmu_domain->pgtable->cfg.fmt == ARM_64_LPAE_S2) {
+		cmd.opcode = CMDQ_OP_TLBI_S12_VMALL;
+		cmd.tlbi.vmid = domain->domain_id;
+	} else {
+		cmd.opcode = CMDQ_OP_TLBI_NH_ASID;
+		cmd.tlbi.asid = domain->domain_id;
+	}
+
+	if (smmu->iommu.power_is_off)
+		return;
+
+	WARN_ON(smmu_send_cmd(smmu, &cmd));
+}
+
+static void smmu_tlb_flush_all(void *cookie)
+{
+	struct kvm_hyp_iommu_domain *domain = cookie;
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+	struct hyp_arm_smmu_v3_device *smmu = smmu_domain->smmu;
+
+	kvm_iommu_lock(&smmu->iommu);
+	smmu_inv_domain(smmu_domain);
+	kvm_iommu_unlock(&smmu->iommu);
+}
+
+static int smmu_tlb_inv_range_smmu(struct hyp_arm_smmu_v3_device *smmu,
+				   struct kvm_hyp_iommu_domain *domain,
+				   struct arm_smmu_cmdq_ent *cmd,
+				   unsigned long iova, size_t size, size_t granule)
+{
+	int ret = 0;
+	unsigned long end = iova + size, num_pages = 0, tg = 0;
+	size_t inv_range = granule;
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+
+	kvm_iommu_lock(&smmu->iommu);
+	if (smmu->iommu.power_is_off)
+		goto out_ret;
+
+	/* Almost copy-paste from the kernel dirver. */
+	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
+		/* Get the leaf page size */
+		tg = __ffs(smmu_domain->pgtable->cfg.pgsize_bitmap);
+
+		num_pages = size >> tg;
+
+		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
+		cmd->tlbi.tg = (tg - 10) / 2;
+
+		/*
+		 * Determine what level the granule is at. For non-leaf, both
+		 * io-pgtable and SVA pass a nominal last-level granule because
+		 * they don't know what level(s) actually apply, so ignore that
+		 * and leave TTL=0. However for various errata reasons we still
+		 * want to use a range command, so avoid the SVA corner case
+		 * where both scale and num could be 0 as well.
+		 */
+		if (cmd->tlbi.leaf)
+			cmd->tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
+		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
+			num_pages++;
+	}
+
+	while (iova < end) {
+		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
+			/*
+			 * On each iteration of the loop, the range is 5 bits
+			 * worth of the aligned size remaining.
+			 * The range in pages is:
+			 *
+			 * range = (num_pages & (0x1f << __ffs(num_pages)))
+			 */
+			unsigned long scale, num;
+
+			/* Determine the power of 2 multiple number of pages */
+			scale = __ffs(num_pages);
+			cmd->tlbi.scale = scale;
+
+			/* Determine how many chunks of 2^scale size we have */
+			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
+			cmd->tlbi.num = num - 1;
+
+			/* range is num * 2^scale * pgsize */
+			inv_range = num << (scale + tg);
+
+			/* Clear out the lower order bits for the next iteration */
+			num_pages -= num << scale;
+		}
+		cmd->tlbi.addr = iova;
+		WARN_ON(smmu_add_cmd(smmu, cmd));
+		BUG_ON(iova + inv_range < iova);
+		iova += inv_range;
+	}
+
+	ret = smmu_sync_cmd(smmu);
+out_ret:
+	kvm_iommu_unlock(&smmu->iommu);
+	return ret;
+}
+
+static void smmu_tlb_inv_range(struct kvm_hyp_iommu_domain *domain,
+			       unsigned long iova, size_t size, size_t granule,
+			       bool leaf)
+{
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+	unsigned long end = iova + size;
+	struct arm_smmu_cmdq_ent cmd;
+
+	cmd.tlbi.leaf = leaf;
+	if (smmu_domain->pgtable->cfg.fmt == ARM_64_LPAE_S2) {
+		cmd.opcode = CMDQ_OP_TLBI_S2_IPA;
+		cmd.tlbi.vmid = domain->domain_id;
+	} else {
+		cmd.opcode = CMDQ_OP_TLBI_NH_VA;
+		cmd.tlbi.asid = domain->domain_id;
+		cmd.tlbi.vmid = 0;
+	}
+	/*
+	 * There are no mappings at high addresses since we don't use TTB1, so
+	 * no overflow possible.
+	 */
+	BUG_ON(end < iova);
+	WARN_ON(smmu_tlb_inv_range_smmu(smmu_domain->smmu, domain,
+					&cmd, iova, size, granule));
+}
+
+static void smmu_tlb_flush_walk(unsigned long iova, size_t size,
+				size_t granule, void *cookie)
+{
+	smmu_tlb_inv_range(cookie, iova, size, granule, false);
+}
+
+static void smmu_tlb_add_page(struct iommu_iotlb_gather *gather,
+			      unsigned long iova, size_t granule,
+			      void *cookie)
+{
+	if (gather)
+		kvm_iommu_iotlb_gather_add_page(cookie, gather, iova, granule);
+	else
+		smmu_tlb_inv_range(cookie, iova, granule, granule, true);
+}
+
+__maybe_unused
+static const struct iommu_flush_ops smmu_tlb_ops = {
+	.tlb_flush_all	= smmu_tlb_flush_all,
+	.tlb_flush_walk = smmu_tlb_flush_walk,
+	.tlb_add_page	= smmu_tlb_add_page,
+};
+
+static void smmu_iotlb_sync(struct kvm_hyp_iommu_domain *domain,
+			    struct iommu_iotlb_gather *gather)
+{
+	size_t size;
+
+	if (!gather->pgsize)
+		return;
+	size = gather->end - gather->start + 1;
+	smmu_tlb_inv_range(domain, gather->start, size,  gather->pgsize, true);
+}
+
 /* Shared with the kernel driver in EL1 */
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
 	.get_iommu_by_id		= smmu_id_to_iommu,
 	.alloc_domain			= smmu_alloc_domain,
 	.free_domain			= smmu_free_domain,
+	.iotlb_sync			= smmu_iotlb_sync,
 };
-- 
2.47.0.338.g60cca15819-goog


