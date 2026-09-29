Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8CFC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uZDExLzYAB6EpzeDZNXRf2hABc3epv46tayxxhqFt0=; b=Mkim2sNHyfhbYWo9THnhMLytKL
	uHb3OU+uyd12TQNReD2AfzqYI3MQvIuYH+XkG5PiGGHPkq9TzcY6YNHkrh1yRV8+v30dJMfr3rind
	ETd0qLvTkT6WpeY8VfNWM1i2GqI3+rRKar453e5z+KkasVFjS8zYc1+wN6ISqL1UOKW+fIv8Lx9y7
	om3DwkB1cOt2qVe9N5tSB0FZ16qODehFA1dspcB7guQ6D7CxJtlHVLcZvf6W6OD9fi2UAq7VL24QX
	GxkDNi/RZHg6Ddhv67PftusP0hjre5CS4cpAT9qog0yZDQaSFT7fK5H2Unnp107nMrP1+fJXt6lud
	amWaJO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS8p-00000002ap8-2Ixq;
	Tue, 29 Sep 2026 07:20:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS8L-00000002aSo-3Qca
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 07:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/uZDExLzYAB6EpzeDZNXRf2hABc3epv46tayxxhqFt0=; b=QEOJTnpYWiIpPMBoz9co2i8I22
	E2cnPAxUd7fTm1jjVoTwPhbYR/GT0qCWrmVv0GZs+7dEGGJB3bO/XztsWWdW6gyZ0QeMMagKe0Xqy
	6yWwNOd3z/bxzhixF9EnvWZCo/E+nuXNwlU1FkFTT9TbVfEY3T8YCplTDfkFGnYl4g5hZs3f3h4OV
	U5JyZ5mHEa7n60UCEC9fSMAWs/ohPARhjAf4YQWUcJlmWxpW+xVwlJJ1XIpSSXv0gcN5VLjJTROlT
	R7Td2qZVMsLBp7Q/SpFCup8163ynO7QZZjgPIMO2PM6Ev84jiIR/RPR5zX4R8wsWv8nEAf/1cAdJV
	UpkrNxlg==;
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBS8I-00000002Hn8-2yk5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:20:12 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so2054592a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790666408; x=1791271208; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uZDExLzYAB6EpzeDZNXRf2hABc3epv46tayxxhqFt0=;
        b=egd3spC+a/Pchd/mM/WQflTQyig9Ccl9BRoMGYNCqFfTleBDRBt7YGwzIOmYVcJJ6K
         1wM+ciBPn0mpiz2+8Xag54pm3eXbpQ7+ZJNp9lHETgRy1QoYYJ9axwpK+zBY4xsfJy7z
         Kt9KY/L1KIm3V7v1GNPZOz/hV8WqvnpZbhknKd15t1XoSmeB5lCMPh8dOfGx4uRWAMS+
         yB5EXn7qv/T/hsDIoVBoT9zQ4SOeYT7KrCL+46BVWcjfg5PxiYj8Z57JyKr7gBZmbtix
         bCjjeUuXat93BIZZTxDCn2zTaCxGx5FdCUdEr1GiRu6X5QG1UF/v4G8MvODWsAEtRTal
         txYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666408; x=1791271208;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uZDExLzYAB6EpzeDZNXRf2hABc3epv46tayxxhqFt0=;
        b=pQD06epF9QZlhmUePUX5kXYh3Tdtkky9ySsfVN5JCzkPemBfnF2bT43L3FWo3GCTaV
         FgDl8Z5WKsGu402BlmKW4YmD/yFv2hik9482GqHj4nM9XrVMJ3ht3b9n8CgGny6rE1XR
         teKfDV1taTG/GHzV5FMKhxfl1y/tTnSvMekfooAXwqHlKH+/xvG8fqWj1Ykgsh/JXcV3
         YOo4iC6bO5hwV5SbF5IRPrh9cmlDyN9Lt6IGJSxzcfY4yoHNTfEMR988pLJ9ZYSoeqHF
         9baoCeufN0v55nR+miweN8uI3Jyvmt2QAjr4attcLmMpl+fwhzSNICAmEudVNNmRLGj9
         fCvA==
X-Forwarded-Encrypted: i=1; AKwUvByzuhWLucsVFJFXS/gVkn58Xr8lLouQNsa0abajmiY1UNbdwxeKzJUNCk2jfH/Qd9yACVW84Qa4Bdx0hrfGBm+Y@lists.infradead.org
X-Gm-Message-State: AFuF++kPN+uzPHvGYZgNatglw3w1iYiHG7B3wqEpgj7hL7Nm2hgolwyx
	kJOGMmb7+4mu0nzW5SygSQ1jUIvl52uFEZrWCmxCGGg0l8UBvRix1ktSeUUzZF9jO4qQgSjamFt
	a4g==
