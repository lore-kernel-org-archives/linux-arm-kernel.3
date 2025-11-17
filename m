Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB07CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gthqCq5o6yeE89UPMEuJgIME9dtn3tyMj4iiO/+WnDw=; b=HUjJb10ZUFp3gQL097odleaJcC
	+76HsJ+XBPwTgQvyCwl3YlKTM8BUoZyFxQ0xc3gzwXTRWxZhJsaiBtx1viWYfd+Xm+9zLTcgY4SGi
	OotYSId4WoXx7leZal/rB3vjkyzt0RULMkE6yyTHG5rZmGJ/jVA/jYw/M9NHt+9BSXCATYXBpnqWP
	BABdJTtWY+lTUbHsRimh5ixAn/9pWC/HUr+wVeraxc0wpZYE4UumWv72/M4NrDOcv18sATEe8MzBs
	8gFVw7G8stYZxBmXWT6Q54kMvNhoNj1rwbkZdM0kxC7PMrk6SZXhpazC4BXfKM5FVwqcBL05gPBem
	BcPYVbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Hg-0000000Gdzr-1ujr;
	Mon, 17 Nov 2025 18:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HT-0000000GdgM-1fYG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gthqCq5o6yeE89UPMEuJgIME9dtn3tyMj4iiO/+WnDw=; b=DZmNGG46NCNvKmcICzWHUSY8+p
	TjFoQ8czprHTBRPp2SXJ6kUa5O+GVXtNbn+VhpjB2PmYQv3B3BzckB6rquHpM0hqS+d1PldgWKMYy
	5jajJajixfOYLVUFTPBlh1vhGZfsHy0xMVvxC2Y6dWnHeHx7snQqZCwhH9uxm8j2oMzie3Zs54LlX
	Ll88BeWhjDBjH0dwpUEc/vKYBqiRp/7ySsywi8aiXI27OviovZ9LWDs39m6DeZ1FlFgtvoEiQeGQD
	UP8hEb9qlpK039RGNPvY3b9CAW5lHxyZuTDNejb/qFdTSwC9Cheh7T5tJ1ab7jDtPzc2PhSbqBIOe
	aFAxAC6A==;
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pm-00000007wdZ-2Omb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:24 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b70b3297664so381930766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405326; x=1764010126; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gthqCq5o6yeE89UPMEuJgIME9dtn3tyMj4iiO/+WnDw=;
        b=vn23UQqL8M+taPtr2EgXEiEj3cDPJE3iL2ycpEm8vzOmBQ43Jm/kuOA6S1okKVgCze
         +mfn83OZvcTz8qY1ryDKbBD/YQTMf8F51s5YYO1ofnPQGchFfLnOSvYRZEeAknFB0+Px
         l5LholCQDUM9zJEpQ2fCzJZe5e02VSnL5tRDfSfMpufsKaPce+R4aiXJE1S+kI3AiUMv
         ytnr94FNAA1dNJuRhWpe2WnfTMqz1DjWLVzR/F8QB5J1uROipf2mBj1eRlC9E2XLvNjE
         mFqnHUbjoNuu9KgZmJQ0EQpKMU9hoiZ8atk2ZVTonhzWa5aBGK1j8u8ufxGa5iK3J6rg
         StyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405326; x=1764010126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gthqCq5o6yeE89UPMEuJgIME9dtn3tyMj4iiO/+WnDw=;
        b=AZMYSb/VS13IvmuZcxuOJD76dTiLs5NV2Hg9LWPM9SjUx5CnBkNsBRSG7K16/sfseb
         NxBgeuYkBKx2Z8A1SnV+6sJ4nxx0HMBFT0K/NW35OxxGC9VU7evcyeSXjEuhFpNU1kHU
         zya9Hd7EEZfsnTMvbyYXNH2R9xfHMlVvx5v8BcyQWbStWRGrA98EPaAU8WCvGPE2L97S
         CpMfhpU9Fs0bUGHd5BbBhrmiBrO3KVFk0NXBMveetPP/TgznqSDUcbXap0byA8giFbZ+
         zAly80Pfw5OAhSchex/J1Du22ttn4T0Hiqw9H0hqWycjeiT2gseWN5PhrBS5aPlQKTeN
         Yheg==
