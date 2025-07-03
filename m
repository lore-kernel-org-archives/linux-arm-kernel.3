Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99392C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XvNs9BscGmdtjRxz3wIwJBqMSixZskBjzoWs8dTWk4=; b=RGDRtf5Dg62xn/qnIwQ+tt2sPv
	d/oCnucKF/yOF6goHbIzEDnysqyQx64u7nInxlDj/DQ6xPcS2z2ceJa52oD6UJjs/tLiTactr4oLA
	/q4g1sI+v4k8LNhQQ/zcNT5QHdEWYIJ2h9g3gqeKfRYbVz/qpD+xV2cn03e+b/2oHlMD2OwiGwj4R
	ac+o/S69iqORV7HbgKDZpMQUh1/DFX8Fezpxi/BKOmNbu4nAnESeEtBFrxQH3zTeUufwxKjEJk2XT
	jJqzrWxNNho3lQLfhXPwtMrpqH4Dy3eByZJZSTv0D2MdeGz5KmgZvW8c1hR75gnSAnkTf9e9M+KgG
	aQvfMw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHry-0000000B7qt-45kj;
	Thu, 03 Jul 2025 11:12:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH9Z-0000000Az74-422o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5455A61435;
	Thu,  3 Jul 2025 10:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC94BC4CEE3;
	Thu,  3 Jul 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538413;
	bh=jmKU/AVW3es/n6fJNXdjcwxCLiVu0aOx0X//TygUoKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NOYsieoqhimaXGfMqzeu7sVAzUmU6v4n4Vo01k0gStM0MntuliWzZhoUvkULKWNYt
	 jNU/qdqPeQlrULmVLWqD4CbDcZe9EJqim4FpD5yBHKraQ5nk/anarHjEED4un0e7r+
	 RVjdv29y7iw0KU4MEhfpA6fXXQOQg4ozvAFCgqXzpGSWPLheftCcbh+8zO+Sq78n2G
	 z7ht2BngIZ9TZoWn7WmBAkr4SL9DkHT54wM+xf7eQZUsk0/f80sivkw0xdZXggYZQG
	 UkY7T7fPmXvFXEt7On8uy8PqRV9LvE0R7AfpFlpZOyH4jd1L3Nhtw1tfn+HiGsx+dK
	 HQxHUIfFxJqZg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:08 +0200
Subject: [PATCH v7 18/31] arm64: smp: Support non-SGIs for IPIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-18-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

From: Marc Zyngier <maz@kernel.org>

The arm64 arch has relied so far on GIC architectural software
generated interrupt (SGIs) to handle IPIs. Those are per-cpu
software generated interrupts.

arm64 architecture code that allocates the IPIs virtual IRQs and
IRQ descriptors was written accordingly.

On GICv5 systems, IPIs are implemented using LPIs that are not
per-cpu interrupts - they are just normal routable IRQs.

Add arch code to set-up IPIs on systems where they are handled
using normal routable IRQs.

For those systems, force the IRQ affinity (and make it immutable)
to the cpu a given IRQ was assigned to.

Signed-off-by: Marc Zyngier <maz@kernel.org>
[timothy.hayes@arm.com: fixed ipi/irq conversion, irq flags]
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
[lpieralisi: changed affinity set-up, log]
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/smp.h |   7 ++-
 arch/arm64/kernel/smp.c      | 127 +++++++++++++++++++++++++++++++------------
 2 files changed, 99 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 2510eec026f7..d6fd6efb66a6 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -53,7 +53,12 @@ extern void smp_init_cpus(void);
 /*
  * Register IPI interrupts with the arch SMP code
  */