X-Received: from pgdj8.prod.google.com ([2002:a05:6a02:5208:b0:cc7:9685:757a])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c709:b0:3da:34a7:6444
 with SMTP id adf61e73a8af0-3de0e73aba9mr14757995637.26.1790666407830; Tue, 29
 Sep 2026 00:20:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:19:47 +0000
In-Reply-To: <20260929071950.2710070-1-praan@google.com>
Mime-Version: 1.0
References: <20260929071950.2710070-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929071950.2710070-7-praan@google.com>
Subject: [RFC PATCH v1 6/9] iommu/arm-smmu-v3: Implement Live Update shutdown
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_082011_113295_20B1B734 
X-CRM114-Status: GOOD (  25.60  )
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

During a Kexec Handover (KHO) with Live Update enabled, the SMMUv3
must not be disabled (via CR0.SMMUEN=0) during device shutdown since
doing so would instantly stop active DMA traffic preserved for masters.

Modify the .shutdown hook to install abort STEs for unpreserved masters,
invalidate the L1STDs of unpreserved L2 tables and flush the config and
TLB caches. Mask the interrupts, wait for the EVTQ handler and disable
the queues, leaving SMMUEN set. Fall back to a full disable on failure.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c  | 120 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  25 +++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  12 ++
 3 files changed, 152 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
index 981b091a47a1..68652123d0e1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-liveupdate.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
 #include <linux/iommu.h>
 #include <linux/iommu-liveupdate.h>
 #include <linux/kexec_handover.h>
@@ -429,6 +430,125 @@ void arm_smmu_unpreserve(struct iommu_device *iommu,
 		arm_smmu_unpreserve_strtab_linear(smmu, iommu_ser);
 }
 
+static void arm_smmu_liveupdate_clear_l1_std(struct arm_smmu_device *smmu,
+					     unsigned long *l2_active)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	int i;
+
+	for (i = 0; i < cfg->l2.num_l1_ents; i++) {
+		if (!cfg->l2.l2ptrs[i] || test_bit(i, l2_active))
+			continue;
+
+		/* Clear L1 STD for unpreserved streams */
+		WRITE_ONCE(cfg->l2.l1tab[i].l2ptr, 0);
+	}
+}
+
+int arm_smmu_liveupdate_shutdown(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_master *master;
+	struct arm_smmu_stream *stream;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct rb_node *node;
+	struct arm_smmu_ste abort_ste;
+	struct arm_smmu_cmd cmd_cfgi, cmd_el2, cmd_nsnh;
+	unsigned long *l2_active = NULL;
+	bool is_2lvl = smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB;
+	u32 cr0;
+	int ret;
+
+	/* Only the incoming kernel unmasks the SMMU interrupts again */
+	if (arm_smmu_disable_irqs(smmu))
+		dev_warn(smmu->dev, "failed to disable irqs\n");
+
+	/* Wait for a running EVTQ handler */
+	if (smmu->combined_irq || smmu->evtq.q.irq)
+		synchronize_irq(smmu->combined_irq ?: smmu->evtq.q.irq);
+
+	if (is_2lvl) {
+		l2_active = bitmap_zalloc(cfg->l2.num_l1_ents, GFP_KERNEL);
+		if (!l2_active) {
+			dev_err(smmu->dev, "OOM: Falling back to hard disable\n");
+			return -ENOMEM;
+		}
+	}
+
+	/* Prepare an abort STE for unpreserved masters */
+	arm_smmu_make_abort_ste(&abort_ste);
+
+	/*
+	 * We do not scrub unpreserved Context Descriptors (CDs) here since:
+	 *
+	 * 1. Each master has its own independently allocated CD table page,
+	 *    i.e. multiple masters never share a CD table.
+	 *
+	 * 2. We explicitly reject preserving any device with active PASIDs in
+	 *    the .preserve_device op. Thus, any preserved master is guaranteed
+	 *    to only be using CD[0].
+	 *
+	 * Therefore, partial preservation within a CD table is not possible,
+	 * and we only need to isolate unpreserved streams within shared
+	 * Stream Tables.
+	 */
+	mutex_lock(&smmu->streams_mutex);
+
+	/* Install the abort STEs for unpreserved masters */
+	for (node = rb_first(&smmu->streams); node; node = rb_next(node)) {
+		stream = rb_entry(node, struct arm_smmu_stream, node);
+		master = stream->master;
+
+		if (master->preserved) {
+			if (is_2lvl)
+				set_bit(arm_smmu_strtab_l1_idx(stream->id), l2_active);
+		} else {
+			arm_smmu_write_ste(master, stream->id,
+				  arm_smmu_get_step_for_sid(smmu, stream->id),
+				  &abort_ste);
+		}
+	}
+
+	/* Invalidate completely unpreserved streams */
+	if (is_2lvl) {
+		arm_smmu_liveupdate_clear_l1_std(smmu, l2_active);
+		bitmap_free(l2_active);
+	}
+
+	mutex_unlock(&smmu->streams_mutex);
+
+	/* Sync hardware caches to observe updated structures */
+	cmd_cfgi = arm_smmu_make_cmd_cfgi_all();
+	arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &cmd_cfgi, 1, true);
+
+	/*
+	 * Aggressively flush all TLBs to ensure no stale entries exist for
+	 * unpreserved streams. The preserved streams will take a minor hit
+	 * re-walking their page tables, but this guarantees safety.
+	 */
+	if (smmu->features & ARM_SMMU_FEAT_HYP) {
+		cmd_el2 = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_EL2_ALL);
+		arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &cmd_el2, 1, true);
+	}
+
+	cmd_nsnh = arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NSNH_ALL);
+	arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &cmd_nsnh, 1, true);
+
+	/*
+	 * No need to drain the CMDQ: the invalidations above are synced, no
+	 * other submitters are left at shutdown and the incoming kernel
+	 * invalidates everything again.
+	 * TODO: Quiesce the CMDQV VCMDQs assigned to guests.
+	 */
+
+	/* Disable the queues, leaving SMMUEN set for the preserved masters */
+	cr0 = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+	cr0 &= ~(CR0_CMDQEN | CR0_EVTQEN | CR0_PRIQEN);
+	ret = arm_smmu_write_reg_sync(smmu, cr0, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);
+	if (ret)
+		dev_err(smmu->dev, "failed to disable queues\n");
+	return ret;
+}
+
 static int arm_smmu_liveupdate_restore_strtab_2lvl(struct arm_smmu_device *smmu,
 						   struct iommu_hw_ser *iommu_ser,
 						   u32 cfg_reg, phys_addr_t base)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b13ed06a368f..3cf97f451b64 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1853,9 +1853,9 @@ static const struct arm_smmu_entry_writer_ops arm_smmu_ste_writer_ops = {
 	.get_update_safe = arm_smmu_get_ste_update_safe,
 };
 
