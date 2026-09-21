Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B30C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yu9bHXGQw+DaXYWxFGKYbAE+cSQo+BWii/VuW+Fkk1M=; b=iGg5s2ul1h0hxFpInhBFjjGZop
	S4pI/0tL4ivMRdmevrKe07JBB3TknIIxlmWVe98eX/s/GKXFvL3qWN236wo7FuJYTAiJr5ahtABNC
	aEVwcfK2I5jqF0kotIZNM+dfx90oiHILipS3/UeVuQjXP9r0p65sEOE1eyHm6n/nDTwXn9C3dCC0l
	jUCsgwm0huffUKmAYScnKxGJEG5T+yb/8Lwyo/H17BYLp5XfYaZ47LP14q0dAvrI9ybPDVk0IMzya
	lHCDxw+FYvWJeJDHFR2tVsYr8B6ayrpEidNE51wQj9BnEv1y4Yl0iblFIjjapv/j0a+Fsc0CG23q8
	r/L6g/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aZZ-00000001Yqa-1mHC;
	Mon, 21 Sep 2026 09:44:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aZS-00000001Yps-3gjJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:44:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2998F153B;
	Mon, 21 Sep 2026 02:44:18 -0700 (PDT)
Received: from [10.57.83.12] (unknown [10.57.83.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7468D3F86F;
	Mon, 21 Sep 2026 02:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789983861; bh=QGwc+dAkTPXAJc9o4T5hZxy9BZq11nu1Z0f1P5saI/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qwUc8yekPnle5iyolREB22nxPCxek0508Oh9aZKHTFLruu7FqF8h71LWhAgNuw5e8
	 QO8MRf3saEnhCc9HduCxILbEzWErOEEfJEa25crNaoG3YkHcqnb9MTAiu+kCe9UwNQ
	 wWUie9GNe6r5o8kHoxX5FXP83fHJqGFNHbtOiC5c=
Message-ID: <89d44eaa-2ea8-478a-8a39-af91373485fb@arm.com>
Date: Mon, 21 Sep 2026 10:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: use HW PTE accessors in early map_range()
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
 <20260914-pte0_arm-v1-5-bb53b663e396@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260914-pte0_arm-v1-5-bb53b663e396@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_024424_596467_83D1D59F 
X-CRM114-Status: GOOD (  19.44  )
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

On 14/09/2026 14:51, Muhammad Usama Anjum wrote:
> map_range() uses HW PTE pointers to build early translation tables at
> each level. Directly testing, decoding, or assigning *tbl treats an
> HW PTE as a SW PTE value, which requires explicit conversion once
> hw_pte_t becomes distinct.
> 
> Use __ptep_get() to load a SW PTE value for the empty-entry check and
> child-table address, and __set_pte_nosync() to convert SW PTE values to
> HW PTEs on stores. The no-sync helper performs WRITE_ONCE() without
> adding the completion barriers used by __set_pte().
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/kernel/pi/map_range.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 94f06da76e333..9c4c8060c5df4 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -51,19 +51,21 @@ void __init map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t pa,
>  
>  	while (start < end) {
>  		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
> +		pte_t entry = __ptep_get(tbl);
>  
>  		if (level < 2 || (level == 2 && (start | next | pa) & lmask)) {
>  			/*
>  			 * This chunk needs a finer grained mapping. Create a
>  			 * table mapping if necessary and recurse.
>  			 */
> -			if (pte_none(*tbl)) {
> -				*tbl = __pte(__phys_to_pte_val(*pte) |
> +			if (pte_none(entry)) {
> +				entry = __pte(__phys_to_pte_val(*pte) |
>  					     PMD_TYPE_TABLE | PMD_TABLE_UXN);
> -				*pte += PTRS_PER_PTE * sizeof(pte_t);
> +				__set_pte_nosync(tbl, entry);
> +				*pte += PTRS_PER_PTE * sizeof(hw_pte_t);
>  			}
>  			map_range(pte, start, next, pa, prot, level + 1,
> -				  (hw_pte_t *)(__pte_to_phys(*tbl) + va_offset),
> +				  (hw_pte_t *)(__pte_to_phys(entry) + va_offset),
>  				  may_use_cont, va_offset);
>  		} else {
>  			/*
> @@ -81,7 +83,8 @@ void __init map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t pa,
>  				protval &= ~PTE_CONT;
>  
>  			/* Put down a block or page mapping */
> -			*tbl = __pte(__phys_to_pte_val(pa) | protval);
> +			entry = __pte(__phys_to_pte_val(pa) | protval);
> +			__set_pte_nosync(tbl, entry);
>  		}
>  		pa += next - start;
>  		start = next;
> 


