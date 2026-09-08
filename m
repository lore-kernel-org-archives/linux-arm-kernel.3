Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F358C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYwlD2Jlkp631sEwKlrnXSZ9+riJT2EHw4KanRbjXCM=; b=cSGi3xOXbQYx3PX/v8MfZxMKu9
	Qg/8LmMWm/xqcCDWMNiiI9VPTRrfKC6IZ3/mHrRd/hbYLP5Y07oodUqL0mNcM7DNjS09UL/Tv0Msu
	gI4Ndu4f7vE6TeLhhl6bXz8J+UZ97GSOzJumQt5khh3CMn5ZSby/Y5VJcAhQZbpwB2VG02DmJf7RL
	bWFgp1He5qM1zdqB3slt0RaUKYAR3X/Rgbzqag7PRgYoN5p1MLsE96nU7sDxAYJFTgDpqrAXtNf0B
	mhTQ3FbcIyNvoVD5JrLTHInuFYt9TIyeuQLpzs736eOqgoCVVA0t5OZqQqHMAEpnltePWMVdsOS50
	pOQQEMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zSd-00000009n9o-150L;
	Tue, 08 Sep 2026 17:18:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zSF-00000009mop-2dxi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HYwlD2Jlkp631sEwKlrnXSZ9+riJT2EHw4KanRbjXCM=; b=a0OeiZqZVJLV0zhYdzxHTpP1B6
	Jk33vaH4LCb7t4Vs7LZVOD3K7mGKiZpjRfIVc2ivKkrFRRuaAYoMITaa9iYyvQ3zo1tvAOgkTyCzB
	cNFRTKvz5pnRCqaXakT+t/XWDDz+gjXrZEHP2zT/9y8cpSJ6zeS0Nl+VKEwIsc334ErZu15ENQyu4
	KfD9KC516xK7hYr3hZO9nBrlLAgEJxqXXm35NSdQiS5eDJLzd66gwMwlsFIyODmYMxdysUjpD9HxS
	smRORjViYzO3U+RZXFo3ZiqiyTGiyHglo0hRrAeJJ9Ka9c7O8hVoaZMeuZaot510QjVBEtAAeOMaJ
	8++EtYdA==;
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zSC-000000008yC-4105
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:54 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-855315ccb64so2177281b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887870; x=1789492670; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYwlD2Jlkp631sEwKlrnXSZ9+riJT2EHw4KanRbjXCM=;
        b=gEznvRXXmadkqOcdqrhQ5rIh2Ifm8OC+WeCurNNwVI+EYwJJ6EgATwOCDVL1qrGUh2
         +uAfKZhZvFE94xqEida6ZFXTIf5jkO6ebaMA+M+YrQfNgemYNBmrUfZpJ8tE8lBK0owx
         9lxPsQTOktGKx1Zzqm91R+1Q/Cx+ctYB+WhqcZyc3AhrRmPyNIctQ6MPwuMB1LVOiHMW
         n+y5W7pxFG0PYpwtOJ6fPFTuzWd5et1KRjW5AfJ2vcEhbN76LbhRkY6d//+wge7KAH1+
         6Nve5CPcc2+f/Z+U5sDlK4GxI5Hd8zRAti8NKt1hENGikqH6l1cbXIdxrKr5sRGJ/3Eb
         Zw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887870; x=1789492670;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYwlD2Jlkp631sEwKlrnXSZ9+riJT2EHw4KanRbjXCM=;
        b=htjxfAlMHGSpAxHiGoe4jIv81HaPv3QYxDuQchTXOd7OqVFsrnqXfmsx143kuq2lUU
         sVrFLShBxBq59++ABCo6m6IDz6QO9gUyeRRYl1nEg3MsfOtJtwOnFDrSp2Fl9Gj8AvNZ
         CHdC4kejsmo1Qoyz5lL6MQeCWT8lNZL+Qa8xjtSfUK4nTdo8ue1HlbJ7F0j5/FK9Wpk9
         AYxXJ9UAi8NpJBX+U5YTRZnBh5Sf22dNq0YWS5dLteZpueEBB65fX2f0bNgMppU+LXxr
         QXrdXpZEgLABepKhEqT37nZbhGQTUZ62mxeAeBcxcUxyKWmmOu3a9Z4zi92wea+I2juT
         kfHw==
