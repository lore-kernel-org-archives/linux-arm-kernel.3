Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B57C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA6k3qWN2RbKn4Ca77DIoAw8E7HpBUVh9I9WhdjKnw0=; b=p9IO+zDuTQbpuZ071dhHJ74miw
	DdZi6XBXx6+UMntnDRWD271I3WwUKJ8jjKIyW6/qHd3O7g7xQq0M18GJnA9/D9l5/MCximsNw2aWq
	tBz9y6fUZod2r1laB/ZIb0kv9fKf0dsSi6Q5LhA4EBOlNThC09Nkwu8MysmEV+FZhz/swom5o8c3A
	yptVd2+fVFQj7Vj0U0mAa/PVmFoanyK7eOxUmAoTII5c2OIgddAm08TOvoRjg1kPqd7iV0Hc5vZsN
	yOIz6a3CwMg2YDMqH/0eKNVx4ZCNyDpnwnpWF1ijN07G5O8JeQK8gTECU6tbcII+9Z/Tgvvp+ENev
	oR8/UqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pZ-000000036Mk-3IDn;
	Mon, 14 Sep 2026 10:22:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pF-000000035p8-1wit
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A29F51570;
	Mon, 14 Sep 2026 03:22:08 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2EA6F3F7B4;
	Mon, 14 Sep 2026 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381332; bh=hrsamcMRSKONvzM7Uy2fyYXK2niMggFZ0wb2uFbbP78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nigg27a+krJtcdCG2UFFzAWR/Wxin+zfpVTcJYTMBLJ7XQl8YkE69Lk0t3Y0SCDQL
	 xjwxVZV9QxjhYz7fChYQukXqCu+VHqqXuTuiiG/t+nPYsn+ooT1XvVB+Bkk/fu+mmn
	 pbpnVu9orhesb1M0ly83bm+Gn+dfIEoR23w9dhSc=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 31/38] arm64: smp: Fall back to IRQ when IPI NMI request fails
Date: Mon, 14 Sep 2026 11:20:55 +0100
Message-Id: <20260914102102.68597-32-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032213_712498_3685F91C 
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

Existing IPI setup logic relies on ipi_should_be_nmi() to decide
whether to request an NMI (if supported) or an ordinary IRQ. If NMI is
not supported, using an ordinary IRQ is acceptable.

FEAT_NMI requires complementary support in the interrupt
controller. If FEAT_NMI is present but interrupt controller support is
absent, request_percpu_nmi() can fail.

One way to prevent this would be to extend ipi_should_be_nmi() to also
check for interrupt controller support. However, since falling back to
an ordinary IRQ is acceptable, treat ipi_should_be_nmi() as a hint
instead. Whether an IPI is actually registered as an NMI is determined
by the success or failure of request_percpu_nmi(). If the request
fails, fall back to request_irq().

Track which IPIs were actually registered as NMIs and use that state
in the per-CPU enable and disable paths. This avoids calling the
percpu NMI helpers for an IPI that fell back to regular IRQ handling.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 46cdcc114997..dec075bfbf3b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -71,11 +71,14 @@ static int nr_ipi __ro_after_init = NR_IPI;
 
 struct ipi_descs {
 	struct irq_desc *descs[MAX_IPI];
+	DECLARE_BITMAP(nmi_bitmap, MAX_IPI);
 };
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
 
 #define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
+#define get_ipi_nmi_bitmap(__cpu) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->nmi_bitmap)
+#define ipi_is_nmi(__cpu, __ipi) test_bit(__ipi, get_ipi_nmi_bitmap(__cpu))
 
 struct ipi_irq_ops {
 	void (*setup)(int ipi, int ncpus);
@@ -967,8 +970,8 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 	/*
 	 * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_" in the name,
 	 * nothing about it truly needs to be implemented using an NMI, it's
-	 * just that it's _allowed_ to work with NMIs. If ipi_should_be_nmi()
-	 * returned false our backtrace attempt will just use a regular IPI.
+	 * just that it's _allowed_ to work with NMIs. If we failed request
+	 * NMI our backtrace attempt will just use a regular IPI.
 	 */
 	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
 }
@@ -1101,6 +1104,7 @@ static void ipi_teardown(int cpu)
 
 static void ipi_sgi_setup(int ipi, int ncpus)
 {
+	bool is_nmi = ipi_should_be_nmi(ipi);
 	int err, irq, cpu;
 
 	if (WARN_ON_ONCE(ncpus))
@@ -1108,16 +1112,29 @@ static void ipi_sgi_setup(int ipi, int ncpus)
 
 	irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
-		err = request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat);
-		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
-	} else {
+	/*
+	 * Try to request NMI if it should be
+	 */
+	if (is_nmi && request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat)) {
+		/*
+		 * Fallback to regular IRQ
+		 */
+		is_nmi = false;
+	}
+
+       /*
+        * Otherwise regular IRQ
+        */
+	if (!is_nmi) {
 		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
 		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
 	}
 
-	for_each_possible_cpu(cpu)
+	for_each_possible_cpu(cpu) {
 		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+		if (is_nmi)
+			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
+	}
 
 	irq_set_status_flags(irq, IRQ_HIDDEN);
 }
@@ -1126,7 +1143,7 @@ static void ipi_sgi_enable(int cpu, int ipi)
 {
 	int irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
+	if (ipi_is_nmi(cpu, ipi)) {
 		prepare_percpu_nmi(irq);
 		enable_percpu_nmi(irq, 0);
 	} else {
@@ -1138,7 +1155,7 @@ static void ipi_sgi_disable(int cpu, int ipi)
 {
 	int irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
+	if (ipi_is_nmi(cpu, ipi)) {
 		disable_percpu_nmi(irq);
 		teardown_percpu_nmi(irq);
 	} else {
@@ -1310,7 +1327,7 @@ void smp_send_stop(void)
 	 * If CPUs are still online, try an NMI. There's no excuse for this to
 	 * be slow, so we only give them an extra 10 ms to respond.
 	 */
-	if (num_other_online_cpus() && ipi_should_be_nmi(IPI_CPU_STOP_NMI)) {
+	if (num_other_online_cpus() && ipi_is_nmi(smp_processor_id(), IPI_CPU_STOP_NMI)) {
 		smp_rmb();
 		cpumask_copy(&mask, cpu_online_mask);
 		cpumask_clear_cpu(smp_processor_id(), &mask);
-- 
2.34.1


