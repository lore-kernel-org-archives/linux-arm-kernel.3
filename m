Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC95EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=; b=HCBv/rjlbQA53Q/VsvUxIgXkr6
	g7Xux1RtkUBiZ7NZVtBXmJoycbNQ3v8YlUaag3BjfuiDruumBX89GmCx+mQs8HHdRUfRkXH/y0oLm
	6zcZR0qrvLRXFYNYeCVdswNN9YXMqCzjSNE0Q5d+thAq33OTkfn6z+dkw55TNrMyMSVVn/Aq9ZXf0
	aUINss68snYEy8cxEQeviRNjEcWHRaYJvZGT3JhpYqX8byNUOz3oF3/fwQXs3PoX0fevs19qUF9qM
	OksyiYkzVeM4IJP56Vx5K5aXwVZTtYOcXsxPNtyTvruqwGrTeJGZSluz8FFhrGK0FoOMyxUtx5Mts
	CBbNYa3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2myp-00000009gfw-0GS8;
	Thu, 10 Apr 2025 08:09:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mVx-00000009bNt-14L0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 07:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=; b=ApWuyDz4YxADyU3gHgpyiiK/hK
	PLa96vObRlLYr/Kwvny5vDsq7HTn27npWPdevxHEXTa623POzpbV3wFjjp6YGQ0bHZjQ+dDYJ12+T
	YBzQXtUCdD2++MYRQlJmTKMhLAi4cv92j8VNXaRfzB4Ufo1hd4QtwkHyD0BXsBrGphC/XsqGigLfK
	FbZyCxnfMkUbhqnyFSgL2spcOTSKXbdHgt7lVZ8gOur1QG9/Ih1EySyPEWEdl0UgschlbWvKsxAOS
	EIq0d6eTXF+fD5bIIvRawPv7a7BEV0Fq4Bwpv6rKlDgf51x4gqlJRwpkinEIbh9NuYXHXrfBMaiPZ
	3imj2BVA==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2mVu-00000008lwx-0QdU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:39:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso3745975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744270791; x=1744875591; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=;
        b=Pz1Cyl2adeytiLqyBJwfnwOHRkDpLq7+M1n51lys7cmrmUQssP9fb5Mw7tECHCEIlm
         pWJg5ZzeImLwOk+Vr8kh0AKHjAY5EbUMNhSd2KShWi9lu3M7yLJ6jKBNSYXAQ0Zu9GZT
         QjOWS7wDCUBSRlnu6/9SDPwPS1K26Lc0SIohDulELRgsUpHwmvUfCBKmt3bJvOfBOK01
         eaoAruAWhIFAQLGghmnZDq2cGx/5h4QOpuOyDadXx8tzDKC0HuUK1GFLSeNqrLIM0+VD
         W7fNLb08ZiKT9RtP4Z2JJPO+Nqs3NPJsYZfPZHIP0pnEIjSAlCgMCtKcHxChTSYLaj8L
         z1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270791; x=1744875591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7iRFA3oNaQCwmL6cxtFdZ1cbJzfUU/GeSk9zwV0n3w=;
        b=Vx3BprTa3ldFczHplxautty9iESSS0Fd0NFBT/tWn59/TFWyhT7QEy4yQUnn7vvDf5
         7opBOHD4uyP4cSs6PSW6LaJiOU6S4+6QNz3C/tvjjATx8jnZyCg0CdEP2T9YJHrfneVn
         c1dtQBO/Kcs1exzTlQuRknPDyWwqW/2ZIqNSxKPjCZqtNUlbJRKcmBKXivCPgLjQfc2O
         aYDiMGp3DZxLJeqTLiHHhWA4SM5fbX3OqKBEgOst8wXZKacU/+mkMIHIRemLFyNHLDHQ
         4r0w+5fi8EfyEcBpiExlF3tO2x5WBafI8HmMb9YKzYjKd66xewaMFfq3WqSN9dCfoJmL
         jrVw==
