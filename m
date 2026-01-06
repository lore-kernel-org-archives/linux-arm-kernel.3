Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB3BCDC192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRMkA/Ca563y0+dy1t5I/0e9W9y6rU2HQmmd09ZD4+8=; b=mh5NxDbYAIM/Y2R2m2Q5ofJlIA
	SCg6+/2cJvWPSL6xVdcoJj68UetSy9KHpb/gFUDVZRyLo2zS52Rf2X4+zMfalPBUPrrEsQ3SSyjk9
	OnSLqwi0IkQV9fHo0QQYQF43Xx4bBd+Zjt1Xw48LLJwe8sk86n06p0jQh+B1N3jWquwuPHenM0S06
	elnQDc5wMO5DBexFBn4Px93Oc1hK/9dihMK1CDBJpSBsLNvS+IuT6lPzi+ygf71DWjt+aylxUiubU
	3oW2uA0F7nwvptOCiomSNRiUJqQxjol4aS3JNeeWIj8YxwmYeYIsJOaGqM/HmmquMFFDyxb9ZomfH
	AkxrwiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6PL-0000000D17N-2Nle;
	Tue, 06 Jan 2026 12:43:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6PK-0000000D17H-12aq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Jan 2026 12:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oRMkA/Ca563y0+dy1t5I/0e9W9y6rU2HQmmd09ZD4+8=; b=fF8x1implaMTwmDC1WueQdrygX
	hcp2Jzf/RJx5Vzset7UUh3RO0L/rISk8A28NzSvDhKtM+KuzehXVbdI6XKw1XyKJ9zk99lU9ACzmz
	ps1tMiWLfwcFAuz1KVztHAKzPhJY77fcfFUiYzYoge4bvvx9pKlRj4h+FfrbuhZMvhsy11PXQNACB
	e+9UYVgjmYoMI/Gnx+rjnEq2YOn0ecUTgl4m7qpqMsbThPBPAG6n+3vDgQz3LBhrNiALCbrFmxVTu
	AynL8hzMi0+ECj6C1VSYyxSUJTWMGVt0W/9ccLrJLC90FS97UHXrepDcMzj9P48L3wT/3enG9ZnSs
	uVWcN5zA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6PH-0000000BmZ5-1z2W;
	Tue, 06 Jan 2026 12:43:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D77630039E; Tue, 06 Jan 2026 13:43:26 +0100 (CET)
Date: Tue, 6 Jan 2026 13:43:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/5] rust: sync: support using bool with READ_ONCE
Message-ID: <20260106124326.GY3707891@noisy.programming.kicks-ass.net>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-3-702a10b85278@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-rwonce-v1-3-702a10b85278@google.com>
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

On Wed, Dec 31, 2025 at 12:22:27PM +0000, Alice Ryhl wrote:
> Normally it is undefined behavior for a bool to take any value other
> than 0 or 1. However, in the case of READ_ONCE(some_bool) is used, this
> UB seems dangerous and unnecessary. I can easily imagine some Rust code
> that looks like this:
> 
> 	if READ_ONCE(&raw const (*my_c_struct).my_bool_field) {
> 	    ...
> 	}
> 
> And by making an analogy to what the equivalent C code is, anyone
> writing this probably just meant to treat any non-zero value as true.
> 
> For WRITE_ONCE no special logic is required.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/sync/rwonce.rs | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/rust/kernel/sync/rwonce.rs b/rust/kernel/sync/rwonce.rs
> index a1660e43c9ef94011812d1816713cf031a73de1d..73477f53131926996614df573b2d50fff98e624f 100644
> --- a/rust/kernel/sync/rwonce.rs
> +++ b/rust/kernel/sync/rwonce.rs
> @@ -163,6 +163,7 @@ unsafe fn write_once(ptr: *mut Self, val: Self) {
>  // sizes, so picking the wrong helper should lead to a build error.
>  
>  impl_rw_once_type! {
> +    bool, read_once_bool, write_once_1;
>      u8,   read_once_1, write_once_1;
>      i8,   read_once_1, write_once_1;
>      u16,  read_once_2, write_once_2;
> @@ -186,3 +187,21 @@ unsafe fn write_once(ptr: *mut Self, val: Self) {
>      usize, read_once_8, write_once_8;
>      isize, read_once_8, write_once_8;
>  }
> +
> +/// Read an integer as a boolean once.
> +///
> +/// Returns `true` if the value behind the pointer is non-zero. Otherwise returns `false`.
> +///
> +/// # Safety
> +///
> +/// It must be safe to `READ_ONCE` the `ptr` with type `u8`.
> +#[inline(always)]
> +#[track_caller]
> +unsafe fn read_once_bool(ptr: *const bool) -> bool {
> +    // Implement `read_once_bool` in terms of `read_once_1`. The arch-specific logic is inside
> +    // of `read_once_1`.
> +    //
> +    // SAFETY: It is safe to `READ_ONCE` the `ptr` with type `u8`.
> +    let byte = unsafe { read_once_1(ptr.cast::<u8>()) };
> +    byte != 0u8
> +}

Does this hardcode that sizeof(_Bool) == 1? There are ABIs where this is
not the case.

