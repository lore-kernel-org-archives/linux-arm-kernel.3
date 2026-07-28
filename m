Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6E1C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4ihzlddDwnjX93GGNgT73gs0nRUzAN0rmMgM4sElss=; b=aRQ9Gsk6R0YHE6f5CLLoGQSHZm
	xn1Sj6LU+2CKsmecUEEed6S9vXlBCN32zLX9ADAf3/4gDTnBEPLeVZhO+uLN6+Xg/f6dQ5Njy4H8k
	vYcTs1DOf4hqctbSgHjUt2vwSUd64D7iIEgMFLBU12ONwZ4hA35WetDhSHfGxsawYbEFjIS83zobU
	WKQ3uql0cpie4K21TwCWI91bRADQQfqxBCLezPRs3mNwl+PtEvx/8mjEt3i01933Hpf92DpTCZ/AE
	O2TWd2KJM4Phe+V9xJmMq4qZAc9EbP+lzqOXKRGaotA9LMCN1XngjWeItdt9I5C/AwkW+vpoOqxu7
	LUDcqWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokHm-00000005m6V-3dbV;
	Tue, 28 Jul 2026 16:04:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokHj-00000005m5D-130Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 16:04:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F493169E;
	Tue, 28 Jul 2026 09:03:57 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A33B23F763;
	Tue, 28 Jul 2026 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785254641; bh=e9+N00NeQ9x1r37z54aVe+DJvWWs2shWjzXfn8Am9vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5YBB4yEzvF3RdmWrG9x1xwKeAziCFV76kZXwnumQPvwJ39HcBFcmKSjThfUAgH5i
	 43m2HRqQyWkZH6W085Em5SKbA3b2cNQ54HUp/R35Q8NdBxbf0J0xTtpjj444PS3Cf3
	 UjGzL95+YySTLMEtpGNEeU5nTUI3iG8b9e0BGatg=
Date: Tue, 28 Jul 2026 17:03:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <amjS7WOS6psNTXbf@J2N7QTR9R3>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <20260728141958.GV751831@noisy.programming.kicks-ass.net>
 <20260728143016.GB921102@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728143016.GB921102@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_090403_352701_FAACA597 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: vladimir.murzin@arm.com, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 04:30:16PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 28, 2026 at 04:19:58PM +0200, Peter Zijlstra wrote:
> > On Tue, Jul 28, 2026 at 01:38:52PM +0100, Mark Rutland wrote:
> > 
> > > With the scheme added in this patch, this can be compiled as:
> > > 
> > > | <outline_this_cpu_add_u64>:
> > > |        mrs     x2, sp_el0
> > > |        mov     x4, #0xc80
> > > |        strh    w4, [x2, #20]
> > > |        mrs     x4, tpidr_el1
> > > |        add     x3, x0, x4
> > 
> > Which it then recomputes, and so is harmless.
> 
> Here!
> 
> > > | 1:     ldxr    x6, [x3]
> > > |        add     x6, x6, x1
> > > |        stxr    w5, x6, [x3]
> > > |        cbnz    w5, 1b
> > 
> > If we get here and interrupts happens, we recompute pointlessly, no harm
> > done.
> > 
> > Anyway, per this sequence there is no point in ever doing the fixup. So
> > perhaps give a better example?
> 
> Nevermind, brain just wasn't working right, when interrupt happens at
> 'Here!' above, it needs the fixup, irrespective of the atomic type.

Yep!

Note that the atomic type doesn't change things. We need the fixup even
if preemption happens *within* the LDXR...STXR loop, since the inline
sequences branches back to the LDXR, *without* recalculating the addr or
offset, and the fixup *does not* alter the PC.

It's a bit awkaward to spell that out in the commit message without
unrolling the loop :/

Mark.

