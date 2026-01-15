Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CFBD41150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhTuh7pij5BB/YWApXsmS2Nr/BcfA9umAZ25VBcFhWM=; b=gegBPiK8oLbVTdGfGoVs1R2hla
	1WY0JvIN3bX72DPyZFMmVJLzUS0HA1TKxz1rSedm1f/4M8bXjzbpIFephZkw+3qdPExWxcoDreh2Q
	BDsCzBGqwLBnZYneY97Rbfj4KWr16zvxHOy5Z+L4fjLUJiZqyZ2vlv+Jwx1R20gjxqJB2trA9ySQV
	F+T+oVdpC4kzSDQ3qLG25qVknRaEAvPgo+9BTvGHW9CNUSXJz05rEWThJoYAEO9Z/J2E4ySY3zsrc
	EVuhFoDb5wY2EQf2pqbEEdT+YTY7WgobbfNTMUanBNOmB7CoaPiwVRQ8ConxO/8C1P7F7UY//kwTu
	RB0Cx+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK0k-0000000C6EU-27xc;
	Thu, 15 Jan 2026 09:51:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK0i-0000000C6Ct-32if
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 561F940C48;
	Thu, 15 Jan 2026 09:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA48C116D0;
	Thu, 15 Jan 2026 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768470684;
	bh=U5y6W9KU/eUjo3vcYYv+6C+tpDKsFnfaRPLMuIAuK8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p4jG/BSrnmHlYv4XoUqAikb5/11tHXgkVBryUAPkiRezvsd3jgSDCr269ul/FHDoL
	 yt9x7y3/zeBH3PQtMaPjl63vQgSD4TuxkiimGTozVvQPU9J+4Ch5tXFsw0qGDj4Inl
	 8m8N4QhNnLmW1K91/IO/DN5lBJf7/3R0b1fe4sYtV7G5R1HOV3IsHQOdSRoSdYTNKh
	 wu8re6vdPwVII5EggULKKANY17jDJDK1mejp0SkJvBdOtpHfyl8zzpuZ1jvDBBTE55
	 bgay7KzEPJW+Phzn8EbN5uCux7qeINMFT7weYN5AoNy2XmU/4b/CaX1TJKBpCoX/fQ
	 p6Pwh6soPjIdw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 15 Jan 2026 10:50:50 +0100
Subject: [PATCH v3 4/6] irqchip/gic-v5: Add ACPI IRS probing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-gicv5-host-acpi-v3-4-c13a9a150388@kernel.org>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
In-Reply-To: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_015124_827880_A32EC035 
X-CRM114-Status: GOOD (  24.86  )
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

On ARM64 ACPI systems GICv5 IRSes are described in MADT sub-entries.

Add the required plumbing to parse MADT IRS firmware table entries and
probe the IRS components in ACPI.

Augment the irqdomain_ops.translate() for PPI and SPI IRQs in order to
provide support for their ACPI based firmware translation.

Implement an irqchip ACPI based callback to initialize the global GSI
domain upon an MADT IRS detection.

The IRQCHIP_ACPI_DECLARE() entry in the top level GICv5 driver is only used
to trigger the IRS probing (ie the global GSI domain is initialized once on
the first call on multi-IRS systems); IRS probing takes place by calling
acpi_table_parse_madt() in the IRS sub-driver, that probes all IRSes
in sequence.

Add a new ACPI interrupt model so that it can be detected at runtime and
distinguished from previous GIC architecture models.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/acpi/bus.c                 |   3 +
 drivers/irqchip/irq-gic-v5-irs.c   | 128 +++++++++++++++++++++++++++++++++++
 drivers/irqchip/irq-gic-v5.c       | 134 +++++++++++++++++++++++++++++++------
 include/linux/acpi.h               |   1 +
 include/linux/irqchip/arm-gic-v5.h |   1 +
 5 files changed, 248 insertions(+), 19 deletions(-)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index a984ccd4a2a0..e4f4059c4f1d 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1197,6 +1197,9 @@ static int __init acpi_bus_init_irq(void)
 	case ACPI_IRQ_MODEL_GIC:
 		message = "GIC";
 		break;
