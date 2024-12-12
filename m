Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63313E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LMxyNsNja8u4zNmyLLENTRCKJqkK6QgSakPe49cILk=; b=2GDTvUoj+iCc+RZ/KuUYauxMxe
	xhyWL8aBqs+PRdQ7g3Mvwu7QXjXxhBfRkhRao0NCmXB1d8yWbM5ZKWnM9ZynrAo0iBsyWEpAnRYkG
	e0JDhhSWW9ERUDZES5VlTPnc0/OE5hp2QbE3CfmP1uj2dQG63MxVrXW2LxRnUgCWbXLplEWGQuJ/l
	6frWdk0HXG5Z8sELHCEjil6JBl8ngCto8uDkgYh49aUFvTkMbWQAk5b0IIFmA2KQ5waPEphnx5zQF
	5b786B/+l/XMiM5LYrAK83f6CgBQ079PW1uOcQaM8l8sjwnl+lN7i8WgRYXkAC3i75cX8TViSA2KG
	qzTZT4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo2t-00000001Rre-1s7u;
	Thu, 12 Dec 2024 18:36:19 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZH-00000001Jq7-3rMf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:45 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385dcae001fso443934f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026742; x=1734631542; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1LMxyNsNja8u4zNmyLLENTRCKJqkK6QgSakPe49cILk=;
        b=rzLasbfv9JYqvLFMgldKRrJLPDWBtCPmwJJu4QnvmvHwtF79e03CFGCIDsXsYP4qUA
         s1yhH7FOz89rtPJrxEbXd0ewhfOsPZp5ew11Eiy8AROv1DNqrFY5K/ddMtEVMCY/Fv5G
         wzZkQ/PdswICDMi7TcToTx6IqrJEmJYDlL4If9mXXaCYTzLysQ2jmvOYZ7C4zP8OOjVD
         rADwYRZtURDHaKqR5qm7DLEN8FdnMjMDOwqQWwNrdYIgC3gc71iM2YRY/hnFUMpPxCsL
         6zvlbtreMREHbim4Rh3FQILJ9sjfQJHd00vMf202R6NAtkgvNGuoWxNBpLEbhzGNAq4I
         PACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026742; x=1734631542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LMxyNsNja8u4zNmyLLENTRCKJqkK6QgSakPe49cILk=;
        b=RZBOAXnxUhJR8SEn1bacaY0niEE+Se343eD02Qmsfg/QDACK+rmOm1sZOMgZy6F3Bh
         UwFomEfbbZsAlM1JEibhVCGPXei6mk1feyvgDXp7PAAwcSktxVjwdDqe2updlnC+Lwj9
         im7ZkXVjXTXv0sVUpvS/psb8dXtoYRC3cJ3G53GNHhsOsxnBKOViFDjGUUsq+SAxx+/j
         G2j3Il84kgRWHwLqLPOLXvXKjPvBDepZmWnPamErBywhtud3otzeQkyi+kLeqQr6YBYa
         R6G1NuP+s3dDCKCRKBta7HEZmdWp57WB2fc0n7CZkEd85MfJzuL3RB1XcddRHYu50ir2
         52UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQyhynZTKLDk65tQkVnd0I96RZLSDiVvnO/8EyNL1u7O5urtmlk3ns6fXTkqqHGG2QSMaHthWH+FLRGVNAYfMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwVWOLsU1IpkTBfZznEMuBWtYo2+T7CMDfvoSaca/pX8NFT4vk8
	cWLFB9jpeAzN4FNJEqyLmHFI+QYUaIbwhEqf6oRdr2QuNbRI0dyWrkwgBXkB8MZWjNyKwpZs5M0
	sw+WWleC+FA==
