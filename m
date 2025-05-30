Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E453CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zST7fOyfUXzujgLWo7a+xP09hr2f/bg8V9cDDQMRXCU=; b=N8Ag1yctvQbfL1x26RSo96Jdxi
	EH/PYDCXHHOjZ+ERv/vZMYj7FntfGkGSA5fMshYAQxPbfE+YCuxMD5BQn3O2x002ihP4PoFjPG9w3
	b2rCU22jjRISkOWGVz0fiL5REczGV0kUEdG9RkEhio20w5GTfcIoelOp5kPr0SzsMC8AdyhnYVnVa
	+w44trAqJ4YA06i/+kACPZRig4v8RFX64HP/uhPfPHUy4J29Tl4p8Wia34QIqmLd20rCrqPHRaYhj
	YJ3TGw4TpO3l2cRjpdbqxU3vDMQgYrFSakrDqdEk0rIp+I3APVHZju/ocZTGnJfH6PlsnaZkWLbS/
	WyreP7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzHm-00000000d98-1gVp;
	Fri, 30 May 2025 12:56:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzEt-00000000cCV-2dCj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 12:53:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115CB16F2;
	Fri, 30 May 2025 05:53:18 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E28393F5A1;
	Fri, 30 May 2025 05:53:31 -0700 (PDT)
Message-ID: <d195c7bc-0c04-4514-b536-b503d4827914@arm.com>
Date: Fri, 30 May 2025 13:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250530090407.19237-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_055335_762433_FDA2F173 
X-CRM114-Status: GOOD (  31.70  )
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

On 30/05/2025 10:04, Dev Jain wrote:
> Move away from apply_to_page_range(), which does not honour leaf mappings,
> to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
> if a partial range is detected.

Perhaps:

"""
apply_to_page_range(), which was previously used to change permissions for
kernel mapped memory, can only operate on page mappings. In future we want to
support block mappings for more efficient TLB usage. Reimplement pageattr.c to
instead use walk_page_range_novma() to visit and modify leaf mappings of all sizes.

We only require that the start and end of a given range lie on leaf mapping
boundaries. If this is not the case, emit a warning and return -EINVAL.
"""


> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 64 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..a5c829c64969 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -8,6 +8,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
> +#include <linux/pagewalk.h>
>  
>  #include <asm/cacheflush.h>
>  #include <asm/pgtable-prot.h>
> @@ -20,6 +21,67 @@ struct page_change_data {
>  	pgprot_t clear_mask;
>  };
>  
> +static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)

Please don't use unsigned long for raw ptes; This will break with D128 pgtables.

Anshuman had a patch in flight to introduce ptdesc_t as a generic/any level raw
value. It would be preferable to incorporate that patch and use it. pteval_t
isn't really correct because this is for any level and that implies pte level only.

> +{
> +	struct page_change_data *masks = walk->private;
> +	unsigned long new_val = val;

why do you need new_val? Why not just update and return val?

> +
> +	new_val &= ~(pgprot_val(masks->clear_mask));
> +	new_val |= (pgprot_val(masks->set_mask));
> +
> +	return new_val;
> +}

One potential pitfall of having a generic function that can change the
permissions for ptes at all levels is that bit 1 is defined differently for
level 3 vs the other levels. I don't think there should be any issues here in
practice having had a quick look at all the masks that users currently pass in
though.

> +
> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pud_t val = pudp_get(pud);
> +
> +	if (pud_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
> +			return -EINVAL;
> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
> +		set_pud(pud, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pmd_t val = pmdp_get(pmd);
> +
> +	if (pmd_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
> +			return -EINVAL;
> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
> +		set_pmd(pmd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pte_t val = ptep_get(pte);

BUG: Use __ptep_get(), which is "below" the contpte management layer. ptep_get()
will look at the contiguous bit and potentially decide to accumulate all the a/d
bits in the block which is not relavent for kernel mappings.

> +
> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
> +	set_pte(pte, val);

BUG: Use __set_pte(). Same reasoning as above. But this is more harmful because
set_pte() will try to detect contpte blocks and may zero/flush the entries.
Which would be very bad for kernel mappings.

> +
> +	return 0;
> +}
> +
> +static const struct mm_walk_ops pageattr_ops = {
> +	.pud_entry	= pageattr_pud_entry,
> +	.pmd_entry	= pageattr_pmd_entry,
> +	.pte_entry	= pageattr_pte_entry,

Is there a reason why you don't have pgd and p4d entries? I think there are
configs where the pgd may contain leaf mappings. Possibly 64K/42-bit, which will
have 2 levels and I think they will be pgd and pte. So I think you'd better
implement all levels to be correct.

> +	.walk_lock	= PGWALK_NOLOCK,
> +};
> +
>  bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>  
>  bool can_set_direct_map(void)
> @@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>  	return 0;
>  }
>  
> -/*
> - * This function assumes that the range is mapped with PAGE_SIZE pages.
> - */
>  static int __change_memory_common(unsigned long start, unsigned long size,
>  				pgprot_t set_mask, pgprot_t clear_mask)
>  {
> @@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	data.set_mask = set_mask;
>  	data.clear_mask = clear_mask;
>  
> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> -					&data);
> +	ret = walk_page_range_novma(&init_mm, start, start + size,
> +				    &pageattr_ops, NULL, &data);
>  
>  	/*
>  	 * If the memory is being made valid without changing any other bits

I notice that set_direct_map_invalid_noflush() and
set_direct_map_default_noflush() don't use __change_memory_common() but instead
call apply_to_page_range() direct. (presumably because they don't want the
associated tlb flush). Is there a reason not to update these callers too?

Perhaps it would be cleaner to wrap in ___change_memory_common (3 leading
underscores) which does everything except the flush).

Thanks,
Ryan


