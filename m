Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE4107BCCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1lelRKFJxXRBLVjsXJIfqPbatv27C9RsGd3yY01pM4=; b=3F+ep1BCt269s0RWU/AeCAYS7f
	lErQ6wbIDHjiBk2t0aaOHNkXKKe+CuktL+E6qZ0/EEkUtgbTwXCwZ3GvGvPXmPdKIOrdDMF/4SJEw
	c3UAlN/4CbZ5cdt0nSlcuDA0QBT0X5uDTTiaOpe6SMXWNnq1ojedDrjb76Ha73hoYlM5Wd71b4eBR
	PzUlRH/aFx3PwQYf62YC/hEOIib9YpC7kV3fm8lA6fOj6mzWN5IdRb5vnh9epqOlwMbOhiylsf8sz
	t/jP4IlocC/lUBI9NVOcVIp7/MypkpLuOUHwYin/g19u0DUNLxG0Y4GcxvqyZAVxqNWv6vsARhTA2
	5XMguU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15hC-00000000ggT-1CNo;
	Fri, 13 Mar 2026 16:49:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15h9-00000000gff-2Ont
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:49:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aea4ebb048so515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773420543; x=1774025343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1lelRKFJxXRBLVjsXJIfqPbatv27C9RsGd3yY01pM4=;
        b=YfQGA1Q0AMm5i5tIGa5vUQ5mBgUqY6HJRaVbJYjcNAqm1V8iUmbkFWGvDcTeApgDHf
         22wx2pWpyomhMmhTYDkIGQ+hXs2egn6H6l96Ui6Lwa8Dz+5lTYG64+SeNiV/kpc7LEku
         jAEaEBf8FZ6ajv67rp2Vzfhca9Dhgkh9D561f+TT4+6MVDxkgiyBTcgfjyXb1/7a8UUK
         zip/Aa8YRIfmz+N1bz6wCwvt2Oa1Seu2yK89QfvfdOG/r4uaIldwKZD7BhI/ZyKqeGAB
         R1dP8YkY7BAsTZmOKhYnl3M9XYZr0Zaj5CIWfAaRNcToBRgtsmdQxAPgKSbHThcpVr/2
         7rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420543; x=1774025343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1lelRKFJxXRBLVjsXJIfqPbatv27C9RsGd3yY01pM4=;
        b=GxNsoIRNkncEoLBZXHTsNfJ+L3nECzhOEMKqLoJRjcXCv55TJlEIkNxKuWau6MVRLL
         Nmayk3/TyIVlWXXpjLyz8EaCBMOe1zw2inVsIRsey3/T8exb00jVbVK7YsKf2vuPOapJ
         FM+ROZXGnAmEcRJ2wLyITiEFIu3DhKOjV2dQYQ+N1IlFSS2/9twivJOKbZI77/pa16J8
         UdrK8CuVqzroQfNRKQadElokQZUAT4qatgzgxtHdq9qazZmLsNFpstuosNaEl86qUvWE
         bBaWfwkQwTfxo2isTqV8NTc1dsTJtkGc1MsNtoxTzVQ56BvPg26rcyxy32csf3uabLRV
         lecg==
X-Gm-Message-State: AOJu0Yx/FQ9UPlnjBdr5vHYO+9Y5S3d7Oj88g0dba7ziWMgSouQNr+jw
	JaCs5GJ95TLQZQTHGsXGtSE2ru34/XBgMLdjRDP3kme6I/2Lwv47zOnbgCr692f19A==
X-Gm-Gg: ATEYQzwbpYaMHPylSrtPDYL6xKrFidOjeRqwT4HPMwGbiu0QJ2a50NGxBThS0iI0LAM
	DybQ7LrM5iuuAvs6zXpHKNaxpb6A62XNRweKgji6RdIUu16NZXa/WJX9wAIa35mL/pXKKwl52bx
	IwUWeH1sT4yafV31qlpbAgUJwDkX+0WrJs0pWv0yeY7grbkpijcsGowfLW/JYyhOuP1cS6z5o1B
	H/xro/ZPtmoTaD11oG5Xe9hXoKYysB6eeFHqbk4Z3ejseaj0ES3eNZAE4HVZWBj3ePchWRFxuDj
	FTpIDzsKEW8OauCT8jrXa/ehWVuKCNqmHx++kWq7xB3FSBx5FZibwtqbcY6xZYzIRo0LgxIIQ36
	iyCKR8DJPnfpBHPXQ6CApA/XKzqkZrSK3pQTGWeYKW9G1xhXw26LzLPWng9nyyvbwtHBMpOpNI3
	LtoQer00fJWb3rfNK427wnpqXBVFSr8WW5Rc0cIyd0GgsTN6h+wZ+ynEAXpYT5Jn4ueEA=
