Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFD7CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPL/T9MJDRvhlfgHYVGEi8eEZQ7MtmOhMakmS9mQOAs=; b=T8Uqbr8A9xJemr7IEzln8axo9o
	yr/3HZcZ5to7KyZG5gdUSBM43e8DG6buOXY40knzoi7T9Ec2GyQggKxGAS9Km2dcuhg6HPvM6ADks
	R81gRlYg1tGJH4vEqJM/6c+1x49dtFbDr3vmxbBVr+zsD3XGQ7efOpp00xXQOyf/UOP0kjJ5rq3D3
	3uFRY5iRQFF2ihQ5Ui0szZhekS/8qxtqHNFReY5qq4zZnGoHTKpZSzFUncxCo/IGvkVg6RaOiEXlN
	2s4Ff/pUn+pqdTUMbKxHLDepLKwpV9S7M8B5e37XXp9yMg3ivMD7pRbyGU67SUEgyKzoKG218eFYO
	ROzWvr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvleg-000000033CB-3o3h;
	Mon, 08 Sep 2025 23:52:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemS-00000000lN4-3fyQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12846449ED;
	Mon,  8 Sep 2025 16:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15F3C4CEF7;
	Mon,  8 Sep 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349107;
	bh=Lv3GRGs3DimrxVS28LUoV3CfVPD+bzvWL5eodR8hBFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ox1wwNZrXuwyba95P9bL0MHZO+RzRqhEVepB5DhUSl0oVrnIpTw/T04e/BqqeQNIC
	 lqxVfrCMTpm54VczvYkCFhW0N9OCfIfAJVTnUqT6nF+oV2nyKREwssQErTrSm9eSjF
	 t4yc97wEKJ7XXQVUyVyeB//ChdBxYXJI2Je8Znmbg35jxDCbGTY5sxpi0XXOtgVThB
	 SYVSdE5GN4AwNzXi7/fh4gkdpqq8YBJsMKEn1pcs5h6hG1J9WXRuLy8IZaMJ45QZEh
	 9dTyAxrxnwQHceAbmC9iAuYYEIpQpDL6Ck1aLydHGs0SImiae2PsjLGbRgMp0x7eK5
	 p/oxISkJSBSRQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemP-00000004NTm-3JAc;
	Mon, 08 Sep 2025 16:31:45 +0000
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
Subject: [PATCH 01/25] irqdomain: Add firmware info reporting interface
Date: Mon,  8 Sep 2025 17:31:03 +0100
Message-Id: <20250908163127.2462948-2-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250908_093148_970203_33B909F0 
X-CRM114-Status: GOOD (  21.20  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++++++
 kernel/irq/irqdomain.c    | 33 ++++++++++++++++++++++++++++-----
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 4a86e6b915dd6..9ec93fb2f5753 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -44,6 +44,27 @@ struct irq_fwspec {
 	u32			param[IRQ_DOMAIN_IRQ_SPEC_PARAMS];
 };
 
+/**
+ * struct irq_fwspec_info - firmware provided IRQ information structure
+ *
+ * @fwspec:		IRQ specifier
+ * @cpumask:		Affinity mask for this interrupt
+ * @flags:		Information validity flags
+ *
+ * This structure reports firmware-specific information about an
+ * interrupt. The only significant information is the affinity of a
+ * per-CPU interrupt, but this is designed to be extended as required.
+ */
+struct irq_fwspec_info {
+	struct irq_fwspec	fwspec;
+	const struct cpumask	*affinity;
+
+#define IRQ_FWSPEC_INFO_FWSPEC_VALID	BIT(0)
+#define IRQ_FWSPEC_INFO_AFFINITY_VALID	BIT(1)
+
+	unsigned long		flags;
+};
+
 /* Conversion function from of_phandle_args fields to fwspec  */
 void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
 			       unsigned int count, struct irq_fwspec *fwspec);
@@ -69,6 +90,8 @@ void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
  * @translate:	Given @fwspec, decode the hardware irq number (@out_hwirq) and
  *		linux irq type value (@out_type). This is a generalised @xlate
  *		(over struct irq_fwspec) and is preferred if provided.
+ * @get_info: Given @info, report additional firmware-provided information.
+ *            Optional.
  * @debug_show:	For domains to show specific data for an interrupt in debugfs.
  *
  * Functions below are provided by the driver and called whenever a new mapping
@@ -96,6 +119,7 @@ struct irq_domain_ops {
 	void	(*deactivate)(struct irq_domain *d, struct irq_data *irq_data);
 	int	(*translate)(struct irq_domain *d, struct irq_fwspec *fwspec,
 			     unsigned long *out_hwirq, unsigned int *out_type);
+	int (*get_info)(struct irq_fwspec_info *info);
 #endif
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	void	(*debug_show)(struct seq_file *m, struct irq_domain *d,
@@ -602,6 +626,8 @@ void irq_domain_free_irqs_parent(struct irq_domain *domain, unsigned int irq_bas
 
 int irq_domain_disconnect_hierarchy(struct irq_domain *domain, unsigned int virq);
 
+int irq_populate_fwspec_info(struct irq_fwspec_info *info);
+
 static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
 {
 	return domain->flags & IRQ_DOMAIN_FLAG_HIERARCHY;
@@ -685,6 +711,10 @@ static inline bool irq_domain_is_msi_device(struct irq_domain *domain)
 	return false;
 }
 
+static inline int irq_populate_fwspec_info(struct irq_fwspec_info *info)
+{
+	return -EINVAL;
+}
 #endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
 #ifdef CONFIG_GENERIC_MSI_IRQ
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dc473faadcc81..f857606e3ffbe 100644
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
@@ -883,6 +879,33 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		domain = irq_default_domain;
 	}
 
+	return domain;
+}
+
+#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
+int irq_populate_fwspec_info(struct irq_fwspec_info *info)
+{
+	struct irq_domain *domain;
+
+	domain = fwspec_to_domain(&info->fwspec);
+	if (!domain || !domain->ops->get_info) {
+		info->flags = 0;
+		return 0;
+	}
+
+	return domain->ops->get_info(info);
+}
+#endif
+
+unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
+{
+	struct irq_domain *domain;
+	struct irq_data *irq_data;
+	irq_hw_number_t hwirq;
+	unsigned int type = IRQ_TYPE_NONE;
+	int virq;
+
+	domain = fwspec_to_domain(fwspec);
 	if (!domain) {
 		pr_warn("no irq domain found for %s !\n",
 			of_node_full_name(to_of_node(fwspec->fwnode)));
-- 
2.39.2


