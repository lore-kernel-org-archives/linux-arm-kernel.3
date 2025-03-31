Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D527FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=307NQ5zgEQO71/PFvEwiUsP0z5RtZC+rxmdv09WGX8k=; b=VLhEnQg/38Pj4u2EyMyndE8umf
	7yYr8Z9mltLsLaCMZ/qV04lNQhlfPejXYYk6rdv6YGiuXaexDDHn5gmAoTTfpzMfwMZ023P0vnj1E
	OYYEDnkF8HjEc7ti7AbzxFIR/33XA0neieVWgHePv0DNAS6hmysMdK2Fy5zAG8cR340RgWHaE7BTQ
	3foio+5CH5ecO0E690Z77gadXoZjHgHIfOK7Adf6AJdzR8Vn9D4wMUsfLqjvnITW1s6DWeA9lgi6y
	Oq267XWnZxgY9Yur1oEqUAtJRehIDYMFJwPkWerCntFMKQPCC2wkgB/Beev8kFwx6KMzVxR0YvAaM
	4kB2KKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGvm-00000000khD-2Jt9;
	Mon, 31 Mar 2025 15:20:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGTG-00000000dM0-0uDj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BFAF5C3FCD;
	Mon, 31 Mar 2025 14:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6E8C4CEE9;
	Mon, 31 Mar 2025 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432636;
	bh=FTaAsuzDgScULEa02h8I/KNCYnX/qyk7KV1ALoaDZs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shaZyKxLgMY8DS0iCKCgkVYFlABwij1skMdGY9k3ZPmigFjci2tnfEFztXKlJA1bS
	 GEPb5CloQZq2aY9yamsUPgO/kHWjiVvE9z3nFAwVchbx+2n5BgQo5ZJRlywt92MiYl
	 GdGUp1wufn4YUtmHNH8uWQpMyN8q1N0eeahFxUDAmeghZMjM6t+e9uQCgE5JIo1P4p
	 /PGIhT7Ez+s7bYKO8e9qFQdWK6uLhsRYAA+vyHAEfJ3fEwOY4x5gCQnC8so/tvlqLr
	 QVqLlNOihd5SMjkGER2LZoiNBUFPP45NoV1QsKqCQPkocjt9Rv4JAbAtC66S5JnHs2
	 1t9M6BxvlvARQ==
Date: Mon, 31 Mar 2025 17:50:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 2/4] memblock: update initialization of reserved pages
Message-ID: <Z-qrtJ6cs-kXpepR@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
 <20210511100550.28178-3-rppt@kernel.org>
 <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_075038_365193_B4ED40E4 
X-CRM114-Status: GOOD (  28.35  )
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

On Mon, Mar 31, 2025 at 01:50:33PM +0100, David Woodhouse wrote:
> On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> >  
> > +static void __init memmap_init_reserved_pages(void)
> > +{
> > +	struct memblock_region *region;
> > +	phys_addr_t start, end;
> > +	u64 i;
> > +
> > +	/* initialize struct pages for the reserved regions */
> > +	for_each_reserved_mem_range(i, &start, &end)
> > +		reserve_bootmem_region(start, end);
> > +
> > +	/* and also treat struct pages for the NOMAP regions as PageReserved */
> > +	for_each_mem_region(region) {
> > +		if (memblock_is_nomap(region)) {
> > +			start = region->base;
> > +			end = start + region->size;
> > +			reserve_bootmem_region(start, end);
> > +		}
> > +	}
> > +}
> > +
> 
> In some cases, that whole call to reserve_bootmem_region() may be a no-
> op because pfn_valid() is not true for *any* address in that range.
> 
> But reserve_bootmem_region() spends a long time iterating of them all,
> and eventually doing nothing:
> 
> void __meminit reserve_bootmem_region(phys_addr_t start,
>                                       phys_addr_t end, int nid)
> {
>         unsigned long start_pfn = PFN_DOWN(start);
>         unsigned long end_pfn = PFN_UP(end);
> 
>         for (; start_pfn < end_pfn; start_pfn++) {
>                 if (pfn_valid(start_pfn)) {
>                         struct page *page = pfn_to_page(start_pfn);
> 
>                         init_reserved_page(start_pfn, nid);
> 
>                         /*
>                          * no need for atomic set_bit because the struct
>                          * page is not visible yet so nobody should
>                          * access it yet.
>                          */
>                         __SetPageReserved(page);
>                 }
>         }
> }
> 
> On platforms with large NOMAP regions (e.g. which are actually reserved
> for guest memory to keep it out of the Linux address map and allow for
> kexec-based live update of the hypervisor), this pointless loop ends up
> taking a significant amount of time which is visible as guest steal
> time during the live update.
> 
> Can reserve_bootmem_region() skip the loop *completely* if no PFN in
> the range from start to end is valid? Or tweak the loop itself to have
> an 'else' case which skips to the next valid PFN? Something like
> 
>  for(...) {
>     if (pfn_valid(start_pfn)) {
>        ...
>     } else {
>        start_pfn = next_valid_pfn(start_pfn);
>     }
>  }

My understanding is that you have large reserved NOMAP ranges that don't
appear as memory at all, so no memory map for them is created and so
pfn_valid() is false for pfns in those ranges.

If this is the case one way indeed would be to make
reserve_bootmem_region() skip ranges with no valid pfns.

Another way could be to memblock_reserved_mark_noinit() such ranges and
then reserve_bootmem_region() won't even get called, but that would require
firmware to pass that information somehow.

-- 
Sincerely yours,
Mike.

