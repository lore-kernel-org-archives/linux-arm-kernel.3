Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B245C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89ai5bYtjuSSmI4eICrLF+zMUIP7t8ECtny6g5+Copk=; b=pLt014dZ/1fb5Hdoch1gdlPlWt
	p+E06YE6UNW/BcLGUQGMRSaQt9SLSLpOS/t62QkLZa+5lma5NW/+ltpuYmX8fSpfswbiEYPlIsm3A
	Hvzi2c4Er4/65MQmYOxcdxPCwhwbVs0MawWrgraCMHPgcVE6IndGtC/bNc4O/HFPDI5XBZlDaE7xI
	CULN5Isd2EH4l9JOZuJnz8ItxqAiY/WKN7PgvHkPd0DNgXxQAysQWjkK3Oz9KJUuh9lEMuTLXZUVv
	1T7ZHLwbMShVqpAsy66ivLFfvNHfsLxg9iOHGVr3vHvkxeffPVCH40QajPNW9omXkv3ebb2pNe+Vl
	RZMW4vEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0gj-0000000H4cJ-1m6k;
	Thu, 20 Feb 2025 07:09:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0aF-0000000H35J-0kD5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:02:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7BDC2008;
	Wed, 19 Feb 2025 23:03:12 -0800 (PST)
Received: from [10.163.38.27] (unknown [10.163.38.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFBFD3F5A1;
	Wed, 19 Feb 2025 23:02:46 -0800 (PST)
Message-ID: <dd60e3d2-62ad-4295-8963-35bb1a94b006@arm.com>
Date: Thu, 20 Feb 2025 12:32:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] mm/vmalloc: Warn on improper use of
 vunmap_range()
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
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-9-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250217140809.1702789-9-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_230255_283552_D039AAE6 
X-CRM114-Status: GOOD (  21.80  )
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

On 2/17/25 19:38, Ryan Roberts wrote:
> A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
> pud level. But it is possible to subsequently call vunmap_range() on a
> sub-range of the mapped memory, which partially overlaps a pmd or pud.
> In this case, vmalloc unmaps the entire pmd or pud so that the
> no-overlapping portion is also unmapped. Clearly that would have a bad
> outcome, but it's not something that any callers do today as far as I
> can tell. So I guess it's just expected that callers will not do this.
> 
> However, it would be useful to know if this happened in future; let's
> add a warning to cover the eventuality.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

LGTM and stands on its own independent of the series here.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  mm/vmalloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 61981ee1c9d2..a7e34e6936d2 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  		if (cleared || pmd_bad(*pmd))
>  			*mask |= PGTBL_PMD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PMD_SIZE);
>  			continue;
> +		}
>  		if (pmd_none_or_clear_bad(pmd))
>  			continue;
>  		vunmap_pte_range(pmd, addr, next, mask);
> @@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		if (cleared || pud_bad(*pud))
>  			*mask |= PGTBL_PUD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PUD_SIZE);
>  			continue;
> +		}
>  		if (pud_none_or_clear_bad(pud))
>  			continue;
>  		vunmap_pmd_range(pud, addr, next, mask);

