Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C2BCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StlCUTUicQISJ/bWwbWkmSHhXapLgWFJJHXk0oHb5Ig=; b=tpPOhIwhQinVKbjDQDprcxvmMf
	hwndu5itoum7DrUxa4a3zhFvcDc/tfWXY8nll/pLHJBZq6gtlE0LAKrtnrHxDIeCa3pQl3JdXwVoj
	YOVInT8d1edVjI0uFFsArBnKcHVOooBAIA1i4EJ+EE0naEVxWa+4MYA49YVHoRtVRBxtR/vVuXz0Y
	muEM1BSEwj/2B66+xrTUpoUqhHabyLftVbUrBJGvfRidZmweRLuq6+FW83cFTVnL1jvQ8gO+Y44MD
	aClgxQdZA4LskiT7ANqrzGg/19l7EDUOWG/e0y8mZNRl7JlM1lW8hTb4yh5gKHTCrwkeNiKfJYzCp
	5DN3PJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXwK-00000002Mda-3jwu;
	Fri, 19 Jun 2026 12:03:16 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXwH-00000002Md1-3hEd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:03:15 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-728e2e57e27so1041549137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781870592; x=1782475392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StlCUTUicQISJ/bWwbWkmSHhXapLgWFJJHXk0oHb5Ig=;
        b=Sa2Urls0kw9UQc49tky/qxRplzd68FKzXvt/Ht+j2i2V/ycJ1yirOl0wwFgXSlF5mU
         rm7OE7+J3StwGv/vUnoXm9BczMd2xj5DdtvQfbdC75LYHUl6n5c2q4ejhMxgLEOcYtv+
         Hy+N0MXfa8esg8jrBOF90EFha2EzzIW6QwUN6b0bHV/l6OrluDQZW1U27sgkAMzNkAum
         Rba8MGShhMqQL8+CmnFc1ct1NqT0LAK5zXtM++5iqosP0tIgWdTqY+VI7/RKbcLr/T4s
         xU16xp/ZEupbSWEUg6g1tgcdTKyKlElJUIStmweNoc6St0RXBmqoatjW1bzvgXPf55Fy
         0TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781870592; x=1782475392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StlCUTUicQISJ/bWwbWkmSHhXapLgWFJJHXk0oHb5Ig=;
        b=nD7dGzuRH4biHFPWazzimIIwVfZknO4dkdDrGI1qthmdrVCvArD9MBrv+6r0FDPG0d
         z50KKfg/kLi/yEBUAxpOKv27NP47Mv14P4ANV++J5fFigu4DFZCOwy20mITXLMhrY/Aq
         adsUH8voYVWxjqaCPgoOG/9twToqMwOu4Q+q6Jnj2vhL1gWNJI0n55zalnbIyvwHk4vw
         pQuAjfXr2MYiMEJZXhDBnAI+TCggrFWMjpnRWx/faMFwQ+fnj3veAU/S3XdRagHdyVi8
         GNLjK0uAOdi419O29ImCzG/PI00oYo7fhyxxE6KORIG8DGcW/hWPyBl5YwpEgu47IahC
         t4iw==
X-Forwarded-Encrypted: i=1; AFNElJ8qCzOwS9cSsmoQS+bttwo0fF2fEtJyWpBeL5MWnYJ/6hwl+oVSIo6GFEI0TT/tjb13sK7/pnHaJkReHsI/VaY6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/gpWpdn7kNOFkB0HvwVHWp1BQrZKm3hWww8fhd/0wu5GHfNTU
	evzHE3Vu4GeTZhm6lE7DDLMtO+s+D6rlY3gJ4RduC/vMZGZ8eyvT5SVo7sn2w/4R5b0=
