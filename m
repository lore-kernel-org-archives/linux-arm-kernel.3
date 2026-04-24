Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2543CFED3FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+rliU4cCrurJTfrKWYSNMc97AT2PbQ8kt0LrYzMJys=; b=HJutWqnyCY1lOMTA5EpePohHY5
	yOPoiEekeQl4gTAKV/2B5tOtUk4IefMuoO08c0rlhtV6nl8t/v3hhAtzRP5B7zlXisM5GYVMqyjDp
	xhmg6rFIsU8NEEEiqfwt8DoFdL8yKjAXK07W/Pn4CFQxPIHOc4rWwZbAOouc9P3IdT5xHEdAbldBi
	JZreZ8a6ApwlUeFrlhcz5bNijXWuGPMT4ZOuxJ7xY1xb3SybcWHRi/h43AM0kfrrjxTgIcOpqB7QI
	hirZCmPr21VIfmVotRW1cK7eMn6Jhcnhnel59Wn+B+p/YuQ6zThMKohChNnZ3KNMR4S62i4M1qLvm
	PwZE/J5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMRt-0000000Di7W-27Bu;
	Fri, 24 Apr 2026 19:44:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMRq-0000000Di7A-1ip0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 19:44:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777059857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+rliU4cCrurJTfrKWYSNMc97AT2PbQ8kt0LrYzMJys=;
	b=4RH1XcFRCUI4pUKFbbaE2ynLn8NOaT602kfQD31J3RDvJfJo7XD92FNpJWLLlcewr0T0mx
	vN065gMMtlaUbKpjo3gXmlXENzp23fTKmDuJxX9zay6l/eNhSStIrom9wHBQBfbpJhHUA1
	n1WNq9N84pxe7o/+aHeImeRSB/w6hav2SbDOfsSgxSIfr/h2nypcGrNEJ6dmcmcKyN/V6z
	rijeVmFkNDQY6InHkE5L5GhmFG5i2y1E9RO2nJwnNqaelod8gOb4/N9/+AJiTaWHK5f013
	w/eRZCDT3NHFxYWTwvBUMPhyE9BD8eLGG77wcpWUwsrikwt4aL2/Kd6ACssj7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777059857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+rliU4cCrurJTfrKWYSNMc97AT2PbQ8kt0LrYzMJys=;
	b=iqLfAh0zDX4+KsEUDE175S10unwiIU8nPBL256ZhVyzK9+tvLFrNWGmxv0kvMxKW1j2tRu
	GSek67fxRGEDh5BQ==
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Dmitry Vyukov
 <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <20260424150318.GE641209@noisy.programming.kicks-ass.net>
References: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
 <87wlxy22x7.ffs@tglx> <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
Date: Fri, 24 Apr 2026 21:44:16 +0200
Message-ID: <87se8kywhb.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_124422_591568_CC95A852 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 24 2026 at 17:03, Peter Zijlstra wrote:
> On Fri, Apr 24, 2026 at 04:16:08PM +0200, Thomas Gleixner wrote:
>> > I was really hoping that we would only need to do the "redundant"
>> > cpu_id_start writes would only be needed on membarrier_rseq IPIs where
>> > it really is a pay-for-what-you-use functionality,
>> 
>> That's fine and can be solved without adding this sequence overhead into
>> the scheduler hotpath.
>
> Something like so? (probably needs help for !GENERIC bits)

Yes and yes :)

Let me stare at that !generic tif bits case.


