Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E17EC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 05:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGqiGPGbm+dicx6Pe88cvPL8KDO/CfoaA36HltATy38=; b=niQXgJgSAGMi/1mBynm0rP4CsN
	u2mbDZ7k+N4y6qdjI5z0Q246Hc4SM83dQK2ajpTTScQx+eFAEKfVpHmFBXkPq+PaB46NSe0ZyI2ny
	BeqSbyi9NpNYeMrwFXNyy7aqSiv9c9bYb6lzDzGFhBmX8RTgoGAM0OCookD2joT28Fuj/yiNtl784
	4Hxd6Y6kKq6SHZ2vhH0AxoD/Vrz2t56ifTouUASPUmSUdTcNVwQfow1LQsv4Iy0E1F13Xw7V5/9kL
	K9rKiOTQ38mzWE5GKyvfB+NZEc9jL4wWeqXefGMYpB/moTe53TST3MQLaboBP2E/lXTAE+2wmpCQ0
	G5LA0LBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgH3B-00000008NnM-2RuH;
	Fri, 07 Feb 2025 05:37:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgH1n-00000008Nfq-1zuS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 05:35:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E11106F;
	Thu,  6 Feb 2025 21:36:07 -0800 (PST)
Received: from [10.162.16.89] (a077893.blr.arm.com [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681BE3F63F;
	Thu,  6 Feb 2025 21:35:39 -0800 (PST)
Message-ID: <858ecac5-9ba7-48da-8f34-ffda28d17609@arm.com>
Date: Fri, 7 Feb 2025 11:05:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/16] arm64/mm: Hoist barriers out of ___set_ptes()
 loop
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-9-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-9-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_213547_554388_636C7811 
X-CRM114-Status: GOOD (  19.78  )
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



On 2/5/25 20:39, Ryan Roberts wrote:
> ___set_ptes() previously called __set_pte() for each PTE in the range,
> which would conditionally issue a DSB and ISB to make the new PTE value
> immediately visible to the table walker if the new PTE was valid and for
> kernel space.
> 
> We can do better than this; let's hoist those barriers out of the loop
> so that they are only issued once at the end of the loop. We then reduce
> the cost by the number of PTEs in the range.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 3b55d9a15f05..1d428e9c0e5a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -317,10 +317,8 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
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
>  	 * or update_mmu_cache() have the necessary barriers.
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
> @@ -647,12 +651,14 @@ static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
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

Given that the loop now iterates over number of page table entries without corresponding
consecutive dsb/isb sync, could there be a situation where something else gets scheduled
on the cpu before __set_pte_complete() is called ? Hence leaving the entire page table
entries block without desired mapping effect. IOW how __set_pte_complete() is ensured to
execute once the loop above completes. Otherwise this change LGTM.

>  }
>  
>  static inline void __set_ptes(struct mm_struct *mm,

