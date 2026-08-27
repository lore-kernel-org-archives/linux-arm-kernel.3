Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B5C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZQjss/9eVMDnqpAzTSDDgo1ILBujLnrsEIoF3t8dmc=; b=mKzD1Efh6zfKD19TuKh72eLAGi
	e3SyWBhK6JKBPriUDhjlVkqWmxs7qaVGgIaQCegTUABwJ/JJ/iPd1MU5VFP+aAjXC9cRDCWt/K/aD
	SDODIvGiQyxcKEcs/CQgzihHd7OKDFaYbnI9Hj30esqFuiQRWQhT77moryteU3KLYT+nopwIsn/eo
	SqJeOYy/4Wm0c2EZ6sABlvMjlu0TYLLkmECGUTEoCpkB5XRO/rcL7IvmOFRRJR64+w0r/Z/uDdmJ4
	6l6NRdEyNNuUDHf2CEgjbjVNITM+jZJS9WnZ2ZZGAkjexmfturB8hf2tHJa0lRZrxwy/paRk79RjF
	ngSoC8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb7g-00000004Adm-1ljl;
	Thu, 27 Aug 2026 14:30:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb7e-00000004Adb-2mRm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:30:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99267600D2;
	Thu, 27 Aug 2026 14:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3651F000E9;
	Thu, 27 Aug 2026 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787841029;
	bh=JZQjss/9eVMDnqpAzTSDDgo1ILBujLnrsEIoF3t8dmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ogWxMmf4J62SjTNPX+WOrS0dmzcGFUnEVr01j2vBmechaE+DQJxr2knOZKhbjXdN6
	 bWAQ6gmuBui+fqEUmU1DdENHaxI7EsjIWBafxTYr2V6F/FmxsPBjE140RfKAoBXjrA
	 +GTBsVLjb3Erz1VtqVZHZkUKlQ//J1z+dnKW352ZJp0FUzJkY4Z3NX0GAZg/FGd4uU
	 Ud7qVx19ddPfdfBqy4BzGbjTXWQE5JLyfGf8k5nvzmqk/zQSbZ4zVKVpTqldChPLze
	 AmLppB5M8eEnk6rLacxZkjMUv4WrlB9HmnjnH/2iXMjOtEpouDkXOQ9NgNjBuLEOEn
	 J6eyoNZB2Fw7g==
Date: Thu, 27 Aug 2026 15:30:24 +0100
From: Will Deacon <will@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Walk page tables with interrupts disabled in
 show_pte()
Message-ID: <apBKADD1xiGWzHCB@willie-the-truck>
References: <20260815211316.974-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815211316.974-1-kmehltretter@gmail.com>
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

On Sat, Aug 15, 2026 at 11:13:16PM +0200, Karl Mehltretter wrote:
> show_pte() walks the page tables locklessly and can run with interrupts
> enabled, so a concurrent teardown (e.g. munmap() in another thread of
> the faulting mm) can free a table page from under it. Dereferencing the
> freed page can fault again or print garbage in the oops report.
> 
> arm64 selects MMU_GATHER_RCU_TABLE_FREE, and the documented protection
> for lockless walkers is disabling interrupts, as gup_fast() does. That
> holds off the RCU-deferred table frees and, unlike rcu_read_lock(),
> also blocks the IPI-based synchronisation (tlb_remove_table_sync_one())
> that khugepaged collapse uses before reusing a table.
> 
> Use guard(irqsave)() around the complete walk. This does not make the
> diagnostic output a consistent snapshot, but prevents it from
> dereferencing a released page-table page.
> 
> Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Testing: QEMU arm64 virt guest, 2 vCPUs, debug_pagealloc=on. A racing
> page-table unmap triggered a nested fault in the walk without this
> patch, none with it.
> 
>  arch/arm64/mm/fault.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 0b52557652be6..b173eebd3cd19 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -16,6 +16,7 @@
>  #include <linux/mm.h>
>  #include <linux/hardirq.h>
>  #include <linux/init.h>
> +#include <linux/irqflags.h>
>  #include <linux/kasan.h>
>  #include <linux/kprobes.h>
>  #include <linux/uaccess.h>
> @@ -151,6 +152,8 @@ static void show_pte(unsigned long addr)
>  		return;
>  	}
>  
> +	guard(irqsave)();
> +
>  	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
>  		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
>  		 vabits_actual, mm_to_pgd_phys(mm));

Curious, but why did you add the guard before the print?

Will

