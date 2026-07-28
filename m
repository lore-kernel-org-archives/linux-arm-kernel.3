Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFFEC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cm0UM0cxqHUE45ZL2hDY8rw3TxEhDh2PtS7WGhcbEE=; b=So55ikIsXON+L7qGQJblQ2egjB
	b6yxRuQeFUey03WI0CRzZn37vejqyaMHxGQBPufb7aZLpLlIdulkjVghoCDFBUq5LfsSau9nmnK2Q
	faLEQQOSIEIKuxOxw6G5qZyorNCCk1pDO10Hq2FMxgOYTwKPsse/3vso3C1lbcvwJ8/mS/y9HNRhR
	bbwspG8YNwDqc8hmehwyTFdxf+My1lw8+AugdXlZ/n45lzJUBrrMqfBjJ5uioUczEdC0198xBdCdy
	BAwxigSp7nOHBAMFrhg6Z7oaSSnZgxhM75XWCoqxzRXvmW72UQ68kCtJIohg9wxrubhs6Icv8Rdb9
	3zOYrI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop4R-00000006H2b-3uxA;
	Tue, 28 Jul 2026 21:10:39 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3r-00000006Gds-0e7S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:10:05 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cb7049fa552so138709a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785273001; x=1785877801; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cm0UM0cxqHUE45ZL2hDY8rw3TxEhDh2PtS7WGhcbEE=;
        b=czmolW8D8jZ4NbN5tZn2emBuoUa8suefya2WdrIRMk/Q7q4lydfVJ9JRxyfeVxNiQD
         66QSkGitjnnz/ZzGrSiqPYnZIcOLNSi8ja25HlvNJflTkPTg6mUmfLaS1SLt6yTcFmq6
         Z+5FDY9hFS58wc3tm1v3dgBibR6sG9PmffCbave+TGGqij98cAV0s33k3ElV5BbBwLc/
         w2cbpHEcFkC+LdOo5DYn8HQ5Vq+HYzrCDmGgTwlRP7JRpx7lTNttSXDiKDOOeK0pdDT1
         szmg0DD25bNlxG8bqTplE4xdUeVsz0YyPJ8KdH2bDOIO4HN1wsSgM/3pqJxbB8TTooea
         bKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273001; x=1785877801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cm0UM0cxqHUE45ZL2hDY8rw3TxEhDh2PtS7WGhcbEE=;
        b=NMpC0z4jzX6L0ucYrMYSYr93TnjGfQKwpVcVzLEEhb2YHCYcHC81j6mTv2IFdpyKZu
         nGn7o1fuKHCaigZiVQlpSa/2AjJS0NuSbEwppYeQJBMeU6sjrfq62RePIVbwZJe6H/Yt
         ogQh2zG64Dv3NyzeG3gCOGYeWtimTpa5qU0cnrb3Z/4JJkWWjg8NGx22S2Lvw9GHk4WH
         KWSQV2vdELPKuWLMidUrVAuXlIyCZrBIob/INVpgJ2/wsW+daoZ08ziHiOlXeWoTOcjW
         mWOlN8RDzV/qW8eoSweEB6W7epygXf/AifyPZbE30i+JYd6Q727MHfTXHl7tEhjj08xG
         xfVA==
X-Forwarded-Encrypted: i=1; AHgh+RpXfecyWQle7joQgYH597bxIYhUi+vSu4k2ylOU2bBJGEncTraTtWtnvTFFLicvG4VwrjFmyTpv+jrf9Hmi3VCT@lists.infradead.org
X-Gm-Message-State: AOJu0YxmFMUrgcuIzSBef9c7b/hokDbiH5sn8wx8cj0XU0f3rAvSGA31
	gRniY6/SzSb/ifpLByX4jwj5pTvVvIiYVUK1CJsrB1zSjIwlolInr99Z/RRl9rZYNIA53U1MzVh
	+MA==
X-Received: from pjbqo4.prod.google.com ([2002:a17:90b:3dc4:b0:386:bc47:e8b0])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ccc:b0:38e:2a4:cffc
 with SMTP id 98e67ed59e1d1-38f6a556a32mr4548476a91.25.1785273001338; Tue, 28
 Jul 2026 14:10:01 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:27 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-12-praan@google.com>
