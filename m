Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A971073C8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjJjA92jpppGzeBaX6wdEfL4GdFW8B7teHooqHk/f1Q=; b=Ie73AgY/NelhgCggJP3svIG7/o
	F7tTKPOymq6hAh09JBFKOLBwCVc0I9aqNkwBQ/iBUcXRIwJxdmaRjd50PoIManQ0tv3vwINcH8Xk7
	MWSxRbhMxxluJb1g7fbf2N64uM/qZl464/RyTpAgFixp5rfvFTW6asDlu5xPyd/HovBxmFdjZhjI0
	e+j0jvFZ+ztazECjUYbAnb1/wFnZrYfj/G+SMgrm93OPXY1mJHU67Q9jce2/aONRPI6lPo+PHcJpl
	PCBaOefmD+ok6+fE6ic7a2KWIUFYo/TriCTNTQe0vr1AQHFOnnn2Al0nAJj2UCwXorbEghpLSDGym
	0eKbIncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQD3-00000008gpm-1yHN;
	Wed, 08 Apr 2026 10:32:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQD1-00000008gpF-0T3F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:32:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C30BD3161;
	Wed,  8 Apr 2026 03:32:23 -0700 (PDT)
Received: from [10.164.148.132] (unknown [10.164.148.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3D353F632;
	Wed,  8 Apr 2026 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775644349; bh=35dZI7XO1PuiJnOPWLTJBYXPR5BzBRQMTO9NszVmMig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rxbWcZha44mxHubats2n644JcLuCJ2t6+aYwy3oEEKRUt585T1ypA4Zhmn6pH8tOh
	 NNizpDyFqVP89fY0uUhdFLY/E1hRXIFOiUJ0CWwbEZt/ipRNyeKL1dh1SllxAlwxnC
	 HVDu6czp/sLowr29z8aNI93SI/T5IsMynfnKbAmQ=
Message-ID: <02b0464a-13f6-4e0c-ad69-0f494bfacbf4@arm.com>
Date: Wed, 8 Apr 2026 16:02:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/8] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-2-baohua@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260408025115.27368-2-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_033231_201017_78FDC9CD 
X-CRM114-Status: GOOD (  13.03  )
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



On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> we can batch CONT_PTE settings instead of handling them individually.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index a42c05cf5640..bf31c11ebd3b 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
>  		contig_ptes = CONT_PTES;
>  		break;
>  	default:
> +		if (size < CONT_PMD_SIZE && size > 0 &&
> +				IS_ALIGNED(size, CONT_PTE_SIZE)) {

Nit: Having the lower bound check before upper bound is natural to
read, so this should be size > 0 && size < CONT_PMD_SIZE (i.e written
the other way around).

Also IS_ALIGNED needs to go below size.


> +			contig_ptes = size >> PAGE_SHIFT;
> +			*pgsize = PAGE_SIZE;
> +			break;
> +		}
>  		WARN_ON(!__hugetlb_valid_size(size));
>  	}
>  
> @@ -359,6 +365,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>  	case CONT_PTE_SIZE:
>  		return pte_mkcont(entry);
>  	default:
> +		if (pagesize < CONT_PMD_SIZE && pagesize > 0 &&
> +				IS_ALIGNED(pagesize, CONT_PTE_SIZE))
> +			return pte_mkcont(entry);
> +
>  		break;
>  	}
>  	pr_warn("%s: unrecognized huge page size 0x%lx\n",


