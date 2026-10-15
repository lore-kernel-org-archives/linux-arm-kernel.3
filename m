Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6045ACCA467
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaAoLgM/CtoTiNdadIKWG+p+UJsFKFHvL5NWzPeT3Ac=; b=1q0b7z0yaKFavFyIlGO29rAGIv
	Qo6Tplrg4R+82xy9+z9GjmZ2uQZLAS2+130n1H7NKvyZs4UhY3dFlhU1MfkGdahDzwF0wZXjJnmxa
	6mfqIgBXqvDxzl5o1MvVmXnzXaheo0dsPYIdColXgjN1Lhu5mju6FxF+rM6hyVu2Wg6lIV+pYIhIc
	y8CiimR9R7IBez+I1vmuyiJkeBcec1FLQc5UqlV/swxihjGUtXrRVuX2nf4LiQQaSuPr81gi/SVn2
	jx+jYfzxd9QSiLmFqM/5k1dkltKdmfxYQ2rgM1sIlzXlMvyhm8+NyOXWrhveTXJ3ah01svlET3f7a
	XEZdrHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlm-00000001IR1-2LsF;
	Thu, 15 Oct 2026 20:09:42 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlb-00000001IB5-2rr1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:32 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a17b4c613fso29117875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094969; x=1792699769; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaAoLgM/CtoTiNdadIKWG+p+UJsFKFHvL5NWzPeT3Ac=;
        b=ktvW5wIhf912XvRGf77vh9M+czUXWChAG/BFbtDsvuDeUfUFa2FYN1t3A5jUsNjS62
         i4yT6Mo08BEQZI6LaH1suAVPiStM+oR/sSOX6kbz/MHUTAoyAiqZSyTz4z5xwkoFsHxT
         HpFxsdWBPcrjSDGu2ejBNGjrCK3r5eJGP49nIXQ6p3rPN7RKxOUmOltEeBQwN/dVILTV
         gGSM1Vm1q1vQrpQUU+t7ggwEQfH9zPNDnIen9gO6wKMkKmLZmkqfkqn8dHq4104pk9VH
         5w0fDH2FmZ6bDtgnyM4TlVdnBlVheX822k7vosLiNsHxYdKwyI7xT6WvkEVT1YZrtxas
         WDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094969; x=1792699769;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TaAoLgM/CtoTiNdadIKWG+p+UJsFKFHvL5NWzPeT3Ac=;
        b=gZBZDz+99lgOguPLN44MHaumQYjh8l/1VvCWv+UwX3HVzkkA+RpScPyYhA6IZ4rn4f
         bJ+2M0Ez6zcuU5qn0Tr0+VpVUPppaLprowXvLFMi0uiI2DY6vSSUzTiNXQ60ey/jy6tI
         1QAMcipw/S1OLw9BZ/GGgmx3yGgKlJXZnPDu7gVrA57bqKuT5Zf06ad+JJ2kS/Lmx/sa
         wtAVIEmAKZSOW7q0c9UsdDJQksVA3xVwDzqld2Bc3idJEkL6ib8Adp6LMMz1FUu5lETG
         phdOqVUMoNXbLlxKj2bK9AThFv0k5yCsOQucCwHekuR4rApd7PYqzte3UTSyZg2QIGSW
         GLKA==
X-Gm-Message-State: AFq9FYLqSb1QRyXJPsXL3XXDrGfv5PXebq2iBWEfJsnICPWlx3lk+Y5z
	E0OzASC9T5mn1m20BCZevQb1O0aKQ2AidY1lYsb9oNl/jBnYh2X4Mt6YQkHemgEXue4Soo9PZZR
	dmsGHHDS8HACmgWbXxS+PydFCjavQn9i0KOwJ8+2VlIqDocA+pU9xv8WrAlhz5VdbdmtvTOOZsx
	UdkY+mggDyglWZ/rZV6OrT7I4vfmhrB42WPiQozA6rYkDjKxl6f5O+Xh3Dla4JnDwp8A==
