Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9850CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmb4mYY/tR6wAzo9c72UaF10jDbWAFm5WdiypbDuAek=; b=HE3OkIIgsguAgp/ttzdtBbe4yS
	7SUkf8LwZ8dAlfPMf1wxbbEGHyP8/DZ7s173t+2J2r3vDrGFGwQQUJoWOHQIcJp4TM6DyCBYNe9dv
	HwagyMq/zKQ3hZ4GlWRPMMwY75PjO7Jxs8diptjrIz//ODLNDrPOSf0frt+CylmYOvPvdvDjACSub
	mRtSgbBXSMlItWBzwlmXSFs7vk39r/gciqviLisqzOZHO2CON+EDd73+4MrNP1gyQzLPA/xr2WG6B
	+IbTNY4byt4lfWVYTtUaVGVJuEULFu+PQkWGMYaZ4zU+qQFfFya2XQsi+TNyP9LxlcIZ2f2LgerPk
	AdWbKP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSENh-00000004CUU-41MU;
	Wed, 27 May 2026 13:33:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSENf-00000004CTT-104Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:33:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABFD62D97;
	Wed, 27 May 2026 06:33:00 -0700 (PDT)
Received: from [10.164.19.7] (unknown [10.164.19.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B50A13F7D8;
	Wed, 27 May 2026 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779888785; bh=3ivWgqiUQpM5lpUukOrYmMpxiPpqwEREWe2J1ceJJyQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DS09TTNr6G4NjbjAXlLHBx2vUIEabRA7TZV/BDCQgkCNcsiYvXLIIen3LoIszH4I0
	 I+o57N2wxdUw2rfue4Qw03PT2fcV9LWeRF3FGViXYm0CyHoOnqTkHvkS7PdSPgZKNy
	 V2AHs3nRZMnVjFppu6E4/k3ZV1W8cH28sq13xowo=
Message-ID: <e5a59b25-d8ce-4d78-aec3-ee1b6efccfed@arm.com>
Date: Wed, 27 May 2026 19:02:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] mm: make persistent huge zero folio read-only
To: Xueyuan chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 david@kernel.org, ljs@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, lance.yang@linux.dev,
 yang@os.amperecomputing.com, jannh@google.com
References: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
 <20260527035607.14919-2-xueyuan.chen21@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260527035607.14919-2-xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_063307_382307_1C35BEFB 
X-CRM114-Status: GOOD (  29.55  )
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



On 27/05/26 9:26 am, Xueyuan chen wrote:
> From: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> The huge zero folio is shared globally, and its contents should never
> change after initialization. As Jann Horn pointed out[1], the kernel has
> had bugs, including security bugs, where read-only pages were later written
> to. If the huge zero folio is read-only in the direct map, such writes
> fault instead of silently corrupting shared zero contents.
> 
> For the persistent huge zero folio, set this up once after the folio is
> allocated at boot.
> 
> The permission change is best-effort. If the architecture cannot safely
> make the direct map read-only, keep using the writable persistent huge zero
> folio.
> 
> While at it, mark the huge_zero_folio pointer itself __ro_after_init.
> READONLY_HUGE_ZERO_FOLIO depends on PERSISTENT_HUGE_ZERO_FOLIO, so the
> pointer is initialized during boot and never replaced.
> 
> This was inspired by Jann Horn's read-only zero page work[1] and follow-up
> discussion[2] with Yang Shi.
> 
> [1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
> [2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/
> 
> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  include/linux/huge_mm.h |  5 +++++
>  mm/Kconfig              | 17 +++++++++++++++++
>  mm/huge_memory.c        | 25 ++++++++++++++++++++++++-
>  3 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index edece3e26985..45d1352619d1 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -5,6 +5,7 @@
>  #include <linux/mm_types.h>
>  
>  #include <linux/fs.h> /* only for vma_is_dax() */
> +#include <linux/init.h>
>  #include <linux/kobject.h>
>  
>  vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
> @@ -554,6 +555,10 @@ static inline bool is_huge_zero_pmd(pmd_t pmd)
>  struct folio *mm_get_huge_zero_folio(struct mm_struct *mm);
>  void mm_put_huge_zero_folio(struct mm_struct *mm);
>  
> +#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
> +bool __init arch_make_huge_zero_folio_readonly(struct folio *folio);
> +#endif
> +
>  static inline struct folio *get_persistent_huge_zero_folio(void)
>  {
>  	if (!IS_ENABLED(CONFIG_PERSISTENT_HUGE_ZERO_FOLIO))
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 776b67c66e82..f31200816646 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -787,6 +787,23 @@ config PERSISTENT_HUGE_ZERO_FOLIO
>  	  Say Y if your system has lots of memory. Say N if you are
>  	  memory constrained.
>  
> +config ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
> +	bool
> +
> +config READONLY_HUGE_ZERO_FOLIO
> +	bool "Map the huge zero folio read-only in the direct map"
> +	depends on PERSISTENT_HUGE_ZERO_FOLIO
> +	depends on ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
> +	help
> +	  The persistent huge zero folio is shared globally, and nothing
> +	  should ever change its contents after initialization.
> +
> +	  When supported, mark the folio read-only in the direct map so such
> +	  writes trigger a fault instead of silently corrupting the zero contents.
> +
> +	  If the permission change is not supported, the kernel keeps using
> +	  the writable persistent huge zero folio.
> +
>  config MM_ID
>  	def_bool n
>  
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index bf9b480bb3b0..c568755dd58e 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -75,7 +75,11 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
>  static bool split_underused_thp = true;
>  
>  static atomic_t huge_zero_refcount;
> +#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
> +struct folio *huge_zero_folio __ro_after_init;


Can we guard this with CONFIG_PERSISTENT_HUGE_ZERO_FOLIO? Since
in that case too the pointer is never written after init.

> +#else
>  struct folio *huge_zero_folio __read_mostly;
> +#endif
>  unsigned long huge_zero_pfn __read_mostly = ~0UL;
>  unsigned long huge_anon_orders_always __read_mostly;
>  unsigned long huge_anon_orders_madvise __read_mostly;
> @@ -305,6 +309,18 @@ static unsigned long shrink_huge_zero_folio_scan(struct shrinker *shrink,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
> +static bool __init make_huge_zero_folio_readonly(void)
> +{
> +	return arch_make_huge_zero_folio_readonly(READ_ONCE(huge_zero_folio));


I think READ_ONCE is not required since no one is going to change the
pointer after allocation?


> +}
> +#else
> +static bool __init make_huge_zero_folio_readonly(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  static struct shrinker *huge_zero_folio_shrinker;
>  
>  #ifdef CONFIG_SYSFS
> @@ -965,8 +981,15 @@ static int __init thp_shrinker_init(void)
>  		 * that get_huge_zero_folio() will most likely not fail as
>  		 * thp_shrinker_init() is invoked early on during boot.
>  		 */
> -		if (!get_huge_zero_folio())
> +		if (!get_huge_zero_folio()) {
>  			pr_warn("Allocating persistent huge zero folio failed\n");
> +			return 0;
> +		}
> +
> +		if (IS_ENABLED(CONFIG_READONLY_HUGE_ZERO_FOLIO) &&
> +		    !make_huge_zero_folio_readonly())
> +			pr_warn("Making persistent huge zero folio read-only failed\n");
> +
>  		return 0;
>  	}
>  


