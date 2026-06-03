Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56EDCD6E69
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrbiXUlsk45eySsbtONrBewq/djyZBhyYFXfnKgyx7M=; b=XL6STYV0t3OcXHcuiOhLhUKSVl
	wCKvbEngF2e6ONZccDfScn3BDdFbz2VH5nSDmjW0oLY2v+JVn4ez80ueBj4AtLq+GFPut6rMLlNf4
	QhtAvPG5zTO9bi7si1LjL2ru8kEiLMvEJR7BzFow/gNIU5Yxe570AUG/jM5QIAwUcxJGkhvF5PYmh
	yUphawKttqM4wDaUnWKnmk9gHjfQMVzNroJF5NduJiz1GLc8KGAvdrMGFD7AXzT6fplbdQI4K6g7E
	TG43EbnH4wdxXHrG4vxVOrDMAfSCNYAVBTJfpRtzkutaFPbUPscPq8ZajYW3fQNzsLuKiqkgyO2tu
	onneFBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpvy-0000000FcwQ-2DIe;
	Wed, 03 Jun 2026 18:03:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpvv-0000000Fcvp-35nP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 18:03:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36b903567fdso6261596a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780509794; x=1781114594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrbiXUlsk45eySsbtONrBewq/djyZBhyYFXfnKgyx7M=;
        b=O9HL8SEKYkKk4vV/V9S7t+spWZFP6ZrfSPDz9Bve15gVgtbGUl8XyykPGOlJXX4wAK
         w1pG//J4iKBheSsee+1A62ZXkMCr7gQzN61mYqovqjJxpyGkn3fhwwLO2vuUNjon2om3
         xOst8nyWk48RhT6dJFxiopu2pRfEqZYHuKOXIlqx/zB9XRtSeGRTELt782tR2ai31USK
         320o6GqYxJmSpmnVWeiqaflESvPIUT5A5P3KDFzRA4uqgFnSFowWY5Gj6svKHqehQUhA
         FDxt4mF209reXafxi8SeyhIAjwJdIgQnubdKWv1MfMqAFyT2+JTX9qAWOxN8BumJGvKb
         9Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780509794; x=1781114594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrbiXUlsk45eySsbtONrBewq/djyZBhyYFXfnKgyx7M=;
        b=MYyLLGQRrXGF6uXLB8qT2bUN2nruGoCtaK7qvPiNsA+wU0f+ROOz7eDiHU3gYt5ELe
         eyzBNtF9BFVVXSDK6Li8JNyRt0iXfpmzFBm+X0kAnvwcwACv0dW+hfzBMYclpeUZr/ic
         CvFKnRBLTdaNYrFm9Ab3vFBX45KOvoiDdAyQaYshuJriUk/DLXFJe+pZI7BrjgwuWFHN
         nr9MTWY31N5hV4b+CcPKhpbf3HxNvlvojV2oFzbXuV8m1nuPiKNZkFE/zPdratdcM85W
         PS8I3l2km1fDvfIcEtj/qzESKfnecjmwxA5MG+g6EPh4mztkI1A25npClpBvdrB5ME4w
         nSXw==
X-Gm-Message-State: AOJu0YztHmUZAVoUY6Ae/5bOxAA86TEAH5KnMZdaNV0SH3xniwOf58/2
	2eO4863u2hicoVrBATRaFhVirbKQvyv1bHAQQ8kOBomkgf4y1eZg+F1m
X-Gm-Gg: Acq92OFfciMI4U02zQ0NX4hiFGN1Z878N/HHDfH6oPUqU7yJNlVYaXNfuEEc8sfKyFP
	wgRXoBwf0gfbx5z6R9u3k/B0ISa2v1jaI/WBx7v4Mxp5yDUroAVXeiiZjjr/b2Nqg9wjJVjKfsM
	mXw2i0j7G5FvnpCdmvPqfP10OgDtW2EXwlwKtJDcUqubUIK0qPOtrwRz65NtgvhgqffpHnW2WCH
	teYZiBmCkwF2NVf8Ou2/ZfHQLfbEbmC3+7PdeFlAODcTvDyHoViIOleMy/nFqs2fk8sNgAIj8a3
	OctBbniTpxYX/edskN1G4pbymrTuX3E63H2F7vJ2tD59n1ZRXkdNUG5V1Mkk6HlJ5tZD3HluBp0
	n3L67Tp9TSsWbOxTI24L2843ZYEkMDcckeYS9zQULada+lBZ2Sc3FFdf8MYditRD/P7XIlULzsa
	SJixOE3WGsV/wg25hFtenC+krszuTlcA3eG/+NeUoh84qlKFdOEPF4szrRTUPccumFIEHeKs2sP
	mcmkD11Pw==
