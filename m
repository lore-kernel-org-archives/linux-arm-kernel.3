Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC419E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8gMBaIWat/OC+daKLF/DrYEDK3rTNp+SHrrdeWTGo4=; b=CWCweG9Niwg+KgFxdkmYP3qnea
	XAQTE+t0BRe18YYsi24CHw6srMQEg9UE6DR5wtYTr45rjHOuxq7cZodyqHKV2bT3Ea86IXYUw9U2V
	62skuLVc72z4N9XB2PSciDjVlRsQd3I+CvX/w8wbnUbivgk6dD8/o0hKjgWHedgHMYm7UOawmTRXb
	0Qf6eojTOpnVYnWb6B0+5YkOMX23DiklYnskIyi3WZeldnUa0pucderAxVxCKbWiTK+PkhHVSY2K8
	lHFUkHZn4adgXEoS7NHBbmQu2r6sxZdYN69x/GaE/tg02u3DDun3lsS5WqogVVcB3oivKOnXLcWU9
	gMdG6nAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpuc-0000000CjzO-37je;
	Wed, 04 Dec 2024 13:59:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpt0-0000000CjiW-11jQ;
	Wed, 04 Dec 2024 13:57:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733320668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O8gMBaIWat/OC+daKLF/DrYEDK3rTNp+SHrrdeWTGo4=;
	b=AJk6yCS77aWTtXPj71xsZCYeiYnNwSK2NZH6NgU8rogWhB7l+4kXbG2yjdyy/qPGJc8Ze0
	mKRQe3OE1a47NDP0V45qudfLKpaT1KqOZDV7H8C6ByYt+1ZiDGIW7MDma09IFxwvjuPf1T
	ZqOojKm+3WDjW6/pj7k2y5/dC/Y/9TY4B7Uom4cb4L8EE4HjQ+PbNWH4CFVKIc5hM1QX/K
	/YxRHheXIFzTxU+OvGkI9ji6FfN7pzVgZRcKJmuNaUl3NRGc25GXOy3iSMr//2WG14bJZQ
	KmJWaSOKlo3ogqipLJ3wbih/xb68hACAlIm0C3tAtfB5uziMiaWDMZrDepa9TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733320668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O8gMBaIWat/OC+daKLF/DrYEDK3rTNp+SHrrdeWTGo4=;
	b=Qc5JYu1O1PkVaW+DC6Z5efyRWpKu6lebzkvOwpsmta3x4Bq25zwtdPx1O9s1NNfh2BTVXe
	06TjE52LP4Ai7uDQ==
To: Marc Zyngier <maz@kernel.org>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-pci@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, David Woodhouse <dwmw2@infradead.org>, Lu
 Baolu <baolu.lu@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Toan Le <toan@os.amperecomputing.com>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 02/11] genirq/msi: Add helper for creating MSI-parent
 irq domains
In-Reply-To: <20241204124549.607054-3-maz@kernel.org>
References: <20241204124549.607054-1-maz@kernel.org>
 <20241204124549.607054-3-maz@kernel.org>
Date: Wed, 04 Dec 2024 14:57:47 +0100
Message-ID: <878qsvsg84.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_055750_562551_99F3E799 
X-CRM114-Status: GOOD (  27.44  )
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

On Wed, Dec 04 2024 at 12:45, Marc Zyngier wrote:
> Creating an irq domain that serves as an MSI parent requires
> a substantial amount of esoteric boiler-plate code, some of
> which is often provided twice (such as the bus token).
>
> To make things a bit simpler for the unsuspecting MSI tinkerer,
> provide a helper that does it for them, and serves as documentation
> of what needs to be provided.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  include/linux/msi.h |  7 +++++++
>  kernel/irq/msi.c    | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index b10093c4d00ea..f08d14cf07103 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -594,6 +594,13 @@ struct irq_domain *msi_create_irq_domain(struct fwnode_handle *fwnode,
>  					 struct msi_domain_info *info,
>  					 struct irq_domain *parent);
>  
> +struct irq_domain *msi_create_parent_irq_domain(struct fwnode_handle *fwnode,
> +						const struct msi_parent_ops *msi_parent_ops,
> +						const struct irq_domain_ops *ops,
> +						unsigned long flags, unsigned long size,
> +						void *host_data,
> +						struct irq_domain *parent);

Can we please make this a template based interface similar to
msi_create_device_irq_domain()?

