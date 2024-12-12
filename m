Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312C2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 03:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQvLLQO2Dcgk3hcePdj0knsnbyn081D+yRxJJ0jbm94=; b=BWSCNp+DgGJo1sBg1CRDuSECP2
	DFMOCqtTzV9LTq3QHvUQsnClHsCnAe96uwjTihhzaWWO0Dxk+tuXbNaFltPUX3wl96+GOhn2EmFog
	DedyxRrwJ2AzE9ww3zlZ3tvq0T4lCVvawismRGvybPlFQSEbLhgQNpt4LSSm87a2YPeJHVu7t3o3G
	YK/GundyPayYgMUjwI3Axh7TZyblCIzm9ibK5pGfgs7iNw/f29DnHdBXyNnZD2pIFsQMGcgHOJRrZ
	lBZzkhkWXlqMX3J0DQodaxxVBEU7pT3+73pabP5Gq7eX15MSfepkV8Xko6ijS5DLGsKzmZNxyv2uu
	nVvChIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZuD-0000000GoV6-3nZz;
	Thu, 12 Dec 2024 03:30:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLYmw-0000000GjV3-2a6V;
	Thu, 12 Dec 2024 02:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oQvLLQO2Dcgk3hcePdj0knsnbyn081D+yRxJJ0jbm94=; b=bykYbrgCCDZsBLSpywV5My41iK
	OM/qYMhqaRgv+2p9NnfchM55JgRmxVdUhy0j/YGfXOiS8eSiMFC4qeg+LrTWcX6coh4qPJl8OUgPm
	DnM0kgk7w13oTf8jKRr8jFIdX7dR9jS5DZGeuAuVLmJeP3lXREpB/O3vVWsDvScbX2VTvCaBe2OVh
	2xHy4LRU5gNagLMmWt2gbcfhKvAbA/U92uxr5owv+Pr0k1f42iQXcBSHeyJ7bP7Jp1aT4n4KftrdE
	eaH0Eu306BK06bbd+Kk2OZdWeRGM7NzVndgIZXGAt6uyRBYtJhVEJ/+s0Birga/9Aeypk4ksijLNj
	y2c5POog==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLYmt-00000003z2J-0ZCj;
	Thu, 12 Dec 2024 02:18:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725dac69699so104341b3a.0;
        Wed, 11 Dec 2024 18:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733969922; x=1734574722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQvLLQO2Dcgk3hcePdj0knsnbyn081D+yRxJJ0jbm94=;
        b=RE8dygVaRVW9ZhdpRbaKypAqE+WLOEpotsar0lbEJSz4tB3k7h3KfAP1GJvRxGfoRj
         C52LJpfMJdHlEkqjP7P35NISOxnAYRTKTkUkwdvnLGWGfJspqNhIsnjO8kxUfuCU/XH9
         YBHnX4IQdqk3MyN+FzHLBZV8nAN/O60wyB2v9rh32n/AKlHgwszIJ6oL4mq0kx+DLqsX
         hPgZtL8lPwLMofKx31yTnYyio14UQaRJhKK+axjaz3M6EeTLOEnz0QG9v9WBju7GissI
         8+eWJVFY68vNa+ILnFyMbyDFHWTG8PFROpdGF8OTr2zVWnjQQhxa58iL35/9cYsT8Njm
         rdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733969922; x=1734574722;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQvLLQO2Dcgk3hcePdj0knsnbyn081D+yRxJJ0jbm94=;
        b=VPRA7v/CTEmdowWdWFJmnh4SZpb/xZnqOPEA+3Rsc5QLlvi6k5sxwwz+KBV1hMvkD4
         G44DYYcQIrJzvdlPbDyvWKVnEpL2S2qF+lVZpm5i6cDQbS2fvMvNTKfrGZBeo5hGtyUN
         btGy+zPtdphHqNXQ3ndrCXujP8C0KAlQ4LJvncYs7vLnHIxeI2CLZjfX/EocTWzDYkQ2
         3H7Fpx1ttGFDg8k4OAea3N3LZWuJNZ5a8JyVB4UtVi31Syv+h01TXfVUd7nYYj94D+nJ
         Xh+XQibDCmF1/fofFwxbMal7clcCQ6n3qUd2ubx+sWGNVMvW5vh4SeJ5xOxAQG1eFT62
         bkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh7Hb+2SAMYkvgH+4bkybcpPsq/I9r1uP9Lye12G0/vRiSgE31qGBZr5xDiH812H6e+FAewsgEqvbCPog=@lists.infradead.org, AJvYcCWP5HYXs5Xu1HR4hXyme860QtQpQFEi/TcmVb5NOBkU0JYHYS7qRZLENGRCa7miXrr+Z1QwvblbfOvM3L+lOW+F@lists.infradead.org
X-Gm-Message-State: AOJu0YzSq2gfUDv1c69rMFatYxoU7v/l33FzrNXzoklvGWgJJjfW75zo
	HDuVW1s4FpuuJfUM7GdNT8UqnMi5fX13+eM+4hkvMLzBr1r/ODPOg55QEIXB
