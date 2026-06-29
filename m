Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 05:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KOHg6u/2xTJsrzKq2SXqbZKogi4gML0VvKTiWUZ+Y4=; b=gaeuTX42/PUd6KBLGqcRE85Pvv
	dIShkVQimdDEfwEwuimIFIWcsOX2+EMQxUmcZu9DPhE69+YxrMECnpKRF6ziT0rsNJxLMHtiiqon3
	6kxkB+eemwrIvf9C7qaIr09LSbMVxIUiU3Wq+p48Yv16myTsCUT3vCRnCtEuc4S/n/s4V9CJQmV+i
	jcGC/UG2ekekVmEEoqerywPvFYMe8uRKpBjz9lqcvwHsZTBvqKvuzmLHAfpBppEJvLcQUlMlnS6F/
	KQ7odYHIvxK1RJNmiP0YuPVclyWRK52u91ZiR7UNxru6ACgyXwTPz3HCOxMqI+a+Rz3maNk+6sAqN
	jQZY+LWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4dT-0000000Di8a-3VFb;
	Mon, 29 Jun 2026 05:34:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4dR-0000000Di8C-1558
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 05:34:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94D71A2D;
	Sun, 28 Jun 2026 22:34:11 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC1B3F836;
	Sun, 28 Jun 2026 22:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782711256; bh=a86f8R4t+fLWwdQI0IgFLXsc0PI99dNs9xJPvkEy//M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Liaht61iOTcEOGbuAo7kQgdPOulUm68gQ1rGBf1CiX6T62Vbs4U/kRTa91X9IbaH9
	 pMujISxup9Dhkr5Lra9KRo0/uaUOzDcxazn3eOYj5aYMffHQ68077Vfoh2P0QVHHTF
	 bQWVYP1ScOX0/N405atZRUOj8Oxz40uoya7QKXhU=
Message-ID: <8ed36f5b-7421-4dcc-9ea1-29e8f0f15824@arm.com>
Date: Mon, 29 Jun 2026 11:04:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
 shanghaoqiang@xiaomi.com
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-2-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260618084726.1070022-2-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_223421_444970_CA908482 
X-CRM114-Status: GOOD (  12.58  )
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



On 18/06/26 2:17 pm, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> we can handle CONT_PTE_SIZE groups together.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index a42c05cf56408..c4d8b226126cb 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
>  		contig_ptes = CONT_PTES;
>  		break;
>  	default:
> +		if (size > 0 && size < PMD_SIZE &&
> +				IS_ALIGNED(size, CONT_PTE_SIZE)) {
> +			contig_ptes = size >> PAGE_SHIFT;
> +			*pgsize = PAGE_SIZE;

Nit: *pgsize update can go before contig_ptes, to keep the pattern elsewhere.

Reviewed-by: Dev Jain <dev.jain@arm.com>



> +			break;
> +		}
>  		WARN_ON(!__hugetlb_valid_size(size));
>  	}
>  
> @@ -359,6 +365,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>  	case CONT_PTE_SIZE:
>  		return pte_mkcont(entry);
>  	default:
> +		if (pagesize > 0 && pagesize < PMD_SIZE &&
> +				IS_ALIGNED(pagesize, CONT_PTE_SIZE))
> +			return pte_mkcont(entry);
> +
>  		break;
>  	}
>  	pr_warn("%s: unrecognized huge page size 0x%lx\n",


