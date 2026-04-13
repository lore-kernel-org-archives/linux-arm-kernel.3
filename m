Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D56F531CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 20:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDzIliDM6S854tOGtnK9335dGZ7UluEeVHOtyDJVWLU=; b=xBVa1K666CtJGdy71SMcQB1sZS
	97IAfrYROOkWGZZG2Rr0LvIovbxOAyZOuYHAvqiotte9Wo0VjNYB+rbX8748JKu8Mc5QeIJZ+Yxmo
	x/Pk+PaXzvWTR7ntscd4+7wwERdLw3CDzXOHw35fnUjFIru23lrsJm8xoMjeDUCDW80Kd1BtwfQyX
	LdjSFsiLiAXZwE8PTPkho7P9DfrF+6ZcFjNWpDHWn72CO86NOTOZBMXPP/n1DWBGfTLArQleAJD9M
	lq+fSXk3LLTJMTYlAEKi/4oahmDswHUI5fZ8pLB1GmTo0wK4pZ2OFIkRKVD6nO6MWimI3T6O750ES
	cvysCEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNUt-0000000GL3x-0i1J;
	Mon, 13 Apr 2026 20:03:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNUr-0000000GL3e-19AB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 20:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0018F61843;
	Mon, 13 Apr 2026 20:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D03C2BCAF;
	Mon, 13 Apr 2026 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776110579;
	bh=X5Qr7RMZPcVsHaB67sBlEm7JbLFMJ0dv+rLoHvobS5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HxgT6fUn+5kb5WwLOPN7Ze+RMzag6T9eul66Jd1aQhH3Ac+bnWH7NDyXrPyemABdp
	 I/Iqc9Wmid5rK7bX78l6MdpPYYovFk6XcU+m9MXNu2B9lQ3AE/CKKoV407TZ7lYy5y
	 ikjD7iopCPr000/vOdpw0eZ54kJ9LYsQxZIKjB5FzBynfxPRKf3vWruvwKWB3kUiOg
	 B3L96qx/q21+cISIF5UZsBJ6QF2HiTjat5Owme2y6anfyX/m7HxUJAVm5jFQNS131i
	 rE0oVtcBGYt4MEJCQDvGJUk6vIPguYRBddrEDPSx+80OIt4jrDXHePx/EBqg2x6Zoj
	 2ayc1/HcJ6uSA==
Message-ID: <9886b2c6-5516-4be8-ac31-db3133455af2@kernel.org>
Date: Mon, 13 Apr 2026 22:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 4/4] mm: add PMD-level huge page support for
 remap_pfn_range()
To: Yin Tirui <yintirui@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 willy@infradead.org, catalin.marinas@arm.com, will@kernel.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, anshuman.khandual@arm.com,
 rmclure@linux.ibm.com, kevin.brodsky@arm.com, apopple@nvidia.com,
 ajd@linux.ibm.com, pasha.tatashin@soleen.com, bhe@redhat.com,
 thuth@redhat.com, coxu@redhat.com, dan.j.williams@intel.com,
 yu-cheng.yu@intel.com, yangyicong@hisilicon.com, baolu.lu@linux.intel.com,
 jgross@suse.com, conor.dooley@microchip.com, Jonathan.Cameron@huawei.com,
 riel@surriel.com
Cc: wangkefeng.wang@huawei.com, chenjun102@huawei.com
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-5-yintirui@huawei.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260228070906.1418911-5-yintirui@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2/28/26 08:09, Yin Tirui wrote:
> Add PMD-level huge page support to remap_pfn_range(), automatically
> creating huge mappings when prerequisites are satisfied (size, alignment,
> architecture support, etc.) and falling back to normal page mappings
> otherwise.
> 
> Implement special huge PMD splitting by utilizing the pgtable deposit/
> withdraw mechanism. When splitting is needed, the deposited pgtable is
> withdrawn and populated with individual PTEs created from the original
> huge mapping.
> 
> Signed-off-by: Yin Tirui <yintirui@huawei.com>
> ---

[...]

