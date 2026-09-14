Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpXjGjKzS5u4UHvfHFGhS/kORy+pBnZO6VF0NPuIiKo=; b=LqtSOM94v+sFieI2M0YeukSl9r
	5Byd7efEqd5PEBeape+pB210wwA3gNAxIo3lgEPLfu7L/xx6KzVVX45pnThjUmnrwK4hpAV6LQKTq
	qgUvAhBq0beb5DVsLJtsOAUGqbhfJP4VRaS5qjMfZxEPlJkHvdN+sSZKLhDrj6A3m+FkDmPsmz2Pu
	oyl7pb64P3IoJqz9Ql0GK0G4vBJaFJcG+jXlUbk5CxOhpSKnpKTMpDLt8tY0XMhol9FkksRjjDO0X
	BbgFLBe3ETPPptxksXw4URGxxy3/EsPXcbvgrGMBxuWr9jN/7FcbA8JoVwaQ+QT0NQlSPEbeDaxta
	b61VEJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63qq-000000037lE-0O2f;
	Mon, 14 Sep 2026 10:23:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pS-0000000362v-0moK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 10:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HpXjGjKzS5u4UHvfHFGhS/kORy+pBnZO6VF0NPuIiKo=; b=pcQV1wxyFehny7YtuLaWVF7RKg
	QkJ0uDZqrFrRAFGN9z8goy0EYPsnvjKpcFeMy4y0orupqOQmzkGQsoF6hWQG3/bNa4fAL9ABnpsf4
	CgHKqpFeY2iSqdUiCHlItcvwmJD7BKeTIT33mqPqWRKEJQppgyxWCKbRemLKSURbl1lvH3QBsGLcE
	XWioDAHaxRa6ULIeboPD4pfBH4mvfVNhdwDbHL1XcL2EhDn29LcMqZfxWghNZIf41kddV7Vs81sK6
	0C8Ueo3zjwk1M0xfskXBtRYCzucbKqnBfXjEl1Sp+OB7pUi1W896QYFQANt5RgLMeZrCXkdKHpDC5
	BvW5N7Iw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63pO-00000005U9U-3uXC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6B41576;
	Mon, 14 Sep 2026 03:22:18 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 338E43F7B4;
	Mon, 14 Sep 2026 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381342; bh=u3agxvLiSzmVtQH+vSg343pDzKP8IwsFeftR2j4Sd4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PPuzLpI6ShKiNAitsA4VoO/1TngikxOLlm+Zv+fXQZRmfee97aEoB8O/TyDLRozeY
	 ySTyeO+Ws0MQsso7Nw+O1uGJUq+9NIR8hUgYhL/QNlm5/IuXpuK/sVTA5p02//mWLv
	 oTdRCQMcSqbWlHaDPu0PNDywtzM2bWT8qJ91JWx8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 38/38] irqchip/gic-v5: Add NMI support
Date: Mon, 14 Sep 2026 11:21:02 +0100
Message-Id: <20260914102102.68597-39-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_112223_351637_1E0C0F3A 
X-CRM114-Status: GOOD (  18.67  )
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

Implement NMI support for PPIs, SPIs, LPIs and IPIs by toggling their
priority between the superpriority and regular interrupt levels.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/irqchip/irq-gic-v5.c | 244 +++++++++++++++++++++++++++++++++--
 1 file changed, 234 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 5f2551cf077d..7e7d313e77bc 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -22,6 +22,7 @@
 static u8 pri_bits __ro_after_init = 5;
 
 #define GICV5_IRQ_PRI_MASK	0x1f
+#define GICV5_IRQ_PRI_NMI	0
 #define GICV5_IRQ_PRI_MI	(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))
 
 #define PPI_NR	128
@@ -97,6 +98,56 @@ static void gicv5_hwirq_init(irq_hw_number_t hwirq, u8 priority, u8 hwirq_type)
 	}
 }
 
