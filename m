Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C652C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqHi92spgQQq7xJIa7m1bm1iGpbSgFZkVBRcVzoY6CI=; b=AfxOFdGQdswSo1qPckjXEaeQsB
	HsJm2ajhY3tAmqvVTsAF2EvNuP0pmIoU073IP8t9sppdczT+2iMDOZ91tuIotiQbnXvtEkCndp8mC
	JFMcXqSpUA0Id4RWyjc+KQcqQ0qdrMvDanFaDl6cA5kvq5/nNUmOCorakHeWsn6zoTh0WY1ECZh2H
	QqW7OnYKy9ajUilvXAVVyCYwLIQ/IqnQ4npIbOtdFeuN+hSvmmHcmlJMCWb75zY7FZJ5+U2jV7W4F
	N8nzK4GMYYTgMKEMwzJnw+AwVcjAxBJ520V/UP4gJPBS+COSeaa9RzhMpdOor3AKKe/yz1MCg84E7
	SEzVb02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTiq-0000000FI3i-0C6b;
	Mon, 28 Jul 2025 19:41:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2t-0000000F905-1vOn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-455f79a2a16so34729855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725234; x=1754330034; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VqHi92spgQQq7xJIa7m1bm1iGpbSgFZkVBRcVzoY6CI=;
        b=zlUPJfv3gr1cEz/2Jfdd/AcaPKdXQSsehJPEeb6lg8vXzpNND0c8//xuMb03fYSQCi
         wgELH0dZd8MEnO7mFSl86XmwSTkUSSZbVncdIl0AG6jG40rFiN8FarfzLlr1L+7rFl4G
         oFysT+ddUPVtx3zHvaMuj5SUmDFuixyZVj22GaaHBxfWUETLeR+Lo0hGhPtiqyRB3AP5
         c/+dYjqSXULvpLDsyJoFitFmRCuz68GbJcdKmEkJDeZNcNiurTw3NWa9/vKHVmwecAl1
         e4yVH1EePxs3g+6cHI1hx9luCVVPM+/1K9xxy86sLeRo9T5g+gA4Mm3kg1+3XoiqnKbG
         T0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725234; x=1754330034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqHi92spgQQq7xJIa7m1bm1iGpbSgFZkVBRcVzoY6CI=;
        b=c2H06dHuEcjEcTESgJGP2fgBEa3UYszOFfVnAzY4NXEYNCqs+l9skcMcUy9q3zX8a5
         0mFEZCfQmv+8ZzeD8Wt+kQjVKPDKEAUN0ktk067VYE0JxGagAZ/yor0IGeqajLyimWfH
         j0hLArbeB/vXZ8O2WXVAGHhI1oriDP86Y7eV6YES0CUi6LV/blhiDxnr+mASkcWXhuUE
         qUpSlErEfHgCQNXf40fn4ulzhkvLd6g7GeQDS8udxIDT8zGfZp/jJRbB5qoecxohVRn1
         iUQm99zQ/e3YkauXkRPSctoVLMkE/rrc7MZj3bw59NBipUNfX6FPDoaNpBBLp8dnLPiG
         9Jkg==
X-Forwarded-Encrypted: i=1; AJvYcCWQgVrFccUUqOP66wouTVL8CBqckLFGiNqB2xzLmTC25CnN+Nwqcm4cTh92qLDlxBDJnzN9MySQXt3/YlYidbmM@lists.infradead.org
X-Gm-Message-State: AOJu0YwZRNQdCpP6Re/FUKMUIsswxMe7uLKbDnoTMI4P+efiFdc9HKTA
	9Eo8iWHR9HO6eIePIOIl7YxLXo/Lj9WZzxAHP3HWx2UNJYf2vBbWVekxkGPGvS+Kty8yycIvUkU
	TK70ZTiycs5wz3w==
