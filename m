Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F5FD358F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN9ZJ2CDowvxIQYtuX8i4e7sp+a9+p0zkDa4YiBDAsQ=; b=UW2RJ7Q+8a3PnTtG2S5KVOLEDn
	e4ovj+XlvnUHZUCpg16fVAxDdEklp4eiVlLyQocM3w8cG7TlqamES3jjTGAIbugccF/WGRSZYwsTr
	L4SmVnVpcVfUUhmGj1/vqmGsALaUZ5R2SPtr/EXDHhcnlsxJ8mRlr8zyrZsRpLkmjL3t7Mg24jNLv
	6C9u9qJ/ivrJm3smy7sEeuE9buQRhO5JsQhPgxJ5oRgWonvch6jeIi1F1vXGqOx+KUJ9FFDkrI/9s
	D9T9DzRR8xDthRwOMR3278WYtHZ55GQ8WEEFoB6xtZfmFc3AOhYSgX9s00jI/ngd/nCb+Ed7RZ6I4
	tgQc+O5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOsF-0000000HYNd-097W;
	Thu, 29 Jan 2026 10:03:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOsC-0000000HYNI-3KKm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 10:03:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so8084035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681015; x=1770285815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN9ZJ2CDowvxIQYtuX8i4e7sp+a9+p0zkDa4YiBDAsQ=;
        b=I2L7j7Rr0NsdCYcCokObM1QTaf1Fmv3jU5B6h8GsVtrWrtbvH+SSVj8FgChmfYKnsa
         3GbKnImSdQR6eJPT68heVL0GqFMMr5C6YJdUYjR6CHpzzhTflZBYYDLMgTxM++Pdi4Sr
         +WbreXsBYx0/og1jdpdFNjdeEI8L7CiLjEd6WLklbE8x5roBgZ8WsSvBgNLNXVRYAee0
         HDpFxgqjzZyiz2joQ6dn5Pfu+JuJ/IP4NFZkM+i4nVRPGduJVr9f2Cy+NxmP/C222gkW
         WbbxNIGUaUtA5e2zDudNHs7CaPkCh2mOVwrAsRzWtiSTkX4OjAA+CUsTqDoGDd72MJEg
         JkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681015; x=1770285815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TN9ZJ2CDowvxIQYtuX8i4e7sp+a9+p0zkDa4YiBDAsQ=;
        b=ftXxP7rxFFQozm9G6UKGx1oCkqJ8wpnT4TkxIQORlDSzYuwaItQF2QhgF1K9svDN47
         Od8GLk3N4hA8oMD7yRyunR0T40nW/v+Y2TFYT9d9SX2dYaRlf9BrARGT5Wg5JOGXKbC8
         2l3vC2ZrMjoStVPlbI0uuvxoznjCCiaM5Hnkyb6OCfPfr69e6jp9JibvRU6peJ3GzKL6
         wFNhkGn6usgGNS0JQBGvHdCKJMxGANtrlhxRTcIS53w9/8WkpgZdZbhopyt9mZdxnDYq
         DBOnNkcXdO4+cKvwyWMZIfHYfq/3gHtjNXk1U9VpGPYf+Swp4SQ1RbEliPQtHA5QczXY
         GUXg==
X-Forwarded-Encrypted: i=1; AJvYcCWWSciZf1JpulVXPPw9uNVeev87CaBF+XUDVANErb/vHQwkBtbzIsPhgquuumPwsEwgtwgiI+lGDNJRwjgH0FZl@lists.infradead.org
X-Gm-Message-State: AOJu0YwVEVaKd7Ko/YEOLVeCTpqLRFCwmrUszNshLbNm6qvX99dNojts
	oQJ6Pw+lCRRnNndG33MNxYHYkkNi5rMEFz4HulrVCYJyNEeJQmTxnHjo
