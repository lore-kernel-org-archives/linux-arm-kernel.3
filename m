Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB51E7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hfuro15FK7ZMNo95mSwjrDaX9JD681ZAOPgzp/YRA90=; b=iR/8wnHtKlsl9aiwsGfC/6//LG
	aEU2tux+bSgFiCTYtlBwszFRHZgxi2TWd0b+G6TDhaewQ6khsGkXd0wRbnsbwr0bgrj8QvVMgqKBm
	IcKg0n7nieVLzEnfC+jNIOpbyZhLet7ixGoINEFKZrf2xqGovkHCh9B+ZA15il4xgCzBTZN4N6N0+
	oyfhOhTBRL5VFmsO/4Pat2gXKtBxsPKwQpBBYWJp3Qr3+fABGiwm9OX3SYfw5GjSryQ7L6Gvv2kOZ
	d8UMmTj/vmnun6maX/R+nY4STRSAgGzxgiotPoFT1EtAhj9fmRjepdVuy+E5/svO+b6Sk95iwscPN
	+HTgw4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzc1-00000005WIU-48gO;
	Mon, 02 Feb 2026 19:29:30 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzbz-00000005WHo-3jVm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 19:29:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47ee07570deso40304315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 11:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770060566; x=1770665366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hfuro15FK7ZMNo95mSwjrDaX9JD681ZAOPgzp/YRA90=;
        b=dSImr0Xae1Kkla7M3882KOFuWNW5/jBEcxJez5nRkDsWKvWaMpFBeV+V09rmgpcr+T
         bmmwda0upGDKpYG0wt8wRIHxOK1iyLihbjZNbQVBoXodwTyT1BhoRtUIN9ypn0nOxuj7
         2tZ55D7flrWTCec3UfVsmfnAF7jR0TrEO3a8+GkC+Zcohpv7kNX3SvhTOGnOUUsMIGa/
         nsDYi5BlAio/amLKGXnVI5/DB4flltijNfYFYfwaayNzso8AJ+JdbAFMStv1LapeCTXY
         fAnKqKB2ZXLtHMyX1PEiLx10jJ1XsAFamqbo6GcyD1wdBd57qnGFsEOj7q3pDY8MNhig
         VGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060566; x=1770665366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hfuro15FK7ZMNo95mSwjrDaX9JD681ZAOPgzp/YRA90=;
        b=BaFVzYqCoeK9yAgfmVBfn882YsvJNR+jk4DgnTeggJmabN1vhxo+SoCyIbQYMiBqh8
         Q6/8yVF/+7+GOXOc+0tTuTkyY9bL/bFRGyS0KLmre4WEt49V884YccCYV1QZ+PaNCcU/
         04mjjqkpQtV7lV/cHsA28mJ6qllUjD+NatiQt4CsuSldVwuFMjC6pPaY2jQOf5Kpe1t4
         Z7sTEJjkH+muo3OS2k+Cf/nTGCAGMopdnJZIyiU0zAUYz/D787xwDJO4ocyPZ2fauNV5
         4oXc3dTEGfwDzrnnyaFadkHzttPAswVdoGawZE55ueWwRHhKr21nn2eEZr5iA9Xcdhkc
         tDWg==
X-Forwarded-Encrypted: i=1; AJvYcCWDbeB8IfuI96FddhmHrS1Y3azjmCe+nzlhSXI0yzx3Nyvq46sh9FkYeh7mgiFgYEYOe6hQJhdgKpCV7hdUe8K7@lists.infradead.org
X-Gm-Message-State: AOJu0Yws7bQjoldP5DOhMufoxpHmkmSgW+OzkT7OuiF13imKCeYAyf/l
	7E9uGgs585CWvnMUkskYwDiYwIKzDH2d0nbGDMDRsDUvxNxiaMw3R1Ao
