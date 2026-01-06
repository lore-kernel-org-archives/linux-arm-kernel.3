Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B888CCDC192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKmQ6ewOOOfqJFvABNDKS6h3MYBPM9Ani044A1Zdf98=; b=leS97rVxUhRJVo/swdRRwlw+31
	ZZTp7YoI/77wq7MtJURwsD8JlnRXhhA2MQvfIlyrnZPcbzaGohtku0u7KSVT3IJ3wyNOsOvqemYvB
	E/sjcht62+SXttqw6JcSFkwEtvtMt6hUnNGhjrl0++9dV0MRI/KTbNvvwiqoa2lScYxMuzHnwz6Bb
	7Xwt8/qmXUCNvCccb9tjD9sRqSQB8bf3KUQYRqRrE/8IHWuBkt/XidHn4qvW9eVMJhSV5cn47hwmc
	0kJwnVn7ZIwuRz6VNcB5PiaUFSAwDyueabSeQFCzNw7MHyxcIbVR4D1P0cbsTlA9ru6RLjuahKO0K
	DGNNpFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6C4-0000000Czv6-02i7;
	Tue, 06 Jan 2026 12:29:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6C1-0000000Czuj-2LRM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CFBC41E53;
	Tue,  6 Jan 2026 12:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB00C116C6;
	Tue,  6 Jan 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702584;
	bh=KdLZFYMo7D4KPX3nlmpFQNO3qXfuSWZLiNfCSlwfPFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pfmeexpeommc0Z48KlHkDG+vbHD/HruwhVAn3NqZGVnyBH0q8cTWnjEnC6jLAKhEP
	 jvGy9/jGZZvzp+gux1eyb+yT1Y21KLh7LvupU4FVf0sRD9EggxFzdKaGFnIf3F4DIc
	 MJgNmmmp7bsFzYdFKH5FsK6NX992jTJ+2IRNWDpjW8CPhuJuSVm3joTb8p0Vf2tHgt
	 JKfh3EnCbayBEGjSHwsu4TtWtzQ0weOduCoWft58+nVg5hzboV+vNbEwbdCuIXLXnt
	 0iAL5MF2RD8kWQ1IsoKAnbedMhBjuvsICZo/iLuYgmbZEFF+vWYyqInnffH1UPAyH/
	 CO2a7CY28Nd+Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, FUJITA
 Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, Alice
 Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH 2/5] rust: sync: add READ_ONCE and WRITE_ONCE
In-Reply-To: <20251231-rwonce-v1-2-702a10b85278@google.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <AaMhgQBVJNQ-lfS70C2wyfbsXmJnxoK2QB0Qn6z77hc-gErX1ZpvLzFO-EJrFXKRQml2Qfqe87TLzFwYybVb1g==@protonmail.internalid>
 <20251231-rwonce-v1-2-702a10b85278@google.com>
Date: Tue, 06 Jan 2026 13:29:11 +0100
Message-ID: <87ldiaj560.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_042945_660794_ABDDB409 
X-CRM114-Status: GOOD (  33.17  )
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

"Alice Ryhl" <aliceryhl@google.com> writes:

