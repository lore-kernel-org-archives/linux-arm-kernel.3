Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAC0C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmaCz/hZ0Y09KM1Z6dU4zeUMZqIx6D4vddfShUP8jOw=; b=I2viQUR7dnRH8wi0eIPiQAy1FI
	0/+mA6wpAlOtNZoSKEN7udo6v++0EwrHa4csmVbYqBb0EyEwHAVR61mAUk7l4jU42eqijiH8ev4DE
	fM4w9kCGJmJTP0YUAlG+ZRXN0/7awy6HEtHHZOhJ3aiEfeIRhk5JzYW6pugm05cMkzRmDtJVQUBdY
	5mGSNF4unRe+nGGM2lDhOEboMUmms3jxY5bhS5wkK5pzk+1jRQ8jWv0UkU3XthvJkK30/x1/9Cx2T
	k7PnsLghPVr59YsuZKGUtN5ukYQNEUAWqgysrovVvfYSuOrX6AEPCteuy4r5qS2aL5G164N2tE7wX
	FL++kiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTil-0000000FHw3-3yld;
	Mon, 28 Jul 2025 19:41:15 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2p-0000000F8xz-0cDL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-456013b59c1so25260215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725230; x=1754330030; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nmaCz/hZ0Y09KM1Z6dU4zeUMZqIx6D4vddfShUP8jOw=;
        b=zdU3zliyfy9DTmNYIgt7nd6Qs6c/VWWSHd1f+vW6yfZfrrrrrVD8DtUiNkagFocm2G
         4FklHvfRpNqr4SkZDQGxtgFAE5YUnaKc8GsSFFNNOAodNwzAECC7HtxD6WtxIljJ4Do9
         W0cH1uhyfy+rX3vdqCTOjJDrfsMG7Y8/+/pfRvQLh8vVjgaJi0kTihBKtUWGkq/Y+NHh
         llc/aolf6ZOyvLkzRUIJQ0/LHMOWiF+ZjJ9w3hPSqZ+pgwBN7y9yQlj5T8GKQeIPJPnX
         W3Zjwci3QZ5Dq2jOww28uS7Hwncq7Ma1R4cFuTrL1pR/QrhRzYFJNq2LzmPOlSwqFRYK
         494A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725230; x=1754330030;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmaCz/hZ0Y09KM1Z6dU4zeUMZqIx6D4vddfShUP8jOw=;
        b=u3A8TNrzHS9ZULXFXAgLUQ03+Kvtuh2ZXKiw0Bwn+E2pYp9Ez09rQEdJa8qLMTU7xT
         L/kRQa4/MSj/YgSb50DY0Yr58n53GiUUvVIahYSD+Vp4aSn/iB7eQq65FSAPrp9DAtj7
         lu8GavH3SXcknfnG6bq/uwjW+kxz1dik5NE7WrC+CnXb30QE3ajTDTvpYNKe8lDV7CsK
         gXTikPJblFaK8gEMdO6SaL1OcBVZl+nuAGy7ZATzCr+JpR04cVvHu8MRz8gPK+j9iubj
         LxWzHq/hvTtl0fXAivbeylKm0EuYxraknjjYbGr9+rX8To598KT/50bF4qMr5FrfqJUK
         VGPw==
X-Forwarded-Encrypted: i=1; AJvYcCWLznAACsYx4LktRkpxsNv0LeG+YNKCu/PIZ9p5sxoMHAPbUl2ZN9oh4LkM6W1GoBcAQTMK08gBQIJoE+/HWb9a@lists.infradead.org
X-Gm-Message-State: AOJu0YycWKxfQ6lx0dKIY5SH5jp3en5ufG4lSQbUviR99Hqj8RPxBrWQ
	L9FMjYsSTvgoiRncduA46Pcr64ask2N++obURHanWhkGCNZ2ToU4A6IJIS7iDXU0dasyFQGr1xU
	4YGEoMXiob+f5xw==
X-Google-Smtp-Source: AGHT+IGR+nDxQJC/TBVqY+VnaXcYcs4NqE/3pTQmZ3LkxhlmaQpfACsdvZZWOYaCQDE09t36WXjxu0J7xih9pA==
X-Received: from wmbdw9.prod.google.com ([2002:a05:600c:6389:b0:451:4d6b:5b7e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6088:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-45883089729mr58139855e9.14.1753725229980;
 Mon, 28 Jul 2025 10:53:49 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:07 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-21-smostafa@google.com>
Subject: [PATCH v3 20/29] iommu/arm-smmu-v3-kvm: Setup command queue
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
X-CRM114-CacheID: sfid-20250728_105351_201896_7F622918 
X-CRM114-Status: GOOD (  17.66  )
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

Map the command queue allocated by the host into the hypervisor address
space. When the host mappings are finalized, the queue is unmapped from
the host.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 104 ++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   4 +
 2 files changed, 108 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index e9bc35e019b6..c3d67c603619 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -39,6 +39,15 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	__ret;							\
 })
 
