Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3498FC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LHQSalCmVlCgPfIU7QuXxuQm5lxLd81InbukbDQhVc=; b=sgRyOrhtc0TewpZBA/FFDcGK9g
	DZVbC7wuXlh9FGn5cAOYJpLLxuvv0/ksvR5z5Lws5ZwDiir0GMcx1rVkWFxmlEJYqJYgUSPf2eMvl
	cn/7r2TLxDruEL9pKKMGpWrgL/gxJr5C4ARCtaekcz6rhK8BXHecoofhU4pjB6n7b9xq+ZEN0dywB
	7+KVxnc/Sfk5vG4HYp3mrrUlNyMx0/sTJWRTX/YYYkSfYDJbbHVNWmQOYCcnEZKZRuUYmYY73yPVj
	55oNVvKbtqyBdeL/3idB2gbxXtMG6sz+rd8olTmjaak6eIURjbk3Qsgas6jriXlucuvQWExEEQhIO
	d9wYQ7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lo-0000000461v-2IpZ;
	Tue, 08 Apr 2025 13:13:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Yo-00000003kOj-20S7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C901614BA;
	Tue,  8 Apr 2025 10:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6FAC4CEEC;
	Tue,  8 Apr 2025 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109525;
	bh=D/+rC6w5Q4F5lWg5Dnv7jXrhOy3R2o7m8ettK5W6kbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JwsJN+JIUpF4no0YRkWLBYsTjWq/YvmA9FgsFGAtB3SyzR7dfvtH+0YPU0CvTRsTD
	 m0qlfqyYwVfgD1hu/TwVbkB6LAFkr0/ZT1W6DErcM1IR1o7rl0vln6YPBGACW4rljK
	 jvUZpvjmS6wJknzfhzrQZydfElElk/3lZ/+A8pCQBaVg7AoCFdxJm9ltYIDsUZOvav
	 8+kG62nigGokhXoNoFKd0P80gj4/O8tpdxEQDohAGrKCtqAQjQMUOZIYsldZEmChdI
	 1jYZxJzLaye/6ntNPRsx2cBIgeLbihhBPAu9jAbEtHtxPt42YTyXEHpKtxnNA6brgg
	 YyFoDwPuF4Img==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:20 +0200
Subject: [PATCH 21/24] irqchip/gic-v5: Enable GICv5 SMP booting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-21-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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

Set up IPIs by allocating IPI IRQs for all cpus and call into
arm64 core code to initialise IPIs IRQ descriptors and
request the related IRQ.

Implement hotplug callback to enable interrupts on a cpu
and register the cpu with an IRS.

Implement hotplug callback to check the IRS affinity setup
for IPIs on each CPU in order to ensure that each CPU's IPIs
affinity is what it is expected to be.

Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 84 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 85d951bfd807fc1b67b616dbadeebc150848293f..24789e9590115e6de7007cd4a74376ae34702ed6 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"GICv5: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/maple_tree.h>
@@ -992,6 +993,68 @@ static void gicv5_cpu_enable_interrupts(void)
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 }
 
+static int base_ipi_virq;
+
+static int gicv5_check_ipi_affinity(unsigned int cpu)
+{
+	int ret;
+	u64 cdrcfg, icsr;
+	u16 programmed_iaffid, requested_iaffid;
+	struct irq_data *d;
+	unsigned int i, virq_base = base_ipi_virq + cpu * GICV5_IPIS_PER_CPU;
+
+	for (i = 0; i < GICV5_IPIS_PER_CPU; i++) {
+		d = irq_get_irq_data(virq_base + i);
+
+		if (WARN_ON(!d))
+			return -ENODEV;
+
+		/*
+		 * We need to know the actual LPI that is being used, rather
+		 * than the IPI domain hwirq.
+		 *
+		 * Hence, use the hwirq from the parent (LPI domain) here.
+		 */
+		cdrcfg = d->parent_data->hwirq |
+			 FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_LPI);
+		preempt_disable();
+		gic_insn(cdrcfg, GICV5_OP_GIC_CDRCFG);
+		isb();
+		icsr = read_sysreg_s(SYS_ICC_ICSR_EL1);
+		preempt_enable();
+
+		if (FIELD_GET(ICC_ICSR_EL1_F, icsr)) {
+			pr_err("SYS_ID_ICC_ICSR_EL1 is not valid");
+			return -ENXIO;
+		}
+
+		if (!FIELD_GET(ICC_ICSR_EL1_Enabled, icsr)) {
+			pr_err("interrupt is disabled");
+			return -ENXIO;
+		}
+
+		if (FIELD_GET(ICC_ICSR_EL1_IRM, icsr)) {
+			pr_debug("Interrupt not using targeted routing");
+			return -ENXIO;
+		}
+
+		programmed_iaffid = (u16)FIELD_GET(ICC_ICSR_EL1_IAFFID, icsr);
+
+		ret = gicv5_irs_cpu_to_iaffid(cpu, &requested_iaffid);
+		if (ret)
+			return ret;
+
+		if (programmed_iaffid != requested_iaffid) {
+			pr_err("Mismatch between programmed_iaffid (%u) and requested_iaffid (%u)",
+			       programmed_iaffid, requested_iaffid);
+
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
 static int gicv5_starting_cpu(unsigned int cpu)
 {
 	if (WARN(!gicv5_cpuif_has_gcie(),
@@ -1003,6 +1066,25 @@ static int gicv5_starting_cpu(unsigned int cpu)
 	return gicv5_irs_register_cpu(cpu);
 }
 
+static void __init gicv5_smp_init(void)
+{
+	unsigned int num_ipis = GICV5_IPIS_PER_CPU * nr_cpu_ids;
+
+	cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_GIC_STARTING,
+				  "irqchip/arm/gicv5:starting",
+				  gicv5_starting_cpu, NULL);
+
+	base_ipi_virq = irq_domain_alloc_irqs(gicv5_global_data.ipi_domain,
+					  num_ipis, NUMA_NO_NODE, NULL);
+	if (WARN(base_ipi_virq <= 0, "IPI IRQ allocation was not successful"))
+		return;
+
+	set_smp_ipi_range_percpu(base_ipi_virq, GICV5_IPIS_PER_CPU, nr_cpu_ids);
+
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "irqchip/arm/gicv5:online",
+				  gicv5_check_ipi_affinity, NULL);
+}
+
 static void __init gicv5_free_domains(void)
 {
 	if (gicv5_global_data.ppi_domain)
@@ -1133,6 +1215,8 @@ static int __init gicv5_of_init(struct device_node *node,
 		return ret;
 	}
 
+	gicv5_smp_init();
+
 	return 0;
 }
 IRQCHIP_DECLARE(gic_v5, "arm,gic-v5", gicv5_of_init);

-- 
2.48.0