X-Forwarded-Encrypted: i=1; AKwUvBzi3h5XnjhdTIFSBM47oA/91N5y0orfYr+jApUF6JIw4DqOTwz0ev50CxYax5jysSS0wkCcis3IiD087V/VzHZB@lists.infradead.org
X-Gm-Message-State: AFuF++nhhzyyVJ3mpQM2V3Qtc53DOmtTGfTmn/ReLtJ8dHneytWGpKvb
	sqjzFXWecOWAz81DBdG5R4sNtUzGS9aK+3ymTLvY7sfS5uTvpiZG8cQEba1XscIeEsktF03jpgJ
	uNA==
X-Received: from pfbkx35.prod.google.com ([2002:a05:6a00:6f23:b0:848:5395:9a78])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:600d:b0:847:99bb:b6d0
 with SMTP id d2e1a72fcca58-86168591720mr46000615b3a.15.1788887869417; Tue, 08
 Sep 2026 10:17:49 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:11 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-16-praan@google.com>
Subject: [PATCH v10 15/15] iommu/arm-smmu-v3: Add KUnit unit tests for Runtime PM
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_181753_157608_C944AE05 
X-CRM114-Status: GOOD (  21.07  )
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

Introduce kunit selftests to verify the Runtime PM elision gating,
post-suspend elisions and progress on resumption under active
invalidation load. Simulate concurrent HW suspension using a timer.
Mock all HW registers and CMDQ buffers by allocating them on RAM.
Make the mock CMDQ self-consuming to avoid hitting queue_full scenarios.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 215 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   1 +
 2 files changed, 216 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c82..97c1e907717d 100644
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
@@ -771,6 +775,215 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	kfree(test_b);
 }
 