+static void gicv5_ppi_irq_set_priority(struct irq_data *d, u8 priority)
+{
+	u64 hwirq_id_offset = d->hwirq / 8;
+	u64 hwirq_id_index = d->hwirq % 8;
+	u64 hwirq_id_clear = (u64)GICV5_IRQ_PRI_MASK << (hwirq_id_index * 8);
+	u64 hwirq_id_set = (u64)priority << (hwirq_id_index * 8);
+
+#define SET_ICC_PPI_PRIORITYRn_EL1(cnt)	\
+	case cnt: sysreg_clear_set_s(SYS_ICC_PPI_PRIORITYR ## cnt ## _EL1, hwirq_id_clear, hwirq_id_set); break
+
+	switch (hwirq_id_offset) {
+	SET_ICC_PPI_PRIORITYRn_EL1(0);
+	SET_ICC_PPI_PRIORITYRn_EL1(1);
+	SET_ICC_PPI_PRIORITYRn_EL1(2);
+	SET_ICC_PPI_PRIORITYRn_EL1(3);
+	SET_ICC_PPI_PRIORITYRn_EL1(4);
+	SET_ICC_PPI_PRIORITYRn_EL1(5);
+	SET_ICC_PPI_PRIORITYRn_EL1(6);
+	SET_ICC_PPI_PRIORITYRn_EL1(7);
+	SET_ICC_PPI_PRIORITYRn_EL1(8);
+	SET_ICC_PPI_PRIORITYRn_EL1(9);
+	SET_ICC_PPI_PRIORITYRn_EL1(10);
+	SET_ICC_PPI_PRIORITYRn_EL1(11);
+	SET_ICC_PPI_PRIORITYRn_EL1(12);
+	SET_ICC_PPI_PRIORITYRn_EL1(13);
+	SET_ICC_PPI_PRIORITYRn_EL1(14);
+	SET_ICC_PPI_PRIORITYRn_EL1(15);
+#undef SET_ICC_PPI_PRIORITYRn_EL1
+	default:
+		WARN_ON(1);
+	}
+	/*
+	 * Context syncronization required to make sure system register writes
+	 * effects are synchronised.
+	 */
+	isb();
+}
+
+static void gicv5_hwirq_set_priority(irq_hw_number_t hwirq, u8 priority, u8 hwirq_type) {
+	u64 cdpri;
+
+	cdpri = FIELD_PREP(GICV5_GIC_CDPRI_PRIORITY_MASK, priority)	|
+		FIELD_PREP(GICV5_GIC_CDPRI_TYPE_MASK, hwirq_type)	|
+		FIELD_PREP(GICV5_GIC_CDPRI_ID_MASK, hwirq);
+
+	gic_insn(cdpri, CDPRI);
+
+	return;
+}
+
 static void gicv5_ppi_irq_mask(struct irq_data *d)
 {
 	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
@@ -512,7 +563,152 @@ static int gicv5_ppi_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu)
 	return 0;
 }
 
