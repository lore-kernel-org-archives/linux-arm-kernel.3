Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829ECC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFhBksdUPO0znF1KRVq6mRgwILQjjMIwQzPu3n7Yst4=; b=S7Z1VX5bz4uuBal76E+tM4r3fS
	T53WMcB4NWhqJALaHRJwCpk9EYZLSwVZxD3GSIlxSs7bDyv2xBIr+fAgD5/UX2fSJNWS0bDANUdlw
	n9dl/3RwVWAE3xcKw2PyjBcwFbeiSny0Htzjs6P6/Ww9lsXwAaJpnlUffAuweUmugitnn2RaK1nbp
	QswQ2DSayKZkThcUtoMqO3gdwV+c6R/lPG7YEtP3lByjKKnFrq9kIQTjNw9w6v5hcwqBkYJH/GE5q
	5MsQ0oYSSqYfFLub0xCxuhiYpPlEr9eby/3ZZkyh6PljO7dKGOSgsapoZSDL7baW8xsM5FmvDEnz0
	XoxSQhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop4S-00000006H2z-0NHh;
	Tue, 28 Jul 2026 21:10:40 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3t-00000006GgW-1eVj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:10:06 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1140146a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785273004; x=1785877804; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFhBksdUPO0znF1KRVq6mRgwILQjjMIwQzPu3n7Yst4=;
        b=pBwSFXXyeUd9nmCpS57VSlEQ5JcReciF8tylPUFqPamZYjPva8Z3ube+PeTPy83i1F
         zKUhqQP1jpN4LszRbEHqv6m0d5pLXvQfaVz2uLRteM6TfnOqlmyK2ht8HnQMGE8b8RXC
         HFSP8HCr7nGsHxqU13mPoWRFVvBTPuMGYE77Z3+t5zrYcbHSpQrNBlET8LkaafGjP8Cs
         kUcFtcw5pO0r1jDciCR8I8e4Gk/i13f1/8Oe27w+/AIosmuA4oYgkAPJ62tBfn5To52f
         IZvQxNkxvGE4HJ1m0/5FMZ8FzsCQIDNQ+c64YtwHbt8cce9b1YH9zmKxiCEfQVL3EQLt
         ex+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273004; x=1785877804;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFhBksdUPO0znF1KRVq6mRgwILQjjMIwQzPu3n7Yst4=;
        b=rhmly063oGTULqXzSiXo6Ru6tFIaC8xH/DEH8HBI6xycY+PtqMouVtRgUoWbV6VmXm
         BVWhKsbpqnXVmvHAta7bygdW5cRRtI5U5c2+vRj4h/qDTr2Ldo7HYvfiO2mqsSp5TFro
         NIYS50zaSMQiP+h9Pq9aQlQpif9JZ7AOHhaBQL80N40TIM+i/kmFRZTzs2aimh51Zmfc
         AhQcgZ/+TWBUylRqbKqU3GrSVitUj6am1cPS23iBzubaTp2oVh9G5I9LQ1iMupub0Ojw
         2/B1rjYF69xXppCNyr7RPR2u0NmuxxV915rEPBSxM1/efO70//7eFpkfLLJ4zPhJTOXg
         /Ayw==
X-Forwarded-Encrypted: i=1; AHgh+RqFlTy9rY6UVdNWcnb6gpQIxVjEfUXWbP5Q/3ph90Wj5c+Vf9pts2JYLQLreGSByz7V85UAOld+896HceFVFBcK@lists.infradead.org
X-Gm-Message-State: AOJu0YymZ28m/o3PKBeD5T/CR9yr/qJ7I7fXdra+8YAe1XGBWKcLt0Qg
	YtkoEnWYAd7IBvffF9h7o5ETVL+f8nobvg8qccGeki6RVGUKt9rtasV79kDMnR21b9PovmTkCFW
	xHA==
X-Received: from pllj6.prod.google.com ([2002:a17:902:7586:b0:2c7:f35e:555])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b48:b0:2ca:e496:5f19
 with SMTP id d9443c01a7336-2d015db7b79mr46897975ad.19.1785273003834; Tue, 28
 Jul 2026 14:10:03 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:28 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-13-praan@google.com>
Subject: [PATCH v9 12/12] iommu/arm-smmu-v3: Add KUnit unit tests for Runtime PM
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_141005_455979_B13C8864 
X-CRM114-Status: GOOD (  17.94  )
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
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 171 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   1 +
 2 files changed, 172 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c82..2654bd497fd3 100644
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
@@ -771,6 +775,171 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	kfree(test_b);
 }
 
