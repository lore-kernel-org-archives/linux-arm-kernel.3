Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D88C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vr91h+Ju9bRSN4XKKhgtmnQdnXIerKF/tjCocV+hz1c=; b=IOA4EHwrK7K0aEJ5Aqu7QBB5wG
	FMcPi28PB1f64Nn368mSiGZcQW98V+QhM8tjGptJf0XthkozDooH5d7orWuaN2b+rRYcHIz7IzFpf
	jRt3SXYmLC30SNcq8obFluMTnpIoAAnkrlihyu4cK+SnV623DbFu9nreXgJgbWm5gYI6vfz71pKrp
	/Vuwigj6mRwSIgKJ2KovPiUdC+mY6arJF1BP0RAeIJi/vidpavkbhKK9vdby86PkFbOR3gwKH+zlX
	vv/1Y8c3uX1swrigBNP6Pm2SxMHdxqsxwwv9ZLBvpMvEJiCuoRqp26K7eldeZO72wjjDKT0ZN4jnh
	s9Uy7OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA4-00000006Mdt-3VjW;
	Tue, 08 Jul 2025 19:39:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCr-000000067oL-1Z43
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7154846948;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F528C4CEED;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996052;
	bh=r99xr/Ix0KRK3vPIECtcrkQAC7v6FFSivDzeT7MCvdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LB3mddERlrgGLisMSm6ExX6kF5uOU1v2z4M6knBohINqTdNWY+X3mnbU7xQkaQe2X
	 Hvxs6vsakLXyUZ/fQQ9FTlZcTEeOsr5T9Um6E9misDAYmxs/a7qw/PUl5ID53VfHmS
	 nUcMWePMS3erA+S5ndSVBNHctJ6jU5kyQ2i9e4io6WFDiaxreN7LP/0WxmBjny1Hyx
	 3ou4V2ilihMxZIZwtFPDRjXgypUtIkge12ImDYFEAFEKC7iGkKqkL7TQRNGtp1ohw4
	 boeOraq3mIcI1fks1ENCmWKGxNGB1VHGyMwxfndACorh3b0CmG/Mh0j7rfOg0AgS0c
	 DQxGRoxnyruCQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCo-00Dqhw-CE;
	Tue, 08 Jul 2025 18:34:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 09/13] PCI: xgene-msi: Sanitise MSI allocation and affinity setting
Date: Tue,  8 Jul 2025 18:34:00 +0100
Message-Id: <20250708173404.1278635-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103413_456640_4054FA20 
X-CRM114-Status: GOOD (  39.64  )
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

Plugging a device that doesn't use managed affinity on an XGene-1
machine results in messages such as:

genirq: irq_chip PCI-MSIX-0000:01:00.0 did not update eff. affinity mask of irq 39

As it turns out, the driver was never updated to populate the effective
affinity on irq_set_affinity() call, and the core code is prickly about
that.

But upon further investigation, it appears that the driver keeps repainting
the hwirq field of the irq_data structure as a way to track the affinity
of the MSI, something that is very much frowned upon as it breaks the
fundamentals of an IRQ domain (an array indexed by hwirq).

Fixing this results more or less in a rewrite of the driver:

- Define how a hwirq and a cpu affinity map onto the MSI termination
  registers

- Allocate a single entry in the bitmap per MSI instead of *8*

- Correctly track CPU affinity

- Fix the documentation so that it actually means something (to me)

- Use standard bitmap iterators

- and plenty of other cleanups

With this, the driver behaves correctly on my vintage Mustang board.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 222 +++++++++++--------------
 1 file changed, 93 insertions(+), 129 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index cef0488749e1d..b9f364da87f2a 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -6,6 +6,7 @@
  * Author: Tanmay Inamdar <tinamdar@apm.com>
  *	   Duc Dang <dhdang@apm.com>
  */
+#include <linux/bitfield.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
@@ -22,7 +23,15 @@
 #define IDX_PER_GROUP		8
 #define IRQS_PER_IDX		16
 #define NR_HW_IRQS		16
