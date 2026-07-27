Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC16C54F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Y3F9Brmi+5BLXdm1u9KGrAYXFYS/PrDIX6cjOuHMzY=; b=bxIxAQ++w3ZYP7ndfD1i9BDg3u
	4apxT5fUf/oU17/LVk3IIE8aI4Ex5jYOkGkzQHCvA1YO6GWxWpBpumwIL2balLVjtZn7M5/OJge1K
	Y2QkwYmX/oittnCgcoY7LN9pf3J4n8Rhwh/FMrTdB3ObPQPMlZcm25CgFDn5bWonbsT0xq5QSmajm
	pyMpQbdP9GpYtOyXLSn/FJIwdrh+ybBuTJ4bfG9+9sKc3ss9YVQiKecv+uC35RmMxuj0Rl0exEWuJ
	oKKpCdacZgnZuKteVKT9DsW3ti/Kp7SfJGDnOglOPsrS1M+QpImEqA7uQ9fi/bUM3yX9kxYHNdiy+
	8eP5MAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKt-00000003OVx-12mN;
	Mon, 27 Jul 2026 16:37:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJM-00000003Neb-2l37
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F380B1762;
	Mon, 27 Jul 2026 09:36:11 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 290263F86F;
	Mon, 27 Jul 2026 09:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170176; bh=R68nvfMlm5Pi/Enic0MH9wiPnKttueNcMyDUwdTHdTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epSz8FKqpaYU62q9M3dLr5PHPoApcyTSnivEv13FybmXOJ4gccZ5l6QwdcMCaX9vU
	 pwzkQbA+wULRXJty/4MeOoiisJwLFD4pXIFhhYbjhLgGObhsxEkPOn3sJMf0AT2MZD
	 YXVoO/X9FclVKpQR5Vr79zqts68dKPFEYL59Z9yI=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 45/45] irqchip/gic-v5: Add NMI support for IPIs
Date: Mon, 27 Jul 2026 17:34:53 +0100
Message-Id: <20260727163453.7969-46-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093616_792643_55B7FFCB 
X-CRM114-Status: GOOD (  18.31  )
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

IPIs are implemented as a logical domain on top of the LPI domain.
Therefore, when an IPI is configured as an NMI, update the priority in
the parent LPI domain during setup and teardown.

Permit irq_supports_nmi() to accept IRQs managed by an NMI-capable
parent domain.

Finally, guard handle_irq_event_percpu() against calling
add_interrupt_randomness() from NMI context.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/irqchip/irq-gic-v5.c | 23 ++++++++++++++++++++++-
 kernel/irq/handle.c          |  3 ++-
 kernel/irq/manage.c          | 11 ++++++++---
 3 files changed, 32 insertions(+), 5 deletions(-)

The patch should definitely be split. The only reason I'm keeping it
as a single patch for now is that I'm not yet sure these changes are
moving in the right direction...


diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 05b957ffc0b8..787cb8da4e1a 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -700,6 +700,24 @@ static void gicv5_spi_irq_nmi_teardown(struct irq_data *d)
 	irq_to_desc(d->irq)->handle_irq = handle_fasteoi_irq;
 }
 
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
 }
 
 static struct irq_chip gicv5_ppi_irq_chip = {
@@ -749,7 +767,7 @@ static struct irq_chip gicv5_lpi_irq_chip = {
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
-static const struct irq_chip gicv5_ipi_irq_chip = {
+static struct irq_chip gicv5_ipi_irq_chip = {
 	.name			= "GICv5-IPI",
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
@@ -757,6 +775,8 @@ static const struct irq_chip gicv5_ipi_irq_chip = {
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_nmi_setup		= gicv5_ipi_irq_nmi_setup,
+	.irq_nmi_teardown	= gicv5_ipi_irq_nmi_teardown,
 	.ipi_send_single	= gicv5_ipi_send_single,
 	.flags			= IRQCHIP_SKIP_SET_WAKE	  |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -1213,6 +1233,7 @@ static void gicv5_enable_nmi_support(void)
 	gicv5_ppi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
 	gicv5_spi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
 	gicv5_lpi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
+	gicv5_ipi_irq_chip.flags |= IRQCHIP_SUPPORTS_NMI;
 }
 
 static void __init gicv5_smp_init(void)
diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index b7d52821837b..114fd63b0210 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -245,7 +245,8 @@ irqreturn_t handle_irq_event_percpu(struct irq_desc *desc)
 
 	retval = __handle_irq_event_percpu(desc);
 
-	add_interrupt_randomness(desc->irq_data.irq);
+	if (!in_nmi())
+		add_interrupt_randomness(desc->irq_data.irq);
 
 	if (!irq_settings_no_debug(desc))
 		note_interrupt(desc, retval);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 7eb07e3bdb4c..0091bb5f7662 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1370,9 +1370,14 @@ static bool irq_supports_nmi(struct irq_desc *desc)
 	struct irq_data *d = irq_desc_get_irq_data(desc);
 
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
-	/* Only IRQs directly managed by the root irqchip can be set as NMI */
-	if (d->parent_data)
-		return false;
+	struct irq_data *data;
+	/*
+	 * Only IRQs directly managed by the root irqchip can be set
+	 * as NMI unless we inherit NMI from parent
+	 */
+	for (data = d->parent_data; data; data = data->parent_data)
+		if (!(data->chip && data->chip->flags & IRQCHIP_SUPPORTS_NMI))
+			return false;
 #endif
 	/* Don't support NMIs for chips behind a slow bus */
 	if (d->chip->irq_bus_lock || d->chip->irq_bus_sync_unlock)
-- 
2.34.1


