Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3C5CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kIgVWmhnz/iJ0v6Q3OFmOnjzUGJ6UKQTI7kO0aeHu0s=; b=jJvYJ4M9L9flIb6XvQHa82JXtw
	v62P2MwgFfuF/hvoGxe5jA/s3bn/8j110Z2dUuk/8VtBStNZFU4kdEMCgnZ/T3d+iZm8dI+ccrCYQ
	4gdlno42E2e1+ZBx6/Zb26gff6Qj8EjHEUb06d0T1+hfE7sNgzI911KZQPb3G6nfqgQ4Hq5wju/BZ
	hKMxLHHvpxsnLx/sBtRbDtPEt8JSn0fpjy0Dvj2uTEFq2aSkpymsyVIsB5SyNjP3+gNWpI1MhKi/1
	/sJlnbgA7UtRyjANHNBzK+CKjpGzAL12wjcZ/FH3kN03+ScMlB0oQ1FZPquawo6Fp9eJFR4ru6KmP
	VajYHZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2sE-0000000FvYB-1CG4;
	Thu, 06 Nov 2025 16:30:10 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2sA-0000000FvXS-0XbX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:30:08 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so1374863b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1762446605; x=1763051405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIgVWmhnz/iJ0v6Q3OFmOnjzUGJ6UKQTI7kO0aeHu0s=;
        b=Skg6uxBLMyp7qTCQ8eCGhY89r0oMopVVV99LeoMKW8jcQv2F7n8mciABD5homCZjFT
         G0+r5cF8H71SeInp8+IMJGVJK/5lkK0E2qBqeyPOTete3eB+uRyClpN40Gxyc2duyi99
         Ii1B+vRxFu3XNGVsySvFmazxzf0eDGb3MsCGTvUVXoBJxagNohPQd3Hop7MC3Tfy1nHL
         hrSq9UQDiVh/sUiim9q+wZIaezCrKBhUhGj8RZJvM1o43IInn7ZEtFPARnc7ydUrDnf8
         DrA1FnX986G1d2/wEgFiGiTKBeVJWdqGJ6NUIrEBOjLTCAyh6ziq953xZpSezT9uYSvz
         eoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446605; x=1763051405;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIgVWmhnz/iJ0v6Q3OFmOnjzUGJ6UKQTI7kO0aeHu0s=;
        b=CrA2/fxGZ4KhTPRa70pBhgWtKkxAurrNcEVSuZ5ERnoJfm5YWvDNbb61cQ1lOY0tm/
         3HQFb8nI2z9kdz32pcWhOPWbKpfiMGI4hSxprEKH7PPzOaR6XRKOJdG1PnZ4Qpqy70fA
         ELI1u1ZfWyzEgod5bVSPerQ2kLPy1wJLIYbFoEiZtb3cLoJe5IWzaYCMmFTPAm9WmjLx
         GE7gHEYgthoWPfl7Y+esn8eelUeMQ8JJD6IvD/ANWVwjCJXiTZD02xxqYP3LAGoyhfZ0
         LBvdJAAHUq4jhT4HZE10VD1yXGhbLq08kBmPywoG2jKOPH/6e0uOeHWGs2AdJbt3yddG
         9jHw==
X-Gm-Message-State: AOJu0YwO3UlLUHDxw0cjUWavuTmGZDzouSLBMf7BuyTw0FBP73IItOPz
	IkEyiAGpkWDGDh601ck/QT3RtGTU2aHDf+7DlVcBtVzSB0Fnh7BlO2tf9hJbl1iOVWw8DMHB4JB
	frMLC
X-Gm-Gg: ASbGnctQZPec8QuaK74TGwu8a5YB65JaBo5/hUCSQ1DHVMTtnu/qybLG6ryxFhk9U6x
	coEvg9GLYuRcjbk4is06jjzcucchGUkT+QjKihqfEVdadCm03fCm2tVp2PoxgarRZOGx//gMNsY
	R8h2kKn8gNHznuDy1INnIpUOy/4UWeQqTPRPOrWx3DGoyosXAzV0RHV1oMHLcCyJ6bTym0CaJUR
	KKV5v8xUOXQs5cPNkcddqHiw66Bb4vCuWDAet086VVVf7Zz+/953rCUUkPatmBj8vtvgBHbPXMt
	I6GeNIDFVCy20DRDyQ16Oo4v06k3vSAb4fDwpTVP8zW0FqIlF453eC3ptmQogKr/VV05ZUHYLsX
	Lc52O8AW92IG1zYTgMVxHv9yPTf7N47QRjY7E57At2nHGUsywoqVG5LO1KpS4EyclM5BegdvaB3
	Fya8X7od6KtIz+ab9c4vaQKlHb78W+LCK1kyXJtGI/