-#define NR_MSI_VEC		(IDX_PER_GROUP * IRQS_PER_IDX * NR_HW_IRQS)
+#define NR_MSI_BITS		(IDX_PER_GROUP * IRQS_PER_IDX * NR_HW_IRQS)
+#define NR_MSI_VEC		(NR_MSI_BITS / num_possible_cpus())
+
+#define MSI_GROUP_MASK		GENMASK(22, 19)
+#define MSI_INDEX_MASK		GENMASK(18, 16)
+#define MSI_INTR_MASK		GENMASK(19, 16)
+
+#define MSInRx_HWIRQ_MASK	GENMASK(6, 4)
+#define DATA_HWIRQ_MASK		GENMASK(3, 0)
 
 struct xgene_msi {
 	struct irq_domain	*inner_domain;
@@ -37,8 +46,26 @@ struct xgene_msi {
 static struct xgene_msi *xgene_msi_ctrl;
 
 /*
- * X-Gene v1 has 16 groups of MSI termination registers MSInIRx, where
- * n is group number (0..F), x is index of registers in each group (0..7)
+ * X-Gene v1 has 16 frames of MSI termination registers MSInIRx, where n is
+ * frame number (0..15), x is index of registers in each frame (0..7).  Each
+ * 32b register is at the beginning of a 64kB region, each frame occupying
+ * 512kB (and the whole thing 8MB of PA space).
+ *
+ * Each register supports 16 MSI vectors (0..15) to generate interrupts. A
+ * write to the MSInIRx from the PCI side generates an interrupt. A read
+ * from the MSInRx on the CPU side returns a bitmap of the pending MSIs in
+ * the lower 16 bits. A side effect of this read is that all pending
+ * interrupts are acknowledged and cleared).
+ *
+ * Additionally, each MSI termination frame has 1 MSIINTn register (n is
+ * 0..15) to indicate the MSI pending status caused by any of its 8
+ * termination registers, reported as a bitmap in the lower 8 bits. Each 32b
+ * register is at the beginning of a 64kB region (and overall occupying an
+ * extra 1MB).
+ *
+ * There is one GIC IRQ assigned for each MSI termination frame, 16 in
+ * total.
+ *
  * The register layout is as follows:
  * MSI0IR0			base_addr
  * MSI0IR1			base_addr +  0x10000
@@ -59,107 +86,74 @@ static struct xgene_msi *xgene_msi_ctrl;
  * MSIINT1			base_addr + 0x810000
  * ...				...
  * MSIINTF			base_addr + 0x8F0000
- *
- * Each index register supports 16 MSI vectors (0..15) to generate interrupt.
- * There are total 16 GIC IRQs assigned for these 16 groups of MSI termination
- * registers.
- *
- * Each MSI termination group has 1 MSIINTn register (n is 0..15) to indicate
- * the MSI pending status caused by 1 of its 8 index registers.
  */
 
 /* MSInIRx read helper */
-static u32 xgene_msi_ir_read(struct xgene_msi *msi,
-				    u32 msi_grp, u32 msir_idx)
+static u32 xgene_msi_ir_read(struct xgene_msi *msi, u32 msi_grp, u32 msir_idx)
 {
 	return readl_relaxed(msi->msi_regs + MSI_IR0 +
-			      (msi_grp << 19) + (msir_idx << 16));
+			     (FIELD_PREP(MSI_GROUP_MASK, msi_grp) |
+			      FIELD_PREP(MSI_INDEX_MASK, msir_idx)));
 }
 
 /* MSIINTn read helper */
 static u32 xgene_msi_int_read(struct xgene_msi *msi, u32 msi_grp)
 {
-	return readl_relaxed(msi->msi_regs + MSI_INT0 + (msi_grp << 16));
+	return readl_relaxed(msi->msi_regs + MSI_INT0 +
+			     FIELD_PREP(MSI_INTR_MASK, msi_grp));
 }
 
 /*
- * With 2048 MSI vectors supported, the MSI message can be constructed using
- * following scheme:
- * - Divide into 8 256-vector groups
- *		Group 0: 0-255
- *		Group 1: 256-511
- *		Group 2: 512-767
- *		...
- *		Group 7: 1792-2047
- * - Each 256-vector group is divided into 16 16-vector groups
- *	As an example: 16 16-vector groups for 256-vector group 0-255 is
- *		Group 0: 0-15
- *		Group 1: 16-32
- *		...
- *		Group 15: 240-255
- * - The termination address of MSI vector in 256-vector group n and 16-vector
- *   group x is the address of MSIxIRn
- * - The data for MSI vector in 16-vector group x is x
+ * In order to allow an MSI to be moved from one CPU to another without
+ * having to repaint both the address and the data (which cannot be done
+ * atomically), we statically partitions the MSI frames between CPUs. Given
+ * that XGene-1 has 8 CPUs, each CPU gets two frames assigned to it
+ *
+ * We adopt the convention that when an MSI is moved, it is configured to
+ * target the same register number in the congruent frame assigned to the
+ * new target CPU. This reserves a given MSI across all CPUs, and reduces
+ * the MSI capacity from 2048 to 256.
+ *
+ * Effectively, this amounts to:
+ * - hwirq[7]::cpu[2:0] is the target frame number (n in MSInIRx)
+ * - hwirq[6:4] is the register index in any given frame (x in MSInIRx)
+ * - hwirq[3:0] is the MSI data
  */
-static u32 hwirq_to_reg_set(unsigned long hwirq)
+static irq_hw_number_t compute_hwirq(u8 frame, u8 index, u8 data)
 {
-	return (hwirq / (NR_HW_IRQS * IRQS_PER_IDX));
-}
-
-static u32 hwirq_to_group(unsigned long hwirq)
-{
-	return (hwirq % NR_HW_IRQS);
-}
-
-static u32 hwirq_to_msi_data(unsigned long hwirq)
-{
-	return ((hwirq / NR_HW_IRQS) % IRQS_PER_IDX);
+	return (FIELD_PREP(BIT(7), FIELD_GET(BIT(3), frame))	|
+		FIELD_PREP(MSInRx_HWIRQ_MASK, index)		|
+		FIELD_PREP(DATA_HWIRQ_MASK, data));
 }
 
 static void xgene_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	struct xgene_msi *msi = irq_data_get_irq_chip_data(data);
-	u32 reg_set = hwirq_to_reg_set(data->hwirq);
-	u32 group = hwirq_to_group(data->hwirq);
-	u64 target_addr = msi->msi_addr + (((8 * group) + reg_set) << 16);
+	u64 target_addr;
+	u32 frame, msir;
+	int cpu;
 
-	msg->address_hi = upper_32_bits(target_addr);
-	msg->address_lo = lower_32_bits(target_addr);
-	msg->data = hwirq_to_msi_data(data->hwirq);
-}
+	cpu	= cpumask_first(irq_data_get_effective_affinity_mask(data));
+	msir	= FIELD_GET(GENMASK(6, 4), data->hwirq);
+	frame	= FIELD_PREP(BIT(3), FIELD_GET(BIT(7), data->hwirq)) | cpu;
 
