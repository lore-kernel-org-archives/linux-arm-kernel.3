Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A319BD0C852
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTDg+1sJGNefyoPUXNl5/KXGxNMcOKySlUlOSynN75s=; b=k7iKQAK94l6v+a/n6BJ0JLiTp9
	WSEXKowUJaNgESPKn2op9SFp2mzNjJaiOcRoRRW+XcWdsJDA1KnqUMfPx9fAYmK96/nHQAmjdIpym
	9gtsvaRNX/imFN+68lX0++Q8q2eL+AyWgd4qH1/JzlcBIY8wEB5/KwN1c9F59+jc/X0e07xxhKbfv
	8rBlqAC/UoJeS8y3PrdhRK+ufuBMoOADrVsmDlRB+84G+/ifUzTOYrFuZiwCFcaO+ZWRaxZ/UwcWM
	X8F1WVv83GoJvFOsvP4AWa0epz6NPua8R8c6YIInHwppdidOeLEQIYqfboQRsJqK0DUMnu+xXDWhN
	FdyzZLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcCv-00000006zDS-2TI3;
	Tue, 13 Jan 2026 11:05:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcCu-00000006zCt-2Q2X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A25B76001D;
	Tue, 13 Jan 2026 11:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B359CC16AAE;
	Tue, 13 Jan 2026 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768302303;
	bh=qg86Xa1BLPdLqzTfJA9tqL801nqutncRfii4YJPEuuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZmfJJdZF3SDe6dB4zuSGHvr3idM7pNiaM0Yf3tA0tz//+ULA9M+2rq3ES3aN9jPv
	 DcrQ7w4O3nQcEhUG4dg/9+Z5uwRo0a2dlM5HQRcbyKKGWB6L39HIOYdXFHaYPl6tWF
	 PGN2b+vhbVsz+5NbNgXHKd1kDeyGshgCrtDMQm5/9YEimzAz4O7Hpnm6ufTRbRZhMf
	 AA36UqMNCo7RsjFG37oC5Sz1b07qteosje7epoYgcgSW3rRoIGwkH9rJyjprKq7Oq+
	 yf9qfMvKVOh74QaKMR2Jkyti4LLdmHCZXdauGr+Q4b4MKj5jOJFDrx5mqd5Ko3nZlP
	 md6e1ml1t719A==
Date: Tue, 13 Jan 2026 12:04:57 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/7] irqdomain: Add parent field to struct irqchip_fwid
Message-ID: <aWYm2Y8yzns7n8fM@lpieralisi>
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

[...]

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
> 
> > 
> > > Or go with something similar to named and have
> > > 
> > > irq_domain_alloc_named_parented_fwnode()?  

Right, given that Thomas is fine with it, I will go with this suggestion then
albeit it is getting a bit cumbersome (_named_id_parented_fwnode..), it should
be fine and I can rework the code to add a parent field to the existing interface
later if we feel it is nicer.

Thanks,
Lorenzo

> > 
> > Or I can add a set_parent() helper (though that's a bit of churn IMO) ?
> > 
> > If Thomas has a preference I will follow that, all of the above is doable
> > for me.
> 
> Agreed. Let's see what Thomas prefers (i.e. make the decision his problem ;)
> 
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

