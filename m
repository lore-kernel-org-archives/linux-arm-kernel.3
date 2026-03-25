Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390AF103A9BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8oDIv9OmFYImz4Zw59hgGJwai7t3I4b2ZT/98FI3D0=; b=fW/Aa6w6RmJ8gr0E6XnKZ+TW1i
	2OG5o33dkJeMh9ZVn7glizAGPpgZkAj4EPoIwLGUcNdYXlxw1AO8R0ADH7MVaNphZVKlJ6AK8exIw
	7lUzJGiGYUHEdSqYqhFeULbbnYO8hkSkNJY7RNrOwqmAHIUmkXu0MvzfVLsgPUgFbIr2LIQUXKxQ3
	TgfKc29m2BNqJDGwm5VHBb8hNFSWMAA/teQf/xl57uLlueoQKdRzTMI+kJodILtjmPOFBKOtsIjjG
	+ieha6GTqinvtg14DHx3o4w8hOKeriZioeTyDgO4+qx6U6tWSjr4IYniBFjuDltw6W75Thllxityl
	lqreXIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MhG-00000003IOM-2ytp;
	Wed, 25 Mar 2026 11:46:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MhE-00000003IN3-0H4u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C754600AC;
	Wed, 25 Mar 2026 11:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89F7C2BC9E;
	Wed, 25 Mar 2026 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439207;
	bh=+1ay25qbDp8Yc4g0FFcp/WSNlnQQfjAooGIzTQyZLIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jb/wya7ozPfFq1WzqUYMMhLlJoakRiEgf2i2AwE2qXhHkJ0hDl5FfJhZeapHHud3T
	 X7ekm5deuD97Z6mt2BPsoDm+PJ2keLFBq9iSy3ayCayYtUp0fNEjp3kDvrT0aE88x0
	 Ujo9nFrHDT73Lezbo9Z8u9Ueg1fHPioNrwrY9v2Ih9gCM8tJH5Jlhh0aKY2EfX8zmR
	 j087WKSSAoW9D/zlA+5F7LwsMrEyrfTgjz+h6UxbWepHV5cAq6N9bGBEkQ/NzV46Q1
	 4c9OxXs9w0Z2SVUyp6IgjDl5VHqZvqUtffr4cNzPo/U6996Usz4t5Zpx5Zjt/ce/Q2
	 EOyeTN3BaX5IA==
Message-ID: <c347fdc9-90b4-43ac-8c2e-559248777ba8@kernel.org>
Date: Wed, 25 Mar 2026 12:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mte: Skip TFSR_EL1 checks and barriers in
 synchronous tag check mode
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Thomas Huth <thuth@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lance Yang <lance.yang@linux.dev>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311175054.3889093-1-usama.anjum@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260311175054.3889093-1-usama.anjum@arm.com>
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

On 3/11/26 18:50, Muhammad Usama Anjum wrote:
> In MTE synchronous mode, tag check faults are reported as immediate
> Data Abort exceptions. The TFSR_EL1.TF1 bit is never set, since faults
> never go through the asynchronous path. Therefore, reading TFSR_EL1
> and executing data and instruction barriers on kernel entry, exit,
> context switch, and suspend is unnecessary overhead in sync mode.
> 
> The exit path (mte_check_tfsr_exit) and the assembly paths
> (check_mte_async_tcf / clear_mte_async_tcf in entry.S) already had this
> check.

Right, that's for user space (TFSR_EL1.TF0 IIUC). What you are adding is
for KASAN. Maybe make that clearer.

