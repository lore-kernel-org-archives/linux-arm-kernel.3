Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE298C88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFb79dSqsMDhhlCl/+P98wBIZc1/ha8hdSs2cdu5edc=; b=OjjgF5bYHoc6996SoUwuYgWIyA
	VNhWELyo6KpoowuGzBxKIBuBQA2xSoW1EnbdTXMVCq9nToFgWLqOyMGnIKCt3EsdTSBs5rjUk2YWk
	vlAHOuo3CtD9nQIK863kqxiCGYq0D97PfKQQz2xqS7yQYUDmq/qwy6cRaG8tLP/TB5q4cqoZKQEcV
	EcjTRn5AxZj+EI8dNXkvO2esrCp2T7erBYW4itqtVdlN186ag0Z+aX2OJhWBM5C8zV0zh+qMyqk3O
	TyM4qiYQ2MC1Du7ZiOu4ZGfbhUekntDf5k54tDOBxIktPrkYYJjJ4powXPX/1N8mpO9ISnWXBiNit
	OK/HfTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63qq-000000037mI-2G76;
	Mon, 14 Sep 2026 10:23:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pN-00000003601-0ZMW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 10:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NFb79dSqsMDhhlCl/+P98wBIZc1/ha8hdSs2cdu5edc=; b=g74rVjlp8OpStoDpSp9713G6/m
	y57SvJhqe8szwNA650XIMkeQo6+v2lDdkkqS36//PbC89BZ3zRJsqoo9oe4esj+xLpOVK6+rsz1ky
	eCC8xlAK75HMjFWvdGqSiRKlXVBW+YlLxVvBTy7/qUZkbEUG7Tyj4DcbBdu/r34Id4Z+ewoOZW7rH
	77lyyt/QRXPUyDKYCYGSJzcarjuz1v02wWtU9HFH5/fvuF8oTGiQp7las8nysHPfR1M+UZNPAx1Bi
	bAg9lAId8o0nbqRZ7d/hVEOoBwkwKGcx2V8wD6/JjsEKKc7BaDNW1R2X4/rWk0YkLemQ+4P6YXMZW
	8fpGfZmg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63pJ-00000005UAL-3U83
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAA851570;
	Mon, 14 Sep 2026 03:22:12 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7338E3F7B4;
	Mon, 14 Sep 2026 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381336; bh=nA3J3KSqTVBsj68oPkudJHQ2VUL8jZxh9GtHAhH7ixg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mxe6tOlG0fd7ilL8b5SvI8MMpz6ZNo9FA6DzIWitgSNcHwQwpl1DhnRdYbbfcm3fc
	 RF+0R1jV+msypBYzRkXVD9absv4QUDUN4URuzaBgX/zKHOg6jBP/d3ZWWdIU/aBu1p
	 rPgbQpK0iS9Pyedx27yMSubDLvGzI/zvlt1sOtKs=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 34/38] irqchip/gic-v3: Implement FEAT_GICv3_NMI support
Date: Mon, 14 Sep 2026 11:20:58 +0100
Message-Id: <20260914102102.68597-35-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_112218_593252_FB5C4C4C 
X-CRM114-Status: GOOD (  19.33  )
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

From: Lorenzo Pieralisi <lpieralisi@kernel.org>

The FEAT_GICv3_NMI GIC feature coupled with the CPU FEAT_NMI enables
handling NMI interrupts in HW on aarch64, by adding a superpriority
interrupt to the existing GIC priority scheme.

Implement GIC driver support for the FEAT_GICv3_NMI feature.

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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/irqchip/irq-gic-v3.c       | 114 +++++++++++++++++++++++++++--
 include/linux/irqchip/arm-gic-v3.h |   4 +
 2 files changed, 111 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6a807c226425..e2f2e5f29818 100644
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
@@ -89,6 +90,9 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
 
 static bool pseudo_nmi_support_forbidden;
 
