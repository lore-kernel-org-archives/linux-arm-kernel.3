Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0329DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=; b=4LH7bzO11OyIEbvRKWQH9cEsku
	VH5C/JREayyXsDmZhN8sEHyjjeUDbPTz6WFkWhUgtaFuPI51KjHfdjmNWcxXo1wtIGPznEg5r3u1v
	Pswj4ROONoAHwd4+jB5lUR4tSGehbnKkYjv0l7o8TRr+Tr7xoUqJAJZCnYiVdU/Dwy0QAUZuBQZ6+
	wh9S/pWFcvMJBtSG8d4atIC/iMFFwOdNfaERBwHxCxO56/Vj2chQxINJAK3mYXJazsGgMkurmFbgt
	PmkRlF2IiAN0mHzWROecn3Xy0b9QqGwpu2asglsVkP6NF76BrgUqBv/rH1S+25NegApQPrBP+SsDm
	kpZ778uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44z6-00000000Bxl-3Kcd;
	Sun, 13 Apr 2025 21:35:24 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44vb-00000000BcC-2iHE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:31:49 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so6855513a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 14:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744579906; x=1745184706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=h2Qi1/DdxMZ3Cv5tDbaYHEi6nQ7/7cyZ5sYFdfR+ILMzgS1/bVgri682BenUsonOtc
         DxzkxIKV2XJ0cI7eYibajg95Q9irwzq8AQwnC9rz1GDSWlOweAOvXHNVS3jqxJvryJkw
         tS7gcv9QKN+NeGS74bQrg/gzUYBqaYDjkXIIjUJcu/MV2KeM+kOMW74mW0U2S5v8Qnwx
         swihWuDh1W/iqLTycpp713TJYWIviZawF0fUyCTXLQND10b5tU011nSjaN4B2DjajoV1
         FC+6LBakSkuPr187QCGrW0r140g1avUAMXOcDbXM7tdgXOeNsodAZ6cTx/xJPrLSDyT0
         Q6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744579906; x=1745184706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1WGBlHWjazqP3jbWLExnKtOaCdZWRyF6rr+r0o9NNs=;
        b=Cg5FOsGJzx5MzLu03A2okjSNnmJTiecPHpu4nA5SSuHspSf6CSExqU/hMYfU+4plsg
         3lk6g2C2zIBho0gpmsZm0s4yx/WWyDZk+EDF5/8ZWN2xSQrWl1wmHfuSawMpiEzznrmv
         1B7EGwZVKqgL4HxuNlcZSBp1y0QmydZnBX5HvADaNPAwNyxTtzpvjFyHZKxenTcwb6Oa
         nkk9HjqzUCE/sti9lBlA4Z2djSSd4RagI4bT0qGIpxijOrWe0wPaga0F38QX2I/ZfP4s
         jBbmsY1840RV1nm0KyqwaqX4k/Exfuzv5E44q2yrW8jab/R5GpIarVhP4DMdRUNB0BZS
         u4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS8vPsk1lKmO4azx+rNrwvYwiPaIvnO20gU44wXGgjWwUOq032yAxW40shoU81RJOhMwOrgbS2honHs2fxd5mr@lists.infradead.org
X-Gm-Message-State: AOJu0YwCWhYsV+IOt7Jsq2NLxewhLVUDmzE4bdaPgMtkb4Zxa0rQxmR3
	dJY9io0m4C/KZjgB1U1G6NKdwYUDBlfZBIbAxHfxhTaVsIGYquEW
X-Gm-Gg: ASbGncs6E6MWZl6XFf6m5kA562mCl85XjUevlw0Up7FC373cuNy3sFSoAF+9/sD33XN
	3vgVJ22Ibo3BInW+xDIF+1xhiSBaSQ0RpiG3q8vlpAeTXdsZNqC/8UkHkWTmFtgswta4MBErZH4
	appv2VJgU9KoGktP60D2GPCxs/HVReczl9HKJ9pmlGiwgGs6mNGtVI5LCeC2Ux19ctO6iik8h7m
	rhWUkirMNhh3/HaCNogjtkKMk7Vz7v1pkvu2cnqnGf5xj4CGVbsF4rhnUro13FKkgczzUos/+ef
	Cl6PdauSz1qSayn8uqm95vRW4hy3GiY674k/r2i2Ighw1kzgQ3H92Q==
X-Google-Smtp-Source: AGHT+IHlo8hLp7rlYj2GXP7jYUaAGh5el9EWXgy8ypyB9DxHl3+B048jo8az5jI2O4Hbkz7D8aF8CA==
X-Received: by 2002:a17:907:7da0:b0:ac1:dd6f:f26c with SMTP id a640c23a62f3a-acad36a601amr814934366b.46.1744579905498;
        Sun, 13 Apr 2025 14:31:45 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1c4sm801345666b.148.2025.04.13.14.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 14:31:45 -0700 (PDT)
Message-ID: <ac855a23-3f16-4793-8bd6-3da7814ea64f@gmail.com>
Date: Sun, 13 Apr 2025 23:31:44 +0200
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
X-CRM114-CacheID: sfid-20250413_143147_694216_C058A9A8 
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


