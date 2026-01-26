Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017BAD19520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 22:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IjqB7GheMfendzLAj5XKvDdIe71cAYrEVZFcl0Ddts=; b=z7CmR61MpT6UY7aVBLK4w6KzI6
	p6s6ixx8Qiupsfv4wEd5svXbqIcn0YEgN1IPNzwD1HfRRIHYquVCPXGTx4pLaLvwX5begkAsrCOmG
	6DFpSv8QKRnl0D6YRBLy7P62HRONEFDsskTrZfkSngZ8YHdfacc7vXVUEwezhXcEraS4H12wGfd2P
	1Asq3+JbRsp2hF+mQdyyEaYP5cbPp8EyOoBZxfKnJGoKrvt6Sb7tB5kkHy+JIhhskLeuYd4x3Haqh
	Oc4RcyP/bRdRWXWBSwNytMFi33G9EsClYX5yXovsTcJ4wepZngA1BMBt9SFk+YTPp49NVniYfftKq
	ilLFHaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkVV0-0000000DKU4-1zf1;
	Mon, 26 Jan 2026 22:55:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkVUx-0000000DKTi-46Lw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 22:55:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-432d256c2e6so4801212f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769468154; x=1770072954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IjqB7GheMfendzLAj5XKvDdIe71cAYrEVZFcl0Ddts=;
        b=f19Opo2Ey5cdbAc35HpgXh7+B4hAJ+oCI7s88TftE25IbqeDTpFP1WqeH1SFoOpeO2
         6AOO1LBaQQT5NOmYTqY4oLVpAf8fFdTsonY14EbWKuhVdeB/aSujAs+28cN17CWqLoFt
         Qi6z8f3JHQZnknhVKz/2X8P4ZyRSlu32N/sIsQ6sjDMEClkptSxHMv4plik1ZTs2m/CJ
         eD2BaJrr7pjZ3ouuvvE2T/5sqbMNCtocUOU33tRTp46a8ywrvo8HxbErZsPzzWmH4AXN
         myQE1tTi8agSox7/gfsM0p9MpyT2omphCF+ikcKzXyAesZsgteziTdoDNd/cHfP2pj++
         1OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769468154; x=1770072954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4IjqB7GheMfendzLAj5XKvDdIe71cAYrEVZFcl0Ddts=;
        b=EQaCYO8qZ7sq84is8NU88Uo7BJgrYqREykb7bmlRI+iro1rJQSOzVb1rQXMphuOLBV
         kwRXhJvNLIVmNFa65f/NG8o2GBPDzmhnCtO3pXxQryw2+inHlSJB0tRqpZ5Gnuhf44H+
         iQhVJrB/NII5BNzAOXFVgySabRE7Cycr0lVDcrVFMpQ4YkF4sljw4cMUdr7qdA4WqrDR
         e240Ylg+sW/XdA5XTzy7doruEiTCrQYdrgHqsWFbQK/Ukb+g+0h0PHLOGrtYx6wXNEPz
         isgHIjd7xPUnxl+i4A0SLOWj2k6Fy7dmBMbudWuC21syulakH15xKjqcTOQvbf3WqooX
         IA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzGdp69q6rzIeFQ9RHhMd21JAIGfpEVNNgfoQutSqfhPRd+K0dZLP0Da1QkXCRwyLcpuqN0foDHTkKXJYUuA5N@lists.infradead.org
X-Gm-Message-State: AOJu0YxGvoGwnTcLFbTz+zk3QtThM8k0ABgtAX6nC9/h0RwFDF+LCi5/
	NBdHyE3p0b4l7O07jbxuVxOVyYQCAe70BagYcLvST5DdFnQZU+TvMULc
X-Gm-Gg: AZuq6aIeVaT6IOmYYLdvQvpQKhTlZNYxKCk7EM8acDMI1fSsZgo/H0+LO306UKH53YR
	y8vUUJa1/5374XQ+BHvUe+KQzDMXfrjUXiMpZav+gK+REd+BWI1OvGM5gnQFAEaRBX1e+RQCw0Y
	Jxhf1EUqjkmfDgq5Vj00kiXaNpZ2CfwMg1VHFdgZhd9j0rZ0UFDFItxzxHEQjoi9Bx/1PpBMpd0
	vvPrbIg3Y2kFZGuRp9znBCWG0hiQ2GvkXd2ZuaOY8P6wEzYEzU63f4FVW9oujVaJx9AsOWQIsky
	hPc9I2ip7wEUir+XFA50+NUsWL/PMYxyO8tRyqiqDyAEHH0mtXaG4fqEyXG6PEnhR/rxI2ghfyA
	xDKSxhF0BP7Xq2pyuZEpvxakIwbfKOtBGJ98hBZJSV2U8EH6zjLGOacdtV0JeKzAriavZz1KLJG
	0ndICHcZwj2EPyvakkofpAsdSP5Qjy3SQqoSciPLytlI3NAS5UQqp4