X-Google-Smtp-Source: AGHT+IHT79YZti6f2oD/dU8174eWV4cxRx+bo5QS0U+d88lWGOSu4bRkgBXGcKpAbcfb4esmAkOl21DA22Bq6g==
X-Received: from wmrn36.prod.google.com ([2002:a05:600c:5024:b0:456:26d1:4451])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd3:b0:455:ed0f:e8d4 with SMTP id 5b1f17b1804b1-4588cd731admr9962885e9.10.1753725233793;
 Mon, 28 Jul 2025 10:53:53 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:12 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-26-smostafa@google.com>
Subject: [PATCH v3 25/29] iommu/arm-smmu-v3-kvm: Add enable/disable device HVCs
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105355_502345_E280BCF3 
X-CRM114-Status: GOOD (  19.72  )
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

Add implementation of enable/disable HVCs, for enable, the STE of
the device would be configured to use the idmap page table, while
for disable it would zero the STE.

As now STEs can be configured from kernel, add a lock to protect
against concurrent access.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 109 +++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  11 ++
 2 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 38d81cd6d24a..85131962094f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -143,10 +143,15 @@ static int smmu_tlb_inv_range_smmu(struct hyp_arm_smmu_v3_device *smmu,
 				   struct arm_smmu_cmdq_ent *cmd,
 				   unsigned long iova, size_t size, size_t granule)
 {
+	int ret;
+
+	hyp_spin_lock(&smmu->lock);
 	arm_smmu_tlb_inv_build(cmd, iova, size, granule,
 			       idmap_pgtable->cfg.pgsize_bitmap, smmu,
 			       __smmu_add_cmd, NULL);
-	return smmu_sync_cmd(smmu);
+	ret = smmu_sync_cmd(smmu);
+	hyp_spin_unlock(&smmu->lock);
+	return ret;
 }
 
 static void smmu_tlb_inv_range(unsigned long iova, size_t size, size_t granule,
@@ -183,7 +188,6 @@ static const struct iommu_flush_ops smmu_tlb_ops = {
 	.tlb_add_page	= smmu_tlb_add_page,
 };
 
-__maybe_unused
 static int smmu_sync_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, unsigned long ste)
 {
 	struct arm_smmu_cmdq_ent cmd = {
@@ -409,6 +413,9 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	}
 	smmu->base = hyp_phys_to_virt(smmu->mmio_addr);
 
+	hyp_spin_lock_init(&smmu->lock);
+	BUILD_BUG_ON(sizeof(smmu->lock) != sizeof(hyp_spinlock_t));
+
 	ret = smmu_init_registers(smmu);
 	if (ret)
 		goto out_err;
@@ -430,6 +437,102 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	return ret;
 }
 
