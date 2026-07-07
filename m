Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE15C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXqxsT2REYcN58ckChjdU8/v9QTtwid7lase85JBTGA=; b=jMqpGjhQLDy2c68+f20hk3UFG3
	KGtVtDsXEwouqCz4trFrNIPv2Tbg98TpyTueTGwo20doASpD6+napKTCTA8ACqzXtMIohGQ+FS58U
	qenUEYNXNZT23DF+jaSMj4pfwnMylo+eq0t8mleBCfHVdmMJs4dJ0mTtOF4nhv1r/og5QrOUwYIOr
	BuHHobF5VOwjVKOo0IViEDmjR1YM5F5LrKdHLrBXeDwYGiup5e1X7KEHY+nsMr8FUhlFfRt+Gff1P
	fdhimSxkh7qm3jxbuPZDquZdtBaCjJNH8nOmdxxk1Py51Wi6aoolCHnVuID7zxOprm58LcdZOL5rk
	mVU6UgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5g3-0000000F29O-3e1J;
	Tue, 07 Jul 2026 13:17:31 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5g0-0000000F28x-2iBw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:17:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783430243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uXqxsT2REYcN58ckChjdU8/v9QTtwid7lase85JBTGA=;
	b=uyVahiJwyDi3GxwsD9aKVkH9twZUpL0EMKPBoUMClVlHBHnGpBmgLuAjpqTC6M0xvYGh6V
	8Cilb7uKUD0vtYJBXCMwEPpX0QkdZhChuJg/yt1Vq2Ev9f6qaV1RqTHZdCoUfEm0BqnNDR
	BEHoqWn70c7b+Rc59aA+EPeXJU4SWQU=
From: Usama Arif <usama.arif@linux.dev>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v3 1/3] mm: make persistent huge zero folio read-only
Date: Tue,  7 Jul 2026 06:17:12 -0700
Message-ID: <20260707131714.3266156-1-usama.arif@linux.dev>
In-Reply-To: <20260706130440.9295-2-xueyuan.chen21@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_061729_004331_88C85248 
X-CRM114-Status: GOOD (  26.50  )
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

On Mon,  6 Jul 2026 21:04:38 +0800 Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:

> From: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
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
> The helper is direct-map specific and does not flush TLBs. Architectures
> without direct-map permission support keep existing behavior through the
> generic stub.
> 
> Persistent huge zero folio setup happens during early boot, so no explicit
> TLB flush is needed.
> 
> Inspired by Jann Horn's read-only zero page work[1] and follow-up
> discussion[3] with Yang Shi.
> 
> [1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
> [2] https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/
> [3] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  include/linux/set_memory.h | 26 ++++++++++++++++++++++++++
>  mm/huge_memory.c           |  9 ++++++++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 3030d9245f5a..a905074fb21d 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -40,6 +40,22 @@ static inline int set_direct_map_valid_noflush(struct page *page,
>  	return 0;
>  }
>  
> +/**
> + * set_direct_map_ro_noflush - make direct-map mappings read-only
> + * @addr: start address in the direct map
> + * @nr_pages: number of pages starting at @addr
> + *
> + * Make the direct-map mappings for @nr_pages pages starting at @addr
> + * read-only, without flushing TLBs.
> + *
> + * Return: 0 on success or when unsupported, negative error code on failure.
> + */
> +static inline int set_direct_map_ro_noflush(const void *addr,
> +					    unsigned long nr_pages)
> +{
> +	return 0;
> +}
> +
>  static inline bool kernel_page_present(struct page *page)
>  {
>  	return true;
> @@ -56,6 +72,16 @@ static inline bool can_set_direct_map(void)
>  }
>  #define can_set_direct_map can_set_direct_map
>  #endif
> +
> +#ifndef set_direct_map_ro_noflush
> +static inline int set_direct_map_ro_noflush(const void *addr,
> +					    unsigned long nr_pages)
> +{
> +	return 0;
> +}
> +
> +#define set_direct_map_ro_noflush set_direct_map_ro_noflush
> +#endif
>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>  
>  #ifdef CONFIG_X86_64
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index bdd8635922f9..6633217b10dc 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -41,6 +41,7 @@
>  #include <linux/pgalloc.h>
>  #include <linux/pgalloc_tag.h>
>  #include <linux/pagewalk.h>
> +#include <linux/set_memory.h>
>  
>  #include <asm/tlb.h>
>  #include "internal.h"
> @@ -981,8 +982,14 @@ static int __init thp_shrinker_init(void)
>  		 * that get_huge_zero_folio() will most likely not fail as
>  		 * thp_shrinker_init() is invoked early on during boot.
>  		 */
> -		if (!get_huge_zero_folio())
> +		if (!get_huge_zero_folio()) {
>  			pr_warn("Allocating persistent huge zero folio failed\n");
> +			return 0;
> +		}
> +
> +		/* Set up during early boot; no explicit TLB flush is needed here. */
> +		set_direct_map_ro_noflush(folio_address(huge_zero_folio),
> +					  HPAGE_PMD_NR);

Hi,

Can this really skip the TLB flush here?  This runs from a
subsys_initcall, after smp_init() and after the folio was allocated and
zeroed through the writable direct map.  The noflush helper updates the
direct-map PTEs but does not invalidate stale writable kernel TLB entries.

I think we need a TLB flush here?

>  		return 0;
>  	}
>  
> -- 
> 2.49.0
> 
> 