X-Gm-Gg: AZuq6aIUsuCz8AKKARlCuXYsQoDs337ksffO5+AexYTR99sTNZ3lOxu3siNpVtPJ3qn
	h6di0JR/mT6/yj2QsdAj1340ZLbSJFxLkbJd0pWmPSBXYMlE7VtL8d/S4U2UWhnLXjY/8L+0IuB
	ZqZDS/qSCuGuOG/nP+jr5UaqNemZUpicw1SBQzhegTkzQnwq7uqs8qztGd/ObpNfjbNW/yGoId1
	mQywS4UugSlcgIayXNctOJSZ25rA9eqH5bX2AIhuPidyuK8GQAIiICSbPFQSaKJfPPQbipP3Y6o
	4EnvUnVnddWkMJSn7YVa+hbzYtoDZh5L1t/g8EruHaotW4ay0TC3CFTIYJjh5/iYz+N0rZe3BMx
	3b0Xf1GMyWHJULYEAv5ZzvaQsFY4ip0YtC8d/Ndy6wE1t8oDfIIjohGC8Hz199msn0E2vPxPFnV
	NYCCWgm5wGhueEm7Mi7Npm6ECgeQle3EP0yL6NArYUJR91wKL1gINX
X-Received: by 2002:a05:600c:190d:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-482db452371mr173238135e9.5.1770060565481;
        Mon, 02 Feb 2026 11:29:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830511bfc6sm20203095e9.2.2026.02.02.11.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:29:25 -0800 (PST)
Date: Mon, 2 Feb 2026 19:29:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260202192923.0707e463@pumpkin>
In-Reply-To: <aYDFOIskB20CbztD@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_112927_981282_74604C7C 
X-CRM114-Status: GOOD (  31.95  )
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

On Mon, 2 Feb 2026 15:39:36 +0000
Will Deacon <will@kernel.org> wrote:

> On Fri, Jan 30, 2026 at 02:28:26PM +0100, Marco Elver wrote:
> > When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> > kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> > could see:
> > 
> > | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:976:2: note: spinlock acquired here
> > |      976 |         spin_lock(lock_ptr);
> > |          |         ^
> > | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:966:6: note: spinlock acquired here
> > |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > |          |      ^
> > |    2 warnings generated.
> > 
> > Where we have:
> > 
> > 	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> > 	..
> > 	void futex_q_lockptr_lock(struct futex_q *q)
> > 	{
> > 		spinlock_t *lock_ptr;
> > 
> > 		/*
> > 		 * See futex_unqueue() why lock_ptr can change.
> > 		 */
> > 		guard(rcu)();
> > 	retry:  
> > >>		lock_ptr = READ_ONCE(q->lock_ptr);  
> > 		spin_lock(lock_ptr);
> > 	...
> > 	}
> > 
> > At the time of the above report (prior to removal of the 'atomic' flag),
> > Clang Thread Safety Analysis's alias analysis resolved 'lock_ptr' to
> > 'atomic ?  __u.__val : q->lock_ptr' (now just '__u.__val'), and used
> > this as the identity of the context lock given it cannot "see through"
> > the inline assembly; however, we want 'q->lock_ptr' as the canonical
> > context lock.
> > 
> > While for code generation the compiler simplified to '__u.__val' for
> > pointers (8 byte case -> 'atomic' was set), TSA's analysis (a) happens
> > much earlier on the AST, and (b) would be the wrong deduction.
> > 
> > Now that we've gotten rid of the 'atomic' ternary comparison, we can
> > return '__u.__val' through a pointer that we initialize with '&x', but
> > then update via a pointer-to-pointer. When READ_ONCE()'ing a context
> > lock pointer, TSA's alias analysis does not invalidate the initial alias
> > when updated through the pointer-to-pointer, and we make it effectively
> > "see through" the __READ_ONCE().
> > 
> > Code generation is unchanged.
> > 
> > Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Tested-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v3:
> > * Use 'typeof(*__ret)'.
> > * Commit message.
> > 
> > v2:
> > * Rebase.
> > ---
> >  arch/arm64/include/asm/rwonce.h | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index 42c9e8429274..b7de74d4bf07 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -45,8 +45,12 @@
> >   */
> >  #define __READ_ONCE(x)							\
> >  ({									\
> > -	typeof(&(x)) __x = &(x);					\
> > -	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
> > +	auto __x = &(x);						\
> > +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> > +	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
> > +	auto __retp = &__ret;						\
> > +	union { typeof(*__ret) __val; char __c[1]; } __u;		\
> > +	*__retp = &__u.__val;						\
> >  	switch (sizeof(x)) {						\
> >  	case 1:								\
> >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> > @@ -71,7 +75,7 @@
> >  	default:							\
> >  		__u.__val = *(volatile typeof(*__x) *)__x;		\
> >  	}								\
> > -	__u.__val;							\
> > +	*__ret;								\
> >  })  
> 
> What does GCC do with this? :/

GCC currently doesn't see it, LTO is clang only.

	David

> 
> Will


