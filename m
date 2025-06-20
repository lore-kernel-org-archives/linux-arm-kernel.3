Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D279C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKSU6GlAD0b+reZYhRj4iOMFyn23zu+YAR94aAzdOEg=; b=S4wzfqn/y5wKO4NPta1+F457J7
	cpGqofGI+n4xc4iQCxkVcqkZfqMDsR/jD5ZU7xgUk4NAR8wDFNBLgtrJ8hVI8SznM9sM6JaTVqYWw
	QvQrnB5JnV3Xd3V36oPSQLLmbyQX6t9L9xpBbBTpCmANrj5nVe9Wd/gczKeb7iEDW2slJv2LvwI2Z
	sbEZ1lltmqAu2xGOfkGnNAHDaDaS1w/etV7i61qutc0y7I0kf5mp4NK/FYr0MQc2qT6ywFUkPeIho
	IKJ54qEEy/bZgw9fzmsk8yKBrkl8ddgjUXjvLQ3qhtNHyuOl1Qa0izrrXxyGIdhrM/rEMJqZc5li0
	9wL2T9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJa-0000000Fc8G-0ng5;
	Fri, 20 Jun 2025 12:57:54 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaUZ-0000000FXBa-3ywo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 12:05:13 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6fabe9446a0so18403316d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750421111; x=1751025911; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iKSU6GlAD0b+reZYhRj4iOMFyn23zu+YAR94aAzdOEg=;
        b=jikDa22vqBLybL3FtnKWmSqpGPW44sSErN0uM3spTwu81P1OfWYFzpuUm452oDCYKL
         vS3RCDhDXuJPLDuna6IKfkLSGxVd7jEyaVaA3fptQlG7yv2ptoojSqTzehJEvc4zUDDm
         LhbxStizXB25bwD6vxIRWbQBj2v1EN7cJChxN/fqpCINbM8EdikWzfhBuYep5oEyCRc2
         ptKYGXNu3Axb/CIixh/G3/m0vNMGnMDmzmm+Y3pZjO7q6ZP7/NFFLpXNr5DFZFyghIiX
         8c3/himanJbrlJZUA1y0uzY+MukbIjQRgsIReM4JEOimAWPkbYQFIVw1luInfnK29oCM
         ijYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421111; x=1751025911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKSU6GlAD0b+reZYhRj4iOMFyn23zu+YAR94aAzdOEg=;
        b=FgVhQRuQxnZ0K7bpvKkXLyr7eMI9DF2HUYlwNbBu1dWYEdRK/PT09qWfkXcBFX8ZBY
         EhLCRMvqhHrxhGsYrzuXeyJJHg4UzE2yplbTWPn+pU4M9tDm+mGipQ5UFpscIEHbAOgl
         k6vNo5HDugLXjAfJZcnQtNZxX+yVbCK0f0teEkSscZ36l37GwJtUf06vxOPCVfljCzf+
         LZjIIZZcZKGGPd0R2B3NIJZRU9zn0GiGLMRh0GowVKu7HQoZBty8/efovaZT/xlPfD3j
         vM4zMGjqsQbWfbGwVyzoD4PgPJXkNR1FIcuaC8HJfrMujgOyEAQ9GWq3vBMLBDUyqg98
         Ycmw==
X-Forwarded-Encrypted: i=1; AJvYcCUu4aHguKcAsfK5+bOeYa9eU3FSwo8I88tw/HrlU6Rmq+dtp01vJ36MWmbyZjfxg1sAv6Sdq0yyOz1AO6FUrtyK@lists.infradead.org
X-Gm-Message-State: AOJu0YzN6VdWwjoMzXkiJdj8prP6QuAOmfqHd6As6n1hf23H/jVEsonG
	MLrDIl3CbwaSIlexUjyJzVfmwU0mJFzs7hl2yvno6nMH2hZD5vob0ZD+KllsE208/1o=
X-Gm-Gg: ASbGncs0ZOxqP0jHW3v9qAWCN4IkIifAgfvqJb1OCgs2jbNcEk+9nUQX1hyDjcDnNW4
	rIpYNv1AmTsPnF+Joxk2eMzCMKdh72sOHn9WBqvoK/XyWBynByXxtNtZw7KZVxAmb/+ZdPBMCsl
	g4uF3qsmyXiM09dskjYxfDm9wmWhc5B5ZEYYH7DDrNL5JRMrTxmPnkTKUEKG3BnuGdPKgSNs7KS
	0S32UJ1uD+Z/DviC7sA13S9TyIuZTpJDeXvWLJIOvo5hNQUvrQKF3CUzMOLS7fJDWbOkoLU8ZJM
	FkN+fAVPZz/HZEZzoyq0vPxAaABuIB5uHOFqcQ6X1qPt08y2V+yQJGmOkIy7CnYSwG83WmYyQLZ
	Liwgi/kFmrJVK2KVoHxv1e+JpkKwuM5r1McWAog==
