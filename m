Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C55E7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=engvTENbTkwyMwShxwwH2edffyeaZ701mnBGWNltMW8=; b=LoT4V3JbUJCQbsVw8Qc0hOlHB1
	0pE5G05mTeIZfu0SEhNCcagrCQ6bdx9eX8dNHq2UcrvueRN1Hb2m5mOeGVG/h28A+DXKO+nmoLkam
	p/lITqAsA8xALQi9CnekizeoQTdxgF/80DwlzGos0k3s5zVWE/1owmGzHn2RAklWjM8r2YGiUyNnH
	1yHKIciJDOcwa3i7sLbVlQgoH1fADETLWlQbdTxd2sL+zA86MEuPgz554H0kkzgjmOc50z71iwMf3
	dxMWU0c5GfpaZEiKoxDDaI26ocGJUYiBgu7+AV4fQJwwnSRBhcrx3A9RR7tZ1SVVYqVm5U78/gKXL
	KQKEK2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPaW-0000000GyZD-2ARG;
	Wed, 24 Dec 2025 14:11:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPaL-0000000GyXa-2ip5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 14:11:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0109C1424;
	Wed, 24 Dec 2025 06:11:21 -0800 (PST)
Received: from [10.57.93.190] (unknown [10.57.93.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763F53F5A1;
	Wed, 24 Dec 2025 06:11:25 -0800 (PST)
Message-ID: <20821c02-e16b-4e5f-95b0-b3e8b9192117@arm.com>
Date: Wed, 24 Dec 2025 14:11:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] mm: rmap: support batched unmapping for file large
 folios
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1766455377.git.baolin.wang@linux.alibaba.com>
 <d869ae45a7be322f342ace62ffcdd4b47f4154fc.1766455378.git.baolin.wang@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <d869ae45a7be322f342ace62ffcdd4b47f4154fc.1766455378.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_061130_615095_30216A12 
X-CRM114-Status: GOOD (  17.46  )
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

On 23/12/2025 05:48, Baolin Wang wrote:
> Similar to folio_referenced_one(), we can apply batched unmapping for file
> large folios to optimize the performance of file folios reclamation.
> 
> Barry previously implemented batched unmapping for lazyfree anonymous large
> folios[1] and did not further optimize anonymous large folios or file-backed
> large folios at that stage. As for file-backed large folios, the batched
> unmapping support is relatively straightforward, as we only need to clear
> the consecutive (present) PTE entries for file-backed large folios.
> 
> Performance testing:
> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
> reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
> 75% performance improvement on my Arm64 32-core server (and 50%+ improvement
> on my X86 machine) with this patch.
> 
> W/o patch:
> real    0m1.018s
> user    0m0.000s
> sys     0m1.018s
> 
> W/ patch:
> real	0m0.249s
> user	0m0.000s
> sys	0m0.249s
> 
> [1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u
> Acked-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/rmap.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a0fc05f5966f..7482121d4e92 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1862,9 +1862,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>  	end_addr = pmd_addr_end(addr, vma->vm_end);
>  	max_nr = (end_addr - addr) >> PAGE_SHIFT;
>  
> -	/* We only support lazyfree batching for now ... */
> -	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> +	/* We only support lazyfree or file folios batching for now ... */
> +	if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>  		return 1;
> +
>  	if (pte_unused(pte))
>  		return 1;
>  
> @@ -2230,7 +2231,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			 *
>  			 * See Documentation/mm/mmu_notifier.rst
>  			 */
> -			dec_mm_counter(mm, mm_counter_file(folio));
> +			add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
>  		}
>  discard:
>  		if (unlikely(folio_test_hugetlb(folio))) {


