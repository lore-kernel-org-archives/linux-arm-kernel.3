Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F64CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UW5JYVSwrnBAFt5psB8n67PnIhkPqJ98B0eIWZFk1Os=; b=kGGGUBffUxV4sioaFkHFniRfRT
	2Fck2Bm5eIv0VNkX0Nr1OvTAk5FSQ87+NfWl+l3aUndb6I2WUIgAS7aMoKipajb0EI7J3zxo65SR+
	svwafRvqxemwi6gCYgG2vbax7IcZm+JDwLGoi29p79NlmDVUEpj4ni8Zvm6R37y3CYsnS5Ffb2IFW
	S+ukMKlTf/saXuKYvESxWGjWGdA5yHJNbzkumleYQ6H56JVUvDrRkD5XfIYz5Fp1rXAQDk6UICTzZ
	sfXg80Yjlh9HFGYHL1SD+fEvN0MNSpnybtaqqGmfk3AEGY/9iFKac+RWVuaCpEZT7bbpirR9nTCDB
	2J+gn5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2vP-0000000BDxO-1nOv;
	Mon, 01 Jun 2026 13:43:27 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2vN-0000000BDwn-2zOn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:43:26 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8ce9df31840so11369216d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 06:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780321404; x=1780926204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UW5JYVSwrnBAFt5psB8n67PnIhkPqJ98B0eIWZFk1Os=;
        b=Yrq0cDCW0kbkpzA9F66H96u39fTxILYag1B7cdZJEno/rbSF4weqS6r2finORfJdp7
         23YR9nq6No0HSzOKHC6KqQrYaEPAXFMqUJp2ssj4mUYgseClrhmxE42lJfUogeeVPF8R
         ecJLly54qqYCR1An8ztnGS1475KlBN7uHzbvgWEGnF+qVF4SAx5N5Zg9VHDPitPJIx+Z
         KuSZQS2gvfMFLdJQYthhgbR1Qa6TVArbtuuc+IzfW69hbSxkj91fQmlLbNAircQyQ+QD
         95zIp1jur+KHS4mWenBvYqEk++j+UhwrTgR4UhP82bRom8Mm4dItJafR8oJ1iJSQJiR0
         9Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321404; x=1780926204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UW5JYVSwrnBAFt5psB8n67PnIhkPqJ98B0eIWZFk1Os=;
        b=dlBGbWl8Tbj7QeDeAqF7/j0xL31W7W0VcYYyXOQ4gw9yHLotCIgwtR94C6lyxErWxC
         a/vXtjWj8p4j9rYR5ETejhnJD+UJvInhN3DwkNTDzilwbjCAtPwQ//u833dvms+kFL9F
         7ZVttRrYzMY4SkKw6h1QgbZ5GVOequRYZY5wR7E2c+UPu1JyW0Jm5h8MPpsKYAxZwD7/
         YvMBCN+J/lfcdp5M113sH4fOVoo8RTQYiF+dG85CiYRqgglcnW2EpMiMaUpSk0A+D/AR
         J7+etmqiRiOM/iAlT17E9Fi85PrjhHGqAh6EO/AZ5fh+aSvxWS/Y+iYcvz2eZQAMrVZd
         kd9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/0SBJxsqgBhEKrAgS5Wx0TwAAjpODRNlAzjPC+AByajTlyaRyIShcO3vO6AAPVS7j5RI8RlMqQ+lDRJdSaXlYX@lists.infradead.org
X-Gm-Message-State: AOJu0YwYMS7SmZGDnTdpqnw3zVSC1dOx6pXXfQzsnGAKs37z08GDGKw1
	G5GN9o26XHAuG2JT/sS/wHhnQRVBjXdSozeXUBau0iJosmWr+a6ThBlPvdYoFtkfAmw=