-/*
- * X-Gene v1 only has 16 MSI GIC IRQs for 2048 MSI vectors.  To maintain
- * the expected behaviour of .set_affinity for each MSI interrupt, the 16
- * MSI GIC IRQs are statically allocated to 8 X-Gene v1 cores (2 GIC IRQs
- * for each core).  The MSI vector is moved from 1 MSI GIC IRQ to another
- * MSI GIC IRQ to steer its MSI interrupt to correct X-Gene v1 core.  As a
- * consequence, the total MSI vectors that X-Gene v1 supports will be
- * reduced to 256 (2048/8) vectors.
- */
-static int hwirq_to_cpu(unsigned long hwirq)
-{
-	return (hwirq % num_possible_cpus());
-}
+	target_addr = msi->msi_addr;
+	target_addr += (FIELD_PREP(MSI_GROUP_MASK, frame) |
+			FIELD_PREP(MSI_INTR_MASK, msir));
 
-static unsigned long hwirq_to_canonical_hwirq(unsigned long hwirq)
-{
-	return (hwirq - hwirq_to_cpu(hwirq));
+	msg->address_hi = upper_32_bits(target_addr);
+	msg->address_lo = lower_32_bits(target_addr);
+	msg->data = FIELD_GET(DATA_HWIRQ_MASK, data->hwirq);
 }
 
 static int xgene_msi_set_affinity(struct irq_data *irqdata,
 				  const struct cpumask *mask, bool force)
 {
 	int target_cpu = cpumask_first(mask);
-	int curr_cpu;
-
-	curr_cpu = hwirq_to_cpu(irqdata->hwirq);
-	if (curr_cpu == target_cpu)
-		return IRQ_SET_MASK_OK_DONE;
 
-	/* Update MSI number to target the new CPU */
-	irqdata->hwirq = hwirq_to_canonical_hwirq(irqdata->hwirq) + target_cpu;
+	irq_data_update_effective_affinity(irqdata, cpumask_of(target_cpu));
 
+	/* Force the core code to regenerate the message */
 	return IRQ_SET_MASK_OK;
 }
 
@@ -173,23 +167,20 @@ static int xgene_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
 	struct xgene_msi *msi = domain->host_data;
-	int msi_irq;
+	irq_hw_number_t hwirq;
 
 	mutex_lock(&msi->bitmap_lock);
 
