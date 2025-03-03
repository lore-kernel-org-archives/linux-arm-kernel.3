Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B82C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98OQ8wvaJ9wtoqY/FnFWTw/2aTBVHaqyurEF1+7THsM=; b=FSFIYaYYit2OW/sEk4+/X3n+gB
	IOklioqVlrYLs4SIxyRf9h+ma6nHxH0s/pPGke+M2nIa8mFcj3x87G5Vezdd4WD8QbMYsnbJjApEb
	O1mJamf8I391pxoFe8QYjNsgJsHW73tz+jK4KYk8HuAxuJCKTNXMnhmNpbNTHYwojcQkhkm4nvci4
	PAYdaHJLgL0oRBD0q/ahuGZ3kHDJGeJhfaQYvohGh0358WiBE+XFjF5dvs/TN91BqZsqzJG/g+wCv
	MinqHlMH3zqY3d3UjD1i70Se8rd1jS2Tkzup7pC6C8HgUsezYkG6YyBWBwko0hn3ooI4t3v67uI0b
	tWMgpwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6N0-000000010pX-3SHl;
	Mon, 03 Mar 2025 14:02:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5ve-00000000wAx-0Z23
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:33:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3910e101d0fso532207f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741008831; x=1741613631; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98OQ8wvaJ9wtoqY/FnFWTw/2aTBVHaqyurEF1+7THsM=;
        b=nnBZLfULe6qgnTcnyfdsh2Wdoveis1fvfchH4BrtS9KBL43+Qwo6IE+EsGh51kO5bc
         rxBZSOU9vpDurYEcs27mN8C7fjV+JLbM4USo5ac/M3XRpTfgl7y9Rj/WkEtmGaCm5CZx
         W6EK4cKeVPsnZuFK1g7HBcC9jDSjftsT0N5WotI/JK1F3MWQCiHV+Gfdi64S+8AlGfVl
         91LfgBatGXhnZXKwOZmf3fblPdKU4HjuCwBW0prnFLjxF8XGT0U6Ro6+/UgoJCYtY4zc
         eePR/FOumc+93+Bbt7sJJnAVRfccWjF7e8y/xRqbEPRURtWKVtLFVePlFglxBkdMRS61
         Xpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008831; x=1741613631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98OQ8wvaJ9wtoqY/FnFWTw/2aTBVHaqyurEF1+7THsM=;
        b=u9BTxVvJqgrliG/NthqVs7ct534Axv4SOK0O/agThtz2WNkOMM8juDj1YUB+b3iSq/
         gH/BvVnXvppL533oItGXo8yTa96NMLcIP6XUy8rsH9hjqZu0ZdLjy1kV+J7fsORJnnua
         uqMVBj5ADa25t10s9ViT8R5VAaIGc4+9xaldYzU3IY9m4Pk+zh7u+5pAxPeRTgK4QAUB
         Xo0RFhPRbhuzLjz/zrDMwCXci9AOVdgn0HFAmCXoZUaxgvByHGIICeDyP3pdlUQDkCY6
         eMJA/pB0BQI7OgUuhiNfFLfJEQw+WxOH7Xkfw4EKNllHGFOtg6PBzv8Pfs6kgz18NbUZ
         y03g==
X-Forwarded-Encrypted: i=1; AJvYcCUIq2pKni0+Y1uu7B3gGqB3b8n8lzB4KzdtBtIXxcEEkHUZ0EtdOfExoKqaHY2q3867gCFgLSN8HrwLSkAfm4KB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu83iLDi5qfklvpk6fdBj+78ka6MyTsyweugEBaSYAFucu/oSr
	tqYlLP5CYVYNJmP/HMvj5nnvk83SDUej7TFuC9n6YyZLFx2WBqwuzaPv878wCIHfCCiYkAEPlqo
	NJiiPlqXQyoyaGa5MnlTnAvfpSoDUqzrRmv543CYKJXZEt/fOq0IZ
