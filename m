Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FB7CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPpsBKF6xA27nEQH7LwvT80D8e5Un4lreTVjr0IDsS8=; b=ujuqSqvYsW2su1vqNWTuPEn4PE
	3Kar72YFoBYDNC5DhpffzCMTSCw8+9YCXWXfV4lvzSIW0SMqpjjCjhmv0MNc2lvn0Pnd+to/18MA3
	lETW4REKqUMsH47BT8UegBMCQ9lr06DZSNEXI3X/dV0qsuxLF2I8Ypr1jXLwWdLnUJUaB5pMQXaRU
	Jv4xR8kQXvAJiX0nG8jfXcLaIpJqnF/rawi5SIVIPrWSfxkvAjt9dWTlqktOVyn+thrWpI8kzDcie
	IzxBMf8FT0e9XKDhS0vVdJtiM/H9tLefq9/XEOF2cnSWZIFICypVcezaInlfGVncDrXA1cCl4mwoN
	43LBFKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfa-0000000Bta6-1F0s;
	Mon, 01 Jun 2026 21:59:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfY-0000000BtVq-0UyN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:37 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36bbdcf36f0so2665358a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351175; x=1780955975; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPpsBKF6xA27nEQH7LwvT80D8e5Un4lreTVjr0IDsS8=;
        b=ad4CKm7movhIP4n7pNtcZYgeUcM2VIs+RwK5qIHmDwJrx/sssN89S6kr5Zlirww/pC
         AkXBfou+MbTQCLOa1X0LCgNaUwg847efZZst45UcTUuPZCRc+sLIyWfdW5lxcensSw38
         TPi0K4k7QGHNntI4tHbl9GG3bIxz0+WT/qOg7yDodSeeEuCLzkwku9HnKSrfTg0dKPsw
         7z3WT4ulGXqH9itroiXem08QLjTXGgPXll+LWJ/by+eL2s9fR9aqCeQEJZqefvMyjhBV
         LBY5n0aWfcwocw2OIf759hNrgiBfOXO8aFqJfD+7g3Ezdcxe5IIvNzQPpM7SBm8YaPdt
         pwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351175; x=1780955975;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPpsBKF6xA27nEQH7LwvT80D8e5Un4lreTVjr0IDsS8=;
        b=bw2i92u6p1UFEqi0vzEwneyzkOxOLMSlNGqZIBFFxLlZq69WDP1iAdb+oTYaYv7US6
         Rq3FkIAf8eSp3CNINM+TsjzgtJyMfLdSbq+/WIz128ycEIS7lzmqYUIqLqMIzkakzVul
         Mwzg1UM9vwKT6yzLYGHfMR1dx0f7kreTm8pz4oEnOGdjH3mcsbEMRWvFRqENu0yliXfc
         Vy3/tERjgW+m1gxWhmbBbYmxO/zX7G+57gXhmtHe+H0O9TDV7SbTsaYzWb7V9fvj875E
         JJJ9ZI2ksKV5/RVmlJqBIzLmjXxDIBHbLVTVJcirpykmN5Xa78lzdfZ6XDD0N0ry8+7O
         staQ==
X-Forwarded-Encrypted: i=1; AFNElJ/s/P9pNe92yMDBZ1MZxC7J00TEBOy6R1y4KsayiMoBF7CPdPUHE+7zMqgS19O7EnGe2YFNV7QgGv0XOHJ5u06M@lists.infradead.org
X-Gm-Message-State: AOJu0YwPC+yn3DJxF6fSGH49RKy9nzQWmW7qNuKpU3v8a3VhHQKf8tWZ
	/ksRsfTycOYPk/xQS+Ic+JGhwp30DiDwYQCXAfBYxJJ8665Ca3eDw9xNTGeLy+7bHeFKONMG9AE
	xZw==
X-Received: from pjbco19.prod.google.com ([2002:a17:90a:fe93:b0:36b:7407:9b73])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88d:b0:369:9469:aeba
 with SMTP id 98e67ed59e1d1-36dd91b95d2mr889236a91.1.1780351174484; Mon, 01
 Jun 2026 14:59:34 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:08 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-12-praan@google.com>
Subject: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145936_182549_A74B7DD4 
X-CRM114-Status: GOOD (  31.20  )
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

Invoke the pm_runtime helpers at all places before accessing the hw.
The idea is to invoke runtime_pm helpers at common points which are used
by exposed ops or interrupt handlers. TLB and CFG invalidations are
elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  10 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 101 ++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   5 +-
 3 files changed, 108 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 1e9f7d2de344..2d729034e3bb 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -15,6 +15,11 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
 	struct iommu_hw_info_arm_smmuv3 *info;
 	u32 __iomem *base_idr;
 	unsigned int i;
