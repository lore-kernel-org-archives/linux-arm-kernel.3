Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C768C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evFXKgAxCDSoFJrfdZvMg8MZGEd3jtNNqfoUuy8K9/0=; b=cOThpFrGnejHFJc8f/dSnDwQ/c
	nNaRL1iiKBj65ndXaGmrkSw37bgWNpjGe6PmvOpQvWZK5mDm4+6gyU82JdaNPL4jF8wumD/splXPo
	ttoUWskOhO/tiVOGqWo/yNAjRy3iL8QaJpgI3iCKatPf0TyP6i9NCe3dVMm0jtoQNKqaq9QeFDbaL
	LaQKuYpa6tdMR5Hyyjsi5tzefxl2+2pFl+kfJF1lVaRxXo3FnnTxviJ4fDZrF3k0ZSJspq1pxSOVC
	JrM6ttVcnJHwfCw94WyVR+layHuDEpvCw1rpNkecsmpCX3llwCm9VYA9CGKIFn1hXKPGAizqJYj8T
	4tQPlFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTig-0000000FHqP-1AcG;
	Mon, 28 Jul 2025 19:41:10 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2f-0000000F8t0-2QTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-455e9daab1cso8119145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725219; x=1754330019; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=evFXKgAxCDSoFJrfdZvMg8MZGEd3jtNNqfoUuy8K9/0=;
        b=wdKQlP+FK19g9S3WUZHj5/mGUSfR6I1rwFLSNIQZep8LkCYpFBwNJoymBke98PzKzr
         CFODatpqNGeJkUnp+ExO4axqk4tfiWB2lAm12jk8PAm5eqY12ujHCjEtTDJl89VgJ7RH
         P6LuwZsn2JNWUFIjnyNAccsri7G07uFvNfW3oypChnFpRLiWoCo1Ytddjr4jjnOC7RZc
         3LmGJabvWmJGcm0ND40r+RU6Zo+OQQxb0br4sNmkYRg5Ki4Ui1FZDUEwHDFUR0SgS5Eh
         GkWv/Y2yiCPWzAOVteKVCxF6fVGA2dNmZd9rnUWLXIyZFEtA3OpwjUgbx1hBDKBNQB7f
         fqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725219; x=1754330019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evFXKgAxCDSoFJrfdZvMg8MZGEd3jtNNqfoUuy8K9/0=;
        b=TedbvbvjGjI3S4IcUVsRX10MURi23lLjyzRYUB7Nt8EQMevtX/tkHR1Kk1GL2eHxEm
         7HqstAiC/e3uaj+pcI8Tdev8HgQ92zTHiqKFeP8PeupTV/MQFiaKVTUIyw3xO2MQrABK
         d/DSvAl4cEsvFF95k9bESR/2l1kobDvzIlIns3KiN4vROoYqmXM/XPnRCE6ct+F/EuzI
         wDtL7S8y5G/QQuHlsgwXKnxCvbeTTmj1MrsDTaE1LZ4mIbPcss7FT4aZuejWlc9sauvU
         JXVxQe0J2gYVyPuoaZTSbC1vuZpDVDlkqHU7VpUX2T1CxdcU84pmDrnTf2SY7S/HjjEA
         mdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSd2X54UWVw8tB8HYAi9i6F6H/lalYY66W2pR2cR3/69INOud/nc5eXSlQ2s6G7cHBv5lWTOXPW3pDSkRFrXiS@lists.infradead.org
X-Gm-Message-State: AOJu0YyAjy/vEHTjuZsnUcK0ETh96PP4Zb0EO7BBN9IIp4Rp07odnBXk
	yQQTjKvcK6jUatmKC+aDt7W/XS8bgmyOjeFrCLcER8sMZEMYWATWqaR7WfNggMGKApeDJ0R8Vwf
	1ZrUKHqiGAM6S3w==