X-Google-Smtp-Source: AGHT+IFPY+N9wTZ2tcFqUmavonh5uuqwBF4VmdeOBIMSWGf8ApdTWlq6S7L/pJ7JZxynPwo+SB3rplDprL91sA==
X-Received: from wmbdx10.prod.google.com ([2002:a05:600c:63ca:b0:436:1a60:654e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f47:0:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-3864ce8956dmr7667344f8f.11.1734026741969;
 Thu, 12 Dec 2024 10:05:41 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:52 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-29-smostafa@google.com>
Subject: [RFC PATCH v2 28/58] KVM: arm64: smmu-v3: Setup stream table
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
X-CRM114-CacheID: sfid-20241212_100543_960267_2C57B273 
X-CRM114-Status: GOOD (  20.23  )
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

Map the stream table allocated by the host into the hypervisor address
space. When the host mappings are finalized, the table is unmapped from
the host. Depending on the host configuration, the stream table may have
one or two levels. Populate the level-2 stream table lazily.

Also, add accessors for STEs.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 157 +++++++++++++++++++-
 include/kvm/arm_smmu_v3.h                   |   3 +
 2 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index e15356509424..43d2ce7828c1 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -174,7 +174,6 @@ static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
 	return smmu_wait_event(smmu, smmu_cmdq_empty(smmu));
 }
 
-__maybe_unused
 static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 			 struct arm_smmu_cmdq_ent *cmd)
 {
@@ -186,6 +185,94 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+__maybe_unused
+static int smmu_sync_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode = CMDQ_OP_CFGI_STE,
+		.cfgi.sid = sid,
+		.cfgi.leaf = true,
+	};
+
+	return smmu_send_cmd(smmu, &cmd);
+}
+
+static int smmu_alloc_l2_strtab(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_strtab_l1 *l1_desc;
+	dma_addr_t l2ptr_dma;
+	struct arm_smmu_strtab_l2 *l2table;
+	size_t l2_order = get_order(sizeof(struct arm_smmu_strtab_l2));
+	int flags = 0;
+
+	l1_desc = &cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)];
+	if (l1_desc->l2ptr)
+		return 0;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		flags |= IOMMU_PAGE_NOCACHE;
+
+	l2table = kvm_iommu_donate_pages(l2_order, flags);
+	if (!l2table)
+		return -ENOMEM;
+
+	l2ptr_dma = hyp_virt_to_phys(l2table);
+
+	if (l2ptr_dma & (~STRTAB_L1_DESC_L2PTR_MASK | ~PAGE_MASK)) {
+		kvm_iommu_reclaim_pages(l2table, l2_order);
+		return -EINVAL;
+	}
+
+	/* Ensure the empty stream table is visible before the descriptor write */
+	wmb();
+
+	arm_smmu_write_strtab_l1_desc(l1_desc, l2ptr_dma);
+	return 0;
+}
+
+static struct arm_smmu_ste *
+smmu_get_ste_ptr(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		struct arm_smmu_strtab_l1 *l1_desc =
+					&cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)];
+		struct arm_smmu_strtab_l2 *l2ptr;
+
+		if (arm_smmu_strtab_l1_idx(sid) > cfg->l2.num_l1_ents)
+			return NULL;
+		/* L2 should be allocated before calling this. */
+		if (WARN_ON(!l1_desc->l2ptr))
+			return NULL;
+
+		l2ptr = hyp_phys_to_virt(l1_desc->l2ptr & STRTAB_L1_DESC_L2PTR_MASK);
+		/* Two-level walk */
+		return &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)];
+	}
+
+	if (sid > cfg->linear.num_ents)
+		return NULL;
+	/* Simple linear lookup */
+	return &cfg->linear.table[sid];
+}
+
+__maybe_unused
+static struct arm_smmu_ste *
+smmu_get_alloc_ste_ptr(struct hyp_arm_smmu_v3_device *smmu, u32 sid)
+{
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		int ret = smmu_alloc_l2_strtab(smmu, sid);
+
+		if (ret) {
+			WARN_ON(ret != -ENOMEM);
+			return NULL;
+		}
+	}
+	return smmu_get_ste_ptr(smmu, sid);
+}
+
 static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u64 val, old;