Subject: [PATCH v9 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_141003_256061_0E87DCFE 
X-CRM114-Status: GOOD (  32.17  )
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
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  20 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 123 +++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   3 +
 3 files changed, 135 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 76333091ec15..6b0b021df82c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -15,17 +15,28 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
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
-		if (!impl_ops || !impl_ops->hw_info)
-			return ERR_PTR(-EOPNOTSUPP);
-		return impl_ops->hw_info(master->smmu, length, type);
+		void *ret_ptr = ERR_PTR(-EOPNOTSUPP);
+
+		if (impl_ops && impl_ops->hw_info)
+			ret_ptr = impl_ops->hw_info(master->smmu, length, type);
+
+		arm_smmu_rpm_put(master->smmu);
+		return ret_ptr;
 	}
 
 	info = kzalloc_obj(*info);
-	if (!info)
+	if (!info) {
+		arm_smmu_rpm_put(master->smmu);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	base_idr = master->smmu->base + ARM_SMMU_IDR0;
 	for (i = 0; i <= 5; i++)
@@ -39,6 +50,7 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
 	*length = sizeof(*info);
 	*type = IOMMU_HW_INFO_TYPE_ARM_SMMUV3;
 
+	arm_smmu_rpm_put(master->smmu);
 	return info;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1253065b6db4..97e7284fcfcc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -121,7 +121,7 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
 static bool arm_smmu_ats_supported(struct arm_smmu_master *master);
 
 /* Runtime PM helpers */
-__maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
+int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -137,7 +137,7 @@ __maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-__maybe_unused static bool arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
+static bool arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
 {
 	if (!pm_runtime_enabled(smmu->dev))
 		return true;
@@ -145,7 +145,7 @@ __maybe_unused static bool arm_smmu_rpm_get_if_active(struct arm_smmu_device *sm
 	return pm_runtime_get_if_active(smmu->dev) > 0;
 }
 
-__maybe_unused static void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
+void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -1112,7 +1112,9 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 				   struct iommu_page_response *resp)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
 	u8 resume_resp;
+	int ret;
 
 	if (WARN_ON(!master->stall_enabled))
 		return;
@@ -1130,6 +1132,25 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
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
+	if (!arm_smmu_is_active(smmu)) {
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
@@ -1140,6 +1161,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 	 * terminated... at some point in the future. PRI_RESP is fire and
 	 * forget.
 	 */
+	arm_smmu_rpm_put(smmu);
 }
 
 /* Invalidation array manipulation functions */
@@ -1665,7 +1687,6 @@ static void arm_smmu_sync_cd(struct arm_smmu_master *master,
 			smmu, &cmds,
 			arm_smmu_make_cmd_cfgi_cd(master->streams[i].id, ssid,
 						  leaf));
-
 	arm_smmu_cmdq_batch_submit(smmu, &cmds);
 }
 
@@ -1976,9 +1997,9 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
 {
 	struct arm_smmu_ste_writer *ste_writer =
 		container_of(writer, struct arm_smmu_ste_writer, writer);
+	struct arm_smmu_device *smmu = writer->master->smmu;
 
-	arm_smmu_cmdq_issue_cmd_with_sync(
-		writer->master->smmu,
+	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
 		arm_smmu_make_cmd_cfgi_ste(ste_writer->sid, true));
 }
 
