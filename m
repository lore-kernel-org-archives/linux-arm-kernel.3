Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13CAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHYabRsisvvewRt2ZD66z6lVds8DGMm4+9hPyYbZNl0=; b=iKxTasnHbVBCJ651DnEt0UH0tW
	BcwlP3pykh4niu3Xn4NeWir1Cc9S/dJkrb60SILLPRWfGY0U+oca++L6SDr+mqjv8SJ1z7R9tetMb
	QgwIPFXZuQbRhJOrsS3M0Zxr+JUiKPdgRD2vYb3nYSwztJ7j+AxXM+sNZ3qwh7naVSy5Hh3RFhT1Q
	ddOwiKzHQ+E5d/dgeJcSpIBBwKD2o2wXGj2Mofi4UIv5v54D2C7gVdQ3uH1t5yM4CN2nd2v3bKgXe
	HeazoLqDWB2Sei8phWWJoKl0xJ1gGWfd6xOjjPrOMgqjwTTmF+8evUjQ7QL77nfmo5eVPTRTSUtd0
	zlk/7IpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnDg-0000000B3pN-3AKn;
	Thu, 27 Mar 2025 13:24:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmwW-0000000B1Oe-2CrX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:06:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so1132159e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 06:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080802; x=1743685602; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHYabRsisvvewRt2ZD66z6lVds8DGMm4+9hPyYbZNl0=;
        b=VKelR9ZOAHw2g/hOi7+b2LQxIHvhd26k33e6TRwjsDeDsbRTFz+NDNFRS6Gpbs7LPU
         e79YX6i+uDoVzLjxrIkDhoqqkLVQq/6QrKlP2hVpAVsdouk2A06DcH+rYwTM7S53xLIb
         KRVbj8vkURsNyEMGG4JlJDhGdGrRd0ulYa1vxPNfQXXon3qGrqIYRXbbnAl5iL6zE/tS
         UZ2J5Kh5ZRwoHYGHYVgj1bfNHmtPYcS8HTfhnoVplvO6FHIy8O3NAsO86jL0uI7Syfdi
         MZ8K9UByZ+d0KwAIPXSfapFRY1Jv4uf2ej5sMlBtRkCi9JyjN/YwryC1aH2Idb4wHWhs
         dTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080802; x=1743685602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHYabRsisvvewRt2ZD66z6lVds8DGMm4+9hPyYbZNl0=;
        b=XGDj4RQLn9T54dBiMN7Wrj1kz03Qoa+QFwlYe5tVXho0zXvS9H6RoBfnOqk0h/vE0p
         AqkLr8pBx71QKPFaKFXnRrYL2iS1R7VzfVAh2qPnOJAViu5YY5hYgE6PlZBOJfi1O7/o
         dtjCP/zouBqPeSS/eEQRME7TYTkauImtaVXGW85TX9vezrq1TjSpq0LcPP2puiMGccAF
         eRYpOYiGR/JCbfnzYK+L+gHAPc9kqzkpOBK86uZ1hH+e29UbcmEeSHffYvhe5JT+3+je
         Eg0YzoT1WWKXsAoBCbaWkcp5DiUN1KAmuljQJVflzYSBjX1wdm8IWM+Yuh/xmHnch1hB
         bujg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8XOCsp1mYhnVOmJOTC6WKnUaNBpNLBPwat3mxCkOh4iAz7sfqCWpBT4wJJC7S6suS1Zn3DS05RXGSQTeXfDv@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3Qf15BLjRk4CWsdK1bUBh2bVwwSblgLZySPjexDX0+k8u7GJ
	Jl+YXo38Qdf/X9XwuufImt6xw6UWkLUYm6CR6/bAIConGNADu72B
X-Gm-Gg: ASbGncut43bWif1LNyvQRAkuv2b5lEINKREsHl+U2OIw9MbcSUGrNDC5sI3U+3DiOV9
	E5cb4RBjWKjlyya7G0VabbZUMGCDHUE4IahoQMVdA6h2cx1mHr3UZ9Lojro17wt6CbaK2tKDrDM
	+vvSvL5wzYY2+mO0JhbiKU3TRdKVMhxe0AQ6DzL9IY02bihknEZfJhNAnAoNpfEbcaxEv52dLXu
	AoLA7fEjoY988X1qS7/4i9410RCfzv7c600TLDjKSXpS0yG14H4Bn1cnp7sT4em1gfxE/6hpVeH
	xNue/7czkA6o8N0oFYXKdT+747g1A4XLRPyb/KncVLkFjBa/syY+vpet8CNFJywp0fd6Iajxfyi
	qgo00Gb2j6A==
X-Google-Smtp-Source: AGHT+IEB1d2bV5NS2rf4YoT3EEb4ni6FZp7FQwziYXT+SNnYH748LFh1OTLu3uPDrh6+0Lc5RrqrBg==
X-Received: by 2002:a05:6512:1393:b0:549:9044:94a9 with SMTP id 2adb3069b0e04-54b011dd142mr1232153e87.25.1743080802331;
        Thu, 27 Mar 2025 06:06:42 -0700 (PDT)
Received: from pc636 (host-90-233-221-122.mobileonline.telia.com. [90.233.221.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c98dsm2088697e87.67.2025.03.27.06.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:06:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 27 Mar 2025 14:06:39 +0100
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
Subject: Re: [PATCH v3 10/11] mm/vmalloc: Enter lazy mmu mode while
 manipulating vmalloc ptes
Message-ID: <Z-VNX0IA8Juh6ALx@pc636>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-11-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-11-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_060644_565485_46DD7F48 
X-CRM114-Status: GOOD (  20.88  )
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

On Tue, Mar 04, 2025 at 03:04:40PM +0000, Ryan Roberts wrote:
> Wrap vmalloc's pte table manipulation loops with
> arch_enter_lazy_mmu_mode() / arch_leave_lazy_mmu_mode(). This provides
> the arch code with the opportunity to optimize the pte manipulations.
> 
> Note that vmap_pfn() already uses lazy mmu mode since it delegates to
> apply_to_page_range() which enters lazy mmu mode for both user and
> kernel mappings.
> 
> These hooks will shortly be used by arm64 to improve vmalloc
> performance.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6111ce900ec4..b63ca0b7dd40 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -104,6 +104,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		if (unlikely(!pte_none(ptep_get(pte)))) {
>  			if (pfn_valid(pfn)) {
> @@ -127,6 +130,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
>  		pfn++;
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -354,6 +359,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size = PAGE_SIZE;
>  
>  	pte = pte_offset_kernel(pmd, addr);
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  #ifdef CONFIG_HUGETLB_PAGE
>  		size = arch_vmap_pte_range_unmap_size(addr, pte);
> @@ -370,6 +377,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			ptent = ptep_get_and_clear(&init_mm, addr, pte);
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  
> @@ -515,6 +524,9 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		struct page *page = pages[*nr];
>  
> @@ -528,6 +540,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
>  		(*nr)++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> -- 
> 2.43.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