+	case ACPI_IRQ_MODEL_GIC_V5:
+		message = "GICv5";
+		break;
 	case ACPI_IRQ_MODEL_PLATFORM:
 		message = "platform specific model";
 		break;
diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 7db44a91f043..a27a01f9e7a2 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"GICv5 IRS: " fmt
 
+#include <linux/acpi.h>
 #include <linux/kmemleak.h>
 #include <linux/log2.h>
 #include <linux/of.h>
@@ -833,3 +834,130 @@ int __init gicv5_irs_of_probe(struct device_node *parent)
 
 	return list_empty(&irs_nodes) ? -ENODEV : 0;
 }
+
+#ifdef CONFIG_ACPI
+
+#define ACPI_GICV5_IRS_MEM_SIZE (SZ_64K)
+static struct gicv5_irs_chip_data *current_irs_data __initdata;
+static int current_irsid __initdata = -1;
+static u8 current_iaffid_bits __initdata;
+
+static int __init gic_acpi_parse_iaffid(union acpi_subtable_headers *header,
+					const unsigned long end)
+{
+	struct acpi_madt_generic_interrupt *gicc = (struct acpi_madt_generic_interrupt *)header;
+	int cpu;
+
+	if (!(gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
+		return 0;
+
+	if (gicc->irs_id != current_irsid)
+		return 0;
+
+	cpu = get_logical_index(gicc->arm_mpidr);
+
+	if (gicc->iaffid & ~GENMASK(current_iaffid_bits - 1, 0)) {
+		pr_warn("CPU %d iaffid 0x%x exceeds IRS iaffid bits\n", cpu, gicc->iaffid);
+		return 0;
+	}
+
+	/* Bind the IAFFID and the CPU */
+	per_cpu(cpu_iaffid, cpu).iaffid = gicc->iaffid;
+	per_cpu(cpu_iaffid, cpu).valid = true;
+	pr_debug("Processed IAFFID %u for CPU%d", per_cpu(cpu_iaffid, cpu).iaffid, cpu);
+
+	/* We also know that the CPU is connected to this IRS */
+	per_cpu(per_cpu_irs_data, cpu) = current_irs_data;
+
+	return 0;
+}
+
+static int __init gicv5_irs_acpi_init_affinity(u32 irsid, struct gicv5_irs_chip_data *irs_data)
+{
+	u32 idr;
+
+	current_irsid = irsid;
+	current_irs_data = irs_data;
+
+	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
+	current_iaffid_bits = FIELD_GET(GICV5_IRS_IDR1_IAFFID_BITS, idr) + 1;
+
+	acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, gic_acpi_parse_iaffid, 0);
+
+	return 0;
+}
+
+static struct resource * __init gic_request_region(resource_size_t base, resource_size_t size,
+						   const char *name)
+{
+	struct resource *r = request_mem_region(base, size, name);
+
+	if (!r)
+		pr_warn_once(FW_BUG "%s region %pa has overlapping address\n", name, &base);
+
+	return r;
+}
+
+static int __init gic_acpi_parse_madt_irs(union acpi_subtable_headers *header,
+					  const unsigned long end)
+{
+	struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
+	struct gicv5_irs_chip_data *irs_data;
+	void __iomem *irs_base;
+	struct resource *r;
+	int ret;
+
+	/* Per-IRS data structure */
+	irs_data = kzalloc(sizeof(*irs_data), GFP_KERNEL);
+	if (!irs_data)
+		return -ENOMEM;
+
+	/* This spinlock is used for SPI config changes */
+	raw_spin_lock_init(&irs_data->spi_config_lock);
+
+	r = gic_request_region(irs->config_base_address, ACPI_GICV5_IRS_MEM_SIZE, "GICv5 IRS");
+	if (!r) {
+		ret = -EBUSY;
+		goto out_free;
+	}
+
+	irs_base = ioremap(irs->config_base_address, ACPI_GICV5_IRS_MEM_SIZE);
+	if (!irs_base) {
+		pr_err("Unable to map GIC IRS registers\n");
+		ret = -ENOMEM;
+		goto out_release;
+	}
+
+	gicv5_irs_init_bases(irs_data, irs_base, irs->flags & ACPI_MADT_IRS_NON_COHERENT);
+
+	gicv5_irs_acpi_init_affinity(irs->irs_id, irs_data);
+
+	ret = gicv5_irs_init(irs_data);
+	if (ret)
+		goto out_map;
+
+	if (irs_data->spi_range) {
+		pr_info("%s @%llx detected SPI range [%u-%u]\n", "IRS", irs->config_base_address,
+									irs_data->spi_min,
+									irs_data->spi_min +
+									irs_data->spi_range - 1);
+	}
+
+	return 0;
+
+out_map:
+	iounmap(irs_base);
+out_release:
+	release_mem_region(r->start, resource_size(r));
+out_free:
+	kfree(irs_data);
+	return ret;
+}
+
+int __init gicv5_irs_acpi_probe(void)
+{
+	acpi_table_parse_madt(ACPI_MADT_TYPE_GICV5_IRS, gic_acpi_parse_madt_irs, 0);
+
+	return list_empty(&irs_nodes) ? -ENODEV : 0;
+}
+#endif
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 41ef286c4d78..23fd551c4347 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -579,16 +579,36 @@ static __always_inline int gicv5_irq_domain_translate(struct irq_domain *d,
 						      unsigned int *type,
 						      const u8 hwirq_type)
 {
-	if (!is_of_node(fwspec->fwnode))
-		return -EINVAL;
+	unsigned int hwirq_trigger;
+	u8 fwspec_irq_type;
 
-	if (fwspec->param_count < 3)
-		return -EINVAL;
+	if (is_of_node(fwspec->fwnode)) {
 
-	if (fwspec->param[0] != hwirq_type)
-		return -EINVAL;
+		if (fwspec->param_count < 3)
+			return -EINVAL;
 
-	*hwirq = fwspec->param[1];
+		fwspec_irq_type = fwspec->param[0];
+
+		if (fwspec->param[0] != hwirq_type)
+			return -EINVAL;
+
+		*hwirq = fwspec->param[1];
+		hwirq_trigger = fwspec->param[2];
+	}
+
+	if (is_fwnode_irqchip(fwspec->fwnode)) {
+
+		if (fwspec->param_count != 2)
+			return -EINVAL;
+
+		fwspec_irq_type = FIELD_GET(GICV5_HWIRQ_TYPE, fwspec->param[0]);
+
+		if (fwspec_irq_type != hwirq_type)
+			return -EINVAL;
+
+		*hwirq = FIELD_GET(GICV5_HWIRQ_ID, fwspec->param[0]);
+		hwirq_trigger = fwspec->param[1];
+	}
 
 	switch (hwirq_type) {
 	case GICV5_HWIRQ_TYPE_PPI:
@@ -600,7 +620,7 @@ static __always_inline int gicv5_irq_domain_translate(struct irq_domain *d,
 							 IRQ_TYPE_EDGE_RISING;
 		break;
 	case GICV5_HWIRQ_TYPE_SPI:
-		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+		*type = hwirq_trigger & IRQ_TYPE_SENSE_MASK;
 		break;
 	default:
 		BUILD_BUG_ON(1);
@@ -660,10 +680,18 @@ static void gicv5_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 static int gicv5_irq_ppi_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
 				       enum irq_domain_bus_token bus_token)
 {
+	u32 hwirq_type;
+
 	if (fwspec->fwnode != d->fwnode)
 		return 0;
 
-	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
+	if (is_of_node(fwspec->fwnode))
+		hwirq_type = fwspec->param[0];
+
+	if (is_fwnode_irqchip(fwspec->fwnode))
+		hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, fwspec->param[0]);
+
+	if (hwirq_type != GICV5_HWIRQ_TYPE_PPI)
 		return 0;
 
 	return (d == gicv5_global_data.ppi_domain);
@@ -718,10 +746,18 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
 static int gicv5_irq_spi_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
 				       enum irq_domain_bus_token bus_token)
 {
+	u32 hwirq_type;
+
 	if (fwspec->fwnode != d->fwnode)
 		return 0;
 
-	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_SPI)
+	if (is_of_node(fwspec->fwnode))
+		hwirq_type = fwspec->param[0];
+
+	if (is_fwnode_irqchip(fwspec->fwnode))
+		hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, fwspec->param[0]);
+
+	if (hwirq_type != GICV5_HWIRQ_TYPE_SPI)
 		return 0;
 
 	return (d == gicv5_global_data.spi_domain);
@@ -1082,16 +1118,12 @@ static inline void __init gic_of_setup_kvm_info(struct device_node *node)
 }
 #endif // CONFIG_KVM
 