X-Gm-Gg: AfdE7clrzCEHMty40r80tJMz8lxMVxphS0nTZD2MBYaOgdiFMmLvmpdyAMaI4VNxrBN
	1RclE829NT2sxnOeWcD/f0H4DciMP9b6V0GO0FpJ026dhY7icJQRWtufVTEq7qWhxA2hIgM14AQ
	PWGh6yXhf3RvCrkXKo7zCwqI3bEaWx05aEZ8x4N1C7IAVNZVixjmyye/NEtbPwvzSZsQCN0fN9w
	1lDbhIjZzgnBlP4JJX3GrAmreypbtAw9KkC3XZBzDgmt/vxi6R3pM4UgQNjsWIvg5Ua8VqhpxB1
	07gIT4iwWw6HwYAct9gHDsu96geEU8Hixx3sLSVT5R2Y6uXpHymML3m8daSedgOLihspJrmJGrT
	VpbQcGStPg3ytjfKjuo1fgWJogu8Hae4qeEmkWyaHgKwTJbhi3gsD5tHEmA/IrcIH8Y6tCnrw5o
	Aju8al6xjwaf5gi2s2S45T061F40rrQTuSzmW87U4REbgNflmMPrdr35jOECikT9yZKK2KYRVvo
	zR2hQ==
X-Received: by 2002:a05:6102:c89:b0:729:213f:76ca with SMTP id ada2fe7eead31-72a20215eaamr1999509137.29.1781870591985;
        Fri, 19 Jun 2026 05:03:11 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a424f817sm215731985a.22.2026.06.19.05.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 05:03:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1waXwD-00000004SQK-4AfU;
	Fri, 19 Jun 2026 09:03:09 -0300
Date: Fri, 19 Jun 2026 09:03:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260619120309.GI231643@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
 <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <d4ef9a9f-18d9-40e1-9d02-87aeb9cb6540@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4ef9a9f-18d9-40e1-9d02-87aeb9cb6540@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_050314_117880_C3139435 
X-CRM114-Status: GOOD (  27.96  )
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

On Fri, Jun 19, 2026 at 12:05:45PM +1000, Alexey Kardashevskiy wrote:

> > > > > IMHO that's an AMD issue, not with the design of this series..
> > > > > 
> > > > > The series is right, a device that is !force_dma_decrypted() must be
> > > > > considerd to be a trusted device and we must never place any DMA
> > > > > mappings for a trusted device into shared memory.
> > > > 
> > > > swiotlb=force forces swiotlb, not decryption.
> > 
> > If force_dma_decrypted() == true then swiotlb must allocate from a
> > decrypted memory pool. It is right there in the name!
> > 
> > The hypervisor environment should *never* set force_dma_decrypted()
> > because all devices can access all hypervisor memory, up to their IOVA
> > limits.
> 
> True. But we do not have encrypted swiotlb pool today, right?

"encrypted" is just normal struct page memory, that's the default for
swiotlb.

I think it was a big mistake for the AMD SME stuff to overload the
decrypted/encrypted CC stuff which should mean shared/private in a
guest context to also mean things about physical memory encryption in
the host. It is really confusing.

The SME side is just a bad arch choice, the real world doesn't work
well if you set high address bits in your dma_addr_t. I think AMD
needs to use those restricted swiotlb pool where it allocates this
very special "SME Disabled" memory that will have a low
dma_addr_t. Then alloc and bouncing will get memory with a suitable
dma_addr_t. This has nothing to do with force_dma_unencrypted() which
is only a CC guest concept and nothing else in the OS should ever
touch decrypted memory.

> > And this is more insane logic. The right fix is to allocate the
> > swiotlb bounce from the *encrypted* pools when running on the
> > hypervisor which requires undoing this abuse of force_dma_decrypted().
> 
> +1.
> 
> But how does the kernel decide if it is this swiotlb pool or just
> some page which happens to be below the IOVA limit?

You mean in swiotlb_tbl_unmap_single() ? It checks the address against
the pool's range?

> swiotlb can be for bouncing (with all these dma_sync_single_for_cpu)
> or, if dev->dma_io_tlb_mem->for_alloc = true, for coherent
> allocation (no need in dma_sync_single_for_cpu).
> 
> I am looking for a way to set up my "sev-guest" device such as when

Whats a "sev-guest" device?

> dma_alloc_attrs(snp_dev->dev,...) happens, it allocates a page from
> the shared swiotlb pool (with no actual bouncing) and there is no
> obvious way to trick the DMA layer into doing that.

Why do you need this?

Jason

