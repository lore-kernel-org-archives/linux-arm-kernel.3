Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B89E6BF2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5YrrQBmasl55YNR+UE7+Tj54HTQyt4aQnFBBbSZIJY=; b=nCycBhJ6fjqHwdTMFpSPuxTPM9
	D0Y3vdDGQFnuiBYdn0jESKbTrJyxfDhJ4GAfFjMMje/pS+5GIRcIsco1fSM2zZ1WSvZZWeIQIXTTr
	V/7rrtY+f+7evfQE+IvyjYwqAjbBae7hw74K/TIdIOE+zFs3eV2Toli6Pfe8D9VMjFZF3JGvJiXCt
	crftFK4ZjnSPWY56H4EssXmyVTre+CTOP4dLiL47qRU3z8AToLu9PLoZkeWQjgUD4Fuj54BWUKF9n
	R64PZ282O1rYTIkDXin7Tj0hKG4ntpUcyYrfb51lNPDiZZrhWcY7zw7uP3HshW/2LDHYSY1So8aC3
	1OgmvU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrkG-00000001jdC-0Yrj;
	Fri, 30 Jan 2026 16:53:20 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrkD-00000001jcr-2uxE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 16:53:19 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-b883c8dfb00so554872166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769791996; x=1770396796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5YrrQBmasl55YNR+UE7+Tj54HTQyt4aQnFBBbSZIJY=;
        b=V0l5uCU+ZatJrjBf8107C24y+/XNb5z2lukh7VbuwIcVCJDJzBMwVrDbdyk6iMSTVm
         JFOZBCVARk8PNttcTCciHK7tb/8WDI/ukzEq+6snPDvFT3TXxqoFnuSKca33bk7fWQn0
         zWoEVY2Lsz8KJuuMur9JMiGRU2zQEcLomkTsSDvg1p/4HK9QXZ4xBoOyLop+UPh4WyxA
         2JljGfppicBoVguTJUJyOwrmoP+BEu9r2tZQy+rSD92UGFCQS7n4Zn+4RZnlm/RyjBKW
         FTRWdFuOtDj0HHLYFzLvZcJ41NP8JZLBm6SpabydFVx5Tyy+wHj8q/HNj2U4II+fjXXa
         dwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791996; x=1770396796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D5YrrQBmasl55YNR+UE7+Tj54HTQyt4aQnFBBbSZIJY=;
        b=kyolMqtVK25cbf3cwsVwBG0vUkzq4/7X9uJHWNgPHVK0pkwSv/zXObobDxO9FdgzpJ
         hrertNfALdaA/TFT6DtsboHUmYdREKdq/xZrkrV92ihiA2sTI0TWfQce92uNqp31dwJb
         J5kw7kzT8hs/tp7Om70RAlz56Rmpa90wWsQcTiUSG6YWw0uunJ0zUjGQJP7ywM+xw6sJ
         2eeBpTN34o+g0cYQy81FIKB55Nvk48sRYOdiHZYfot59uXv0CvT/IVucceNJQ8b4b7z6
         qmB/0uir/8ASJo93bm3u4zIF+1MiDF/xcXidFF3fCeGR06mGcnz7Kyvy0uRWCI3a09ZH
         mEeA==
X-Forwarded-Encrypted: i=1; AJvYcCUz9EwfnLmh6pV1oXFhoqUfIoNaPPOAW+X1LU5OxgBYQiLJl1/YRNgPmZjpE0/9VChwzsLvZ0qa3ACtlnC999Hs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+TgH2DmWcNI247T7LlSt9V0rDDZ7QZKW9Ox5FqhnOfpSrOuBK
	/uHI2eu/MBb58c2un9JIi3eAhLCthlU4Uqb1ErkNaDs0sahhUS05Mq1D
X-Gm-Gg: AZuq6aI8RbR8COPioR5SnslQo6+ou8t5douKRQ30cWTXA1IqMuWUdyqpOrhmZN9/G8y
	sZTIC8FLNbGetVKoF6tWIv/qc5trBh11YQZRJs+fo/Vupd/csopZM6ZSO+bpcjLh6iXfDpZLAn/
	DtNxvuE5ataN/Te5TkXg8KggmUlc2X208W6U7aRkEMLtk887ueD7R6T/Lg1cE5vmfNZMLY5acrc
	Y/bFZQ6pDMJ67H4JM/QCCQl1HKXC/DAOw7QmHzaTZ5QUuHfnWzNxJPJIWBjvLPXrIjppWGppBjD
	16S18ulmmf+k9GztQ6v3sVKvpzss78vRCRRxfecUOXgYmenxbUm+JwBHrj8rWqhkl8m4CIJnOuH
	4LLUd9OpGqhRdsXSPaRhg8zTiNZnCQShxYu7vdxkPvq1y+ilaGWV1awXsOBXgtkepMURpCB1xqN
	jWLgBWTetysYGnY9sOjVSgMMQI43wFi1Q0gK1KYWHcwWweh5oYBmBJ
X-Received: by 2002:a05:6000:3105:b0:430:f5ed:83f9 with SMTP id ffacd0b85a97d-435f3a6ccacmr4297915f8f.2.1769786016653;
        Fri, 30 Jan 2026 07:13:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322f40sm22288828f8f.34.2026.01.30.07.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:13:36 -0800 (PST)
Date: Fri, 30 Jan 2026 15:13:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260130151334.2191973d@pumpkin>
In-Reply-To: <20260130132951.2714396-4-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_085317_789058_0F177C85 
X-CRM114-Status: GOOD (  26.25  )
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

On Fri, 30 Jan 2026 14:28:26 +0100
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

LGTM (for an obscure definition of G).

Reviewed-by: David Laight <david.laight.linux@gmail.com>

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
>  
>  #endif	/* !BUILD_VDSO */


