Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E3BC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3F1LuqqqT/GImPaHY8Z5JFr1IouKO1/vrQjKx3HEb4=; b=vrNRD4vsszwCPHTTwVc9tP0TdY
	XKEPQqpIKsZiVwd+eBKf+RYB0SjCzvEoqCUeknIVyjVnsen3IXnh1PBOrlvgrr6eAUmLNdv2T0Jn5
	XlgoisuMpHskvnsarHknZAms3/bVJ7hkFIBI01Ne1ydpWbDtmdz3t9/DtHi65YWeHRd4qgxoRfSFH
	iRBXQJjcwknFKj7k08AooXqRNZcPE9J1G8iBtU75suF2fCArVYl6uNLKUlvh/5tikjd8kR13Uagky
	3CWSa4V+ubtyP2Uk7WXDapCy487sppZdSdD8arhFSQ083Ww0Gh/sVJP/HY7Rr/XwZF3B9ItdvPjRd
	P2gtmZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokzX-00000005sTu-2Ddi;
	Tue, 28 Jul 2026 16:49:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokzS-00000005sTV-3f1W
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jul 2026 16:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W3F1LuqqqT/GImPaHY8Z5JFr1IouKO1/vrQjKx3HEb4=; b=PL7Ktb8GV+fW9Tly1R/1yIi2n/
	R0N7/Pf0UkJCkqEXpoXOMWGEQKzaqp/Nq6hB9aOgkCYTqsg/ukqDXnWW8IiZQEyJhyV/hyhGm9soE
	YwiPMzvOBctBqB9bSQ8U5lInC7UixqdYqyU0blgnuuEBjdEX/yxKKT8GYnZ4dkvo0k6rIyi0n+eek
	G9ic8s5jFP7/r9DUSaca4u/VbAKzFFN28NLIOhEVUZZ+Oz3cFjGMrrT/EkRo0yerqrCSeMA4LsiTe
	nsesOq8nfyJn22tvGyWUkuKHjZMqQ/jJaOW3kcldKUWTessbFmi2kOVSJz/9ElLGahbOeomiJWI52
	iobwGc5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokzR-0000000DkKs-1Sow;
	Tue, 28 Jul 2026 16:49:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E129C300F47; Tue, 28 Jul 2026 18:49:12 +0200 (CEST)
Date: Tue, 28 Jul 2026 18:49:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260728164912.GK651302@noisy.programming.kicks-ass.net>
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

> > > +#define ____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)			\
> > > +	__DEFINE_ASM_GPR_NUMS						\
> > > +	__DEFINE_ASM_GPR_ALIASES					\
> > > +	"	mov w" off ", #" __VAL_PCPU_GPRS(pcp, off, addr) "\n"	\
> > > +	"	strh	w" off ", " gprs "\n"				\
> > > +	__KERN_ASM_CPU_OFFSET(off) "\n"
> > 
> > Can this macro also generate a readable comment for those few of us
> > building the .i file ?
> 
> Do you mean for __VAL_PCPU_GPRS, or ____PCPU_GPRS_BEGIN() ?

I was thinking BEGIN, but whatever is easiest, the __VAL thing is only
ever used in BEGIN anyway.

> I can happily add comments for either (and the corresponding ENDs).

Not sure the comment makes sense for end, that's simply storing 0 and
seems clear enough.