X-Received: by 2002:a17:902:e809:b0:2ae:4e8e:954e with SMTP id d9443c01a7336-2aecd55f847mr2514455ad.5.1773420542161;
        Fri, 13 Mar 2026 09:49:02 -0700 (PDT)
Received: from google.com (197.23.125.34.bc.googleusercontent.com. [34.125.23.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a22d21cf2sm1445876a91.2.2026.03.13.09.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:49:01 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:48:56 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will McVicker <willmcvicker@google.com>,
	Sean Christopherson <seanjc@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: implement support for static call trampolines
Message-ID: <20260313164856.GB213695@google.com>
References: <20260313061852.4025964-1-cmllamas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313061852.4025964-1-cmllamas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094903_623602_76FF0847 
X-CRM114-Status: GOOD (  29.33  )
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

On Fri, Mar 13, 2026 at 06:18:52AM +0000, Carlos Llamas wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Implement arm64 support for the 'unoptimized' static call variety, which
> routes all calls through a single trampoline that is patched to perform a
> tail call to the selected function.
> 
> Since static call targets may be located in modules loaded out of direct
> branching range, we need to use a ADRP/ADD pair to load the branch target
> into R16 and use a branch-to-register (BR) instruction to perform an
> indirect call. Unlike on x86, there is no pressing need on arm64 to avoid
> indirect calls at all cost, but hiding it from the compiler as is done
> here does have some benefits:
> - the literal is located in .rodata, which gives us the same robustness
>   advantage that code patching does;
> - no performance hit on CFI enabled Clang builds that decorate compiler
>   emitted indirect calls with branch target validity checks.
> 
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Does this need a Co-developed-by tag as well?

> ---
> v7:
>   - Took Ard's v3 patch (as it leaves the code patching logic out) and
>     rebased it on top  of mainline 7.0-rc3.
>   - Dropped the changes to arch/arm64/lib/insn.c and instead switched to
>     the (now) existing aarch64_insn_write_literal_u64().
>   - Added the RET0 trampoline define which points to the generic stub
>     __static_call_return0.
>   - Made the HAVE_STATIC_CALL conditional on CFI as suggested by Ard.
>   - Added .type and .size sections to the trampoline definition to
>     support ABI tools.
> 
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/static_call.h | 33 ++++++++++++++++++++++++++++
>  arch/arm64/kernel/Makefile           |  1 +
>  arch/arm64/kernel/static_call.c      | 20 +++++++++++++++++
>  arch/arm64/kernel/vmlinux.lds.S      |  1 +
>  5 files changed, 56 insertions(+)
>  create mode 100644 arch/arm64/include/asm/static_call.h
>  create mode 100644 arch/arm64/kernel/static_call.c
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 38dba5f7e4d2..9ea19b74b6c3 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -252,6 +252,7 @@ config ARM64
>  	select HAVE_RSEQ
>  	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
>  	select HAVE_STACKPROTECTOR
> +	select HAVE_STATIC_CALL if CFI
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> diff --git a/arch/arm64/include/asm/static_call.h b/arch/arm64/include/asm/static_call.h
> new file mode 100644
> index 000000000000..331580542fd4
> --- /dev/null
> +++ b/arch/arm64/include/asm/static_call.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_STATIC_CALL_H
> +#define _ASM_STATIC_CALL_H
> +
> +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)			    \
> +	asm("	.pushsection .static_call.text, \"ax\"			\n" \
> +	    "	.align	3						\n" \
> +	    "	.globl	" STATIC_CALL_TRAMP_STR(name) "			\n" \
> +	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
> +	    "	hint	34	/* BTI C */				\n" \

It doesn't really matter either way, but do we still support toolchains
that don't understand "bti c"?

Otherwise looks good to me, and definitely a much better way to solve
this issue:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

