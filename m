Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24F3EC0480
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6WzQuT/ywf2VJayMRdaH0qj4NoL8SKxQZkqSuaYQr8=; b=21RKO2kpCGfciKKnw4kBaQwG+h
	Z5ZMIXBCZCbz60F3ZaPb4pbHEvkj7h/pW/AouVZw0pdo7O8XgzQsmLiUTRiESP1UxTH5mRyeCA30w
	d6JvYeDwxN5rqhYyOREumMSd41qMbeWDRJSqWm7PMkNCzUUf7thwIzO0iEixvfT9gvaS7p7grCBXj
	2go9aPS0O6NaAPI42sz/ceucNpxpZ1LILAJxwLhUnkQKLr3wwFyo+tonVXUoEFU38OvE4CzVZF8bL
	+7i0czaZHt8tdWYpYslXYIEq4mMJwBwflfOIpPZPnDIqgrKMeJnkEjaFCp9MkQtfcAS+0WQP5UxRZ
	SfOm0edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMVR-0000000Ev78-43HK;
	Tue, 03 Mar 2026 09:57:33 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMVP-0000000Ev67-0Pd4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:57:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b6WzQuT/ywf2VJayMRdaH0qj4NoL8SKxQZkqSuaYQr8=;
	b=vtMMOZpY2BgK9CHKOV1XD6roFa6JcJHJt0/lx8Ie/XUrTfU6c5qh2KRkwDmV7TIjXbzMEjTIw
	9EplnZOzDSwooaTP3aljgPzGBAt/sNZhsElpzqpC0eK0j7AGfhCz3YCdV8SQgSCb/sirgMkRc68
	7EMbtJoyxsjv/hETEOwr3X0=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fQB3521XqzN168;
	Tue,  3 Mar 2026 17:54:09 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fQB5l5cw0zHnGhy;
	Tue,  3 Mar 2026 17:56:27 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 4F5D54056B;
	Tue,  3 Mar 2026 17:57:21 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Mar
 2026 09:57:20 +0000
Date: Tue, 3 Mar 2026 09:57:18 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 11/13] arm64: mm: More flags for __flush_tlb_range()
Message-ID: <20260303095718.00001320@huawei.com>
In-Reply-To: <20260302135602.3716920-12-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
	<20260302135602.3716920-12-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_015731_819196_91E918C7 
X-CRM114-Status: GOOD (  21.95  )
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

On Mon, 2 Mar 2026 13:55:58 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Refactor function variants with "_nosync", "_local" and "_nonotify" into
> a single __always_inline implementation that takes flags and rely on
> constant folding to select the parts that are actually needed at any
> given callsite, based on the provided flags.
> 
> Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
> to provide the strongest semantics (i.e. evict from walk cache,
> broadcast, synchronise and notify). Each flag reduces the strength in
> some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
> complement the existing TLBF_NOWALKCACHE.
> 
> There are no users that require TLBF_NOBROADCAST without
> TLBF_NOWALKCACHE so implement that as BUILD_BUG() to avoid needing to
> introduce dead code for vae1 invalidations.
> 
> The result is a clearer, simpler, more powerful API.
Hi Ryan,

There is one subtle change to rounding that should be called out at least.

Might even be worth pulling it to a precursor patch where you can add an
explanation of why original code was rounding to a larger value than was
ever needed.

Jonathan


> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>


>  static inline void __flush_tlb_range(struct vm_area_struct *vma,
> @@ -586,24 +615,9 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>  				     unsigned long stride, int tlb_level,
>  				     tlbf_t flags)
>  {
> -	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
> -				 tlb_level, flags);
> -	__tlbi_sync_s1ish();
> -}
> -
> -static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
> -					   unsigned long addr)
> -{
> -	unsigned long asid;
> -
> -	addr = round_down(addr, CONT_PTE_SIZE);
See below.
> -
> -	dsb(nshst);
> -	asid = ASID(vma->vm_mm);
> -	__flush_s1_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid, 3);
> -	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
> -						    addr + CONT_PTE_SIZE);
> -	dsb(nsh);
> +	start = round_down(start, stride);
See below.
> +	end = round_up(end, stride);
> +	__do_flush_tlb_range(vma, start, end, stride, tlb_level, flags);
>  }

>  
>  static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 681f22fac52a1..3f1a3e86353de 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
...

> @@ -641,7 +641,10 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>  			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
>  
>  		if (dirty)
> -			local_flush_tlb_contpte(vma, start_addr);
> +			__flush_tlb_range(vma, start_addr,
> +					  start_addr + CONT_PTE_SIZE,
> +					  PAGE_SIZE, 3,

This results in a different stride to round down. 
local_flush_tlb_contpte() did
addr = round_down(addr, CONT_PTE_SIZE);

With this call we have
start = round_down(start, stride); where stride is PAGE_SIZE.

I'm too lazy to figure out if that matters.


> +					  TLBF_NOWALKCACHE | TLBF_NOBROADCAST);
>  	} else {
>  		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
>  		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);


