Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0OA6sDR9xVrofWsz20wyHhFk3GqcE2ce4sWlpq82E8=; b=GbvBfmujXu5gQytoLcaOnULfcZ
	ageXtHNb2OcC8dffxNRslU/APpNfBb57geVui9STwBiG9Z7tnLFb55gQNFJjNuawdduFmrQiy3qxV
	ADuO8pCbTYrTljy7d/BfLmDUiT3pTrH80cKCl9VEjZj2ZCabE8MiV+OL2RKohqk8Y/5H6CH49MPTA
	KP0WdRPZf8xs6/K4nZacNYX7oaOECjc8Wrma2QOiOThll63PBAB04jC157ZV8fZpuRk2IwYctng8M
	WwNnj16K3Sk0+mPmiRtVzzbeYnDjTJ8cE0/iMS4m6cX7pqvQljhD/IB0musn1/yQjDVA/4vDpztqh
	klH97q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfD5D-00000003us7-4BTO;
	Thu, 02 Jul 2026 08:47:44 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfD5B-00000003urY-3pu1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:47:43 +0000
Message-ID: <97a43d82-28c2-4f98-ad74-fe05ed9f0297@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782982049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0OA6sDR9xVrofWsz20wyHhFk3GqcE2ce4sWlpq82E8=;
	b=CeY7Yl2QeKZhrbQj/DcuVaDk/ScIJ/I13EQpZ8mQWaTSWVTAnJI6dr9QSnz88wDdAg8sKv
	Xt0Xi5Hd5b9ixMNZeCeiv8WObh/juzMGC6+hdTsDG80pj5Ut11tptk+UKPF6hyl/40jjAo
	Se6oTrt1q3oy4yS28IgmbRN4YnIsWTU=
Date: Thu, 2 Jul 2026 16:47:10 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/6] mm/rmap: use huge_ptep_get() in try_to_unmap_one()
To: Dev Jain <dev.jain@arm.com>
Cc: riel@surriel.com, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, kas@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, rcampbell@nvidia.com, apopple@nvidia.com,
 ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 ying.huang@linux.alibaba.com, nao.horiguchi@gmail.com, ak@linux.intel.com,
 mel@csn.ul.ie, pfalcato@suse.de, jpoimboe@kernel.org, dave.hansen@intel.com,
 tglx@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, stable@vger.kernel.org, osalvador@suse.de,
 akpm@linux-foundation.org, ljs@kernel.org, david@kernel.org,
 liam@infradead.org
References: <20260702051341.126509-1-dev.jain@arm.com>
 <20260702051341.126509-3-dev.jain@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260702051341.126509-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_014742_101861_3EE8886C 
X-CRM114-Status: GOOD (  21.25  )
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



On 2026/7/2 13:13, Dev Jain wrote:
> try_to_unmap_one() handles hugetlb folios when memory failure needs
> to replace a poisoned hugetlb mapping with a hwpoison entry. In that
> case page_vma_mapped_walk() returns the pte pointer to the hugetlb folio
> in pvmw.pte, but the code reads it with ptep_get().
>
> On arches which provide their own huge_ptep_get() to dereference a huge
> pte pointer, accessing via ptep_get() would cause pte_pfn(), pte_present()
> etc to misbehave.
>
> It is not clear whether this has a trivially visible effect to userspace.
>
> Just use huge_ptep_get() for dereferencing a huge pte pointer.
>
> Fixes: c7ab0d2fdc84 ("mm: convert try_to_unmap_one() to use page_vma_mapped_walk()")
> Cc: stable@vger.kernel.org
> Reported-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   include/linux/hugetlb.h |  3 +++
>   mm/rmap.c               | 16 ++++++++++------
>   2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 2abaf99321e90..fdb7bdf7645c5 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -1261,6 +1261,9 @@ static inline void hugetlb_count_sub(long l, struct mm_struct *mm)
>   {
>   }
>   
> +pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr,
> +		    pte_t *ptep);
> +

Maybe I didn't express my thoughts clearly in the first version, let me
explain in more detail.

We should define this stub as a no-op for !CONFIG_HUGETLB_PAGE (like
set_huge_pte_at, that is why I mentioned 5d4af6195c87c6 for your reference
in your previous version). Currently, you've added a declaration, but the
function itself doesn't actually exist, which seems quite strange to me.

Muchun,
Thanks.
>   static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>   					  unsigned long addr, pte_t *ptep)
>   {
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 1c77d5dc06e9f..aa8a254efaecc 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2095,11 +2095,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   		/* Unexpected PMD-mapped THP? */
>   		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>   
> -		/*
> -		 * Handle PFN swap PTEs, such as device-exclusive ones, that
> -		 * actually map pages.
> -		 */
> -		pteval = ptep_get(pvmw.pte);
> +		address = pvmw.address;
> +		if (folio_test_hugetlb(folio)) {
> +			pteval = huge_ptep_get(mm, address, pvmw.pte);
> +		} else {
> +			/*
> +			 * Handle PFN swap PTEs, such as device-exclusive ones,
> +			 * that actually map pages.
> +			 */
> +			pteval = ptep_get(pvmw.pte);
> +		}
>   		if (likely(pte_present(pteval))) {
>   			pfn = pte_pfn(pteval);
>   		} else {
> @@ -2110,7 +2115,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   		}
>   
>   		subpage = folio_page(folio, pfn - folio_pfn(folio));
> -		address = pvmw.address;
>   		anon_exclusive = folio_test_anon(folio) &&
>   				 PageAnonExclusive(subpage);
>   