X-Gm-Gg: Acq92OHAj18JaUh90IOoRZDuKHZqhfrvteyS2OTjme4IEJnYQu3blUI7tlIww8fC/zY
	amLSsRZAf+xCXq27Df3OFY/KT/04PtwFNv9jphDurmhPO0oXJT2hu4z1h2/W+w4fCmeW0x5P1WX
	5ze8GU28YAy1BYm7aKrFxbpgyEAZrLS/YgIs22caFdQslH2dEe84Ez6d9USNKmRQ09vdF4k+LcG
	NfeC0Nus5LRw6RqvEJYMpF8zCASReTyySgH0xJa2Vloese0HoNBnyix0YU1NKCe2EU/HsjAZh6d
	u1w5N3fKfFcO+5kpezJdlr61NhXTf1hZjtEbHaOHfby/x7bXpnyYzThBle+K73h0xgJd18/L8kP
	xs7E8QR4O4LxnyuefMV0qU/UhsdJuhD2IFGz4jDobOpFEYP8M2UneZVHmMp0IhkanudfZYVVHQH
	Q3wHxYNjT8rNVIazrVlJMhbRMFRyGZ8N8mq2IKNeZ+PmqCLaSuElTQ6pr0z6D6NZCESGatKIfbw
	H1DEi8dogDA8mku4Reuv/n+7+0=
X-Received: by 2002:a05:6214:2e41:b0:8cb:fd76:e904 with SMTP id 6a1803df08f44-8ccefd62159mr193200966d6.17.1780321404292;
        Mon, 01 Jun 2026 06:43:24 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea042373sm94107096d6.9.2026.06.01.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:43:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wU2vK-00000001iEk-2KA6;
	Mon, 01 Jun 2026 10:43:22 -0300
Date: Mon, 1 Jun 2026 10:43:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "guanghuifeng@linux.alibaba.com" <guanghuifeng@linux.alibaba.com>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
	adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, alex@shazbot.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org, xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com,
	alikernel-developer <alikernel-developer@linux.alibaba.com>
Subject: Re: [PATCH 1/9] iommu: introduce iova_to_phys_length in
 iommu_domain_ops
Message-ID: <20260601134322.GY2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-2-guanghuifeng@linux.alibaba.com>
 <20260531235148.GV2487554@ziepe.ca>
 <a0875d9f-4aed-4164-861c-6fbbdfe04080@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0875d9f-4aed-4164-861c-6fbbdfe04080@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_064325_824670_9E3B7B94 
X-CRM114-Status: GOOD (  28.77  )
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

On Mon, Jun 01, 2026 at 04:41:48PM +0800, guanghuifeng@linux.alibaba.com wrote:
> > > +/**
> > > + * iommu_iova_to_phys_length - Translate IOVA and return mapping page size
> > > + * @domain: IOMMU domain to query
> > > + * @iova: IO virtual address to translate
> > > + * @mapped_length: Output parameter for the PTE page size (e.g. 4KB/2MB/1GB)
> > > + *
> > > + * Like iommu_iova_to_phys() but additionally returns the page size of the
> > > + * PTE mapping at @iova through @mapped_length.
> > > + *
> > > + * Return: The physical address for the given IOVA, or 0 if no translation.
> > > + */
> > When introducing the new function I would like to fix this 0 error as
> > well, it should return PHYS_MAX for error
> 
> Implementations such as arm_smmu_iova_to_phys/DOMAIN_NS(iova_to_phys)
> all use a return value of 0 as an invalid state, so 0 is used as the
> representation of an invalid state to maintain compatibility.

I know, but this bad choice has already caused bugs so if we are
changing everything I would prefer we fix it.

> > > +phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
> > > +				       dma_addr_t iova,
> > > +				       size_t *mapped_length)
> > >   {
> > > +	if (mapped_length)
> > > +		*mapped_length = 0;
> > > +
> > >   	if (domain->type == IOMMU_DOMAIN_IDENTITY)
> > >   		return iova;
> > >   	if (domain->type == IOMMU_DOMAIN_BLOCKED)
> > >   		return 0;
> > Any domain that doesn't have an op should fail, blocked is one example
> 
> In accordance with the implementation of iommu_iova_to_phys, it returns a
> phy value of 0 in invalid states.

Detect the invalid states by looking at ops not domain->type

> > I suggest you approach the patch plan a little differently, the first
> > patches should implement the new function and an iommput
> > implementation
> > 
> > Arrange things so the normal iova_to_phys calls the new function if it
> > is available and discards the length.
> > 
> > Then convert callers that can take advantage of it. Have the fallback
> > path also compute the length by iterating internally.
> > 
> > Finally one patch per driver implementing the new op, this could even
> > be a second series.
> > 
> > Don't remove iova_to_phys(), it is fine for things that don't need the
> > length.
> 
> Does this mean retaining the iommu_iova_to_phys implementation but
> implementing it through domain->ops->iova_to_phys_length (mapped_length is
> NULL)?

Yes

Jason