X-Forwarded-Encrypted: i=1; AJvYcCVDk3QiPEkLSMO9wJoyrWc6uAjvlSERvpYXasXYY32tPydbbrNhsCoehRPgTVJsuQVoJtrNrgi4bkLW5J0uOSSQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNRLXgY3cTwlX4FZWMriZWm6dlcNDv1PXc0ecnKvwxGTj/nmhc
	6+uiyXF9uSqrlPVFsTDgTkYzHZbujfNO15DX4PM6rcQYuA0f7hOpujsbj/MOknh1NgJPb18Jomp
	aT0/u2/10QhGzdg==
X-Google-Smtp-Source: AGHT+IHlkpBGJEWBW3cHYQJGmG67relPMhD9NvzbuRhqbRBizGar1eZ7vJOB4Vl1S32BZGUFqnryZcgjcRbEP1Q=
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:43c:ef7b:ffac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0b:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43f2d97d4c7mr15493055e9.29.1744270790968;
 Thu, 10 Apr 2025 00:39:50 -0700 (PDT)
Date: Thu, 10 Apr 2025 07:39:48 +0000
In-Reply-To: <20250409065802.136971-5-fujita.tomonori@gmail.com>
Mime-Version: 1.0
References: <20250409065802.136971-1-fujita.tomonori@gmail.com> <20250409065802.136971-5-fujita.tomonori@gmail.com>
Message-ID: <Z_d1xAAptnfzqg1l@google.com>
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_083954_348726_A86371CB 
X-CRM114-Status: GOOD (  27.88  )
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

On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
> 
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
> 
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
> 
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. It's
> used for only architectures that use objtool.
> 
> For now, Loongarch and arm32 just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/Makefile                                 |   8 ++
>  rust/helpers/bug.c                            |   5 +
>  rust/kernel/.gitignore                        |   2 +
>  rust/kernel/bug.rs                            | 114 ++++++++++++++++++
>  rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
>  rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
>  rust/kernel/lib.rs                            |   1 +
>  7 files changed, 144 insertions(+)
>  create mode 100644 rust/kernel/bug.rs
>  create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
>  create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index fa0eea8a9eca..25f498607d1b 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -34,6 +34,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
>  
>  always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
> +ifndef CONFIG_UML
> +always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
> +endif
>  
>  # Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
> @@ -536,5 +539,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
>  ifdef CONFIG_JUMP_LABEL
>  $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
>  endif
> +ifndef CONFIG_UML
> +ifdef CONFIG_BUG
> +$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
> +endif
> +endif
>  
>  endif # CONFIG_RUST
> diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
> index e2d13babc737..a62c96f507d1 100644
> --- a/rust/helpers/bug.c
> +++ b/rust/helpers/bug.c
> @@ -6,3 +6,8 @@ __noreturn void rust_helper_BUG(void)
>  {
>  	BUG();
>  }
> +
> +bool rust_helper_WARN_ON(bool cond)
> +{
> +	return WARN_ON(cond);
> +}
> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> index 6ba39a178f30..f636ad95aaf3 100644
> --- a/rust/kernel/.gitignore
> +++ b/rust/kernel/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  /generated_arch_static_branch_asm.rs
> +/generated_arch_warn_asm.rs
> +/generated_arch_reachable_asm.rs
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> new file mode 100644
> index 000000000000..761f0c49ae04
> --- /dev/null
> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
> +
> +//! Support for BUG and WARN functionality.
> +//!
> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +macro_rules! warn_flags {
> +    ($flags:expr) => {
> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> +        const _FILE: &[u8] = file!().as_bytes();
> +        // Plus one for null-terminator.
> +        static FILE: [u8; _FILE.len() + 1] = {
> +            let mut bytes = [0; _FILE.len() + 1];
> +            let mut i = 0;
> +            while i < _FILE.len() {
> +                bytes[i] = _FILE[i];
> +                i += 1;
> +            }
> +            bytes
> +        };
> +        // SAFETY: Just an FFI call.

Safety comments could be improved. This being an FFI call is not the
reason why it's okay. Furthermore, it's not an FFI call.

Otherwise, this series LGTM.

Alice

