Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F521C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrBPfnLDD8eQ7eCQ6RhRSXn0CPQXVWcRtTZW3fZ/anA=; b=ZBlXSnpgyB4tHkZVU2U1mb5Cvq
	ZHClFT6Aq85fOjRFU9mEt02MJltT0yA2D102OCcNJz3OSZfQs9E3cpG1/9LnmRdjxIXH0rDjzgXRO
	/HCsMMwlYCq2gYIA+hUsdDj0b08qZZ2IHquYFIuyj0MRHM0pWk25V3ALDDEMpAFyBU9VCo3koHp0T
	h/Mrwm81i9A2TBUXCuXYEjxPfdPQwRjcnOREXC75Fuq812RE5RDKv5j1AcHjpGYw4z4fz1rlcLekm
	Z+KVyMhRYu8tOMQ6xQ5wtkeAeAzi2uQXhwJbOkTNJFW/Mf9viUvKtRzUXh5oshhvEEIHxi4GB2phP
	CG93DgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcAl-0000000BuTf-31NZ;
	Tue, 14 Jul 2026 12:23:39 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcAj-0000000BuSv-1kSC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:23:38 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c167c58f2so28277281cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784031816; x=1784636616; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XrBPfnLDD8eQ7eCQ6RhRSXn0CPQXVWcRtTZW3fZ/anA=;
        b=Abjl8gL4fead3X5dVaOr0zSV4lyDy/0oQ1N76wvYHqbPQW8GNXD4pe5F7BKrmyaRqV
         Gmhr6m38B7LcPGBxrJP6geZ3p7IIxpzA54Emnah/AZgdbp1hvDCxLR183W4lybekne3I
         nFwgxaoB+mIbhEfo0id6GQrhJebVDVYNuM19lwuUHRyeqIVdgZRT/a3Inlq3HmL1+3KA
         n5sC1jOPVXW1h0Hcufx6SG9myqJ9GqKpGZJRt6ENzfEoLXuKwYvXIVJWBIODta1xmqAx
         +yB0tL43yyzlwYPzJv77MLiqpzr4xJm3LCn5yrocaIrh327bK0/1yb369P6Ql16ty01P
         r7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031816; x=1784636616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrBPfnLDD8eQ7eCQ6RhRSXn0CPQXVWcRtTZW3fZ/anA=;
        b=NOQZUlmDrXiYAVzdyT2rzafuVNF4MI9swS/uAVyQ0QRl2rWvRyo9DUiOyw7wPjrDk7
         /1XiWJjZr4soSJtmVX9Sf/46gqjhWGOjGG8xasg49s9ybz+WLCCHdk4WoulN7xYmbAHR
         0+7IiGRZ2M6vIRsSAhmgN9IlvrHJNJBKVO7MrZkZrarRXKfsQvFbrJLFv3QoyQH9jHEF
         HvkzjONKRlw6IWjLRf2c0KfWp6gr5rHCBGoH8lz/P7yxER1BGWa08Zp0Zsi/BXZEnIiY
         Seo1viwDepzcUFySb51uKrVYGunq2PptBt81qOzaNLZL+KWjKjFlxHxf7A/AYqlvDxy0
         QNlw==
X-Forwarded-Encrypted: i=1; AHgh+RoB8yRY+BwriGi6zFT5j13fQd9fT4ACX5wnHQaypi5piQFUOuK79dGxGREn+dm1c6H16dMa2r3Pczr1N4Q+Lziw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6zXbnJlh66DsjGPXNzy8hblxMLbt4DC7+NnD19W/YSuVYq/Ne
	umgFcK/2P58isF0ekk4pZBT5CkBR7CXU/cGslbw4oYBTGGX7c/X8t9P1AJc614VNh7A=
