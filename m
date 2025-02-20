Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB348C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THBQ8rmEsPvpqpvxaWqxGrUia96m2+SW0Egbj+rhtyc=; b=wvEvumKETg7C37PG4/WMygIKA+
	Wqar+srBlCpYod7k0jKoJ7qBoMx5R7M40xy5T7d92LZH8pYmIkJmwaeK527qYDzBOchwo6sHoq3uw
	JF8z5VJeoh/dtQsnsX6R279fw0BEhyJynhvAdV3K2q1MmaVzeqPNo3+ZKXKHYPnNtuhFbmGDOJzcn
	hycMkK4GPuWtpN5lBWG1XyHQLqKOEc9YsB8vrCGhWolC+li4ANYAGRkEt5MktNsgotrJuuWUsDnv1
	BgyulomxasA12JHJLp6eJd4FTal2PQymvj0onwkSHU0IKjnx8P0mEPgHYTYqyMq2v/v202xkVbhLB
	uP9kdPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5KO-00000000hmH-1v4l;
	Thu, 20 Feb 2025 12:06:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5It-00000000hPn-43tV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:05:21 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5452d9d0d47so747753e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740053117; x=1740657917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=THBQ8rmEsPvpqpvxaWqxGrUia96m2+SW0Egbj+rhtyc=;
        b=lMlfRJA1YtNpqTmZ2FkfSUiG2KSE4SGLUNWD8RHCbDDaHUJ3tezwYvzL67ApFx8JeR
         sX6H8nESQe27CI8qnX/2TyAA+kI7YXLtFaTQnR+2EHDNJwAT0IMsLan77Q7lpeqez4pW
         CeaUf/p/Z7Nlhh8pX5NNWvgnX82e8CLAx7kTIKWfdqcuFZnSYQvgiehSPlAtRZpLdpcT
         N7fZqyRAMxzRG7fnubTUhNRxb5Sq4ClKg6pZexkRAdKwTwfPeFjiNeszVVqOro14ISgW
         WgYT74Bfy1yVQOo5qA5uRW9tKnCeSJH1PsCmAnoLmlWIpf5kStYGcQj3zpdqmX1iZIw8
         hN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053117; x=1740657917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THBQ8rmEsPvpqpvxaWqxGrUia96m2+SW0Egbj+rhtyc=;
        b=AXT31kE8OI3UpikGCvd3Nu1m8i7Eq1ImG35PazW2eQKRUpr0bDzCOFOcscaQRbcApH
         pVCX9EyhVLhHAaUNzegSNTKVMwCY9R3IKmGUlHMPIj7AXx/IGXwuS9eAcw8TNpVWU5QA
         3ZvkCupttfEANeDPS6ufchNmM52a36RVna8Hjie7A+NlTqSVDmG4rkqsbZiSQ5JtVPmC
         lv5rUWGPMZeK5tQZUmxbb8iWd79VCZvvAu2dZSePBT4xzcsXgYcVsjIBc6pqgnyWII7X
         j3zI7L5/TEHVY6bYULZoriOnwjQXDjppaPvX59K9BXbRD34WMrItMybu7j7Xln9K2pM7
         tHQg==
X-Forwarded-Encrypted: i=1; AJvYcCXNqMEkpsS8wvJZeGEfTR6FdEUmBPe/fD/3aFHWHOxZOmg76cUQpLG8m68695PrDOvI6WjTFWnetOZr78ele/j9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8m/vgYi2uVa3yHDBNMCae6n/pt92rDCG+G+YVmCUWxfsq/9Hf
	kCpmaaYd/KiSqrOPL+QWm2aBAt/9ZdHiIwXqetvyEQNWDSNPWK6STkvSYg==
