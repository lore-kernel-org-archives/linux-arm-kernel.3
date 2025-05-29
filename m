Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691FCC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6wot1gRg0WAdFuBzRiotu4nSFuSVtI0sI02NlwNVjI=; b=yU5Jme6K3OmcKOJ/lWykA7MYp+
	zrG/m10Qa9Mv25XdvrV6jpDefcx3Nxx9x1K078wHvhciaP4TVftBFfh0cjf2PRWNaBV63LjzUduRy
	N1WYVBSJ5zInLpd6Q0iaYBLoIQ9s8IKvWYp040SM4dXEMtA2Iclglv9A5jwQSLg6tO5B+tOMCrTzB
	xMNzGnT1qWSikel5zYzSPjT04fOV8e7EBOVDPn/k/Z9AnX/dYBZmUktULwtv6Rf1Zea3JQzp3m4fr
	cg/Be6qW9JVus3sy8ZfQZ1G/ROpI1zsVd3mxl0GB6ydDYz44YVofAxAWU4hFBU4FURwetkYZ8zFi2
	QPbND5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZF8-0000000FMKx-1gBH;
	Thu, 29 May 2025 09:08:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZ9m-0000000FL4B-2kYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:02:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0632176A;
	Thu, 29 May 2025 02:02:15 -0700 (PDT)
Received: from [10.163.62.34] (unknown [10.163.62.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 024513F5A1;
	Thu, 29 May 2025 02:02:25 -0700 (PDT)
Message-ID: <7b9a9ad4-7a7a-4e99-ba72-f5be0f609a21@arm.com>
Date: Thu, 29 May 2025 14:32:23 +0530
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
X-CRM114-CacheID: sfid-20250529_020234_743205_F1BD1760 
X-CRM114-Status: GOOD (  17.62  )
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

This code path is only called for the kernel mapping. Hence should
pmd_valid() be used instead of pmd_present() which also checks for
present invalid scenarios as well ? 

> +			pmd_free_pte_page(pmdp, next);
>  	} while (pmdp++, next += PMD_SIZE, next != end);
>  
>  	pud_clear(pudp);