-static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
+static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 {
-	int ret = gicv5_irs_of_probe(node);
+	int ret = gicv5_init_domains(parent_domain);
 	if (ret)
 		return ret;
 
-	ret = gicv5_init_domains(of_fwnode_handle(node));
-	if (ret)
-		goto out_irs;
-
 	gicv5_set_cpuif_pribits();
 	gicv5_set_cpuif_idbits();
 
@@ -1113,18 +1145,82 @@ static int __init gicv5_of_init(struct device_node *node, struct device_node *pa
 	gicv5_smp_init();
 
 	gicv5_irs_its_probe();
-
-	gic_of_setup_kvm_info(node);
-
 	return 0;
 
 out_int:
 	gicv5_cpu_disable_interrupts();
 out_dom:
 	gicv5_free_domains();
+	return ret;
+}
+
+static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
+{
+	int ret = gicv5_irs_of_probe(node);
+	if (ret)
+		return ret;
+
+	ret = gicv5_init_common(of_fwnode_handle(node));
+	if (ret)
+		goto out_irs;
+
+	gic_of_setup_kvm_info(node);
+
+	return 0;
 out_irs:
 	gicv5_irs_remove();
 
 	return ret;
 }
 IRQCHIP_DECLARE(gic_v5, "arm,gic-v5", gicv5_of_init);
+
+#ifdef CONFIG_ACPI
+static bool __init acpi_validate_gic_table(struct acpi_subtable_header *header,
+					   struct acpi_probe_entry *ape)
+{
+	struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
+
+	return (irs->version == ape->driver_data);
+}
+
+static struct fwnode_handle *gsi_domain_handle;
+
+static struct fwnode_handle *gic_v5_get_gsi_domain_id(u32 gsi)
+{
+	return gsi_domain_handle;
+}
+
+static int __init gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
+{
+	struct acpi_madt_gicv5_irs *irs = (struct acpi_madt_gicv5_irs *)header;
+	int ret;
+
+	if (gsi_domain_handle)
+		return 0;
+
+	gsi_domain_handle = irq_domain_alloc_fwnode(&irs->config_base_address);
+	if (!gsi_domain_handle)
+		return -ENOMEM;
+
+	ret = gicv5_irs_acpi_probe();
+	if (ret)
+		goto out_fwnode;
+
+	ret = gicv5_init_common(gsi_domain_handle);
+	if (ret)
+		goto out_irs;
+
+	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_id);
+
+	return 0;
+
+out_irs:
+	gicv5_irs_remove();
+out_fwnode:
+	irq_domain_free_fwnode(gsi_domain_handle);
+	return ret;
+}
+IRQCHIP_ACPI_DECLARE(gic_v5, ACPI_MADT_TYPE_GICV5_IRS,
+		     acpi_validate_gic_table, ACPI_MADT_GIC_VERSION_V5,
+		     gic_acpi_init);
+#endif
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index fbf0c3a65f59..3a412dcebc29 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -107,6 +107,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_IOSAPIC,
 	ACPI_IRQ_MODEL_PLATFORM,
 	ACPI_IRQ_MODEL_GIC,
+	ACPI_IRQ_MODEL_GIC_V5,
 	ACPI_IRQ_MODEL_LPIC,
 	ACPI_IRQ_MODEL_RINTC,
 	ACPI_IRQ_MODEL_COUNT
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 68ddcdb1cec5..ff5b1a4931d7 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -344,6 +344,7 @@ void __init gicv5_init_lpi_domain(void);
 void __init gicv5_free_lpi_domain(void);
 
 int gicv5_irs_of_probe(struct device_node *parent);
+int gicv5_irs_acpi_probe(void);
 void gicv5_irs_remove(void);
 int gicv5_irs_enable(void);
 void gicv5_irs_its_probe(void);

-- 
2.50.1


