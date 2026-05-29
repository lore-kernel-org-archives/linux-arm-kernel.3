Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C650CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9W/ydPv1rdqzqLveu863U04ADFNJiE8EEANHLM3s+0=; b=rN13WwrEV/ORfKCZvthqR85gFs
	RvbL1g89W1iLTUQ94UH8RzmEbitnXQ2IYBZKRnvmnw2hbgZAh0VurfDcvQIe7KcXykS6Xh/5RYvCv
	Dwj43RdsAi4unslP/pg7CEl3VnZL90PFcqkV7b8kx6IFW8jTtSjoaA5UTTFQhnI2XW1uByIGeA+Eh
	11K7WbFVa2i2ZGet7WHlFHLmlu+JfWRjhYUeHgTfvSrxhgOKFizV9oQ0vrKlO/7iKaAjS40KBqKMf
	ysGPBaph7kPdptRN5tsqpGk4Bs1oKd/DbG8n4MCk2KqvqKOc0zQSGCTYbbIZb+wz3WLS808bBX9ng
	XjIY0j8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsXP-00000006wvN-0wHb;
	Fri, 29 May 2026 08:25:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsXM-00000006wus-28Pm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:25:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26BB920E3;
	Fri, 29 May 2026 01:25:41 -0700 (PDT)
Received: from [10.57.91.162] (unknown [10.57.91.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3B03F632;
	Fri, 29 May 2026 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780043146; bh=XELYFuViuZqrLLxfdD4PGyPtxf/Au3oWznf3FJ0ages=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nLeLgcyf0k0ldux0TFh1jZXIYKRbC8G2USuqOmM/9EmYadwJutsqHi6rAS3wJ4LeP
	 LQ0tUrmOO60rTr/DJhKXdMc6ZEjfiLBQ3YU7iRkmjIzZx6xkLa0FfaMwWkTN/fTA4l
	 YY6GEpLN1I96rm5mjpzFJBCMsGNrpegHKxst0bvg=
Message-ID: <9493da99-3476-4fdd-818b-19e424b46f8e@arm.com>
Date: Fri, 29 May 2026 10:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/15] arm64: mm: Permit contiguous attribute for
 preliminary mappings
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-25-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260526175846.2694125-25-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_012548_633998_733D7066 
X-CRM114-Status: GOOD (  26.54  )
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

On 26/05/2026 19:58, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> There are a few cases where we omit the contiguous hint for mappings
> that start out as read-write and are remapped read-only later, on the
> basis that manipulating live descriptors with the PTE_CONT attribute set
> is unsafe. When support for the contiguous hint was added to the code,
> the ARM ARM was ambiguous about this, and so we erred on the side of
> caution.
>
> In the meantime, this has been clarified [0], and regions that will be
> remapped in their entirety, retaining the contiguous bit on all entries,
> can use the contiguous hint both in the initial mapping as well as the
> one that replaces it. Note that this requires that the logic that may be
> called to remap overlapping regions respects existing valid descriptors
> that have the contiguous bit cleared.
>
> So omit the NO_CONT_MAPPINGS flag in places where it is unneeded.
>
> Thanks to Ryan for the reference.
>
> [0] RJQQTC
>
> For a TLB lookup in a contiguous region mapped by translation table entries that
> have consistent values for the Contiguous bit, but have the OA, attributes, or
> permissions misprogrammed, that TLB lookup is permitted to produce an OA, access
> permissions, and memory attributes that are consistent with any one of the
> programmed translation table values.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  arch/arm64/mm/mmu.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 55bb40348a47..04cc579c7a15 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1016,8 +1016,7 @@ void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
>  			&phys, virt);
>  		return;
>  	}
> -	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
> -				 NO_CONT_MAPPINGS);
> +	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
>  }
>  
>  void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
> @@ -1044,8 +1043,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
>  		return;
>  	}
>  
> -	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
> -				 NO_CONT_MAPPINGS);
> +	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
>  
>  	/* flush the TLBs after updating live kernel mappings */
>  	flush_tlb_kernel_range(virt, virt + size);
> @@ -1191,10 +1189,8 @@ static void __init map_mem(void)
>  	 * alternative patching has completed). This makes the contents
>  	 * of the region accessible to subsystems such as hibernate,
>  	 * but protects it from inadvertent modification or execution.
> -	 * Note that contiguous mappings cannot be remapped in this way,
> -	 * so we should avoid them here.
>  	 */
> -	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
> +	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, 0);
>  	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
>  }
>  

