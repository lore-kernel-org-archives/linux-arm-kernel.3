Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6267DF483C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv1ZfbYNTQRJ5BsqfJnjS2/ejVdC/LTBmkDVCwmyCDQ=; b=nLIqtZoDYY2dagL5Ec3oPgUw92
	w7Ea0tXGW4TiAJsObabNkx6c9CqYG2B4gfjc3lsTGG75GS3xPTbXN3lzHdigYsx7zByJnbwzHmeLq
	eVQK2hoVPl8ACj/ltmqJhu1O3ZN2Ov/P1bRdiu+y+yBOxdjUvcYanVIa9ODYnBgQvAateMh5H1zjt
	nU0qfI74GeftPdML6w/bdgCQDqf3jeUsa1Rr8miXqwAcmlWs40bhYQI3TN1x5qaPtZBooscE7+IL4
	/3FT3bb6IWpN36FwbSN0vkxdKOTP72E5cylgLGSPgk/NaG7jrL9gnCNX6pDIEeTrXLRU4y+GPTmbu
	Oi3kF3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iWS-0000000HAmf-0ly7;
	Mon, 23 Mar 2026 16:53:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iWP-0000000HAlb-2338
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:52:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 113A31516;
	Mon, 23 Mar 2026 09:52:51 -0700 (PDT)
Received: from [10.57.58.207] (unknown [10.57.58.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EEA33F73B;
	Mon, 23 Mar 2026 09:52:54 -0700 (PDT)
Message-ID: <588b2b4f-9cf6-43e5-b0e5-55820c74cbbb@arm.com>
Date: Mon, 23 Mar 2026 17:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: mm: Handle invalid large leaf mappings
 correctly
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260323130317.1737522-1-ryan.roberts@arm.com>
 <20260323130317.1737522-3-ryan.roberts@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260323130317.1737522-3-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_095257_573251_EF9E9E54 
X-CRM114-Status: GOOD (  17.54  )
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

On 23/03/2026 14:03, Ryan Roberts wrote:
> [...]
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 358d1dc9a576f..87dfe4c82fa92 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -25,6 +25,11 @@ static ptdesc_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
>  {
>  	struct page_change_data *masks = walk->private;
>  
> +	/*
> +	 * Some users clear and set bits which alias eachother (e.g. PTE_NG and

Nit: "each other"

> +	 * PTE_PRESENT_INVALID). It is therefore important that we always clear
> +	 * first then set.
> +	 */
>  	val &= ~(pgprot_val(masks->clear_mask));
>  	val |= (pgprot_val(masks->set_mask));
>  
> @@ -36,7 +41,7 @@ static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
>  {
>  	pud_t val = pudp_get(pud);
>  
> -	if (pud_sect(val)) {
> +	if (pud_leaf(val)) {
>  		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
>  			return -EINVAL;
>  		val = __pud(set_pageattr_masks(pud_val(val), walk));
> @@ -52,7 +57,7 @@ static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
>  {
>  	pmd_t val = pmdp_get(pmd);
>  
> -	if (pmd_sect(val)) {
> +	if (pmd_leaf(val)) {
>  		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
>  			return -EINVAL;
>  		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
> @@ -132,11 +137,12 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	ret = update_range_prot(start, size, set_mask, clear_mask);
>  
>  	/*
> -	 * If the memory is being made valid without changing any other bits
> -	 * then a TLBI isn't required as a non-valid entry cannot be cached in
> -	 * the TLB.
> +	 * If the memory is being switched from present-invalid to valid without
> +	 * changing any other bits then a TLBI isn't required as a non-valid
> +	 * entry cannot be cached in the TLB.
>  	 */
> -	if (pgprot_val(set_mask) != PTE_VALID || pgprot_val(clear_mask))
> +	if (pgprot_val(set_mask) != (PTE_MAYBE_NG | PTE_VALID) ||

It isn't obvious to understand where all those PTE_MAYBE_NG come from if
one hasn't realised that PTE_PRESENT_INVALID overlays PTE_NG.

Since for this purpose we always set/clear both PTE_VALID and
PTE_MAYBE_NG, maybe we could define some macro as PTE_VALID |
PTE_MAYBE_NG, as a counterpart to PTE_PRESENT_INVALID?

- Kevin

> [...]

