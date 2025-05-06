Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CB0C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBjWbCc3PNzivVeotmgDC+x5gUF1jJVu8dVVjZoOgLI=; b=UxwmY+zJHCMEkFJE7pTxrCqspX
	6Iuzup0LzDATmhByc9xK+wbJLXkB3zmWCV444Xuhdcyr5LCxgoOpoxcOocdOQZhcpRTAa1lGSIApr
	+fa+gP+ghpYJeXeSpRtgEMJVH9KsMjtuQ8Mo6L4gSucsUy81zU7LVVfOZPjS1Y8Qlfer4/OXHdS6U
	F3GZ1CYZSsXekMl+zJWoCY1DVC2AJtnoHdND3ZcyKl+LhdFkNeaPlJcn5oJ3bMcDRLyyA0TzwXpTS
	R0TwsS1/AXWKKAC9/YdFUkm387jhs15AIVRNIot0SH6IiLY0lNmTxO0ZpWCEOdDVZo2/1OwwDiT6W
	mOTx2k2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKcd-0000000CZ4h-1uNg;
	Tue, 06 May 2025 15:54:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHMN-0000000BteV-3WiV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:25:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A3D743B28;
	Tue,  6 May 2025 12:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DC8C4CEE4;
	Tue,  6 May 2025 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534319;
	bh=WxlJpUqowBsQvYZOUMs8IGUAxzbj1n5Ter/RIBHuc/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hinV72AXyN4gMzehiQPaIjiUrfqq8TQ33Xsdh9/JOsKS7V2TvmivTwe3fD+7p+07k
	 wGHJJ3tELeWyHpP/CeU0D2oW6Iy5krz5jo1bnBVRgghbhvKxt/NseC3i1i0DnG5B5l
	 IfzBVJJu/PGgWQ+rMSvAKVa7/RcapC/CWe6dCwCIlbI1lo4JN4pa8PJBkSgwZKed7P
	 HhakYC36VbZMK0IpGDoVB9E8R+y1U0jqSWkyWRpeheoFsej+kheEiFczybDUGcE0co
	 EOY9Dp/+qLOPKBq/4fr81rmq8hGGP6mZ/GEqB6FcUjbc+vq+JprpkDEAe9+4YTz7K1
	 cMBtQ8R/BwkcA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:47 +0200
Subject: [PATCH v3 18/25] arm64: smp: Support non-SGIs for IPIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-18-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_052519_931565_6C4EA56E 
X-CRM114-Status: GOOD (  21.36  )
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
 arch/arm64/kernel/smp.c      | 139 ++++++++++++++++++++++++++++++++-----------
 2 files changed, 111 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 2510eec026f7e3d6f0ecf1197c3a81b183ddd216..d6fd6efb66a673ae33825971e4aa07e791c02ee5 100644
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
index 3b3f6b56e733039cad7ff5b8995db16a68f3c762..3f3712e47c94c62836fb89cd4bfb3595fbb41557 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -83,7 +83,26 @@ enum ipi_msg_type {
 
 static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
-static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
+
+struct ipi_descs {
+	struct irq_desc *descs[MAX_IPI];
+};
+
+static DEFINE_PER_CPU(struct ipi_descs, pcpu_ipi_desc);
+
+#define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
+
+static bool percpu_ipi_descs __ro_after_init;
+
+static int ipi_to_irq(int ipi, int cpu)
+{
+	return ipi_irq_base + (cpu * nr_ipi) + ipi;
+}
+
+static int irq_to_ipi(int irq)
+{
+	return (irq - ipi_irq_base) % nr_ipi;
+}
 
 static bool crash_stop;
 
@@ -844,7 +863,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
 			   prec >= 4 ? " " : "");
 		for_each_online_cpu(cpu)
-			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+			seq_printf(p, "%10u ", irq_desc_kstat_cpu(get_ipi_desc(cpu, i), cpu));
 		seq_printf(p, "      %s\n", ipi_types[i]);
 	}
 
@@ -919,7 +938,13 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
 
 static void arm64_backtrace_ipi(cpumask_t *mask)
 {
-	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
+	unsigned int cpu;
+
+	if (!percpu_ipi_descs)
+		__ipi_send_mask(get_ipi_desc(0, IPI_CPU_BACKTRACE), mask);
+	else
+		for_each_cpu(cpu, mask)
+			__ipi_send_single(get_ipi_desc(cpu, IPI_CPU_BACKTRACE), cpu);
 }
 
 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
@@ -944,7 +969,7 @@ void kgdb_roundup_cpus(void)
 		if (cpu == this_cpu)
 			continue;
 
-		__ipi_send_single(ipi_desc[IPI_KGDB_ROUNDUP], cpu);
+		__ipi_send_single(get_ipi_desc(cpu, IPI_KGDB_ROUNDUP), cpu);
 	}
 }
 #endif
@@ -1013,14 +1038,21 @@ static void do_handle_IPI(int ipinr)
 
 static irqreturn_t ipi_handler(int irq, void *data)
 {
-	do_handle_IPI(irq - ipi_irq_base);
+	do_handle_IPI(irq_to_ipi(irq));
 	return IRQ_HANDLED;
 }
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 {
+	unsigned int cpu;
+
 	trace_ipi_raise(target, ipi_types[ipinr]);
-	__ipi_send_mask(ipi_desc[ipinr], target);
+
+	if (!percpu_ipi_descs)
+		__ipi_send_mask(get_ipi_desc(0, ipinr), target);
+	else
+		for_each_cpu(cpu, target)
+			__ipi_send_single(get_ipi_desc(cpu, ipinr), cpu);
 }
 
 static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
@@ -1046,11 +1078,15 @@ static void ipi_setup(int cpu)
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
@@ -1064,44 +1100,79 @@ static void ipi_teardown(int cpu)
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
+static void ipi_setup_ppi(int ipi)
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
+		irq = ipi_to_irq(ipi, cpu);
+
+		err = irq_force_affinity(irq, cpumask_of(cpu));
+
+		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
+
+		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
+				  &irq_stat);
+
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
+			ipi_setup_ppi(i);
+		else
+			ipi_setup_lpi(i, ncpus);
+	}
+
 	/* Setup the boot CPU immediately */
 	ipi_setup(smp_processor_id());
 }

-- 
2.48.0