> +/**
> + * msi_create_parent_irq_domain - Create an MSI-parent interrupt domain
> + * @fwnode:		Optional fwnode of the interrupt controller
> + * @msi_parent_ops:	MSI parent callbacks and configuration
> + * @ops:		Interrupt domain ballbacks
> + * @flags:		Interrupt domain flags
> + * @size:		Interrupt domain size (0 if arbitrarily large)
> + * @host_data:		Interrupt domain private data
> + * @parent:		Parent irq domain
> + *
> + * Return: pointer to the created &struct irq_domain or %NULL on failure
> + */
> +struct irq_domain *msi_create_parent_irq_domain(struct fwnode_handle *fwnode,
> +						const struct msi_parent_ops *msi_parent_ops,
> +						const struct irq_domain_ops *ops,
> +						unsigned long flags, unsigned long size,
> +						void *host_data,
> +						struct irq_domain *parent)
> +{
> +	struct irq_domain_info info = {
> +		.fwnode		= fwnode,
> +		.size		= size,
> +		.hwirq_max	= size,
> +		.ops		= ops,
> +		.host_data	= host_data,
> +		.domain_flags	= flags | IRQ_DOMAIN_FLAG_MSI_PARENT,
> +		.parent		= parent,
> +		.bus_token	= msi_parent_ops->bus_select_token,
> +	};

Instead of hiding the template in the function?

We've been burnt with interfaces which might require extensions over
time before and I just converted the GIC patch (3/11) over to a template
at call site model. It results in the same code size reduction at the
call sites, but allows us to expand the template without touching any
existing driver in the future. See below.

It might be a good idea to have a specific msi_irq_domain_info template
which only contains the information required instead of reusing and
expanding irq_domain_info.

Hmm?

Thanks,

        tglx
---
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -263,24 +263,25 @@ static struct msi_parent_ops gicv2m_msi_
 
 static __init int gicv2m_allocate_domains(struct irq_domain *parent)
 {
-	struct irq_domain *inner_domain;
 	struct v2m_data *v2m;
+	struct irq_domain_info info = {
+		.ops		= &gic2m_domain_ops,
+		.parent		= parent,
+		.msi_parent_ops = &gicv2m_msi_parent_ops,
+	};
 
 	v2m = list_first_entry_or_null(&v2m_nodes, struct v2m_data, entry);
 	if (!v2m)
 		return 0;
 
-	inner_domain = irq_domain_create_hierarchy(parent, 0, 0, v2m->fwnode,
-						   &gicv2m_domain_ops, v2m);
-	if (!inner_domain) {
-		pr_err("Failed to create GICv2m domain\n");
-		return -ENOMEM;
-	}
-
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_NEXUS);
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops = &gicv2m_msi_parent_ops;
-	return 0;
+	info->fwnode = v2m->fwnode;
+	info->host_data = v2m;
+
+	if (msi_create_parent_irq_domain(&info))
+		return 0;
+
+	pr_err("Failed to create GICv2m domain\n");
+	return -ENOMEM;
 }
 
 static int __init gicv2m_init_one(struct fwnode_handle *fwnode,
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5076,31 +5076,27 @@ static void __init __iomem *its_map_one(
 
 static int its_init_domain(struct its_node *its)
 {
-	struct irq_domain *inner_domain;
-	struct msi_domain_info *info;
+	struct msi_domain_info *msi_info;
+	struct irq_domain_info info = {
+		.fwnode		= its->fwnode_handle,
+		.ops		= &its_domain_ops,
+		.parent		= its_parent,
+		.msi_parent_ops = &gic_v3_its_msi_parent_ops,
+		.flags		= its->msi_domain_flags,
+	};
 
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	if (!info)
+	msi_info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!msi_info)
 		return -ENOMEM;
 
-	info->ops = &its_msi_domain_ops;
-	info->data = its;
-
-	inner_domain = irq_domain_create_hierarchy(its_parent,
-						   its->msi_domain_flags, 0,
-						   its->fwnode_handle, &its_domain_ops,
-						   info);
-	if (!inner_domain) {
-		kfree(info);
-		return -ENOMEM;
-	}
-
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_NEXUS);
-
-	inner_domain->msi_parent_ops = &gic_v3_its_msi_parent_ops;
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-
-	return 0;
+	msi_info->ops = &its_msi_domain_ops;
+	msi_info->data = its;
+	info.host_data = msi_info;
+
+	if (msi_create_parent_irq_domain(&info))
+		return 0;
+	kfree(info);
+	return -ENOMEM;
 }
 
 static int its_init_vpe_domain(void)
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -209,17 +209,14 @@ static const struct msi_parent_ops gic_v
 
 static int mbi_allocate_domain(struct irq_domain *parent)
 {
-	struct irq_domain *nexus_domain;
+	struct irq_domain_info info = {
+		.fwnode		= parent->fwnode,
+		.ops		= &mbi_domain_ops,
+		.parent		= parent,
+		.msi_parent_ops = &gic_v3_mbi_msi_parent_ops,
+	};
 
-	nexus_domain = irq_domain_create_hierarchy(parent, 0, 0, parent->fwnode,
-						   &mbi_domain_ops, NULL);
-	if (!nexus_domain)
-		return -ENOMEM;
-
-	irq_domain_update_bus_token(nexus_domain, DOMAIN_BUS_NEXUS);
-	nexus_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	nexus_domain->msi_parent_ops = &gic_v3_mbi_msi_parent_ops;
-	return 0;
+	return msi_create_parent_irq_domain(&info) ? 0 : -ENOMEM;
 }
 
 int __init mbi_init(struct fwnode_handle *fwnode, struct irq_domain *parent)