-static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
-			       struct arm_smmu_ste *ste,
-			       const struct arm_smmu_ste *target)
+void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
+			struct arm_smmu_ste *ste,
+			const struct arm_smmu_ste *target)
 {
 	struct arm_smmu_device *smmu = master->smmu;
 	struct arm_smmu_ste_writer ste_writer = {
@@ -4813,8 +4813,8 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
-				   unsigned int reg_off, unsigned int ack_off)
+int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
+			    unsigned int reg_off, unsigned int ack_off)
 {
 	u32 reg;
 
@@ -4998,6 +4998,12 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+int arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
+{
+	return arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+				       ARM_SMMU_IRQ_CTRLACK);
+}
+
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 {
 	int ret;
@@ -5919,6 +5925,15 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
+	if (iommu_preserved_state(&smmu->iommu)) {
+		if (!arm_smmu_liveupdate_shutdown(smmu))
+			return;
+	}
+
+	/*
+	 * Disable the SMMU on standard shutdown/reboot.
+	 * Fallback to this path if the Live Update shutdown failed.
+	 */
 	arm_smmu_device_disable(smmu);
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 453ad34ab0fa..0a88c0ec66ca 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1198,6 +1198,9 @@ to_smmu_nested_domain(struct iommu_domain *dom)
 extern struct mutex arm_smmu_asid_lock;
 
 struct arm_smmu_domain *arm_smmu_domain_alloc(void);
+int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
+			    unsigned int reg_off, unsigned int ack_off);
+int arm_smmu_disable_irqs(struct arm_smmu_device *smmu);
 
 #ifdef CONFIG_IOMMU_LIVEUPDATE
 int arm_smmu_preserve_device(struct device *dev,
@@ -1208,9 +1211,14 @@ void arm_smmu_unpreserve_device(struct device *dev,
 				struct iommu_device_ser *device_ser);
 void arm_smmu_unpreserve(struct iommu_device *iommu,
 			 struct iommu_hw_ser *iommu_ser);
+int arm_smmu_liveupdate_shutdown(struct arm_smmu_device *smmu);
 int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu);
 int arm_smmu_liveupdate_restore_cd_tables(struct arm_smmu_master *master);
 #else
+static inline int arm_smmu_liveupdate_shutdown(struct arm_smmu_device *smmu)
+{
+	return -EOPNOTSUPP;
+}
 static inline int arm_smmu_liveupdate_restore_strtab(struct arm_smmu_device *smmu)
 {
 	return -ENOENT;
@@ -1242,6 +1250,10 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
 		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
 		       struct arm_smmu_cd *cd, struct iommu_domain *old);
 
+void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
+			struct arm_smmu_ste *ste,
+			const struct arm_smmu_ste *target);
+
 void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi,
 			  struct arm_smmu_domain *smmu_domain);
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