-	msi_irq = bitmap_find_next_zero_area(msi->bitmap, NR_MSI_VEC, 0,
-					     num_possible_cpus(), 0);
-	if (msi_irq < NR_MSI_VEC)
-		bitmap_set(msi->bitmap, msi_irq, num_possible_cpus());
-	else
-		msi_irq = -ENOSPC;
+	hwirq = find_first_zero_bit(msi->bitmap, NR_MSI_VEC);
+	if (hwirq < NR_MSI_VEC)
+		set_bit(hwirq, msi->bitmap);
 
 	mutex_unlock(&msi->bitmap_lock);
 
-	if (msi_irq < 0)
-		return msi_irq;
+	if (hwirq >= NR_MSI_VEC)
+		return -ENOSPC;
 
-	irq_domain_set_info(domain, virq, msi_irq,
+	irq_domain_set_info(domain, virq, hwirq,
 			    &xgene_msi_bottom_irq_chip, domain->host_data,
 			    handle_simple_irq, NULL, NULL);
 
@@ -201,12 +192,10 @@ static void xgene_irq_domain_free(struct irq_domain *domain,
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
 	struct xgene_msi *msi = irq_data_get_irq_chip_data(d);
-	u32 hwirq;
 
 	mutex_lock(&msi->bitmap_lock);
 
-	hwirq = hwirq_to_canonical_hwirq(d->hwirq);
-	bitmap_clear(msi->bitmap, hwirq, num_possible_cpus());
+	clear_bit(d->hwirq, msi->bitmap);
 
 	mutex_unlock(&msi->bitmap_lock);
 
@@ -263,55 +252,30 @@ static void xgene_msi_isr(struct irq_desc *desc)
 	unsigned int *irqp = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct xgene_msi *xgene_msi = xgene_msi_ctrl;
-	int msir_index, msir_val, hw_irq, ret;
-	u32 intr_index, grp_select, msi_grp;
+	unsigned long grp_pending;
+	int msir_idx;
+	u32 msi_grp;
 
 	chained_irq_enter(chip, desc);
 
 	msi_grp = irqp - xgene_msi->gic_irq;
 
-	/*
-	 * MSIINTn (n is 0..F) indicates if there is a pending MSI interrupt
-	 * If bit x of this register is set (x is 0..7), one or more interrupts
-	 * corresponding to MSInIRx is set.
-	 */
-	grp_select = xgene_msi_int_read(xgene_msi, msi_grp);
-	while (grp_select) {
-		msir_index = ffs(grp_select) - 1;
-		/*
-		 * Calculate MSInIRx address to read to check for interrupts
-		 * (refer to termination address and data assignment
-		 * described in xgene_compose_msi_msg() )
-		 */
-		msir_val = xgene_msi_ir_read(xgene_msi, msi_grp, msir_index);
-		while (msir_val) {
-			intr_index = ffs(msir_val) - 1;
-			/*
-			 * Calculate MSI vector number (refer to the termination
-			 * address and data assignment described in
-			 * xgene_compose_msi_msg function)
-			 */
-			hw_irq = (((msir_index * IRQS_PER_IDX) + intr_index) *
-				 NR_HW_IRQS) + msi_grp;
-			/*
-			 * As we have multiple hw_irq that maps to single MSI,
-			 * always look up the virq using the hw_irq as seen from
-			 * CPU0
-			 */
-			hw_irq = hwirq_to_canonical_hwirq(hw_irq);
-			ret = generic_handle_domain_irq(xgene_msi->inner_domain, hw_irq);
+	grp_pending = xgene_msi_int_read(xgene_msi, msi_grp);
+
+	for_each_set_bit(msir_idx, &grp_pending, IDX_PER_GROUP) {
+		unsigned long msir;
+		int intr_idx;
+
+		msir = xgene_msi_ir_read(xgene_msi, msi_grp, msir_idx);
+
+		for_each_set_bit(intr_idx, &msir, IRQS_PER_IDX) {
+			irq_hw_number_t hwirq;
+			int ret;
+
+			hwirq = compute_hwirq(msi_grp, msir_idx, intr_idx);
+			ret = generic_handle_domain_irq(xgene_msi->inner_domain,
+							hwirq);
 			WARN_ON_ONCE(ret);
-			msir_val &= ~(1 << intr_index);
-		}
-		grp_select &= ~(1 << msir_index);
-
-		if (!grp_select) {
-			/*
-			 * We handled all interrupts happened in this group,
-			 * resample this group MSI_INTx register in case
-			 * something else has been made pending in the meantime
-			 */
-			grp_select = xgene_msi_int_read(xgene_msi, msi_grp);
 		}
 	}
 
-- 
2.39.2