> There are currently a few places in the kernel where we use volatile
> reads when we really should be using `READ_ONCE`. To make it possible to
> replace these with proper `READ_ONCE` calls, introduce a Rust version of
> `READ_ONCE`.
>
> I've written the code to use Rust's volatile ops directly when possible.
> This results in a small amount of code duplication, but I think it makes
> sense for READ_ONCE and WRITE_ONCE to be implemented in pure Rust when
> possible. Otherwise they would unconditionally be a function call unless
> you have a system where you can perform cross-language inlining.
>
> I considered these functions in the bindings crate instead of kernel
> crate. I actually think it would make a lot of sense. But it implies
> some annoying complications on old compilers since the #![feature()]
> invocations in kernel/lib.rs do not apply in the bindings crate.
>
> For now, we do not support using READ_ONCE on compound types even if
> they have the right size. This can be added later.
>
> This fails checkpatch due to a misordered MAINTAINERS entry, but this is
> a pre-existing problem.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  MAINTAINERS                |   2 +
>  rust/helpers/helpers.c     |   1 +
>  rust/helpers/rwonce.c      |  34 ++++++++
>  rust/kernel/sync.rs        |   2 +
>  rust/kernel/sync/rwonce.rs | 188 +++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 227 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12f49de7fe036c2439c00f9f4c67b2219d72a4c3..1d0cae158fe2cc7d99b6a64c11176b635e2d14e4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4117,9 +4117,11 @@ F:	arch/*/include/asm/atomic*.h
>  F:	include/*/atomic*.h
>  F:	include/linux/refcount.h
>  F:	scripts/atomic/
> +F:	rust/helpers/rwonce.c
>  F:	rust/kernel/sync/atomic.rs
>  F:	rust/kernel/sync/atomic/
>  F:	rust/kernel/sync/refcount.rs
> +F:	rust/kernel/sync/rwonce.rs
>
>  ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
>  M:	Bradley Grove <linuxdrivers@attotech.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c4b473971e6210c9577860d2e2b08..28b79ca7844fb744e5ad128238824921c055ec82 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -48,6 +48,7 @@
>  #include "rcu.c"
>  #include "refcount.c"
>  #include "regulator.c"
> +#include "rwonce.c"
>  #include "scatterlist.c"
>  #include "security.c"
>  #include "signal.c"
> diff --git a/rust/helpers/rwonce.c b/rust/helpers/rwonce.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..55c621678cd632e728cb925b6a4a2e34e2fc4884
> --- /dev/null
> +++ b/rust/helpers/rwonce.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2025 Google LLC.
> + */
> +
> +#ifdef CONFIG_ARCH_USE_CUSTOM_READ_ONCE
> +
> +__rust_helper u8 rust_helper_read_once_1(const u8 *ptr)
> +{
> +	return READ_ONCE(*ptr);
> +}
> +
> +__rust_helper u16 rust_helper_read_once_2(const u16 *ptr)
> +{
> +	return READ_ONCE(*ptr);
> +}
> +
> +__rust_helper u32 rust_helper_read_once_4(const u32 *ptr)
> +{
> +	return READ_ONCE(*ptr);
> +}
> +
> +__rust_helper u64 rust_helper_read_once_8(const u64 *ptr)
> +{
> +	return READ_ONCE(*ptr);
> +}
> +
> +__rust_helper void *rust_helper_read_once_ptr(void * const *ptr)
> +{
> +	return READ_ONCE(*ptr);
> +}
> +
> +#endif
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 5df87e2bd212e192b8a67644bd99f05b9d4afd75..a5bf7bdc3fa8a044786eafae39fe8844aeeef057 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -20,6 +20,7 @@
>  pub mod poll;
>  pub mod rcu;
>  mod refcount;
> +pub mod rwonce;
>  mod set_once;
>
>  pub use arc::{Arc, ArcBorrow, UniqueArc};
> @@ -30,6 +31,7 @@
>  pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
>  pub use locked_by::LockedBy;
>  pub use refcount::Refcount;
> +pub use rwonce::{READ_ONCE, WRITE_ONCE};
>  pub use set_once::SetOnce;
>
>  /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
> diff --git a/rust/kernel/sync/rwonce.rs b/rust/kernel/sync/rwonce.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1660e43c9ef94011812d1816713cf031a73de1d
> --- /dev/null
> +++ b/rust/kernel/sync/rwonce.rs
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! Rust version of the raw `READ_ONCE`/`WRITE_ONCE` functions.
> +//!
> +//! C header: [`include/asm-generic/rwonce.h`](srctree/include/asm-generic/rwonce.h)
> +
> +/// Read the pointer once.
> +///
> +/// # Safety
> +///
> +/// It must be safe to `READ_ONCE` the `ptr` with this type.
> +#[inline(always)]
> +#[must_use]
> +#[track_caller]
> +#[expect(non_snake_case)]

I really do not think we need to have screaming snake case here. I
understand that this is what the macro looks like in C code, but we do
not need to carry that over.


Best regards,
Andreas Hindborg


