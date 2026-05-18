Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB2ACD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37/V4myQtLYw9KQKwAjbW2kIIZmWKbVCLuRYjC1I9hM=; b=vPVxC2FrtwHqcVhlT3Q8vX5qa1
	ha44Jd2HiBrcKn49WSkB4Lr0PNSlFSkduZtq985PMHPDDzTqq/kGjhF/8G08+bgecMnxarN/SzW8K
	nOlMQ5YR6Iddn0xXUYLfpCrViuaWVRshD0Qf5jvYFZcIWDJaZMBthwKTEdItjQub5YDHp5yMZAb+u
	NPjzN+GlSR8TX+HbvQDmbQGbi8iM3E6oabXgbTWtniD1iFXA3vDxmLDieGBoFEqqeZ/J/m/YmdFpP
	syVn3jztvk0GT72ubEbKoDcW2SxXjx5I6O0+lMWwaPBKZ0VMus3ZLBMNcro/GPHysQBjHQI0r5Yqg
	9Gambbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwah-0000000FWRc-34ES;
	Mon, 18 May 2026 11:56:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwag-0000000FWR6-3LpN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41A5F601E6;
	Mon, 18 May 2026 11:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD95C2BCB8;
	Mon, 18 May 2026 11:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779105418;
	bh=ZqSqVOM71hh/20FtqHQB7fzErpQxqp8B8yJvkq2bEq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyazhlNUhOCKURlRST1CyCVCMZ3ozFt10rObLVGUyrBdUE/JoBfD4uMrrwWfdPbRv
	 S9gUpgnbKTa81WdsDL2JBCTKdV0xHQA4j6mbyZdJL5NB2C7VeApOx5G+eD9nFKzTst
	 gPQKoduUIzHsOoxAdySAGmW6k1/pP7gV/ctUcHAc1UKbC4XvuXuWUWV3SyqZfUe+KI
	 n25UrjUNePmo1pPE9VS/pvcfFHuTr8q1QoVvOL98B7U369BUZkZkWML68Xbof78Sn4
	 DoTJWWumczj7IONUUBSEAgNNOlIA4ic//ldMufPweoScYzPwKzEne+T2o9fmnYT3rQ
	 3fr+xNPtTvBkQ==
Date: Mon, 18 May 2026 12:56:51 +0100
From: Will Deacon <will@kernel.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org
Subject: Re: [PATCH v12 06/15] kasan: arm64: x86: Make page_to_virt() KASAN
 aware
Message-ID: <agr-g38q5RiahqaA@willie-the-truck>
References: <cover.1774872838.git.m.wieczorretman@pm.me>
 <b9f7bd991dd2ba0b4c187f5c63962626f00c6a62.1774872838.git.m.wieczorretman@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9f7bd991dd2ba0b4c187f5c63962626f00c6a62.1774872838.git.m.wieczorretman@pm.me>
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

On Mon, Mar 30, 2026 at 02:33:43PM +0000, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> Special page_to_virt() implementation is needed if an architecture wants
> to enable KASAN software tag-based mode.
> 
> Make page_to_virt() KASAN aware in arch-independent code so
> architectures implementing the software tag-based mode don't have to
> define their own implementations anymore. When KASAN is disabled or for
> architectures that don't implement the software tag-based mode
> page_to_virt() will be optimized to it's previous form.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v11:
> - Redo the patch to work on the page_to_virt macro. Split off changes
>   about virt to phys conversion to an earlier patch.
> - Remove Alexander's acked-by due to bigger changes.
> 
> Changelog v7:
> - Add Alexander's Acked-by tag.
> 
> Changelog v5:
> - Move __tag_reset() calls into __phys_addr_nodebug() and
>   __virt_addr_valid() instead of calling it on the arguments of higher
>   level functions.
> 
> Changelog v4:
> - Simplify page_to_virt() by removing pointless casts.
> - Remove change in __is_canonical_address() because it's taken care of
>   in a later patch due to a LAM compatible definition of canonical.
> 
>  arch/arm64/include/asm/memory.h |  5 -----
>  include/linux/kasan.h           | 10 ++++++++++
>  include/linux/mm.h              |  5 ++++-
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index 875c0bd0d85a..39dd0071d3ec 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -411,11 +411,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>   */
>  
>  #if defined(CONFIG_DEBUG_VIRTUAL)
> -#define page_to_virt(x)	({						\
> -	__typeof__(x) __page = x;					\
> -	void *__addr = __va(page_to_phys(__page));			\
> -	(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));\
> -})

So here we're using '__page' to avoid multiple evaluations of 'x'...

>  #define virt_to_page(x)		pfn_to_page(virt_to_pfn(x))
>  #else
>  #define page_to_virt(x)	({						\
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index e18908f3ad6e..271c59e9f422 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -527,6 +527,11 @@ static inline void *kasan_reset_tag(const void *addr)
>  	return (void *)arch_kasan_reset_tag(addr);
>  }
>  
> +static inline void *kasan_set_tag(const void *addr, u8 tag)
> +{
> +	return (void *)arch_kasan_set_tag(addr, tag);
> +}
> +
>  /**
>   * kasan_report - print a report about a bad memory access detected by KASAN
>   * @addr: address of the bad access
> @@ -544,6 +549,11 @@ static inline void *kasan_reset_tag(const void *addr)
>  	return (void *)addr;
>  }
>  
> +static inline void *kasan_set_tag(const void *addr, u8 tag)
> +{
> +	return (void *)addr;
> +}
> +
>  #endif /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS*/
>  
>  #ifdef CONFIG_KASAN_HW_TAGS
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 09044934dda8..f234650a4edf 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -117,7 +117,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
>  #endif
>  
>  #ifndef page_to_virt
> -#define page_to_virt(x)	__va(PFN_PHYS(page_to_pfn(x)))
> +#define page_to_virt(x) ({							\
> +	void *__addr = __va(PFN_PHYS(page_to_pfn((struct page *)x)));		\
> +	kasan_set_tag(__addr, page_kasan_tag(x));				\
> +})

... but in the new code you're proposing, you evaluate 'x' twice.

Is there a reason not to take the arm64 code as-is?

Will

