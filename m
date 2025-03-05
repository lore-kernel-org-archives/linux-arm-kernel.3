Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA89C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=; b=Q75zNnmezL/z/52x6KShbu/yZy
	42ku0svLjrrfOJa5/t3mZwh1UpzzMdUqIwn6EBjJSdmZez9VIm+t9xpd45cMihvkCKANq31487NKm
	oQjNzWLe/WSWLk2hstPYYnJkm9oFOWGUsEs/3XQZK/74dGlJ81Wdrl9FTKi0K84Arf8nzpd4XnB76
	D8f8RYl2RYe4Gcg4JGmkvlJfcOPWqAMpnsBxGujzHcmv6aVtEAAycArXg0mI3HOqqHhGff8kOHysM
	GELBQzAsLo9x1wOVyR4c3SNMjX8kkvyq+hUV4DDYoDte9J0k/4/QsJkotjAuYqTqraQDxDMQPQaEY
	CJ8KZytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkNn-00000007PHP-0CSo;
	Wed, 05 Mar 2025 08:45:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkLF-00000007OvT-1tsC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:43:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so6781205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741164179; x=1741768979; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=zh1E3pITPbkwcsDp7V2wX5NTiyE8+mCwxAmhprc/XuKMrWKdUS7IQZdQoY8XBK8IYV
         4IyVgp0h4PxacRBShzxHaEB2ytNDTVew4b7vbpaAv7YjWHrOML+CNnIILb0EEuEkQaSF
         jA4nfnzjWkiuMQo4M11k2IQJv8EYkbUq4JomfMw59MpUXyKOpFBVDkIZIwW7h8ljtL3S
         rii+OvMSzI86Cz1iZurZcmecU2tjiSn9Y8JOWCR9eTMZcYLoC23GlJK/gKk4g30GaFrz
         epI8jBRWHF/2S5b1AF7Q6AbRlOgELhnRDNuxLUm80Crug+8ECHUFqXsR2k0qrKqmqH+2
         zCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164179; x=1741768979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=Vms++q0llY48cG6X949R0qM9aGkWfKl+d1mdinDMlDa1ndFEpe/VnmjPxdkM7eHHDA
         XfFK5ogYLY6lbCBbFjFPr7Eti5RPWU1RCUpnoGYPbyrytl6Rx5OngfPulVN7goAIEIGF
         dsmUSvfahIpemYb+noW9SUNrUT+1nS8/tg+hcz0JdLbZas/P0Wb9OQfztF6lhNzwBZ/S
         mZUGG1fJN+lQehd7znws3C5D3kaoctWHolFf7TsEVJrgeet777RYOAtzy06WUBx304XY
         ozv/a7+lEiArpcAjmw/PYyc/TSabnx5uwzxX+SUwpVrAZ2XFGdnBq3PjhEaNNgVlegL6
         mYuw==
X-Forwarded-Encrypted: i=1; AJvYcCUoqzr1Wt4I/k0gWSkFwXkBqhQGQefmFK6ypaSXj8y3agddPf3kbbEIkekyNxEWazqxpTSmMLlmuJRHiWX1vKQU@lists.infradead.org
X-Gm-Message-State: AOJu0YzeBCJW7Jk6eeLRPZm0127x8vF44S9j9DAonGaRMAuWDSj5qiKZ
	1vbXdx/Hu6ZvcFAuXDRP2HLcrDljODWbMToXDkH0ApJqyrEqgJM1W1qO6YarCeCWny8Tq88XdBy
	0STAQjjM9MT6sGA==
X-Google-Smtp-Source: AGHT+IGNc0nObqBIdB7e0pv2I7PeyN0NrbTAt23TRGJiElvbDtYcA/dcph5rmLVDajCFRggPb9cddtoV966/r0s=
X-Received: from wmgg24.prod.google.com ([2002:a05:600d:18:b0:43b:c99a:4af8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c09:b0:43b:d04a:3506 with SMTP id 5b1f17b1804b1-43bd2ad9527mr12625425e9.25.1741164179002;
 Wed, 05 Mar 2025 00:42:59 -0800 (PST)
Date: Wed, 5 Mar 2025 08:42:57 +0000
In-Reply-To: <20250213135759.190006-6-fujita.tomonori@gmail.com>
Mime-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com> <20250213135759.190006-6-fujita.tomonori@gmail.com>
Message-ID: <Z8gOkeJ8o2pMCwGu@google.com>
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
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
X-CRM114-CacheID: sfid-20250305_004301_495714_D111E2DF 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu, Feb 13, 2025 at 10:57:59PM +0900, FUJITA Tomonori wrote:
> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> macros doesn't work so this uses the assembly code exported by the C
> side via ARCH_WARN_ASM macro. Like the static branch code, this
> generates the assembly code for rust at compile time by using the C
> preprocessor.
> 
> file()! macro doesn't work for the Rust inline assembly in the same
> way as __FILE__ for the C inline assembly. So the code to handle a
> file name is different from the C assembly code (similar to the
> arm64/loongarch assembly).

Nit: Should be file!() not file()!.

> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> index 6ba39a178f30..f1d7f4225332 100644
> --- a/rust/kernel/.gitignore
> +++ b/rust/kernel/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  /generated_arch_static_branch_asm.rs
> +/generated_arch_warn_asm.rs
> +/generated_arch_reachable_asm.rs
> \ No newline at end of file

There should be a newline.

> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 FUJITA Tomonori

2025?

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +macro_rules! warn_flags {
> +    ($flags:expr) => {
> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
> +                "111:\t .string ", "\"", file!(), "\"\n",
> +                ".popsection\n",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            line = const line!(),
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }
> +        // SAFETY: Just an FFI call.
> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> +        unsafe {
> +            $crate::asm!(
> +            concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }

I generally prefer to have the cfgs on the macro rather in its
expansion. That avoids emitting a lot of code that is not actually used.

> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! bugflag_taint {
> +    ($taint:expr) => {
> +        $taint << 8
> +    };
> +}

This could just be a const fn.

> +/// Report a warning only once.
> +#[macro_export]
> +macro_rules! warn_on_once {
> +    ($cond:expr) => {
> +        if $cond {
> +            $crate::warn_flags!(
> +                $crate::bindings::BUGFLAG_ONCE
> +                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)

Or maybe a constant?

const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | (bindings::TAINT_WARN << 8);

$crate::warn_flags!($crate::bug::WARN_ON_ONCE_FLAGS);

Alice

