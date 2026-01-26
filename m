Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD56CF65DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAjYG+JlexRkGuXEPqUsDPk/vmWfkY8Y8l3nBpAyV6M=; b=16KSPPtebZkxIS9TuSQds1eNj2
	HDFPdxjChDuyDu7LvPDcwRYoVd/PQbyHY/OdBbof4lVeZc/NKtFgxlWyQb2zJrICOteuABIRMiWCu
	bU65nQ6PwsTcqSWM7uhxqWBC6JG6n1x+XEKyYiqpSnrdDcO0w9Z2AinczsEfALo7k72rfxAANRYvs
	68ZpZi0RH9yJOPKZgxsFW++5lT/vgO1As2SAIPlSsAE0vEoPxo/DMErS1zV1fQBmrzIlyDH/wZJjc
	81KoMHsTtbuZkwUHIGwDV15Qxm/8usJEM1nUoLvnS451AxRJWwQMoFcRcU2FBLYzPGv0jWsKHvQjx
	DXj9PtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKaP-0000000COZZ-2Hwh;
	Mon, 26 Jan 2026 11:16:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKaN-0000000COZE-1wRA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 11:16:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2410883f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 03:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769426205; x=1770031005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAjYG+JlexRkGuXEPqUsDPk/vmWfkY8Y8l3nBpAyV6M=;
        b=bZkINYHrctB0weD3GiIUmA3LR14Ztqo62xRW+58RDMqS8ktIYyehrhnPKpQWTzOeAL
         4bOmzY/Vz93QCDDtR+zYlIPvXeYzFRDToPIDAtE5/hVtK2t9Cl1v58eIbyeUr7Fk9bbe
         9AVVffcnTOpjv9qz0hnVakAtxuxN1qNfp7eM8dqvmL+EAu1lJbgqqguWWfi4wzqNH/HK
         30IR8LDUWgoY3i6mVmcFZTdxtR+DJORKgHhEdHXKVySjI/hRIeMUVsY1BHwT9pp5FgkI
         sJCcgFSRVZXDYG4PIrI2vsRt3omdZ6faoprfMLlbjSwH6luti3+DQ5GDytRbPm2oXj1g
         pItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426205; x=1770031005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAjYG+JlexRkGuXEPqUsDPk/vmWfkY8Y8l3nBpAyV6M=;
        b=iF17Jo73KtswKRy5teXpKIa74riWAZxb4r43KWompntW8CRNg4E6UKwT7KFm3cD1n3
         ZGtXeJXtRClj3h2jp2FZ9WgtPVG5KYcRHrD12bPougLRrKYHjIHELSD+DvAEiRvFgROQ
         q5VR3UBmuxK0sP3GHq6s+AHXrkUOgcXE9y6O8rQ7lbRYvSKzYEMZ6VSreomPdICo98lR
         /Wvej84DdUDvUjq0zk6R55YXaVlyuFzcbQ7Qk2WjqSxQ56e5VPA+GWLZ0mBQI5pRgNIB
         xwxZRB+0YPzVzzbV9rhHMMIs/SbBQQ45d+LR2oMnBpopwNcM3fbxIixOzBwH4D808xtF
         EKJg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7o8iOwTEczuo2cpRogxErcmEpTjHM/4hxIeGLFGtW+lRnaUWCvxM/L8U2fW1ngBtBO6FRcA2W9P80qwFSr9E@lists.infradead.org
X-Gm-Message-State: AOJu0YznWSVLR3+HdpFpA7tRdXppqvEj+VMKZ2ZFvyeTd4TQ36rasPFO
	xw/zqR5ynZ+oyCxsHRGc6umxNnDjTgCR4QfvHELowKWvhHdSmGHp0xG4
X-Gm-Gg: AZuq6aJAQWpvxkG9LZA+PM8mgmShEAV9Puv0S9Oze/PhSS59yAshPgOwz9XdOtUMUWo
	EfdFdg3KRGwPTqzu5847tzQRJlH7Yj9y0d0ltM7pkA3IDJV11YQfymgOszkwYtLlxnj0a0F++mQ
	gxuw4YbDOM15hWqYMxDP/su1Bph8gsOQ8+lXJg1KUQr4AIwtz4wDwR+44NY9IZZX6AuuTMl6mH2
	bKHTZrALPZ43yCmTex72HDext3TAhknbz87OIHgEPp/YA1rbIWqXI+a7toBYaat+HkDaXTVdd+w
	DPfHztp09y7Gn4oe1zyg0b1bF4CfcwoGFQS6wfT98+zDSwfkpVeSofrZkbIR+VagKXoaDmsc54s
	kKWCfhftHQaLoR//k5UP3fsq2IjEI6+B0AkikX+2jSwvx5u/Qd2LjvAvo4DkUBqTacz1RNIs1qy
	7JCLQ01tjNlZMk26flkzlM8lHFtqq0PktuVx30XfZhh1q3w4BReWkZ
X-Received: by 2002:a05:6000:184f:b0:431:16d:63d7 with SMTP id ffacd0b85a97d-435ca198c6bmr7095312f8f.47.1769426205212;
        Mon, 26 Jan 2026 03:16:45 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f744e2sm31432160f8f.31.2026.01.26.03.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:16:44 -0800 (PST)
Date: Mon, 26 Jan 2026 11:16:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260126111643.534c8274@pumpkin>
In-Reply-To: <20260126002936.2676435-3-elver@google.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_031647_561026_DB05CAE3 
X-CRM114-Status: GOOD (  27.29  )
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

On Mon, 26 Jan 2026 01:25:11 +0100
Marco Elver <elver@google.com> wrote:

> Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> 
> 1. Replace the _Generic-based __unqual_scalar_typeof() with the builtin
>    typeof_unqual(). This strips qualifiers from all types, not just
>    integer types, which is required to be able to assign (must be
>    non-const) to __u.__val in the non-atomic case (required for #2).
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

Does it even need to be a union?
I think (eg):
	TYPEOF_UNQUAL(*__x) __val;	\
	...
		: "=r" (*(__u32 *)&__val)	\
will have the same effect (might need an __force for sparse).

Also is the 'default' branch even needed?
READ_ONCE() rejects sizes other than 1, 2, 4 and 8.
A quick search only found one oversize read - for 'struct vcpu_runstate_info'
in arch/x86/kvm/xen.c
Requiring that code use a different define might make sense.

I also did some x86-64 build timings with compiletime_assert_rwonce_type()
commented out.
Expanding and compiling that check seems to add just over 1% to the
build time.
So anything to shrink that define is likely to be noticeable.

	David
	
> 
...
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/arm64/include/asm/rwonce.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..9963948f4b44 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -32,8 +32,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +55,9 @@
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


