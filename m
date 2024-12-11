Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C3BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPkuDVmQ8I0bPStjeQByqCDXTekXQdwOcRMPaf2EPFY=; b=nDAHLrDGygmjJUYy7IiOXgnMFC
	QSTg6ewXrnTbiwBAoQofmhC5NjwegtLsNRqwvVh7na7Bb0hpnz40Jq0kCd8ZX05CMPsHEfL8YX43A
	2N85LIxRX2rKloa6QMa3YiQh+XvaUPJ7AG2MFH9ArfNwa0UenQMePxZmO/xZF5QNdj4aKwEM5uP0+
	BqUtx5tduzVhFCnJUnlgDTm1vIx9aaiU+cxS3lI3Svgg86QatwJ0EgOXeo3K/xMxPR/IugqCkgcu0
	lAM6UxoJQkWxQh0wtw+Bcd0ljx19kwUnpMbJxmXKjvGh7hrZ4cPfhm0uVMhpj5OLQUbrjGfIH1b3E
	LCgUUFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJLo-0000000EU0j-0bEt;
	Wed, 11 Dec 2024 09:49:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJKj-0000000ETm5-3lNC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:48:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3862a4b8ec2so2720820f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 01:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733910519; x=1734515319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPkuDVmQ8I0bPStjeQByqCDXTekXQdwOcRMPaf2EPFY=;
        b=oeABfu+R0EBKiygvzkYYpgfxUMrge/hKtQasEOgpZkT/7uiiL8/MyKIOmDFX92Vfim
         PQxSaYFTUCms/gd8WcRW5NJ8fUz0M6jhN9Fu5rGWR7SbgFVrsWdMRLcI15cBlw5eEBNZ
         6+/Yr0tvHKLcv26QrIMWiKolxImBN1RAHN2YM+9Dn0iNC+IAiMSLn4IOXomCGfa1Db76
         hxYT7YJc8vb8iOKui42MOOKUoBJTKdnei21X0ws8E4G/FEqDQKFISvs6St5kbmXAs6HQ
         xgPGoqCS+TSRCU4EsfG/p+TfrEQxwrH+TKrXdeKVqH9MzHu6zfUj3tcByjJ4PS72cpzG
         RRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910519; x=1734515319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPkuDVmQ8I0bPStjeQByqCDXTekXQdwOcRMPaf2EPFY=;
        b=cvbxqnf+xDsEibBxXbsvwjTZpXIWkXhBEzH+q7JleHsFwxTzlSxHglI8nXc1yojpge
         w67PHRuBZShpe2sJ2S16IkjJMpcecBNIZ20DGaON6OxNgCvDIzYYBV7yzFEwP25a+oiQ
         MRjqJVo5/jaMpTfc1hDgnxhPUyUR7kfseGaTa55lNPPqJ2aWT9q/cpWrrdDYBsIV+5Zs
         i/MHqx7+r3wmFe+1hPpG8U8HQXaAbC4cHHmMLltNarwwrv3Ge8aDlaRNe75OJX37C6r7
         xpHrp1UhaxXHiGBDChwPKI3OSA9r73lE2JAYUQU5/0VIYFUEeDFfM8g6wOwlmNeEp5ul
         jFYw==
X-Forwarded-Encrypted: i=1; AJvYcCVqQSuC6KS4cDwr2lQXDtnQeDLVwg6XicdDKh5zbrqubl6FN3yXcQQmsyXpjCIMozAh0tHG6tc0lp1LunZQNCms@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+YJiDwd8da5pwEUWamXs91Ciq95RmoMP718uTVmfumoqN3wYk
	tBqPRpSspqjWgR259gb48LBwOoOIFBlD8SVDq08Oa51nPPgAfzB7ATW4juefG4BJg6yk414BS7D
	139l7J46NdiQFcogUd7znxMaa6AF4bfhcIBYI
X-Gm-Gg: ASbGnctDs4jmVYaYysDmIzvPP2jb26uey19mFw1NRszil7IlEEBc076Bh7qoPGEVYoO
	nYs7zMUaOELfr0xX2ruKeywhTcslX3jRGmmaX+Uyf9MwbRZrBUOqsXETMuyS3B+5WLw==
