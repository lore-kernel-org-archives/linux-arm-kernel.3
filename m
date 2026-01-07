Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03002D0D14C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cmo6DbRXjHPRNT3D5nW53mWDbnp1pYouzj0Yu6gLFOo=; b=3Eeor03+uWhHPs0SyI0KCQ3QIO
	nsqs3RlJTUup5sKWtbKoqJkavXrYV4pqBWEPlI4VjcgChOhY+Y4mQ7BKuO4xpeaPatudWmp1Xmay6
	UyEWiMunQBGsqLdPY7TwHtm6WYka1Cq7FAwrVmuSA4LfxW2J8H1R/qzzvRs55kJVmZNzK6Z/z7zKQ
	jJnbzZt4HWxI0EobZTjbWHa1/nX2jBblftnyxh4MAW1Cm8CesU1Ewi4H3/CnovP0ci/uQNvksvB3c
	nvEdubBEm+6WwjZA0wWkyLswObiBygr2+rO8VL2BuQaamQwth47yP5jbS4Pbhc+7QMTVx6LH4rZWh
	UDGvX6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXO7-0000000FNLr-0zXn;
	Wed, 07 Jan 2026 17:32:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXO6-0000000FNLb-19dQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 17:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4924F60145;
	Wed,  7 Jan 2026 17:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF41BC4CEF1;
	Wed,  7 Jan 2026 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767807120;
	bh=9oEW8rhAehcLfZKlEBCIRM+O55SNEo+WSMO0EZpHbh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4teKoI1od0DPPm2RJ8S/s/9e/WWs50+cfHMli1iEHgQuhSwX9ZoawmECNrHZRIF0
	 0i/Scw0LxYIsm2OkMFBqiuRPQa2kdsyUJENukbcZHuBiPnZHJjxtheOtLECDAR8bpU
	 kg+0Cj77b9TLRohcV23L0xY8TYPwSvwPAcFksGsPysCMNVDw8UlURG0oHKOFTKUf0T
	 wZes9CgepHL2K5APMOgPLlS3flBTuBbsDzfuAl2eavvc//mmDGb9urrPXPMuiOtW8I
	 9NQdkBDPrUxAcY2TlifOuJuwNv2RYRqUUNWIUWEsyumHf9tONrxBWh5ZmFb6wJFrN6
	 6Mg6ZScZC/3+w==
Date: Wed, 7 Jan 2026 18:31:55 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/7] irqdomain: Add parent field to struct irqchip_fwid
Message-ID: <aV6Yi+N+lCEekshX@lpieralisi>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
 <20251218-gicv5-host-acpi-v2-3-eec76cd1d40b@kernel.org>
 <20260105120108.00002016@huawei.com>
 <aV4gH/yHaOmOtK0J@lpieralisi>
 <20260107100452.00004b6f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107100452.00004b6f@huawei.com>
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

On Wed, Jan 07, 2026 at 10:04:52AM +0000, Jonathan Cameron wrote:
> On Wed, 7 Jan 2026 09:58:07 +0100
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > On Mon, Jan 05, 2026 at 12:01:08PM +0000, Jonathan Cameron wrote:
> > > On Thu, 18 Dec 2025 11:14:29 +0100
> > > Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > >   
> > > > The GICv5 driver IRQ domain hierarchy requires adding a parent field to
> > > > struct irqchip_fwid so that core code can reference a fwnode_handle parent
> > > > for a given fwnode.
> > > > 
> > > > Add a parent field to struct irqchip_fwid and update the related kernel API
> > > > functions to initialize and handle it.
> > > > 
> > > > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > Cc: Marc Zyngier <maz@kernel.org>  
> > > Hi Lorenzo,
> > > 
> > > Happy new year.  
> > 
> > Happy New Year !
> > 
> > > > ---
> > > >  include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++----
> > > >  kernel/irq/irqdomain.c    | 14 +++++++++++++-
> > > >  2 files changed, 39 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> > > > index 62f81bbeb490..b9df84b447a1 100644
> > > > --- a/include/linux/irqdomain.h
> > > > +++ b/include/linux/irqdomain.h
> > > > @@ -257,7 +257,8 @@ static inline void irq_domain_set_pm_device(struct irq_domain *d, struct device
> > > >  
> > > >  #ifdef CONFIG_IRQ_DOMAIN
> > > >  struct fwnode_handle *__irq_domain_alloc_fwnode(unsigned int type, int id,
> > > > -						const char *name, phys_addr_t *pa);
> > > > +						const char *name, phys_addr_t *pa,
> > > > +						struct fwnode_handle *parent);
> > > >  
> > > >  enum {
> > > >  	IRQCHIP_FWNODE_REAL,
> > > > @@ -267,18 +268,39 @@ enum {
> > > >  
> > > >  static inline struct fwnode_handle *irq_domain_alloc_named_fwnode(const char *name)
> > > >  {
> > > > -	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL);
> > > > +	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL, NULL);
> > > > +}
> > > > +
> > > > +static inline
> > > > +struct fwnode_handle *irq_domain_alloc_named_fwnode_parent(const char *name,
> > > > +							   struct fwnode_handle *parent)  
> > > 
> > > The name of this makes me think it's allocating the named fwnode parent, rather that
> > > the named fwnode + setting it's parent.
> > > 
> > > There aren't all that many calls to irq_domain_named_fwnode(), maybe to avoid challenge
> > > of a new name, just add the parameter to all of them? (25ish)  Mind you the current
> > > pattern for similar cases is a helper, so maybe not.  
> > 
> > Similar cases ? Have you got anything specific I can look into ?
> 
> I meant all the different irq_domain_alloc_xxxxx variants that call
> __irq_domain_alloc_fwnode() with a subset of parameters set to NULL.
> 
> That seems to say there is a precedence for making the presence of the parameter
> part of the name rather than requiring callers to set the ones they don't want to
> NULL.  So it argues for a helper like this one just for consistency.

Yep that's why I wrote it this way but that does not mean it can't be
changed.

> > 
> > > Or go with something similar to named and have
> > > 
> > > irq_domain_alloc_named_parented_fwnode()?  
> > 
> > Or I can add a set_parent() helper (though that's a bit of churn IMO) ?
> > 
> > If Thomas has a preference I will follow that, all of the above is doable
> > for me.
> 
> Agreed. Let's see what Thomas prefers (i.e. make the decision his problem ;)

Thomas do you have any preference on the matter please ? It is not a big deal
either way I'd just like to respin promptly (provided the rest of the series
does not require further changes other than the ones Jon suggested and I
addressed) if possible please.

Thanks,
Lorenzo

> Jonathan
> 
> > 
> > > I'm not that bothered though if you think the current naming is the best we can do.  
> > 
> > I think you have a point - as per my comment above.
> > 
> > Thanks,
> > Lorenzo
> > 
> > > Jonathan
> > >   
> > > > +{
> > > > +	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL, parent);
> > > >  }  
> > > 
> > >   
> > 
> 

