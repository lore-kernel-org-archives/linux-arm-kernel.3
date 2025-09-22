Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E0CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Po4b8IAYoEEkyA1YpzJNPg7uMB3WT7fR/Uq5Z6T+TbE=; b=a7AThPqgLPSSjPMPJR/2Q1RvqB
	jBS/U5L5ArnE1zVeqnxyVEFQRKkW1QZw0+Rr3lEAm/k1xl8cwyBK25ktPX6vPte5SYduswtHqABz8
	BU4G+RCWVfuZ6CPDXlaYPIfkhuIOBHnHyfnmHLr5j7jnIdD7fnaxzZ6D3VJI0uk6TxyVizjwUdt9p
	2NTH/LBkDO9P3FCULEry+6J4kdP+pcFDrhRjmxri+a/nVNiKZwLQ0A6XHVVyUaRaPT/Qj+0smd1Pi
	11GRBBl7VJKSKgQilUBLTcOqVFTEeBKx3zBDHnhgiUT5ksQBOD3b97x5I1U3WTc7kjnXjbJqlg5nF
	gOZXr+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bv2-00000009iFf-1Cvn;
	Mon, 22 Sep 2025 08:29:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buj-00000009hhP-3k3s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0B5244ED0;
	Mon, 22 Sep 2025 08:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8769CC4CEF5;
	Mon, 22 Sep 2025 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529729;
	bh=A/XF6leqvT7e8gSuNNbqTYexlmnNX9TES+aCttT5e0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cEKvcImMC95/T/hl90rMJLXd2rmQnNby+wy0Oxx996yfTlcmRxMAGsyTqZ48fn2Nz
	 CCps0G88F6E2NnluL/KbjWBCrZC5R+FesDrzLk1ziH8Mvlr4Ghgcm2RAvA5UEREI5P
	 7LJllYdn8NM5XlV/w3JUvrpqRDSLFq54HQORY4KnwCq3pr4e9SNHpG5wQjXGzesJjQ
	 qyl/gilXofu37ZvBocoK6+lL231VxmxaAAINZ//iXoecQNK8uIdXrQQD/d/erOwnCw
	 HHadhB901nM4hg/AWLpLeueYSI0jsQ+2p69MEf3O2u0akxU8XMQrIn7CUoYwaojGu8
	 0Ids3g5ovVzTQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0buh-00000008Kds-2u5t;
	Mon, 22 Sep 2025 08:28:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 21/26] irqchip/gic-v3: Drop support for custom PPI partitions
Date: Mon, 22 Sep 2025 09:28:28 +0100
Message-ID: <20250922082833.2038905-22-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012849_998663_F8A28083 
X-CRM114-Status: GOOD (  25.31  )
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

The only thing getting in the way of correctly handling PPIs the way
they were intended is the GICv3 hack that deals with PPI partitions.

Remove that code, allowing the common code to kick in.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/Kconfig      |   1 -
 drivers/irqchip/irq-gic-v3.c | 133 +++--------------------------------
 2 files changed, 8 insertions(+), 126 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 6d12c6ab9ea47..c31d2f99d7b91 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -36,7 +36,6 @@ config GIC_NON_BANKED
 config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
-	select PARTITION_PERCPU
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	select HAVE_ARM_SMCCC_DISCOVERY
 	select IRQ_MSI_IOMMU
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 8b615a2ee463d..efb513e79bc55 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -26,7 +26,6 @@
 #include <linux/irqchip/arm-gic-common.h>
 #include <linux/irqchip/arm-gic-v3.h>
 #include <linux/irqchip/arm-gic-v3-prio.h>
-#include <linux/irqchip/irq-partition-percpu.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/arm-smccc.h>
@@ -46,8 +45,6 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
 #define FLAGS_WORKAROUND_ASR_ERRATUM_8601001	(1ULL << 2)
 #define FLAGS_WORKAROUND_INSECURE		(1ULL << 3)
 
-#define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
-
 static struct cpumask broken_rdists __read_mostly __maybe_unused;
 
 struct redist_region {
@@ -68,11 +65,15 @@ struct gic_chip_data {
 	u64			flags;
 	bool			has_rss;
 	unsigned int		ppi_nr;
-	struct partition_desc	**ppi_descs;
 	struct partition_affinity *parts;
 	unsigned int		nr_parts;
 };
 
+struct partition_affinity {
+	cpumask_t			mask;
+	struct fwnode_handle		*partition_id;
+};
+
 #define T241_CHIPS_MAX		4
 static void __iomem *t241_dist_base_alias[T241_CHIPS_MAX] __read_mostly;
 static DEFINE_STATIC_KEY_FALSE(gic_nvidia_t241_erratum);
@@ -593,18 +594,6 @@ static void gic_irq_set_prio(struct irq_data *d, u8 prio)
 	writeb_relaxed(prio, base + offset + index);
 }
 
-static u32 __gic_get_ppi_index(irq_hw_number_t hwirq)
-{
-	switch (__get_intid_range(hwirq)) {
-	case PPI_RANGE:
-		return hwirq - 16;
-	case EPPI_RANGE:
-		return hwirq - EPPI_BASE_INTID + 16;
-	default:
-		unreachable();
-	}
-}
-
 static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
@@ -1628,13 +1617,6 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 		case GIC_IRQ_TYPE_LPI:	/* LPI */
 			*hwirq = fwspec->param[1];
 			break;
