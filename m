Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB806FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKmktgMsLT8bswV/+6qn/5r6AsKY+Ic+6aIWG845vb4=; b=bNKS5DjlT+Nnm9C7NgCGL72fhC
	1+MUadRTUc0mfuyKFSlqrFHupOH2n/02eeg875mzeVsKfgIQIel4xYlRNObkGd2CVUO2y8YchKC0y
	hdtuA+d+ikGIGv/DBAqm8lty8EgN5mdYBFUmrXU16z64Y4n4pP8ul+8TA4F2+rxTye6/4qbGhyXdo
	9ghez5n1pibrVIVn49iA6+dEko1f5wZe6x3n+zZQZbh9c4xSQZy8twg7M0RlZ3zWmv0JlXpHrA14E
	t0dneADkv2TQDX2tHNSVYvJgmR9cWsFIdwZiFXPPOksoJsMem/uaC/MHjhjGtTjlzoSnOdZaE6GFN
	R5UEq0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNWS-0000000H9rJ-0vfJ;
	Mon, 27 Apr 2026 15:05:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNWM-0000000H9o2-05Bc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:05:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0699B1FC7;
	Mon, 27 Apr 2026 08:05:05 -0700 (PDT)
Received: from [10.164.148.37] (MacBook-Pro.blr.arm.com [10.164.148.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 952753F7B4;
	Mon, 27 Apr 2026 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777302310; bh=LF4eMdK0ID4NJDAUmuKQ8VsmPWmO7w6FTTlpJhcDycs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZvPqTD/8uz+vouJEXQWe5V4WnPgvNPoD0zRcg/+h/FtE7s8IlA6PhWIUySQ6Ot+HJ
	 7KCalBDGW0j/7MxTtrtqV9TDUTDg/99gV52ADTb5nu8Ml/zvWGSKnJ6WAsgr+vS0FR
	 BRD/orHCUaiFgQi9kEUiKiBo8YlSGbTrzSKMfScs=
Message-ID: <fb022a6f-0faf-4742-8934-8a7ffae806f6@arm.com>
Date: Mon, 27 Apr 2026 20:34:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080514_106767_E02FB205 
X-CRM114-Status: GOOD (  13.99  )
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



On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> is physically fully or partially contiguous. Two techniques are used:
> 
> 1. Avoid page table zigzag when setting PTEs/PMDs for multiple memory
>    segments
> 2. Use batched mappings wherever possible in both vmalloc and ARM64
>    layers
> 
> Patches 1–2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
> CONT-PTE regions instead of just one.
> 
> Patches 3–4 extend vmap_small_pages_range_noflush() to support page
> shifts other than PAGE_SHIFT. This allows mapping multiple memory
> segments for vmalloc() without zigzagging page tables.
> 
> Patches 5–8 add huge vmap support for contiguous pages. This not only
> improves performance but also enables PMD or CONT-PTE mapping for the
> vmapped area, reducing TLB pressure.
> 
> Many thanks to Xueyuan Chen for his substantial testing efforts
> on RK3588 boards.
> 
> On the RK3588 8-core ARM64 SoC, with tasks pinned to CPU2 and
> the performance CPUfreq policy enabled, Xueyuan’s tests report:
> 
> * ioremap(1 MB): 1.2× faster
> * vmalloc(1 MB) mapping time (excluding allocation) with
>   VM_ALLOW_HUGE_VMAP: 1.5× faster
> * vmap(): 5.6× faster when memory includes some order-8 pages,
>   with no regression observed for order-0 pages
> 
> Barry Song (Xiaomi) (8):
>   arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
>     setup
>   arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
>     CONT_PTE
>   mm/vmalloc: Extend vmap_small_pages_range_noflush() to support larger
>     page_shift sizes
>   mm/vmalloc: Eliminate page table zigzag for huge vmalloc mappings
>   mm/vmalloc: map contiguous pages in batches for vmap() if possible
>   mm/vmalloc: align vm_area so vmap() can batch mappings
>   mm/vmalloc: Coalesce same page_shift mappings in vmap to avoid pgtable
>     zigzag
>   mm/vmalloc: Stop scanning for compound pages after encountering small
>     pages in vmap
> 
>  arch/arm64/include/asm/vmalloc.h |   6 +-
>  arch/arm64/mm/hugetlbpage.c      |  10 ++
>  mm/vmalloc.c                     | 178 +++++++++++++++++++++++++------
>  3 files changed, 161 insertions(+), 33 deletions(-)
> 

Hi Barry, have you got the chance to work on v2?

