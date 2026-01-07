Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11E8CF6BFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOTgDoBhNMdzi3z1A9Z2+FORb7HFHRG/+HJpEV/ok1g=; b=GBD7KaI8sYsnCJzXJA9+TMYBFU
	FejijWDrnun0uXQPVJ7F5KS/XsvaQ9HMMSzYxvBymXbj/IN/b8HXsfrYsJDtfEzIaF32Mnie2jqZG
	mvmVuMi8tSgkemeEOfa7mcsPbyOAhFTOOiWsV8SiFPYaUurzCc1NjJ4WwugW5MYzoNp5VCwY2n5De
	yv7P8vHpIyjIA6zb43uGcElPg1GhvwzP6qrT9oAHCGVH6F6LqdbB8KCh5rISHN/YAV04tls9wrfkv
	KrV1nnrhJtNju5q3P3Xm7KIetZTrPAhomBKFulqZBHDfa7HfEFNAfN231qv/u0Ke3tFChhZf4ItTv
	pO/mZ0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOyy-0000000EQYq-1Je8;
	Wed, 07 Jan 2026 08:33:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOyx-0000000EQYR-1Hwl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 08:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JOTgDoBhNMdzi3z1A9Z2+FORb7HFHRG/+HJpEV/ok1g=; b=m8ClonE8SiqkHzbifDO+8o7toM
	2EgeQurGzjarlRA5KjwgkUjrroYRQJR7ZBml5WG6UC4Pkc8KuvDXqKovGCvXCY+JHx1ASTpLuXVBj
	AElKdNr/nykpwNKDKPRC70RyBq/ZxonicWL40WWXyukyJlrEgzhh85EuYOv+jG/54OAOnyR+Grejl
	ZPB2lD83x55AEGDX/alzAM9BiMjlF1FK5iWKmg9sGyqKC9GL4uKSrEOWDaLqPqZXko8fiiT9Dp34H
	lZwA6D0bIbgeRLtD50ONkxTVXrDVSaNGKCVMlLdohuXF9L/AzvDDY8DQClFhh2XIkdcxQ9AlDJ2Kq
	i5N7FD5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOyu-0000000D7oI-319K;
	Wed, 07 Jan 2026 08:33:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 696B3300329; Wed, 07 Jan 2026 09:33:27 +0100 (CET)
Date: Wed, 7 Jan 2026 09:33:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Will Deacon <will@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <20260107083327.GB272712@noisy.programming.kicks-ass.net>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-3-702a10b85278@google.com>
 <20260106124326.GY3707891@noisy.programming.kicks-ass.net>
 <20260106181201.22806712.gary@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106181201.22806712.gary@garyguo.net>
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

On Tue, Jan 06, 2026 at 06:12:01PM +0000, Gary Guo wrote:
> On Tue, 6 Jan 2026 13:43:26 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:

> > Does this hardcode that sizeof(_Bool) == 1? There are ABIs where this is
> > not the case.
> 
> Hi Peter,
> 
> Do you have a concrete example on which ABI/arch this is not true?
> 
> I know that the C spec doesn't mandate _Bool and char are of the same size
> but we have tons of assumptions that is not guaranteed by standard C..

Darwin/PowerPC famously has sizeof(_Bool) == 4

Win32: Visual C++ 4.2 (and earlier) had sizeof(bool)==4 (they mapped
bool to int), while Visual C++ 5.0 introduced a native _Bool and moved
to 1 byte.

Early RISC CPUs (MIPS, PowerPC, Alpha) had severe penalties for byte
access and their compilers would've had sizeof(bool)=={4,8}.

I think AVR/Arduino also has sizeof(bool) == sizeof(int) which is 2.



