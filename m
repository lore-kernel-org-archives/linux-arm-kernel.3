Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF039C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L6EPABepaaEWzQlwcJ+3VhVi3KudyXVVMmPe4QGKfM=; b=Mo3nA/nT/bsKS2jZvSLIAB+OSS
	X0bG6S1Ii/qItKEpAbG71bM/MCGCzPvCALDFpuzAZxR3rDaHFcf/yAU6T2WC4NeTjxEGJ9yUspOA9
	EnEhXWOocsaXQCvxfsfMQzHtKEHwcV8jQPlCduhxeLi9YqioCxPqo5Qh7F37xXoTDK5lXiUr8ePrU
	EkO9j27nqMYjlfxU9kRvwonTHRyO0s/mgzGBylEmO1eP5C0ekvNpv+CfFBIsMvCoFJfiBJlroXSEK
	jX8+5wblg2gDpPjx7+Z7ywrqlMZpFjJcABHJwGIvnNBNzlrjFGXPTnGDfCNELb5CCDqsJlqsa+B85
	wz319now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3h4x-00000007mFc-2Feb;
	Mon, 07 Sep 2026 21:40:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3h4w-00000007mFP-1ge3;
	Mon, 07 Sep 2026 21:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDCE143A02;
	Mon,  7 Sep 2026 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E870F1F00A3A;
	Mon,  7 Sep 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788817237;
	bh=8L6EPABepaaEWzQlwcJ+3VhVi3KudyXVVMmPe4QGKfM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=awtRz/dRwQBO+ZUnIc+DgRzgZGFcJTEmWHs7kAsR4XNCmb9Fci7by9l/3yQa/U41a
	 siho2efoUcM+xwRTghdR3r4MMOo3uxr/rCbqgoZSn1j4eaDy/9n11wx+umFSrZ/o+/
	 hso7fPOsBi1uUu0fe41eiGH9KH3ci1bFgVtOg2YKRzKvpCYAPcuIeSuA3wLP7xR/mS
	 w6+bfiefT/SKEDPrfDOZqfm6IcccVTtpKjBEYWsq6PkmsgbnMA3/Uack/eECrbSMP/
	 tfwe9GFsXx7pA8My5133lUMkNfRsmezYiaNMbArHIDQ5IPCnFov8Kp/1R85T5aGURF
	 K96ESUuIC4cMw==
From: Thomas Gleixner <tglx@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>, Sangwoo Han <sangwoo.han@nearthlab.com>
Cc: jim2101024@gmail.com, florian.fainelli@broadcom.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com,
 robh@kernel.org, linux-pci@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Inochi
 Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
In-Reply-To: <20260907163452.GA2526539@bhelgaas>
References: <20260907163452.GA2526539@bhelgaas>
Date: Mon, 07 Sep 2026 23:40:34 +0200
Message-ID: <87cxuo3fl9.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, Sep 07 2026 at 11:34, Bjorn Helgaas wrote:
> [+cc Thomas, Inochi for MSI expertise]
>
> I want to revive this thread because I think there's a real problem
> here, and we should solve it for all the PCI controller drivers.
>
> There's nothing brcm-specific about the bitmap alloc/free except the
> size of the msi->used bitmap, so I don't want to copy/paste this sort
> of fix in all the affected drivers.
>
> I'd also like to avoid the extra align_mask and
> bitmap_find_next_zero_area() followed by manual bitmap_set().
> bitmap_find_free_region() already takes care of the alignment and
> setting the allocated bits.
>
> The MSI Multiple Message Enable situation of enabling more vectors in
> the device than the driver wants is generic to all devices that
> advertise Multiple Message Capable, and I don't think we should have
> to deal with this in every host controller driver.

Correct.

> If a driver requests 3 vectors, we have to enable 4 because MSI only
> supports power-of-two number of vectors.  This tells the device it is
> allowed to use all 4 vectors, and I think the PCI MSI core should
> assume they all *will* be used instead of relying on the driver's
> claim that it will only use 3.

