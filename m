Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94124CF6BFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UybR8h6LJ7X/dgWxJlHGwPKuKCGXzpl1N/omiIktehk=; b=4f+uPmuSWCUsK4M9OkDXwzo6xf
	WwO0RWfQBKI6yQHzWieT7eir/yh9XslkYylHEOm4LzN6ai7Du+T3JlItdUy4KJGHrbcPbAFA8A9Sk
	/lxJBtmJVUTqyc5YgEkSML2REihqUEOErkK6biAKf1JdnfWJJydpyK2wKxzVBHd9D7vnM98rzk3kg
	8C1o03ah+ko9SNCdtqhqumqjWR/zIomOIdcOLwMp+HCqG2HQusZxnx9BjCA+sbuMp3bi5hva4LNQ5
	b3mDqPE2hQSUUng8W/MFKQzF77ramgCByfvNqTGyDDySPs/ahysn7kaGHs2w5Bh2N+zbyHcIqKjsJ
	8vtRSR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdP8Y-0000000ERoE-3wQb;
	Wed, 07 Jan 2026 08:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdP8Y-0000000ERnd-18uw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 08:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UybR8h6LJ7X/dgWxJlHGwPKuKCGXzpl1N/omiIktehk=; b=fTZpoVptxZ/3tmwLvBwSdnL2AS
	U8jHIbhl6dXo7juEQx0yz8jmkvjflFZRAri/iPtz52WmUV4PJh1G5QVK0fwDIa63YmTM2UPDH41wE
	ie90xZf1RVXoqk1IGR7h81Vh5Ry/LnENCUozWvynA6/m7jt5dyK088VnOJ6YO3WBkxbIGuhgalysk
	m2yF1vWOvcnLJGKQDrY5lG5b3wh3ljIUFHb7tLd8LhhIImdxRfsiBURiOudgppLnXWWlDB2jIlvV8
	iLiZaM/4qqHzpWhlp0xxAoPk4VtKuKOrsVO7iu+l49kvMn+tE/GWHD+oF8byJ5pQqVyYo2V+dPEeI
	oBTcbjmA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdP8V-0000000B0RI-14Mc;
	Wed, 07 Jan 2026 08:43:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 29E43300329; Wed, 07 Jan 2026 09:43:22 +0100 (CET)
Date: Wed, 7 Jan 2026 09:43:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Will Deacon <will@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
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
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
Message-ID: <20260107084322.GC272712@noisy.programming.kicks-ass.net>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com>
 <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local>
 <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
 <aV0JkZdrZn97-d7d@tardis-2.local>
 <20260106145622.GB3707837@noisy.programming.kicks-ass.net>
 <7fa2c07e-acf9-4f9a-b056-4d4254ea61e5@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fa2c07e-acf9-4f9a-b056-4d4254ea61e5@paulmck-laptop>
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

On Tue, Jan 06, 2026 at 10:18:35AM -0800, Paul E. McKenney wrote:
> On Tue, Jan 06, 2026 at 03:56:22PM +0100, Peter Zijlstra wrote:
> > On Tue, Jan 06, 2026 at 09:09:37PM +0800, Boqun Feng wrote:
> > 
> > > Some C code believes a plain write to a properly aligned location is
> > > atomic (see KCSAN_ASSUME_PLAIN_WRITES_ATOMIC, and no, this doesn't mean
> > > it's recommended to assume such), and I guess that's the case for
> > > hrtimer, if it's not much a trouble you can replace the plain write with
> > > WRITE_ONCE() on C side ;-)
> > 
> > GCC used to provide this guarantee, some of the older code was written
> > on that. GCC no longer provides that guarantee (there are known cases
> > where it breaks and all that) and newer code should not rely on this.
> > 
> > All such places *SHOULD* be updated to use READ_ONCE/WRITE_ONCE.
> 
> Agreed!
> 
> In that vein, any objections to the patch shown below?

Not really; although it would of course be nice if that were accompanied
with a pile of cleanup patches taking out the worst offenders or
somesuch ;-)

> ------------------------------------------------------------------------
> 
> diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
> index 4ce4b0c0109cb..e827e24ab5d42 100644
> --- a/lib/Kconfig.kcsan
> +++ b/lib/Kconfig.kcsan
> @@ -199,7 +199,7 @@ config KCSAN_WEAK_MEMORY
>  
>  config KCSAN_REPORT_VALUE_CHANGE_ONLY
>  	bool "Only report races where watcher observed a data value change"
> -	default y
> +	default n
>  	depends on !KCSAN_STRICT
>  	help
>  	  If enabled and a conflicting write is observed via a watchpoint, but
> @@ -208,7 +208,7 @@ config KCSAN_REPORT_VALUE_CHANGE_ONLY
>  
>  config KCSAN_ASSUME_PLAIN_WRITES_ATOMIC
>  	bool "Assume that plain aligned writes up to word size are atomic"
> -	default y
> +	default n
>  	depends on !KCSAN_STRICT
>  	help
>  	  Assume that plain aligned writes up to word size are atomic by

