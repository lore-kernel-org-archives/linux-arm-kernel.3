Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155FBCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7BBhgFZ8Ma4OIokkNAhr8EAGinTewemkDEloxmI0Rw=; b=McBQ9T0eVkWfbE3+M9uttNdILk
	nucjQNrmzFBqzKUBboyuFFJDCuX8I+kzU2gbIJEHEpXg6pOYiN6mrQIm2FRAxsSKK+nbbgxV/0D27
	ZkyllmkmUAU06vDwUMGurnhPRs7SDMUaE71hXOAi6x2iEBbhf/hK2m8lH1ltZyoa4h6eIYaCJVk0f
	iFCweapCyDyAVXqZRyhFPziVp1Vz/RKJXEqxLGB1hIucYa18rclDjuodot5G3oWe/3RtLV7gWE8gv
	jUSQMiTzZSZiMm3E++z0/1x2mVQUR5GzTSw1Ipf1t2X+AEmL+F2dSJSttTM2fM7fU5q6A3QFsIXK5
	XawZnmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWd-00000004mlE-2ZSN;
	Wed, 27 May 2026 22:14:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWN-00000004mZV-2UXv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:40 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36781927b4dso5842777a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920078; x=1780524878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7BBhgFZ8Ma4OIokkNAhr8EAGinTewemkDEloxmI0Rw=;
        b=aPsw3ph3S70x8oHEROT2gileI0wMQu3AuyBwYCQkx7By0DpPx3Cj+Is5DSgdWecdOH
         7WwRLKH6HbEF7GhV6rgSxrHBThrDPCtmUoTutj6YiiRoZqxHqd/fuor5XdRL9TyJw/J5
         MJPvNIqpR1VWZyjHnttIFefGs0+wRDgK5hCVR/T3DTX2OimvB7HYaXDtS2RdsV78vlUk
         T72hkvuD866hfUaP88f9Tat51F4TfcGSb7Zieqp20NcI/qo9MBlebnsb5oZ2ZNoi7GVV
         w5dJa8SA4/lWFHYQCRGgIQV3XTgjMN5W/x1Itay2wQlvlZzOGopc6l1hqOuasL3hcaTM
         jo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920078; x=1780524878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7BBhgFZ8Ma4OIokkNAhr8EAGinTewemkDEloxmI0Rw=;
        b=tRyFcDoQxytdHGBREVzVDczlFgSO9aF4I3h7fS0sJqFouWI2XJQAsvAOXP7kViRPdD
         usXberANxCU8VhxHGi3oVAJ3+CfRO4X6a7csptk1+CvkU6wan9JwwjraNQ7/eF+Inpsj
         N/1Pd0xV3VRHjGAVtsjx+2jqcWuM49lWRRm/d4aAFCR7XDvT+izQ+c/VOkGAqqrs/z6f
         IEk9LX7foWn16d+pQrQhA5oI3yGsLtIpeY0NR9aaa46YqhM0YCm69dRDXqCf+gzjhba8
         MRvqo8zmacjPNRVaTkXlUQ5yTn9ZPgHWiJ+0jRz1mk1nacjNAZtda4mS1MQllVMwmN8U
         8JrA==
X-Forwarded-Encrypted: i=1; AFNElJ9ncQ4Lhyrrj7+ocQCgzCfxzIYlZieSeUQyrKJu5xZNC4ZHEBsmOUYU/J3VBcqdu4KOc8wzcfur4cbgMFaBD2N1@lists.infradead.org
X-Gm-Message-State: AOJu0YzTjCRQzJ3vaNzf0BivhQb7n3v0xZfOu5C9LnXQeHl46Daluja0
	eBrxg1aZ41zKlI8vjbuqxguIdKG484+uU5dpY6glTkRDap1vUNJeUuukX8jtBLyMe3TwwYXZTDq
	PUA==