X-Google-Smtp-Source: AGHT+IG+0YUT5evXVnzrsmZ/u5tA/GE8rdYTVIETUaQ+H7lNGrhgDPgErstj87+LdJlLnheF6/yjXPJPX/pn2Q==
X-Received: from wmsp29.prod.google.com ([2002:a05:600c:1d9d:b0:456:3aa2:2152])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3484:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-4587666ae80mr93314205e9.32.1753725219574;
 Mon, 28 Jul 2025 10:53:39 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:52:56 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-10-smostafa@google.com>
Subject: [PATCH v3 09/29] iommu/arm-smmu-v3: Move queue and table allocation
 to arm-smmu-v3-common.c
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
X-CRM114-CacheID: sfid-20250728_105341_620787_7F9E6B81 
X-CRM114-Status: GOOD (  24.81  )
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

Move more code to arm-smmu-v3-common.c, so that the KVM driver can reuse
it.

Also, make sure that allocated memory is aligned as it its going
to protected by the hypervisor stage-2.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common.c      | 160 ++++++++++++++++
 .../arm/arm-smmu-v3/arm-smmu-v3-common.h      |  12 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 171 +-----------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   8 +
 4 files changed, 181 insertions(+), 170 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
index c2b14b0c9f53..6cd5187d62a1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
@@ -3,6 +3,7 @@
 #include <linux/iopoll.h>
 #include <linux/pci.h>
 #include <linux/string_choices.h>
+#include <kunit/visibility.h>
 
 #include "arm-smmu-v3.h"
 #include "../../dma-iommu.h"
@@ -365,3 +366,162 @@ void arm_smmu_get_resv_regions(struct device *dev, struct list_head *head)
 
 	iommu_dma_get_resv_regions(dev, head);
 }