@@ -2386,6 +2407,34 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
+	/*
+	 * Use a non-sleeping get to avoid a circular dependency deadlock
+	 * with arm_smmu_runtime_suspend().
+	 *
+	 * When using a combined_irq, the suspend thread waits for pending
+	 * threaded handlers to complete. If the IRQ thread blocks waiting
+	 * for the PM core, it creates a deadlock:
+	 *
+	 *  [Suspend Thread]                  | [IRQ Thread]
+	 *  pm_runtime_suspend()              |
+	 *    state = RPM_SUSPENDING;         |
+	 *                                    | IRQ fires
+	 *                                    | arm_smmu_rpm_get()
+	 *                                    |   sleeps (waiting for suspend)
+	 *  arm_smmu_runtime_suspend()        |
+	 *    ...                             |
+	 *    synchronize_irq()               |
+	 *      sleeps (waiting for IRQ)      |
+	 *
+	 *           <==== DEADLOCK ====>
+	 *
+	 * A non-sleeping get allows the thread to instantly drop the event
+	 * if the device is suspending, safely bypassing the synchronize_irq()
+	 * deadlock.
+	 */
+	if (!arm_smmu_rpm_get_if_active(smmu))
+		return IRQ_NONE;
+
 	do {
 		while (!queue_remove_raw(q, evt)) {
 			arm_smmu_decode_event(smmu, evt, &event);
@@ -2406,6 +2455,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 
 	/* Sync our overflow flag, as we believe we're up to speed */
 	queue_sync_cons_ovf(q);
+	arm_smmu_rpm_put(smmu);
 	return IRQ_HANDLED;
 }
 
@@ -2444,6 +2494,13 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 	struct arm_smmu_ll_queue *llq = &q->llq;
 	u64 evt[PRIQ_ENT_DWORDS];
 
+	/*
+	 * Use non-sleeping get to avoid deadlock.
+	 * (see the comment in arm_smmu_evtq_thread)
+	 */
+	if (!arm_smmu_rpm_get_if_active(smmu))
+		return IRQ_NONE;
+
 	do {
 		while (!queue_remove_raw(q, evt))
 			arm_smmu_handle_ppr(smmu, evt);
@@ -2454,6 +2511,7 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
 
 	/* Sync our overflow flag, as we believe we're up to speed */
 	queue_sync_cons_ovf(q);
+	arm_smmu_rpm_put(smmu);
 	return IRQ_HANDLED;
 }
 
@@ -2508,8 +2566,33 @@ static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
 static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
+	irqreturn_t ret;
 
-	return arm_smmu_handle_gerror(smmu);
+	/*
+	 * Global Errors are only processed if the SMMU is active.
+	 *
+	 * If the STOP_FLAG is set, the SMMU is either already disabled
+	 * or is in the process of being disabled. Any errors captured
+	 * during the quiesce/drain phase will be handled by the explicit
+	 * arm_smmu_handle_gerror() call at the end of the
+	 * arm_smmu_runtime_suspend() callback. On resume, the STOP_FLAG
+	 * is cleared before interrupts are re-enabled, ensuring no valid
+	 * errors are missed.
+	 *
+	 * A lockless check is favoured here over a dynamic PM core check
+	 * since the runtime_pm_get_if_active would return false during
+	 * transient states like RPM_RESUMING & ignore level-triggered
+	 * interrupts.
+	 */
+	if (!arm_smmu_is_active(smmu)) {
+		dev_err(smmu->dev,
+			"Ignoring gerror interrupt because the SMMU is suspended\n");
+		return IRQ_NONE;
+	}
+
+	ret = arm_smmu_handle_gerror(smmu);
+
+	return ret;
 }
 
 static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
@@ -2592,6 +2675,10 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
 	struct arm_smmu_cmd cmd;
 	struct arm_smmu_cmdq_batch cmds;
 
+	/* Shouldn't hit the WARN if there's no devlink inconsistency */
+	if (WARN_ON_ONCE(!arm_smmu_is_active(master->smmu)))
+		return 0;
+
 	cmd = arm_smmu_make_cmd_atc_inv_all(0, IOMMU_NO_PASID);
 	arm_smmu_cmdq_batch_init_cmd(master->smmu, &cmds, &cmd);
 	for (i = 0; i < master->num_streams; i++)
@@ -2837,7 +2924,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 
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
@@ -5019,10 +5115,17 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 static void arm_smmu_disable_action(void *data)
 {
 	struct arm_smmu_device *smmu = data;
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return;
 
 	if (smmu->impl_ops && smmu->impl_ops->device_disable)
 		smmu->impl_ops->device_disable(smmu);
 	arm_smmu_device_disable(smmu);
+
+	arm_smmu_rpm_put(smmu);
 }
 
 static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
@@ -5845,8 +5948,14 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
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
index 24b9969b0b90..15b5d5fad627 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1242,6 +1242,9 @@ static inline bool arm_smmu_is_active(struct arm_smmu_device *smmu)
 	return !Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
 }
 
+int arm_smmu_rpm_get(struct arm_smmu_device *smmu);
+void arm_smmu_rpm_put(struct arm_smmu_device *smmu);
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.55.0.487.gaf234c4eb3-goog


