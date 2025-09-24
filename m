Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C89CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csGzN7ITFwXhWMh/RaKjq9M87J1ZtN3tzt91FwMGJYc=; b=pG7n0DYfueU7PhFcX1AUKJeKRu
	/h8wror4RadYXJ1uMsnFmg5VtN0u9TYfF0haRnloF9eExXyGjR6pARrWAL1FPAmffCVOoUIVZ8D9z
	VgPRIbkgjBg6cCuqbDc0WJEbHEPXogq3ygAMMlUVXWfgZZC6WWDwLV+7RsOwyy81jMwjtQbxkpXCq
	wzfDrFPuWyFpntj2+zMs+FNGt8848+Gaa4I90mfQP21eCTuAK7K/D2s//M9lRFnbNQi98u1NhLni2
	alwXqlRwgZMGquPbZSAr8YE5WloW110gkFZgE1yVq2X6SuPGwh8fdVCvMRynxVUEqKQzTBo6uXSQJ
	d+sHcJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OvE-0000000HXh8-0gtp;
	Wed, 24 Sep 2025 12:48:36 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OvB-0000000HXdU-0D5U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:48:34 +0000
Message-ID: <c07073f2-96b7-4044-94e2-b41a2f8ca633@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758718108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csGzN7ITFwXhWMh/RaKjq9M87J1ZtN3tzt91FwMGJYc=;
	b=IfoHwq/IQBZPRqQ4ISbsT/VJvaDGntnyP7fTCR8NlNmtCkQd4wXYZQFC0/Fm2GwRJ2f/tv
	urWjCgrciJGntAq2OwXCmTXpg21vW7XrF2SjIHc22X9l8wWL6cH/CUhzcHzBKVwH7hSXeH
	eDqHQ2kuv7+qScnJhzjnlhG6y6BhmSA=
Date: Wed, 24 Sep 2025 20:48:18 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: mte: Do not flag the zero page as PG_mte_tagged
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Gergely Kovacs <Gergely.Kovacs2@arm.com>,
 David Hildenbrand <david@redhat.com>, Will Deacon <will@kernel.org>
References: <20250924123528.1536835-1-catalin.marinas@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250924123528.1536835-1-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_054833_393960_0D3F83A7 
X-CRM114-Status: GOOD (  30.04  )
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



On 2025/9/24 20:31, Catalin Marinas wrote:
> Commit 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to the
> zero page") attempted to fix ptrace() reading of tags from the zero page
> by marking it as PG_mte_tagged during cpu_enable_mte(). The same commit
> also changed the ptrace() tag access permission check to the VM_MTE vma
> flag while turning the page flag test into a WARN_ON_ONCE().
> 
> Attempting to set the PG_mte_tagged flag early with
> CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled may either hang (after commit
> d77e59a8fccd "arm64: mte: Lock a page for MTE tag initialisation") or
> have the flags cleared later during page_alloc_init_late(). In addition,
> pages_identical() -> memcmp_pages() will reject any comparison with the
> zero page as it is marked as tagged.
> 
> Partially revert the above commit to avoid setting PG_mte_tagged on the
> zero page. Update the __access_remote_tags() warning on untagged pages
> to ignore the zero page since it is known to have the tags initialised.
> 
> Note that all user mapping of the zero page are marked as pte_special().
> The arm64 set_pte_at() will not call mte_sync_tags() on such pages, so
> PG_mte_tagged will remain cleared.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to the zero page")
> Reported-by: Gergely Kovacs <Gergely.Kovacs2@arm.com>
> Cc: <stable@vger.kernel.org> # 5.10.x
> Cc: Will Deacon <will@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Lance Yang <lance.yang@linux.dev>
> ---
> 
> For reference, discussion on page merging here:
> 
> https://lore.kernel.org/r/aNKJ5glToE4hMhWA@arm.com

Cool. LGTM.
Acked-by: Lance Yang <lance.yang@linux.dev>

> 
> The deferred struct page init problem was reported by Gergely offline.
> 
> Given that we've had this bug for over four years and it was only
> recently noticed, I think we should merge it at -rc1, give it a bit more
> time in -next in case it breaks anything (not likely but you never know,
> MTE interaction with the mm code is always surprising ;)).
> 
>   arch/arm64/kernel/cpufeature.c | 10 +++++++---
>   arch/arm64/kernel/mte.c        |  2 +-
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index ef269a5a37e1..3e9d1aa37bbf 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2408,17 +2408,21 @@ static void bti_enable(const struct arm64_cpu_capabilities *__unused)
>   #ifdef CONFIG_ARM64_MTE
>   static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
>   {
> +	static bool cleared_zero_page = false;
> +
>   	sysreg_clear_set(sctlr_el1, 0, SCTLR_ELx_ATA | SCTLR_EL1_ATA0);
>   
>   	mte_cpu_setup();
>   
>   	/*
>   	 * Clear the tags in the zero page. This needs to be done via the
> -	 * linear map which has the Tagged attribute.
> +	 * linear map which has the Tagged attribute. Since this page is
> +	 * always mapped as pte_special(), set_pte_at() will not attempt to
> +	 * clear the tags or set PG_mte_tagged.
>   	 */
> -	if (try_page_mte_tagging(ZERO_PAGE(0))) {
> +	if (!cleared_zero_page) {
> +		cleared_zero_page = true;
>   		mte_clear_page_tags(lm_alias(empty_zero_page));
> -		set_page_mte_tagged(ZERO_PAGE(0));
>   	}
>   
>   	kasan_init_hw_tags_cpu();
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index e5e773844889..63aed49ac181 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -460,7 +460,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
>   		if (folio_test_hugetlb(folio))
>   			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio));
>   		else
> -			WARN_ON_ONCE(!page_mte_tagged(page));
> +			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_page(page));
>   
>   		/* limit access to the end of the page */
>   		offset = offset_in_page(addr);


