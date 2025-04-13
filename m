Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45775C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=; b=hZpYEY5/yCSZoUTYzlb9Y8MD8w
	dYDo/zCjavnerDxf6qXoKgkTW5OnxPQaThw7D79OZBJlIol1s60FKARMVq2vIIE+eKYAnvcWfVfMq
	s075IFnlrEB48AVYWIABPgZCVfCq5e9u3N7kgMG5yT6vUOUJx6jx1YyP8Q/hvO7SE9Jd2IuvIJvKe
	Q/I11+HY4U7YIv+Y96+eXuneup0TcMNJ/swx3PNFMB8Qp9jLM42jpARZ9TCwahHWqDq+EElCL6Cxz
	t3W5TfzNxD2cV9YZCEGr+/pyGPaF0ZklRsT4qbHhQ4/ykEFnKPGuOo3iY35IGEArq9og6iYEud09T
	uzunE7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44mc-00000000Af0-3rYH;
	Sun, 13 Apr 2025 21:22:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44bF-0000000097L-2OsY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:10:47 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so6037191a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 14:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744578643; x=1745183443; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=duaxv5k1lx31yLNIazCqMNILiPTGlj9/bgmD2Ik2bm9lWo7dKozwoLUomuD2c1aKaS
         GOa58AA2wxVsfA+9llM/JnDqaZ2mixSbu9yc5d5gYdHfEQeglGgN8tNA234G+il4PATE
         k5tMk7dvx4XMEaMlKgvYSRv5V63P7g40ztgXM7wyxC4/IjZ4aw5uYdjsADTz6LV+HwOc
         H3B63g6/HluwSwAMoobiny7YXuy19qs1vTqna/2S43ef0hLzcqErJn2CH+frfBMROjxH
         oLCGH8JcKAPnvGSVC/gO9YmYOSKeeuvppk62k7bVHkaorLinfYwES7LCwSHjFVaiWsGp
         8TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744578643; x=1745183443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=mksXjgLJj5oGi/hWKxdtJFOgbXi64rs4gDIOABPTvw2f40kIYyvgtkh/WXa6ftutKl
         b/QtaoSS2FgLh6AuHor5JLP6JjD5c7d8hHMlhnNzHbXZnUZDC/E6DS1swxUnEywPEhfv
         cxkjJPl7yn7OJBdPUU7Ox/nAylAmvOKOooEZ7OL0AUMPBmpWn5CqDlLyE21d/q8qnzgd
         yMdj7264VLgW6v3r+PXvEDqBrSogYyzzTdxDn2rL8QIQAFe++UQj2hJ9EnlgBSwKgyjj
         uPh1fdJdAOni3MT+e3X3L9N5gjkw9zsww/2XRZNK/N4ifAcrqRcoCQwCnrwrsENlNQU2
         qvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb4IdLtgimLFWqFKlzmaORCOhloH8CX7UX3CbnMpftdV0xe6QCaBBTDVoelEvwcjucZTpqjIdNicJw+uJkgPXe@lists.infradead.org
X-Gm-Message-State: AOJu0YwWpjvFVRPJqSfxlBhMVFKcnpVxwyD2RvcSBSKE4BAivCf+AHZR
	cDHpNWwJ14baIzANdF4JA7jKwTBVRRQWTB1I3uFnpfbUUo8HxX1J
X-Gm-Gg: ASbGnctZbO97VxNIHkpNPv4GgTLpawP36Bnss2IKKUMclgoQ9Q7/yys1/MpKYD+JEvN
	b3uMhR+7HmNJsLReYMnlCRqKKYo8YIbj7ujiehhaReOVn0OnwoyL2luX7WIO5HpjOYfH0Y+MTjh
	101DlhVQS9gqra97qSBaTu7IMqQryEJZA6Wv+8pAeIh61qd+83oGuYbLmK8aT68Sehe0o87Gbxj
	aVQTMFiJiGto6+DPe3zdsNWQEvNttGSp+haMaUSnc4ceGIpMGIYCEjwQkjI1/KYToIiHPVWcjGV
	pZtIAfaVlyHFemadhVNBMIVUCdLt/q6RO5vmQUztpLzBjz/vHe6tCw==
X-Google-Smtp-Source: AGHT+IHERt8l6p5mjOOazl62Cb2bwcwzax2tmer6+wi2AUBjvbcbumYa40ODMo+swIjwf+dyHbUsAg==
X-Received: by 2002:a17:906:f5a9:b0:aca:a1d7:a830 with SMTP id a640c23a62f3a-acad349a005mr966701466b.13.1744578643064;
        Sun, 13 Apr 2025 14:10:43 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb41besm789238466b.118.2025.04.13.14.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 14:10:42 -0700 (PDT)
Message-ID: <b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com>
Date: Sun, 13 Apr 2025 23:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_141045_623748_AC43FFD8 
X-CRM114-Status: GOOD (  31.18  )
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

On 21.03.25 8:24 AM, Linus Walleij wrote:
> Hi Christian,
> 
> thanks for your patch!
> 
> Sorry for being late to the show. I missed this very nice patch
> that was actually on my personal TODO but I have to much
> to do and also I'm not smart with Rust, but I'm a big supporter.
> 
> On Thu, Jan 23, 2025 at 11:40 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
> 
>> +       select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
> 
> Nothing in the patch series really explains this restriction, so it
> should be in the commit message. Arnd mentions some atomics
> etc, but we really need to know exactly why this is in the patch.
> 
> I'm a bit surprised by this since the rustc LLVM backend nowadays
> support all old ARM ISAs. I would have expected:
> 
> select HAVE_RUST if AEABI
> 
> Ideally this should work on any ARM core, but it's fair to require
> EABI.
> 
> The big reason: I think we want to be able to use Rust in kernel
> core components sooner than ARMv5 goes away from the kernel.
> 
> If testing is the only issue, I can provide testing on ARMv4, v5,
> ARMv5 BE etc, just tell me how to test. (But I guess it's more than
> that...)

