Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA2BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDlN6ZmHeE38wM5rEw8R3pNs+sPGXzidrKmPhaUd09A=; b=K31aU6VRThnRRKZ+ASFE+r/71y
	MlkI6bjc9ACDx1o0tPqmmnNqLYW8WewRAK2gU1dBBu1wPNiltpFPaLVy+i1j5ZB9lVIchb6az8AH7
	EPNz9YHoXNRT029PKJ/pf3B5qivNvYYzExndSORv2cjGtpJjHhECJnp5QhggmX9O9KLSwz0D9+wP7
	7s37rZYcR9xCRWgG3+Rs3On6yP1AbzCFyWkSL9MaAaXjIK3HDuCdDpKph1PbPBgrWlldzjPIfjynz
	F+NotVcXjUg/GELpxyzcQHd6bq1CGDGMKC5ybvZBgm5eBPobpTN8gxb0/5wc1Y00S+9A2n97BWoM1
	A5rlGvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERHh-00000009FRI-1Z2p;
	Mon, 12 May 2025 11:25:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uER0Z-00000009CrM-0oiu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747048062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xDlN6ZmHeE38wM5rEw8R3pNs+sPGXzidrKmPhaUd09A=;
	b=G3GNj5Ev2fvfOKe+xopOQKBjdXvaWim6IR9faXhqLMje2FbvAbGSg2QL5XFP1hu1ZVGT86
	Dy1N1jbmUj6L8HYnRDGg1Whi+ewyYHCp2mXGoDjVZfdjzptrm624WnLxY2RblNd1BbdAgc
	cVa3FlNIhWg4qKdR6HMbPptwVAfxk18=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-ZCYP1c7cM8CPhKUIOuCokg-1; Mon, 12 May 2025 07:07:40 -0400
X-MC-Unique: ZCYP1c7cM8CPhKUIOuCokg-1
X-Mimecast-MFC-AGG-ID: ZCYP1c7cM8CPhKUIOuCokg_1747048060
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso21085735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 04:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747048059; x=1747652859;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xDlN6ZmHeE38wM5rEw8R3pNs+sPGXzidrKmPhaUd09A=;
        b=c/NjrjXpPZGeljupE+1FYgpgvgBiekMvfRNAtnIalzOzfsF8NWAeDaBVE45nDE1/nI
         tqMHOAzQ6QEOC3k8W/DQFnc3agSd/BOuOO4X/4YDqpjZ/sDgXQjhdHL/fOI7b8daH2R4
         CQtlMNdYVnunEzPL9Vindgs9gAVZYdlBktpxB1Ai7aRXucehooPsAQEXrZCTmoqEoBU7
         CM0YbPD4xHnVxEq9zlke6CBEzRPNi8DW+6lzDuEKD/0uoZyiMIWr+6knbnJIWH7Tedtq
         FXdg3nsE2x8r7cbQ7VTJUOuLXGYAEJVQA3y9bwswyakinQCDXSA8rkWAqA+UhzlqAmwo
         VFGA==
X-Gm-Message-State: AOJu0YyLTo8LRNOCPfrEtQ9oF518zo2zhRusEQkLuhtydOk147aUY2Yb
	+plX07wCSL2v+tB6B191cp3cCqnZMgRZvwAn4ohN+yHtEsCagRw7upFejIzJHipt22CS5VNkCrX
	ilu3QrcZYEYX2Tq13JObWI8XpdC2ZjAW5owEZjkCs0YKuK2IyqyT7tkTwDf2EGxohIc33ImLRWV
	8cO8FeY7Q=
X-Gm-Gg: ASbGncuCltPNGXzq9Ijqp083m5wNdbZ+/H01fTyv/LYBtzPQdm1VbBrUFKoIpDAeEZq
	2HrUilyuZoh4ukKO4bHjJvtCQSf3/B0c6O9/X56YHopTcUy4plmy0rz2wL5Lc4LVznyABAwPq6p
	mgugQpQlUYtrGW71hQYYCuUggiEp4edCXm8QP048DszNJi7sYQP+UBHQ/geTziP9qLEJ/f4OL5l
	XXWVp9Lf6S35yF//eStFzy3n4+e1/DpCFH1j4I1D2mF7+HAkb4cyhM+iAmG6Lv+TRVlfQQAchll
	iKEH6Gx4DyI8L1ERWT2yjv5YbUlT+WYwiipH7+ylgQg/pBB8jxt3MHIPe9PAGft/SrA2JfZtYUU
	Ol70NvwlMOkTs8oyFf59KXyG+7hSC6YuwCdWIbDQ=
