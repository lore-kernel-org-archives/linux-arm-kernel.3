Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D42CDC196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNB5y3G8Fpc7RfmyS76eECunpld1JEfd2mTkzH9SOhY=; b=XlsADXczpAd/Mcs7mNStapL1Xu
	IekIRB9BQMeciOlOwqFQwR04PGLfSg5pvKfnECWaqtFag5kVfC1V4k/0xqdzrtNEQg3TGu9nOeYrO
	7KNt0i9A7IjK/TdiNLujSXSeGVYjdMtJPhoqxnZKGFdDi/bPiVrizRWDJc2ezisXuAzZidzYMsHVg
	fpvJg7AJr13222zTTXWOy/6jK+GbQ4VFgRdBqFfN46NDgSL5YV0iav8heXQmuQRaPDw0iiQvyBVF6
	xO8jHDJyGKOLvN/urSZLrLXgKbIDGUli8DX7y3naLxErCrY6dx6cz77GLHYbQYMTfrd7VOFXpWpad
	4aD6Fz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6j0-0000000D3AM-0uoC;
	Tue, 06 Jan 2026 13:03:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6iy-0000000D3AG-3xnK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDCF66011E;
	Tue,  6 Jan 2026 13:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422ECC116C6;
	Tue,  6 Jan 2026 13:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767704626;
	bh=G1ENUbpw7ERc93thDSpYrQx7X7lw43ebLSgAnTOACjU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g4dWGLt7m4E0SQ9mCzeaUxVahU58dRj5+yK1M0Yi0vcArWGi7BQzL9SNMWUv1FSDj
	 ONUuHss2z35npwgqgbVoKhrcSdjM4c8W6z4sjplOeai6ksuXJsqKxNEXsqlWaK96vD
	 b/2mDe7idva+VdeoIPeAS8YA/k1iKmtqdNk0VCnmTwVNH8DQU15b/VL+4XCHlYEG28
	 fZZ57XcWR6RufesthzzKLMyfKj08QizH2NtOEp8hdcpnAhfbeA+WZA1I0rHcjdtN+y
	 w9aTuteJPU3SP8IQWa4LAcxxdPGQVrtJwLksSMmg/n9megtSVhdYwdjN2kD73VvL16
	 WTCHY3/uG6rbQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
In-Reply-To: <aVXKP8vQ6uAxtazT@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231151216.23446b64.gary@garyguo.net> <aVXFk0L-FegoVJpC@google.com>
 <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local>
Date: Tue, 06 Jan 2026 13:41:33 +0100
Message-ID: <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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

"Boqun Feng" <boqun.feng@gmail.com> writes:

> On Thu, Jan 01, 2026 at 12:53:39AM +0000, Alice Ryhl wrote:
>> On Wed, Dec 31, 2025 at 03:12:16PM +0000, Gary Guo wrote:
>> > On Wed, 31 Dec 2025 12:22:24 +0000
>> > Alice Ryhl <aliceryhl@google.com> wrote:
>> >
>> > > There are currently a few places in the kernel where we use volatile
>> > > reads when we really should be using `READ_ONCE`. To make it possible to
>> > > replace these with proper `READ_ONCE` calls, introduce a Rust version of
>> > > `READ_ONCE`.
>> > >
>> > > A new config option CONFIG_ARCH_USE_CUSTOM_READ_ONCE is introduced so
>> > > that Rust is able to use conditional compilation to implement READ_ONCE
>> > > in terms of either a volatile read, or by calling into a C helper
>> > > function, depending on the architecture.
>> > >
>> > > This series is intended to be merged through ATOMIC INFRASTRUCTURE.
>> >
>> > Hi Alice,
>> >
>> > I would prefer not to expose the READ_ONCE/WRITE_ONCE functions, at
>> > least not with their atomic semantics.
>> >
>> > Both callsites that you have converted should be using
>> >
>> > 	Atomic::from_ptr().load(Relaxed)
>> >
>> > Please refer to the documentation of `Atomic` about this. Fujita has a
>> > series that expand the type to u8/u16 if you need narrower accesses.
>>
>> Why? If we say that we're using the LKMM, then it seems confusing to not
>> have a READ_ONCE() for cases where we interact with C code, and that C
>> code documents that READ_ONCE() should be used.
>>
>
> The problem of READ_ONCE() and WRITE_ONCE() is that the semantics is
> complicated. Sometimes they are used for atomicity, sometimes they are
> used for preventing data race. So yes, we are using LKMM in Rust as
> well, but whenever possible, we need to clarify the intentation of the
> API, using Atomic::from_ptr().load(Relaxed) helps on that front.
>
> IMO, READ_ONCE()/WRITE_ONCE() is like a "band aid" solution to a few
> problems, having it would prevent us from developing a more clear view
> for concurrent programming.

What is the semantics of a non-atomic write in C code under lock racing
with a READ_ONCE/atomic relaxed read in Rust? That is the hrtimer case.


Best regards,
Andreas Hindborg




