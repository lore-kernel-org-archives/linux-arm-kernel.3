Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48342D7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+Eltg3aQtTr3T+vomigoGyrBT3Q73q9792nbJv1tE0=; b=V5omDzgCb3V8oAezP6uqCxZaDK
	+BKZmAWmI3C+zAQYBw5t+13WLjY79jwyqvbtgAxZFrJXk9EqojOjCC0QiQwQiLGu1+I7751cIODiU
	cuSztPI5hnzCUBlwXFjHmRYKuabw4QqSC8I2RrpkA/h0kB8q4lFALdKTid4dJh4Lt6X8PdHgWuNRS
	WGaYRkKQc35Gh+2jZI8vvCIFu5Ky9Yu2qrxg91YS2Vp0ocGhuWfkZVv6J7Lz5iPhn1xUinw+lcdCm
	rwDRINJlhEK/cz0F3M4wCjrQdvR6GvZzQTMrWbuRdPCGjbJtPRiCU4q6+lgpi/uH9Kl3fX8PKfz6Z
	4ODvB1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI50C-00000005y5J-1GI1;
	Mon, 02 Dec 2024 11:54:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4z8-00000005xsu-20t5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:53:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 992A4FEC;
	Mon,  2 Dec 2024 03:53:30 -0800 (PST)
Received: from [10.57.93.76] (unknown [10.57.93.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 295DE3F58B;
	Mon,  2 Dec 2024 03:53:01 -0800 (PST)
Message-ID: <7c49fa2c-b732-4b82-a853-22fdf241d361@arm.com>
Date: Mon, 2 Dec 2024 11:52:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Ensure adequate HUGE_MAX_HSTATE
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org
References: <20241202064407.53807-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241202064407.53807-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_035302_563776_D9B7E2F8 
X-CRM114-Status: GOOD (  16.26  )
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

On 02/12/2024 06:44, Anshuman Khandual wrote:
> This asserts that HUGE_MAX_HSTATE is sufficient enough preventing potential
> hugetlb_max_hstate runtime overflow in hugetlb_add_hstate() thus triggering
> a BUG_ON() there after.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.13-rc1
> 
>  arch/arm64/mm/hugetlbpage.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 3215adf48a1b..98a2a0e64e25 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -519,6 +519,18 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  
>  static int __init hugetlbpage_init(void)
>  {
> +	/*
> +	 * HugeTLB pages are supported on maximum four page table
> +	 * levels (PUD, CONT PMD, PMD, CONT PTE) for a given base
> +	 * page size, corresponding to hugetlb_add_hstate() calls
> +	 * here.
> +	 *
> +	 * HUGE_MAX_HSTATE should at least match maximum supported
> +	 * HugeTLB page sizes on the platform. Any new addition to
> +	 * supported HugeTLB page sizes will also require changing
> +	 * HUGE_MAX_HSTATE as well.
> +	 */
> +	BUILD_BUG_ON(HUGE_MAX_HSTATE < 4);

I guess we only technically need 3 if pud_sect_supported() == false ? Although
for simplicity (and to reduce my rebasing effort for boot-time page size :) ),
agree we should always just compare to 4.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

>  	if (pud_sect_supported())
>  		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>  