-static const struct irq_chip gicv5_ppi_irq_chip = {
+static int gicv5_hwirq_peek_irq(irq_hw_number_t hwirq, u8 hwirq_type)
+{
+	u64 icsr, cdrcfg;
+
+	cdrcfg = hwirq | FIELD_PREP(GICV5_GIC_CDRCFG_TYPE_MASK, hwirq_type);
+
+	gic_insn(cdrcfg, CDRCFG);
+	isb();
+	icsr = read_sysreg_s(SYS_ICC_ICSR_EL1);
+
+	if (FIELD_GET(ICC_ICSR_EL1_F, icsr)) {
+		pr_err("ICSR_EL1 is invalid\n");
+		return -EINVAL;
+	}
+
+	return !!(FIELD_GET(ICC_ICSR_EL1_Enabled, icsr));
+
+}
+
+static int gicv5_ppi_irq_nmi_setup(struct irq_data *d)
+{
+	unsigned long hwirq_id_bit = d->hwirq % 64;
+	unsigned long enable;
+
+	if (!system_uses_nmi())
+		return -EINVAL;
+
+	if (d->hwirq < 64)
+		enable = read_sysreg_s(SYS_ICC_PPI_ENABLER0_EL1);
+	else
+		enable = read_sysreg_s(SYS_ICC_PPI_ENABLER1_EL1);
+
+	if (test_bit(hwirq_id_bit, &enable))
+		return -EINVAL;
+
+	gicv5_ppi_irq_set_priority(d, GICV5_IRQ_PRI_NMI);
+
+	return 0;
+}
+
+static void gicv5_ppi_irq_nmi_teardown(struct irq_data *d)
+{
+	unsigned long hwirq_id_bit = d->hwirq % 64;
+	unsigned long enable;
+
+	if (WARN_ON(!system_uses_nmi()))
+		return;
+
+	if (d->hwirq < 64)
+		enable = read_sysreg_s(SYS_ICC_PPI_ENABLER0_EL1);
+	else
+		enable = read_sysreg_s(SYS_ICC_PPI_ENABLER1_EL1);
+
+	if (test_bit(hwirq_id_bit, &enable))
+		return;
+
+	gicv5_ppi_irq_set_priority(d, GICV5_IRQ_PRI_MI);
+
+	return;
+}
+
+static int gicv5_hwirq_irq_nmi_setup(irq_hw_number_t hwirq, u8 hwirq_type)
+{
+	if (!system_uses_nmi())
+		return -EINVAL;
+
+	if (WARN_ON(hwirq_type != GICV5_HWIRQ_TYPE_LPI && hwirq_type != GICV5_HWIRQ_TYPE_SPI))
+		return -EINVAL;
+
+	if (gicv5_hwirq_peek_irq(hwirq, hwirq_type))
+		return -EINVAL;
+
+	gicv5_hwirq_set_priority(hwirq, GICV5_IRQ_PRI_NMI, hwirq_type);
+
+	return 0;
+}
+
+static void gicv5_hwirq_irq_nmi_teardown(irq_hw_number_t hwirq, u8 hwirq_type)
+{
+	if (WARN_ON(!system_uses_nmi()))
+		return;
+
+	if (WARN_ON(hwirq_type != GICV5_HWIRQ_TYPE_LPI && hwirq_type != GICV5_HWIRQ_TYPE_SPI))
+		return;
+
+	if (gicv5_hwirq_peek_irq(hwirq, hwirq_type))
+		return;
+
+	gicv5_hwirq_set_priority(hwirq, GICV5_IRQ_PRI_MI, hwirq_type);
+
+	return;
+}
+
+static int gicv5_lpi_irq_nmi_setup(struct irq_data *d)
+{
+	int ret = gicv5_hwirq_irq_nmi_setup(d->hwirq, GICV5_HWIRQ_TYPE_LPI);
+
+	if (!ret)
+		irq_to_desc(d->irq)->handle_irq = handle_fasteoi_nmi;
+
+	return ret;
+}
+
+static void gicv5_lpi_irq_nmi_teardown(struct irq_data *d)
+{
+	gicv5_hwirq_irq_nmi_teardown(d->hwirq, GICV5_HWIRQ_TYPE_LPI);
+	irq_to_desc(d->irq)->handle_irq = handle_fasteoi_irq;
+}
+
+static int gicv5_spi_irq_nmi_setup(struct irq_data *d)
+{
+	int ret = gicv5_hwirq_irq_nmi_setup(d->hwirq, GICV5_HWIRQ_TYPE_SPI);
+
+	if (!ret)
+		irq_to_desc(d->irq)->handle_irq = handle_fasteoi_nmi;
+
+	return ret;
+}
+
+static void gicv5_spi_irq_nmi_teardown(struct irq_data *d)
+{
+	gicv5_hwirq_irq_nmi_teardown(d->hwirq, GICV5_HWIRQ_TYPE_SPI);
+	irq_to_desc(d->irq)->handle_irq = handle_fasteoi_irq;
+}
+
+static int gicv5_ipi_irq_nmi_setup(struct irq_data *d)
+{
+	if (WARN_ON(!d->parent_data))
+		return -EINVAL;
+
+	d = d->parent_data;
+
+	return gicv5_hwirq_irq_nmi_setup(d->hwirq, GICV5_HWIRQ_TYPE_LPI);
+}
+
+static void gicv5_ipi_irq_nmi_teardown(struct irq_data *d)
+{
+	if (WARN_ON(!d->parent_data))
+		return;
+
+	d = d->parent_data;
+
+	gicv5_hwirq_irq_nmi_teardown(d->hwirq, GICV5_HWIRQ_TYPE_LPI);
+}
+
+static struct irq_chip gicv5_ppi_irq_chip __ro_after_init = {
 	.name			= "GICv5-PPI",
 	.irq_mask		= gicv5_ppi_irq_mask,
 	.irq_unmask		= gicv5_ppi_irq_unmask,
@@ -521,11 +717,13 @@ static const struct irq_chip gicv5_ppi_irq_chip = {
 	.irq_get_irqchip_state	= gicv5_ppi_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gicv5_ppi_irq_set_irqchip_state,
 	.irq_set_vcpu_affinity	= gicv5_ppi_irq_set_vcpu_affinity,
+	.irq_nmi_setup		= gicv5_ppi_irq_nmi_setup,
+	.irq_nmi_teardown	= gicv5_ppi_irq_nmi_teardown,
 	.flags			= IRQCHIP_SKIP_SET_WAKE	  |
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
-static const struct irq_chip gicv5_spi_irq_chip = {
+static struct irq_chip gicv5_spi_irq_chip __ro_after_init = {
 	.name			= "GICv5-SPI",
 	.irq_mask		= gicv5_spi_irq_mask,
 	.irq_unmask		= gicv5_spi_irq_unmask,
@@ -535,13 +733,15 @@ static const struct irq_chip gicv5_spi_irq_chip = {
 	.irq_retrigger		= gicv5_spi_irq_retrigger,
 	.irq_get_irqchip_state	= gicv5_spi_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gicv5_spi_irq_set_irqchip_state,
+	.irq_nmi_setup		= gicv5_spi_irq_nmi_setup,
+	.irq_nmi_teardown	= gicv5_spi_irq_nmi_teardown,
 	.flags			= IRQCHIP_SET_TYPE_MASKED |
 				  IRQCHIP_AFFINITY_PRE_STARTUP |
 				  IRQCHIP_SKIP_SET_WAKE	  |
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
-static const struct irq_chip gicv5_lpi_irq_chip = {
+static struct irq_chip gicv5_lpi_irq_chip __ro_after_init = {
 	.name			= "GICv5-LPI",
 	.irq_mask		= gicv5_lpi_irq_mask,
 	.irq_unmask		= gicv5_lpi_irq_unmask,
@@ -550,12 +750,14 @@ static const struct irq_chip gicv5_lpi_irq_chip = {
 	.irq_retrigger		= gicv5_lpi_irq_retrigger,
 	.irq_get_irqchip_state	= gicv5_lpi_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gicv5_lpi_irq_set_irqchip_state,
+	.irq_nmi_setup		= gicv5_lpi_irq_nmi_setup,
+	.irq_nmi_teardown	= gicv5_lpi_irq_nmi_teardown,
 	.flags			= IRQCHIP_AFFINITY_PRE_STARTUP |
 				  IRQCHIP_SKIP_SET_WAKE	  |
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
-static const struct irq_chip gicv5_ipi_irq_chip = {
+static struct irq_chip gicv5_ipi_irq_chip __ro_after_init = {
 	.name			= "GICv5-IPI",
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
@@ -563,6 +765,8 @@ static const struct irq_chip gicv5_ipi_irq_chip = {
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_nmi_setup		= gicv5_ipi_irq_nmi_setup,
+	.irq_nmi_teardown	= gicv5_ipi_irq_nmi_teardown,
 	.ipi_send_single	= gicv5_ipi_send_single,
 	.flags			= IRQCHIP_SKIP_SET_WAKE	  |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -907,11 +1111,12 @@ static const struct irq_domain_ops gicv5_irq_ipi_domain_ops = {
 	.free	= gicv5_irq_ipi_domain_free,
 };
 
-static void handle_irq_per_domain(u32 hwirq)
+static void handle_irq_per_domain(u32 hwirq, bool is_nmi)
 {
 	u8 hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, hwirq);
 	u32 hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, hwirq);
 	struct irq_domain *domain;
+	int ret;
 
 	switch (hwirq_type) {
 	case GICV5_HWIRQ_TYPE_PPI:
@@ -928,26 +1133,32 @@ static void handle_irq_per_domain(u32 hwirq)
 		return;
 	}
 
-	if (generic_handle_domain_irq(domain, hwirq_id)) {
-		pr_err_once("Could not handle, hwirq = 0x%x", hwirq_id);
+	if (is_nmi)
+		ret = generic_handle_domain_nmi(domain, hwirq_id);
+	else
+		ret = generic_handle_domain_irq(domain, hwirq_id);
+
+	if (ret) {
+		pr_err_once("Could not handle, hwirq = 0x%x (%d)", hwirq_id, ret);
 		gicv5_hwirq_eoi(hwirq_id, hwirq_type);
 	}
 }
 
 static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
 {
+	bool is_nmi = in_nmi();
 	bool valid;
 	u32 hwirq;
 	u64 ia;
 
-	ia = gicr_insn(CDIA);
+	ia = is_nmi ? gicr_insn(CDNMIA) : gicr_insn(CDIA);
 	valid = GICV5_GICR_CDIA_VALID(ia);
 
 	if (!valid)
 		return;
 
 	/*
-	 * Ensure that the CDIA instruction effects (ie IRQ activation) are
+	 * Ensure that the CD{NM}IA instruction effects (ie IRQ activation) are
 	 * completed before handling the interrupt.
 	 */
 	gsb_ack();
@@ -967,7 +1178,7 @@ static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
 
 	hwirq = FIELD_GET(GICV5_HWIRQ_INTID, ia);
 
-	handle_irq_per_domain(hwirq);
+	handle_irq_per_domain(hwirq, is_nmi);
 }
 
 static void gicv5_cpu_disable_interrupts(void)
@@ -1010,6 +1221,17 @@ static int gicv5_starting_cpu(unsigned int cpu)
 	return gicv5_irs_register_cpu(cpu);
 }
 
+static void gicv5_enable_nmi_support(void)
+{
+	if (!system_uses_nmi())
+		return;
+
+	gicv5_ppi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
+	gicv5_spi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
+	gicv5_lpi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
+	gicv5_ipi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
+}
+
 static void __init gicv5_smp_init(void)
 {
 	unsigned int num_ipis = GICV5_IPIS_PER_CPU * nr_cpu_ids;
@@ -1176,6 +1398,8 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 	if (ret)
 		goto out_handle;
 
+	gicv5_enable_nmi_support();
+
 	gicv5_smp_init();
 
 	gicv5_irs_its_probe();
-- 
2.34.1


