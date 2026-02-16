Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B765EE81A5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlnrkNiHMMWqhc/Lf+03YWMo+lQDLVH+FdrzL4wse3w=; b=DzxtEMPrtGse7T67k2gI4Cjxvi
	OwmRv/gra+n+hj00WfE40q2vWoCujY2LdFMMDuccn5QaCdZ3qAPF1EeFPwhZHJxXGgl5PyHNuPGh5
	s8B68gRhhBHvAmJHSfISUH5AbKgl+3P5MyMXeT3gUtDOmtcMN3bmWQLxz9rBtQ4K095Hy0WvfLutz
	sWtoTPbDQK4klMcXMyL/H58ZgCLlZKOmz/09P0qRTqrgrEiiDrcaOGJaCzao0uNqvJ3MhhZDqEcF7
	fA2XxPJTSIkP8NB3t4L8atXPIfSYC9Ludyjps5wK9SsYz0X2XiNsPBtG7FcV9KFqVH2p40jpNkAM8
	Z841T7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2tt-000000077ZU-06ds;
	Mon, 16 Feb 2026 18:00:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2tp-000000077Z3-14Pb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:00:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-48379a42f76so20012715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771264843; x=1771869643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlnrkNiHMMWqhc/Lf+03YWMo+lQDLVH+FdrzL4wse3w=;
        b=Ykkv34r9MIfPutG4nkO8tG2W+v3Zo2p0LmHgc8wbjJYgCI09chpnplilfJjwpf3ick
         OXcA/IXqHj5ZzEOhJ72+BZHDHdKJFNTdRYZkAn3MBkeROBR3InkdM5qLsYSX7u2io0i1
         AnF8MnFDNBiGTYlBgsD4y+t5SM6ll+EslaK2v+PyeWlCluQf+2XPN+UfKEUlu2omEsHP
         s0ltGCi8OOBYOQcs3KgryXSXLGtg491tT3gnr30zMGAcCBz3f8+FnKVfhMBzFG6W4qVk
         ejk+p4sYVOE8Pla+dhL6z5qh8ZfbjQUDWKG2kuCOv4jAB7CdLGKSIFSEYcoZjQFZ5RwU
         xR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771264843; x=1771869643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DlnrkNiHMMWqhc/Lf+03YWMo+lQDLVH+FdrzL4wse3w=;
        b=BL5sIVPiyc1dC8CpRmlRlIkNQCbXUp3zylrpeb11+RiiZhRYCHMSPaxHr4/rSbfu8j
         jXwZ9EiPh71Sq1oWMoDn8jSnMBp9caZxVnctWLh7toicsXBkbo0FOlGiXjsFHb3K3u+x
         q2v514WaXpYr4QSc85kc10ebsL62NCtQS2B394o6PXieJNpFrXudKU86lIjJN1U2loPC
         zfItWuKQdraRUcp/mohU/3zi4tZ1pbWZTcz9uX0Ywtel+SRCm9ol/vX3NogfpuBCyAax
         fsFmHZfoe1r0CfUG3eccX9xXG91aljfkCdK5YcAhjYXlAaaPXikd1CwCYADtsubUxMIG
         bqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhy1Vwr/szbKSVDGnvJCUNf8RO8yLyK4/uirVJMgyg0Hyaolx4b8+o7QgMH74yUO78KBtkKI7fUqFS4BCBVLqt@lists.infradead.org
X-Gm-Message-State: AOJu0YxjTbvkjfljPmxQjdzbBiYkJ1YGxqgouZqhOWqLRTBRb+VyQlGL
	MRzaSrwafHVeq9wszqwwNL7jpf5dUPzWoeguC0t2NONaFgbvvE8tBOkz
X-Gm-Gg: AZuq6aL20tickLiXMAumvbNajv3Zx6V+fJ48aaNBoffTjM1p/8JGRdYBgKlDgB4zG63
	BxoxjRYn5zVHxCydHyLOnXaW/do1G2+Hd8rxpPdngKrHCZ70jPvflLfnj4zkgT6w4ZYO/ogWpwq
	bqiNOIvi8iaY+YNov1LH+kg+BkFENuxKlNV6EgxwoaU0DTyEvL330sE2eHkp76MtnZqOXWN+hHl
	cNG57wMuWkCJ80OkfOYmtTmJBmlqtJ7y1vXSF3wZtU6XimzbmL/pmWddIcg+5ZWAULxv3GgCqQp
	hDuVfxXXw5wqA3DH/pPWpW8qDHbz2l+udSuQf+AK/IYoC2QTDpHNxZu9Ex0DnHPYTxs6hULXKav
	1PSLjUPGwitE6Eled4ZKvOsPZL/84vejESuu1OG4SOD+XuCYgNgw9+RRkKwihIBQUey6asmFMkw
	pE9BPbh9V5WGWxUHN4OGdA55j/qg4Jpd1l99pYbi9GXEPT9T0LYqzAouFxvum+FrA4
X-Received: by 2002:a05:600c:4443:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-48379b318bamr123202395e9.0.1771264842769;
        Mon, 16 Feb 2026 10:00:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm351895235e9.4.2026.02.16.10.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:00:42 -0800 (PST)
Date: Mon, 16 Feb 2026 18:00:40 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Al Viro
 <viro@zeniv.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v4 2/2] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260216180040.6a93807a@pumpkin>
In-Reply-To: <20260216142436.2207937-4-elver@google.com>
References: <20260216142436.2207937-2-elver@google.com>
	<20260216142436.2207937-4-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_100046_837379_5B067F4D 
X-CRM114-Status: GOOD (  28.79  )
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

On Mon, 16 Feb 2026 15:16:23 +0100
Marco Elver <elver@google.com> wrote:

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

Did you try adding OPTIMZER_HIDE_VAR(lock_ptr) here?
That might force the TSA logic to use 'where lock_ptr points to'
instead of trying to allow an unlock(q->lock_ptr) (or similar)
which is clearly entirely broken.

Testing a compile with the unlock() missing ought to generate the
warning - if not you've just confused the code enough the it stops
caring.

	David

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
> Reviewed-by: David Laight <david.laight.linux@gmail.com>
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
> index 9fd24cef3376..0f3a01d30f66 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -42,8 +42,12 @@
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
> @@ -68,7 +72,7 @@
>  	default:							\
>  		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	__u.__val;							\
> +	*__ret;								\
>  })
>  
>  #endif	/* !BUILD_VDSO */