+	int ret;
+
+	ret = arm_smmu_rpm_get(master->smmu);
+	if (ret < 0)
+		return ERR_PTR(-EIO);
 
 	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
 	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
@@ -24,8 +29,10 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
 	}
 
 	info = kzalloc_obj(*info);
-	if (!info)
+	if (!info) {
+		arm_smmu_rpm_put(master->smmu);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	base_idr = master->smmu->base + ARM_SMMU_IDR0;
 	for (i = 0; i <= 5; i++)
@@ -36,6 +43,7 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
 	*length = sizeof(*info);
 	*type = IOMMU_HW_INFO_TYPE_ARM_SMMUV3;
 
+	arm_smmu_rpm_put(master->smmu);
 	return info;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 24a1bcc8974f..2e260f85b8fd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -112,7 +112,7 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
 static bool arm_smmu_ats_supported(struct arm_smmu_master *master);
 
 /* Runtime PM helpers */
-__maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
+int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -128,7 +128,7 @@ __maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-__maybe_unused static void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
+void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -983,7 +983,9 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 				   struct iommu_page_response *resp)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
 	u8 resume_resp;
+	int ret;
 
 	if (WARN_ON(!master->stall_enabled))
 		return;
@@ -1001,6 +1003,25 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 		break;
 	}
 
+	/*
+	 * The SMMU is guaranteed to be active via device_link if any master is
+	 * active. Furthermore, on suspend we set GBPA to abort, flushing any
+	 * pending stalled transactions.
+	 *
+	 * Receiving a page fault while suspended implies a bug in the power
+	 * dependency chain or a stale event. Since the SMMU is powered down
+	 * and the command queue is inaccessible, we cannot issue the
+	 * RESUME command and must drop it.
+	 */
+	if (arm_smmu_cmdq_can_elide(smmu)) {
+		dev_err(smmu->dev, "Ignoring page fault while suspended\n");
+		return;
+	}
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return;
+
 	arm_smmu_cmdq_issue_cmd(master->smmu,
 				arm_smmu_make_cmd_resume(master->streams[0].id,
 							 resp->grpid,
@@ -1011,6 +1032,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 	 * terminated... at some point in the future. PRI_RESP is fire and
 	 * forget.
 	 */
+	arm_smmu_rpm_put(smmu);
 }
 
 /* Invalidation array manipulation functions */
@@ -1536,7 +1558,6 @@ static void arm_smmu_sync_cd(struct arm_smmu_master *master,
 			smmu, &cmds,
 			arm_smmu_make_cmd_cfgi_cd(master->streams[i].id, ssid,
 						  leaf));
-
 	arm_smmu_cmdq_batch_submit(smmu, &cmds);
 }
 
@@ -1828,9 +1849,9 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
 {
 	struct arm_smmu_ste_writer *ste_writer =
 		container_of(writer, struct arm_smmu_ste_writer, writer);
+	struct arm_smmu_device *smmu = writer->master->smmu;
 
-	arm_smmu_cmdq_issue_cmd_with_sync(
-		writer->master->smmu,
+	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
 		arm_smmu_make_cmd_cfgi_ste(ste_writer->sid, true));
 }
 