-		case GIC_IRQ_TYPE_PARTITION:
-			*hwirq = fwspec->param[1];
-			if (fwspec->param[1] >= 16)
-				*hwirq += EPPI_BASE_INTID - 16;
-			else
-				*hwirq += 16;
-			break;
 		default:
 			return -EINVAL;
 		}
@@ -1643,10 +1625,8 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		/*
 		 * Make it clear that broken DTs are... broken.
-		 * Partitioned PPIs are an unfortunate exception.
 		 */
-		WARN_ON(*type == IRQ_TYPE_NONE &&
-			fwspec->param[0] != GIC_IRQ_TYPE_PARTITION);
+		WARN_ON(*type == IRQ_TYPE_NONE);
 		return 0;
 	}
 
@@ -1703,32 +1683,11 @@ static void gic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	}
 }
 
-static bool fwspec_is_partitioned_ppi(struct irq_fwspec *fwspec,
-				      irq_hw_number_t hwirq)
-{
-	enum gic_intid_range range;
-
-	if (!gic_data.ppi_descs)
-		return false;
-
-	if (!is_of_node(fwspec->fwnode))
-		return false;
-
-	if (fwspec->param_count < 4 || !fwspec->param[3])
-		return false;
-
-	range = __get_intid_range(hwirq);
-	if (range != PPI_RANGE && range != EPPI_RANGE)
-		return false;
-
-	return true;
-}
-
 static int gic_irq_domain_select(struct irq_domain *d,
 				 struct irq_fwspec *fwspec,
 				 enum irq_domain_bus_token bus_token)
 {
-	unsigned int type, ret, ppi_idx;
+	unsigned int type, ret;
 	irq_hw_number_t hwirq;
 
 	/* Not for us */
@@ -1747,15 +1706,7 @@ static int gic_irq_domain_select(struct irq_domain *d,
 	if (WARN_ON_ONCE(ret))
 		return 0;
 
-	if (!fwspec_is_partitioned_ppi(fwspec, hwirq))
-		return d == gic_data.domain;
-
-	/*
-	 * If this is a PPI and we have a 4th (non-null) parameter,
-	 * then we need to match the partition domain.
-	 */
-	ppi_idx = __gic_get_ppi_index(hwirq);
-	return d == partition_get_domain(gic_data.ppi_descs[ppi_idx]);
+	return d == gic_data.domain;
 }
 
 static int gic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
@@ -1812,45 +1763,6 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.get_fwspec_info = gic_irq_get_fwspec_info,
 };
 
-static int partition_domain_translate(struct irq_domain *d,
-				      struct irq_fwspec *fwspec,
-				      unsigned long *hwirq,
-				      unsigned int *type)
-{
-	unsigned long ppi_intid;
-	struct device_node *np;
-	unsigned int ppi_idx;
-	int ret;
-
-	if (!gic_data.ppi_descs)
-		return -ENOMEM;
-
-	np = of_find_node_by_phandle(fwspec->param[3]);
-	if (WARN_ON(!np))
-		return -EINVAL;
-
-	ret = gic_irq_domain_translate(d, fwspec, &ppi_intid, type);
-	if (WARN_ON_ONCE(ret))
-		return 0;
-
-	ppi_idx = __gic_get_ppi_index(ppi_intid);
-	ret = partition_translate_id(gic_data.ppi_descs[ppi_idx],
-				     of_fwnode_handle(np));
-	if (ret < 0)
-		return ret;
-
-	*hwirq = ret;
-	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
-
-	return 0;
-}
-
-static const struct irq_domain_ops partition_domain_ops = {
-	.translate = partition_domain_translate,
-	.select = gic_irq_domain_select,
-	.get_fwspec_info = gic_irq_get_fwspec_info,
-};
-
 static bool gic_enable_quirk_msm8996(void *data)
 {
 	struct gic_chip_data *d = data;
@@ -2173,12 +2085,7 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 	if (!parts_node)
 		return;
 
-	gic_data.ppi_descs = kcalloc(gic_data.ppi_nr, sizeof(*gic_data.ppi_descs), GFP_KERNEL);
-	if (!gic_data.ppi_descs)
-		goto out_put_node;
-
 	nr_parts = of_get_child_count(parts_node);
-
 	if (!nr_parts)
 		goto out_put_node;
 
@@ -2234,30 +2141,6 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 	gic_data.parts = parts;
 	gic_data.nr_parts = nr_parts;
 
-	for (i = 0; i < gic_data.ppi_nr; i++) {
-		unsigned int irq;
-		struct partition_desc *desc;
-		struct irq_fwspec ppi_fwspec = {
-			.fwnode		= gic_data.fwnode,
-			.param_count	= 3,
-			.param		= {
-				[0]	= GIC_IRQ_TYPE_PARTITION,
-				[1]	= i,
-				[2]	= IRQ_TYPE_NONE,
-			},
-		};
-
-		irq = irq_create_fwspec_mapping(&ppi_fwspec);
-		if (WARN_ON(!irq))
-			continue;
-		desc = partition_create_desc(gic_data.fwnode, parts, nr_parts,
-					     irq, &partition_domain_ops);
-		if (WARN_ON(!desc))
-			continue;
-
-		gic_data.ppi_descs[i] = desc;
-	}
-
 out_put_node:
 	of_node_put(parts_node);
 }
-- 
2.47.3


