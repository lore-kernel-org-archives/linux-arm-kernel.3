Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B4FD6100A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 11:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLXst4hKcwqR8aL0m9xNuTfU7cjH0z0TV7vdns2E8pI=; b=jYm28pvIwE7j2/8UIyC94z+FKY
	QHb3lSmojPfWtFLDuPqX91e3OL7iGXaVxwvRZdHQTWd4jAC9dRVgeR5Klk+rT2QDYELhsBf1ZgEev
	nK+7wlzTrBuIcCynCxa8uKKtIqtyYA+MNwxd3URsVmV8o/YQIWVeMHmOITuSRFrUiBlW3zq/M1Y52
	ax0+wQzJATmyJchvi7tpo4J56p1vn7OEKqJebnFrYVHgdNN2rfy4svkusiHEsW7nPAFf/wSlMjuVC
	qU0ixISAqIJWbVN4TflL9FYSZcunYiSC5H8b4meSEq70d12sTcxAHt6D1SJihIYMuIJT2evCho+m7
	gDP+dsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQMs-000000003YB-04jp;
	Thu, 29 Jan 2026 11:39:22 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQMo-000000003Xq-3RJz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 11:39:20 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-435f177a8f7so166053f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 03:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686756; x=1770291556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLXst4hKcwqR8aL0m9xNuTfU7cjH0z0TV7vdns2E8pI=;
        b=XfgSIuRyh2WisTUYy33L+/yPS4pJ8vrRrxVMUMD4EeBQ5W8BmWUOTxb31fIEjBM5cy
         DLkMxuPb9GVH7mKKkfdVyOzKTJlJWJXPiqBxlnsYeaFv1Pw6B2VGBynBwjvAqhHHLtbf
         sqfCaMXigMIA99SScXJ09M02VkirSvW7g40Y09kzAXoYbNfbdMEycEDupuTMirWk3iO8
         hJJAR3JpGPO9qEx/NWEFi3SW6ZI3BaQovVgsiA83qG1l6mvjLUNvviNKc5ymlmBt0pfk
         QGhR8tAqf4EhbXkEW9STSAbFaSGN0Yw5Vep0BhXkK1AtPxdYzzydpCU8w4yLwG2cMUYY
         dyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686756; x=1770291556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLXst4hKcwqR8aL0m9xNuTfU7cjH0z0TV7vdns2E8pI=;
        b=DD1s5EKrt1gyWN0FLLD+IqR8spmrEdekVUoSUpa1Wtt9vsw4pE+OcOCpfkc7VlT6nJ
         3IytfORTcEW3wNKyC4jp1dOPE10tjkgydYY3QCL1q4XQ6p2bmRkh8f+izPHv4AtthxhT
         /kpHM3ZjSt6h9Rl5GYSPlYwwO3pSTqytX+1l0bTE/I+R7k6RcYrz8r4c+jouMjeLNFhH
         tPgL9YjhQS+ecAL6hqJqxFdxzPlDfofGAu5qIlotWP+CXd2aZoabNzR68CLKRR3scbCV
         NFeAFj4NZCEObeAdOTN1X6fa3e8xj/9U7FTa0xeJv9ZymFfYJRuhMMBX5ue3frz8t6uG
         uOFw==
X-Forwarded-Encrypted: i=1; AJvYcCW5bZbs7VCThUWkZXoeeO7xQzvQNZbmvFs9bAKoNgiDh+RJi8MXMkWlFWeHufRtfnE0CizUT7aM7E0BbHJNMOpB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4Dfjgm7juOdMKxtT4lJL1l7iohcmJgBpTSlzLtFKF+RNjbJ1
	8LNFm/1nD1RG1mJmu88G3E+zzpnHiPXl8r3XDjjXBH8+zuJ8Eni5W/W9Q2D5M76j
