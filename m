Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F17CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCP706gNUhID59kefIlv1pEeyWMRWQrzSimQZf43gGI=; b=i6p4o3rTKmSDxHVvL8geoMdg6s
	ldU71fyAZeyvkn0dOGw5lD4y2otTgUUAWbSBTFJLh+FQ4s+6N3Br9gArHwpPBKQPuJ9sZO5421Mgy
	/Hyx0Bj/7GoVg75vR3W3NW/emzHvr+A1rLg3iV2SbQcWGm9t2e8+YfjUNG52EVSoX4l2Nlcsmzaj/
	zl3eloJEFhTsrYNBuM/Qp7t00DrZlmKg6fybaEylb+1warm29dKc1nYW+QAuhtwkK+w/SAWFundPS
	IU9BCd2CrcEB9P5uVr0rZ5WLpc4ifTLMFDSZeTElmU9KDUaYWoxectXCbmdjm6WePNv5TVi/gaizL
	wWDR+q7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnZ-0000000Fk3u-0DfO;
	Tue, 28 Oct 2025 10:19:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnW-0000000Fk2u-1VaM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C471F61F05;
	Tue, 28 Oct 2025 10:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB06C116C6;
	Tue, 28 Oct 2025 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761646765;
	bh=mcD+09JpIvqsqebTYtxhjCLGrP7RjNZxDg9R66+62F0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kla7tCnv0JF9dJLj5VYpCy7ya63VZlpgFQ9vzNir/y5fmztD5BP+IbFu5JIx1hW+U
	 dfP8v3x2mb0sUZys0r9JADSCWgLJbS+PD3H66cKDCGX+kgcgjuFVBK8uslWWowy7Jw
	 j1cIwQC6qRv8+VoEBLCDzaExBcBkFmYnVKL3VsZO3yR7DW60GTz76GmbGS8MVxQpfh
	 pcXEqwqlkYM4Gr7diLckHcobZvtFZ7FevYdDswOvNIu2d4IXr3k5tOybI9oylKhDJ7
	 F2nRrmtn1xtfLjaTfNsnILZtRGSLwLS2PhNynjgjIvCSX293ULBzJljuOzN+HLoHSS
	 HitGoNQI54QQg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 28 Oct 2025 11:19:01 +0100
Subject: [PATCH not for merging 3/7] irqdomain: Add parent field to
 irqchip_fwid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-gicv5-host-acpi-v1-3-01a862feb5ca@kernel.org>
References: <20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org>
In-Reply-To: <20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.3
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

The GICv5 driver IRQ domain hierarchy requires adding a parent field to
struct irqchip_fwid so that core code can reference a fwnode_handle parent
for a given fwnode.

Add a parent field to struct irqchip_fwid and update the related kernel API
functions to initialize and handle it.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++----
 kernel/irq/irqdomain.c    | 14 +++++++++++++-
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 4a86e6b915dd..289a390ccbe6 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -236,7 +236,8 @@ static inline void irq_domain_set_pm_device(struct irq_domain *d, struct device
 
 #ifdef CONFIG_IRQ_DOMAIN
 struct fwnode_handle *__irq_domain_alloc_fwnode(unsigned int type, int id,
-						const char *name, phys_addr_t *pa);
+						const char *name, phys_addr_t *pa,
+						struct fwnode_handle *parent);
 
 enum {
 	IRQCHIP_FWNODE_REAL,
@@ -246,18 +247,39 @@ enum {
 
 static inline struct fwnode_handle *irq_domain_alloc_named_fwnode(const char *name)
 {
-	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL);
+	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL, NULL);
+}
+
+static inline
+struct fwnode_handle *irq_domain_alloc_named_fwnode_parent(const char *name,
+							   struct fwnode_handle *parent)
+{
+	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL, parent);
 }
 
 static inline struct fwnode_handle *irq_domain_alloc_named_id_fwnode(const char *name, int id)
 {
 	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED_ID, id, name,
-					 NULL);
+					 NULL, NULL);
+}
+
+static inline
+struct fwnode_handle *irq_domain_alloc_named_id_fwnode_parent(const char *name, int id,
+							      struct fwnode_handle *parent)
+{
+	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED_ID, id, name,
+					 NULL, parent);
 }
 
 static inline struct fwnode_handle *irq_domain_alloc_fwnode(phys_addr_t *pa)
 {
-	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_REAL, 0, NULL, pa);
+	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_REAL, 0, NULL, pa, NULL);
+}
+
+static inline struct fwnode_handle *irq_domain_alloc_fwnode_parent(phys_addr_t *pa,
+								   struct fwnode_handle *parent)
+{
+	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_REAL, 0, NULL, pa, parent);
 }
 
 void irq_domain_free_fwnode(struct fwnode_handle *fwnode);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dc473faadcc8..a6e159785cc2 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -33,6 +33,7 @@ static void irq_domain_free_one_irq(struct irq_domain *domain, unsigned int virq
 
 struct irqchip_fwid {
 	struct fwnode_handle	fwnode;
+	struct fwnode_handle	*parent;
 	unsigned int		type;
 	char			*name;
 	phys_addr_t		*pa;
@@ -53,8 +54,16 @@ static const char *irqchip_fwnode_get_name(const struct fwnode_handle *fwnode)
 	return fwid->name;
 }
 
+static struct fwnode_handle *irqchip_fwnode_get_parent(const struct fwnode_handle *fwnode)
+{
+	struct irqchip_fwid *fwid = container_of(fwnode, struct irqchip_fwid, fwnode);
+
+	return fwid->parent;
+}
+
 const struct fwnode_operations irqchip_fwnode_ops = {
 	.get_name = irqchip_fwnode_get_name,
+	.get_parent = irqchip_fwnode_get_parent,
 };
 EXPORT_SYMBOL_GPL(irqchip_fwnode_ops);
 
@@ -65,6 +74,7 @@ EXPORT_SYMBOL_GPL(irqchip_fwnode_ops);
  * @id:		Optional user provided id if name != NULL
  * @name:	Optional user provided domain name
  * @pa:		Optional user-provided physical address
+ * @parent:	Optional parent fwnode_handle
  *
  * Allocate a struct irqchip_fwid, and return a pointer to the embedded
  * fwnode_handle (or NULL on failure).
@@ -76,7 +86,8 @@ EXPORT_SYMBOL_GPL(irqchip_fwnode_ops);
  */
 struct fwnode_handle *__irq_domain_alloc_fwnode(unsigned int type, int id,
 						const char *name,
-						phys_addr_t *pa)
+						phys_addr_t *pa,
+						struct fwnode_handle *parent)
 {
 	struct irqchip_fwid *fwid;
 	char *n;
@@ -104,6 +115,7 @@ struct fwnode_handle *__irq_domain_alloc_fwnode(unsigned int type, int id,
 	fwid->type = type;
 	fwid->name = n;
 	fwid->pa = pa;
+	fwid->parent = parent;
 	fwnode_init(&fwid->fwnode, &irqchip_fwnode_ops);
 	return &fwid->fwnode;
 }

-- 
2.50.1


