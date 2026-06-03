Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC75CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+5k6g5V08oIf0zyIc0HtMgKRyoeGZij4UaZCAbhjl4=; b=lUpQhbI6SUxdSpOcYDuWSswyJw
	urv0WzpJd91JFz27tkf7iCdBqsC/OwVQTi5T4fMYW8E/aWJ7dAbLsI+qbWiNrbT/ZH1rKy/nNu8tm
	6Op5dnLH4oKj61OweTnfaeE4fLMNc+wYo8iHrDDzEKOIaKeWU2EpRc2Zbq+/Q1j3TFlUuEJLPFSKB
	b0uOVFd7KtuExtIwVW07/tRToCpJ84FEqTQHJqxjRm29Ip7Lq8MkYFzSacCMK8LnJW3KGyOslSteY
	rTpgamwnmlDwsfq6W43bDRqZhhnvQS8NCw5EGTzyoO6qvmY3GpIpcJQxq2t6eqDlJmvNJYc5weDkr
	xwO65Jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgrS-0000000EZoZ-4BNv;
	Wed, 03 Jun 2026 08:22:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgrO-0000000EZis-1P2c;
	Wed, 03 Jun 2026 08:22:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 866F8419C2;
	Wed,  3 Jun 2026 08:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C5A1F00899;
	Wed,  3 Jun 2026 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474917;
	bh=m+5k6g5V08oIf0zyIc0HtMgKRyoeGZij4UaZCAbhjl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gm3Yv3ZaferZ76474cGhOraU0cQUJRTFq09a7OoW6Gnr0QvP0dbYge9HrxDMwy0rU
	 Vsq3FQq7GzRlxIryPMbchjYGIFZVJGbh5zyv5uqQiFcVY2oZ7k1UJABr6LK2RzMS3u
	 n0erUHnhlqTg0SAYlGwh5uaMO9W+LaFvVakEYwoSolQDR4pZLfVX7+TIDB2eI575lK
	 QJJ6XxodqXXEKPYYrZ/tjrffvZoZZcJCfBCT82eHtakWjrkfXKMNpxo0bRY3RhRXFP
	 ADo2IgymnLL2GlTzDAjtinN5uN8tvDiLppx9P7Iu0N7HTgUPdbT2c84Cw5wyIx71/c
	 fr1kKInZ6bjSA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 03 Jun 2026 10:21:02 +0200
Subject: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012158_422208_72058949 
X-CRM114-Status: GOOD (  14.41  )
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

Register an ACPI hook in the ACPI interrupt management code for GICv5 to
retrieve the ACPI interrupt controller handle (if any) of the controller
handling a specific GSI, by updating the acpi_set_irq_model() call with
the gic_v5_get_gsi_handle() function pointer parameter.

gicv5_get_gsi_handle() allows ACPI core to detect the ACPI handle
of the controller that manages a specific GSI interrupt.

Update the IWB driver to clear device dependencies in ACPI core once the
IWB driver has probed.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-iwb.c |  5 +++++
 drivers/irqchip/irq-gic-v5.c     | 13 +++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
index 9103feb70ce8..a02cb9537b15 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -269,6 +269,11 @@ static int gicv5_iwb_device_probe(struct platform_device *pdev)
 	if (IS_ERR(iwb_node))
 		return PTR_ERR(iwb_node);
 
+#ifdef CONFIG_ACPI
+	if (has_acpi_companion(&pdev->dev))
+		acpi_dev_clear_dependencies(ACPI_COMPANION(&pdev->dev));
+#endif
+
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 03cc2830b260..26cfaea1af41 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1217,11 +1217,19 @@ static struct fwnode_handle *gsi_domain_handle;
 static struct fwnode_handle *gic_v5_get_gsi_domain_id(u32 gsi)
 {
 	if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) == GICV5_GSI_IWB_TYPE)
-		return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
+		return iort_iwb_handle_fwnode(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
 
 	return gsi_domain_handle;
 }
 
+static acpi_handle gic_v5_get_gsi_handle(u32 gsi)
+{
+	if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) == GICV5_GSI_IWB_TYPE)
+		return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
+
+	return NULL;
+}
+
 static int __init gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
 {
 	struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
@@ -1242,7 +1250,8 @@ static int __init gic_acpi_init(union acpi_subtable_headers *header, const unsig
 	if (ret)
 		goto out_irs;
 
-	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_id, NULL);
+	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_id,
+			   gic_v5_get_gsi_handle);
 
 	return 0;
 

-- 
2.54.0


