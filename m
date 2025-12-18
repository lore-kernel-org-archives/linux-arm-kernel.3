Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC3BD6ACDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tr68ciSS3nqJjuh29nD0Og41FmQfYNUmVR/87vHG06I=; b=A6lrPyZYDB0yOOrzBblYyb5fFe
	gS2ecXAaN9ZkzDfteB5P+R4ZPfu0rTZC0UchRmskqenes1QSU/z19slRy6ABjE3WOAxi78+jGENqD
	zzXyLqB7eVpaX8a2EP6fO6BQfNL4k8AVEJVj8okyeiNqSUeGihkcofrImCTAEZci1Xrl4EGslsqyf
	SOQ+DKtX173dgchnW3grUiBwnocU6gJ54yW6ryGroqbBpfayGGk7ek6DZe2m/Rb/G2WfHs1CsBMe4
	EmsTH/El1Z7Zj/OI1bDENXh0jD1NuuikfyZFKrHKc852NLhA5gFUe4ENJ313tKRHV1ENFBaFkE2Pb
	11z2/D7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2Y-00000008Csq-1kqa;
	Thu, 18 Dec 2025 10:15:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2W-00000008Crm-0SlT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88FBB60123;
	Thu, 18 Dec 2025 10:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A90C19421;
	Thu, 18 Dec 2025 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052919;
	bh=GJVTj8/Q1eWiuVLph/OBwj1vemW+Wer8nWvMvF151hI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ly05k+hPNV70P3Z2zM20gHk5ANgv7lmpSZwDa/uy8qefGciy0CREV8pAC4QASs6sv
	 mpWpXbGIv1cHs9Rsw09ZBNTI3Y7BfNsNLO8ghah62A/8VGPZ+YroTK8D/whGjabOBF
	 1jz0A2ZRc41mUwI6186K0vbtUEw/p/QA48gqMvLuyun3gokYNoxanjcbFnx4de+iFa
	 oDVLJzfW1c5OJuY5JoxrE+3UUPCDO/lG5Z1IH25tR5SJrAD+Rw7AVCZstWpFf4QgkU
	 VRZrjl0vwySDfJX5JtCz1X3b3htUHbuF/pw0OAG1ZTWrZTxx/vGT/6u2R2tZhsDzMC
	 Fq8zXP+rjLESA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 18 Dec 2025 11:14:29 +0100
Subject: [PATCH v2 3/7] irqdomain: Add parent field to struct irqchip_fwid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-gicv5-host-acpi-v2-3-eec76cd1d40b@kernel.org>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
In-Reply-To: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
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
index 62f81bbeb490..b9df84b447a1 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -257,7 +257,8 @@ static inline void irq_domain_set_pm_device(struct irq_domain *d, struct device
 
 #ifdef CONFIG_IRQ_DOMAIN
 struct fwnode_handle *__irq_domain_alloc_fwnode(unsigned int type, int id,
-						const char *name, phys_addr_t *pa);
+						const char *name, phys_addr_t *pa,
+						struct fwnode_handle *parent);
 
 enum {
 	IRQCHIP_FWNODE_REAL,
@@ -267,18 +268,39 @@ enum {
 
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
index 2652c4cfd877..baf77cd167c4 100644
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


