Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F2AC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDjgTbE6npl3ZujjcO5BO0pJ+G7Th/Ah/Rj5MPFfgH0=; b=3PBtWj2E52KSy829+EYbUtIxRQ
	Ntn5cnU8S8PdeIBSGubS5lNTXeY5AZ+XqqQLRJ4jPBdhXg/ylajiLi7haeUNZKNykyIVYgAwt+ORi
	FgTwZw6zfFnvOM5lxlkWPiiM0bQOVjOB9ni35U1kJWBddkIU7xEl+pN9RnJNypQ67IjecfEL4ZcDV
	WQ4ebzawRGmPLeYWv8aekmdJ45Q1V/rOxgZkaaOmkh9KE0dXbV9oSTmzLE8UuBrUt94B2eUskobJ6
	bafeC00W9h5H7w38K1DykFc4tQNOYvpFhDqoRdnuU2Qm3z+WR1niItodlPoNQZkUX6Hjxon4AaAYO
	G6jVd9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndQg-00000000Rs7-0Lc8;
	Sat, 25 Jul 2026 14:32:42 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndQd-00000000Rrf-2XP2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 14:32:40 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-97715c7df46so307196241.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784989958; x=1785594758; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDjgTbE6npl3ZujjcO5BO0pJ+G7Th/Ah/Rj5MPFfgH0=;
        b=Ue1lyGOFEQhgaaTB7G8Dq3gAWuq53ZlxY8jGzhTS1/JZ47IdmeKv7T3VxOQt+oRFjy
         wR2JVUqzhAwLHxqb88mF2ji5xeXdSf6tL4A99+AG66BbamNCBojcytNORMcfR/Vpz8IB
         f1j8y0tbH0ZvOHhiZ+69FrEXTMcnWhk2+j2BVbgj+8vKTWFYMsKcTghnT7RlMa5BgQMH
         ORtEFRA2E1CoEZpM/Zbex1ROYuOv7BsqoIeRIPO+s7ndpRaOspxWfsITqx1EY7oefZna
         UQxnaWLpD+xbp7+XkwwFHsDjbmnVZ4oax89u/KEWZLyfGn6SN0ODyJEugEg8G1lcY9Ik
         cI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989958; x=1785594758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDjgTbE6npl3ZujjcO5BO0pJ+G7Th/Ah/Rj5MPFfgH0=;
        b=I346xIInkvn9t5Jhe2cTTYeH/zAXELuxg20+yoZr+8hwhZqg1QfX2Kti/CqwJLCZPa
         3PnT2ddnq7FUp4OmuERnVJA3i5fbKZSMPPpKVQ4jldbDBmEjKIDgtt1KL1rYc9tcwozt
         ooY5EvoT7S/bZn7ec9dtoTnq/nAY/4jEqGrh3IbxGUxv+MvwyaDJFnRq4F4RIwxIraNl
         3IL5mSqDU7aiZeYvSrpQFx4GR8peaXQLr4eQowjLM0kUlo9q+FCSNLpDUlHYkjC8VFrk
         NHhHtWXaFVlmnHhS7DWytVuGLJBFg2n1qM94BCbdcOryKmONQWffdhXPpjSOD4NBxFk5
         LJ2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq814PFf5bH152fdtH3MCLpz2yWyQaTN1qAoYw9LavHIsbV+w0MCxlc9d4ZgEhLm4/4Ss++mRPANDqXNEgt5X++@lists.infradead.org
X-Gm-Message-State: AOJu0YxZyHa2DoiIjiVAb0ejNolcFeC9gmOx8HeqdBhMojCwF/MaKJSj
	VwY6tq5zCppxIlzhYO0zq1EwScg78aJdx3ip4DjG5AU2H0tBkiNImybojb4353Oy+SI=
X-Gm-Gg: AR+sD10mSR1BZgUl5DvrYLhJx/vjDTx3oUx1Ats7Ar/QqVj/6O4AiuzmUYRLBnO7LgA
	dC2ifXUEN/2ts3ocm1GUW8XlxWAcgDygjuB8aSboaHrK/g7CvWEs1G0Iml9xRbn9qkENqSfamxW
	zC2N9Z45TkNJ8PhPpdnpI55EY/Lp7V8Hy/wpPZzJXM0VEznWuE4gY0StzeuzkU0YF9Fbza9MKbH
	MgKXQBdMvCrtugWwel+GyEowC589hwzxniqjaHNpUvhw8FF2oFTN7NAO6Gd8/SKdUMTszrhoxpG
	XSfFtCXBvVVmixl2/NRdNFBOyEy7FzciRQcXAE9Em9f2eBctI4XSVAY/tINwgYc6wEsQ44BTlSq
	RQNTn1Cb1dB7Bt//UpKELrGUXfB70nxb8LtEpqaXve/1jIjVq+km+LZlAlmTOON4=
X-Received: by 2002:a05:6102:5794:b0:74a:b5e3:e96f with SMTP id ada2fe7eead31-7503e26761cmr1503853137.7.1784989958188;
        Sat, 25 Jul 2026 07:32:38 -0700 (PDT)
Received: from ziepe.ca ([12.18.163.234])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-750362e67cfsm1546647137.8.2026.07.25.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:32:37 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wndQX-000000000hB-3EP5;
	Sat, 25 Jul 2026 11:32:33 -0300
Date: Sat, 25 Jul 2026 11:32:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <amTJAXNy9fGFrve6@ziepe.ca>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260721124056.GK110966@unreal>
 <amEglRH3u6UFFnIQ@ziepe.ca>
 <20260723075108.GB110966@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723075108.GB110966@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_073239_718561_FA9E60EE 
X-CRM114-Status: GOOD (  15.23  )
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

On Thu, Jul 23, 2026 at 10:51:08AM +0300, Leon Romanovsky wrote:
> On Wed, Jul 22, 2026 at 04:57:09PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 21, 2026 at 03:40:56PM +0300, Leon Romanovsky wrote:
> > 
> > > Why don't we continue the effort to remove "struct page" entirely
> > > from the DMA API internals?
> > > 
> > > IMHO, everything not exposed to DMA API users should use
> > > phys_addr_t, including the DMA address pool.
> > 
> > The alloc interfaces return a struct page, that is why this stuff is
> > organized like this. Look at dma_alloc_pages()
> 
> And I didn't say that we should change dma_alloc_pages(). It is external
> API, which needs to be struct *page. I'm talking about internals.
> 
> Even dma_alloc_pages() flow shows how convoluted and non-uniform
> the code underneath which performs translations all the time.

Yeah, but I don't really want to go from phys/virt to page, I'd rather
see the other direction that is easier to reason about

Maybe some small wrapper that returned phys or whatever would clean
this up

Jason