X-Gm-Message-State: AOJu0Yy1REM8+8FhWTGS3RR88ZmvedrkKZYWNWQG46WjUHROC6KTm6GC
	hDjb6HYxsxi4/ZvCntgk99c9e3QjYpoed/1l+CVQRPn68v+nw008AYiOmz6VcFnESgIbWJt5SKT
	l1OaUVZXF6Y9t8qXN0Qf1Vhc/jDQJPtSFKFaKHbN2laqCa1DlxeKG9lwepe0rDMLC3FCiSqJPXi
	QOvkKNJ3wfJ0I+y4yFb/+6MEOlwmNKrNd4fQ2w5c1tc7CVKEmA7aa2SaSxPz7lUkR5jA==
X-Google-Smtp-Source: AGHT+IE5KRl2mOZHi8gtVKjABXvz8EzQH63tM2/gsVZz7+LwCgoA43ubS78h95GU7o7UGQNIlpHqH+cFHQPaLQ==
X-Received: from ejcqo4.prod.google.com ([2002:a17:907:8744:b0:b73:7130:3892])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:849:b0:b72:598:2f32 with SMTP id a640c23a62f3a-b73678ed1d0mr1476075666b.42.1763405325882;
 Mon, 17 Nov 2025 10:48:45 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:07 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-21-smostafa@google.com>
Subject: [PATCH v5 20/27] iommu/arm-smmu-v3-kvm: Add CMDQ functions
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175322_863492_23C742DD 
X-CRM114-Status: GOOD (  18.54  )
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

Add functions to access the command queue, there are 2 main usage:
- Hypervisor's own commands, as TLB invalidation, would use functions
  as smmu_send_cmd(), which creates and sends a command.
- Add host commands to the shadow command queue, after being filtered,
  these will be added with smmu_add_cmd_raw.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 +--
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 102 ++++++++++++++++++
 2 files changed, 110 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 1d552efdc4ae..d909014baad3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1015,19 +1015,21 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent);
 
 /* Queue functions shared between kernel and hyp. */
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
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index bcb3f99fdcd2..a970b43e6a7e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -22,6 +22,26 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
 #define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
 
+/*
+ * Wait until @cond is true.
+ * Return 0 on success, or -ETIMEDOUT
+ */
+#define smmu_wait(use_wfe, _cond)					\
+({								\
+	int __ret = 0;						\
+	u64 delay = pkvm_time_get() + ARM_SMMU_POLL_TIMEOUT_US;	\
+								\
+	while (!(_cond)) {					\
+		if (use_wfe)					\
+			wfe();					\
+		if (pkvm_time_get() >= delay) {			\
+			__ret = -ETIMEDOUT;			\
+			break;					\
+		}						\
+	}							\
+	__ret;							\
+})
+
 static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
 {
 	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
@@ -69,6 +89,88 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
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
+	queue_write(Q_ENT(q, llq->prod), cmd,  CMDQ_ENT_DWORDS);
+	llq->prod = queue_inc_prod_n(llq, 1);
+}
+
+static int smmu_add_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			struct arm_smmu_cmdq_ent *ent)
+{
+	int ret;
+	u64 cmd[CMDQ_ENT_DWORDS];
+
+	ret = smmu_wait(smmu->features & ARM_SMMU_FEAT_SEV,
+			!smmu_cmdq_full(&smmu->cmdq));
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_cmdq_build_cmd(cmd, ent);
+	if (ret)
+		return ret;
+
+	smmu_add_cmd_raw(smmu, cmd);
+	writel_relaxed(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
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
+	return smmu_wait(smmu->features & ARM_SMMU_FEAT_SEV,
+			 smmu_cmdq_empty(&smmu->cmdq));
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
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
-- 
2.52.0.rc1.455.g30608eb744-goog