+struct arm_smmu_mock_cmdq {
+	u32 mock_prod_reg;
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
+	cmdq->q.prod_reg = (__force u32 __iomem *)&mock->mock_prod_reg;
+	cmdq->q.cons_reg = (__force u32 __iomem *)&mock->mock_prod_reg;
+
+	atomic_set(&cmdq->q.llq.atomic.prod, 0);
+	atomic_set(&cmdq->q.llq.atomic.cons, 0);
+	atomic_set(&cmdq->owner_prod, 0);
+	mock->mock_prod_reg = 0;
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
+	timer_setup(&timer_ctx.timer, arm_smmu_v3_test_rpm_timer_callback, 0);
+	mod_timer(&timer_ctx.timer, jiffies + msecs_to_jiffies(10));
+
+	/* Execute the unmap storm until the timer triggers */
+	while (!READ_ONCE(timer_ctx.suspended)) {
+		if (arm_smmu_cmdq_issue_cmdlist(&mock_smmu, cmdq, &cmd, 1, false))
+			break;
+		usleep_range(50, 100);
+	}
+
+	timer_delete_sync(&timer_ctx.timer);
+
+	/* Establish the post-storm prod_reg index */
+	stopped_prod = mock.mock_prod_reg;
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
+	KUNIT_EXPECT_EQ(test, stopped_prod, mock.mock_prod_reg);
+
+	/*
+	 * Clear the STOP_FLAG (resume the SMMU). A new invalidation must
+	 * now successfully commit prod_idx & move the prod_reg by exactly 1.
+	 */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
+	KUNIT_EXPECT_EQ(test, 0, arm_smmu_cmdq_issue_cmdlist(&mock_smmu, cmdq, &cmd, 1, false));
+	KUNIT_EXPECT_EQ(test, stopped_prod + 1, mock.mock_prod_reg);
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
+static void arm_smmu_v3_rpm_test_kthread_race(struct kunit *test)
+{
+	struct arm_smmu_test_kthread_context ctx = {0};
+	struct arm_smmu_device mock_smmu = smmu;
+	struct arm_smmu_mock_cmdq mock = {0};
+	struct task_struct *thread1, *thread2;
+	u32 stopped_prod;
+
+	ctx.smmu = &mock_smmu;
+	arm_smmu_v3_test_init_mock_cmdq(test, &mock_smmu, &mock);
+
+	thread1 = kthread_run(arm_smmu_v3_test_kthread_worker, &ctx, "smmu_w1");
+	thread2 = kthread_run(arm_smmu_v3_test_kthread_worker, &ctx, "smmu_w2");
+	if (IS_ERR(thread1) || IS_ERR(thread2)) {
+		if (!IS_ERR(thread1))
+			kthread_stop(thread1);
+		if (!IS_ERR(thread2))
+			kthread_stop(thread2);
+		return;
+	}
+
+	usleep_range(1000, 2000);
+
+	/* Gate the CMDQ */
+	atomic_or(CMDQ_PROD_STOP_FLAG, &mock_smmu.cmdq.q.llq.atomic.prod);
+	stopped_prod = mock.mock_prod_reg;
+
+	usleep_range(1000, 2000);
+	KUNIT_EXPECT_EQ(test, stopped_prod, mock.mock_prod_reg);
+
+	/* Open the gate */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &mock_smmu.cmdq.q.llq.atomic.prod);
+	usleep_range(1000, 2000);
+	KUNIT_EXPECT_NE(test, stopped_prod, mock.mock_prod_reg);
+
+	kthread_stop(thread1);
+	kthread_stop(thread2);
+	KUNIT_EXPECT_EQ(test, 0, ctx.error);
+}
+
 static struct kunit_case arm_smmu_v3_test_cases[] = {
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_bypass_to_abort),
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_abort_to_bypass),
@@ -797,6 +966,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_clear),
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_release),
 	KUNIT_CASE(arm_smmu_v3_invs_test),
+	KUNIT_CASE(arm_smmu_v3_rpm_test_stress_race),
+	KUNIT_CASE(arm_smmu_v3_rpm_test_kthread_race),
 	{},
 };
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 97e7284fcfcc..9106ffb75f7a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -935,6 +935,7 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	local_irq_restore(flags);
 	return ret;
 }
+EXPORT_SYMBOL_IF_KUNIT(arm_smmu_cmdq_issue_cmdlist);
 
 bool arm_smmu_erratum_repeat_tlbi_cfgi(void)
 {
-- 
2.55.0.487.gaf234c4eb3-goog


