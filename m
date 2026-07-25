Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863C5C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IiNtmWYJW446SPJyf+xgqsSdYCMWqkfS/q3fFk7oyFw=; b=rEPseZbFJjZWi5gJv2YoLfuUJ5
	M+GlA9vLGyzKwy2+Al9L57wN/f+buQWhxnOsQJGXq6GjJCVyLq/jxmEpnHjP2FRgrh5eYhDI0bkxm
	AGY0NMW0OyCjyb4TTOq+uNAC7kKhceAoyQmV56uw0B+HL9vrltQh77bg1BAEfcJEUKFtMkpl6wDuf
	ubC3IrB3JJaWXPr9Vuj9qWtvyL+Ho/ekpNUW35qlcfffTJb4ZbepOXQ4M7p8VVZou3swYJ5n1JqDX
	Qt0V4tJ3cfFZgr5pm697JgO9iqI1numEm6Z5hdNGZimhi+KIsx4MRSl9IJdQxMxW7kweoRcYuH1n+
	LQciP7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnele-00000000VGv-23rV;
	Sat, 25 Jul 2026 15:58:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneld-00000000VGn-06h1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 15:58:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C09D600E1;
	Sat, 25 Jul 2026 15:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73241F000E9;
	Sat, 25 Jul 2026 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784995103;
	bh=IiNtmWYJW446SPJyf+xgqsSdYCMWqkfS/q3fFk7oyFw=;
	h=From:To:Cc:Subject:Date;
	b=OmSbmk6fvNuqPT/guspJreLbD/0cpAzorEH7iUDBCviKEbObeD0vw0gAQ+fL9Tkyb
	 DSBb4E/Xs6HZZX3UOebC67r9YkaHXf7iowzUmp93w/JDPbvY6mq6wCCpGJqCqesWJR
	 k7kc38UZgOdXB4rXnWflqJ8zTezY0ykAxto3h7PX+0eCAxH5X4nlZ9/P0vXP7xLlHy
	 W9sm9qMLA6i2FilA4F0SoJZea3jPDcWayg7U0o7CRJD0CINdBjljnvaDjIZAmYsrxF
	 59dT3TFYe3VWXeNUAF5keCH7NWzLV72HEZvjaBBzR4pI++PWNg2UlwSyB3Uu8v4P+T
	 NCP+AQyBYajKw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=lobster-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wnelZ-00000008n7A-3ghe;
	Sat, 25 Jul 2026 15:58:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	radu@rendec.net,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH] irqchip/gic: Simplify Maintenance Interrupt ACPI parsing
Date: Sat, 25 Jul 2026 16:59:41 +0100
Message-ID: <20260725155941.114322-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@kernel.org, radu@rendec.net, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The ACPI spec describes the vgic Maintenance Interrupt with attributes
indicating whether the signalling is Level or Edge. While this
superficially looks like a sensible thing to do, it doesn't actually
make much sense.

By construction, this interrupt is Level, and cannot be anything
else, as the hypervisor actively needs to interact with the vgic
for the level to drop. This indicates a state, and not an event.

Get rid of this nonsense, always register the corresponding GSI as
Level, and let the user know that they run on quality FW should
the interrupt be advertised as Edge.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3.c | 10 +++-------
 drivers/irqchip/irq-gic.c    |  8 ++++----
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 99444a1b2ffa2..22ecd28a491a8 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2279,7 +2279,6 @@ static struct
 	bool single_redist;
 	int enabled_rdists;
 	u32 maint_irq;
-	int maint_irq_mode;
 	phys_addr_t vcpu_base;
 } acpi_data __initdata;
 
@@ -2457,21 +2456,19 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
 {
 	struct acpi_madt_generic_interrupt *gicc =
 		(struct acpi_madt_generic_interrupt *)header;
-	int maint_irq_mode;
 	static int first_madt = true;
 
 	if (!(gicc->flags &
 	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
 
-	maint_irq_mode = (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
-		ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
+	if (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE)
+		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
 
 	if (first_madt) {
 		first_madt = false;
 
 		acpi_data.maint_irq = gicc->vgic_interrupt;
-		acpi_data.maint_irq_mode = maint_irq_mode;
 		acpi_data.vcpu_base = gicc->gicv_base_address;
 
 		return 0;
@@ -2481,7 +2478,6 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
 	 * The maintenance interrupt and GICV should be the same for every CPU
 	 */
 	if ((acpi_data.maint_irq != gicc->vgic_interrupt) ||
-	    (acpi_data.maint_irq_mode != maint_irq_mode) ||
 	    (acpi_data.vcpu_base != gicc->gicv_base_address))
 		return -EINVAL;
 
@@ -2514,7 +2510,7 @@ static void __init gic_acpi_setup_kvm_info(void)
 	gic_v3_kvm_info.type = GIC_V3;
 
 	irq = acpi_register_gsi(NULL, acpi_data.maint_irq,
-				acpi_data.maint_irq_mode,
+				ACPI_LEVEL_SENSITIVE,
 				ACPI_ACTIVE_HIGH);
 	if (irq <= 0)
 		return;
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index ec70c84e9f91d..74bda5e246345 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1527,7 +1527,6 @@ static struct
 {
 	phys_addr_t cpu_phys_base;
 	u32 maint_irq;
-	int maint_irq_mode;
 	phys_addr_t vctrl_base;
 	phys_addr_t vcpu_base;
 } acpi_data __initdata;
@@ -1553,10 +1552,11 @@ gic_acpi_parse_madt_cpu(union acpi_subtable_headers *header,
 	if (cpu_base_assigned && gic_cpu_base != acpi_data.cpu_phys_base)
 		return -EINVAL;
 
+	if (processor->flags & ACPI_MADT_VGIC_IRQ_MODE)
+		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
+
 	acpi_data.cpu_phys_base = gic_cpu_base;
 	acpi_data.maint_irq = processor->vgic_interrupt;
-	acpi_data.maint_irq_mode = (processor->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
-				    ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
 	acpi_data.vctrl_base = processor->gich_base_address;
 	acpi_data.vcpu_base = processor->gicv_base_address;
 
@@ -1616,7 +1616,7 @@ static void __init gic_acpi_setup_kvm_info(void)
 	vcpu_res->end = vcpu_res->start + ACPI_GICV2_VCPU_MEM_SIZE - 1;
 
 	irq = acpi_register_gsi(NULL, acpi_data.maint_irq,
-				acpi_data.maint_irq_mode,
+				ACPI_LEVEL_SENSITIVE,
 				ACPI_ACTIVE_HIGH);
 	if (irq <= 0)
 		return;
-- 
2.47.3


