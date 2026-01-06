Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DD2CEFCE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7MtjLRkxuXa/oxgkoHv/9IRUda5kTR8D5KCIwmfrHA=; b=LiSecbFj3559SrsXBe3QE6SUQb
	U/E3WCk+j9XQR/IqxySGWGJQ+EC2xpvXBlouAxtJnVbZxGP6/be0SWkT9fiR4p8rXUa0waTdWx4j9
	BNrW/6PfOjyFH3ARCCMKBr6ikQZV5+LXvftMq5JsUHytsL9iAD7OyFhzvlNBMQRJtVtY/2jn45yaJ
	HaELCOKuVBMgic1b1V0S4SUy/Dg0PDYwyXjxnZhOpuAICvUwE0/ZeDLZpn6GmXOyJsjCifocO7ISH
	5I+nov2+qzztOH6a4HtaGSeqgLZsUIYg0NaFs3tjXsLhPE/kPaCzazCEBnJxnmXc1yCsgGGXDp3jQ
	EN97Cw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBdf-0000000Deuz-0372;
	Tue, 06 Jan 2026 18:18:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBdd-0000000Deul-1m5e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7D3F60007;
	Tue,  6 Jan 2026 18:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CC6C116C6;
	Tue,  6 Jan 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767723516;
	bh=bO8klnJTIuS36gg4GjV1n5g1dixU1LM1E0r280+OdQo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=tzz8m5doGvbrAN0e/5sV7Gi9HpRCFgI7iTC1PeibUA7LxcoVnPfYBUSqOrXWcQw/7
	 BN6Y7+O93ECYj7PMpIaSx0SaJmlujXs0QZ+3c6AOlbe55DrUQ49H3bdQ/KSiqm/KnE
	 U7olZ5CxaLUADwizq/DqCqg6hTeFKElqfhepBfMQa/LtVeryxqYO6NNJrwXqZDOaYJ
	 UG4MbWW14RAvx97mXtzBg6kNsiQ1qSmjXr+FryUFE2Ure4eAaWcy4Ly/ENn3yOwGXd
	 tPq5mREwkkbbjWQHiFKqKTTi04flj8/xK0Akn29F9JPrf1xjXtoFBmhBAkye0uetpx
	 INtcG2/fIFNAA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D8D24CE0F95; Tue,  6 Jan 2026 10:18:35 -0800 (PST)
Date: Tue, 6 Jan 2026 10:18:35 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <7fa2c07e-acf9-4f9a-b056-4d4254ea61e5@paulmck-laptop>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com>
 <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local>
 <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
 <aV0JkZdrZn97-d7d@tardis-2.local>
 <20260106145622.GB3707837@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106145622.GB3707837@noisy.programming.kicks-ass.net>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 06, 2026 at 03:56:22PM +0100, Peter Zijlstra wrote:
> On Tue, Jan 06, 2026 at 09:09:37PM +0800, Boqun Feng wrote:
> 
> > Some C code believes a plain write to a properly aligned location is
> > atomic (see KCSAN_ASSUME_PLAIN_WRITES_ATOMIC, and no, this doesn't mean
> > it's recommended to assume such), and I guess that's the case for
> > hrtimer, if it's not much a trouble you can replace the plain write with
> > WRITE_ONCE() on C side ;-)
> 
> GCC used to provide this guarantee, some of the older code was written
> on that. GCC no longer provides that guarantee (there are known cases
> where it breaks and all that) and newer code should not rely on this.
> 
> All such places *SHOULD* be updated to use READ_ONCE/WRITE_ONCE.

Agreed!

In that vein, any objections to the patch shown below?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index 4ce4b0c0109cb..e827e24ab5d42 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -199,7 +199,7 @@ config KCSAN_WEAK_MEMORY
 
 config KCSAN_REPORT_VALUE_CHANGE_ONLY
 	bool "Only report races where watcher observed a data value change"
-	default y
+	default n
 	depends on !KCSAN_STRICT
 	help
 	  If enabled and a conflicting write is observed via a watchpoint, but
@@ -208,7 +208,7 @@ config KCSAN_REPORT_VALUE_CHANGE_ONLY
 
 config KCSAN_ASSUME_PLAIN_WRITES_ATOMIC
 	bool "Assume that plain aligned writes up to word size are atomic"
-	default y
+	default n
 	depends on !KCSAN_STRICT
 	help
 	  Assume that plain aligned writes up to word size are atomic by