+
+int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
+			    struct arm_smmu_queue *q, void __iomem *page,
+			    unsigned long prod_off, unsigned long cons_off,
+			    size_t dwords, const char *name)
+{
+	size_t qsz;
+
+	do {
+		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
+		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
+					      GFP_KERNEL);
+		if (q->base || qsz < PAGE_SIZE)
+			break;
+
+		q->llq.max_n_shift--;
+	} while (1);
+
+	if (!q->base) {
+		dev_err(smmu->dev,
+			"failed to allocate queue (0x%zx bytes) for %s\n",
+			qsz, name);
+		return -ENOMEM;
+	}
+
+	if (!WARN_ON(q->base_dma & (qsz - 1))) {
+		dev_info(smmu->dev, "allocated %u entries for %s\n",
+			 1 << q->llq.max_n_shift, name);
+	}
+
+	q->prod_reg	= page + prod_off;
+	q->cons_reg	= page + cons_off;
+	q->ent_dwords	= dwords;
+
+	q->q_base  = Q_BASE_RWA;
+	q->q_base |= q->base_dma & Q_BASE_ADDR_MASK;
+	q->q_base |= FIELD_PREP(Q_BASE_LOG2SIZE, q->llq.max_n_shift);
+
+	q->llq.prod = q->llq.cons = 0;
+	return 0;
+}
+
+/* Stream table manipulation functions */
+static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
+{
+	u32 l1size;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	unsigned int last_sid_idx =
+		arm_smmu_strtab_l1_idx((1ULL << smmu->sid_bits) - 1);
+
+	/* Calculate the L1 size, capped to the SIDSIZE. */
+	cfg->l2.num_l1_ents = min(last_sid_idx + 1, STRTAB_MAX_L1_ENTRIES);
+	if (cfg->l2.num_l1_ents <= last_sid_idx)
+		dev_warn(smmu->dev,
+			 "2-level strtab only covers %u/%u bits of SID\n",
+			 ilog2(cfg->l2.num_l1_ents * STRTAB_NUM_L2_STES),
+			 smmu->sid_bits);
+
+	l1size = cfg->l2.num_l1_ents * sizeof(struct arm_smmu_strtab_l1);
+	cfg->l2.l1tab = dmam_alloc_coherent(smmu->dev, l1size, &cfg->l2.l1_dma,
+					    GFP_KERNEL);
+	if (!cfg->l2.l1tab) {
+		dev_err(smmu->dev,
+			"failed to allocate l1 stream table (%u bytes)\n",
+			l1size);
+		return -ENOMEM;
+	}
+
+	cfg->l2.l2ptrs = devm_kcalloc(smmu->dev, cfg->l2.num_l1_ents,
+				      sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
+	if (!cfg->l2.l2ptrs)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void arm_smmu_make_abort_ste(struct arm_smmu_ste *target)
+{
+	memset(target, 0, sizeof(*target));
+	target->data[0] = cpu_to_le64(
+		STRTAB_STE_0_V |
+		FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT));
+}
+
+/*
+ * This can safely directly manipulate the STE memory without a sync sequence
+ * because the STE table has not been installed in the SMMU yet.
+ */
+void arm_smmu_init_initial_stes(struct arm_smmu_ste *strtab,
+				unsigned int nent)
+{
+	unsigned int i;
+
+	for (i = 0; i < nent; ++i) {
+		arm_smmu_make_abort_ste(strtab);
+		strtab++;
+	}
+}
+
+static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
+{
+	u32 size;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	size = (1 << smmu->sid_bits) * sizeof(struct arm_smmu_ste);
+	cfg->linear.table = dmam_alloc_coherent(smmu->dev, size,
+						&cfg->linear.ste_dma,
+						GFP_KERNEL);
+	if (!cfg->linear.table) {
+		dev_err(smmu->dev,
+			"failed to allocate linear stream table (%u bytes)\n",
+			size);
+		return -ENOMEM;
+	}
+	cfg->linear.num_ents = 1 << smmu->sid_bits;
+
+	arm_smmu_init_initial_stes(cfg->linear.table, cfg->linear.num_ents);
+	return 0;
+}
+
+int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
+		ret = arm_smmu_init_strtab_2lvl(smmu);
+	else
+		ret = arm_smmu_init_strtab_linear(smmu);
+	if (ret)
+		return ret;
+
+	ida_init(&smmu->vmid_map);
+
+	return 0;
+}
+
+void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	dma_addr_t dma;
+	u32 reg;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		reg = FIELD_PREP(STRTAB_BASE_CFG_FMT,
+				 STRTAB_BASE_CFG_FMT_2LVL) |
+		      FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE,
+				 ilog2(cfg->l2.num_l1_ents) + STRTAB_SPLIT) |
+		      FIELD_PREP(STRTAB_BASE_CFG_SPLIT, STRTAB_SPLIT);
+		dma = cfg->l2.l1_dma;
+	} else {
+		reg = FIELD_PREP(STRTAB_BASE_CFG_FMT,
+				 STRTAB_BASE_CFG_FMT_LINEAR) |
+		      FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, smmu->sid_bits);
+		dma = cfg->linear.ste_dma;
+	}
+	writeq_relaxed((dma & STRTAB_BASE_ADDR_MASK) | STRTAB_BASE_RA,
+		       smmu->base + ARM_SMMU_STRTAB_BASE);
+	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
index 0f9ae032680d..3bcb5d94f21a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
@@ -2,6 +2,7 @@
 #ifndef _ARM_SMMU_V3_COMMON_H
 #define _ARM_SMMU_V3_COMMON_H
 
+#include <linux/bits.h>
 #include <linux/bitfield.h>
 
 /* MMIO registers */
@@ -459,4 +460,15 @@ struct arm_smmu_cmdq_ent {
 #define ARM_SMMU_FEAT_HD		(1 << 22)
 #define ARM_SMMU_FEAT_S2FWB		(1 << 23)
 
+static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
+						 dma_addr_t l2ptr_dma)
+{
+	u64 val = 0;
+
+	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
+	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
+
+	/* The HW has 64 bit atomicity with stores to the L2 STE table */
+	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
+}
 #endif /* _ARM_SMMU_V3_COMMON_H */
