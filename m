Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943C3CD0430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df8np2uEIXmaXEkqGXMCaoRv9VuNrEKRw9S2nvWPR4k=; b=r4BVq6tpapDqVQ7mGjlPG5PKr1
	vA/btWjoup3s6jTLWjm2tgb4LBtasyc3uFStW62VpJ1yQ6Wiz2AxUInOZ2xHXhCxcuzxHWhbjsWb/
	5Zm05JW/9/X/5kjwIyaSpiiLFLALMyK2F4aX9ER77EAYGcrNQGQ4AJFYsIZlKadHpR6dVb9Adi+7q
	v3QbIDrOCliBLxAp41/0/e6r7zgA0oqg/tuSvOyilSZcTOlRpkZ0dR7SeJyVYplrzuTj3rfsdu9jn
	nIrzjzP0ycluoFdtZrN8ygTJflZZBUvAMmAbnrP7fjPXMB5k06QGon80oFeXEOvPaZ4kOql29De69
	BChzpxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxhh-0000000CNSN-3NqT;
	Tue, 06 Jan 2026 03:25:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxhf-0000000CNRU-0NHZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 03:25:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 033A5497;
	Mon,  5 Jan 2026 19:25:42 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 034CE3F694;
	Mon,  5 Jan 2026 19:25:47 -0800 (PST)
Date: Tue, 6 Jan 2026 08:55:44 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 09/13] arm64: mm: Refactor flush_tlb_page() to use
 __tlbi_level_asid()
Message-ID: <aVyAuMxJQ2mXpFd1@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-10-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-10-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_192551_166064_189E4E46 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Dec 16, 2025 at 02:45:54PM +0000, Ryan Roberts wrote
> Now that we have __tlbi_level_asid(), let's refactor the
> *flush_tlb_page*() variants to use it rather than open coding.
> 
> The emitted tlbi(s) is/are intended to be exactly the same as before; no
> TTL hint is provided. Although the spec for flush_tlb_page() allows for
> setting the TTL hint to 3, it turns out that
> flush_tlb_fix_spurious_fault_pmd() depends on
> local_flush_tlb_page_nonotify() to invalidate the level 2 entry. This
> will be fixed separately.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 3b72a71feac0..37c782ddc149 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -327,12 +327,8 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  static inline void __local_flush_tlb_page_nonotify_nosync(struct mm_struct *mm,
>  							  unsigned long uaddr)
>  {
> -	unsigned long addr;
> -
>  	dsb(nshst);
> -	addr = __TLBI_VADDR(uaddr, ASID(mm));
> -	__tlbi(vale1, addr);
> -	__tlbi_user(vale1, addr);
> +	__tlbi_level_asid(vale1, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
>  }
>  
>  static inline void local_flush_tlb_page_nonotify(struct vm_area_struct *vma,
> @@ -354,12 +350,8 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>  static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>  					   unsigned long uaddr)
>  {
> -	unsigned long addr;
> -
>  	dsb(ishst);
> -	addr = __TLBI_VADDR(uaddr, ASID(mm));
> -	__tlbi(vale1is, addr);
> -	__tlbi_user(vale1is, addr);
> +	__tlbi_level_asid(vale1is, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
>  						(uaddr & PAGE_MASK) + PAGE_SIZE);
>  }

Reviewed-by: Linu Cherian <linu.cherian@arm.com>