>  
>  	if (!vma_is_anonymous(vma)) {
>  		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
> +
> +		if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {

These magical vma checks are really bad. This all needs a cleanup
(Lorenzo is doing some, hoping it will look better on top of that).

> +			pte_t entry;
> +
> +			if (!pmd_special(old_pmd)) {

If you are using pmd_special(), you are doing something wrong.

Hint: vm_normal_page_pmd() is usually what you want.

> +				zap_deposited_table(mm, pmd);
> +				return;
> +			}
> +			pgtable = pgtable_trans_huge_withdraw(mm, pmd);
> +			if (unlikely(!pgtable))
> +				return;
> +			pmd_populate(mm, &_pmd, pgtable);
> +			pte = pte_offset_map(&_pmd, haddr);
> +			entry = pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd));
> +			set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
> +			pte_unmap(pte);
> +
> +			smp_wmb(); /* make pte visible before pmd */
> +			pmd_populate(mm, pmd, pgtable);
> +			return;
> +		}
> +
>  		/*
>  		 * We are going to unmap this huge page. So
>  		 * just go ahead and zap it
>  		 */
>  		if (arch_needs_pgtable_deposit())
>  			zap_deposited_table(mm, pmd);
> -		if (!vma_is_dax(vma) && vma_is_special_huge(vma))
> -			return;
> +
>  		if (unlikely(pmd_is_migration_entry(old_pmd))) {
>  			const softleaf_t old_entry = softleaf_from_pmd(old_pmd);
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index 07778814b4a8..affccf38cbcf 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2890,6 +2890,40 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	return err;
>  }
>  
> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP

Why exactly do we need arch support for that in form of a Kconfig.

Usually, we guard pmd support by CONFIG_TRANSPARENT_HUGEPAGE.

And then, we must check at runtime if PMD leaves are actually supported.

Luiz is working on a cleanup series:

https://lore.kernel.org/r/cover.1775679721.git.luizcap@redhat.com

pgtable_has_pmd_leaves() is what you would want to check.


> +static int remap_try_huge_pmd(struct mm_struct *mm, pmd_t *pmd,
> +			unsigned long addr, unsigned long end,
> +			unsigned long pfn, pgprot_t prot)

Use two-tab indent. (currently 3? :) )

Also, we tend to call these things now "pmd leaves". Call it
 "remap_try_pmd_leaf" or something even more expressive like

"remap_try_install_pmd_leaf()"

> +{
> +	pgtable_t pgtable;
> +	spinlock_t *ptl;
> +
> +	if ((end - addr) != PMD_SIZE)

	if (end - addr != PMD_SIZE)

Should work

> +		return 0;
> +
> +	if (!IS_ALIGNED(addr, PMD_SIZE))
> +		return 0;
> +

You could likely combine both things into a

	if (!IS_ALIGNED(addr | end, PMD_SIZE))

> +	if (!IS_ALIGNED(pfn, HPAGE_PMD_NR))

Another sign that you piggy-back on THP support ;)

> +		return 0;
> +
> +	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> +		return 0;

Ripping out a page table?! That doesn't sound right :)

Why is that required? We shouldn't be doing that here. Gah.

Especially, without any pmd locks etc.

> +
> +	pgtable = pte_alloc_one(mm);
> +	if (unlikely(!pgtable))
> +		return 0;
> +
> +	mm_inc_nr_ptes(mm);
> +	ptl = pmd_lock(mm, pmd);
> +	set_pmd_at(mm, addr, pmd, pmd_mkspecial(pmd_mkhuge(pfn_pmd(pfn, prot))));
> +	pgtable_trans_huge_deposit(mm, pmd, pgtable);
> +	spin_unlock(ptl);
> +
> +	return 1;
> +}
> +#endif
> +
>  static inline int remap_pmd_range(struct mm_struct *mm, pud_t *pud,
>  			unsigned long addr, unsigned long end,
>  			unsigned long pfn, pgprot_t prot)
> @@ -2905,6 +2939,12 @@ static inline int remap_pmd_range(struct mm_struct *mm, pud_t *pud,
>  	VM_BUG_ON(pmd_trans_huge(*pmd));
>  	do {
>  		next = pmd_addr_end(addr, end);
> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> +		if (remap_try_huge_pmd(mm, pmd, addr, next,
> +				pfn + (addr >> PAGE_SHIFT), prot)) {

Please provide a stub instead so we don't end up with ifdef in this code.

-- 
Cheers,

David

