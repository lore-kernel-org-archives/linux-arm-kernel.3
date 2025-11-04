Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70169CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Xe/zmvPQIxinAGUIpwY1qNYd9MTuz/fJlXIebkoMnw=; b=xKrVGEvXI7Mp7OqdlFd4GDx04h
	FQApLY4oRM97gN4ZYaq6JN7Njtwpp+oIL0M67saMSKIC5GaXWeyBZgkFSIEDJaE0/cJREW3iFqrKt
	TqYzgToxiCAjBEXEjcRr7cBcupyn24B08tXcM1FTdttesiZO1I9053q3bVNzTOMcT03pw8V26oUlg
	M+xZzjkkItfvq8SSzRxcXlgx+tcgslLlKvLhlEfX/d35vf1KsqZ75LVe5PCBT9vI3mzIpkpuyPFkE
	WkSH21b1UqJMUWo/lOsO9/8byTtD0WLN8LALJ6W8MuQa61fWqg0d0TL9wY4y6Uv4Lhf8Pk2T3nmbF
	zG2LmsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKUD-0000000CFFE-2Gp7;
	Tue, 04 Nov 2025 17:06:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKUA-0000000CFEH-09Ip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:06:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C271F1C2B;
	Tue,  4 Nov 2025 09:06:09 -0800 (PST)
Received: from arm.com (RQ4T19M611-5.cambridge.arm.com [10.1.31.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 803553F66E;
	Tue,  4 Nov 2025 09:06:16 -0800 (PST)
Date: Tue, 4 Nov 2025 17:06:14 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com,
	rmikey@meta.com
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQoyhl_aJ8MFsmWE@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_090622_110585_11F4809E 
X-CRM114-Status: GOOD (  26.41  )
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

Hi Breno,

On Tue, Nov 04, 2025 at 07:59:38AM -0800, Breno Leitao wrote:
> On Fri, Oct 31, 2025 at 06:30:31PM +0000, Catalin Marinas wrote:
> > On Thu, Oct 30, 2025 at 03:37:00PM -0700, Paul E. McKenney wrote:
> > > To make event tracing safe for PREEMPT_RT kernels, I have been creating
> > > optimized variants of SRCU readers that use per-CPU atomics.  This works
> > > quite well, but on ARM Neoverse V2, I am seeing about 100ns for a
> > > srcu_read_lock()/srcu_read_unlock() pair, or about 50ns for a single
> > > per-CPU atomic operation.  This contrasts with a handful of nanoseconds
> > > on x86 and similar on ARM for a atomic_set(&foo, atomic_read(&foo) + 1).
> > 
> > That's quite a difference. Does it get any better if
> > CONFIG_ARM64_LSE_ATOMICS is disabled? We don't have a way to disable it
> > on the kernel command line.
> > 
> > Depending on the implementation and configuration, the LSE atomics may
> > skip the L1 cache and be executed closer to the memory (they used to be
> > called far atomics). The CPUs try to be smarter like doing the operation
> > "near" if it's in the cache but the heuristics may not always work.
> 
> I am trying to play with LSE latency and compare it with LL/SC usecase. I
> _think_ I have a reproducer in userspace
> 
> I've create a simple userspace program to compare the latency of a atomic add
> using LL/SC and LSE, basically comparing the following two functions while
> executing without any contention (single thread doing the atomic operation -
> no atomic contention):
> 
> 	static inline void __percpu_add_case_64_llsc(void *ptr, unsigned long val)
> 	{
> 		asm volatile(
> 			/* LL/SC */
> 			"1:  ldxr    %[tmp], %[ptr]\n"
> 			"    add     %[tmp], %[tmp], %[val]\n"
> 			"    stxr    %w[loop], %[tmp], %[ptr]\n"
> 			"    cbnz    %w[loop], 1b"
> 			: [loop] "=&r"(loop), [tmp] "=&r"(tmp), [ptr] "+Q"(*(u64 *)ptr)
> 			: [val] "r"((u64)(val))
> 			: "memory");
> 	}
> 
> and
> 
> 	/* LSE implementation */
> 	static inline void __percpu_add_case_64_lse(void *ptr, unsigned long val)
> 	{
> 		asm volatile(
> 			/* LSE atomics */
> 			"    stadd    %[val], %[ptr]\n"
> 			: [ptr] "+Q"(*(u64 *)ptr)
> 			: [val] "r"((u64)(val))
> 			: "memory");
> 	}

Could you try with an ldadd instead? See my reply to Paul a few minutes
ago.

Thanks.

-- 
Catalin

