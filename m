Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F362C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wlX47j7KvOqq3N1z9WGWY+GrAh5lBy8NZIVpXI65Dw=; b=ROhmv3+jj0yWgdhZlyNSJ+y/RR
	UxwbWDdoKr6Abx21ObyXLB+Fv5hkZHF4OmgwxqN5p6sRckY/V3CBYl1bZJ1CYE1bURnU+0l/un+Y1
	/SYSrQK51Xo5hfFUP5maCGdKRuKXDH0EBIJszoCZLBiIBzfCpT7Iv6P/VKqxRIQEadESjTIXLjOLd
	9xjyjFgBpU81nXqCdcjpV+qaoFIS5lmQSWCQVRlv1/Na7OvrdsA6gbqDlRes8GsM9ZwmJdL3NwTm9
	7CVws4V5uVsBp3hAWkNorD3FgLTv96bsRGPwe5b9J0vwtklcfMDPrIQjXo3IkNNq6UFxzP3ZcJQfW
	bR2TKjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytRE-000000013qi-0xGS;
	Tue, 25 Aug 2026 15:51:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytRD-000000013qU-2VBN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 15:51:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9285B60133;
	Tue, 25 Aug 2026 15:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9347A1F00A3A;
	Tue, 25 Aug 2026 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787673106;
	bh=+wlX47j7KvOqq3N1z9WGWY+GrAh5lBy8NZIVpXI65Dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eV/6svohXqoRl4XVoK1J7U2ZjwjErN5URCFh3KdhlIXf9gduiYQcr5pYblYJypRGO
	 bj8hXMQJZvBk6kYaJ7A7+HpLuvdg+kB64RtpCjWJUDnYOQle9mHB3cZ5JKZMqfSXtU
	 tNfJCaoU56uOlgi5u+5NibV0OfMBetQDlhQV1tM9opB7z5yqwjUAUAWtUWiqZCuK7V
	 jYAiRFxMnlITtgasNisHbMzza6WYrFwMOPwQq4JrD0estoZ1tcsWN6SgvxQDZaCBvt
	 18UqadOd+ef9yT3fQ8ue3YuuPYdej8RftGV4aiNH1x8/H8evLpARasnkd8R/x0l6FP
	 XG1RI9ZzlbDoQ==
Message-ID: <fd78d494-7f47-4cf8-b66e-c95c2e3ed889@kernel.org>
Date: Tue, 25 Aug 2026 17:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] mm: make persistent huge zero folio read-only
To: Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org
Cc: ljs@kernel.org, usama.arif@linux.dev, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, rppt@kernel.org, ryan.roberts@arm.com, ziy@nvidia.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <lance.yang@linux.dev>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-2-xueyuan.chen21@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260730090647.2401252-2-xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 7/30/26 11:06, Xueyuan Chen wrote:
> The persistent huge zero folio is shared globally and should stay zero
> after initialization. As Jann Horn pointed out[1], kernel bugs have ended
> up writing to pages that were meant to be read-only, including in
> security-sensitive cases. Making the persistent huge zero folio read-only
> in the direct map turns such writes into faults instead of silent zero-page
> corruption.
> 
> Add set_direct_map_ro_noflush() so mm code can make a direct-map range
> read-only. Use an address-based signature to match ongoing direct-map
> helper work[2], where existing page-based helpers may move the same way.
> The helper is direct-map specific and leaves TLB invalidation to its
> caller. Architectures without direct-map permission support keep existing
> behavior through the generic stub.
> 
> The folio is allocated and zeroed through the writable direct map before
> thp_shrinker_init() changes its permissions. thp_shrinker_init() is called
> from hugepage_init(), which is registered as a subsys_initcall and runs
> after SMP initialization. Stale writable kernel TLB entries may therefore
> exist. Flush the direct-map range immediately after the page-table update
> so they cannot bypass the read-only mapping.
> 
> GFP_TRANSHUGE includes __GFP_HIGHMEM. On 32-bit systems, the persistent
> folio may therefore reside in high memory, where folio_address() returns
> NULL. Such a folio has no permanent direct-map mapping to protect, so skip
> the permission change and TLB flush.
> 
> Treat the direct-map permission change as best-effort. Architectures that
> do not implement the helper keep the existing behavior via the generic
> stub.
> 
> Inspired by Jann Horn's read-only zero page work[1] and follow-up
> discussion[3] with Yang Shi.
> 
> Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
> Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
> Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]
> Link: https://lore.kernel.org/r/20260727113530.5cd347581a66b3279490a604@linux-foundation.org
> Suggested-by: David Hildenbrand <david@kernel.org>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  include/linux/set_memory.h | 29 +++++++++++++++++++++++++++++
>  mm/huge_memory.c           | 20 +++++++++++++++++++-
>  2 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 3030d9245f5a..e83ced6a3827 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -40,6 +40,24 @@ static inline int set_direct_map_valid_noflush(struct page *page,
>  	return 0;
>  }
>  
> +/**
> + * set_direct_map_ro_noflush - make a direct-map range read-only
> + * @addr: start address in the direct map
> + * @nr_pages: number of pages starting at @addr
> + *
> + * Make the direct-map range starting at @addr read-only without invalidating
> + * TLBs. Callers must either ensure that no stale writable translations can
> + * be used, or treat the permission change as a best-effort hardening step.
> + *
> + * Return: 0 on success or when direct-map permission changes are unsupported,
> + * or a negative errno on failure.
> + */
> +static inline int set_direct_map_ro_noflush(const void *addr,
> +					    unsigned long nr_pages)

Two tabs here in MM land.

> +{
> +	return 0;
> +}

Nobody checks the return value, so how helpful is it to return it? Do we expect
other users to check for the return code?

I guess we just try to keep consistency with the other functions?

[...]


> @@ -932,6 +934,8 @@ static int __init thp_shrinker_init(void)
>  	shrinker_register(deferred_split_shrinker);
>  
>  	if (IS_ENABLED(CONFIG_PERSISTENT_HUGE_ZERO_FOLIO)) {
> +		unsigned long addr;
> +
>  		/*
>  		 * Bump the reference of the huge_zero_folio and do not
>  		 * initialize the shrinker.
> @@ -940,8 +944,22 @@ static int __init thp_shrinker_init(void)
>  		 * that get_huge_zero_folio() will most likely not fail as
>  		 * thp_shrinker_init() is invoked early on during boot.
>  		 */
> -		if (!get_huge_zero_folio())
> +		if (!get_huge_zero_folio()) {
>  			pr_warn("Allocating persistent huge zero folio failed\n");
> +			return 0;
> +		}
> +
> +		/* Highmem folios have no permanent direct-map mapping to protect. */
> +		if (folio_test_highmem(huge_zero_folio))
> +			return 0;
> +
> +		addr = (unsigned long)folio_address(huge_zero_folio);
> +		/*
> +		 * The folio was zeroed through the writable direct map. Flush
> +		 * after the page-table update to invalidate stale translations.
> +		 */
> +		set_direct_map_ro_noflush((void *)addr, HPAGE_PMD_NR);
> +		flush_tlb_kernel_range(addr, addr + HPAGE_PMD_SIZE);
>  		return 0;
>  	}
>  

The code changed upstream in the meantime. There is now the huge_zero_init() we
can hook into instead.

-- 
Cheers,

David