+static struct hyp_arm_smmu_v3_device *smmu_id_to_ptr(pkvm_handle_t smmu_id)
+{
+	if (smmu_id >= kvm_hyp_arm_smmu_v3_count)
+		return NULL;
+	smmu_id = array_index_nospec(smmu_id, kvm_hyp_arm_smmu_v3_count);
+
+	return &kvm_hyp_arm_smmu_v3_smmus[smmu_id];
+}
+
+static void smmu_init_s2_ste(struct arm_smmu_ste *ste)
+{
+	struct io_pgtable_cfg *cfg;
+	u64 ts, sl, ic, oc, sh, tg, ps;
+
+	cfg = &idmap_pgtable->cfg;
+	ps = cfg->arm_lpae_s2_cfg.vtcr.ps;
+	tg = cfg->arm_lpae_s2_cfg.vtcr.tg;
+	sh = cfg->arm_lpae_s2_cfg.vtcr.sh;
+	oc = cfg->arm_lpae_s2_cfg.vtcr.orgn;
+	ic = cfg->arm_lpae_s2_cfg.vtcr.irgn;
+	sl = cfg->arm_lpae_s2_cfg.vtcr.sl;
+	ts = cfg->arm_lpae_s2_cfg.vtcr.tsz;
+
+	ste->data[0] = STRTAB_STE_0_V |
+		FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	ste->data[1] = FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
+	ste->data[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
+				  FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
+		 FIELD_PREP(STRTAB_STE_2_S2VMID, 0) |
+		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
+	ste->data[3] = cfg->arm_lpae_s2_cfg.vttbr & STRTAB_STE_3_S2TTB_MASK;
+}
+
+static int smmu_enable_dev(pkvm_handle_t iommu, pkvm_handle_t dev)
+{
+	static struct arm_smmu_ste *ste, target;
+	struct hyp_arm_smmu_v3_device *smmu = smmu_id_to_ptr(iommu);
+	int ret;
+
+	if (!smmu)
+		return -ENODEV;
+
+	hyp_spin_lock(&smmu->lock);
+	ste = smmu_get_alloc_ste_ptr(smmu, dev);
+	if (!ste) {
+		ret = - EINVAL;
+		goto out_ret;
+	}
+
+	smmu_init_s2_ste(&target);
+	WRITE_ONCE(ste->data[1], target.data[1]);
+	WRITE_ONCE(ste->data[2], target.data[2]);
+	WRITE_ONCE(ste->data[3], target.data[3]);
+	smmu_sync_ste(smmu, dev, (unsigned long)ste);
+	WRITE_ONCE(ste->data[0], target.data[0]);
+	ret = smmu_sync_ste(smmu, dev, (unsigned long)ste);
+
+out_ret:
+	hyp_spin_unlock(&smmu->lock);
+	return ret;
+}
+
+static int smmu_disable_dev(pkvm_handle_t iommu, pkvm_handle_t dev)
+{
+	static struct arm_smmu_ste *ste;
+	struct hyp_arm_smmu_v3_device *smmu = smmu_id_to_ptr(iommu);
+	int ret;
+
+	if (!smmu)
+		return -ENODEV;
+
+	hyp_spin_lock(&smmu->lock);
+	ste = smmu_get_alloc_ste_ptr(smmu, dev);
+	if (!ste) {
+		ret = -EINVAL;
+		goto out_ret;
+	}
+
+	WRITE_ONCE(ste->data[0], 0);
+	smmu_sync_ste(smmu, dev, (unsigned long)ste);
+	WRITE_ONCE(ste->data[1], 0);
+	WRITE_ONCE(ste->data[2], 0);
+	WRITE_ONCE(ste->data[3], 0);
+	ret = smmu_sync_ste(smmu, dev, (unsigned long)ste);
+
+out_ret:
+	hyp_spin_unlock(&smmu->lock);
+	return ret;
+}
+
 static int smmu_init_pgt(void)
 {
 	/* Default values overridden based on SMMUs common features. */
@@ -568,4 +671,6 @@ static void smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
 	.host_stage2_idmap		= smmu_host_stage2_idmap,
+	.enable_dev			= smmu_enable_dev,
+	.disable_dev			= smmu_disable_dev,
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 5c2f121837ad..89faa622af24 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -4,6 +4,10 @@
 
 #include <asm/kvm_asm.h>
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/spinlock.h>
+#endif
+
 #include "../arm-smmu-v3-common.h"
 
 /*
@@ -18,6 +22,7 @@
  * @oas			OAS of the SMMUv3
  * @pgsize_bitmap	Pages sizes supported by the SMMUv3
  * Other members are filled and used at runtime by the SMMU driver.
+ * @lock		Lock to protect the SMMU resources (STE/CMDQ)
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -29,6 +34,12 @@ struct hyp_arm_smmu_v3_device {
 	unsigned int            ias;
 	unsigned int            oas;
 	size_t                  pgsize_bitmap;
+	/* nvhe/spinlock.h not exposed to EL1. */
+#ifdef __KVM_NVHE_HYPERVISOR__
+	hyp_spinlock_t		lock;
+#else
+	u32			lock;
+#endif
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.50.1.552.g942d659e1b-goog