+#define smmu_wait_event(_smmu, _cond)				\
+({								\
+	if ((_smmu)->features & ARM_SMMU_FEAT_SEV) {		\
+		while (!(_cond))				\
+			wfe();					\
+	}							\
+	smmu_wait(_cond);					\
+})
+
 static int smmu_write_cr0(struct hyp_arm_smmu_v3_device *smmu, u32 val)
 {
 	writel_relaxed(val, smmu->base + ARM_SMMU_CR0);
@@ -58,6 +67,70 @@ static void smmu_reclaim_pages(u64 phys, size_t size)
 	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
 }
 
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
+static int smmu_add_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			struct arm_smmu_cmdq_ent *ent)
+{
+	int ret;
+	u64 cmd[CMDQ_ENT_DWORDS];
+	struct arm_smmu_queue *q = &smmu->cmdq;
+	struct arm_smmu_ll_queue *llq = &q->llq;
+
+	ret = smmu_wait_event(smmu, !smmu_cmdq_full(&smmu->cmdq));
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_cmdq_build_cmd(cmd, ent);
+	if (ret)
+		return ret;
+
+	queue_write(Q_ENT(q, llq->prod), cmd,  CMDQ_ENT_DWORDS);
+	llq->prod = queue_inc_prod_n(llq, 1);
+	writel_relaxed(llq->prod, q->prod_reg);
+	return 0;
+}
+
+static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode = CMDQ_OP_CMD_SYNC,
+	};
+
+	ret = smmu_add_cmd(smmu, &cmd);
+	if (ret)
+		return ret;
+
+	return smmu_wait_event(smmu, smmu_cmdq_empty(&smmu->cmdq));
+}
+
+__maybe_unused
+static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			 struct arm_smmu_cmdq_ent *cmd)
+{
+	int ret = smmu_add_cmd(smmu, cmd);
+
+	if (ret)
+		return ret;
+
+	return smmu_sync_cmd(smmu);
+}
+
 static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u64 val, old;
@@ -105,6 +178,33 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	}
 }
 
+static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
+{
+	size_t cmdq_size;
+	int ret;
+	enum kvm_pgtable_prot prot = PAGE_HYP;
+
+	cmdq_size = (1 << (smmu->cmdq.llq.max_n_shift)) *
+		     CMDQ_ENT_DWORDS * 8;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		prot |= KVM_PGTABLE_PROT_NORMAL_NC;
+
+	ret = ___pkvm_host_donate_hyp(smmu->cmdq.base_dma >> PAGE_SHIFT,
+				      PAGE_ALIGN(cmdq_size) >> PAGE_SHIFT, prot);
+	if (ret)
+		return ret;
+
+	smmu->cmdq.base = hyp_phys_to_virt(smmu->cmdq.base_dma);
+	smmu->cmdq.prod_reg = smmu->base + ARM_SMMU_CMDQ_PROD;
+	smmu->cmdq.cons_reg = smmu->base + ARM_SMMU_CMDQ_CONS;
+	memset(smmu->cmdq.base, 0, cmdq_size);
+	writel_relaxed(0, smmu->cmdq.prod_reg);
+	writel_relaxed(0, smmu->cmdq.cons_reg);
+
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int i;
@@ -129,6 +229,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	ret = smmu_init_registers(smmu);
 	if (ret)
 		goto out_err;
+	ret = smmu_init_cmdq(smmu);
+	if (ret)
+		goto out_err;
+
 	return ret;
 
 out_err:
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 9b1d021ada63..f639312cf295 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -11,12 +11,16 @@
  * @mmio_addr		base address of the SMMU registers
  * @mmio_size		size of the registers resource
  * @base		Virtual address of SMMU registers
+ * @features		SMMUv3 features as defined in arm-smmu-v3-common.h
+ * @cmdq		CMDQ queue struct
  * Other members are filled and used at runtime by the SMMU driver.
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
 	size_t			mmio_size;
 	void __iomem		*base;
+	unsigned long		features;
+	struct arm_smmu_queue	cmdq;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.50.1.552.g942d659e1b-goog


