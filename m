Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204F3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7JHE2QUKrpcqM9bsGBoGwAJQuTSlRVTYg6R1TdNp+0=; b=j2l6hatX+/an+y
	HCGnfjYU8wiuaSEAot5aaOZAtbBx767SXeaSr1++fdG7UMpxEQblosC7SRNZDkHDqQjZAMyYnSKoc
	245YKBQ3U6/s3WE6mb8oEQO04op3czlXy4y+m+E+1CCUAt90l7fViUCRKoUj0vyg+zndG3j9u6x41
	amFjYKMav3aPIjKEN4kumdOyVzNofpLxeUcNshd+VORtKGuEBuEJLt+UTrNXbNLWrWzLy1juD+AxQ
	z2onDab2JngZ6bGXR5JNFbhCqY6xH2dXYSfZZ3XKnwbVXrM7Ifc71BFwskp1eXq6ek/cNNC2zT2QS
	DCQdhzQ83Mwl7bjjxcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnf8-00000002MhH-20Q1;
	Thu, 09 Jul 2026 12:15:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneR-00000002L6S-1bMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2929339;
	Thu,  9 Jul 2026 05:14:42 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CF913F66F;
	Thu,  9 Jul 2026 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599287; bh=mq8NUO0qDX1K0+gl1ac6XATvG1nN/6Z3GMs6/brXF2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O3nOylGvYIxOHFx4VChQvgubmSc0uJeRkZTlEEmreFB+jw7SAum/AylTXk0pvFEoG
	 6PfeVLTlxd8aj7bv4+cUEY9W4s8/HYA+NkvR6+4qQu4SAbnalOC++deP/e0b5m6ous
	 uMycRSbmf/SeeiZAx1Bauaij+IkiCqXPzKFsvUMg=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 36/36] irqchip/gic-v3: Implement FEAT_GICv3_NMI support