X-Google-Smtp-Source: AGHT+IHfu4I3beDwgjtHUIfD6yuQvdS/JqKOrGvhTdy+iUwvWk3om69mhib1iCashING8Al0Lp0xvw==
X-Received: by 2002:a05:6214:1d24:b0:6fa:c81a:6202 with SMTP id 6a1803df08f44-6fd0a58f236mr37698336d6.29.1750421110649;
        Fri, 20 Jun 2025 05:05:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09576766sm11104646d6.81.2025.06.20.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:05:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSaUX-00000000Dmo-1ZEQ;
	Fri, 20 Jun 2025 09:05:09 -0300
Date: Fri, 20 Jun 2025 09:05:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250620120509.GA39770@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
 <20250619165928.GA10257@ziepe.ca>
 <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_050512_056754_5ED326E7 
X-CRM114-Status: GOOD (  48.30  )
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

On Fri, Jun 20, 2025 at 10:57:49AM +0200, Benjamin Gaignard wrote:
> 
> Le 19/06/2025 à 18:59, Jason Gunthorpe a écrit :
> > On Thu, Jun 19, 2025 at 06:27:52PM +0200, Benjamin Gaignard wrote:
> > > Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :
> > > > Ugh. This ignores the gfp flags that are passed into map because you
> > > > have to force atomic due to the spinlock that shouldn't be there :(
> > > > This means it does not set GFP_KERNEL_ACCOUNT when required. It would
> > > > be better to continue to use the passed in GFP flags but override them
> > > > to atomic mode.
> > > I will add a gfp_t parameter and use it like that:
> > > page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);
> > This will or together GFP_ATOMIC and GFP_KERNEL, I don't think that
> > works..
> 
> I have test it, I don't see conflicts or errors. What worries you ?

Just looking at the bitmaps I'm not sure? Did you run with lockdep?

> > > > > +static int vsi_iommu_attach_device(struct iommu_domain *domain,
> > > > > +				   struct device *dev)
> > > > > +{
> > > > > +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> > > > > +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> > > > > +	unsigned long flags;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (WARN_ON(!iommu))
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	/* iommu already attached */
> > > > > +	if (iommu->domain == domain)
> > > > > +		return 0;
> > > > > +
> > > > > +	ret = vsi_iommu_identity_attach(&vsi_identity_domain, dev);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > Hurm, this is actually quite bad, now that it is clear the HW is in an
> > > > identity mode it is actually a security problem for VFIO to switch the
> > > > translation to identity during attach_device. I'd really prefer new
> > > > drivers don't make this mistake.
> > > > 
> > > > It seems the main thing motivating this is the fact a linked list has
> > > > only a single iommu->node so you can't attach the iommu to both the
> > > > new/old domain and atomically update the page table base.
> > > > 
> > > > Is it possible for the HW to do a blocking behavior? That would be an
> > > > easy fix.. You should always be able to force this by allocating a
> > > > shared top page table level during probe time and making it entirely
> > > > empty while staying always in the paging mode. Maybe there is a less
> > > > expensive way.
> > > > 
> > > > Otherwise you probably have work more like the other drivers and
> > > > allocate a struct for each attachment so you can have the iommu
> > > > attached two domains during the switch over and never drop to an
> > > > identity mode.
> > > I will remove the switch to identity domain and it will works fine.
> > You'll loose invalidations..
> > 
> > Maybe the easiest thing is to squish vsi_iommu_enable() and reorganize
> > it so that the spinlock is held across the register programming and
> > then you can atomically under the lock change the registers and change
> > the linked list. The register write cannot fail so this is fine.
> > 
> > This should probably also flush the iotlb inside the lock.
> 
> I will try to summarize:
> in vsi_iommu_attach_device() I should:
> - take the lock
> - do nothing if the domain is the same.
> - if iommu is used (ie powered up):
>   - update the registers to enable the iommu
>   - flush
>   - update the link list
> - update iommu->domain
> - release the lock

That sounds believable, yes.. Though can you do the "powered up" checks
inside the spinlock - are they sleeping? Can they be done before the
spinlock?

> in vsi_iommu_identity_attach() I should:
> - take the lock
> - do nothing if the domain is the same.
> - if iommu is used (ie powered up):
>   - disable the iommu
>   - remove the node from the list
> - update iommu->domain
> - release the lock

And maybe flush too? How does the caching hw work at this point? You
can't have stale entries in the cache when you switch back to an
enabled/translating configuration. So either the HW flushes implicitly
or you need to add a flush somewhere..
 
> vsi_iommu_suspend() and vsi_iommu_resume() will also have to take the lock
> before calling vsi_iommu_disable() and vsi_iommu_enable().

Yes, if they use iommu->domain that seems good

If the above locking is a problem then I'd use the group mutex instead
during resume/suspend. The attach functions are already called with
the group mutex held.

> Do I have to switch to identity domain in vsi_iommu_attach_device()
> before applying the requested domain ?

No, that is what creates the security problem. What you want is to
update the HW registers in a way that the HW just changes hitlessly
from one translation to another, then flush the cache.

Jason