X-Google-Smtp-Source: AGHT+IFWkHvUNiMzKBSKKfW22mg7WS5j3SyZIeTJ/6rtWLhDVvrnlGnsDkW9askgiBaT7VX/H3/xkg==
X-Received: by 2002:a05:6a00:84a:b0:7a2:7c25:1f38 with SMTP id d2e1a72fcca58-7b0bbb0acb0mr259645b3a.13.1762446604707;
        Thu, 06 Nov 2025 08:30:04 -0800 (PST)
Received: from localhost ([2620:10d:c090:500::5:5f62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af827f4c06sm3233005b3a.61.2025.11.06.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:30:04 -0800 (PST)
Date: Thu, 06 Nov 2025 08:30:04 -0800 (PST)
X-Google-Original-Date: Thu, 06 Nov 2025 08:26:51 PST (-0800)
Subject: Re: [PATCH] arm64: Use load LSE atomics for the non-return per-CPU atomic operations
In-Reply-To: <20251106155213.3186582-1-catalin.marinas@arm.com>
CC: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
  paulmck@kernel.org, leitao@debian.org, w@1wt.eu, Mark Rutland <mark.rutland@arm.com>,
  yangyccccc@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <mhng-AD12A7BE-1C2B-4C0A-BAAE-50EE6C518F10@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083006_408134_DA469F31 
X-CRM114-Status: GOOD (  23.28  )
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

On Thu, 06 Nov 2025 07:52:13 PST (-0800), Catalin Marinas wrote:
> The non-return per-CPU this_cpu_*() atomic operations are implemented as
> STADD/STCLR/STSET when FEAT_LSE is available. On many microarchitecture
> implementations, these instructions tend to be executed "far" in the
> interconnect or memory subsystem (unless the data is already in the L1
> cache). This is in general more efficient when there is contention as it
> avoids bouncing cache lines between CPUs. The load atomics (e.g. LDADD
> without XZR as destination), OTOH, tend to be executed "near" with the
> data loaded into the L1 cache.
>
> STADD executed back to back as in srcu_read_{lock,unlock}*() incur an
> additional overhead due to the default posting behaviour on several CPU
> implementations. Since the per-CPU atomics are unlikely to be used
> concurrently on the same memory location, encourage the hardware to to
> execute them "near" by issuing load atomics - LDADD/LDCLR/LDSET - with
> the destination register unused (but not XZR).
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Link: https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Tested-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Will Deacon <will@kernel.org>

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>

> ---
>  arch/arm64/include/asm/percpu.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 9abcc8ef3087..d4dff4b0cf50 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -77,7 +77,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
>  	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], %[ptr]\n"		\
>  	"	cbnz	%w[loop], 1b",					\
>  	/* LSE atomics */						\
> -		#op_lse "\t%" #w "[val], %[ptr]\n"			\
> +		#op_lse "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
>  		__nops(3))						\
>  	: [loop] "=&r" (loop), [tmp] "=&r" (tmp),			\
>  	  [ptr] "+Q"(*(u##sz *)ptr)					\
> @@ -124,9 +124,9 @@ PERCPU_RW_OPS(8)
>  PERCPU_RW_OPS(16)
>  PERCPU_RW_OPS(32)
>  PERCPU_RW_OPS(64)
> -PERCPU_OP(add, add, stadd)
> -PERCPU_OP(andnot, bic, stclr)
> -PERCPU_OP(or, orr, stset)
> +PERCPU_OP(add, add, ldadd)
> +PERCPU_OP(andnot, bic, ldclr)
> +PERCPU_OP(or, orr, ldset)
>  PERCPU_RET_OP(add, add, ldadd)
>
>  #undef PERCPU_RW_OPS