X-Gm-Gg: ASbGncuMu9iWgXvqEQv/wz3Slv/28wlNzPz6GPEBXgNBMDYAMzsLV5nKqSq5Po2B55D
	+4uL7y3xBNpiF0iCTvHtgV4KfXGxmZ6Uz8U6e4h+sMP2tvpc33Kbb9WDt3BzibZ2NR/rYjD/W6t
	75e6cry4NJ1RjIGY9hUyv25av/x9rNcEHK9LvrEiwygiA1VlXZdpidMocN9bTD0n9F3LC4QsncA
	/3JHvQ76Q9QSFN9pFrPium45AqlRXr49+FwddlO9OijotahaBUs3Jz2nq+lQaCxkumFrMbaHWW8
	Aqw2RE7J6FUpkSgur3IlbrtmHhm0Tw4vArSc
X-Google-Smtp-Source: AGHT+IGZbwuLBjXASZPibFhGLGJG7cajkpWLsR5RDRJ+xwbynfB6B9HK8IIuBtNdFreyTAaUTycqxQ==
X-Received: by 2002:a05:6a20:1594:b0:1e1:a434:295e with SMTP id adf61e73a8af0-1e1cec4579fmr2405581637.43.1733969920834;
        Wed, 11 Dec 2024 18:18:40 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d16e7132sm8390441b3a.152.2024.12.11.18.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 18:18:40 -0800 (PST)
Date: Thu, 12 Dec 2024 11:18:22 +0900 (JST)
Message-Id: <20241212.111822.2107715832201318415.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgj9rBOrcQa193RpuA708CFK1ojMqhmiNWF7dbyNFPJcJA@mail.gmail.com>
References: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
	<20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
	<CAH5fLgj9rBOrcQa193RpuA708CFK1ojMqhmiNWF7dbyNFPJcJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_021847_399908_135F266B 
X-CRM114-Status: GOOD (  25.72  )
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

On Wed, 11 Dec 2024 10:48:27 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

>> >> +#[macro_export]
>> >> +#[doc(hidden)]
>> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
>> >> +#[cfg(any(target_arch = "x86_64", target_arch = "riscv64"))]
>> >
>> >> +#[macro_export]
>> >> +#[doc(hidden)]
>> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
>> >> +#[cfg(any(target_arch = "aarch64", target_arch = "loongarch64"))]
>> >
>> > What's the reason for this arch-specific code? The file!()/line!()
>> > invocations? Could they be passed as an argument to the asm instead so
>> > that we don't need target_arch cfgs? I understand that they don't work
>> > exactly the same way, but maybe it could still work?
>>
>> Because of "error: named argument never used" in Rust inline assembly:
>>
>> All the archs define ARCH_WARN_ASM macro in the same way:
>>
>> #define ARCH_WARN_ASM(file, line, flags, size)
>>
>> However, only x86 and risc-v asm code use the size argument. Without
>> the cfgs, I'll get the following on arm64/loongarch:
>>
>> error: named argument never used
>>   --> /home/fujita/git/linux-rust/drivers/block/rnull.rs:54:9
>>    |
>> 54 |         warn_on!(true);
>>    |         ^^^^^^^^^^^^^^ named argument never used
>>    |
>>    = help: if this argument is intentionally unused, consider using it in an asm comment: `"/* {size} */"`
>>    = note: this error originates in the macro `$crate::warn_flags` which comes from the expansion of the macro `warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)
>>
>>
>> Any way to make the compiler to ignore this?
> 
> The error message suggests adding an asm comment. Does that not work?

Ah, works! I didn't understand what "an asm comment" is..

> You could even add the comment unconditionally on the Rust side. It's
> not like the comment hurts on the platforms that *do* use the size
> parameter.

Yeah, I confirmed that this also works for the architectures that
do use the size.

I'll remove the target_arch cfg in v2. Thanks!

>> >> +#[macro_export]
>> >> +#[doc(hidden)]
>> >> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
>> >> +macro_rules! warn_flags {
>> >> +    ($flags:expr) => {
>> >> +        // SAFETY: Just an FFI call.
>> >> +        unsafe {
>> >> +            $crate::bindings::warn_slowpath_fmt(
>> >> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::core::ffi::c_char,
>> >> +                line!() as i32,
>> >> +                $flags as u32,
>> >> +                ::core::ptr::null() as *const ::core::ffi::c_char,
>> >
>> > I wonder if this could be written to utilize Location::caller()
>> > instead so that `#[track_caller]` works?
>>
>> You meant that we could make warn_flags() function instead of macro
>> with Location::caller()?
>>
>> If so, we need to add cfgs to warn_on and warn_on_once because both macro
>> and function of warn_flags are necessary?
> 
> Well, I'm not sure! I don't know if it's feasible at all, since using
> Location::caller() would mean that the file/line is not a compile-time
> constant. But if we can, then I think #[track_caller] support would be
> nice.

I think that using Location::caller() makes the code complicated
(needs more cfgs for UML). All the callers (warn_* and bug_*) of
warn_flags and warn_flags itself must be macro for all the archs
execpt for UML. We don't want to have the UML version of all the
callers.