X-Gm-Gg: AZuq6aLvPGVY8CAmP77WAcbv5O2AN+fpnANxvC4Fa0f4bMmLhNgjVK96xEIui+V+Zg9
	vc3SyW8vczjZp+s4hNxpCDgEFPPEsHlno7lZIUkfdswlhsNpwpufp6+7c50nRigU+icpCC20l7W
	1szrYZLAKWkSXOKkoqgt8YCTwd/tvrKxdI8YFM/wnMkJqSti1Hxmmm5pT1rC4XJqgiC33tTwBjm
	KKAaJmXqvUgsQM0uXwQb/2VdNS281QqrOECiR9Qjf0FFMwRCJ+4SfUBZ6+lp8oCAdy1HaAVmaW6
	L47Cfukoz1zcagaq9FSeAz0/2Z0cxP06NaaX8+Mrvgqv/VBO8EG/Yk9JNmDkqgyaBx73W/Y3n0Z
	k62FzUWoliCCtKo6FtWMvjDAc314eWtszsEag0tMydH152Bx0VU+c1GUgsnl+pLmJHimhm6DPqt
	LRYAw5PV/u/C8+kaoi9z3KH4MaXyRbzZHoKvkMcy4K7mQ8AABwKATuJ6NQcbxzUPw=
X-Received: by 2002:a05:600c:c16b:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-48069c1a85bmr92237885e9.13.1769680343784;
        Thu, 29 Jan 2026 01:52:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066aaf235sm177623235e9.0.2026.01.29.01.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:52:23 -0800 (PST)
Date: Thu, 29 Jan 2026 09:52:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260129095219.6a3b8dc8@pumpkin>
In-Reply-To: <20260129005645.747680-4-elver@google.com>
References: <20260129005645.747680-1-elver@google.com>
	<20260129005645.747680-4-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_033918_904075_0BF493EA 
X-CRM114-Status: GOOD (  28.92  )
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

On Thu, 29 Jan 2026 01:52:34 +0100
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
> 		spin_lock(lock_ptr);
> 	...
> 	}
> 
> The READ_ONCE() above is expanded to arm64's LTO __READ_ONCE(). Here,
> Clang Thread Safety Analysis's alias analysis resolves 'lock_ptr' to
> 'atomic ? __u.__val : q->lock_ptr',

Doesn't the previous patch remove that conditional?
This description should really refer to the code before this patch.

> and considers this the identity of
> the context lock given it can't see through the inline assembly;
> however, we simply want 'q->lock_ptr' as the canonical context lock.
> While for code generation the compiler simplified to __u.__val for
> pointers (8 byte case -> atomic), TSA's analysis (a) happens much
> earlier on the AST, and (b) would be the wrong deduction.
> 
> Now that we've gotten rid of the 'atomic' ternary comparison, we can
> return '__u.__val' through a pointer that we initialize with '&x', but
> then change with a pointer-to-pointer. When READ_ONCE()'ing a context
> lock pointer, TSA's alias analysis does not invalidate the initial alias
> when updated through the pointer-to-pointer, and we make it effectively
> "see through" the __READ_ONCE().

Some of that need to be a comment in the code.
I also suspect you've just found a bug in the TSA logic.

> 
> Code generation is unchanged.
> 
> Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v2:
> * Rebase.
> ---
>  arch/arm64/include/asm/rwonce.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 712de3238f9a..3a50a1d0d17e 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -48,8 +48,11 @@
>   */
>  #define __READ_ONCE(x)							\
>  ({									\
> -	typeof(&(x)) __x = &(x);					\
> +	auto __x = &(x);						\
> +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> +	auto __retp = &__ret;						\
>  	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\

Can you define __val using typeof(__ret)?
Saves expanding the macro twice (although it isn't the horrid
__unqual_scaler_typeof() any more).

	David


> +	*__retp = &__u.__val;						\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -74,7 +77,7 @@
>  	default:							\
>  		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	__u.__val;							\
> +	*__ret;								\
>  })
>  
>  #endif	/* !BUILD_VDSO */


