Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2E9CE9D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F++X+waLmj9d+5eJ7s+Pnye5YZ3oIpFoEnARYztMaTU=; b=mqHRWyE+hCG4PP0DmSnQr1srWn
	DnZROOwq7+uKEHt9C+nyf3O9t9gV8O+JYEDaFQ9NbDocVZ8BKKiXkWsA1brGmSyPEtw6o/O2mUdXU
	oetXfO94FXAXgn2SXXMlamJRiYlBAdwAsSQqsRpZYJXzbhK++xGH2159aQJZE2OEi58AjhxA+JTwC
	hKl1/V3t3H4zmgUbhTOMxAUrtJ5EO1JyhGDwe24QgY2r+a8mfpQDbd6F3wJUXGymInF81bmPwMmcj
	PV2ShtfuCN+1qmt72oD8/7ZRdrBwHHG8Wv8NLKE6Fetc6TSMK8qO+qpQvjTxbkyr+vpy2oO6EkEY8
	Chnf8w2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Ty-0000000DLbx-2vXQ;
	Tue, 06 Jan 2026 14:56:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Ty-0000000DLbk-1MQ1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Jan 2026 14:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F++X+waLmj9d+5eJ7s+Pnye5YZ3oIpFoEnARYztMaTU=; b=bjHvd4AchX4OX8btHy3c3ti0E5
	XWujH7TztZmJyVjlONn5y71LDgfkcktFr0sinUGsypZwk/GUVna+Y7uMEwBz9AuqYd3k8AuJAf9hn
	NvLtdAGw5LES1uKJxpe/fNY0O5h9yBc2ToLxQa3pR8vtdS+F9l2IeqnOpHrBD2iKOWIwJQB1BBrx4
	b7KTF5tOfUEONpp8MsqyTKoLhfDnU5nuE8REZm1bugTHwhKvawElhw4q/x5HKbeDnvcqTHipyia+t
	Uo8yDnf4EThWU4Ge3KcULO3c0bMFvzkKzc199VwrTVJc/4uiyRjj1g3NUb8wtIxm99vaBZVe56v/7
	UCHPmwCg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Tv-00000009uwx-2Ndu;
	Tue, 06 Jan 2026 14:56:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 15B0030056B; Tue, 06 Jan 2026 15:56:22 +0100 (CET)
Date: Tue, 6 Jan 2026 15:56:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
Message-ID: <20260106145622.GB3707837@noisy.programming.kicks-ass.net>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com>
 <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local>
 <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
 <aV0JkZdrZn97-d7d@tardis-2.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV0JkZdrZn97-d7d@tardis-2.local>
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

On Tue, Jan 06, 2026 at 09:09:37PM +0800, Boqun Feng wrote:

> Some C code believes a plain write to a properly aligned location is
> atomic (see KCSAN_ASSUME_PLAIN_WRITES_ATOMIC, and no, this doesn't mean
> it's recommended to assume such), and I guess that's the case for
> hrtimer, if it's not much a trouble you can replace the plain write with
> WRITE_ONCE() on C side ;-)

GCC used to provide this guarantee, some of the older code was written
on that. GCC no longer provides that guarantee (there are known cases
where it breaks and all that) and newer code should not rely on this.

All such places *SHOULD* be updated to use READ_ONCE/WRITE_ONCE.

