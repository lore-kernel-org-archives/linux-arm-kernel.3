Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757B4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ1p7g2Tvq/hKfuZPoTWdpsu5XMV18xbkA26lNofyBM=; b=ll/bjjTC1Omy1hK2qU8AIMrLYU
	XboqOQ5nwrbQUpRcyJN2Rpc7xyQ6M1VR/xzyYyQ8EE4BUmnWYfeSSC2cChSSfCB6rmb3DAAQDnxMs
	4jSVRfM1sYM7sXKCWTekO2vo5HJyoM0qUkcrhy7z+go+DKqE9tMpTllBTnWl+NMDWnT+grtHFclmG
	yTfXtvsXemQWuwUzgwNhK/FfMM6kNsKR510PLHaDwQdQNrEP7lahMw7zKWml3cOB1ypEqe8Ap1zmV
	6wfxD3NDijA1NeR+GKY2ODt8ViVQLc8RL7x/D4wTE0zh0Y11GL6how0wBggqtowmyITHP1o83uDue
	YY900GCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv3-00000006dAJ-2MdA;
	Fri, 01 May 2026 11:20:29 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluy-00000006czQ-2YIU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:26 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-65a11b5f24dso3226507a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634422; x=1778239222; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ1p7g2Tvq/hKfuZPoTWdpsu5XMV18xbkA26lNofyBM=;
        b=TFfDHx9wcxZ1FFq6ujmiS+z5H+wr/wf9LUswuGRS7LGbQ1W/3ciCd8TKuV5cwjt0My
         +D337RdssAvDzY3yYNvDhV1ewU6qO9gSeJHDihNf5kW7vpYzEF1st3V4v3AxlF2Lny5B
         xVNWg/lXLT9udiGnKkFD5JjfwsBC2bMw212ICTdTFrVxYY7pVV6CH6lCm4EWokxKcjvq
         9tYHPYZnN2oHj2TFTMvAq0aZtUbQnn0mpp3Dz4sMmh+rv1izb+N+S5i0rEDgr8KwZeKz
         IRqXeXX/8IHmuX6EyOKYbZVhXWFDf8IZ/YkTfwQIUG6CqE8GXQlkt8v5f4SKsVFC2jtX
         Kq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634422; x=1778239222;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ1p7g2Tvq/hKfuZPoTWdpsu5XMV18xbkA26lNofyBM=;
        b=mqSLKGgdUutru7babXi6XvhzXbrbcpBTwhSngCkgpMN1SKQSPtDK/KHcmbIAh1jkBx
         YH1UizFEKKKX19OARgyMJZ5/MhmD025JWmhForujCV+ejMS/PfCbHSAWA8ZETU9NnsJ4
         rwTpuhhshnq+LpdPDzzh4RNNg/hg4J0c5OVYdZUJqduB+wr/HNt7Uh7cokmQmJXcJo8w
         aZX40dvwoHDnB7mqOaYf7GVQfm+CnUIMu+Ii7Hs470Ew4l0pFOqigNU8EqKGFvcNMcbY
         4LCqh8dEQIFNWMG2zOskbSf6SRwfgDz+KknIBKTVZamDwAAikRuYO2iwN1vyueNjGGAQ
         CTHg==
X-Gm-Message-State: AOJu0Yy8W6cdm6NLZdPkJVc/7Q5vNpfTEMMXAqvvadHJ85DeTS+CpdJQ
	4HTnAtOTpOlwAsom1crnY9WK+GQ5uS82TiRtuUo3pzC1FOpVVuVM+kMR4o15veSdxqohPdNR9Km
	848mWarstfSdsPHSX+ixMZ9TvY21YJYVfkDmdaxeT8PzmfaM1abxOliiTWEqxsToLwOn9ewOUGB
	SBQcS0VJ7tOn3+5IkNogFzT+XY5NHwoJhSTF6Nqu2lRx+0+iEUSbgPD8d9qtBSn07a2A==
X-Received: from edj4.prod.google.com ([2002:a05:6402:3244:b0:672:bfdb:8b72])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d94f:0:b0:67b:acf5:f39e with SMTP id 4fb4d7f45d1cf-67bacf5f78amr800846a12.10.1777634422049;
 Fri, 01 May 2026 04:20:22 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:18 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-17-smostafa@google.com>
Subject: [PATCH v6 16/25] iommu/arm-smmu-v3-kvm: Add CMDQ functions
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042024_725009_9247E2A8 
X-CRM114-Status: GOOD (  19.54  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 107 ++++++++++++++++++
 2 files changed, 115 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index f904f4d19609..3fc499608d76 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1156,19 +1156,21 @@ u32 smmu_idr5_to_oas(u32 reg);
 unsigned long smmu_idr5_to_pgsize(u32 reg);
 
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
index 3b77796dafc7..aac455599728 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -6,6 +6,7 @@
  */
 #include <asm/kvm_hyp.h>
 
+#include <nvhe/clock.h>
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/trap_handler.h>
@@ -22,6 +23,31 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
 #define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
 
+/*
+ * Wait until @cond is true.
+ * Return 0 on success, or -ETIMEDOUT
+ */
+#define smmu_wait(use_wfe, _cond)					\
+({									\
+	int __ret = 0;							\
+	u64 delay = hyp_clock_ns() + ARM_SMMU_POLL_TIMEOUT_US * 1000;	\
+									\
+	while (!(_cond)) {						\
+		if (use_wfe) {						\
+			wfe();						\
+			if ((_cond))					\
+				break;					\
+		} else {						\
+			cpu_relax();					\
+		}							\
+		if (hyp_clock_ns() >= delay) {				\
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
@@ -74,6 +100,87 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
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
+	ret = smmu_wait(false, !smmu_cmdq_full(&smmu->cmdq));
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_cmdq_build_cmd(cmd, ent);
+	if (ret)
+		return ret;
+
+	smmu_add_cmd_raw(smmu, cmd);
+	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
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
2.54.0.545.g6539524ca2-goog