X-Gm-Gg: ASbGncvb5jkSfupdinCgr7PSjxF0NfMOy4Xvk5Ij8PUiNJBYUBlW+VGrtc0ZpSYw9oe
	qaDpUBFiVEvnt2M8lLb1IFH5W5N99QGImS/RECLmmQGFkDF47CQslHvIcv98mzan03hwauBYk8w
	uOeore8KJ/K5SKyvPz6bXaDFkZtC/oIDuCS+IUve+EiO7vrX1i6JhKQ3+5RJwgN0rZTVCtP6SVP
	9i8evxKmzQbfmlmxYjGt8Wnb9iJQEI7ZPvlysqb2yLPzRs2ow//9jJD82qKeomZS3uQXcKfuO3g
	vF6aIagpU/ojicGkoIpZ0YflMs7Z9gWX5IQO8A==
X-Google-Smtp-Source: AGHT+IGU5Vj5wxkWmZvV2e5nDdV1F53jASdsNyEf9xpcKbnZG5GFBzqm4iMH2LcngNhowR1UMJ7hEg==
X-Received: by 2002:a05:6512:3da2:b0:545:2e76:495c with SMTP id 2adb3069b0e04-5462eef4ae8mr2656543e87.25.1740053117049;
        Thu, 20 Feb 2025 04:05:17 -0800 (PST)
Received: from pc636 (host-95-203-6-24.mobileonline.telia.com. [95.203.6.24])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461addb00esm1538710e87.198.2025.02.20.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:05:16 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 20 Feb 2025 13:05:13 +0100
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/14] mm/vmalloc: Gracefully unmap huge ptes
Message-ID: <Z7caeYrH6vKFCZgN@pc636>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-10-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140809.1702789-10-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_040520_007023_B5AF486F 
X-CRM114-Status: GOOD (  28.42  )
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

On Mon, Feb 17, 2025 at 02:08:01PM +0000, Ryan Roberts wrote:
> Commit f7ee1f13d606 ("mm/vmalloc: enable mapping of huge pages at pte
> level in vmap") added its support by reusing the set_huge_pte_at() API,
> which is otherwise only used for user mappings. But when unmapping those
> huge ptes, it continued to call ptep_get_and_clear(), which is a
> layering violation. To date, the only arch to implement this support is
> powerpc and it all happens to work ok for it.
> 
> But arm64's implementation of ptep_get_and_clear() can not be safely
> used to clear a previous set_huge_pte_at(). So let's introduce a new
> arch opt-in function, arch_vmap_pte_range_unmap_size(), which can
> provide the size of a (present) pte. Then we can call
> huge_ptep_get_and_clear() to tear it down properly.
> 
> Note that if vunmap_range() is called with a range that starts in the
> middle of a huge pte-mapped page, we must unmap the entire huge page so
> the behaviour is consistent with pmd and pud block mappings. In this
> case emit a warning just like we do for pmd/pud mappings.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/vmalloc.h |  8 ++++++++
>  mm/vmalloc.c            | 18 ++++++++++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 31e9ffd936e3..16dd4cba64f2 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -113,6 +113,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, uns
>  }
>  #endif
>  
> +#ifndef arch_vmap_pte_range_unmap_size
> +static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
> +							   pte_t *ptep)
> +{
> +	return PAGE_SIZE;
> +}
> +#endif
> +
>  #ifndef arch_vmap_pte_supported_shift
>  static inline int arch_vmap_pte_supported_shift(unsigned long size)
>  {
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a7e34e6936d2..68950b1824d0 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -350,12 +350,26 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			     pgtbl_mod_mask *mask)
>  {
>  	pte_t *pte;
> +	pte_t ptent;
> +	unsigned long size = PAGE_SIZE;
>  
>  	pte = pte_offset_kernel(pmd, addr);
>  	do {
> -		pte_t ptent = ptep_get_and_clear(&init_mm, addr, pte);
> +#ifdef CONFIG_HUGETLB_PAGE
> +		size = arch_vmap_pte_range_unmap_size(addr, pte);
> +		if (size != PAGE_SIZE) {
> +			if (WARN_ON(!IS_ALIGNED(addr, size))) {
> +				addr = ALIGN_DOWN(addr, size);
> +				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
> +			}
> +			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
> +			if (WARN_ON(end - addr < size))
> +				size = end - addr;
> +		} else
> +#endif
> +			ptent = ptep_get_and_clear(&init_mm, addr, pte);
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  
> -- 
> 2.43.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>


Uladzislau Rezki