> Extend the same optimization on kernel entry/exit, context
> switch and suspend.
> 
> All mte kselftests pass. The kunit before and after the patch show same
> results.
> 
> A selection of test_vmalloc benchmarks running on a arm64 machine.
> v6.19 is the baseline. (>0 is faster, <0 is slower, (R)/(I) =
> statistically significant Regression/Improvement). Based on significance
> and ignoring the noise, the benchmarks improved.
> 
> * 77 result classes were considered, with 9 wins, 0 losses and 68 ties
> 
> Results of fastpath [1] on v6.19 vs this patch:
> 
> +----------------------------+----------------------------------------------------------+------------+
> | Benchmark                  | Result Class                                             |   barriers |
> +============================+==========================================================+============+
> | micromm/fork               | fork: p:1, d:10 (seconds)                                |  (I) 2.75% |
> |                            | fork: p:512, d:10 (seconds)                              |      0.96% |
> +----------------------------+----------------------------------------------------------+------------+
> | micromm/munmap             | munmap: p:1, d:10 (seconds)                              |     -1.78% |
> |                            | munmap: p:512, d:10 (seconds)                            |      5.02% |
> +----------------------------+----------------------------------------------------------+------------+
> | micromm/vmalloc            | fix_align_alloc_test: p:1, h:0, l:500000 (usec)          |     -0.56% |
> |                            | fix_size_alloc_test: p:1, h:0, l:500000 (usec)           |      0.70% |
> |                            | fix_size_alloc_test: p:4, h:0, l:500000 (usec)           |      1.18% |
> |                            | fix_size_alloc_test: p:16, h:0, l:500000 (usec)          |     -5.01% |
> |                            | fix_size_alloc_test: p:16, h:1, l:500000 (usec)          |     13.81% |
> |                            | fix_size_alloc_test: p:64, h:0, l:100000 (usec)          |      6.51% |
> |                            | fix_size_alloc_test: p:64, h:1, l:100000 (usec)          |     32.87% |
> |                            | fix_size_alloc_test: p:256, h:0, l:100000 (usec)         |      4.17% |
> |                            | fix_size_alloc_test: p:256, h:1, l:100000 (usec)         |      8.40% |
> |                            | fix_size_alloc_test: p:512, h:0, l:100000 (usec)         |     -0.48% |
> |                            | fix_size_alloc_test: p:512, h:1, l:100000 (usec)         |     -0.74% |
> |                            | full_fit_alloc_test: p:1, h:0, l:500000 (usec)           |      0.53% |
> |                            | kvfree_rcu_1_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.81% |
> |                            | kvfree_rcu_2_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.06% |
> |                            | long_busy_list_alloc_test: p:1, h:0, l:500000 (usec)     |     -0.56% |
> |                            | pcpu_alloc_test: p:1, h:0, l:500000 (usec)               |     -0.41% |
> |                            | random_size_align_alloc_test: p:1, h:0, l:500000 (usec)  |      0.89% |
> |                            | random_size_alloc_test: p:1, h:0, l:500000 (usec)        |      1.71% |
> |                            | vm_map_ram_test: p:1, h:0, l:500000 (usec)               |      0.83% |
> +----------------------------+----------------------------------------------------------+------------+
> | schbench/thread-contention | -m 16 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |      0.05% |
> |                            | -m 16 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.60% |
> |                            | -m 16 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 16 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
> |                            | -m 16 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.58% |
> |                            | -m 16 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      9.09% |
> |                            | -m 16 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.74% |
> |                            | -m 16 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |     -1.40% |
> |                            | -m 16 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.00% |
> |                            | -m 16 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |     -0.78% |
> |                            | -m 16 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |     -0.11% |
> |                            | -m 16 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
> |                            | -m 16 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.64% |
> |                            | -m 16 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      3.15% |
> |                            | -m 16 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     17.54% |
> |                            | -m 32 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -1.22% |
> |                            | -m 32 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.85% |
> |                            | -m 32 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 32 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
> |                            | -m 32 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      1.05% |
> |                            | -m 32 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 32 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.41% |
> |                            | -m 32 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.58% |
> |                            | -m 32 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      2.13% |
> |                            | -m 32 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.67% |
> |                            | -m 32 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      2.07% |
> |                            | -m 32 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -1.28% |
> |                            | -m 32 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      1.01% |
> |                            | -m 32 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      0.69% |
> |                            | -m 32 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     13.12% |
> |                            | -m 64 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -0.25% |
> |                            | -m 64 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.48% |
> |                            | -m 64 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |     10.53% |
> |                            | -m 64 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.06% |
> |                            | -m 64 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      0.00% |
> |                            | -m 64 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 64 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.36% |
> |                            | -m 64 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.52% |
> |                            | -m 64 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
> |                            | -m 64 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.52% |
> |                            | -m 64 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      3.53% |
> |                            | -m 64 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -0.10% |
> |                            | -m 64 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.53% |
> |                            | -m 64 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      1.82% |
> |                            | -m 64 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     -5.80% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/getpid             | mean (ns)                                                | (I) 15.98% |
> |                            | p99 (ns)                                                 | (I) 11.11% |
> |                            | p99.9 (ns)                                               | (I) 16.13% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/getppid            | mean (ns)                                                | (I) 14.82% |
> |                            | p99 (ns)                                                 | (I) 17.86% |
> |                            | p99.9 (ns)                                               |  (I) 9.09% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/invalid            | mean (ns)                                                | (I) 17.78% |
> |                            | p99 (ns)                                                 | (I) 11.11% |
> |                            | p99.9 (ns)                                               |     13.33% |
> +----------------------------+----------------------------------------------------------+------------+
> 
> [1] https://gitlab.arm.com/tooling/fastpath
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> The patch applies on v6.19 and next-20260309.
> ---
>  arch/arm64/include/asm/mte.h | 6 +++++-
>  arch/arm64/kernel/mte.c      | 5 +++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 6d4a78b9dc3e6..0e05d20cf2583 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -252,7 +252,8 @@ static inline void mte_check_tfsr_entry(void)
>  	if (!kasan_hw_tags_enabled())
>  		return;
>  
> -	mte_check_tfsr_el1();
> +	if (system_uses_mte_async_or_asymm_mode())
> +		mte_check_tfsr_el1();

For symmetry, I would also write this as

	if (!system_uses_mte_async_or_asymm_mode())
		return;

	mte_check_tfsr_el1();



Nothing jumped at me, but I am still new to this code + spec :)

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David

