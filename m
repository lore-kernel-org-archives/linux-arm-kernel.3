Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A214BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 04:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufexy5i692lebLA4hhJSD93mhE+sAXBdXxBoWGxvQf8=; b=eBhRC6bfjroK8bhigHvKh1qe1C
	8DBgHe6LM7kqWk1lM9B7GjhuUNj1D2piInBNvTlZ/nLRH84K9reRltRbNn4/PwREaRBNIYFqu0zMZ
	cvTSFWUBOa5eIqTtkRDban1ltD10zYlOQooX9riuackboVUd0cB7fLRFlKYcdYxNhrpH3dAsa5SB6
	ErIjfT8FWmw2fg/IhrwHJAhBeLdWpkR24MKYZ//3ILoBeb1phx4+1U8bU1APXgYEp06sga1utbgCK
	oKtptPQGbK5YUbIXyLFc7wMMeenagcLRvxzdrCnN2VEIciUxyHvym7zOEgFrU/0g50rXe3tYTgPoY
	BW+9rUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0YQl-0000000AjSR-23V9;
	Fri, 04 Apr 2025 04:13:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0YOw-0000000AjMf-2kMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 04:11:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5EC51516;
	Thu,  3 Apr 2025 21:11:29 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A59C83F59E;
	Thu,  3 Apr 2025 21:11:22 -0700 (PDT)
Message-ID: <4b706492-abaf-44f9-92dc-ba5aadc80c31@arm.com>
Date: Fri, 4 Apr 2025 09:41:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] arm64/mm: Hoist barriers out of set_ptes_anysz()
 loop
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-7-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-7-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_211130_748108_EB4BDB07 
X-CRM114-Status: GOOD (  20.51  )
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



On 3/4/25 20:34, Ryan Roberts wrote:
> set_ptes_anysz() previously called __set_pte() for each PTE in the
> range, which would conditionally issue a DSB and ISB to make the new PTE
> value immediately visible to the table walker if the new PTE was valid
> and for kernel space.
> 
> We can do better than this; let's hoist those barriers out of the loop
> so that they are only issued once at the end of the loop. We then reduce
> the cost by the number of PTEs in the range.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index e255a36380dc..1898c3069c43 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -317,13 +317,11 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>  	WRITE_ONCE(*ptep, pte);
>  }
>  
> -static inline void __set_pte(pte_t *ptep, pte_t pte)
> +static inline void __set_pte_complete(pte_t pte)
>  {
> -	__set_pte_nosync(ptep, pte);
> -
>  	/*
>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
> -	 * or update_mmu_cache() have the necessary barriers.
> +	 * has the necessary barriers.
>  	 */
>  	if (pte_valid_not_user(pte)) {
>  		dsb(ishst);
> @@ -331,6 +329,12 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>  	}
>  }
>  
> +static inline void __set_pte(pte_t *ptep, pte_t pte)
> +{
> +	__set_pte_nosync(ptep, pte);
> +	__set_pte_complete(pte);
> +}
> +
>  static inline pte_t __ptep_get(pte_t *ptep)
>  {
>  	return READ_ONCE(*ptep);
> @@ -647,12 +651,14 @@ static inline void set_ptes_anysz(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>  
>  	for (;;) {
>  		__check_safe_pte_update(mm, ptep, pte);
> -		__set_pte(ptep, pte);
> +		__set_pte_nosync(ptep, pte);
>  		if (--nr == 0)
>  			break;
>  		ptep++;
>  		pte = pte_advance_pfn(pte, stride);
>  	}
> +
> +	__set_pte_complete(pte);
>  }
>  
>  static inline void __set_ptes(struct mm_struct *mm,

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