-extern void set_smp_ipi_range(int ipi_base, int nr_ipi);
+extern void set_smp_ipi_range_percpu(int ipi_base, int nr_ipi, int ncpus);
+
+static inline void set_smp_ipi_range(int ipi_base, int n)
+{
+	set_smp_ipi_range_percpu(ipi_base, n, 0);
+}
 
 /*
  * Called from the secondary holding pen, this is the secondary CPU entry point.
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..2c501e917d38 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -83,7 +83,16 @@ enum ipi_msg_type {
 
 static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
-static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
+
+struct ipi_descs {
+	struct irq_desc *descs[MAX_IPI];
+};
+
+static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
+
+#define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
+
+static bool percpu_ipi_descs __ro_after_init;
 
 static bool crash_stop;
 
@@ -844,7 +853,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
 			   prec >= 4 ? " " : "");
 		for_each_online_cpu(cpu)
-			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+			seq_printf(p, "%10u ", irq_desc_kstat_cpu(get_ipi_desc(cpu, i), cpu));
 		seq_printf(p, "      %s\n", ipi_types[i]);
 	}
 
@@ -917,9 +926,20 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
 #endif
 }
 
+static void arm64_send_ipi(const cpumask_t *mask, unsigned int nr)
+{
+	unsigned int cpu;
+
+	if (!percpu_ipi_descs)
+		__ipi_send_mask(get_ipi_desc(0, nr), mask);
+	else
+		for_each_cpu(cpu, mask)
+			__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
+}
+
 static void arm64_backtrace_ipi(cpumask_t *mask)
 {
-	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
+	arm64_send_ipi(mask, IPI_CPU_BACKTRACE);
 }
 
 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
@@ -944,7 +964,7 @@ void kgdb_roundup_cpus(void)
 		if (cpu == this_cpu)
 			continue;
 
-		__ipi_send_single(ipi_desc[IPI_KGDB_ROUNDUP], cpu);
+		__ipi_send_single(get_ipi_desc(cpu, IPI_KGDB_ROUNDUP), cpu);
 	}
 }
 #endif
@@ -1013,14 +1033,16 @@ static void do_handle_IPI(int ipinr)
 
 static irqreturn_t ipi_handler(int irq, void *data)
 {
-	do_handle_IPI(irq - ipi_irq_base);
+	unsigned int ipi = (irq - ipi_irq_base) % nr_ipi;
+
+	do_handle_IPI(ipi);
 	return IRQ_HANDLED;
 }
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 {
 	trace_ipi_raise(target, ipi_types[ipinr]);
-	__ipi_send_mask(ipi_desc[ipinr], target);
+	arm64_send_ipi(target, ipinr);
 }
 
 static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
@@ -1046,11 +1068,15 @@ static void ipi_setup(int cpu)
 		return;
 
 	for (i = 0; i < nr_ipi; i++) {
-		if (ipi_should_be_nmi(i)) {
-			prepare_percpu_nmi(ipi_irq_base + i);
-			enable_percpu_nmi(ipi_irq_base + i, 0);
+		if (!percpu_ipi_descs) {
+			if (ipi_should_be_nmi(i)) {
+				prepare_percpu_nmi(ipi_irq_base + i);
+				enable_percpu_nmi(ipi_irq_base + i, 0);
+			} else {
+				enable_percpu_irq(ipi_irq_base + i, 0);
+			}
 		} else {
-			enable_percpu_irq(ipi_irq_base + i, 0);
+			enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
 		}
 	}
 }
@@ -1064,44 +1090,77 @@ static void ipi_teardown(int cpu)
 		return;
 
 	for (i = 0; i < nr_ipi; i++) {
-		if (ipi_should_be_nmi(i)) {
-			disable_percpu_nmi(ipi_irq_base + i);
-			teardown_percpu_nmi(ipi_irq_base + i);
+		if (!percpu_ipi_descs) {
+			if (ipi_should_be_nmi(i)) {
+				disable_percpu_nmi(ipi_irq_base + i);
+				teardown_percpu_nmi(ipi_irq_base + i);
+			} else {
+				disable_percpu_irq(ipi_irq_base + i);
+			}
 		} else {
-			disable_percpu_irq(ipi_irq_base + i);
+			disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
 		}
 	}
 }
 #endif
 
-void __init set_smp_ipi_range(int ipi_base, int n)
+static void ipi_setup_sgi(int ipi)
+{
+	int err, irq, cpu;
+
+	irq = ipi_irq_base + ipi;
+
+	if (ipi_should_be_nmi(irq)) {
+		err = request_percpu_nmi(irq, ipi_handler, "IPI", &irq_stat);
+		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
+	} else {
+		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
+		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
+	}
+
+	for_each_possible_cpu(cpu)
+		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+
+	irq_set_status_flags(irq, IRQ_HIDDEN);
+}
+
+static void ipi_setup_lpi(int ipi, int ncpus)
+{
+	for (int cpu = 0; cpu < ncpus; cpu++) {
+		int err, irq;
+
+		irq = ipi_irq_base + (cpu * nr_ipi) + ipi;
+
+		err = irq_force_affinity(irq, cpumask_of(cpu));
+		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
+
+		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
+				  NULL);
+		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
+
+		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
+
+		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+	}
+}
+
+void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
 {
 	int i;
 
 	WARN_ON(n < MAX_IPI);
 	nr_ipi = min(n, MAX_IPI);
 
-	for (i = 0; i < nr_ipi; i++) {
-		int err;
-
-		if (ipi_should_be_nmi(i)) {
-			err = request_percpu_nmi(ipi_base + i, ipi_handler,
-						 "IPI", &irq_stat);
-			WARN(err, "Could not request IPI %d as NMI, err=%d\n",
-			     i, err);
-		} else {
-			err = request_percpu_irq(ipi_base + i, ipi_handler,
-						 "IPI", &irq_stat);
-			WARN(err, "Could not request IPI %d as IRQ, err=%d\n",
-			     i, err);
-		}
-
-		ipi_desc[i] = irq_to_desc(ipi_base + i);
-		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
-	}
-
+	percpu_ipi_descs = !!ncpus;
 	ipi_irq_base = ipi_base;
 
+	for (i = 0; i < nr_ipi; i++) {
+		if (!percpu_ipi_descs)
+			ipi_setup_sgi(i);
+		else
+			ipi_setup_lpi(i, ncpus);
+	}
+
 	/* Setup the boot CPU immediately */
 	ipi_setup(smp_processor_id());
 }

-- 
2.48.0