X-Received: by 2002:a7b:c4d5:0:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-442d02c9a5amr100535285e9.4.1747048059556;
        Mon, 12 May 2025 04:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE4oaKoxPHh6f8ScLGzX7lbN9OG659i54zYiWg/nRmD6o59W4m9TYPnhguyqPdJHuZJ3Dd/g==
X-Received: by 2002:a7b:c4d5:0:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-442d02c9a5amr100535065e9.4.1747048059043;
        Mon, 12 May 2025 04:07:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0? (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c2asm122443655e9.1.2025.05.12.04.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 04:07:38 -0700 (PDT)
Message-ID: <001dfd4f-27f2-407f-bd1c-21928a754342@redhat.com>
Date: Mon, 12 May 2025 13:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250512102242.4156463-1-ryan.roberts@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5OKCWlYndy70W-4Yk3BK7FPrQmMHqKk6uhB09nhWIZQ_1747048060
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_040743_312428_69A9F7E2 
X-CRM114-Status: GOOD (  33.78  )
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

On 12.05.25 12:22, Ryan Roberts wrote:
> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> flags in order to defer barriers until exiting the mode. At the same
> time, it added warnings to check that pte manipulations were never
> performed in interrupt context, because the tracking implementation
> could not deal with nesting.
> 
> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
> do manipulate ptes in softirq context, which triggered the warnings.
> 
> So let's take the simplest and safest route and disable the batching
> optimization in interrupt contexts. This makes these users no worse off
> than prior to the optimization. Additionally the known offenders are
> debug features that only manipulate a single PTE, so there is no
> performance gain anyway.
> 
> There may be some obscure case of encrypted/decrypted DMA with the
> dma_free_coherent called from an interrupt context, but again, this is
> no worse off than prior to the commit.
> 
> Some options for supporting nesting were considered, but there is a
> difficult to solve problem if any code manipulates ptes within interrupt
> context but *outside of* a lazy mmu region. If this case exists, the
> code would expect the updates to be immediate, but because the task
> context may have already been in lazy mmu mode, the updates would be
> deferred, which could cause incorrect behaviour. This problem is avoided
> by always ensuring updates within interrupt context are immediate.
> 
> Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-arm-kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
> 
> Hi Will,
> 
> I've tested before and after with KFENCE enabled and it solves the issue. I've
> also run all the mm-selftests which all continue to pass.
> 
> Catalin suggested a Fixes patch targetting the SHA as it is in for-next/mm was
> the preferred approach, but shout if you want something different. I'm hoping
> that with this fix we can still make it for this cycle, subject to not finding
> any more issues.
> 
> Thanks,
> Ryan
> 
> 
>   arch/arm64/include/asm/pgtable.h | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index ab4a1b19e596..e65083ec35cb 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -64,7 +64,11 @@ static inline void queue_pte_barriers(void)
>   {
>   	unsigned long flags;
> 
> -	VM_WARN_ON(in_interrupt());
> +	if (in_interrupt()) {
> +		emit_pte_barriers();
> +		return;
> +	}
> +
>   	flags = read_thread_flags();
> 
>   	if (flags & BIT(TIF_LAZY_MMU)) {
> @@ -79,7 +83,9 @@ static inline void queue_pte_barriers(void)
>   #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>   static inline void arch_enter_lazy_mmu_mode(void)
>   {
> -	VM_WARN_ON(in_interrupt());
> +	if (in_interrupt())
> +		return;
> +
>   	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
> 
>   	set_thread_flag(TIF_LAZY_MMU);
> @@ -87,12 +93,18 @@ static inline void arch_enter_lazy_mmu_mode(void)
> 
>   static inline void arch_flush_lazy_mmu_mode(void)
>   {
> +	if (in_interrupt())
> +		return;
> +
>   	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>   		emit_pte_barriers();
>   }
> 
>   static inline void arch_leave_lazy_mmu_mode(void)
>   {
> +	if (in_interrupt())
> +		return;
> +
>   	arch_flush_lazy_mmu_mode();
>   	clear_thread_flag(TIF_LAZY_MMU);
>   }

I guess in all cases we could optimize out the in_interrupt() check on 
!debug configs.

Hm, maybe there is an elegant way to catch all of these "problematic" users?

-- 
Cheers,

David / dhildenb


