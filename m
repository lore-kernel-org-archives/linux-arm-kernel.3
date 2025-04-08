Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360A4C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=; b=BPppySRh2ZbWcxYMp1zYQcMant
	2mITkH/NNdDbjL4GeAeldQwB2DUlxnh/DhNwunQX+Te7+odvsW0UWci4W38yzaLl5C8nus01LQIZT
	rA4/6hK1U5AC9H3f1+38DUkXCk+EZQz19YtZrkErM8hF8BBQlXPzM9djkhnA1QcgkvWWvJ4YV3ZkH
	eMNcI3xfXDyjjpMbTtN/SxnoO1gILna2Z2BGRJmZradBIh4bbsxzi3HDEO74RafS58CYEaq3quPLU
	q0vo8eon//3FUQKr5ED1Zl/DKo4D2HFpLiCWepma8J33GqcREk+2zH8VmN4tpEodrh1I/Ywx921J+
	jQ810jZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29ZL-00000004JOi-1FFt;
	Tue, 08 Apr 2025 14:04:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29Qf-00000004HhE-3cBi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:55:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39149bccb69so5247688f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744120551; x=1744725351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=38lECjLypBuEn0p42UjDXNsgcGdmzE+04x9XodYe1K2jlcpNwiIiUB+gF5vKmTttf8
         qHZ4HkjUnSmHMCo6MT105SPL6ZoK2YQ87rWa8orvmnF6Fo0KM0xcsOL6UA6r/AwWLqzy
         kmZwV5954TcB3evieDukGK2ITq+bVjT3dPh3j1RoSnwdFNN6POSQIPr7tQm4zE+uMAS9
         pgg8KpsHT3vNSZxkW/1YWQ5E6IX06YNL2qSOAfrcOxcpnrNs7MjJWANv5mcEhvn8HfHm
         H+SnolLxkKBpPDv64fIVvtcvHL4hdfHNHVQKJqwrrO2gBOCyZobS5WAZoc9TjO5FSMYU
         8TqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120551; x=1744725351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=MxaSsIpmip31WjcSBIod8voFx2xrpWdH9dDvBVDamwn5LDRe1oq0tVJCXKCcMl5OAT
         vavARn7d0T1PbHUA20OBBEdesv1SrpefMYG94JghSWo6f6k8LzDJTlfdlne+nEs5nf5B
         IgDU0hK6gxQ5OcrX0JI3z+TOe4t/18RqdLkPRj47yott3/XvFCoQBbMPwTwdftZXanU5
         ZGvHfLtQAUanROkQVfGsHSuwS3/YAxAjomSoE2oFs5alNuFdXtCFD8QhmR+LSzFB3syR
         E7E39Czi9I9keQQ/4BPxfh1UGs/+yFtNgvbiKllv1rdCCFh/3nwkX3hDJg0b0PEMbiKU
         9GeA==
X-Forwarded-Encrypted: i=1; AJvYcCUI1NjeIXcJkfXCtubXhMWR99kztBfj6we5WWqHT5r2OyO3O0bm3L8YbMrsrXHZkpaYz//7fbKbz33NMwa34fLV@lists.infradead.org
X-Gm-Message-State: AOJu0YwJTC9I+EMMSC/NgYe15TEmp9/i2ECHxQg5PPvrFz9bz8V4R0KE
	RBk9xhDT3cEFf5j50QuI9KG7Gq2eClT+OPOtH1XZC0N4xZ6qaj4apVbDK+cLCxocYTgQTlzc1ec
	oYUHOBSUzXp/Ew+yTRkKXjvSMJCU5RRy2SbXI
X-Gm-Gg: ASbGncvbrVCbtSY0LttUCPwZBlhHwPsaV9yvY2hBnYCxGfb5uUcdhOIaNRwKdQDLBQL
	l+T8pIo47jtp09KCI7p0dl3q42cTruAAyvUDKx4EmxPInXhPsKOPT4rjgVAmonxPwXvm8Aeg903
	9xt4TAbEfgiAl3A6aIIgOn7BpevGVOYWLW6X0lgqoO3UE2dCzhs1fgu5/R
X-Google-Smtp-Source: AGHT+IGe1he6VcB1HjanCrhxVAfQjIesMa6esygphkYmjhBdMP180Rn3O9/cuFUiPeqzOl258PSQo96dNzHqinw3Rqo=
X-Received: by 2002:a05:6000:1888:b0:39a:c80b:8288 with SMTP id
 ffacd0b85a97d-39d6fc83ac7mr10495756f8f.33.1744120551236; Tue, 08 Apr 2025
 06:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250305110814.272792-1-fujita.tomonori@gmail.com> <20250305110814.272792-5-fujita.tomonori@gmail.com>
In-Reply-To: <20250305110814.272792-5-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Apr 2025 15:55:38 +0200
X-Gm-Features: ATxdqUHiYJtkNt0G-spjemExiwLroDOvAjC-UywxGL0GYlMeas4Df-5aHcFmNEQ
Message-ID: <CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] rust: Add warn_on macro
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
X-CRM114-CacheID: sfid-20250408_065553_905551_C115B5F1 
X-CRM114-Status: GOOD (  20.76  )
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

On Wed, Mar 5, 2025 at 12:10=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
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
> For now, Loongarch just uses a wrapper for WARN macro.
>
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Overall looks reasonable. A few nits below:

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        const _FILE: &[u8] =3D file!().as_bytes();
> +        // Plus one for null-terminator.
> +        static FILE: [u8; _FILE.len() + 1] =3D {
> +            let mut bytes =3D [0; _FILE.len() + 1];
> +            let mut i =3D 0;
> +            while i < _FILE.len() {
> +                bytes[i] =3D _FILE[i];
> +                i +=3D 1;
> +            }
> +            bytes
> +        };
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_reachable_asm.rs")));
> +            file =3D sym FILE,
> +            line =3D const line!(),
> +            flags =3D const FLAGS,
> +            size =3D const ::core::mem::size_of::<$crate::bindings::bug_=
entry>(),

The indentation here is odd. Shouldn't the arguments be indented one more?

> +            );
> +        }
> +    }
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
> +#[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::asm!(
> +            concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_reachable_asm.rs")));
> +            flags =3D const FLAGS,
> +            size =3D const ::core::mem::size_of::<$crate::bindings::bug_=
entry>(),

Same thing here.

> +            );
> +        }
> +    }
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::bindings::warn_slowpath_fmt(
> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::cor=
e::ffi::c_uchar,
> +                line!() as i32,
> +                $flags as u32,
> +                ::core::ptr::null() as *const ::core::ffi::c_uchar,

Why unsigned char? I think this should be ::kernel::ffi::c_char to
utilize the custom integer type definitions in kernel rather than the
faulty ones in core.

(Maybe $crate rather than kernel)

Alice