That's not really a good idea because e.g. the irq affinity stuff relies
on the accurate number of interrupts the driver requested with the
minvec/maxvec range. We can't magically spread more interrupts than the
driver is able/willing to handle.

But we can fix that without changing the consumer side (device drivers)
visible behaviour and handle it solely in the core code.

 1) MSI interrupts are special because they have msi_desc::nvec_used >
    1, so the allocation and the free path can take care of the power of
    two requirement. That just allocates more resources than the driver
    wants but they are just memory.

 2) All MSI parent domain implementations should be able to handle
    domain_ops::free() with nr_irqs > 1. That's something which can be
    trivialy audited.

    I really have no memories why the bulk remove function iterates the
    interrupts one by one instead of doing in one go, but this is also
    used by non MSI domains, which might have issues with a bulk remove.

    If we establish that all MSI parent domain implementations can
    handle the free() callback with nr_irqs > 1, then
    irq_domain_free_irqs_hierarchy can check whether
    IRQ_DOMAIN_FLAG_MSI_PARENT is set in the domain_flags and avoid the
    loop for that case.
    
Something like the completely untested below.

Thanks,

        tglx
---
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 4fdcb6df5306..b3f6cc6ae2ce 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1611,6 +1611,13 @@ static void irq_domain_free_irqs_hierarchy(struct irq_domain *domain,
 	if (!domain->ops->free)
 		return;
 
+	/* CHECKME: Are all MSI parent domains capable ? */
+	if (domain->flags & IRQ_DOMAIN_FLAG_MSI_PARENT) {
+		if (irq_domain_get_irq_data(domain, irq_base))
+			domain->ops->free(domain, irq_base, nr_irqs);
+		return;
+	}
+
 	for (i = 0; i < nr_irqs; i++) {
 		if (irq_domain_get_irq_data(domain, irq_base + i))
 			domain->ops->free(domain, irq_base + i, 1);
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..2835b09899ea 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struct device *dev, struct irq_domain *domain
 
 		ops->set_desc(&arg, desc);
 
-		virq = __irq_domain_alloc_irqs(domain, -1, desc->nvec_used,
+		/* Make sure a MULTI-MSI allocation is power of two */
+		unsigned int nvec_aligned = roundup_pow_of_two(desc->nvec_used);
+
+		virq = __irq_domain_alloc_irqs(domain, -1, nvec_aligned,
 					       dev_to_node(dev), &arg, false,
 					       desc->affinity);
 		if (virq < 0)
 			return msi_handle_pci_fail(domain, desc, allocated);
 
-		for (i = 0; i < desc->nvec_used; i++) {
+		for (i = 0; i < nvec_aligned; i++) {
 			irq_set_msi_desc_off(virq, i, desc);
 			irq_debugfs_copy_devname(virq + i, dev);
 			ret = msi_init_virq(domain, virq + i, vflags);
 			if (ret)
 				return ret;
 		}
+
 		if (info->flags & MSI_FLAG_DEV_SYSFS) {
+			/*
+			 * This only exposes desc->nvec_used and ignores the
+			 * overallocated MULTI-MSI ones.
+			 */
 			ret = msi_sysfs_populate_desc(dev, desc);
 			if (ret)
 				return ret;
@@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struct device *dev, struct irq_domain *domain
 			continue;
 
 		/* Make sure all interrupts are deactivated */
-		for (i = 0; i < desc->nvec_used; i++) {
+		unsigned int nvec_aligned = roundup_pow_of_two(desc->nvec_used);
+
+		for (i = 0; i < nvec_aligned; i++) {
 			irqd = irq_domain_get_irq_data(domain, desc->irq + i);
 			if (irqd && irqd_is_activated(irqd))
 				irq_domain_deactivate_irq(irqd);
 		}
 
-		irq_domain_free_irqs(desc->irq, desc->nvec_used);
+		irq_domain_free_irqs(desc->irq, nvec_aligned);
 		if (info->flags & MSI_FLAG_DEV_SYSFS)
 			msi_sysfs_remove_desc(dev, desc);
 		desc->irq = 0;

