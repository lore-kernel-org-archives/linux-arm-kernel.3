Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1DDC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVGik8tUK2Eo3+gGsUH9By9lsTNY8cPP8vnZtrKoVQQ=; b=UQOdWIq8lCk/aV9fJ4BQ6te+lO
	oeSAjyFw8bvA5HKYO8nrGXVwrW9oO5uvLwpCprSP+78Ois+NkWwTZQhg0KpEqcGVzWA3SmWIsIsxB
	whhgl+JozZRzUblUpjDYJw6YG+pidFjQqaOpA9U3ReOIsBD1L3BiNvWvfWixVvRJp5WhIidrw/DcT
	uoL3Cn/ilk25LBnbtKhmSrFiykAvAOZ3Fg8LvlugoEBndHt0SRCjIe6TKV26xXsxJgNVzj01E8bwS
	ANplM/S8u9cRnxJH/Te5tDMSTwwY2wdwyPRmBd1LwkhZbA0octx+o4t0xxEHfdVENMOdIrh4NeEpi
	ZE5qRntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DxJ-00000007uQL-0TBy;
	Thu, 03 Apr 2025 06:21:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DvA-00000007u5u-1X6p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 664735C6819;
	Thu,  3 Apr 2025 06:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9FDC4CEE3;
	Thu,  3 Apr 2025 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743661163;
	bh=EvqXwivD/+vI4n0GdMLSQHkVGzb6oXmJqRJHBqhD9eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSwd04mc4mf3SFl87S8YfHk42W4p+Z7xmeooLWnrflOXK3KgEEdGCJjqFg6C+7FWA
	 rjXR8FsGRCYXPG1nUtRssXOcN1wCP0bLvvYjuqsZUM827E40OKvMStFAWmi4A85eqw
	 B86uFJePNuxUC21qsUt9Udc2UHKKc04FXRP5PrRVxy7gKq0gAJkkMztGKF8PS91wNp
	 q6LaJPUv9yABlUZ+Xg41OELKX+4ub4ij4DFW2q2RIlm6z8wobIL4etvXXqkz7GezWc
	 YAqVyyNoNpXti/2lnFNt8YJ/WhUBuVUKq6HhmnBw8dMzWbNmU784nthcSk5MuzQkbL
	 g7A6ZYZRml9Mg==
Date: Thu, 3 Apr 2025 09:19:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH 1/3] mm: Introduce for_each_valid_pfn() and use it
 from reserve_bootmem_region()
Message-ID: <Z-4oYlsAzZ6OQHCH@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402201841.3245371-1-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_231924_516029_C0517C86 
X-CRM114-Status: GOOD (  30.83  )
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

On Wed, Apr 02, 2025 at 09:18:39PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Especially since commit 9092d4f7a1f8 ("memblock: update initialization
> of reserved pages"), the reserve_bootmem_region() function can spend a
> significant amount of time iterating over every 4KiB PFN in a range,
> calling pfn_valid() on each one, and ultimately doing absolutely nothing.
> 
> On a platform used for virtualization, with large NOMAP regions that
> eventually get used for guest RAM, this leads to a significant increase
> in steal time experienced during kexec for a live update.
> 
> Introduce for_each_valid_pfn() and use it from reserve_bootmem_region().
> This implementation is precisely the same naïve loop that the function
> used to have, but subsequent commits will provide optimised versions
> for FLATMEM and SPARSEMEM, and this version will remain for those
> architectures which provide their own pfn_valid() implementation,
> until/unless they also provide a matching for_each_valid_pfn().
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/mmzone.h | 10 ++++++++++
>  mm/mm_init.c           | 23 ++++++++++-------------
>  2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 25e80b2ca7f4..32ecb5cadbaf 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -2176,6 +2176,16 @@ void sparse_init(void);
>  #define subsection_map_init(_pfn, _nr_pages) do {} while (0)
>  #endif /* CONFIG_SPARSEMEM */
>  
> +/*
> + * Fallback case for when the architecture provides its own pfn_valid() but
> + * not a corresponding for_each_valid_pfn().
> + */
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
> +	for ((_pfn) = (_start_pfn); (_pfn) < (_end_pfn); (_pfn)++)	\
> +		if (pfn_valid(_pfn))
> +#endif
> +
>  #endif /* !__GENERATING_BOUNDS.H */
>  #endif /* !__ASSEMBLY__ */
>  #endif /* _LINUX_MMZONE_H */
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index a38a1909b407..7c699bad42ad 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -777,22 +777,19 @@ static inline void init_deferred_page(unsigned long pfn, int nid)
>  void __meminit reserve_bootmem_region(phys_addr_t start,
>  				      phys_addr_t end, int nid)
>  {
> -	unsigned long start_pfn = PFN_DOWN(start);
> -	unsigned long end_pfn = PFN_UP(end);
> +	unsigned long pfn;
>  
> -	for (; start_pfn < end_pfn; start_pfn++) {
> -		if (pfn_valid(start_pfn)) {
> -			struct page *page = pfn_to_page(start_pfn);
> +	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
> +		struct page *page = pfn_to_page(pfn);
>  
> -			init_deferred_page(start_pfn, nid);
> +		init_deferred_page(pfn, nid);
>  
> -			/*
> -			 * no need for atomic set_bit because the struct
> -			 * page is not visible yet so nobody should
> -			 * access it yet.
> -			 */
> -			__SetPageReserved(page);
> -		}
> +		/*
> +		 * no need for atomic set_bit because the struct
> +		 * page is not visible yet so nobody should
> +		 * access it yet.
> +		 */
> +		__SetPageReserved(page);
>  	}
>  }
>  
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.

