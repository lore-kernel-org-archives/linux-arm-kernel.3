Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4EDC44510
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75EB2f6MAXW5J4vafHy4b5awBXMBAYUr8yFrAesJgTk=; b=CjNuXJ3PSobvrhdp49mA+zVTqi
	6QoysdOnR4tdfzBcbEmUBEcjIY99SUz0MYTmwySD1jNLSWpAgNy7mSJ/P8ZEbN/PzQgaOGWgLdH1i
	dh9mctflH9RQb2FKceA5dABFN0po1hYur7UhMsPiw279W27/NP2qbJX3SgEcWciS4CPvgQd/8EsNt
	FYwE8jLsfDG8lLNH/sKvzCXERg0ceotLI71iDTVz31BaM82L1oBep8acu4yZWNSya5o0tO5swok1i
	nci2pB+SDCyuFnQKFzmXkDz+Ci7onRwaAajoV/iez5V5jd9LkCPWPvZragQG7C6Vv73MhCtQxfzHQ
	gDFfn+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHX-0000000EfpM-1Own;
	Wed, 15 Jul 2026 12:00:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyH0-0000000EfDv-2tvd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:36 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-492714d002cso14416685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116772; x=1784721572; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75EB2f6MAXW5J4vafHy4b5awBXMBAYUr8yFrAesJgTk=;
        b=qm4NasbocV0JG/XYbeShtXnIL7wYRgzWb3T6oReo3oDXaEuu4pS5WoUlbiTO1YoSot
         +seIJoJIFpmGC5Zvu97mo0zHVpAgBPiWzy5RV04ihq9mdr7bniWFBd9EXzYel1sjnSXd
         7vNFjXVp68adFaM99NgBuRQkancxxPt55vvy7JeIa6/xxDJItsWr+D8mkVDWJG5mbA+E
         9J+XlBkH4lxtEOgfEYT70jLgnQIK1gGvGpdu8fki6y5kcrnslCEBqz/9a0zGZtqDeQKY
         jGjHHu2Kd9GFmxzvfyX2ITskt+wV254QW1K1OWOPqQu7SHeqXePdYWRj5WQM2aobXlRR
         B3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116772; x=1784721572;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75EB2f6MAXW5J4vafHy4b5awBXMBAYUr8yFrAesJgTk=;
        b=YEkCFtZF9Avm0b93TxwsH8DqAKPVwFYFBEhHyFFQ+prygmKGR9FZ+pGdNvehyZtaDl
         Pe73Ujb6weKFdxoLYuRfGgw+Es3yF9BQoiJfV1b5FyfWirX16Zm7KDpXvLaq++xE9YzT
         MLGDDSjj0U8oPSorx2SpigCR68+hFBwxezcqJsQDsV3T40CcaGWdxvIZd0n5w3L+olgq
         FSVZnsRwieexMU6KuIunsJSitxEKCkIlIS1XsjWwRT0L9lyJf4C2aCaAVhEUqiG/IqVe
         8aqnMJOJCf+BxS3pnRLaZCm2YFdaZDi59LjqIcqgWesLkiNoNl06JkHxFdIfKoyZxmpf
         Uo0g==
X-Gm-Message-State: AOJu0YxHzdowu99LP9ClYld7Ya1Mmwb6JXDGiTtcmmD+FAQTLaGYjqZD
	W+usggoF8MlRZ5JZlyCSZD2nVS0eOeC7m9XsPMLqqL/zwBHYYenHDKN1U8edwthSWTQHzmarurM
	W2cDlplWUTAfcwmxOvCeFzrzMHJzy0fZPYXKW6pgHATM6LeslDRYDX3QKzXmGLzdxAIpwF90M/+
	2FiTns2VfdOoVEBA9IB24nJCyqfflrROicVLT1ij1XM+45kEa7K1gB9gFjb9+Vy2O9Rw==
X-Received: from wmiv11.prod.google.com ([2002:a05:600c:e40b:b0:493:ab17:3e61])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8444:10b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-493f87d7eefmr140336125e9.3.1784116772290;
 Wed, 15 Jul 2026 04:59:32 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:56 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-16-smostafa@google.com>
Subject: [PATCH v7 15/24] iommu/arm-smmu-v3-kvm: Add CMDQ functions
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045934_762383_B6A2BA2F 
X-CRM114-Status: GOOD (  19.88  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 ++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 109 ++++++++++++++++++
 2 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 842d0c9b883c..cbc4589e89a8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1226,19 +1226,21 @@ unsigned long smmu_iidr_features(u32 reg, unsigned long features);
 unsigned long smmu_iidr_options(u32 reg, unsigned long options);
 
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
index 9f76f4e82341..8e798fd8fdaa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -6,6 +6,7 @@
  */
 #include <asm/kvm_hyp.h>
 
+#include <nvhe/clock.h>
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/trap_handler.h>
@@ -22,6 +23,36 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
 #define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
 
+#define ARM_SMMU_EL2_POLL_TIMEOUT_US	1000
+/*
+ * Wait until @cond is true, can use WFE, if polling on an SMMU and
+ * event that supports it.
+ * Return 0 on success, or -ETIMEDOUT
+ */
+#define smmu_wait(__use_wfe, __cond)					\
+({									\
+	int __ret = 0;							\
+	u64 start = hyp_clock_ns();					\
+	u64 timeout = ARM_SMMU_EL2_POLL_TIMEOUT_US * 1000;		\
+									\
+	while (!(__cond)) {						\
+		if (__use_wfe) {					\
+			wfe();						\
+			if (__cond)					\
+				break;					\
+		} else {						\
+			cpu_relax();					\
+		}							\
+		if ((hyp_clock_ns() - start) >= timeout) {		\
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
@@ -74,6 +105,84 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
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
+			struct arm_smmu_cmd *cmd)
+{
+	int ret;
+
+	hyp_assert_lock_held(&smmu->hw_lock);
+	ret = smmu_wait(false, !smmu_cmdq_full(&smmu->cmdq));
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
+	return smmu_wait(smmu->features & ARM_SMMU_FEAT_SEV,
+			 smmu_cmdq_empty(&smmu->cmdq));
+}
+
+__maybe_unused
+static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			 struct arm_smmu_cmd *cmd)
+{
+	int ret = smmu_add_cmd(smmu, cmd);
+
+	hyp_assert_lock_held(&smmu->hw_lock);
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
2.55.0.141.g00534a21ce-goog