@@ -255,6 +342,70 @@ static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u64 strtab_base;
+	size_t strtab_size;
+	u32 strtab_cfg, fmt;
+	int split, log2size;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	enum kvm_pgtable_prot prot = PAGE_HYP;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		prot |= KVM_PGTABLE_PROT_NORMAL_NC;
+
+	strtab_base = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
+	if (strtab_base & ~(STRTAB_BASE_ADDR_MASK | STRTAB_BASE_RA))
+		return -EINVAL;
+
+	strtab_cfg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
+	if (strtab_cfg & ~(STRTAB_BASE_CFG_FMT | STRTAB_BASE_CFG_SPLIT |
+			   STRTAB_BASE_CFG_LOG2SIZE))
+		return -EINVAL;
+
+	fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, strtab_cfg);
+	split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, strtab_cfg);
+	log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, strtab_cfg);
+	strtab_base &= STRTAB_BASE_ADDR_MASK;
+
+	switch (fmt) {
+	case STRTAB_BASE_CFG_FMT_LINEAR:
+		if (split)
+			return -EINVAL;
+		cfg->linear.num_ents = 1 << log2size;
+		strtab_size = cfg->linear.num_ents * sizeof(struct arm_smmu_ste);
+		cfg->linear.ste_dma = strtab_base;
+		ret = ___pkvm_host_donate_hyp_prot(strtab_base >> PAGE_SHIFT,
+						   PAGE_ALIGN(strtab_size) >> PAGE_SHIFT,
+						   false, prot);
+		if (ret)
+			return -EINVAL;
+		cfg->linear.table = hyp_phys_to_virt(strtab_base);
+		/* Disable all STEs */
+		memset(cfg->linear.table, 0, strtab_size);
+		break;
+	case STRTAB_BASE_CFG_FMT_2LVL:
+		if (split != STRTAB_SPLIT)
+			return -EINVAL;
+		cfg->l2.num_l1_ents = 1 << max(0, log2size - split);
+		strtab_size = cfg->l2.num_l1_ents * sizeof(struct arm_smmu_strtab_l1);
+		cfg->l2.l1_dma = strtab_base;
+		ret = ___pkvm_host_donate_hyp_prot(strtab_base >> PAGE_SHIFT,
+						   PAGE_ALIGN(strtab_size) >> PAGE_SHIFT,
+						   false, prot);
+		if (ret)
+			return -EINVAL;
+		cfg->l2.l1tab = hyp_phys_to_virt(strtab_base);
+		/* Disable all STEs */
+		memset(cfg->l2.l1tab, 0, strtab_size);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int ret;
@@ -278,6 +429,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		return ret;
 
+	ret = smmu_init_strtab(smmu);
+	if (ret)
+		return ret;
+
 	return kvm_iommu_init_device(&smmu->iommu);
 }
 
diff --git a/include/kvm/arm_smmu_v3.h b/include/kvm/arm_smmu_v3.h
index 393a1a04edba..352c1b2dc72a 100644
--- a/include/kvm/arm_smmu_v3.h
+++ b/include/kvm/arm_smmu_v3.h
@@ -2,6 +2,7 @@
 #ifndef __KVM_ARM_SMMU_V3_H
 #define __KVM_ARM_SMMU_V3_H
 
+#include <asm/arm-smmu-v3-common.h>
 #include <asm/kvm_asm.h>
 #include <kvm/iommu.h>
 
@@ -22,6 +23,8 @@ struct hyp_arm_smmu_v3_device {
 	u32			cmdq_prod;
 	u64			*cmdq_base;
 	size_t			cmdq_log2size;
+	/* strtab_cfg.l2.l2ptrs is not used, instead computed from L1 */
+	struct arm_smmu_strtab_cfg strtab_cfg;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.47.0.338.g60cca15819-goog


