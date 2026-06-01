Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2204CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhgaY/FpOn3IwQ6y8dnnL1iO7vtgSThimAmynNFDD1A=; b=pLUwC1cz4l2tI9QLFtlZNVsNfg
	QeNOnFOCFHRBgIuGzSyh8GfVTTVpf5JvC7DI/D7f/kaoED1iXJGA8vruTGTwyOcbYJdufpSLTrADH
	/X+lldBTRyA5pjvFAtiej0/hkXmEF0kAIUbgwyzmBbW+DzaIXR8YBYyrr5VzbagdkrHR5LxaSfpsb
	Egotd+gtwtXuXXP1K5MGmNz8VZyfksoIzobRHgCQpTSoZ7F8839QebZjb18PGXLJ2Yrocn2Og5Odr
	KioBMnTnqWCDnz+R/N9pgcdiWeZol3jDIdu7eT1GhfhA5aCX/aQO0xSnJk7XWFm15u8lXPn8jdfp2
	sYcrZXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfc-0000000Btdq-28e1;
	Mon, 01 Jun 2026 21:59:40 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfa-0000000BtYi-1ZDj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:39 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so2087984a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351177; x=1780955977; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhgaY/FpOn3IwQ6y8dnnL1iO7vtgSThimAmynNFDD1A=;
        b=qV6LfeZxIzQarTZzgt41YKM2oaDBT3GZLA53ibC0iXOGgL+LJwesad6ndiWd6HVGoi
         kfk/SELAzjfa6RkygVrmZdu1TxXvRgHYcJRENPllGWYi1NG34iEwOHjnfv8KsPbai+C0
         Vd+ZWb2xMQQ+Tj/vqoZ5MOuVKoFqx00J2iS7ofkJYD1cNGEPEKJ0lsUjiYYfMJv4QxST
         0fGX/vu42ITUjfLunSMd5oiqBiAQG3FzMMiWfKoAWBTiDahE9+CYVw9ZvQx2FDQHNu2o
         TAFTpX+t1R5UE2T3JtI037ze3ez54piWxyCGFzZOztMiLiwvY2ida3//VbDVtvJdbrdi
         B+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351177; x=1780955977;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhgaY/FpOn3IwQ6y8dnnL1iO7vtgSThimAmynNFDD1A=;
        b=UqiP/DdlMz4rRGLIL1JZ8/d33tHA6bSvOKdPR3z0QUCvFjaohbGm9mOpMTGE5Iw45A
         njwxuchaLvqizIfzxMZm5jguYxR9DDaJK6SFBY/cD2CWWEbJjnPfDtSH8T71CtewnhOV
         2jcqupwAxy2ROf1W/1iFZ9VoRSsJg0brCbzwxJoNQKmh0MpR26a5+OWvN+kH1ceDiJvF
         hAJ+su6uIyMChGpniG4LlAHU7qmnHYkpjHZY4eaqRA3uQtieekychFUFp7S5TA8zA8FG
         RQX8pIb7MnNhNZ8Kwihtr2LH6rTJIQ7kuDYNiiIri0WPuWBKnWH/p8+eDQiQ68Ns4xDc
         N64A==
X-Forwarded-Encrypted: i=1; AFNElJ9TYr7oHF7jWn0jFw0tX2MdcVmNj/ObDgNDPmZZWYGO2R3DDmQ5+mngdQzNkgCakewxfPtGnMVUsAVeltZRXEdN@lists.infradead.org
X-Gm-Message-State: AOJu0YxoCTnhbvBStLEqCDOqCeXthN/Rn+YofTXIPHdykTRG/UANohpx
	C/mfp0bPxnEl49KD5lWKtxv2e7gtOEV040gJepX6JjggnHnnDnBUFNA0k2VWBimId9MBhFkMnOj
	+gQ==
X-Received: from pjbok15.prod.google.com ([2002:a17:90b:1d4f:b0:36b:c52b:7c2e])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc4c:b0:36b:e109:1e63
 with SMTP id 98e67ed59e1d1-36c685a8f89mr13002900a91.27.1780351176452; Mon, 01
 Jun 2026 14:59:36 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:09 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-13-praan@google.com>
Subject: [PATCH v8 12/12] iommu/arm-smmu-v3: Add KUnit unit tests for Runtime PM
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145938_424932_8941F217 
X-CRM114-Status: GOOD (  18.36  )
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
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 169 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   1 +
 2 files changed, 170 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c82..04c65920c147 100644
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
@@ -771,6 +775,169 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
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
+		if (!IS_ERR(thread1)) kthread_stop(thread1);
+		if (!IS_ERR(thread2)) kthread_stop(thread2);
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
@@ -797,6 +964,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_clear),
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_release),
 	KUNIT_CASE(arm_smmu_v3_invs_test),
+	KUNIT_CASE(arm_smmu_v3_rpm_test_stress_race),
+	KUNIT_CASE(arm_smmu_v3_rpm_test_kthread_race),
 	{},
 };
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2e260f85b8fd..d72c891e75ba 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -873,6 +873,7 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	local_irq_restore(flags);
 	return ret;
 }
+EXPORT_SYMBOL_IF_KUNIT(arm_smmu_cmdq_issue_cmdlist);
 
 static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
 				     struct arm_smmu_cmd *cmd, bool sync)
-- 
2.54.0.1013.g208068f2d8-goog