+struct arm_smmu_mock_cmdq {
+	/*
+	 * Mock register in RAM. Typed as __le32 to match writel_relaxed()
+	 * endianness without calling readl_* accessors directly on RAM.
+	 */
+	__le32 mock_prod_reg;
+};
+
+/* Helper to allocate a self-consuming mock cmdq */
+static void arm_smmu_v3_test_init_mock_cmdq(struct kunit *test,
+					    struct arm_smmu_device *smmu,
+					    struct arm_smmu_mock_cmdq *mock)
+{
+	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
+	unsigned long *mock_valid_map;
+	u64 *mock_base;
+
+	mock_base = kunit_kzalloc(test, 1024 * sizeof(struct arm_smmu_cmd), GFP_KERNEL);
+	mock_valid_map = kunit_kzalloc(test, BITS_TO_LONGS(1024) * sizeof(long), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_NULL(test, mock_base);
+	KUNIT_ASSERT_NOT_NULL(test, mock_valid_map);
+
+	smmu->features = 0;
+	/* 1024 entries */
+	cmdq->q.llq.max_n_shift = 10;
+	cmdq->q.ent_dwords = CMDQ_ENT_DWORDS;
+	cmdq->q.base = (__le64 *)mock_base;
+	cmdq->valid_map = (atomic_long_t *)mock_valid_map;
+
+	/* Self-Consuming, prod == cons always ensures queue empty */
+	cmdq->q.prod_reg = (__force void __iomem *)&mock->mock_prod_reg;
+	cmdq->q.cons_reg = (__force void __iomem *)&mock->mock_prod_reg;
+
+	atomic_set(&cmdq->q.llq.atomic.prod, 0);
+	atomic_set(&cmdq->q.llq.atomic.cons, 0);
+	atomic_set(&cmdq->owner_prod, 0);
+	mock->mock_prod_reg = cpu_to_le32(0);
+}
+
+struct arm_smmu_test_timer_context {
+	struct arm_smmu_device *smmu;
+	struct timer_list timer;
+	bool suspended;
+};
+
+static void arm_smmu_v3_test_rpm_timer_callback(struct timer_list *t)
+{
+	struct arm_smmu_test_timer_context *ctx =
+		timer_container_of(ctx, t, timer);
+	struct arm_smmu_cmdq *cmdq = &ctx->smmu->cmdq;
+
+	/* Simulate a concurrent suspend event interrupting the invalidations */
+	atomic_or(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
+	WRITE_ONCE(ctx->suspended, true);
+}
+
+/*
+ * Verify SMMU PM Runtime gating, elision, and post-suspend resumption
+ * safety sequentially under active stress.
+ */
+static void arm_smmu_v3_rpm_test_stress_race(struct kunit *test)
+{
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_cfgi_all();
+	struct arm_smmu_test_timer_context timer_ctx = {0};
+	struct arm_smmu_device mock_smmu = smmu;
+	struct arm_smmu_cmdq *cmdq = &mock_smmu.cmdq;
+	struct arm_smmu_mock_cmdq mock = {0};
+	u32 stopped_prod;
+	int i;
+
+	arm_smmu_v3_test_init_mock_cmdq(test, &mock_smmu, &mock);
+
+	timer_ctx.smmu = &mock_smmu;
+
+	timer_setup_on_stack(&timer_ctx.timer, arm_smmu_v3_test_rpm_timer_callback, 0);
+	mod_timer(&timer_ctx.timer, jiffies + msecs_to_jiffies(10));
+
+	/* Execute the unmap storm until the timer triggers */
+	while (!READ_ONCE(timer_ctx.suspended)) {
+		if (arm_smmu_cmdq_issue_cmdlist(&mock_smmu, cmdq, &cmd, 1, false))
+			break;
+		usleep_range(50, 100);
+	}
+
+	timer_shutdown_sync(&timer_ctx.timer);
+	timer_destroy_on_stack(&timer_ctx.timer);
+
+	/* Establish the post-storm prod_reg index */
+	stopped_prod = le32_to_cpu(mock.mock_prod_reg);
+
+	/*
+	 * Attempt multiple unmaps while the SMMU is disabled (STOP_GATE is set)
+	 * Every single invalidation must get elided and return 0. The prod_reg
+	 * shall remain completely frozen after all of these submissions.
+	 */
+	for (i = 0; i < 1000; i++) {
+		if (arm_smmu_cmdq_issue_cmdlist(&mock_smmu, cmdq, &cmd, 1, false))
+			break;
+	}
+	KUNIT_EXPECT_EQ(test, stopped_prod, le32_to_cpu(mock.mock_prod_reg));
+
+	/*
+	 * Clear the STOP_FLAG (resume the SMMU). A new invalidation must
+	 * now successfully commit prod_idx & move the prod_reg by exactly 1.
+	 */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
+	KUNIT_EXPECT_EQ(test, 0, arm_smmu_cmdq_issue_cmdlist(&mock_smmu, cmdq, &cmd, 1, false));
+	KUNIT_EXPECT_EQ(test, Q_POS(&cmdq->q.llq, stopped_prod + 1),
+			le32_to_cpu(mock.mock_prod_reg));
+}
+
+struct arm_smmu_test_kthread_context {
+	struct arm_smmu_device *smmu;
+	int error;
+};
+
+static int arm_smmu_v3_test_kthread_worker(void *data)
+{
+	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_cfgi_all();
+	struct arm_smmu_test_kthread_context *ctx = data;
+	struct arm_smmu_cmdq *cmdq = &ctx->smmu->cmdq;
+
+	while (!kthread_should_stop()) {
+		if (arm_smmu_cmdq_issue_cmdlist(ctx->smmu, cmdq, &cmd, 1, false))
+			WRITE_ONCE(ctx->error, 1);
+		usleep_range(50, 100);
+	}
+	return 0;
+}
+
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_kthread_stop, kthread_stop, struct task_struct *);
+
+static void arm_smmu_v3_rpm_test_kthread_race(struct kunit *test)
+{
+	struct arm_smmu_test_kthread_context *ctx;
+	struct arm_smmu_device *mock_smmu;
+	struct arm_smmu_mock_cmdq *mock;
+	struct task_struct *thread1, *thread2;
+	u32 stopped_prod;
+	int i;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	mock_smmu = kunit_kzalloc(test, sizeof(*mock_smmu), GFP_KERNEL);
+	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+	KUNIT_ASSERT_NOT_NULL(test, mock_smmu);
+	KUNIT_ASSERT_NOT_NULL(test, mock);
+
+	*mock_smmu = smmu;
+	ctx->smmu = mock_smmu;
+	arm_smmu_v3_test_init_mock_cmdq(test, mock_smmu, mock);
+
+	thread1 = kthread_run(arm_smmu_v3_test_kthread_worker, ctx, "smmu_w1");
+	if (IS_ERR(thread1)) {
+		KUNIT_FAIL(test, "Failed to spawn kthread 1\n");
+		return;
+	}
+	if (kunit_add_action_or_reset(test, kunit_action_kthread_stop, thread1)) {
+		KUNIT_FAIL(test, "Failed to register cleanup for kthread 1\n");
+		return;
+	}
+
+	thread2 = kthread_run(arm_smmu_v3_test_kthread_worker, ctx, "smmu_w2");
+	if (IS_ERR(thread2)) {
+		KUNIT_FAIL(test, "Failed to spawn kthread 2\n");
+		return;
+	}
+	if (kunit_add_action_or_reset(test, kunit_action_kthread_stop, thread2)) {
+		KUNIT_FAIL(test, "Failed to register cleanup for kthread 2\n");
+		return;
+	}
+
+	/* Wait for worker threads to start and issue initial commands */
+	for (i = 0; i < 20; i++) {
+		if (le32_to_cpu(READ_ONCE(mock->mock_prod_reg)) > 0)
+			break;
+		usleep_range(1000, 2000);
+	}
+	KUNIT_EXPECT_GT(test, le32_to_cpu(READ_ONCE(mock->mock_prod_reg)), 0);
+
+	/* Gate the CMDQ */
+	atomic_or(CMDQ_PROD_STOP_FLAG, &mock_smmu->cmdq.q.llq.atomic.prod);
+
+	/* Wait for in-flight submissions to settle */
+	for (i = 0; i < 50; i++) {
+		stopped_prod = le32_to_cpu(READ_ONCE(mock->mock_prod_reg));
+		usleep_range(1000, 2000);
+		if (stopped_prod == le32_to_cpu(READ_ONCE(mock->mock_prod_reg)))
+			break;
+	}
+
+	usleep_range(1000, 2000);
+	KUNIT_EXPECT_EQ(test, stopped_prod, le32_to_cpu(READ_ONCE(mock->mock_prod_reg)));
+
+	/* Open the gate and wait for worker threads to resume */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &mock_smmu->cmdq.q.llq.atomic.prod);
+	for (i = 0; i < 20; i++) {
+		if (le32_to_cpu(READ_ONCE(mock->mock_prod_reg)) != stopped_prod)
+			break;
+		usleep_range(1000, 2000);
+	}
+	KUNIT_EXPECT_NE(test, stopped_prod, le32_to_cpu(READ_ONCE(mock->mock_prod_reg)));
+
+	kunit_release_action(test, kunit_action_kthread_stop, thread2);
+	kunit_release_action(test, kunit_action_kthread_stop, thread1);
+	KUNIT_EXPECT_EQ(test, 0, READ_ONCE(ctx->error));
+}
+
 static struct kunit_case arm_smmu_v3_test_cases[] = {
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_bypass_to_abort),
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_abort_to_bypass),
@@ -797,6 +1010,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_clear),
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_release),
 	KUNIT_CASE(arm_smmu_v3_invs_test),
+	KUNIT_CASE(arm_smmu_v3_rpm_test_stress_race),
+	KUNIT_CASE(arm_smmu_v3_rpm_test_kthread_race),
 	{},
 };
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8e4ce5eb2228..12d191fe57ed 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -991,6 +991,7 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 
 	return ret;
 }
+EXPORT_SYMBOL_IF_KUNIT(arm_smmu_cmdq_issue_cmdlist);
 
 static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
 				     struct arm_smmu_cmd *cmd, bool sync)
-- 
2.55.0.979.g7e5102b832-goog