X-Google-Smtp-Source: AGHT+IGgLsoa3jV2scUrxGJs3M3c7OjkCrlHZsyu8jTWcAJIYLV9qXmSt5/Cg8qsliTSfr6/wIq7uJuo1wJlePE++No=
X-Received: by 2002:a05:6000:410f:b0:385:f2a2:50df with SMTP id
 ffacd0b85a97d-3864cea200amr1277675f8f.27.1733910519359; Wed, 11 Dec 2024
 01:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
 <20241210001802.228725-6-fujita.tomonori@gmail.com> <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
 <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
In-Reply-To: <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 10:48:27 +0100
Message-ID: <CAH5fLgj9rBOrcQa193RpuA708CFK1ojMqhmiNWF7dbyNFPJcJA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
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
X-CRM114-CacheID: sfid-20241211_014841_933715_358B0C3C 
X-CRM114-Status: GOOD (  32.48  )
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

On Wed, Dec 11, 2024 at 1:41=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Tue, 10 Dec 2024 10:05:07 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Tue, Dec 10, 2024 at 1:19=E2=80=AFAM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >>
> >> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> >> macros doesn't work so this uses the assembly code exported by the C
> >> side via ARCH_WARN_ASM macro. Like the static branch code, this
> >> generates the assembly code for rust dynamically by using the C
> >> preprocessor.
> >>
> >> file()! macro doesn't work for the Rust inline assembly in the same
> >> way as __FILE__ for the C inline assembly. So the code to handle a
> >> file name is different from the C assembly code (similar to the
> >> arm64/loongarch assembly).
> >>
> >> ASM_REACHABLE definition works in the same way to get objtool's
> >> reachable asm code. The architectures which use objtool (x86 and
> >> loongarch) needs it.
> >>
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >
> >> +#[macro_export]
> >> +#[doc(hidden)]
> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> >> +#[cfg(any(target_arch =3D "x86_64", target_arch =3D "riscv64"))]
> >
> >> +#[macro_export]
> >> +#[doc(hidden)]
> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> >> +#[cfg(any(target_arch =3D "aarch64", target_arch =3D "loongarch64"))]
> >
> > What's the reason for this arch-specific code? The file!()/line!()
> > invocations? Could they be passed as an argument to the asm instead so
> > that we don't need target_arch cfgs? I understand that they don't work
> > exactly the same way, but maybe it could still work?
>
> Because of "error: named argument never used" in Rust inline assembly:
>
> All the archs define ARCH_WARN_ASM macro in the same way:
>
> #define ARCH_WARN_ASM(file, line, flags, size)
>
> However, only x86 and risc-v asm code use the size argument. Without
> the cfgs, I'll get the following on arm64/loongarch:
>
> error: named argument never used
>   --> /home/fujita/git/linux-rust/drivers/block/rnull.rs:54:9
>    |
> 54 |         warn_on!(true);
>    |         ^^^^^^^^^^^^^^ named argument never used
>    |
>    =3D help: if this argument is intentionally unused, consider using it =
in an asm comment: `"/* {size} */"`
>    =3D note: this error originates in the macro `$crate::warn_flags` whic=
h comes from the expansion of the macro `warn_on` (in Nightly builds, run w=
ith -Z macro-backtrace for more info)
>
>
> Any way to make the compiler to ignore this?

The error message suggests adding an asm comment. Does that not work?

You could even add the comment unconditionally on the Rust side. It's
not like the comment hurts on the platforms that *do* use the size
parameter.

> >> +#[macro_export]
> >> +#[doc(hidden)]
> >> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> >> +macro_rules! warn_flags {
> >> +    ($flags:expr) =3D> {
> >> +        // SAFETY: Just an FFI call.
> >> +        unsafe {
> >> +            $crate::bindings::warn_slowpath_fmt(
> >> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::=
core::ffi::c_char,
> >> +                line!() as i32,
> >> +                $flags as u32,
> >> +                ::core::ptr::null() as *const ::core::ffi::c_char,
> >
> > I wonder if this could be written to utilize Location::caller()
> > instead so that `#[track_caller]` works?
>
> You meant that we could make warn_flags() function instead of macro
> with Location::caller()?
>
> If so, we need to add cfgs to warn_on and warn_on_once because both macro
> and function of warn_flags are necessary?

Well, I'm not sure! I don't know if it's feasible at all, since using
Location::caller() would mean that the file/line is not a compile-time
constant. But if we can, then I think #[track_caller] support would be
nice.

Alice

