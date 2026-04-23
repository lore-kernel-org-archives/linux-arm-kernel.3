Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2575FF9936B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGEO2F0ScelrhYb0KLha9yRxuMqwCHKRlDug71W0idc=; b=o1JKW2YKhooDuuN6S8m0Kh+kIo
	4MjI/X78Ey30bvvdV0CmsbEG7i1W3yx1CkOSWTTasNUQflYXf9C2Nl4mVea7lUJiu3bVE1jAoq2lW
	tGb7RVptVxVn6uE6nJy5ykwt1+DBQS4BZ7312JLmCvby7LEmVagASxYENXS19jxQaRrj791T53Okb
	xxvIOUQOH2rIRsgOJdXdsULsaNgl8dswb2vFYGX1ZTFh7ky1IZP4BuOWvStRWp9ETxBsDB0MBJPdm
	tdwzArHHvnj7hDoYazRZNZNB0xz7LK6TZcJ7cqUBy9FKWfTKRRRLMRCASN5HmHn8GQuF+5XnG1hMk
	5PWzsjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrTC-0000000BUgj-3zCG;
	Thu, 23 Apr 2026 10:39:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrTA-0000000BUg8-22JM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:39:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776940777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGEO2F0ScelrhYb0KLha9yRxuMqwCHKRlDug71W0idc=;
	b=AuW1xLgtZm+C8AnaQKzWFF9ZB1yEB+dmq6Pz4OGcKHDgIWWmYYXSJGGFIdfxk7VyzA+Znm
	MQtCwuJoUu5RkUE16EMgFycJkQBRJkQXe6IP0y+ewDd3ag329+5l1zkCDJpwebMtt3om/r
	G0EfMn8H9+BC4sRMaQWQuBNEprFpp3rVgR2wjM/KdPLo/kBaIHHumei7A369z2YjQWlcpm
	NnZM7hbFPGB6YVoBAvSjgFDa19IWRewfsnmZK19tOsxYrporbOnSFtl1vG/hrIUg9a8e4i
	HN2jEdG/NYNTUrH/sqg2G6NvMZvP03wAuIawYNA6eG/67A3CXob8UKH8PGHr2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776940777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGEO2F0ScelrhYb0KLha9yRxuMqwCHKRlDug71W0idc=;
	b=HRXq/PfnQegrvLWQuStXBRMN299tx2QwQeuxH8m0oYNyaMoxm4tb4mGPSv/bPhl2C+9y3s
	551qIyszJd9b2LCw==
To: Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mathias Stearn
 <mathias@mongodb.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake Oler
 <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
Date: Thu, 23 Apr 2026 12:39:36 +0200
Message-ID: <87ik9i0xlj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_033940_666562_1ADEAE2F 
X-CRM114-Status: GOOD (  10.78  )
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

On Thu, Apr 23 2026 at 07:53, Dmitry Vyukov wrote:
> On Thu, 23 Apr 2026 at 03:48, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This part of the rseq man page needs to be fixed as well I think. The
> kernel no longer reliably provides clearing of rseq_cs on preemption,
> right?
>
> https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/rseq.2#n241
>
> "and set to NULL by the kernel when it restarts an assembly
> instruction sequence block,
> as well as when the kernel detects that it is preempting or delivering
> a signal outside of the range targeted by the rseq_cs."

The kernel clears rseq_cs reliably when user space was interrupted and:

    the task was preempted
or
    the return from interrupt delivers a signal

If the task invoked a syscall then there is absolutely no reason to do
either of this because syscalls from within a critical section are a
bug and catched when enabling rseq debugging.

The original code did this along with unconditionally updating CPU/MMCID
which resulted in ~15% performance regression on a syscall heavy
database benchmark once glibc started to register rseq.

Thanks,

        tglx