X-Gm-Gg: ASbGncsIYMQ7nOXqkzC7qH7ecJVxSKhcTtwSw7psJasy6IEnHUa6rED8a2hdl6Y7JJY
	7t8bpMOX02+i2M+aCVykeimCK9ayDpP1iQzg0QDzSS4XljYyAyhbytyR5LhldNDjBXo7Wvet5gQ
	T0zdjddKddpIKkuJBnSSmiNAgrhUNTHLoOb2Y6kZIsT1amyLx0m7I/Kx7H
X-Google-Smtp-Source: AGHT+IE8JWpQtarWwp+2hNt/MR6epGuJDDazTrc2gMvmQUZSN/QRsDdQQeOGHqHvxcXWjRP0+QCxyieUoVOMPKqMUFM=
X-Received: by 2002:a05:6000:1f8a:b0:390:fc83:a070 with SMTP id
 ffacd0b85a97d-390fc83a160mr6688529f8f.0.1741008831435; Mon, 03 Mar 2025
 05:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com> <20250213135759.190006-6-fujita.tomonori@gmail.com>
In-Reply-To: <20250213135759.190006-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 14:33:39 +0100
X-Gm-Features: AQ5f1JoT3yLvXrcqi1UY1px9Dirgxz3oFETPYn_JBDKUcmKVulP6_KvtwihScxI
Message-ID: <CAH5fLgjX9hh+QRrKggOKr+6p+UwqHSavzu4UXy9iGNL2wSJXtg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_053354_165958_9481EB9D 
X-CRM114-Status: GOOD (  25.35  )
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

On Thu, Feb 13, 2025 at 3:01=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
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
>
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. Only
> architectures that use objtool (x86 and loongarch) need it.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/Makefile                                 |   8 ++
>  rust/kernel/.gitignore                        |   2 +
>  rust/kernel/bug.rs                            | 100 ++++++++++++++++++
>  rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
>  rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
>  rust/kernel/lib.rs                            |   1 +
>  6 files changed, 125 insertions(+)
>  create mode 100644 rust/kernel/bug.rs
>  create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
>  create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 8fcfd60447bc..a295b65c43f3 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -34,6 +34,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel=
_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated_kunit.=
o
>
>  always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) +=3D kernel/genera=
ted_arch_static_branch_asm.rs
> +ifndef CONFIG_UML
> +always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) +=3D kernel/generated_arc=
h_warn_asm.rs kernel/generated_arch_reachable_asm.rs
> +endif
>
>  # Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
> @@ -481,5 +484,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_e=
rror.o \
>  ifdef CONFIG_JUMP_LABEL
>  $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
>  endif
> +ifndef CONFIG_UML
> +ifdef CONFIG_BUG
> +$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/=
generated_arch_reachable_asm.rs
> +endif
> +endif
>
>  endif # CONFIG_RUST
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
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> new file mode 100644
> index 000000000000..7ffd9cb1ad75
> --- /dev/null
> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 FUJITA Tomonori
> +
> +//! Support for BUG_* and WARN_* functionality.
> +//!
> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/=
bug.h)
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
> +                "111:\t .string ", "\"", file!(), "\"\n",
> +                ".popsection\n",

It looks like you're doing this so that you can reference the filename
with "111b", but could you do this instead:

const _FILE: &[u8] =3D file!().as_bytes();
// Plus one for nul-terminator.
static FILE: [u8; 1 + _FILE.len()] =3D {
    let mut bytes =3D [0; 1 + _FILE.len()];
    let mut i =3D 0;
    while i < _FILE.len() {
        bytes[i] =3D _FILE[i];
        i +=3D 1;
    }
    bytes
};

and then use

asm!(
    concat!(
        "/* {size} */",
        include!(concat!(env!("OBJTREE"),
"/rust/kernel/generated_arch_warn_asm.rs")),
        include!(concat!(env!("OBJTREE"),
"/rust/kernel/generated_arch_reachable_asm.rs")));
    file =3D sym FILE,
    line =3D const line!(),
    ...
);

with
::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}",
"{flags}", "{size}")),

That would be a lot simpler to understand than what you are doing.


Alice

