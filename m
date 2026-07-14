Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BFFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4BB4hwwI/NO63lqdqTN4yLFeptjjVtn3BYVUokdEM4=; b=GliTmz3cwaWNmApn9DceYuDXHJ
	5r3HAh1Brf0+dHY5erP8jsvPajQZNKlEzk7cBLttFD2lvDUnLm2hhzQsKYsk5z/KaB0mip5lsI5Pj
	E+i3G/2EkebsRSIvRaVnxYhZOBv2gw+MXJMHQpzKSh5Aq5ALBcgoACfTtMV2imFLrQFp6dFKgHaN3
	IfaF/KnetZslD6mmv9OHOCuffCv73GldylF9o5HnZKFzDXbCc/dCOB6m1vrlnXgc0h/IY5lnlIK2R
	b7nFtqZSJuSowJArCjQRY0F8u1rkGb1RAzHu5nqG5Jx+mz5M48PB4QlUnF8mw5BJc6bmIWbyVKEOu
	uncqkaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX28-0000000B5v9-3tL8;
	Tue, 14 Jul 2026 06:54:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX26-0000000B5uQ-2AZ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:54:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22A571477;
	Mon, 13 Jul 2026 23:54:17 -0700 (PDT)
Received: from [10.174.43.51] (unknown [10.174.43.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C74A3F7B4;
	Mon, 13 Jul 2026 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784012061; bh=in4ByyebPfi3733abQ4MFG3t3pXhYQ74bHn20MaCl14=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9B78wj6W/NS4Oma+YkQO132UMhYDvp3jnpulHZsE9DTZHXSrHRmg24/qJTamec1V
	 UZR4BXyKuMC+1huPYshYfSBS6XkvHzvkGmxYd9kGDKcVGq2I5DyArZHpu3UUZZoaby
	 Cf5vrBTOV1clKaI6jS04gJMWblJxF9Sg6G9ZnFAU=
Message-ID: <4b3c1d3f-853d-46dc-bb15-37273fb07f61@arm.com>
Date: Tue, 14 Jul 2026 12:24:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, david@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com,
 "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>,
 Leo Yan <leo.yan@arm.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709073823.6643-2-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260709073823.6643-2-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_235422_606804_731795A9 
X-CRM114-Status: GOOD (  14.33  )
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

On 09/07/26 1:08 PM, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> we can handle CONT_PTE_SIZE groups together.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index a42c05cf56408..0da746f729388 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
>  		contig_ptes = CONT_PTES;
>  		break;
>  	default:
> +		if (size > 0 && size < PMD_SIZE &&

Is there a possibility for size <= 0 ? If not then
the above conditional check might be redundant.
> +				IS_ALIGNED(size, CONT_PTE_SIZE)) {
> +			*pgsize = PAGE_SIZE;
> +			contig_ptes = size >> PAGE_SHIFT;
> +			break;
> +		}
>  		WARN_ON(!__hugetlb_valid_size(size));

Would not these CONT_PTE_SIZE aligned sizes upto PMD_SIZE
trigger warning here because __hugetlb_valid_size() still
does not enumerate them ?
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