X-Received: by 2002:a05:6000:2483:b0:430:fd0f:28fe with SMTP id ffacd0b85a97d-435ca1ac717mr8971008f8f.31.1769468153426;
        Mon, 26 Jan 2026 14:55:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02c91sm33226100f8f.9.2026.01.26.14.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:55:53 -0800 (PST)
Date: Mon, 26 Jan 2026 22:55:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260126225546.30d96049@pumpkin>
In-Reply-To: <aXfGcIpeXQNRUI-A@elver.google.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
	<aXfGcIpeXQNRUI-A@elver.google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_145556_059610_8C414D14 
X-CRM114-Status: GOOD (  33.62  )
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

On Mon, 26 Jan 2026 20:54:24 +0100
Marco Elver <elver@google.com> wrote:

> On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> > On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:  
> > > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > > index fc0fb42b0b64..9963948f4b44 100644
> > > --- a/arch/arm64/include/asm/rwonce.h
> > > +++ b/arch/arm64/include/asm/rwonce.h
> > > @@ -32,8 +32,7 @@
> > >  #define __READ_ONCE(x)							\
> > >  ({									\
> > >  	typeof(&(x)) __x = &(x);					\
> > > -	int atomic = 1;							\
> > > -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> > > +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> > >  	switch (sizeof(x)) {						\
> > >  	case 1:								\
> > >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\  
> > 
> > How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> > 
> > As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> > on gcc-13, clang-18 and earlier, and not strip out qualifiers.  
> 
> I think we only need to worry about Clang for LTO builds. But yeah, our
> minimum supported Clang is 15, so between 15-18 it'd be broken.
> 
> > With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> > __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> > to do the right thing already.  
> 
> It'd still be broken for Clang 15-18, so it won't help much. We need
> this to work for more than "scalar", so even though it'll work for Clang
> 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> _Generic-based __unqual_scalar_typeof() sooner than later.
> 
> I was able to make this work for older compilers:
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 85b1dd7b0274..d6c808cc01be 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -19,6 +19,18 @@
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
>  
> +#ifdef USE_TYPEOF_UNQUAL
> +#define __read_once_typeof(x) TYPEOF_UNQUAL(x)
> +#else
> +/*
> + * Fallback for older compilers to infer an unqualified type, using the fact
> + * that __auto_type is supposed to drop qualifiers. Unlike typeof_unqual(), the
> + * type must be complete (defines an unevaluated local variable). This must
> + * already be guaranteed because sizeof(x) is used in the __READ_ONCE macro.
> + */
> +#define __read_once_typeof(x) typeof(({ __auto_type ____t = (x); ____t; }))

Did you try old versions of gcc?
gcc before 11.0 don't drop qualifiers.

Even const int y=0; __auto_type x = +y; generates a 'const' x (same for - and ~).
You need to do '0+y' to lose the const.
None of them help here because you don't want the integer promotion.

Can you use:
	union { u8 u8v, u16, u16v, u32 u32v, u64 u64v } u;
Then get the asm to write to the correct sized u.unn, then finish with:
	*(typeof(*x))&u;
or does that spill to stack for 'ptr to volatile'?

It doesn't solve the problem for other sized items, but I'm not sure
how many there really are.
If a handful changing them to READ_BIG_STRUCT_ONCE() shouldn't be a
real problem.

	David

> +#endif
> +
>  /*
>   * When building with LTO, there is an increased risk of the compiler
>   * converting an address dependency headed by a READ_ONCE() invocation
> @@ -32,8 +44,8 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	auto __x = &(x);						\
> -	auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;	\
> -	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> +	auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret;	\
> +	union { __read_once_typeof(*__x) __val; char __c[1]; } __u;	\
>  	*__retp = &__u.__val;						\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
> 
> 
> Thoughts?
> 


