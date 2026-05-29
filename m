Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EBCCD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JUtOsCPfuOe2T57OFW29f3zVWa3oduKvxfNw4LBbDU=; b=gOWGxGDxNzHx6xKNYXrmAYsbbF
	I6YQjHjaob0sia4scmrg9z/NHszXdE4Gr6d15bX9TqLRiYBwNN1sB5ShXVGwytP9MHl7/7DsrOqqK
	vp3htzUN0Ees5dDOoDc8HMFZ8RPppn1bIOe2Hg/uV4KGlW2BrGa/6ipcJItCv5+finwzXHhdhY9uu
	uEOyIKE1knx/czyjgoUkqHhsM7IJuQBNSO50JJEZYFAUD7hjqwaRn/dmttfpOZ3VbVDQJRsTFHhzB
	F131/MqVTN3GvBebTE5D988Np6DySIBh2IS32waAIq03TOrJqSxIPyReZxmDVqW2nvS3gcEqEEfyr
	+IYXxwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwBe-00000007Mmp-490j;
	Fri, 29 May 2026 12:19:39 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwBc-00000007MmH-1EPM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:19:37 +0000
Message-ID: <cc9a1cf7-7b96-439a-b0be-ecdcf27b5da5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780057163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JUtOsCPfuOe2T57OFW29f3zVWa3oduKvxfNw4LBbDU=;
	b=fsyMd7lc9DQWXIHngNY5FbL4hfa4iXeIt4xrx/a8WeY77abOL0ewWlYq5i/6PQo64jta31
	njPwicrvQwHTWf78VemGoFKHoY5hfsw8kO1Y2PGbihOQfAlDz/yqSGHvh1U/xBAkCMNMhj
	VEkYggS/8GX7N7hbpteEHqhIOIGciSc=
Date: Fri, 29 May 2026 13:19:03 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/2] mm: use mapping_max_folio_order() for
 force_thp_readahead order
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc,
 jack@suse.cz, Andrew Donnellan <andrew+kernel@donnellan.id.au>,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com,
 kees@kernel.org, kevin.brodsky@arm.com, lance.yang@linux.dev,
 "Liam R. Howlett" <liam@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, ljs@kernel.org, mhocko@suse.com,
 npache@redhat.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 rppt@kernel.org, surenb@google.com, vbabka@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@pedro-suse.lan,
 ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 kernel-team@meta.com
References: <20260528165635.2068012-1-usama.arif@linux.dev>
 <20260528165635.2068012-3-usama.arif@linux.dev>
 <ahlh2vdHEGo6ZSot@pedro-suse.lan>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <ahlh2vdHEGo6ZSot@pedro-suse.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_051936_487614_50C9123A 
X-CRM114-Status: GOOD (  36.78  )
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



On 29/05/2026 11:01, Pedro Falcato wrote:
> On Thu, May 28, 2026 at 09:55:20AM -0700, Usama Arif wrote:
>> The force_thp_readahead path in do_sync_mmap_readahead() is gated on
>> HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER and always requests
>> HPAGE_PMD_ORDER / HPAGE_PMD_NR. On configurations where HPAGE_PMD_ORDER
>> exceeds MAX_PAGECACHE_ORDER, notably arm64 with a 64K base page size,
>> VM_HUGEPAGE mappings cannot use this path and fall back to the non-forced
>> mmap readahead path even when the mapping supports useful large folios.
>>
>> Keep the existing PMD-sized behavior when HPAGE_PMD_ORDER fits in the
>> page cache. When it does not, enable forced readahead for mappings that
>> support large folios and request an order capped by both
>> mapping_max_folio_order(mapping) and 2MB.
>>
>> 2MB is chosen as the cap because it matches the PMD size on x86_64
>> and on arm64 with 4K or 16K base pages, so the size/memory-pressure
> 
> 16K base page size's PMDs should be 32M, no? Am I misunderstanding what
> you mean here?
> 

Yes, should have just said 4K. Messed up when rewriting the commit
message. Andrew Thanks for merging in mm-new, would it be possible
to remove "or 16K" from the commit message. I can send a new revision
as well if that is easier and preferred.

