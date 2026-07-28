Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B351C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eREpMj0ZZmpeGZqK2GLG6vzrtOqbxwprWLJjDDFIcSQ=; b=jBiQrIFZ58EUeyv+U0FNjt7nGi
	Ik1qACkSa5P1FbEE3fwg4o/o47s/eXq6FCkGaxu87H0AeqjOVZ14FjT2Crzq/CydybWUcr10u0Zb6
	ftTSXpTP/ct47CKiGr7c6Jc4R+oiY3WGoDimuMtsaIqOLBJffSMpOBCIV3SZw7eWIXECrssOvAoc4
	B1Eg+Tk7gQaYYXZxuWBmI+IKtRx89puC1jKY8WoX3EiCmZpHjdJJupXBXsVJLlBDg9TOVJR0jdT5f
	nzRuPfqqnOvk4iWeh5MAEc9gz2Q4DpX4pKX60DCxTp/g6LJigXju+QxMpps1ChqmRns+Sb1GZ7agn
	KoyrNTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wol04-00000005sZy-2hmV;
	Tue, 28 Jul 2026 16:49:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wol03-00000005sZN-1cvg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jul 2026 16:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eREpMj0ZZmpeGZqK2GLG6vzrtOqbxwprWLJjDDFIcSQ=; b=dv71xeQIT8W+FkLfel+kKQ8cPc
	0+xy6sc0BZQWN4cv+DAI24coDA2xBZSN6D2EbRglDYlCcoN4Dgx+Dhma5+f8ksx1uEQyLcoA/EFH7
	E448fKoaZbDJnQ+tG7bXSQIxh5sk1S0Ytv33fKsZHttWj3QQnJs4+o6EpmVfSLzfTEq0Wn87+DiGP
	+d++aedaRnxjfPHTpqAdJvLnUOTHEvLWNC8r11m80YqaNlNp6lMR7vCk2m3mARMIo84zmm+tDafyx
	u9em41/FxtXRgcfalQBUdlrqKJ2WAzvBRKvk1vqLCkCVe2LGbQc7cuyt6anGXgZKIkDMSBAu/Yi0i
	em4wpVxw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wol00-000000058Et-3Rgs;
	Tue, 28 Jul 2026 16:49:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 96EF13011E4; Tue, 28 Jul 2026 18:49:47 +0200 (CEST)
Date: Tue, 28 Jul 2026 18:49:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260728164947.GL651302@noisy.programming.kicks-ass.net>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <20260728141958.GV751831@noisy.programming.kicks-ass.net>
 <20260728143016.GB921102@noisy.programming.kicks-ass.net>
 <amjS7WOS6psNTXbf@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjS7WOS6psNTXbf@J2N7QTR9R3>
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

On Tue, Jul 28, 2026 at 05:03:57PM +0100, Mark Rutland wrote:
> On Tue, Jul 28, 2026 at 04:30:16PM +0200, Peter Zijlstra wrote:
> > On Tue, Jul 28, 2026 at 04:19:58PM +0200, Peter Zijlstra wrote:
> > > On Tue, Jul 28, 2026 at 01:38:52PM +0100, Mark Rutland wrote:
> > > 
> > > > With the scheme added in this patch, this can be compiled as:
> > > > 
> > > > | <outline_this_cpu_add_u64>:
> > > > |        mrs     x2, sp_el0
> > > > |        mov     x4, #0xc80
> > > > |        strh    w4, [x2, #20]
> > > > |        mrs     x4, tpidr_el1
> > > > |        add     x3, x0, x4
> > > 
> > > Which it then recomputes, and so is harmless.
> > 
> > Here!
> > 
> > > > | 1:     ldxr    x6, [x3]
> > > > |        add     x6, x6, x1
> > > > |        stxr    w5, x6, [x3]
> > > > |        cbnz    w5, 1b
> > > 
> > > If we get here and interrupts happens, we recompute pointlessly, no harm
> > > done.
> > > 
> > > Anyway, per this sequence there is no point in ever doing the fixup. So
> > > perhaps give a better example?
> > 
> > Nevermind, brain just wasn't working right, when interrupt happens at
> > 'Here!' above, it needs the fixup, irrespective of the atomic type.
> 
> Yep!
> 
> Note that the atomic type doesn't change things. We need the fixup even
> if preemption happens *within* the LDXR...STXR loop, since the inline
> sequences branches back to the LDXR, *without* recalculating the addr or
> offset, and the fixup *does not* alter the PC.
> 
> It's a bit awkaward to spell that out in the commit message without
> unrolling the loop :/

Fair enough.

