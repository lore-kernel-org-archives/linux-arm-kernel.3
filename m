Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3983CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzGqN+tew7ZwcjABhOfVWsjIQJB+81kdCIf60A/bHqA=; b=FC+Dl2/SsxabHx/Sl4CYFPnnyu
	nU390y81d4LtK7o8+K7uQO9BB+oqpw2HVWfgom6jNFxFc3TuyhGxnw6AqJPw0qzDSfzYY8EG06mQs
	8j2LRuja/Zv1KejpjyckxdKRBFZyZRr7zWV2eoyT+bGy2yPixDULeC44huzPNGDY0aqpwceZ7/mHY
	5gfRQDd54QhUBOrwFP7ijT2wvILRH4/396irUtfxGYKgcVpewW+7+n8HvZiL+XSxDU4oGPa6aYupO
	ndFSrbUVOQHFuBHWVPg2U9WWZrxG7aSpVgUXwuuD4pr0DheoB43uKU40+lTklUUsNUFlU2UpViap1
	LPRM+UJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp48-0000000DUR4-1Goj;
	Mon, 20 Oct 2025 12:32:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp27-0000000DRZE-3jRE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XzGqN+tew7ZwcjABhOfVWsjIQJB+81kdCIf60A/bHqA=; b=L098kZ+xs6nhvkObn6/CX6/i30
	E1OEyRYrXo+V8xzTLsBELgxX2Rulgj2y6BfK6+nOkCqh4VeFtRLOVdTbZSbVdTEFiYwdXXmT2GW+l
	pOsdKLsoTyHVnorF0xlVLbTTPTH8YT/G3ayKNu8/FpYRrQLg26BwJN9F4g9Cbp3GKETbaqom5nT6l
	RCv6OtHx1cYw1iPcVeQT95tsHmtrQYk0OUjVsEqHwq3kEkktAZDSoquVh0ZfxzcdLHsJtLUldx3RN
	ojyiZXyNksIVK928AzaNvlpVnqJDHPZzuAN+xBIeTzrtppVIw+vYBdja+47CSCJ+etupr8HKjLnZU
	kNTEkFWQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp23-000000074BW-04rn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B73148ACF;
	Mon, 20 Oct 2025 12:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F91C4CEF9;
	Mon, 20 Oct 2025 12:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963417;
	bh=bc+Rz/ctD2j/SHWKlDo8/tZQYXMrF+JYSaUu7EU1gpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdPwPqmBUbvaNAEgUNfVSRHq4jnUC0ZgisJGjm82JzIUJ33O+qaQ+4y2Z2OM29Ps2
	 Y47FrVRfUt1LhEs94Zat2IHYk0CHPkZ2BftjR6nO3VMtfUsTRGaux0wGH5TnVqab69
	 abA+LWQHHKmSArsHdhhq2fyVwVkj61nrQClnLw17xLLt4YA7HkzvgCb1XgNk+AUs9N
	 AD9+HD6xKbpU7eCvA4b5o2lQ63UgUQCJ6/GLLgMObJ5B4JoRaxKXXM2jxQEV3fx/ul
	 q6hoAJBpVrpByYXf9aIIYNfKHBbLG9RgPvllLIQrZ9OPVrsmroa3nP6mfrjiI71gJY
	 nXnt/rL/N/6Qw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1j-0000000FUu2-1Q5V;
	Mon, 20 Oct 2025 12:30:15 +0000
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
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 26/26] perf: arm_pmu: Kill last use of per-CPU cpu_armpmu pointer
Date: Mon, 20 Oct 2025 13:29:43 +0100
Message-ID: <20251020122944.3074811-27-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133036_598041_E682B95A 
X-CRM114-Status: GOOD (  15.33  )
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
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_pmu.c       | 5 -----
 drivers/perf/arm_pmuv3.c     | 2 +-
 include/linux/perf/arm_pmu.h | 2 --
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 959ceb3d1f556..f7abd13339630 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -104,7 +104,6 @@ static const struct pmu_irq_ops percpu_pmunmi_ops = {
 	.free_pmuirq = armpmu_free_percpu_pmunmi
 };
 
-DEFINE_PER_CPU(struct arm_pmu *, cpu_armpmu);
 static DEFINE_PER_CPU(int, cpu_irq);
 static DEFINE_PER_CPU(const struct pmu_irq_ops *, cpu_irq_ops);
 
@@ -725,8 +724,6 @@ static int arm_perf_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	if (pmu->reset)
 		pmu->reset(pmu);
 
-	per_cpu(cpu_armpmu, cpu) = pmu;
-
 	irq = armpmu_get_cpu_irq(pmu, cpu);
 	if (irq)
 		per_cpu(cpu_irq_ops, cpu)->enable_pmuirq(irq);
@@ -746,8 +743,6 @@ static int arm_perf_teardown_cpu(unsigned int cpu, struct hlist_node *node)
 	if (irq)
 		per_cpu(cpu_irq_ops, cpu)->disable_pmuirq(irq);
 
-	per_cpu(cpu_armpmu, cpu) = NULL;
-
 	return 0;
 }
 
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 69c5cc8f56067..ca8d706d40221 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1064,7 +1064,7 @@ static int armv8pmu_user_event_idx(struct perf_event *event)
 static void armv8pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
 				struct task_struct *task, bool sched_in)
 {
-	struct arm_pmu *armpmu = *this_cpu_ptr(&cpu_armpmu);
+	struct arm_pmu *armpmu = to_arm_pmu(pmu_ctx->pmu);
 	struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
 
 	if (!hw_events->branch_users)
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 6690bd77aa4ee..bab26a7d79f4c 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -132,8 +132,6 @@ struct arm_pmu {
 
 #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))
 
-DECLARE_PER_CPU(struct arm_pmu *, cpu_armpmu);
-
 u64 armpmu_event_update(struct perf_event *event);
 
 int armpmu_event_set_period(struct perf_event *event);
-- 
2.47.3