>> tradeoff for folios of that size is already well understood. On arm64
>> with a 64K base page size, 2MB is also the contiguous-PTE (contpte)
>> block size, so the resulting folios coalesce into a single TLB entry
>> and reduce TLB pressure on the readahead path.
>>
>> The final allocation order may still be clamped by page_cache_ra_order()
>> to the mapping and request geometry, but this gives VM_HUGEPAGE mappings
>> on such configurations a large-folio readahead request instead of
>> dropping back to base-page readahead.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  mm/filemap.c | 27 +++++++++++++++++++--------
>>  1 file changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/filemap.c b/mm/filemap.c
>> index a16b33e0fc71..bfb891d9da1f 100644
>> --- a/mm/filemap.c
>> +++ b/mm/filemap.c
>> @@ -3312,14 +3312,23 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>>  	struct file *fpin = NULL;
>>  	vm_flags_t vm_flags = vmf->vma->vm_flags;
>>  	bool force_thp_readahead = false;
>> +	unsigned int thp_order = 0;
>>  	unsigned short mmap_miss;
>>  
>>  	ractl._max_index = vmf->vma->vm_pgoff + vma_pages(vmf->vma) - 1;
>>  
>>  	/* Use the readahead code, even if readahead is disabled */
>> -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
>> -	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
>> -		force_thp_readahead = true;
>> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
>> +		if (HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER) {
>> +			force_thp_readahead = true;
>> +			thp_order = HPAGE_PMD_ORDER;
>> +		} else if (mapping_large_folio_support(mapping)) {
>> +			force_thp_readahead = true;
>> +			thp_order = min_t(unsigned int,
>> +					  mapping_max_folio_order(mapping),
>> +					  get_order(SZ_2M));
> 
> This looks somewhat arbitrary to me (as does the old logic). It seems more
> natural (correct?) to do this:
> 
> 	if (THP_ENABLED && (vm_flags & VM_HUGEPAGE)) {
> 		if (mapping_large_folio_support(mapping)) {
> 			force_thp_readahead = true;
> 			/*
> 			 * Cap THP readahead to either the max folio order the
> 			 * mapping supports, or the max order the page cache
> 			 * supports (useless to try more), or the hugepage PMD
> 			 * order (CPU can't benefit from larger).
> 			 */
> 			thp_order = min3(mapping_max_folio_order(mapping),
> 					MAX_PAGECACHE_ORDER, HPAGE_PMD_ORDER);
> 		}
> 	}
> 

So this can result in extreme memory pressure. For example, on 64K base page size,
with HPAGE_PMD_ORDER = 13 (512M) and MAX_PAGECACHE_ORDER = 11 (128M), this will evaluate
THP order to 128M. I think Jan mentioned in previous versions that there are already
reports of high memory pressure due to large file folios, and we are seeing this
in our fleet as well with xfs.

I chose 2M cap as that is what most (not all) architectures which currently support this
hugepage code flow are currently used to, and on archs + base page size combination which
just evaluate this code to base page, for example 64K base page size, it will provide a
performance uplift without causing excessive memory pressure.

In pagemap.h, we have

#define PREFERRED_MAX_PAGECACHE_ORDER	HPAGE_PMD_ORDER
#define MAX_PAGECACHE_ORDER	min(MAX_XAS_ORDER, PREFERRED_MAX_PAGECACHE_ORDER)

So MAX_PAGECACHE_ORDER <= HPAGE_PMD_ORDER is always true.

At filesystem/inode setup: mapping_set_folio_order_range() 

	if (max > MAX_PAGECACHE_ORDER)
		max = MAX_PAGECACHE_ORDER;

so mapping_max_folio_order() <= MAX_PAGECACHE_ORDER is also always true.

which means mapping_max_folio_order(mapping) <= MAX_PAGECACHE_ORDER <= HPAGE_PMD_ORDER is always
true, and you dont need the min3(..) in your diff.

Now the question is if then why not just do:

	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
		if (mapping_large_folio_support(mapping)) {
			force_thp_readahead = true;
			thp_order = min_t(unsigned int,
					  mapping_max_folio_order(mapping),
					  get_order(SZ_2M));
		}
	}


This is because this will regress the 16K ARM case where we already got 32M
folios. Someone might upgrade the kernel and start getting 2M folios now.

So IMHO the current code is correct, both in maintaining what the
existing behaviour has been, but also trying to provide large folios to
architectures that currently dont get them but in a controlled way.

Later on, when we think or evaluate that 2M was too small a cap, it can
be raised. I think its very easy to raise a cap, but much more difficult
to make the cap smaller, as we might get reports on kernel upgrades that
someone was getting a certain size of folio but now its much smaller.

As a summary, what my code in this current form gives is:
1) 4K x86/ARM (HPAGE_PMD_ORDER=9 <= 9): first branch -> 2M unchanged behaviour
2) 16K ARM (HPAGE_PMD_ORDER=11 <= 11): first branch -> 32M unchanged behaviour
3) 64K ARM (HPAGE_PMD_ORDER=13 <= 11): new else-if -> 2M new capability, conservative
behaviour, which can be increased later if needed.
I know that 64K base page size having 2M large folios while 16K base page size
having 32M sounds counterintuitive, but I think 32M on 16K was a mistake and
we shouldnt repeat that mistake for 64K.

What your change with min3(mapping_max_folio_order(mapping), MAX_PAGECACHE_ORDER, HPAGE_PMD_ORDER)
will give
3) 64K ARM -> 128M folios, extremely high memory pressure.

What only having min(mapping_max_folio_order, get_order(SZ_2M)) will give:
2) 16K ARM -> 2M folios, (regression since we always had 32M on 16K ARM).



>> +		}
>> +	}
>>  
>>  	if (!force_thp_readahead) {
>>  		/*
>> @@ -3354,17 +3363,19 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>>  	}
>>  
>>  	if (force_thp_readahead) {
>> +		unsigned long folio_nr_pages = 1UL << thp_order;
>> +
>>  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>> -		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
>> -		ra->size = HPAGE_PMD_NR;
>> +		ractl._index &= ~(folio_nr_pages - 1);
>> +		ra->size = folio_nr_pages;
>>  		/*
>> -		 * Fetch two PMD folios, so we get the chance to actually
>> +		 * Fetch two folios so we get the chance to actually
> 			  ^^ large folios?
>>  		 * readahead, unless we've been told not to.
>>  		 */
>>  		if (!(vm_flags & VM_RAND_READ))
>>  			ra->size *= 2;
>> -		ra->async_size = HPAGE_PMD_NR;
>> -		ra->order = HPAGE_PMD_ORDER;
>> +		ra->async_size = folio_nr_pages;
>> +		ra->order = thp_order;
> 
> This part LGTM.
> 