X-Gm-Gg: AfdE7cnyj4BMO7R6ymvg1CgMgUwGCd1KmT9f6KLtAiez0gY8e9UHNYlx4rNP3UmouZ/
	iSFis5F7UlASAM+2nUjuRs1rrEFe/nxU1OJ8DvhVog4RDTYG6nHwVdB+C8FsgDP34lAb57t0Bo4
	xuWbXNcEZ5hzIQ2n8kmPGwABHSLQ/isfEihlcbafLOIGTut4UG+v2JznluVkzff8oCWfaFZNS7g
	QMPb2lsAG/33CvQaR2iY7aMCM6VRq9+wlJWnLeXjrzpugZMzmgYMU7mP3nR4LnNqJLhPRYf9IK/
	bBdEELPoAbsINMJ+dBP0/gZ6hUV8ubpNvXhlLPe4EkpCWwA4v2Xa3ICfS5CeHPDReuWf/cpQw6D
	er9aZJiTQDqmfB7nCMAG9W9ScSBGLD6wFGuzPApKtZnEZvsJ29yIGhHwqFXdv
X-Received: by 2002:ac8:578b:0:b0:51a:8c97:9375 with SMTP id d75a77b69052e-51e42494cb4mr15995711cf.61.1784031816150;
        Tue, 14 Jul 2026 05:23:36 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacad30asm109896611cf.9.2026.07.14.05.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:23:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjcAg-0000000FRbN-3RTk;
	Tue, 14 Jul 2026 09:23:34 -0300
Date: Tue, 14 Jul 2026 09:23:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 04/22] dma: free atomic pool pages by physical address
Message-ID: <20260714122334.GF3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-5-aneesh.kumar@kernel.org>
 <20260713181059.GL3133966@ziepe.ca>
 <yq5awluymdf6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5awluymdf6.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052337_472729_5BDF2890 
X-CRM114-Status: GOOD (  31.15  )
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

On Tue, Jul 14, 2026 at 09:27:01AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Wed, Jul 01, 2026 at 11:19:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> dma_direct_alloc_pages() may satisfy atomic allocations from the coherent
> >> atomic pools. The pool allocation is keyed by the virtual address stored in
> >> the gen_pool, but the pages API returns only the backing struct page.
> >> 
> >> On architectures with CONFIG_DMA_DIRECT_REMAP, atomic pool chunks are added
> >> to the gen_pool using their remapped virtual address.
> >> dma_direct_free_pages() reconstructs a linear-map address with
> >> page_address(page) and passes that to dma_free_from_pool(). That address
> >> does not match the gen_pool virtual range, so the pool lookup can fail and
> >> the code can fall through to freeing a pool-owned page through the normal
> >> page allocator path.
> >> 
> >> Add a page-based pool free helper that looks up the owning pool chunk by
> >> physical address, translates it back to the gen_pool virtual address, and
> >> frees that address to the pool. Use it from dma_direct_free_pages() while
> >> keeping the existing virtual-address helper for coherent allocation frees.
> >> 
> >> Tested-by: Michael Kelley <mhklinux@outlook.com>
> >> Tested-by: Mostafa Saleh <smostafa@google.com>
> >> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> >> ---
> >>  include/linux/dma-map-ops.h |  1 +
> >>  kernel/dma/direct.c         |  4 +--
> >>  kernel/dma/pool.c           | 54 +++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 57 insertions(+), 2 deletions(-)
> >
> > This seems pretty suboptimal?
> >
> > If !CONFIG_DMA_DIRECT_REMAP then page_to_virt() was used to compute
> > the genpool's addr so dma_free_from_pool_page() can use the same
> > logic, which is how things must be working at all today
> >
> > The CONFIG_DMA_DIRECT_REMAP scenario does look broken, so I'm
> > surprised there isn't a Fixes line on this commit? I don't have an
> > opinion on the search, but since alloc_pages() is used there is 8
> > bytes in the struct page that could be used to store the remapped
> > vaddr to avoid the search if someday someone wants to improve
> > this. Maybe a small comment hinting that direction would be a nice
> > addition.
> 
> Something like
> 
> +/*
> + * FIXME!! We could avoid this by storing the remapped virtual address in
> + * struct page and using that for lookup.
> + */
>  bool dma_free_from_pool_page(struct device *dev, struct page *page, size_t size)

Plus some if (!IS_ENABLED()) that does the direct lookup

I would just use : not !! :)

Jason