X-Received: from pjbgz7.prod.google.com ([2002:a17:90b:ec7:b0:366:3a03:b66d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3882:b0:366:132:fda7
 with SMTP id 98e67ed59e1d1-36a6771a702mr25194976a91.10.1779920078032; Wed, 27
 May 2026 15:14:38 -0700 (PDT)
Date: Wed, 27 May 2026 22:14:07 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-12-praan@google.com>
Subject: [PATCH v7 11/11] iommu/arm-smmu-v3: Add KUnit unit tests for Runtime PM
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151439_648188_AF6871A0 
X-CRM114-Status: GOOD (  20.98  )
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

Introduce a kunit selftests to verify the Runtime PM elision gating,
post-suspend elisions and progress on resumption under active
invalidation load. Simulate concurrent HW suspension using a timer.
Mock all HW registers and CMDQ buffers by allocating them on RAM.
Make the mock CMDQ self-consuming to avoid hitting queue_full scenarios.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 150 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   1 +
 2 files changed, 151 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c82..ef9a17343ed8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -3,6 +3,10 @@
  * Copyright 2024 Google LLC.
  */
 #include <kunit/test.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/sched.h>
+#include <linux/timer.h>
 #include <linux/io-pgtable.h>
 
 #include "arm-smmu-v3.h"
@@ -771,7 +775,153 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	kfree(test_b);
 }
 
+struct arm_smmu_test_pm_context {
+	u32 *mock_prod_reg;
+	u64 *mock_base;
+	unsigned long *mock_valid_map;
+};
+
+/*
+ * Shared helper to allocate and map a fully functional, self-consuming mock
+ * CMDQ. By redirecting both prod_reg and cons_reg to the same memory location,
+ * every producer write is instantly reflected as a consumer completion.
+ */
+static struct arm_smmu_test_pm_context *
+arm_smmu_v3_test_init_mock_cmdq(struct kunit *test, struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_test_pm_context *ctx;
+	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	/* Use a standard 1024-entry queue for safe word bitmask alignment */
+	ctx->mock_prod_reg = kunit_kzalloc(test, sizeof(u32), GFP_KERNEL);
+	ctx->mock_base = kunit_kzalloc(test, 1024 * 16, GFP_KERNEL);
+	ctx->mock_valid_map = kunit_kzalloc(test, BITS_TO_LONGS(1024) * sizeof(long), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_NULL(test, ctx->mock_prod_reg);
+	KUNIT_ASSERT_NOT_NULL(test, ctx->mock_base);
+	KUNIT_ASSERT_NOT_NULL(test, ctx->mock_valid_map);
+
+	smmu->features = 0;
+	/* 1024 entries */
+	cmdq->q.llq.max_n_shift = 10;
+	/* SMMUv3 commands are 2 dwords (16 bytes) */
+	cmdq->q.ent_dwords = 2;
+	cmdq->q.base = (__le64 *)ctx->mock_base;
+	cmdq->valid_map = (atomic_long_t *)ctx->mock_valid_map;
+
+	/* Self-Consuming, prod == cons always ensures queue empty */
+	cmdq->q.prod_reg = (__force u32 __iomem *)ctx->mock_prod_reg;
+	cmdq->q.cons_reg = (__force u32 __iomem *)ctx->mock_prod_reg;
+
+	/* Initialize memory indices */
+	atomic_set(&cmdq->q.llq.atomic.prod, 0);
+	atomic_set(&cmdq->q.llq.atomic.cons, 0);
+	atomic_set(&cmdq->owner_prod, 0);
+	*ctx->mock_prod_reg = 0;
+
+	return ctx;
+}
+
+struct arm_smmu_test_timer_context {
+	struct kunit *test;
+	struct arm_smmu_device *smmu;
+	struct arm_smmu_test_pm_context *pm_ctx;
+	struct timer_list timer;
+	bool stopped;
+};
+
+/* Asynchronous timer callback running in softirq context */
+static void arm_smmu_v3_test_rpm_timer_callback(struct timer_list *t)
+{
+	struct arm_smmu_test_timer_context *ctx =
+		timer_container_of(ctx, t, timer);
+	struct arm_smmu_cmdq *cmdq = &ctx->smmu->cmdq;
+
+	/*
+	 * Asynchronously set the STOP_FLAG (Close the gate).
+	 * Simulate a concurrent runtime suspend event interrupting
+	 * the invalidations happening under active load.
+	 */
+	atomic_or(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
+
+	/* Signal to the main storm loop that suspend has triggered */
+	WRITE_ONCE(ctx->stopped, true);
+}
+
+/*
+ * Verify SMMU PM Runtime gating, elision, and post-suspend resumption
+ * safety sequentially under active stress.
+ */
+static void arm_smmu_v3_test_rpm_stress_race(struct kunit *test)
+{
+	struct arm_smmu_device *smmu = kunit_kzalloc(test, sizeof(*smmu), GFP_KERNEL);
+	struct arm_smmu_test_pm_context *pm_ctx;
+	struct arm_smmu_test_timer_context *timer_ctx;
+	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_cfgi_all();
+	u32 stopped_prod;
+	int i, ret;
+
+	KUNIT_ASSERT_NOT_NULL(test, smmu);
+	pm_ctx = arm_smmu_v3_test_init_mock_cmdq(test, smmu);
+
+	timer_ctx = kunit_kmalloc(test, sizeof(*timer_ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, timer_ctx);
+	timer_ctx->test = test;
+	timer_ctx->smmu = smmu;
+	timer_ctx->pm_ctx = pm_ctx;
+	timer_ctx->stopped = false;
+
+	/* Setup the kernel software timer */
+	timer_setup(&timer_ctx->timer, arm_smmu_v3_test_rpm_timer_callback, 0);
+
+	/* Start the timer to fire in 10 jiffies */
+	mod_timer(&timer_ctx->timer, jiffies + msecs_to_jiffies(10));
+
+	/* Execute the unmap storm until the timer triggers */
+	while (!READ_ONCE(timer_ctx->stopped)) {
+		ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, &cmd, 1, false);
+		if (ret != 0) {
+			KUNIT_FAIL(test, "Unmap Storm loop failed to submit cmd list: %d\n", ret);
+			break;
+		}
+
+		usleep_range(50, 100);
+	}
+
+	timer_delete_sync(&timer_ctx->timer);
+
+	/* Establish the globally stable, post-storm register baseline index */
+	stopped_prod = *pm_ctx->mock_prod_reg;
+
+	/*
+	 * Attempt multiple unmaps while the SMMU is disabled (STOP_GATE is set)
+	 * Every single invalidation must be instantly elided, returning 0
+	 * immediately and leaving the mock MMIO register completely frozen.
+	 */
+	for (i = 0; i < 1000; i++) {
+		ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, &cmd, 1, false);
+		if (ret != 0) {
+			KUNIT_FAIL(test, "Gated storm loop failed at iteration %d: %d\n", i, ret);
+			break;
+		}
+	}
+	KUNIT_EXPECT_EQ(test, stopped_prod, *pm_ctx->mock_prod_reg);
+
+	/*
+	 * Clear the STOP_FLAG (resume SMMU). A new invalidation must now
+	 * successfully commit, moving the prod_reg by exactly 1 slot
+	 */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
+	KUNIT_EXPECT_EQ(test, 0, arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, &cmd, 1, false));
+	KUNIT_EXPECT_EQ(test, stopped_prod + 1, *pm_ctx->mock_prod_reg);
+}
+
 static struct kunit_case arm_smmu_v3_test_cases[] = {
+	KUNIT_CASE(arm_smmu_v3_test_rpm_stress_race),
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_bypass_to_abort),
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_abort_to_bypass),
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_cdtable_to_abort),
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d42f78777571..dd7cfd3c16f4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -871,6 +871,7 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	local_irq_restore(flags);
 	return ret;
 }
+EXPORT_SYMBOL_IF_KUNIT(arm_smmu_cmdq_issue_cmdlist);
 
 static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
 				     struct arm_smmu_cmd *cmd, bool sync)
-- 
2.54.0.794.g4f17f83d09-goog