\ No newline at end of file
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index fc4bf270c365..6e6ac64a5399 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1504,19 +1504,6 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_master *master)
 	}
 }
 
-/* Stream table manipulation functions */
-static void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
-					  dma_addr_t l2ptr_dma)
-{
-	u64 val = 0;
-
-	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
-	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
-
-	/* The HW has 64 bit atomicity with stores to the L2 STE table */
-	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
-}
-
 struct arm_smmu_ste_writer {
 	struct arm_smmu_entry_writer writer;
 	u32 sid;
@@ -1569,13 +1556,7 @@ static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
 	}
 }
 
-void arm_smmu_make_abort_ste(struct arm_smmu_ste *target)
-{
-	memset(target, 0, sizeof(*target));
-	target->data[0] = cpu_to_le64(
-		STRTAB_STE_0_V |
-		FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT));
-}
+/* Defined in arm-smmu-v3-common.c */
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_make_abort_ste);
 
 VISIBLE_IF_KUNIT
@@ -1702,21 +1683,6 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_make_s2_domain_ste);
 
-/*
- * This can safely directly manipulate the STE memory without a sync sequence
- * because the STE table has not been installed in the SMMU yet.
- */
-static void arm_smmu_init_initial_stes(struct arm_smmu_ste *strtab,
-				       unsigned int nent)
-{
-	unsigned int i;
-
-	for (i = 0; i < nent; ++i) {
-		arm_smmu_make_abort_ste(strtab);
-		strtab++;
-	}
-}
-
 static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 {
 	dma_addr_t l2ptr_dma;
@@ -3667,47 +3633,6 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
 };
 
 /* Probing and initialisation functions */
-int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
-			    struct arm_smmu_queue *q, void __iomem *page,
-			    unsigned long prod_off, unsigned long cons_off,
-			    size_t dwords, const char *name)
-{
-	size_t qsz;
-
-	do {
-		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
-		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
-					      GFP_KERNEL);
-		if (q->base || qsz < PAGE_SIZE)
-			break;
-
-		q->llq.max_n_shift--;
-	} while (1);
-
-	if (!q->base) {
-		dev_err(smmu->dev,
-			"failed to allocate queue (0x%zx bytes) for %s\n",
-			qsz, name);
-		return -ENOMEM;
-	}
-
-	if (!WARN_ON(q->base_dma & (qsz - 1))) {
-		dev_info(smmu->dev, "allocated %u entries for %s\n",
-			 1 << q->llq.max_n_shift, name);
-	}
-
-	q->prod_reg	= page + prod_off;
-	q->cons_reg	= page + cons_off;
-	q->ent_dwords	= dwords;
-
-	q->q_base  = Q_BASE_RWA;
-	q->q_base |= q->base_dma & Q_BASE_ADDR_MASK;
-	q->q_base |= FIELD_PREP(Q_BASE_LOG2SIZE, q->llq.max_n_shift);
-
-	q->llq.prod = q->llq.cons = 0;
-	return 0;
-}
-
 int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
 		       struct arm_smmu_cmdq *cmdq)
 {
@@ -3762,76 +3687,6 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 				       PRIQ_ENT_DWORDS, "priq");
 }
 