X-Received: by 2002:a17:90b:3f90:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36e319bff94mr4221552a91.26.1780509794151;
        Wed, 03 Jun 2026 11:03:14 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d1fec5asm331867a91.10.2026.06.03.11.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:03:13 -0700 (PDT)
Date: Wed, 3 Jun 2026 23:33:03 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v7 11/15] powerpc/code-patching: Avoid r/w mapping of the
 zero page
Message-ID: <aiBsMg9WdDy-dRk_@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260529150150.1670604-17-ardb+git@google.com>
 <20260529150150.1670604-28-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529150150.1670604-28-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_110315_782992_4DAB408E 
X-CRM114-Status: GOOD (  28.45  )
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

On Fri, May 29, 2026 at 05:02:02PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The only remaining use of map_patch_area() is mapping the zero page, and
> immediately unmapping it again so that the intermediate page table
> levels are all guaranteed to be populated.
> 
> The use of the zero page here is completely arbitrary, and not harmful
> per se, but currently, it creates a writable mapping, and does so in a
> manner that requires that the empty_zero_page[] symbol is not
> const-qualified.
> 
> Given that this is about to change, and that map_patch_area() now never
> maps anything other than the zero page, let's simplify the code and
> - remove the helpers and call [un]map_kernel_page() directly
> - take the PA of empty_zero_page directly
> - create a read-only temporary mapping.
> 
> This allows empty_zero_page[] to be repainted as const u8[] in a
> subsequent patch, without making substantial changes to this code
> patching logic.
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> Link: https://lore.kernel.org/all/20260520085423.485402-1-ardb@kernel.org/
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/powerpc/lib/code-patching.c | 52 +-------------------
>  1 file changed, 2 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index f84e0337cc02..44ff9f684bef 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -60,9 +60,6 @@ struct patch_context {
>  
>  static DEFINE_PER_CPU(struct patch_context, cpu_patching_context);
>  
> -static int map_patch_area(void *addr, unsigned long text_poke_addr);
> -static void unmap_patch_area(unsigned long addr);
> -
>  static bool mm_patch_enabled(void)
>  {
>  	return IS_ENABLED(CONFIG_SMP) && radix_enabled();
> @@ -117,11 +114,11 @@ static int text_area_cpu_up(unsigned int cpu)
>  
>  	// Map/unmap the area to ensure all page tables are pre-allocated
>  	addr = (unsigned long)area->addr;
> -	err = map_patch_area(empty_zero_page, addr);
> +	err = map_kernel_page(addr, __pa_symbol(empty_zero_page), PAGE_KERNEL_RO);
>  	if (err)
>  		return err;
>  
> -	unmap_patch_area(addr);
> +	unmap_kernel_page(addr);
>  
>  	this_cpu_write(cpu_patching_context.area, area);
>  	this_cpu_write(cpu_patching_context.addr, addr);
> @@ -233,51 +230,6 @@ static unsigned long get_patch_pfn(void *addr)
>  		return __pa_symbol(addr) >> PAGE_SHIFT;
>  }
>  
> -/*
> - * This can be called for kernel text or a module.
> - */
> -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> -{
> -	unsigned long pfn = get_patch_pfn(addr);
> -
> -	return map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
> -}
> -
> -static void unmap_patch_area(unsigned long addr)
> -{
> -	pte_t *ptep;
> -	pmd_t *pmdp;
> -	pud_t *pudp;
> -	p4d_t *p4dp;
> -	pgd_t *pgdp;
> -
> -	pgdp = pgd_offset_k(addr);
> -	if (WARN_ON(pgd_none(*pgdp)))
> -		return;
> -
> -	p4dp = p4d_offset(pgdp, addr);
> -	if (WARN_ON(p4d_none(*p4dp)))
> -		return;
> -
> -	pudp = pud_offset(p4dp, addr);
> -	if (WARN_ON(pud_none(*pudp)))
> -		return;
> -
> -	pmdp = pmd_offset(pudp, addr);
> -	if (WARN_ON(pmd_none(*pmdp)))
> -		return;
> -
> -	ptep = pte_offset_kernel(pmdp, addr);
> -	if (WARN_ON(pte_none(*ptep)))
> -		return;
> -
> -	/*
> -	 * In hash, pte_clear flushes the tlb, in radix, we have to
> -	 */
> -	pte_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> -}
> -
>  static int __do_patch_mem_mm(void *addr, unsigned long val, bool is_dword)
>  {
>  	int err;
> -- 
> 2.54.0.823.g6e5bcc1fc9-goog
> 
I don't see any functional change.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

