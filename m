Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B98F506D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkW6GjZZDw0xsc3TIzcIkcKyjGpRDgQ/e7cAxxgZf9I=; b=MpfePuMNFQn0DMUQLe/JQ6Onaz
	5ykvdv3lfN5dvH9/7ufeBGEJqWeT/6qEpnysQC+yfnreZe4roch0kOJeGl/5Lrjy4/WcmWEhr2DRs
	S0PRL29szpBCiN19PCo4ol387kRTjo0zkCeThKyiQltDI8WvVYqy1GkwHnMi5WWxmpLThmbU+9O9L
	IFCA4wLCkV0M8QGeUoPs2L/BNp2XC35tKYSkzCM/VR5MQJ8k4IWAAPdhajN/tF9ocpk/ypM/DIE5q
	gXo5ojbM3FHfyzx49ePCqjqVDqZffcpYc4mRfDEG2e3d27647mW6EEfoGGeQXNf8E589b5J3p1M75
	YgcXFo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28pp-00000004ATf-3qIo;
	Mon, 16 Mar 2026 14:22:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28pm-00000004ARQ-3MHq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:22:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 289881477;
	Mon, 16 Mar 2026 07:22:08 -0700 (PDT)
Received: from [10.57.84.154] (unknown [10.57.84.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1084D3F73B;
	Mon, 16 Mar 2026 07:22:12 -0700 (PDT)
Message-ID: <415ea4a5-e729-4fe5-b95d-29fcca8f7dbd@arm.com>
Date: Mon, 16 Mar 2026 14:22:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Use generic enum pgtable_level
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)"
 <david@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20260316140150.58207-1-kevin.brodsky@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260316140150.58207-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_072218_884239_560ADE0A 
X-CRM114-Status: GOOD (  15.41  )
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

On 16/03/2026 14:01, Kevin Brodsky wrote:
> enum pgtable_type was introduced for arm64 by commit c64f46ee1377
> ("arm64: mm: use enum to identify pgtable level instead of
> *_SHIFT"). In the meantime, the generic enum pgtable_level got
> introduced by commit b22cc9a9c7ff ("mm/rmap: convert "enum
> rmap_level" to "enum pgtable_level"").
> 
> Let's switch to the generic enum pgtable_level. The only difference
> is that it also includes PGD level - this isn't relevant in
> __pgd_pgtable_alloc() so we just add a default statement.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/mmu.h |  7 -----
>  arch/arm64/mm/mmu.c          | 58 +++++++++++++++++++-----------------
>  2 files changed, 30 insertions(+), 35 deletions(-)
> 

[...]

>  static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
> -				       enum pgtable_type pgtable_type)
> +				       enum pgtable_level pgtable_level)
>  {
>  	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>  	struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
> @@ -539,40 +539,42 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>  
>  	pa = page_to_phys(ptdesc_page(ptdesc));
>  
> -	switch (pgtable_type) {
> -	case TABLE_PTE:
> +	switch (pgtable_level) {
> +	case PGTABLE_LEVEL_PTE:
>  		BUG_ON(!pagetable_pte_ctor(mm, ptdesc));
>  		break;
> -	case TABLE_PMD:
> +	case PGTABLE_LEVEL_PMD:
>  		BUG_ON(!pagetable_pmd_ctor(mm, ptdesc));
>  		break;
> -	case TABLE_PUD:
> +	case PGTABLE_LEVEL_PUD:
>  		pagetable_pud_ctor(ptdesc);
>  		break;
> -	case TABLE_P4D:
> +	case PGTABLE_LEVEL_P4D:
>  		pagetable_p4d_ctor(ptdesc);
>  		break;
> +	default:
> +		break;

nit: I think we should either explicitly support pgd or explicitly bug/warn. Now
that the enum has PGTABLE_LEVEL_PGD it looks legit to call __pgd_pgtable_alloc()
to allocate one. But it will currently silently fail to call pagetable_pgd_ctor().

Probably simplest just to call BUG() in the default path?

With this addressed:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks,
Ryan



