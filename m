Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63C1E7DEF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6KR/cqyCXBt3vzBC5/C1JE+7FlIfU1A6Hy1j8wPwn4=; b=ME4NXZGOIsbnP2yA4EfFvGPjLL
	qt5RhnjEuHnjLe+REOo1nJEjWI/5Gu2w00zJid6cAwFPrYIRGS3sbgPd9ZzwDguZ/E8iKPcr76kC9
	jWC/kj0/53qfLQF9EiHf5NxMDTRGRSD6E8OijdCDSKq3tr1Kn7LSa5NI0pI7Myqk7HMFZkfxAF+1C
	5lm6qCt/G1uZgwoEzRPWyt/OHtuYJt4Ak6JFubW+MU5mX6jJ8m6Kpu7vEmuKA/b61x4dgrf6CNM9E
	QlMzKyTi/0WJD6E5DMDPBj+Ffsf00QUThdVLGwdvla0/fMYsPHBOtfpDiucB3o0zeFEa0oPct0Pmv
	t8CtCDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmw1g-00000005Cae-0fD0;
	Mon, 02 Feb 2026 15:39:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmw1f-00000005CaK-0dup
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EFF36011E;
	Mon,  2 Feb 2026 15:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E2AC116C6;
	Mon,  2 Feb 2026 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770046782;
	bh=unfluKwMCWkNWNCY/yvRCDV5S0QCQIPAcj66dRitSeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDNsNI1kfM74EZf3jw5Lz6KCoGUQpy/sA48b93AbuYa+d7BpRxbXuLY7cxIkC5Suc
	 /vA57DbopQ/BAIbIoK2fifMkQisnh8CekTaxBEUsF6ZbYvIq9GtyO4GQe6T6s39L7t
	 VYTN7KhfdyQxzSvlxHxD5+pIgpIKrMO0AWVGlUBQkJBpCnvkOT2SBKxTfMXsfkSg0/
	 UND8SWwVizu2milM5CAdJGqlz6kNkH7yXX7OHeda7GBIfn65Y6bNYk7thsp2i8vBrS
	 L42FJTkyZrlbFz4nwlJO5KacbhMdkh8ZEeHJUR4wGtlwOHN63oTNTQgrqyHmM5O7Oj
	 ZfozX/hQc5+jA==
Date: Mon, 2 Feb 2026 15:39:36 +0000
From: Will Deacon <will@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYDFOIskB20CbztD@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-4-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130132951.2714396-4-elver@google.com>
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

On Fri, Jan 30, 2026 at 02:28:26PM +0100, Marco Elver wrote:
> When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> could see:
> 
> | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> |      982 | }
> |          | ^
> |    kernel/futex/core.c:976:2: note: spinlock acquired here
> |      976 |         spin_lock(lock_ptr);
> |          |         ^
> | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> |      982 | }
> |          | ^
> |    kernel/futex/core.c:966:6: note: spinlock acquired here
> |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> |          |      ^
> |    2 warnings generated.
> 
> Where we have:
> 
> 	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> 	..
> 	void futex_q_lockptr_lock(struct futex_q *q)
> 	{
> 		spinlock_t *lock_ptr;
> 
> 		/*
> 		 * See futex_unqueue() why lock_ptr can change.
> 		 */
> 		guard(rcu)();
> 	retry:
> >>		lock_ptr = READ_ONCE(q->lock_ptr);
> 		spin_lock(lock_ptr);
> 	...
> 	}
> 
> At the time of the above report (prior to removal of the 'atomic' flag),
> Clang Thread Safety Analysis's alias analysis resolved 'lock_ptr' to
> 'atomic ?  __u.__val : q->lock_ptr' (now just '__u.__val'), and used
> this as the identity of the context lock given it cannot "see through"
> the inline assembly; however, we want 'q->lock_ptr' as the canonical
> context lock.
> 
> While for code generation the compiler simplified to '__u.__val' for
> pointers (8 byte case -> 'atomic' was set), TSA's analysis (a) happens
> much earlier on the AST, and (b) would be the wrong deduction.
> 
> Now that we've gotten rid of the 'atomic' ternary comparison, we can
> return '__u.__val' through a pointer that we initialize with '&x', but
> then update via a pointer-to-pointer. When READ_ONCE()'ing a context
> lock pointer, TSA's alias analysis does not invalidate the initial alias
> when updated through the pointer-to-pointer, and we make it effectively
> "see through" the __READ_ONCE().
> 
> Code generation is unchanged.
> 
> Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> Cc: Peter Zijlstra <peterz@infradead.org>
> Tested-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v3:
> * Use 'typeof(*__ret)'.
> * Commit message.
> 
> v2:
> * Rebase.
> ---
>  arch/arm64/include/asm/rwonce.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 42c9e8429274..b7de74d4bf07 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -45,8 +45,12 @@
>   */
>  #define __READ_ONCE(x)							\
>  ({									\
> -	typeof(&(x)) __x = &(x);					\
> -	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
> +	auto __x = &(x);						\
> +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> +	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
> +	auto __retp = &__ret;						\
> +	union { typeof(*__ret) __val; char __c[1]; } __u;		\
> +	*__retp = &__u.__val;						\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -71,7 +75,7 @@
>  	default:							\
>  		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	__u.__val;							\
> +	*__ret;								\
>  })

What does GCC do with this? :/

Will

