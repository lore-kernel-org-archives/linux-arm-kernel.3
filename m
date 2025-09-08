Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB468CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNolRWvgpEgkSgnjBQ3tApVSu7mngl+FsSxcT0oBKQo=; b=bImLb0pB+DkMP8o8cOSsyDz1ce
	Ae2IVz/pe4CB7xpD6Inj3SWiUmkXg0hDWU95HJtXF29RwO4tZxTr19qdDVD7yYcIod57t4O9KHtHG
	qX5ayfah1b9d3FBAGr80DeJuV6+iNi9Ymt55wU3XvRebHTeamJEF+M2XSE3JApl2VuJFqNfvp1nu/
	YuraoM8saEy7T5xqnQ+5Fbkr3Inygb/gV7T7IdDHGF0yfzP1L3GVoDkEPiihveT9CKkwGaDPEeu1v
	EuBJo+20fqx05GgCl/ByegOfwXybOMgRcKlKcnhPmnp/C1ZTcrCJhN07aI4plzoKPAM+xR+iNh/Gz
	rNSZsREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhxD-000000021Z9-48e0;
	Mon, 08 Sep 2025 19:55:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemX-00000000lPo-1Qs7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40F9D44A38;
	Mon,  8 Sep 2025 16:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082EFC4AF0C;
	Mon,  8 Sep 2025 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349113;
	bh=zMQRaJoyFUYzTVpLFAFRUWCGuYufHSxl4b1HcSp9Kzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f3V3amZsFt/DMSg/6ruYiOpg02JWsF8FSgfy4jJMdovBwN5rC36sF06JSoBXoMr1Q
	 ifPdvY02d6yhKOi8a0Y0se3BgZ1x9+bfPhcLnKAU8elG8O8JYjN6bUMD3VbR5fJU47
	 o1RiYzVE4IcETTO46mz4Cq/pVBKpaEbpXCu1LLMob/bU/WkPJ6M21xGcGH2+l5LC3+
	 4TJfap10a7QYCYpvnNarygNFxA2VadF/62vHBO+mQ91eXMBq4zA3yZcFzJU0dXi0Pi
	 ZdPkwWJuAeXlgIpysulJ1rNAwmAZTWdrTV6s4q9lptnwLgdkPkbksz4kVQC0NY6B+Z
	 tpNaVVuAIL9vw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemV-00000004NTm-0x1e;
	Mon, 08 Sep 2025 16:31:51 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH 21/25] irqchip/gic-v3: Drop support for custom PPI partitions
Date: Mon,  8 Sep 2025 17:31:23 +0100
Message-Id: <20250908163127.2462948-22-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093153_476571_D90FDC95 
X-CRM114-Status: GOOD (  25.19  )
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

We are finally getting there. The only thing getting in the way of
correctly handling PPIs in the way they were intended is to drop
the GICv3 hack that deals with PPI partitions.

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
index 4a90dbf9daedb..cdf6fac32908d 100644
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
@@ -596,18 +597,6 @@ static void gic_irq_set_prio(struct irq_data *d, u8 prio)
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
 static u32 __gic_get_rdist_index(irq_hw_number_t hwirq)
 {
 	switch (__get_intid_range(hwirq)) {
@@ -1668,13 +1657,6 @@ static int gic_irq_domain_translate(struct irq_domain *d,
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
@@ -1683,10 +1665,8 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		/*
 		 * Make it clear that broken DTs are... broken.
-		 * Partitioned PPIs are an unfortunate exception.
 		 */
-		WARN_ON(*type == IRQ_TYPE_NONE &&
-			fwspec->param[0] != GIC_IRQ_TYPE_PARTITION);
+		WARN_ON(*type == IRQ_TYPE_NONE);
 		return 0;
 	}
 
@@ -1743,32 +1723,11 @@ static void gic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
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
@@ -1787,15 +1746,7 @@ static int gic_irq_domain_select(struct irq_domain *d,
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
 
 static int gic_irq_get_info(struct irq_fwspec_info *info)
@@ -1854,45 +1805,6 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.get_info = gic_irq_get_info,
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
-	.get_info = gic_irq_get_info,
-};
-
 static bool gic_enable_quirk_msm8996(void *data)
 {
 	struct gic_chip_data *d = data;
@@ -2225,12 +2137,7 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
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
 
@@ -2286,30 +2193,6 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
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
2.39.2


