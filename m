Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FF0CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thJRDfSfpWXhDcaBjWAPMVckGQdaeQkgAY7u89/c7u8=; b=p9X4ekvkFlblksNltBZCOoR0Zr
	5E6hvChsYg0HaKROYpSlAzu/SaEwoXSwbF/OQBLE0nz2MpJ4FqnKFtL67Shayk78yrI5bZlbyOE4q
	NgTuPjwqAkL6uayn1L81eDD9Zhfx3k+FfxFQjgdPibd9Pq/OIec1nGHEqr3N/HVnHP8Q10VZ6vEAN
	43wsvafzpPk5lFMesyVPIFW+FtWItJblTmXwwmkZFNnnmhxFUuUqPpkppIexFQwQl6oeWcALFT2PM
	yWnbPH0o5UaeA/np+iOC1eVgrabKI9tHsKOlLUdZIH5fd+HpcV+Ok6JLOp2MSIttjh+yA5i2/xWN1
	lgIu29IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp3X-0000000DTUH-2Xtf;
	Mon, 20 Oct 2025 12:32:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp23-0000000DRSO-3KRf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=thJRDfSfpWXhDcaBjWAPMVckGQdaeQkgAY7u89/c7u8=; b=fmMBBba8hsX8ReUG9VcndiUAvB
	Lzv2GtZUt6uYHJkdOaa8IolY3LVG/FCgJbxKHTFvNICcxhscL4GEtxy2MbDkpCUnaGhMfSwy4s22k
	ti+MzO3Oxo6wLSOXezAG2VsAUbPtcmJKRSjXgCEVNJmUKRPmApUuMPBPQrQp+GBt2k8tsogl6mugy
	hooUdvVWEQ1EuoH12C7pVVxdQH3jr9NDZSf6H5nNeuJekeAjn2f59/MR45A4/EjNkvhlDPEXj/fog
	j5EKkNMmU33oJKZOFr6IHzZQ8oAWP6qBzhE7ilZ/Ne4BJW9IniiIFLW+qP4LNDGK/P3a8sonjqEbr
	ujZOorDg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1x-000000074Aq-3aFg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1AC6456E6;
	Mon, 20 Oct 2025 12:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742F7C116C6;
	Mon, 20 Oct 2025 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963409;
	bh=acaPYQeOSgLtZF/bImsTJHWuVgiSegqBzzgCiK2oJlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVq3VnHgPnDvZVZNZQbepe2oZPJ294fEvG1zkIX3mzdV0Pm/yQLSwbrrWIFmr7gu7
	 eVFy4+1uBC+868LewumBjcOSaDUOckDX0UFu//G1x2cykLCGqfRZ3qQu/kwAqUzFuc
	 JtncrqezRpAy2zr9q07W9DOHHZaKJ38/0FvtXsg8pWbm2cDqbMJYzP2OuO/P2R8RUz
	 42N30WJ/78J49O31J5QJFif1bQ+H6edhCg089/cuwI6uUbSvD4KZARRcNi66jHYdzQ
	 2m8mKoSbrN90er0Wqbaxji78K59r0g8546xllMPBTQuDf9K3FvOwnwaCnvWha8OgvL
	 XsEyJDATkwXLA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1b-0000000FUu2-1fiW;
	Mon, 20 Oct 2025 12:30:07 +0000
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 01/26] irqdomain: Add firmware info reporting interface
Date: Mon, 20 Oct 2025 13:29:18 +0100
Message-ID: <20251020122944.3074811-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133031_764160_72B0785B 
X-CRM114-Status: GOOD (  19.05  )
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

Allow an irqdomain callback to report firmware-provided information
that is otherwise not available in a generic way. This is reported
using a new data structure (struct irq_fwspec_info).

This callback is optional and the only information that can be
reported currently is the affinity of an interrupt. However, the
containing structure is designed to be extensible, allowing other
potentially relevant information to be reported in the future.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h | 27 +++++++++++++++++++++++++++
 kernel/irq/irqdomain.c    | 32 +++++++++++++++++++++++++++-----
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 4a86e6b915dd6..9d6a5e99394fa 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -44,6 +44,23 @@ struct irq_fwspec {
 	u32			param[IRQ_DOMAIN_IRQ_SPEC_PARAMS];
 };
 
