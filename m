Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF48CD31A15
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USGtV3+n93v8pp6pT/3Zgm6YGfywpo0PJVEBtkCCeSQ=; b=ADuTGKPzsShlIm8iEcDjvBSvVB
	ufYWWwl9jL5Yo+2+hd4h5N/QMZ0+Pvm+CTCB88QMVtH7nANA94OHdaGtUVYn4v251wittbQWB6XPi
	Ql6ei+kZHSE2dylpS7p6QozU9Q0HlWgdNITvab2kSDD1+NNeVsOXj+uKX1DvlOH15DKqcsnYRAqP8
	CWxlmjBfVV3JkXCj6Hz9L390erRmgS12jPrVxDu/LkhCVvc/TbIfcng+vEqjClOKBW0HBeNystdPg
	kKJyUUXliWWsFmBbQDZfYnzi/hTqCD1h8W2aUzUs9Yb5I+xjEJulA4n8GAcM7KyzUd8ccxodG4VlO
	yAs7Tqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvBu-00000008BQ4-3pZt;
	Wed, 14 Jan 2026 07:21:18 +0000
Received: from smtp-out3.simply.com ([94.231.106.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvBs-00000008BPG-0zsf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 07:21:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4drcwp38sWz1DR2b;
	Wed, 14 Jan 2026 08:21:14 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4drcwm54NNz1DDXY;
	Wed, 14 Jan 2026 08:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1768375274;
	bh=USGtV3+n93v8pp6pT/3Zgm6YGfywpo0PJVEBtkCCeSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GLYRdRw6BcVYpXpDzS8ZqYhxtT7bZEqyt6FuYL8Og+uuX6KmBzkodf4AAzTgQK8Vj
	 6QbBYuy/EUx3fCM7vga1p7zdd9seT9SSuJ28fck7TvCAs/Gwc0UpWogq+FDfeMLhxP
	 Q9tIWi9KAy3JY7vvXnVldebdrOSI6/xQmw6aZqkHZJU9FXjDY0poTHU/LzOD1ekgYF
	 2nFh0u8d2uWVggyereuQ0MAq07iXxOjlDmJmNDlViRxcJ4I2srsAz+uaxP1y7echmT
	 rgWILKmtxf/xBcRfC4IBmOKjPaCa/8zHfl4NRJCZIC9TqeetLFcYzLPvsXlK9du/pk
	 oxIYdU3UlZQgw==
Message-ID: <544172e4-cdf7-4789-8cad-4dc3c498e497@gaisler.com>
Date: Wed, 14 Jan 2026 08:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] sparc/mm: replace batch->active with
 is_lazy_mmu_mode_active()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-13-kevin.brodsky@arm.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251215150323.2218608-13-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232116_701358_B4317F9B 
X-CRM114-Status: GOOD (  20.55  )
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

On 2025-12-15 16:03, Kevin Brodsky wrote:
> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper
> is_lazy_mmu_mode_active() to tell whether a batch struct is active
> instead of tracking it explicitly.
> 
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/sparc/include/asm/tlbflush_64.h | 1 -
>  arch/sparc/mm/tlb.c                  | 9 +--------
>  2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 4e1036728e2f..6133306ba59a 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -12,7 +12,6 @@ struct tlb_batch {
>  	unsigned int hugepage_shift;
>  	struct mm_struct *mm;
>  	unsigned long tlb_nr;
> -	unsigned long active;
>  	unsigned long vaddrs[TLB_BATCH_NR];
>  };
>  
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 7b5dfcdb1243..3a852071d260 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,11 +52,7 @@ void flush_tlb_pending(void)
>  
>  void arch_enter_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb;
> -
>  	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> -	tb->active = 1;
>  }
>  
>  void arch_flush_lazy_mmu_mode(void)
> @@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
>  
>  void arch_leave_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> -
>  	arch_flush_lazy_mmu_mode();
> -	tb->active = 0;
>  	preempt_enable();
>  }
>  
> @@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
>  		nr = 0;
>  	}
>  
> -	if (!tb->active) {
> +	if (!is_lazy_mmu_mode_active()) {
>  		flush_tsb_user_page(mm, vaddr, hugepage_shift);
>  		global_flush_tlb_page(mm, vaddr);
>  		goto out;

Acked-by: Andreas Larsson <andreas@gaisler.com>

Cheers,
Andreas