X-Gm-Gg: AZuq6aKhUciwtasEofnZZ8D9DsSaGhyX+tSGZn32gExiJYMeKGOO/8eJQiLjyqqOv7w
	DGkzZT+KzlHIZotqEgKePm9ApZ4GyuEfS259urQYHOmer5zyOTWUu3bL1HgE6OdGXfeGrkELh7M
	xYIdGQr/evWcsc7PLgf78eePVScNc4QHlSPA/jwxXncKwM7Zq0KjdWpwmHqAZd8iWgdXcX733Q0
	+Xl4IEj589U7mzfdlqJiMOHGMog0TEC1WhuxNICPPbyI05bRpFweQalcmjfZS+1diRmtrCtXFGV
	43wVgiifM739oEzn+kH9IGjwYEpHurVkyT7v3RDZLCl4/5LCeFtr+B6DKOX8xRa3jJJkhT0ND+1
	0Qt7m57CgABkGaCfr5Ebbrb72mMQcxwYCDTHn+fr9BLfkJ3rkdUnC/4Rx5MF5jT/cs4STV5coT4
	ZyDdeHOAY62zODK5CU8rAwG6oYe0JkzWhYGrNB4gEHrYKfkih8wlwq
X-Received: by 2002:a05:600c:1385:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-48069c66fd7mr94238255e9.26.1769681014646;
        Thu, 29 Jan 2026 02:03:34 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb59asm174245575e9.7.2026.01.29.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:03:34 -0800 (PST)
Date: Thu, 29 Jan 2026 10:03:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260129100332.500248d3@pumpkin>
In-Reply-To: <20260129005645.747680-3-elver@google.com>
References: <20260129005645.747680-1-elver@google.com>
	<20260129005645.747680-3-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_020336_869161_6A59116A 
X-CRM114-Status: GOOD (  29.81  )
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

On Thu, 29 Jan 2026 01:52:33 +0100
Marco Elver <elver@google.com> wrote:

> Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> 
> 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
>    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
>    just integer types, which is required to be able to assign (must be
>    non-const) to __u.__val in the non-atomic case (required for #2).
> 
> Once our minimum compiler versions are bumped, this just becomes
> TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> 
> One subtle point here is that non-integer types of __val could be const
> or volatile within the union with the old __unqual_scalar_typeof(), if
> the passed variable is const or volatile. This would then result in a
> forced load from the stack if __u.__val is volatile; in the case of
> const, it does look odd if the underlying storage changes, but the
> compiler is told said member is "const" -- it smells like UB.
> 
> 2. Eliminate the atomic flag and ternary conditional expression. Move
>    the fallback volatile load into the default case of the switch,
>    ensuring __u is unconditionally initialized across all paths.
>    The statement expression now unconditionally returns __u.__val.
> 
...
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v2:
> * Add __rwonce_typeof_unqual() as fallback for old compilers.
> ---
>  arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..712de3238f9a 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -19,6 +19,23 @@
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
>  
> +#ifdef USE_TYPEOF_UNQUAL
> +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> +#else
> +/*
> + * Fallback for older compilers to infer an unqualified type.
> + *
> + * Uses the fact that auto is supposed to drop qualifiers. Unlike

Maybe:
	In all versions of clang 'auto' correctly drops qualifiers.
A reminder in here that this is clang only might also clarify things.

> + * typeof_unqual(), the type must be complete (defines an unevaluated local
> + * variable); this must trivially hold because __READ_ONCE() returns a value.

Not sure that is needed.

> + *
> + * Another caveat is that because of array-to-pointer decay, an array is
> + * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
> + * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.

gcc < 11.0 stops it being used elsewhere.
Something shorter?
	The arrary-to-pointer decay doesn't matter here.

  David

> + */
> +#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
> +#endif
> +
>  /*
>   * When building with LTO, there is an increased risk of the compiler
>   * converting an address dependency headed by a READ_ONCE() invocation
> @@ -32,8 +49,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +72,9 @@
>  			: "Q" (*__x) : "memory");			\
>  		break;							\
>  	default:							\
> -		atomic = 0;						\
> +		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
> +	__u.__val;							\
>  })
>  
>  #endif	/* !BUILD_VDSO */