+/**
+ * struct irq_fwspec_info - firmware provided IRQ information structure
+ *
+ * @flags:		Information validity flags
+ * @cpumask:		Affinity mask for this interrupt
+ *
+ * This structure reports firmware-specific information about an
+ * interrupt. The only significant information is the affinity of a
+ * per-CPU interrupt, but this is designed to be extended as required.
+ */
+struct irq_fwspec_info {
+	unsigned long		flags;
+	const struct cpumask	*affinity;
+};
+
+#define IRQ_FWSPEC_INFO_AFFINITY_VALID	BIT(0)
+
 /* Conversion function from of_phandle_args fields to fwspec  */
 void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
 			       unsigned int count, struct irq_fwspec *fwspec);
@@ -69,6 +86,9 @@ void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
  * @translate:	Given @fwspec, decode the hardware irq number (@out_hwirq) and
  *		linux irq type value (@out_type). This is a generalised @xlate
  *		(over struct irq_fwspec) and is preferred if provided.
+ * @get_fwspec_info:
+ *		Given @fwspec, report additional firmware-provided information in
+ *		@info. Optional.
  * @debug_show:	For domains to show specific data for an interrupt in debugfs.
  *
  * Functions below are provided by the driver and called whenever a new mapping
@@ -96,6 +116,7 @@ struct irq_domain_ops {
 	void	(*deactivate)(struct irq_domain *d, struct irq_data *irq_data);
 	int	(*translate)(struct irq_domain *d, struct irq_fwspec *fwspec,
 			     unsigned long *out_hwirq, unsigned int *out_type);
+	int	(*get_fwspec_info)(struct irq_fwspec *fwspec, struct irq_fwspec_info *info);
 #endif
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	void	(*debug_show)(struct seq_file *m, struct irq_domain *d,
@@ -602,6 +623,8 @@ void irq_domain_free_irqs_parent(struct irq_domain *domain, unsigned int irq_bas
 
 int irq_domain_disconnect_hierarchy(struct irq_domain *domain, unsigned int virq);
 
+int irq_populate_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info);
+
 static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
 	return domain->flags & IRQ_DOMAIN_FLAG_HIERARCHY;
@@ -685,6 +708,10 @@ static inline bool irq_domain_is_msi_device(struct irq_domain *domain)
 	return false;
 }
 
+static inline int irq_populate_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
+{
+	return -EINVAL;
+}
 #endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
 #ifdef CONFIG_GENERIC_MSI_IRQ
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dc473faadcc81..2652c4cfd877f 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -867,13 +867,9 @@ void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
 }
 EXPORT_SYMBOL_GPL(of_phandle_args_to_fwspec);
 
-unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
+static struct irq_domain *fwspec_to_domain(struct irq_fwspec *fwspec)
 {
 	struct irq_domain *domain;
-	struct irq_data *irq_data;
-	irq_hw_number_t hwirq;
-	unsigned int type = IRQ_TYPE_NONE;
-	int virq;
 
 	if (fwspec->fwnode) {
 		domain = irq_find_matching_fwspec(fwspec, DOMAIN_BUS_WIRED);
@@ -883,6 +879,32 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		domain = irq_default_domain;
 	}
 
+	return domain;
+}
+
+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
+int irq_populate_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
+{
+	struct irq_domain *domain = fwspec_to_domain(fwspec);
+
+	memset(info, 0, sizeof(*info));
+
+	if (!domain || !domain->ops->get_fwspec_info)
+		return 0;
+
+	return domain->ops->get_fwspec_info(fwspec, info);
+}
+#endif
+
+unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
+{
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_domain *domain;
+	struct irq_data *irq_data;
+	irq_hw_number_t hwirq;
+	int virq;
+
+	domain = fwspec_to_domain(fwspec);
 	if (!domain) {
 		pr_warn("no irq domain found for %s !\n",
 			of_node_full_name(to_of_node(fwspec->fwnode)));
-- 
2.47.3