I've done a quick test on armv5 with the `armv5te-none-eabi` rust 
target and it needs some atomics (`AtomicU64` type and for 
`AtomicBool` the `compare_exchange` and `compare_exchange` 
functions) to build:

```
  RUSTC L rust/kernel.o
error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
  --> rust/kernel/block/mq/operations.rs:15:33
   |
15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
   |                                 ^^^^^^^^^^^^^^---------
   |                                 |             |
   |                                 |             help: a similar name exists in the module: `AtomicU8`
   |                                 no `AtomicU64` in `sync::atomic`

error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
  --> rust/kernel/block/mq/request.rs:16:20
   |
16 |     sync::atomic::{AtomicU64, Ordering},
   |                    ^^^^^^^^^
   |                    |
   |                    no `AtomicU64` in `sync::atomic`
   |                    help: a similar name exists in the module: `AtomicU8`

error[E0599]: no method named `compare_exchange` found for struct `AtomicBool` in the current scope
   --> rust/kernel/list/arc.rs:518:14
    |
517 | /         self.inner
518 | |             .compare_exchange(false, true, Ordering::Acquire, Ordering::Relaxed)
    | |             -^^^^^^^^^^^^^^^^ method not found in `AtomicBool`
    | |_____________|
    |

error[E0599]: no method named `swap` found for struct `AtomicBool` in the current scope
   --> rust/kernel/revocable.rs:130:30
    |
130 |         if self.is_available.swap(false, Ordering::Relaxed) {
    |                              ^^^^ method not found in `AtomicBool`

error: aborting due to 4 previous errors

Some errors have detailed explanations: E0432, E0599.
For more information about an error, try `rustc --explain E0432`.
```

When gating all the modules that need these linking fails because
of missing __eabi__* intrinsics:

```
ld.lld: error: undefined symbol: __aeabi_memcpy
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::str::RawFormatter as core::fmt::Write>::write_char) in archive vmlinux.a
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::str::Formatter as core::fmt::Write>::write_char) in archive vmlinux.a
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::page::Page>::read_raw) in archive vmlinux.a
>>> referenced 29 more times

ld.lld: error: undefined symbol: __aeabi_memclr8
>>> referenced by bindings.4cab29b7397d35cb-cgu.0
>>>               rust/bindings.o:(<bindings::bindings_raw::module as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::module as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::thread_info as core::default::Default>::default) in archive vmlinux.a
>>> referenced 86 more times

ld.lld: error: undefined symbol: __aeabi_memclr4
>>> referenced by bindings.4cab29b7397d35cb-cgu.0
>>>               rust/bindings.o:(<bindings::bindings_raw::fp_hard_struct as core::default::Default>::default) in archive vmlinux.a
>>> referenced by bindings.4cab29b7397d35cb-cgu.0
>>>               rust/bindings.o:(<bindings::bindings_raw::iwmmxt_struct as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::fp_soft_struct as core::default::Default>::default) in archive vmlinux.a
>>> referenced 95 more times

ld.lld: error: undefined symbol: __aeabi_memset
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(<core::num::fmt::Part>::write) in archive vmlinux.a
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(core::fmt::num::fmt_u128) in archive vmlinux.a

ld.lld: error: undefined symbol: __aeabi_memcpy4
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::of::DeviceId>::new) in archive vmlinux.a
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(<core::char::ToLowercase as core::fmt::Display>::fmt) in archive vmlinux.a

ld.lld: error: undefined symbol: __aeabi_memclr
>>> referenced by kernel.2bb770ae1dba3d33-cgu.0
>>>               rust/kernel.o:(<kernel::page::Page>::fill_zero_raw) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::__kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1 as core::default::Default>::default) in archive vmlinux.a
>>> referenced by uapi.fe46408b8870a0f6-cgu.0
>>>               rust/uapi.o:(<uapi::sockaddr__bindgen_ty_1 as core::default::Default>::default) in archive vmlinux.a
>>> referenced 16 more times

ld.lld: error: undefined symbol: __aeabi_memset4
>>> referenced by core.64aa0a46a0f8f964-cgu.0
>>>               rust/core.o:(core::fmt::num::fmt_u128) in archive vmlinux.a
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
make[1]: *** [/home/chrisi/Documents/code/rust-arm32/Makefile:1242: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2
```

With define_panicking_intrinsics! for these an empty sample works
(not yet tested as module), but even printing a non formatted
string (with `pr_info!("Hi rust\n");`) fails because rust tries
to use __adddf3:

``
Hardware name: ARM-Versatile (Device Tree Support)
PC is at __rust__adddf3+0x0/0x4
LR is at _RNvXsg_NtCs3KHxpmQFgFb_6kernel3strNtB5_12RawFormatterNtNtCs8DPF7ip8WBQ_4core3fmt5Write9write_str+0x34/0x40
pc : [<c028950c>]    lr : [<c028b5ec>]    psr: 20000193
sp : c8811a78  ip : c8811ae8  fp : c058e44e
r10: 00000000  r9 : c058e450  r8 : c07ac118
r7 : 00000000  r6 : 00000000  r5 : c07ac120  r4 : c8811adc
r3 : c07ac120  r2 : 00000008  r1 : c0667f60  r0 : c07ac118
Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
```

I'm not sure how to proceed from here and I most likely won't
find time to continue working on this anytime soon.

My very hacky changes are available on Github at:
https://github.com/onestacked/linux/commit/edddb388267ab1afe5255bea4d84f96cbdb37978

Cheers,
Christian

