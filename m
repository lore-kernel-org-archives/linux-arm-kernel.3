Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35653CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRlI91H90jnEd6QVhakYzPZr1kG+YnVR7+LXyLJH35o=; b=IveCt4ZIcTAqbGqjNmlWMu9qxf
	fVH4Ov+omDHi7XOCf+Z2BBofpACM/T53+PWiEbxv9rJKD2wdey9iWTAz4puMA8HgBc8/2qXTh/BYm
	WFsyVxO13U6TKP3MJqPVIDwXzCV78gw+O6e//AKvmRuMagTl34cncz4E43MgdZDxBhtQBvoQiF+7d
	nFAetKHLHJU4Z+2E/xpMdqDPBqt/JMvuNkIAkbOV2kCZG4bUmmbY+ELI8XcDQFAf1k9Lk10440pmS
	76+jG4ulfXvJbXJUEWOBCOjxKOO99r0oHX3vUY/AWiYdyFkCKYzkm+UxJ2fmohDfhRaDiL286RejG
	lwB/cu9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXw9V-0000000ASfn-2E0B;
	Fri, 12 Jun 2026 07:18:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXw9T-0000000ASfg-1KoD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:18:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ABF5429E4;
	Fri, 12 Jun 2026 07:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC341F000E9;
	Fri, 12 Jun 2026 07:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781248682;
	bh=HRlI91H90jnEd6QVhakYzPZr1kG+YnVR7+LXyLJH35o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L6MPI5gE1EdULfuqHX9FeI9o0O6WUcgtuZPpWMq+YYQz4NIsNDinQEUyjqduDtf8k
	 l8gWpChVZWxKZ9IMjrvPCyDVpfk/zIqoonwcdK/KvKB29G9P9G+Ph0rCNIgppcmtbT
	 tSZB3ZTQO2faTEcLNza0Ezw0v8mFkL7pakAFNDwxpgSbRIjwf3SDics+Oj8JVgm8OD
	 ni90NHejNjBOTa51A+reb7rCNyc/4Lx5cgSbSeps9eNeHYj/8IMOVwZ6t1VqbCFYeU
	 c/cKA30WUS016DLWHkU1ctyI28rhef6zPLtNPETvTY/tuZClh+qbft/3ltRMCc1ccj
	 ti/5o46qveQ7A==
Date: Fri, 12 Jun 2026 10:17:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>, owner-linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Message-ID: <aiuyoy8Kmr9yU4GM@kernel.org>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
 <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
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

On Thu, Jun 11, 2026 at 01:54:13PM +0000, Brendan Jackman wrote:
> On Thu Jun 11, 2026 at 1:01 PM UTC, =?UTF-8?q?Adrian=20Barna=C5=9B?= wrote:
> > Strip the read-only attribute from the selected memory range when
> > restoring the linear map after an execmem cache clean.
> >
> > An execmem cache clean is performed when a cache block becomes empty
> > after unloading a module. When making the memory valid again, the linear
> > memory alias must also have its read-only attribute cleared.
> >
> > Without this change, the linear memory alias remains read-only even
> > after the execmem cache block itself is freed, which prevents subsequent
> > allocations from writing to that memory.
> >
> > Signed-off-by: Adrian Barnaś <abarnas@google.com>
> > ---
> >  arch/arm64/mm/pageattr.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index 88720bbba892..eaefdf90b0d5 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -239,6 +239,13 @@ int set_memory_x(unsigned long addr, int numpages)
> >  					__pgprot(PTE_PXN));
> >  }
> >  
> > +static int set_memory_default(unsigned long addr, int numpages)
> > +{
> > +	return __change_memory_common(addr, PAGE_SIZE * numpages,
> > +				      __pgprot(PTE_VALID),
> > +				      __pgprot(PTE_RDONLY));
> > +}
> > +
> >  int set_memory_valid(unsigned long addr, int numpages, int enable)
> >  {
> >  	if (enable)
> > @@ -362,7 +369,15 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
> >  	if (!can_set_direct_map())
> >  		return 0;
> >  
> > -	return set_memory_valid(addr, nr, valid);
> > +	/*
> > +	 * Execmem cache uses this function to reset permissions on linear mapping
> > +	 * when freeing unused cache block. On x86 it makes memory RW which is
> > +	 * desirable. 
> 
> Hm, maybe desirable for execmem but that doesn't really mean the x86
> behaviour is correct. Maybe it makes more sense to change the x86
> to align with the arm64 behaviour here?
> 
> BTW we should probably document this API a little bit, I never thought
> abut what "valid" actually means until now. I had thought of it as "I
> can access this memory" but that's an unclear concept and now I realise
> "valid" is a technical concept in Arm that's confusing. And it's extra
> confusing if the kernel API uses "valid" to mean a _different_ thing.

I've got confused too and that's how set_direct_map_valid() got into x86
with a different semantics than on arm64. 

What execmem really needs is set_direct_map_default() variant that gets
nr_pages.

AFAIR, set_direct_map_default() has a single 'page' parameter because it
was added to reset permissions for the direct map alias for vmalloc()'ed
pages before there was VMALLOC_HUGE and each page had to be reset
independently anyway.

Maybe it's time to add nr_pages to set_direct_map_valid().
 
> Also, shouldn't execmem be using set_memory_default_noflush() before
> freeing anyway? I guess that shoudl even be documented as "if you change
> anything you need to call this before you free the page".

It does on x86 because there set_direct_map_valid() is the same as
set_direct_map_default().
 
> > On ARM64 set_memory_valid() just change valid bit which
> > +	 * leave direct mapping read-only so use set_memory_default instead.
> > +	 */
> > +
> > +	return valid ? set_memory_default(addr, nr) :
> > +		       set_memory_valid(addr, nr, false);
> >  }
> >  
> >  #ifdef CONFIG_DEBUG_PAGEALLOC
> 
> 

-- 
Sincerely yours,
Mike.

