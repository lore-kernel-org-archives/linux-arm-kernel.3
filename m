Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D73C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKcbM6IcBXpQkvDiwQ/2d8+zEon4okynGxi4dN1iduQ=; b=HhdpvZNH/T0+zAN29A7ze1JS74
	pbfknS0yNq7so3XifphtSaiRBxj8mVy2Krrolz/jC8+9xSqWgE9ehtULM5Mq8iIvmrVqPCLOC/djb
	sxZjmSW3MrZwz+9GXiPlhZrSFt9gH6yMJxQvtFKVSG7YXiGiW4/yLkgpLUGRRbv6hYtSAIHFrA+II
	78qzPu+CSLsFuZLNuZV3umTGDacfQW3kLo7gypjfFjliWzTVbA6AxB2kghnDfhakCYuvnCqMvnKPr
	9Ug86NNgoxQbqD8LjRAWCH7w1JUeASAK4tCdtdfaMSFSIK1ANiZUQAc3SvOlqVZdbegvTsxD2S40h
	zclKfgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidjK-0000000CBDT-3fNZ;
	Thu, 13 Feb 2025 18:14:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticrl-0000000Byxy-1pYz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52BF15C5888
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 17:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C8AC4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739467148;
	bh=zKcbM6IcBXpQkvDiwQ/2d8+zEon4okynGxi4dN1iduQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fYjavnAgjG2ALVhU3n41CpcFyEECQXYNjeAbD5x55o34caZF2OembTmslX/NXoYiH
	 zeAduvH//VNzZhkC5ViOZAzGblsV8fseHGzpZqg5tGl6vSyoSacECfunMG+uPJ1ojm
	 Rn8IWOszs8CFlovgEXbRHxcfPrU8qOZX9YkbJKZu8XojMcf8JBZzW113LNzWs6vfXw
	 59sInjBAvJhxqXcJ8ABZ+uXQJRFXl4o0pPFNiJpCo0mfQn5E9+NUfENidJEdN40tRv
	 E9PYhxdf8RGCGr20maLcIs6D345DXeHoqDUJwgsvediNEY6op0B7DmcjSeTtXgDvEP
	 VhnFPdu0wOJww==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-545054d78edso1101898e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:19:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUPuhT0G1w9N6l9gv7V0oc0ImGFNYJX19kuPasjkFKT2LfEN2+cWAoJYuvYxogiXrabhlJJAC1ShOJkbf80V1h@lists.infradead.org
X-Gm-Message-State: AOJu0YxQri7Zog+apFBY7vTMNgwOty4/fTlC+Zrib2qLjR8J+4ARPH09
	bcihDPWniOJOdmqKFfxqGyGVXhWidwtHuq83KXWxOuvRKihXO891QS/TjYCDMypUgz6Yg+pSERS
	uE/iSmqx2aPQMYJXapckvmq85yhI=
X-Google-Smtp-Source: AGHT+IFBveEmZsMEZsyrxXtWamogvgck+sW2aQvGnVbR5VQvH4/CMwg5fT2sHta2nfxtlArh3COkxd584to+rMNeWCs=
X-Received: by 2002:a05:6512:ba3:b0:545:cc2:accb with SMTP id
 2adb3069b0e04-5451811d29fmr2744992e87.28.1739467146599; Thu, 13 Feb 2025
 09:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org> <CAMj1kXHgjwHkLsJkM3H2pjEPXDvD80V+XhH_Gsjv8N4Cf6Bvkw@mail.gmail.com>
 <9430b26a-8b2b-4ad8-b6b0-402871f2a977@ralfj.de>
In-Reply-To: <9430b26a-8b2b-4ad8-b6b0-402871f2a977@ralfj.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Feb 2025 18:18:55 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHbXfDz96C3ZPyyXB_dSRyxbc4BP3qNN_oemG9T68eTsQ@mail.gmail.com>
X-Gm-Features: AWEUYZmMXwdsGWpyxIXpLuvhOOhu7SYkGwPGIA-pgYV0N-zrNn8_zzPI-Pd5f0o
Message-ID: <CAMj1kXHbXfDz96C3ZPyyXB_dSRyxbc4BP3qNN_oemG9T68eTsQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Ralf Jung <post@ralfj.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_091909_563216_A6B9ED39 
X-CRM114-Status: GOOD (  35.00  )
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

On Thu, 13 Feb 2025 at 16:46, Ralf Jung <post@ralfj.de> wrote:
>
> Hi all,
>
> > We have to carefully make the distinction here between codegen and ABI.
> >
> > The arm64 C code in the kernel is built with -mgeneral-regs-only
> > because FP/SIMD registers are not preserved/restored like GPRs, and so
> > they must be used only in carefully controlled circumstances, i.e., in
> > assembler code called under kernel_neon_begin()/kernel_neon_end()
> > [modulo some exceptions related to NEON intrinsics]
> >
> > This does not impact the ABI, which remains hard-float [this was the
> > only arm64 calling convention that existed until about a year ago].
> > Any function that takes or returns floats or doubles (or NEON
> > intrinsic types) is simply rejected by the compiler.
>
> That's how C works. It is not how Rust works. Rust does not reject using floats
> ever. Instead, Rust offers softfloat targets where you can still use floats, but
> it won't use float registers. Obviously, that needs to use a different ABI.
> As you said, aarch64 does not have an official softfloat ABI, but LLVM
> implements a de-facto softfloat ABI if you ask it to generate functions that
> take/return float types while disabling the relevant target features. (Maybe
> LLVM should just refuse to generate such code, and then Rust may have ended up
> with a different design. But now this would all be quite tricky to change.)
>
> > Changing this to softfloat for Rust modifies this calling convention,
> > i.e., it will result in floats and doubles being accepted as function
> > parameters and return values, but there is no code in the kernel that
> > actually supports/implements that.
>
> As explained above, f32/f64 were already accepted as function parameters and
> return values in Rust code before this change. So this patch does not change
> anything here. (In fact, the ABI used for these functions should be exactly the
> same before and after this patch.)
>

OK, so can I summarize the above as

- Rust calling Rust will work fine and happily use float types without
using FP/SIMD registers in codegen;
- Rust calling C or C calling Rust will not support float or double
arguments or return values due to the restrictions imposed by the C
compiler.

?

> > Also, it should be clarified
> > whether using a softfloat ABI permits the compiler to use FP/SIMD
> > registers in codegen. We might still need -Ctarget-feature="-neon"
> > here afaict.
>
> Rust's softfloat targets do not use FP/SIMD registers by default. Ideally these
> targets allow selectively using FP/SIMD registers within certain functions; for
> aarch64, this is not properly supported by LLVM and therefore Rust.
>

I read this as 'this default behavior might change in the future', and
so -Ctarget-feature="-neon" should be added even if it is redundant at
this point in time.

> > Ideally, we'd have a target/target-feature combo that makes this more
> > explicit: no FP/SIMD codegen at all, without affecting the ABI,
> > therefore making float/double types in function prototypes illegal.
> > AIUI, this change does something different.
>
> Having targets without float support would be a significant departure from past
> language decisions in Rust -- that doesn't mean it's impossible, but it would
> require a non-trivial effort (starting with an RFC to lay down the motivation
> and design).
>

Fair enough. The codegen is all that matters, and there are other
cases (e.g., spilling) where the compiler may decide to use FP/SIMD
registers without any floats or doubles in sight. In fact, there are
swaths of non-performance critical floating point code in the AMDGPU
driver where it would be useful to have float/double support using
softfloat codegen too.