+static DEFINE_RAW_SPINLOCK(gic_nmi_lock);
+
+
 /*
  * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
  * are potentially stolen by the secure side. Some code, especially code dealing
@@ -252,6 +256,37 @@ enum gic_intid_range {
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
@@ -438,6 +473,8 @@ static u32 convert_offset_index(struct irq_data *d, u32 offset, u32 *index)
 			return GICD_ICFGRnE;
 		case GICD_IROUTER:
 			return GICD_IROUTERnE;
+		case GICD_INMIR:
+			return GICD_INMIRnE;
 		default:
 			break;
 		}
@@ -467,6 +504,42 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
 	return !!(readl_relaxed(base + offset + (index / 32) * 4) & mask);
 }
 
+static void gic_irq_configure_nmi(struct irq_data *d, bool enable)
+{
+	void __iomem *base, *addr;
+	unsigned long val;
+	u32 offset, index;
+
+	offset = convert_offset_index(d, GICD_INMIR, &index);
+
+	if (gic_irq_in_rdist(d))
+		base = gic_data_rdist_sgi_base();
+	else
+		base = gic_dist_base_alias(d);
+
+	addr = base + offset + (index / 32) * 4;
+
+	raw_spin_lock(&gic_nmi_lock);
+
+	val = readl_relaxed(addr);
+
+	__assign_bit(index % 32, &val, enable);
+
+	writel_relaxed(val, addr);
+
+	raw_spin_unlock(&gic_nmi_lock);
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
@@ -598,7 +671,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (!gic_supports_pseudo_nmi())
+	if (!gic_supports_pseudo_nmi() && !gic_supports_v3_3_nmi())
 		return -EINVAL;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -617,7 +690,10 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 	if (!gic_irq_in_rdist(d))
 		desc->handle_irq = handle_fasteoi_nmi;
 
-	gic_irq_set_prio(d, dist_prio_nmi);
+	if (gic_supports_v3_3_nmi())
+		gic_irq_enable_nmi(d);
+	else
+		gic_irq_set_prio(d, dist_prio_nmi);
 
 	return 0;
 }
@@ -626,7 +702,7 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (WARN_ON(!gic_supports_pseudo_nmi()))
+	if (WARN_ON(!gic_supports_pseudo_nmi() && !gic_supports_v3_3_nmi()))
 		return;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -645,7 +721,10 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 	if (!gic_irq_in_rdist(d))
 		desc->handle_irq = handle_fasteoi_irq;
 
-	gic_irq_set_prio(d, dist_prio_irq);
+	if (gic_supports_v3_3_nmi())
+		gic_irq_disable_nmi(d);
+	else
+		gic_irq_set_prio(d, dist_prio_irq);
 }
 
 static bool gic_arm64_erratum_2941627_needed(struct irq_data *d)
@@ -836,7 +915,8 @@ static void __gic_handle_nmi(u32 irqnr, struct pt_regs *regs)
 	gic_complete_ack(irqnr);
 
 	if (generic_handle_domain_nmi(gic_data.domain, irqnr)) {
-		WARN_ONCE(true, "Unexpected pseudo-NMI (irqnr %u)\n", irqnr);
+		WARN_ONCE(true, "Unexpected %sNMI (irqnr %u)\n",
+			  gic_supports_pseudo_nmi() ? "pseudo-" : "", irqnr);
 		gic_deactivate_unhandled(irqnr);
 	}
 }
@@ -911,7 +991,11 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
 
 static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 {
-	if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
+	if (gic_supports_v3_3_nmi() && in_nmi()) {
+		u32 irqnr = gic_read_nmiar();
+
+		__gic_handle_nmi(irqnr, regs);
+	} else if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
 		__gic_handle_irq_from_irqsoff(regs);
 	else
 		__gic_handle_irq_from_irqson(regs);
@@ -1964,6 +2048,19 @@ static void gic_enable_pseudo_nmi(void)
 		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
 
 	static_branch_enable(&supports_pseudo_nmi);
+}
+
+static void gic_enable_nmi_support(void)
+{
+	if ((!gic_prio_masking_enabled() || pseudo_nmi_support_forbidden) && !gic_supports_v3_3_nmi())
+		return;
+
+	/*
+	 * Initialize pseudo-NMIs only if GIC driver cannot take advantage
+	 * of core (FEAT_NMI) and GIC (FEAT_GICv3_NMI) in HW
+	 */
+	if (!gic_supports_v3_3_nmi())
+		gic_enable_pseudo_nmi();
 
 	if (static_branch_likely(&supports_deactivate_key))
 		gic_eoimode1_chip.flags |= IRQCHIP_SUPPORTS_NMI;
@@ -2032,6 +2129,9 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 	irq_domain_update_bus_token(gic_data.domain, DOMAIN_BUS_WIRED);
 
 	gic_data.has_rss = !!(typer & GICD_TYPER_RSS);
+	gic_data.has_nmi = !!(typer & GICD_TYPER_NMI);
+
+	pr_info("Non-maskable interrupt property %s supported\n", gic_data.has_nmi ? "is" : "not");
 
 	if (typer & GICD_TYPER_MBIS) {
 		err = mbi_init(handle, gic_data.domain);
@@ -2047,7 +2147,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 	gic_prio_init();
 	gic_dist_init();
 	gic_cpu_init();
-	gic_enable_pseudo_nmi();
+	gic_enable_nmi_support();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
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


