Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860CCC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KT9gAbFn8X/5jhTdpDUZBIE1ybk66ZHea/tOTsT2sbI=; b=DLqLb1oTjAlYnp1K64FDntADtS
	+UCVkS2mVi7C9YNPJUEpEZd+HLPJyUs/e97eDr2e9s5EFTROfFUfjArmA2dXOaqDbwB7665WkErUU
	iVSUYSMNbewaoi3cH/XPHLuQT7L2V9UwUgRrFDlcMHzUgkj0mSj/s8tp3rz2Ywo7up36458K8xI4H
	MWJOwih30+uOVaMjXKa2AZLcz9kxK1ZLF2RCXP4ToKGbN481qaPbGaGq4PHVwoCZlmBW+R23Jv656
	DLHNj8IWFko+skF+mCz+tKTkKqewC4yo7vhJ1ajtrw8HQuOOf7mKe0+ubvYucFlf4IVQKripS9cgR
	Q5XAFTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jf-00000005Sc0-1174;
	Tue, 22 Sep 2026 13:13:47 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JH-00000005SII-1iK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:24 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso41901975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082801; x=1790687601; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KT9gAbFn8X/5jhTdpDUZBIE1ybk66ZHea/tOTsT2sbI=;
        b=lAojIw1ArEyxUS1XMo7rh1Xnj2nuM11/NMP32KjeRh3EYUBUENV5O5cSAkS1Wc7brT
         yZcItxqAr1+MF2oJUzPxca6pQ188Yo+P6uzhkgyvybPr5AZMZ1QBOxma7L/CtkFWs/BW
         rvg55rF21BjOB+iim2l4+9PXFqwMVjvrEmJ3fbmvmisCp+v5OzhYrHwUuacJWCp7lP/k
         l0pSFXO9cDNwuc2S3XEwua+MyUmAqTLnyaj2uKej+ylRDbWSP+ettIJEHCeLOIPRSdFz
         rPixrdlTzTgZrGBeeUCx+/CHpMG4lNTE5H1VvzA3cSZ4Vqg2KFiqQH0wqaOZH6GAHTYQ
         uHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082801; x=1790687601;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KT9gAbFn8X/5jhTdpDUZBIE1ybk66ZHea/tOTsT2sbI=;
        b=UkOojqW6zwgpOfIeW6hjdMuocCXFGTTAC0Td0T8lzPqyVCG0G9yCvE+ZobzqLC2SWk
         bZrscafyATtWmEV8NWnzg2hs0lK3UJUchoX6b2JENIBw5El6MB0CyaQX11eH5U/5DBut
         fWn/CFXfez6Qg4r58tlOP8nKDTkKLoZW5Rp6bE/pbPZ7AxxeuHC0e7KfjYbsFA6/FiYT
         zyxU8Q9xIb9L9R5mEhzBPlY1kB3pgUJ9OfoekVxE5PT2fkY0XXf0eHeWqiuCilIEfop4
         Vpvx5CqtGMSW2ZABGY3kzs+yWHFFsCpeIQdef6eSbrBczzGsSzm1Vl1VzCDu8qxjn6/k
         Xgzg==
X-Gm-Message-State: AFuF++lJlLeDTHQvUfJ+GyqsXdebw1TS1rm7iJTj4aI0J042AHyvysHU
	pD0Kw860x4eSE69dKAVQYE3HozzN2EfScVYOsJrjk9faqNj8yfzA0r5FdkkXGh/mmoQS+zD4LYk
	ZghXERBBWzg+RVjEtSS+jv1MFPn8aQ1sIiDo25omSbS9X3efHP7JcrPzNLXEDC6KZzstxvCqPJN
	H57XaEvOX+oQCgSJw527zZY/oYVLALBFvzK9QA1i8EETwLaR0NxEn3vLMiTmZ05RHUTg==
X-Received: from wmaw22.prod.google.com ([2002:a05:600c:6d56:b0:49e:6021:e264])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e05:b0:49c:fc6e:8cb1 with SMTP id 5b1f17b1804b1-49fc5737ad0mr200645595e9.21.1790082800777;
 Tue, 22 Sep 2026 06:13:20 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:48 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-16-smostafa@google.com>
Subject: [PATCH v8 15/25] iommu/arm-smmu-v3-kvm: Add CMDQ functions
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
X-CRM114-CacheID: sfid-20260922_061323_480035_2453EB11 
X-CRM114-Status: GOOD (  20.87  )
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
  these will be added with smmu_add_cmd_raw().

queue_space() is split out of queue_has_space() as it is going to
check the host shadow of the queue.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 ++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 118 ++++++++++++++++++
 2 files changed, 126 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 28efa733e796..d48bd9f272e1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1225,19 +1225,21 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
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
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index b26c21b595b4..38b8ecc5cc10 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -24,6 +24,41 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
 #define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
 
+static u32 timer_freq;
+
+static inline u64 hyp_clock_ns(void)
+{
+	return mul_u64_u32_div(__arch_counter_get_cntvct(), NSEC_PER_SEC, timer_freq);
+}
+
+#define ARM_SMMU_EL2_POLL_TIMEOUT_US	1000
+/*
+ * Wait until @cond is true, can use WFE, if polling on an SMMU and
+ * event that supports it.
+ * Return 0 on success, or -ETIMEDOUT
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
@@ -76,6 +111,85 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
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
@@ -197,6 +311,10 @@ static int smmu_init(void)
 	u64 pfn, nr_pages;
 	int ret;
 
+	timer_freq = read_sysreg(cntfrq_el0);
+	if (!timer_freq || timer_freq > NSEC_PER_SEC)
+		return -EINVAL;
+
 	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
 	pfn = hyp_virt_to_pfn(kvm_hyp_arm_smmu_v3_smmus);
 	nr_pages = smmu_arr_size >> PAGE_SHIFT;
-- 
2.55.0.1082.g2b9226bbc0-goog