@@ -2230,6 +2251,7 @@ static void arm_smmu_dump_event(struct arm_smmu_device *smmu, u64 *raw,
 
 static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 {
+	int ret;
 	u64 evt[EVTQ_ENT_DWORDS];
 	struct arm_smmu_event event = {0};
 	struct arm_smmu_device *smmu = dev;
@@ -2238,6 +2260,10 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return IRQ_NONE;
+
 	do {
 		while (!queue_remove_raw(q, evt)) {
 			arm_smmu_decode_event(smmu, evt, &event);
@@ -2258,6 +2284,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 
 	/* Sync our overflow flag, as we believe we're up to speed */
 	queue_sync_cons_ovf(q);
+	arm_smmu_rpm_put(smmu);
 	return IRQ_HANDLED;
 }
 
@@ -2295,6 +2322,11 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 	struct arm_smmu_queue *q = &smmu->priq.q;
 	struct arm_smmu_ll_queue *llq = &q->llq;
 	u64 evt[PRIQ_ENT_DWORDS];
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return IRQ_NONE;
 
 	do {
 		while (!queue_remove_raw(q, evt))
@@ -2306,6 +2338,7 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 
 	/* Sync our overflow flag, as we believe we're up to speed */
 	queue_sync_cons_ovf(q);
+	arm_smmu_rpm_put(smmu);
 	return IRQ_HANDLED;
 }
 
@@ -2361,8 +2394,33 @@ static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
+	irqreturn_t ret;
+
+	/*
+	 * Global Errors are only processed if the SMMU is active.
+	 *
+	 * If the STOP_FLAG is set (can_elide == true), the hardware is
+	 * either already disabled or in the process of being disabled.
+	 * Any errors captured during the quiesce/drain phase will be
+	 * handled by the explicit arm_smmu_handle_gerror() call at the
+	 * end of arm_smmu_runtime_suspend() callback. On resume, the
+	 * STOP_FLAG is cleared before interrupts are re-enabled, ensuring
+	 * no valid errors are missed.
+	 *
+	 * A lockless check is favoured here over a dynamic PM core check
+	 * since the runtime_pm_get_if_active would return false during
+	 * transient states like RPM_RESUMING & ignore level-triggered
+	 * interrupts.
+	 */
+	if (arm_smmu_cmdq_can_elide(smmu)) {
+		dev_err(smmu->dev,
+			"Ignoring gerror interrupt because the SMMU is suspended\n");
+		return IRQ_NONE;
+	}
+
+	ret = arm_smmu_handle_gerror(smmu);
 
-	return arm_smmu_handle_gerror(smmu);
+	return ret;
 }
 
 static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
@@ -2445,6 +2503,10 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
 	struct arm_smmu_cmd cmd;
 	struct arm_smmu_cmdq_batch cmds;
 
+	/* Shouldn't hit the WARN if there's no devlink inconsistency */
+	if (WARN_ON_ONCE(arm_smmu_cmdq_can_elide(master->smmu)))
+		return 0;
+
 	cmd = arm_smmu_make_cmd_atc_inv_all(0, IOMMU_NO_PASID);
 	arm_smmu_cmdq_batch_init_cmd(master->smmu, &cmds, &cmd);
 	for (i = 0; i < master->num_streams; i++)
@@ -2690,7 +2752,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 
 		if (cmds.num &&
 		    (next == end || arm_smmu_invs_end_batch(cur, next))) {
+
+			/*
+			 * Concurrent suspend races are benign: the cmdq allocation cmpxchg
+			 * loop acts as the serialization point to safely drop the batch
+			 * without MMIO accesses. Concurrent resume is caught by the HW
+			 * reset cache invalidation, ensuring state consistency.
+			 */
 			arm_smmu_cmdq_batch_submit(smmu, &cmds);
+
+			/* Drop this batch to ensure the next one's fresh */
 			cmds.num = 0;
 		}
 		cur = next;
@@ -2703,6 +2774,9 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 {
 	struct arm_smmu_invs *invs;
 
+	if (arm_smmu_cmdq_can_elide(smmu_domain->smmu))
+		return;
+
 	/*
 	 * An invalidation request must follow some IOPTE change and then load
 	 * an invalidation array. In the meantime, a domain attachment mutates
@@ -5631,10 +5705,19 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 static void arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
+	int ret;
 
 	iommu_device_unregister(&smmu->iommu);
 	iommu_device_sysfs_remove(&smmu->iommu);
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret <  0)
+		goto free_iopf;
+
 	arm_smmu_device_disable(smmu);
+	arm_smmu_rpm_put(smmu);
+
+free_iopf:
 	iopf_queue_free(smmu->evtq.iopf);
 	ida_destroy(&smmu->vmid_map);
 }
@@ -5642,8 +5725,14 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
 static void arm_smmu_device_shutdown(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return;
 
 	arm_smmu_device_disable(smmu);
+	arm_smmu_rpm_put(smmu);
 }
 
 static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 51a3281a1e46..0bd5ad2670e0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1230,11 +1230,14 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
  * If we lose the race, that loop observes Q_STOP == 1 and safely
  * drops the command. If we win, the suspend thread waits for us.
  */
-static inline bool arm_smmu_can_elide(struct arm_smmu_device *smmu)
+static inline bool arm_smmu_cmdq_can_elide(struct arm_smmu_device *smmu)
 {
 	return !!Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
 }
 
+int arm_smmu_rpm_get(struct arm_smmu_device *smmu);
+void arm_smmu_rpm_put(struct arm_smmu_device *smmu);
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.54.0.1013.g208068f2d8-goog


