Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1C7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SI7E2GMu5zwFD88Hqb3B6EoNDTjnLpF2X6w7dcTEhI=; b=rox+IaQmzM1n0eWLMi62MeMU2J
	8KCbu7pEFwJvTNxuqbJM4H1dan+lqNNM4vy8taDkzJMneYzjFjkp+cP9MfF4cPxWP+l5DXLaqqUjM
	D/G7tPEKBktwkdESoAzxHhTmPdl+Rtd/luHOfzq2dG1+YQpU+AnxEPC5OII7nL79liizl7SBZiqqK
	hloc8moGaofC1sVdUvvTBWEJkp416ZiLOPHT3vQdg8a2jczJKd0dHAPzwHayIANorS47HDAoa2sKs
	3CXlAgP1Qflg9Acjl1GTjXfuj2netkLCo2JePh/mYafXiOcAS7J/TA+TmBBMtSEZ+wWxiC9EU6GI6
	3NMof/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZeH-0000000FQ9y-1AO3;
	Thu, 29 May 2025 09:34:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZTa-0000000FOsW-2deQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:23:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D847176A;
	Thu, 29 May 2025 02:22:45 -0700 (PDT)
Received: from [10.163.62.34] (unknown [10.163.62.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC93B3F5A1;
	Thu, 29 May 2025 02:22:57 -0700 (PDT)
Message-ID: <6aacbf96-e685-43fd-b77d-2242d57cb2f3@arm.com>
Date: Thu, 29 May 2025 14:52:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Restrict pagetable teardown to avoid false
 warning
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: david@redhat.com, ryan.roberts@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250527082633.61073-1-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250527082633.61073-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_022302_716031_C697DA6F 
X-CRM114-Status: GOOD (  16.98  )
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

On 5/27/25 13:56, Dev Jain wrote:
> Commit 9c006972c3fe removes the pxd_present() checks because the caller
> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
> a pmd_present() check in pud_free_pmd_page().
> 
> This problem was found by code inspection.
> 
> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table())
> Cc: <stable@vger.kernel.org>
> Reported-by: Ryan Roberts <ryan.roberts@arm.com> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> This patch is based on 6.15-rc6.
> 
> v2->v3:
>  - Use pmdp_get()
> 
> v1->v2:
>  - Enforce check in caller
> 
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..5a9bf291c649 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	next = addr;
>  	end = addr + PUD_SIZE;
>  	do {
> -		pmd_free_pte_page(pmdp, next);
> +		if (pmd_present(pmdp_get(pmdp)))
> +			pmd_free_pte_page(pmdp, next);
>  	} while (pmdp++, next += PMD_SIZE, next != end);
>  
>  	pud_clear(pudp);

Agree with Ryan about keeping pmd_present() to be consistent.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

