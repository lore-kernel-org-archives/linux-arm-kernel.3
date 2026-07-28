Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659E4C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOJiIG7Fzg5mQgt2+0WpqlAAuSEAOA6dEC8aqhbkyUU=; b=yeBoH+UQWKiVzJj2M4G2aW+rNX
	IsS2j11Vwl5J8bosV6WwVVi8TOQRrn5ZPmrjSC6qaAZDVqAGTQbL3krtvIQSx/hEeZ3ISaefqKQRQ
	d8ubzU+IlW5XLMy9Juraorv1slGqrnWYkLBFLG4iOcC2gpy6kQrDjnhUEoBFgGB2HJL0mMYHUg/5E
	ZjxTk/i8L5P3HDwB/duvuICtzamimkAuPeyTBzH/iBYVucISju0JJvuIqCqVbunEixCYc6XRMtB+B
	c2JYpOugDcIpsAq/uU5gPoEp5GIF/LjCutXcRfLoDIqz13rdA64oukwdyZ4F01glOo7d6IZBOyq0a
	eRHvHvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokwu-00000005s2O-0NPI;
	Tue, 28 Jul 2026 16:46:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokws-00000005s2B-3cSG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jul 2026 16:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WOJiIG7Fzg5mQgt2+0WpqlAAuSEAOA6dEC8aqhbkyUU=; b=t+Fzad79Zr3+vQ5enAj2UuD4Z2
	MSNUb4jwdnqiovZoMCG1mSIL7wkV8hm5ZyGS/9d3SpzFNitK866IYTAUHbTKp3iL9zOfGSSboz1gA
	bH/XINUktpJVpzIgzMywAS/abnygxGhCj3OhA1T4masB0gPArxqsp4++flvFS0NeamguQ6olDDGTM
	CQYKUg3Xv5mBogLXZ2Ue+i6snZx+xh0J1ywv5xeQmXP0d+np3qKdhrIhT9D53CEWIxKMv/euXnDlo
	es6wwn10Usq7YRl+bSxYnvbaI7dFHiirWO7ndYWEfYUXAHRTmQwmlRLnTcU74gWQ2b0Nj7dYNpnh/
	EQCuwVkA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokwq-0000000Dk2O-2xUK;
	Tue, 28 Jul 2026 16:46:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C7FF1300969; Tue, 28 Jul 2026 18:46:31 +0200 (CEST)
Date: Tue, 28 Jul 2026 18:46:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260728164631.GJ651302@noisy.programming.kicks-ass.net>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <20260728141958.GV751831@noisy.programming.kicks-ass.net>
 <amjQkPyNAsFRJF9I@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjQkPyNAsFRJF9I@J2N7QTR9R3>
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

On Tue, Jul 28, 2026 at 04:53:52PM +0100, Mark Rutland wrote:

> I was being lazy here relative to what we do for asm-extable.h. How
> about I match the pattern there, and have:
> 
> | #define PCPU_GPR_PCP_SHIFT              0
> | #define PCPU_GPR_PCP                    GENMASK(4, 0)
> | #define PCPU_GPR_OFF_SHIFT              5
> | #define PCPU_GPR_OFF                    GENMASK(9, 5)
> | #define PCPU_GPR_ADDR_SHIFT             10
> | #define PCPU_GPR_ADDR                   GENMASK(14, 10)
> | 
> | #define __VAL_PCPU_GPRS(pcp, off, addr)                                                 \
> |         "("                                                                             \
> |                 "(.L__gpr_num_" pcp  " << " __stringify(PCPU_GPR_PCP_SHIFT) ") | "      \
> |                 "(.L__gpr_num_" off  " << " __stringify(PCPU_GPR_OFF_SHIFT) ") | "      \
> |                 "(.L__gpr_num_" addr " << " __stringify(PCPU_GPR_ADDR_SHIFT) ")"       \
> |         ")"
> 
> ... if that's any better?

#define PCPU_GPR_BITS			5
#define __PCPU_GPR_MASK(_shift)		GENMASK((_shift+PCPU_GPR_BITS-1), _shift)

#define PCPU_GPR_PCP_SHIFT              (0*PCPU_GPR_BITS)
#define PCPU_GPR_OFF_SHIFT              (1*PCPU_GPR_BITS)
#define PCPU_GPR_ADDR_SHIFT             (2*PCPU_GPR_BITS)

#define PCPU_GPR_PCP 			__PCPU_GPR_MASK(PCPU_GPR_PCP_SHIFT)
#define PCPU_GPR_OFF 			__PCPU_GPR_MASK(PCPU_GPR_OFF_SHIFT)
#define PCPU_GPR_ADDR 			__PCPU_GPR_MASK(PCPU_GPR_ADDR_SHIFT)

?

