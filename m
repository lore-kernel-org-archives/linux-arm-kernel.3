Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC0DFF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50Hh7cUTPx7OLiiHb2Cd7Al1d1Mbhergb/FOrrMc6dc=; b=bSCMR7x4ftqQ6av5LfXXTO/PQ4
	HQe5Rx3n/g5WrOB0KHgsDHrGtjuI5O8rSMD0XVkoav4v113e+iDqZEKyPHLS6yiqVpO2kg7MWUWxL
	6SE4TntbN8aps3/yW5Aisg77gpPFhE4jEOuK2R9HRmIu7tJjXAQpsfDLmEizKXtLAbYoHOZbTUYtJ
	VFuDycASGHF/5UoBi5ilbcw6E2T8k4/NwQoU+EwkOscO1N82mZURS5Qfpwpz4KnhKmIDsnfbAT2pW
	ezvYGb3OCfLfqiXGen3YiunppcuyX/gBsyM6XI3a22OT++oF147p6L+6HkOWDYsZbFu9hDpUfB09U
	3uE6kLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeAJ-00000000v2o-2HbW;
	Tue, 28 Apr 2026 08:51:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeAI-00000000v2a-0h0j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 849A960141;
	Tue, 28 Apr 2026 08:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF33C2BCAF;
	Tue, 28 Apr 2026 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777366293;
	bh=i+gw1fUS40ohLdc9hars3DbakHqzU1swpdINODPO6os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eXmN98cVMNrCbnHMFjHbGS84RGWKEra7LXonBvzfuwfGmIXZisbJcekgqvKFDgY7L
	 PuUUw/a9cU4yFuq3aiogZuzehQ6GhvTRcFM1+3BateDmaE/2WnyKHzIqzU6f3a11bM
	 cD6k/HarW9MZRR7lSuQtaLOuTMq5NXOwO9m0zI1L6UQFvhJrIYEBCMU5TpXYSjfLaP
	 JuU4TZFger38FLg2yc+xVZTKSd7w5GDTpHloQL4Cw32Lni6JRZLELf98vzQ2XblLEv
	 i1MI8atlgEEo6NOjevfuR77HjT2qhgXnHS82eqxwlvAMae3CoZWlPxWjHGszWEvvtT
	 ibFsXcT1i3h/w==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Dmitry Vyukov
 <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, Florian
 Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, Matthew Wilcox
 <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <20260428073938.GH3126523@noisy.programming.kicks-ass.net>
References: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx> <87jyttz8cf.ffs@tglx>
 <20260428073938.GH3126523@noisy.programming.kicks-ass.net>
Date: Tue, 28 Apr 2026 10:51:29 +0200
Message-ID: <87zf2nxyb2.ffs@tglx>
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

On Tue, Apr 28 2026 at 09:39, Peter Zijlstra wrote:
> On Mon, Apr 27, 2026 at 12:04:48AM +0200, Thomas Gleixner wrote:
>>  static inline void rseq_signal_deliver(struct ksignal *ksig, struct pt_regs *regs)
>>  {
>> -	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
>> +	if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY) && rseq_optimized(current)) {
>
> rseq_optimized() already implies GENERIC_IRQ_ENTRY

Indeed.

>> +			u8			optimized;
>>  			union {
>>  				u16		error;
>>  				struct {
>
> I know you like the 'optimized' name, it is faster etc. However, the
> description there suggests: has_rseq_v2 not be a bad name.
>
> And while I write this, I figured we could have the value of has_rseq be
> 2, rather than 1, but this might end up generating worse code, dunno,
> haven't tried yet.

Tried that early on and it was worse, but back the approach has changed
since then and I just validated that it's actually fine to do so. Fixed.

Thanks,

        tglx