-static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
-{
-	u32 l1size;
-	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-	unsigned int last_sid_idx =
-		arm_smmu_strtab_l1_idx((1ULL << smmu->sid_bits) - 1);
-
-	/* Calculate the L1 size, capped to the SIDSIZE. */
-	cfg->l2.num_l1_ents = min(last_sid_idx + 1, STRTAB_MAX_L1_ENTRIES);
-	if (cfg->l2.num_l1_ents <= last_sid_idx)
-		dev_warn(smmu->dev,
-			 "2-level strtab only covers %u/%u bits of SID\n",
-			 ilog2(cfg->l2.num_l1_ents * STRTAB_NUM_L2_STES),
-			 smmu->sid_bits);
-
-	l1size = cfg->l2.num_l1_ents * sizeof(struct arm_smmu_strtab_l1);
-	cfg->l2.l1tab = dmam_alloc_coherent(smmu->dev, l1size, &cfg->l2.l1_dma,
-					    GFP_KERNEL);
-	if (!cfg->l2.l1tab) {
-		dev_err(smmu->dev,
-			"failed to allocate l1 stream table (%u bytes)\n",
-			l1size);
-		return -ENOMEM;
-	}
-
-	cfg->l2.l2ptrs = devm_kcalloc(smmu->dev, cfg->l2.num_l1_ents,
-				      sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
-	if (!cfg->l2.l2ptrs)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
-{
-	u32 size;
-	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-
-	size = (1 << smmu->sid_bits) * sizeof(struct arm_smmu_ste);
-	cfg->linear.table = dmam_alloc_coherent(smmu->dev, size,
-						&cfg->linear.ste_dma,
-						GFP_KERNEL);
-	if (!cfg->linear.table) {
-		dev_err(smmu->dev,
-			"failed to allocate linear stream table (%u bytes)\n",
-			size);
-		return -ENOMEM;
-	}
-	cfg->linear.num_ents = 1 << smmu->sid_bits;
-
-	arm_smmu_init_initial_stes(cfg->linear.table, cfg->linear.num_ents);
-	return 0;
-}
-
-static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
-{
-	int ret;
-
-	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
-		ret = arm_smmu_init_strtab_2lvl(smmu);
-	else
-		ret = arm_smmu_init_strtab_linear(smmu);
-	if (ret)
-		return ret;
-
-	ida_init(&smmu->vmid_map);
-
-	return 0;
-}
-
 static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 {
 	int ret;
@@ -3999,30 +3854,6 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
-{
-	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-	dma_addr_t dma;
-	u32 reg;
-
-	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-		reg = FIELD_PREP(STRTAB_BASE_CFG_FMT,
-				 STRTAB_BASE_CFG_FMT_2LVL) |
-		      FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE,
-				 ilog2(cfg->l2.num_l1_ents) + STRTAB_SPLIT) |
-		      FIELD_PREP(STRTAB_BASE_CFG_SPLIT, STRTAB_SPLIT);
-		dma = cfg->l2.l1_dma;
-	} else {
-		reg = FIELD_PREP(STRTAB_BASE_CFG_FMT,
-				 STRTAB_BASE_CFG_FMT_LINEAR) |
-		      FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, smmu->sid_bits);
-		dma = cfg->linear.ste_dma;
-	}
-	writeq_relaxed((dma & STRTAB_BASE_ADDR_MASK) | STRTAB_BASE_RA,
-		       smmu->base + ARM_SMMU_STRTAB_BASE);
-	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
-}
-
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 367529538eb8..09c1cf85cccc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -553,6 +553,14 @@ int arm_smmu_device_disable(struct arm_smmu_device *smmu);
 struct iommu_group *arm_smmu_device_group(struct device *dev);
 int arm_smmu_of_xlate(struct device *dev, const struct of_phandle_args *args);
 void arm_smmu_get_resv_regions(struct device *dev, struct list_head *head);
+int arm_smmu_init_strtab(struct arm_smmu_device *smmu);
+void arm_smmu_write_strtab(struct arm_smmu_device *smmu);
+void arm_smmu_init_initial_stes(struct arm_smmu_ste *strtab,
+				unsigned int nent);
+int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
+			    struct arm_smmu_queue *q, void __iomem *page,
+			    unsigned long prod_off, unsigned long cons_off,
+			    size_t dwords, const char *name);
 
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
-- 
2.50.1.552.g942d659e1b-goog


