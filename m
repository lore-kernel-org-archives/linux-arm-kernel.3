Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2D4FD5F99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkHCG5dhZchDvFXHA3IGDgcnM8tbJ/gx4ORHy85CrQo=; b=dksSs0yl3Ese7Rz7D+JO8sdiVD
	7p/C+9Jg6zVfGZosIhEBfXHjJnZnzVjJ2rSiMR/6ttR9XebhGZLGTValabrQhfnxyk0Z8cL9Y2JH4
	cQTxjK9hzJOZxmkfBUZEgbJl6tkFF7/sLXC2YHTHvBuFpG98QUJTZMd7x4NXO2/AuBxJ0UwS7cirX
	j1l2gle+TNwYim3K4IES8duDUjVT/AyPGdGFLdr0c0zXVWCvlMgpibnplNILLiEBh5t1943lvQcsi
	GU45XeLltLoCcqwLMi5yMaa+d0B6Wmfis117l+UVEml8efd5Ac8VVfWvfecuYLRzbTb9e5KnZGrzh
	jbhlpIrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOzT-00000008aU7-0UIb;
	Wed, 08 Apr 2026 09:14:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOzR-00000008aTm-1mQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:14:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF962720;
	Wed,  8 Apr 2026 02:14:18 -0700 (PDT)
Received: from [10.163.142.59] (unknown [10.163.142.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2387E3F641;
	Wed,  8 Apr 2026 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775639664; bh=d72bEFH3e2m4PCDJvyifqs2i7ZCFESpqNozQ8GzrTfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ghxk80zyff7gDALCMKWg7f/MiqxnNUGlu88QNl2zWCW0b6XyuS9iTul4ptVmO4fni
	 9ibRuCeu8jxX4N5VERxc4am5wONI3uvo+DNbNpsT5HzljD5eY3NgYkFXJ6g3Pk+hqp
	 QmDlj/2VR5Y5yeFyWbHcB+M46P9UTUFTFt/Wqa0g=
Message-ID: <1e7427c6-b6e5-4a3a-a600-bef9ac2bf3e0@arm.com>
Date: Wed, 8 Apr 2026 14:44:16 +0530
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
X-CRM114-CacheID: sfid-20260408_021425_572346_40E34B94 
X-CRM114-Status: GOOD (  14.88  )
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

On Linux VM on Apple M3, running mm-selftests:

 ./run_vmtests.sh -t "hugetlb"

TAP version 13
# -----------------------
# running ./hugepage-mmap
# -----------------------
# TAP version 13
# 1..1
# # Returned address is 0xffffe7c00000



[   30.884630] kernel BUG at mm/page_table_check.c:86!
[   30.884701] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
[   30.886803] Modules linked in:
[   30.887217] CPU: 3 UID: 0 PID: 1869 Comm: hugepage-mmap Not tainted 7.0.0-rc5+ #86 PREEMPT
[   30.888218] Hardware name: linux,dummy-virt (DT)
[   30.889413] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   30.889901] pc : page_table_check_clear.part.0+0x128/0x1a0
[   30.890337] lr : page_table_check_clear.part.0+0x7c/0x1a0
[   30.890714] sp : ffff800084da3ad0
[   30.890946] x29: ffff800084da3ad0 x28: 0000000000000001 x27: 0010000000000001
[   30.891434] x26: 0040000000000040 x25: ffffa06bb8fb9000 x24: 00000000ffffffff
[   30.891932] x23: 0000000000000001 x22: 0000000000000000 x21: ffffa06bb8997810
[   30.892514] x20: 0000000000113e39 x19: 0000000000113e38 x18: 0000000000000000
[   30.893007] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   30.893500] x14: ffffa06bb7013780 x13: 0000fffff7f90fff x12: 0000000000000000
[   30.893990] x11: 1fffe0001a1282c1 x10: ffff0000d094160c x9 : ffffa06bb568a858
[   30.894479] x8 : ffff5f95c8474000 x7 : 0000000000000000 x6 : ffff00017fffc500
[   30.894973] x5 : ffff000191208fc0 x4 : 0000000000000000 x3 : 0000000000004000
[   30.895449] x2 : 0000000000000000 x1 : 00000000ffffffff x0 : ffff0000c071f1b8
[   30.895875] Call trace:
[   30.896027]  page_table_check_clear.part.0+0x128/0x1a0 (P)
[   30.896369]  page_table_check_clear+0xc8/0x138
[   30.896776]  __page_table_check_ptes_set+0xe4/0x1e8
[   30.897073]  __set_ptes_anysz+0x2e4/0x308
[   30.897327]  set_huge_pte_at+0xec/0x210
[   30.897561]  hugetlb_no_page+0x1ec/0x8e0
[   30.897807]  hugetlb_fault+0x188/0x740
[   30.898036]  handle_mm_fault+0x294/0x2c0
[   30.898283]  do_page_fault+0x120/0x748
[   30.898539]  do_translation_fault+0x68/0x90
[   30.898796]  do_mem_abort+0x4c/0xa8
[   30.899011]  el0_da+0x2c/0x90
[   30.899205]  el0t_64_sync_handler+0xd0/0xe8
[   30.899461]  el0t_64_sync+0x198/0x1a0
[   30.899688] Code: 91001021 b8f80022 51000441 36fffd41 (d4210000)
[   30.900053] ---[ end trace 0000000000000000 ]---



The bug is at

BUG_ON(atomic_dec_return(&ptc->file_map_count) < 0);

My tree is mm-unstable, commit 3fa44141e0bb.