X-Received: from wmqh18.prod.google.com ([2002:a05:600c:3512:b0:4a1:93c0:d3c2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6215:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a18e4ca157mr369276785e9.22.1792094968875;
 Thu, 15 Oct 2026 13:09:28 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:46 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-16-smostafa@google.com>
Subject: [PATCH v9 15/25] iommu/arm-smmu-v3-kvm: Add CMDQ functions
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
X-CRM114-CacheID: sfid-20261015_130931_774078_7E213EDC 
X-CRM114-Status: GOOD (  19.93  )
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

Add the command queue accessors. The hypervisor's own commands, such as
TLB invalidations, go through smmu_send_cmd(), which queues the command
followed by a CMD_SYNC and waits for completion. Filtered host commands
are copied into the shadow queue with smmu_add_cmd_raw().

Polling is bounded by a 1 ms timeout measured with the architected
counter, and sleeps in WFE when the SMMU supports SEV.

Split queue_space() out of queue_has_space(), as the emulation will
check the space in the host's queue.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 ++-
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 119 ++++++++++++++++++
 2 files changed, 127 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index d07fca3d1cf5..bc2e7e10200a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1287,19 +1287,21 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 bool arm_smmu_erratum_repeat_tlbi_cfgi(void);
 
 /* Queue and STE functions shared between kernel and hyp. */
-static inline bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
+static inline u32 queue_space(struct arm_smmu_ll_queue *q)
 {
-	u32 space, prod, cons;
+	u32 prod, cons;
 
 	prod = Q_IDX(q, q->prod);
 	cons = Q_IDX(q, q->cons);
 
 	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
-		space = (1 << q->max_n_shift) - (prod - cons);
-	else
-		space = cons - prod;
+		return (1 << q->max_n_shift) - (prod - cons);
+	return cons - prod;
+}
 
-	return space >= n;
+static inline bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
+{
+	return queue_space(q) >= n;
 }
 
 static inline bool queue_full(struct arm_smmu_ll_queue *q)
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 02e7c6175832..c9fc21e405e7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -25,6 +25,42 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
 #define cmdq_size(cmdq)	((1UL << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
 
+static u32 timer_freq;
+
+static inline u64 hyp_clock_ns(void)
+{
+	return mul_u64_u32_div(__arch_counter_get_cntvct(), NSEC_PER_SEC, timer_freq);
+}
+
+#define ARM_SMMU_EL2_POLL_TIMEOUT_US	1000
+/*
+ * Wait until @__cond is true. With @__use_wfe, sleep in WFE between polls:
+ * interrupts are masked at EL2, so only the SMMU's SEV or the timer event
+ * stream wakes the CPU, and the timeout is only checked once awake.
+ * Return 0 on success, or -ETIMEDOUT.
+ */
+#define smmu_wait(__use_wfe, __cond)					\
+({									\
+	int __ret = 0;							\
+	u64 __start = hyp_clock_ns();					\
+	u64 __timeout = ARM_SMMU_EL2_POLL_TIMEOUT_US * NSEC_PER_USEC;	\
+									\
+	while (!(__cond)) {						\
+		if (__use_wfe) {					\
+			wfe();						\
+		} else {						\
+			cpu_relax();					\
+		}							\
+		if ((hyp_clock_ns() - __start) >= __timeout) {		\
+			if (__cond)					\
+				break;					\
+			__ret = -ETIMEDOUT;				\
+			break;						\
+		}							\
+	}								\
+	__ret;								\
+})
+
 static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
 {
 	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
@@ -77,6 +113,85 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
 	return 0;
 }
 
+__maybe_unused
+static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
+{
+	struct arm_smmu_ll_queue *llq = &cmdq->llq;
+
+	WRITE_ONCE(llq->cons, readl_relaxed(cmdq->cons_reg));
+	return queue_has_space(llq, n);
+}
+
+static bool smmu_cmdq_full(struct arm_smmu_queue *cmdq)
+{
+	struct arm_smmu_ll_queue *llq = &cmdq->llq;
+
+	WRITE_ONCE(llq->cons, readl_relaxed(cmdq->cons_reg));
+	return queue_full(llq);
+}
+
+static bool smmu_cmdq_empty(struct arm_smmu_queue *cmdq)
+{
+	struct arm_smmu_ll_queue *llq = &cmdq->llq;
+
+	WRITE_ONCE(llq->cons, readl_relaxed(cmdq->cons_reg));
+	return queue_empty(llq);
+}
+
+static void smmu_add_cmd_raw(struct hyp_arm_smmu_v3_device *smmu,
+			     u64 *cmd)
+{
+	struct arm_smmu_queue *q = &smmu->cmdq;
+	struct arm_smmu_ll_queue *llq = &q->llq;
+
+	queue_write(Q_ENT(q, llq->prod), cmd, CMDQ_ENT_DWORDS);
+	llq->prod = queue_inc_prod_n(llq, 1);
+}
+
+static int smmu_add_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			struct arm_smmu_cmd *cmd)
+{
+	int ret;
+
+	hyp_assert_lock_held(&smmu->hw_lock);
+	ret = smmu_wait(smmu->features & ARM_SMMU_FEAT_SEV,
+			!smmu_cmdq_full(&smmu->cmdq));
+	if (ret)
+		return ret;
+
+	smmu_add_cmd_raw(smmu, cmd->data);
+	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+	return 0;
+}
+
+static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	struct arm_smmu_cmd cmd;
+
+	hyp_assert_lock_held(&smmu->hw_lock);
+	cmd = arm_smmu_make_cmd_sync(CMDQ_SYNC_0_CS_SEV, 0);
+	ret = smmu_add_cmd(smmu, &cmd);
+	if (ret)
+		return ret;
+
+	return smmu_wait(false, smmu_cmdq_empty(&smmu->cmdq));
+}
+
+__maybe_unused
+static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			 struct arm_smmu_cmd *cmd)
+{
+	int ret;
+
+	hyp_assert_lock_held(&smmu->hw_lock);
+	ret = smmu_add_cmd(smmu, cmd);
+	if (ret)
+		return ret;
+
+	return smmu_sync_cmd(smmu);
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
@@ -202,6 +317,10 @@ static int smmu_init(void)
 	if (!PAGE_ALIGNED(kvm_hyp_arm_smmu_v3_smmus))
 		return -EINVAL;
 
+	timer_freq = read_sysreg(cntfrq_el0);
+	if (!timer_freq || timer_freq > NSEC_PER_SEC)
+		return -EINVAL;
+
 	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
 	pfn = hyp_virt_to_pfn(kvm_hyp_arm_smmu_v3_smmus);
 	nr_pages = smmu_arr_size >> PAGE_SHIFT;
-- 
2.56.0.176.g3575e65682-goog