Date: Thu,  9 Jul 2026 13:13:33 +0100
Message-Id: <20260709121333.23507-37-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051447_565388_E69CBAA1 
X-CRM114-Status: GOOD (  22.92  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Lorenzo Pieralisi <lpieralisi@kernel.org>

The FEAT_GICv3_NMI GIC feature coupled with the CPU FEAT_NMI enables
handling NMI interrupts in HW on aarch64, by adding a superpriority
interrupt to the existing GIC priority scheme.

Implement GIC driver support for the FEAT_GICv3_NMI feature.

Rename gic_supports_nmi() helper function to gic_supports_pseudo_nmis()
to make the pseudo NMIs code path clearer and more explicit.

Check, through the ARM64 capabilitity infrastructure, if support
for FEAT_NMI was detected on the core and the system has not overridden
the detection and forced pseudo-NMIs enablement.

If FEAT_NMI is detected, it was not overridden (check embedded in the
system_uses_nmi() call) and the GIC supports the FEAT_GICv3_NMI
feature, initialize NMIs related HW GIC registers and route irq to NMI
handling logic.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/irqchip/irq-gic-v3.c       | 122 +++++++++++++++++++++++++----
 include/linux/irqchip/arm-gic-v3.h |   4 +
 2 files changed, 111 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 94c6a3f2b009..625be4fc06b4 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -64,6 +64,7 @@ struct gic_chip_data {
 	u32			nr_redist_regions;
 	u64			flags;
 	bool			has_rss;
+	bool			has_nmi;
 	unsigned int		ppi_nr;
 	struct partition_affinity *parts;
 	unsigned int		nr_parts;
@@ -87,7 +88,7 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
 #define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
 #define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
 
-static bool nmi_support_forbidden;
+static bool pnmi_support_forbidden;
 
 /*
  * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
@@ -185,7 +186,7 @@ static void __init gic_prio_init(void)
 				pr_warn("Broken GIC integration, security disabled\n");
 		} else {
 			pr_warn("Broken GIC integration, pNMI forbidden\n");
-			nmi_support_forbidden = true;
+			pnmi_support_forbidden = true;
 		}
 	}
 
@@ -252,6 +253,37 @@ enum gic_intid_range {
 	__INVALID_RANGE__
 };
 
+#ifdef CONFIG_ARM64
+#include <asm/cpufeature.h>
+
+static inline bool gic_supports_v3_3_nmi(void)
+{
+	return gic_data.has_nmi && system_uses_nmi();
+}
+
+static inline u64 gic_read_nmiar(void)
+{
+	u64 irqstat;
+
+	irqstat = read_sysreg_s(SYS_ICC_NMIAR1_EL1);
+
+	dsb(sy);
+
+	return irqstat;
+}
+
+#else
+static inline bool gic_supports_v3_3_nmi(void)
+{
+	return false;
+}
+
+static inline u64 gic_read_nmiar(void)
+{
+	BUG();
+}
+#endif
+
 static enum gic_intid_range __get_intid_range(irq_hw_number_t hwirq)
 {
 	switch (hwirq) {
@@ -438,6 +470,8 @@ static u32 convert_offset_index(struct irq_data *d, u32 offset, u32 *index)
 			return GICD_ICFGRnE;
 		case GICD_IROUTER:
 			return GICD_IROUTERnE;
+		case GICD_INMIR:
+			return GICD_INMIRnE;
 		default:
 			break;
 		}
@@ -467,6 +501,42 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
 	return !!(readl_relaxed(base + offset + (index / 32) * 4) & mask);
 }
 
+static DEFINE_RAW_SPINLOCK(irq_controller_lock);
+
+static void gic_irq_configure_nmi(struct irq_data *d, bool enable)
+{
+	void __iomem *base, *addr;
+	u32 offset, index, mask, val;
+
+	offset = convert_offset_index(d, GICD_INMIR, &index);
+	mask = 1 << (index % 32);
+
+	if (gic_irq_in_rdist(d))
+		base = gic_data_rdist_sgi_base();
+	else
+		base = gic_dist_base_alias(d);
+
+	addr = base + offset + (index / 32) * 4;
+
+	raw_spin_lock(&irq_controller_lock);
+
+	val = readl_relaxed(addr);
+	val = enable ? (val | mask) : (val & ~mask);
+	writel_relaxed(val, addr);
+
+	raw_spin_unlock(&irq_controller_lock);
+}
+
+static void gic_irq_enable_nmi(struct irq_data *d)
+{
+	gic_irq_configure_nmi(d, true);
+}
+
+static void gic_irq_disable_nmi(struct irq_data *d)
+{
+	gic_irq_configure_nmi(d, false);
+}
+
 static void gic_poke_irq(struct irq_data *d, u32 offset)
 {
 	void __iomem *base;
@@ -512,7 +582,7 @@ static void gic_unmask_irq(struct irq_data *d)
 	gic_poke_irq(d, GICD_ISENABLER);
 }
 
-static inline bool gic_supports_nmi(void)
+static inline bool gic_supports_pseudo_nmis(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
 	       static_branch_likely(&supports_pseudo_nmis);
@@ -598,7 +668,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (!gic_supports_nmi())
+	if (!gic_supports_pseudo_nmis() && !gic_supports_v3_3_nmi())
 		return -EINVAL;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -617,7 +687,10 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 	if (!gic_irq_in_rdist(d))
 		desc->handle_irq = handle_fasteoi_nmi;
 
-	gic_irq_set_prio(d, dist_prio_nmi);
+	if (gic_supports_v3_3_nmi())
+		gic_irq_enable_nmi(d);
+	else
+		gic_irq_set_prio(d, dist_prio_nmi);
 
 	return 0;
 }
@@ -626,7 +699,7 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (WARN_ON(!gic_supports_nmi()))
+	if (WARN_ON(!gic_supports_pseudo_nmis() && !gic_supports_v3_3_nmi()))
 		return;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -645,7 +718,10 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 	if (!gic_irq_in_rdist(d))
 		desc->handle_irq = handle_fasteoi_irq;
 
-	gic_irq_set_prio(d, dist_prio_irq);
+	if (gic_supports_v3_3_nmi())
+		gic_irq_disable_nmi(d);
+	else
+		gic_irq_set_prio(d, dist_prio_irq);
 }
 
 static bool gic_arm64_erratum_2941627_needed(struct irq_data *d)
@@ -804,7 +880,7 @@ static inline void gic_complete_ack(u32 irqnr)
 
 static bool gic_rpr_is_nmi_prio(void)
 {
-	if (!gic_supports_nmi())
+	if (!gic_supports_pseudo_nmis())
 		return false;
 
 	return unlikely(gic_read_rpr() == GICV3_PRIO_NMI);
@@ -836,7 +912,8 @@ static void __gic_handle_nmi(u32 irqnr, struct pt_regs *regs)
 	gic_complete_ack(irqnr);
 
 	if (generic_handle_domain_nmi(gic_data.domain, irqnr)) {
-		WARN_ONCE(true, "Unexpected pseudo-NMI (irqnr %u)\n", irqnr);
+		WARN_ONCE(true, "Unexpected %sNMI (irqnr %u)\n",
+			  gic_supports_pseudo_nmis() ? "pseudo-" : "", irqnr);
 		gic_deactivate_unhandled(irqnr);
 	}
 }
@@ -911,7 +988,11 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
 
 static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 {
-	if (unlikely(gic_supports_nmi() && !interrupts_enabled(regs)))
+	if (gic_supports_v3_3_nmi() && in_nmi()) {
+		u32 irqnr = gic_read_nmiar();
+
+		__gic_handle_nmi(irqnr, regs);
+	} else if (unlikely(gic_supports_pseudo_nmis() && !interrupts_enabled(regs)))
 		__gic_handle_irq_from_irqsoff(regs);
 	else
 		__gic_handle_irq_from_irqson(regs);
@@ -1162,7 +1243,7 @@ static void gic_cpu_sys_reg_init(void)
 	/* Set priority mask register */
 	if (!gic_prio_masking_enabled()) {
 		write_gicreg(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
-	} else if (gic_supports_nmi()) {
+	} else if (gic_supports_pseudo_nmis()) {
 		/*
 		 * Check that all CPUs use the same priority space.
 		 *
@@ -1955,15 +2036,25 @@ static const struct gic_quirk gic_quirks[] = {
 	}
 };
 
-static void gic_enable_nmi_support(void)
+static void gic_enable_pseudo_nmis(void)
 {
-	if (!gic_prio_masking_enabled() || nmi_support_forbidden)
-		return;
-
 	pr_info("Pseudo-NMIs enabled using %s ICC_PMR_EL1 synchronisation\n",
 		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
 
 	static_branch_enable(&supports_pseudo_nmis);
+}
+
+static void gic_enable_nmi_support(void)
+{
+	if ((!gic_prio_masking_enabled() || pnmi_support_forbidden) && !gic_supports_v3_3_nmi())
+		return;
+
+	/*
+	 * Initialize pseudo-NMIs only if GIC driver cannot take advantage
+	 * of core (FEAT_NMI) and GIC (FEAT_GICv3_NMI) in HW
+	 */
+	if (!gic_supports_v3_3_nmi())
+		gic_enable_pseudo_nmis();
 
 	if (static_branch_likely(&supports_deactivate_key))
 		gic_eoimode1_chip.flags |= IRQCHIP_SUPPORTS_NMI;
@@ -2032,6 +2123,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 	irq_domain_update_bus_token(gic_data.domain, DOMAIN_BUS_WIRED);
 
 	gic_data.has_rss = !!(typer & GICD_TYPER_RSS);
+	gic_data.has_nmi = !!(typer & GICD_TYPER_NMI);
 
 	if (typer & GICD_TYPER_MBIS) {
 		err = mbi_init(handle, gic_data.domain);
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index ea5fd2374ebe..ebccd76cadda 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -30,6 +30,7 @@
 #define GICD_ICFGR			0x0C00
 #define GICD_IGRPMODR			0x0D00
 #define GICD_NSACR			0x0E00
+#define GICD_INMIR			0x0F80
 #define GICD_IGROUPRnE			0x1000
 #define GICD_ISENABLERnE		0x1200
 #define GICD_ICENABLERnE		0x1400
@@ -39,6 +40,7 @@
 #define GICD_ICACTIVERnE		0x1C00
 #define GICD_IPRIORITYRnE		0x2000
 #define GICD_ICFGRnE			0x3000
+#define GICD_INMIRnE			0x3B00
 #define GICD_IROUTER			0x6000
 #define GICD_IROUTERnE			0x8000
 #define GICD_IDREGS			0xFFD0
@@ -83,6 +85,7 @@
 #define GICD_TYPER_LPIS			(1U << 17)
 #define GICD_TYPER_MBIS			(1U << 16)
 #define GICD_TYPER_ESPI			(1U << 8)
+#define GICD_TYPER_NMI			(1U << 9)
 
 #define GICD_TYPER_ID_BITS(typer)	((((typer) >> 19) & 0x1f) + 1)
 #define GICD_TYPER_NUM_LPIS(typer)	((((typer) >> 11) & 0x1f) + 1)
@@ -238,6 +241,7 @@
 #define GICR_ICFGR0			GICD_ICFGR
 #define GICR_IGRPMODR0			GICD_IGRPMODR
 #define GICR_NSACR			GICD_NSACR
+#define GICR_INMIR0			GICD_INMIR
 
 #define GICR_TYPER_PLPIS		(1U << 0)
 #define GICR_TYPER_VLPIS		(1U << 1)
-- 
2.34.1


