Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A61098783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLLFjsvRlpzhP+3Wz85TDLwtJtc8fpi1Gf2qGKkrHqs=; b=lWRGimWL2QmX7F6a4NxBsjPGKk
	hSyv7YcyBbwYHgl3neeXESd4ciGItOIzcKUoVmVEr+ic7y8C7vGVQUCLcSYa3Bif9l3I44CE4yunu
	zg7mLjL1yfIlu5EquSjzkiGJV50Jcm5frLWYhnYoLT0B+LlYP8cAKhr55ifxU6pc2am1S254lWA5x
	gyCdK1eQCoCT9xWeNUIywaIihS8qucUglfwC2c88N1qhO2UzAf3URpfuz5OjXZrxWJ8DCWTbdxe6B
	XebBN+3Kjn4xQHyzxEh22IXXGy9Mh3Pqtnov5YCwTXibp1NUHEYjsz8N8IaQDnm7irby1qRZM0olH
	JQklTbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZWo-0000000CpBT-43iY;
	Fri, 20 Mar 2026 13:04:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZWo-0000000CpBH-0wSm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 13:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fLLFjsvRlpzhP+3Wz85TDLwtJtc8fpi1Gf2qGKkrHqs=; b=SvyBwp5ApwHiEK8M0YI3p19AUM
	zphXuCAn1AoMIGi1mV0g2H3OTWbWx+bo2el6YPv60Zns2J5GeeQcF0/3nTcjmhS+ddus99B+HNF72
	snVp8nqsN6yTiK4gz7I74Z2XKLHqKumX/pAWEDBfYnuDBKiwa86hrKfy1c/yIs39PojKnNxifW5Xz
	n+45VOys0vR92zfE0ZW+BQvtWAFkOOaj4Khx+kqbFo7+R41/My7JFhsbCc+RsiYaC8NHeaFpyARdP
	PehOnfNDPsLjKVtWdK3bvOUQVkhvAvyPkhCulN20yNvVKuBy5p2NiP8modfC3yEAlsBq8273DHk94
	I+6jpzZg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZWl-0000000FZwe-1OqY;
	Fri, 20 Mar 2026 13:04:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 587203004F8; Fri, 20 Mar 2026 14:04:33 +0100 (CET)
Date: Fri, 20 Mar 2026 14:04:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320113026.3219620-2-mark.rutland@arm.com>
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
Cc: vladimir.murzin@arm.com, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 11:30:25AM +0000, Mark Rutland wrote:

> Thomas, Peter, I have a couple of things I'd like to check:
> 
> (1) The generic irq entry code will preempt from any exception (e.g. a
>     synchronous fault) where interrupts were unmasked in the original
>     context. Is that intentional/necessary, or was that just the way the
>     x86 code happened to be implemented?
> 
>     I assume that it'd be fine if arm64 only preempted from true
>     interrupts, but if that was intentional/necessary I can go rework
>     this.

So NMI-from-kernel must not trigger resched IIRC. There is some code
that relies on this somewhere. And on x86 many of those synchronous
exceptions are marked as NMI, since they can happen with IRQs disabled
inside locks etc.

But for the rest I don't think we care particularly. Notably page-fault
will already schedule itself when possible (faults leading to IO and
blocking).

> (2) The generic irq entry code only preempts when RCU was watching in
>     the original context. IIUC that's just to avoid preempting from the
>     idle thread. Is it functionally necessary to avoid that, or is that
>     just an optimization?
> 
>     I'm asking because historically arm64 didn't check that, and I
>     haven't bothered checking here. I don't know whether we have a
>     latent functional bug.

Like I told you on IRC, I *think* this is just an optimization, since if
you hit idle, the idle loop will take care of scheduling. But I can't
quite remember the details here, and wish we'd have written a sensible
comment at that spot.

Other places where RCU isn't watching are userspace and KVM. The first
isn't relevant because this is return-to-kernel, and the second I'm not
sure about.

Thomas, can you remember?

