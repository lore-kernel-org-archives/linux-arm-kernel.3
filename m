Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A45C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMmlDgMQvGAki9lZdI6ESlyfUC/HGll6ISP1K9RFG+g=; b=ipbcCfq240IrvVMCafVZGF8Rz6
	dpaNAoQdQvl5GoYWtFqRvvxf/5uf9FupayKz7JWt7ATsMzchkjucA+pLTWK+4J15yiUk4+AWxxVb/
	k1TaqSrTuo/Z496qTNXDFyMJ61ewVn7xXXow7EwfSCfZdG3TRNbGsQk4sbkuaEswh8YZJTHGUCg5w
	gTJGdc1qdT59sgQBdxssbZwOb5Ugqu4k/mG6SZamE2nlvrBOFnaygG4/fKFzkMSXzn2xFQydkc/F2
	KTn3TcvgYhOMS0XGDCk/x035Q2NmkhzFA8hefYXE3MNZTL39qJfALkvYlnCFykXmpjhl8IhAE1xxw
	TGH/0EjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2IC-00000004tih-0ytO;
	Mon, 17 Feb 2025 14:40:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk20E-00000004pXH-419q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:21:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9023F152B;
	Mon, 17 Feb 2025 06:22:01 -0800 (PST)
Received: from [10.1.38.151] (XHFQ2J9959.cambridge.arm.com [10.1.38.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937303F6A8;
	Mon, 17 Feb 2025 06:21:41 -0800 (PST)
Message-ID: <271c6277-baab-4b69-97ea-d6c80f873fe5@arm.com>
Date: Mon, 17 Feb 2025 14:21:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/hugetlb: Consistently use pud_sect_supported()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250217065414.49489-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250217065414.49489-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_062143_039912_4BB49D47 
X-CRM114-Status: GOOD (  15.91  )
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

On 17/02/2025 06:54, Anshuman Khandual wrote:
> Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
> Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.14-rc3
> 
>  arch/arm64/mm/hugetlbpage.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 98a2a0e64e25..5b7cfdba9c93 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -342,7 +342,9 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
>  	switch (hp_size) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SIZE:
> -		return PGDIR_SIZE - PUD_SIZE;
> +		if (pud_sect_supported())
> +			return PGDIR_SIZE - PUD_SIZE;
> +		break;
>  #endif
>  	case CONT_PMD_SIZE:
>  		return PUD_SIZE - CONT_PMD_SIZE;
> @@ -364,7 +366,8 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>  	switch (pagesize) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SIZE:
> -		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
> +		if (pud_sect_supported())
> +			entry = pud_pte(pud_mkhuge(pte_pud(entry)));

If this was to get called with PUD_SIZE for a config that doesn't fold the PMD
and which pud_sect_supported() returns false, we will now return the entry
unmodified and will not emit the warning that the default case emits. I think we
should at least either modify the entry (so that it is safe) or emit the
warning. Doing neither seems less defensive than the current situation.

>  		break;
>  #endif
>  	case CONT_PMD_SIZE:


