Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F04CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJm9JjV+TgsCg55sqT/p/D2Q2bknU8/JGBRjD7Umu7A=; b=P9dQPYGvaasf+d1Ibd/EoPX2zr
	MsIva7Uwo1fHfsSrgsjPiGAzXOPu5v7DfWDLVl0OZ9lZrmuoiYEhFdsxSye0yyzdudnydwaE6Oz5u
	BMp5UPywRNGD5rtC2avmGTMMOok0IBLr/p2XSXKBSInL6c3XWyL8e3umGpYtJaE3RZVxf6lh9g66F
	QsermPlmGJgVOvkxHZ3Yp5zKoVEr2v6nR82FkA/3wGdjo3SZC9oGed3GjtgkRj7CkmOetpsVXrWtX
	wNHLAZT8YVrDoiprbyWLMgYm9U8qP9YjP7oJgSc5iT8EvoN7yr3gxN3zoThCagzYj2fU1nERNN223
	wWJ9IoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvi80-000000025AD-0UEG;
	Mon, 08 Sep 2025 20:06:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemZ-00000000lUM-0aGR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DC66601EE;
	Mon,  8 Sep 2025 16:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C399C4CEF7;
	Mon,  8 Sep 2025 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349114;
	bh=mLfNgEe8vQvBs2HQCL9WyKiYdn23StzVUW+mSl2pM2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FFNpqPio6CG2cvl32kT6FfYkxqeMwmiyPSqr1/uefqh32Iuc/G19EPrwwLVRC+h1p
	 3kDnP7c5WyQqnwmCUYWnZNUjOUsbFINwb4gGxwXTmkdrxVjbvJFZuQ2zo2A36TWFI+
	 YBI3CS69BwckS7DFp54HJNx0lPGCEnRkOIhx/g9w5Ch78daOpDZbVQ0gT57stxeqV2
	 lJ1bDtJztN+7h/ShDNLhXHDKYa9XO2EkNdxUTuNldUxzJz6bBB70tEKrGZLEqJ5Oc9
	 tIQGyzjRaBIS4SSnFpfOVMV2wAYQrbsh7WLh1r7FhT7XmLtuemqJTdibrz68Y/+WUg
	 cbp92rZqRkEmQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemW-00000004NTm-1XQ8;
	Mon, 08 Sep 2025 16:31:52 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 25/25] perf: arm_pmu: Kill last use of per-CPU cpu_armpmu pointer
Date: Mon,  8 Sep 2025 17:31:27 +0100
Message-Id: <20250908163127.2462948-26-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Having removed the use of the cpu_armpmu per-CPU variable from the
interrupt handling, the only user left is the BRBE scheduler hook.

It is easy to drop the use of this variable by following the pointer
to the generic PMU structure, and get the arm_pmu structure from there.

Perform the conversion and kill cpu_armpmu altogether.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_pmu.c       | 5 -----
 drivers/perf/arm_pmuv3.c     | 2 +-
 include/linux/perf/arm_pmu.h | 2 --
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 0d64e929d9bf0..8b3d7022a2d83 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -99,7 +99,6 @@ static const struct pmu_irq_ops percpu_pmunmi_ops = {
 	.free_pmuirq = armpmu_free_percpu_pmunmi
 };
 
-DEFINE_PER_CPU(struct arm_pmu *, cpu_armpmu);
 static DEFINE_PER_CPU(const struct cpumask *, pmu_affinity);
 static DEFINE_PER_CPU(int, cpu_irq);
 static DEFINE_PER_CPU(const struct pmu_irq_ops *, cpu_irq_ops);
@@ -739,8 +738,6 @@ static int arm_perf_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	if (pmu->reset)
 		pmu->reset(pmu);
 
-	per_cpu(cpu_armpmu, cpu) = pmu;
-
 	irq = armpmu_get_cpu_irq(pmu, cpu);
 	if (irq)
 		per_cpu(cpu_irq_ops, cpu)->enable_pmuirq(irq);
@@ -760,8 +757,6 @@ static int arm_perf_teardown_cpu(unsigned int cpu, struct hlist_node *node)
 	if (irq)
 		per_cpu(cpu_irq_ops, cpu)->disable_pmuirq(irq);
 
-	per_cpu(cpu_armpmu, cpu) = NULL;
-
 	return 0;
 }
 
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index f6d7bab5d555c..2dee2d928aaef 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1039,7 +1039,7 @@ static int armv8pmu_user_event_idx(struct perf_event *event)
 static void armv8pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
 				struct task_struct *task, bool sched_in)
 {
-	struct arm_pmu *armpmu = *this_cpu_ptr(&cpu_armpmu);
+	struct arm_pmu *armpmu = to_arm_pmu(pmu_ctx->pmu);
 	struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
 
 	if (!hw_events->branch_users)
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 395d03c282e8c..b54c309a74f0f 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -132,8 +132,6 @@ struct arm_pmu {
 
 #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))
 
-DECLARE_PER_CPU(struct arm_pmu *, cpu_armpmu);
-
 u64 armpmu_event_update(struct perf_event *event);
 
 int armpmu_event_set_period(struct perf_event *event);
-- 
2.39.2


