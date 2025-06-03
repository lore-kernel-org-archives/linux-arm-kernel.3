Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48615C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYHolb8g3aB2NB/sFlx0gnVaZzsHJJi5m++84HYa+lA=; b=zkTyacMFqMOR2Vp1pTZ9ZKDSCL
	6BNvlzYxqBEydSxUEUSkVLhXasqdn/26gnwQKtH+xpDzo5G2fMfRdIRVzD6otaJFoDJIBWxoE2RgW
	0NUh29wRn9teXZio+zL4lJEVXD5DUWkyauRYshP/di2Pv5VDmrmuIiBk/grxfLwTmNqFL381FqhyO
	Iyz20LhylT4J+yCSYy/I1uYdKtLbH50Sbb/iIMadTB2O6CcHuuU9wfB/wU1A2fSfO6UZsYg5BaLmT
	yVkafiVlU7HtUMphZjW0eXhU1jGX6afs13YRdV3RygLglNDH7yf8ewhaetYiC1+P04vr5Wcv4X9Vb
	itHzpeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMO7K-0000000AYnO-0ust;
	Tue, 03 Jun 2025 09:39:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMO3q-0000000AY6W-0Fh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:35:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4674EA4FD8B;
	Tue,  3 Jun 2025 09:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687BEC4CEEF;
	Tue,  3 Jun 2025 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943356;
	bh=KpRxVXq9z9pj1izRGg15ByyMBBPEY2dZxPTHXE+8dg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYRjX0jw0MB9HHfTfzm5EVGq8w699ism5RlT1dxhGjb6WvLvEQJ8MXTI8UZDnbgX4
	 4xpIE8VuHt3L2KpatZ1hSoPicrshhe5V8uyxn7sp6DBNvgH2JKMBZtnZLCCN3YRce9
	 glo4NhFhk8BWqtR+Qkcpt9GReOAi20JscwCMp0Nvh8ytpkxY/o/D3UAaO/JqFfOCGo
	 QEX3p3eC/NfZpKlS2nZPff28t8TVUqDfdx8Tex131nAtk9WH0DlaZ3LCWA8my5cavv
	 hnmts1HtCnDWIQ4xDln8RzTlQ+LKrgEwGaISHcb5jKsb8VKJkhXPjphBT34ALUchGl
	 5owQF3BcR/aWw==
Date: Tue, 3 Jun 2025 11:35:51 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
Message-ID: <aD7B96BiSb6mK9Bj@lpieralisi>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_023558_237349_BA5C192B 
X-CRM114-Status: GOOD (  36.02  )
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

On Tue, Jun 03, 2025 at 04:22:47PM +0800, Zenghui Yu wrote:
> Hi Marc,
> 
> On 2025/5/14 0:31, Marc Zyngier wrote:
> > The current device MSI infrastructure is subtly broken, as it
> > will issue an .msi_prepare() callback into the MSI controller
> > driver every time it needs to allocate an MSI. That's pretty wrong,
> > as the contract (or unwarranted assumption, depending who you ask)
> > between the MSI controller and the core code is that .msi_prepare()
> > is called exactly once per device.
> > 
> > This leads to some subtle breakage in said MSI controller drivers,
> > as it gives the impression that there are multiple endpoints sharing
> > a bus identifier (RID in PCI parlance, DID for GICv3+). It implies
> > that whatever allocation the ITS driver (for example) has done on
> > behalf of these devices cannot be undone, as there is no way to
> > track the shared state. This is particularly bad for wire-MSI devices,
> > for which .msi_prepare() is called for. each. input. line.
> > 
> > To address this issue, move the call to .msi_prepare() to take place
> > at the point of irq domain allocation, which is the only place that
> > makes sense. The msi_alloc_info_t structure is made part of the
> > msi_domain_template, so that its life-cycle is that of the domain
> > as well.
> > 
> > Finally, the msi_info::alloc_data field is made to point at this
> > allocation tracking structure, ensuring that it is carried around
> > the block.
> > 
> > This is all pretty straightforward, except for the non-device-MSI
> > leftovers, which still have to call .msi_prepare() at the old
> > spot. One day...
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  include/linux/msi.h |  2 ++
> >  kernel/irq/msi.c    | 35 +++++++++++++++++++++++++++++++----
> >  2 files changed, 33 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/msi.h b/include/linux/msi.h
> > index 63c23003ec9b7..ba1c77a829a1c 100644
> > --- a/include/linux/msi.h
> > +++ b/include/linux/msi.h
> > @@ -516,12 +516,14 @@ struct msi_domain_info {
> >   * @chip:	Interrupt chip for this domain
> >   * @ops:	MSI domain ops
> >   * @info:	MSI domain info data
> > + * @alloc_info:	MSI domain allocation data (arch specific)
> >   */
> >  struct msi_domain_template {
> >  	char			name[48];
> >  	struct irq_chip		chip;
> >  	struct msi_domain_ops	ops;
> >  	struct msi_domain_info	info;
> > +	msi_alloc_info_t	alloc_info;
> >  };
> >  
> >  /*
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index 31378a2535fb9..07eb857efd15e 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -59,7 +59,8 @@ struct msi_ctrl {
> >  static void msi_domain_free_locked(struct device *dev, struct msi_ctrl *ctrl);
> >  static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid);
> >  static inline int msi_sysfs_create_group(struct device *dev);
> > -
> > +static int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
> > +				   int nvec, msi_alloc_info_t *arg);
> >  
> >  /**
> >   * msi_alloc_desc - Allocate an initialized msi_desc
> > @@ -1023,6 +1024,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
> >  	bundle->info.ops = &bundle->ops;
> >  	bundle->info.data = domain_data;
> >  	bundle->info.chip_data = chip_data;
> > +	bundle->info.alloc_data = &bundle->alloc_info;
> >  
> >  	pops = parent->msi_parent_ops;
> >  	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
> > @@ -1061,11 +1063,18 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
> >  	if (!domain)
> >  		return false;
> >  
> > +	domain->dev = dev;
> > +	dev->msi.data->__domains[domid].domain = domain;
> > +
> > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> 
> Does it work for MSI?

This means that it does not work for MSI for you as it stands, right ?

If you spotted an issue, thanks for that, report it fully please.

> hwsize is 1 in the MSI case, without taking pci_msi_vec_count() into account.
> 
> bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> {
> 	[...]
> 
> 	return pci_create_device_domain(pdev, &pci_msi_template, 1);

I had a stab at it with GICv5 models and an MSI capable device and this indeed
calls the ITS msi_prepare() callback with 1 as vector count, so we size
the device tables wrongly.

The question is why pci_create_device_domain() is called here with
hwsize == 1. Probably, before this series, the ITS MSI parent code was
fixing the size up so we did not notice, I need to check.

Lorenzo

