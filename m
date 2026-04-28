Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A83FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OaSAgTxjK2QR1QU0n+b0SIWBdszlU+aMsuYQB2OmPg=; b=BHpuMuY4xLW4C0mKBJL+zKui2/
	IYukRTOiZTXmgaLOy/8BDukGrE6OvsiUby11vBLt0xP9LeUMv9lm6SGZJaAcf6XVSgdYJeTsIN616
	AYDhStLal2kx3nKasINKnupl9QzJPazNLsadwMQ0iKD8WxFJPxGzaxL9T3djKP2zexnFQjHDbTJAh
	VWqx4tjuNRlaB+kkONiZiY5Yt3I54dHblpufQ1NPCokJn1dKlEqEzAN4F7/BACjGvOWIlaNR/XHvF
	TPNyPtmnx+khgmYNiyGjbOQrKVpTen5v4ZxesGwFwDRECuSSXW09aW5mTJAHzwJSPo1dtHdNbRmiG
	IWCQNCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQL-00000000qEY-1buG;
	Tue, 28 Apr 2026 08:04:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQK-00000000qDi-0ao0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 08:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3OaSAgTxjK2QR1QU0n+b0SIWBdszlU+aMsuYQB2OmPg=; b=TeID8aFq3/o1MU7dAA0ZD5tQ4e
	sJexAflc0AubSphjKCeh8h+XA92B8ybTs7Jd2NQGp9ap+wkST6tykVFBs3VTiU4lpmCBub2DrOC/j
	RT+ZkfpgNSxXdXAfMPKK/wme/PPAYKCXVFnhNjVWzPluO7vYSkDlC2EcWt1yhPCuS6zxIV9pC2L8Y
	flWWh7ed5kDhru4zofOYYPcIDVjb4fWj/csMrYhgBlb8aCHGfoLI5zpOn86dU+sXRdT6C+3E1tjD1
	SjgSMYAcFLyH+Ky/l9IX9VT5u26fTLI3dxgJWwtbZZJE7Wi4WTe5X8y8DcfjC1KYtWIFP0FVBxIZZ
	ObGgwntQ==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQG-00000002LuV-3bGW;
	Tue, 28 Apr 2026 08:04:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5DB3E301CEB; Tue, 28 Apr 2026 10:03:59 +0200 (CEST)
Date: Tue, 28 Apr 2026 10:03:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>,
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <20260428080359.GI3126523@noisy.programming.kicks-ass.net>
References: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx>
 <87jyttz8cf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jyttz8cf.ffs@tglx>
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

On Mon, Apr 27, 2026 at 12:04:48AM +0200, Thomas Gleixner wrote:

> +Optimized RSEQ V2
> +-----------------
> +
> +On architectures which utilize the generic entry code and generic TIF bits
> +the kernel supports runtime optimizations for RSEQ, which also enable
> +enhanced features like scheduler time slice extensions.
> +
> +To enable them a task has to register the RSEQ region with at least the
> +length advertised by getauxval(AT_RSEQ_FEATURE_SIZE).
> +
> +If existing binaries register with RSEQ_ORIG_SIZE (32 bytes), the kernel
> +keeps the legacy low performance mode enabled to fulfil the expectations
> +existing users regarding the original RSEQ implementation behaviour.
> +
> +The following table documents the ABI and behavioral guarantees of the
> +legacy and the optimized V2 mode.
> +
> +.. list-table:: RSEQ modes
> +   :header-rows: 1
> +
> +   * - Nr
> +     - What
> +     - Legacy
> +     - Optimized V2
> +   * - 1
> +     - The cpu_id_start, cpu_id, node_id and mm_cid fields (User mode read
> +       only)
> +     - Updated by the kernel unconditionally after each context switch and
> +       before signal delivery
> +     - Updated by the kernel if and only if they change, i.e. if the task
> +       is migrated or mm_cid changes
> +   * - 2
> +     - The rseq_cs critical section field
> +     - Evaluated and handled unconditionally after each context switch and
> +       before signal delivery
> +     - Evaluated and handled conditionally only when user space was
> +       interrupted. Either after being preempted or before signal delivery
> +       in the interrupted context.
> +   * - 3
> +     - Read only fields
> +     - No strict enforcement except in debug mode
> +     - Strict enforcement
> +   * - 4
> +     - membarrier(...RSEQ)
> +     - All running threads of the process are interrupted and the ID fields
> +       are rewritten and eventually active critical sections are aborted
> +       before they return to user space.  All threads which are scheduled
> +       out whether voluntary or not are covered by #1/#2 above.
> +     - All running threads of the process are interrupted and eventually
> +       active critical sections are aborted before these threads return to
> +       user space. The ID fields are only updated if changed as a
> +       consequence of the interrupt. All threads which are scheduled out
> +       whether voluntary not are covered by #1/#2 above.
> +   * - 5
> +     - Time slice extensions
> +     - Not supported
> +     - Supported

I'm sure its cute when rendered, but when read as text this is nigh on
unreadable.

> +The legacy mode is obviously less performant as it does unconditional
> +updates and critical section checks even if not strictly required by the
> +ABI contract. That can't be changed anymore as some users depend on that
> +observed behavior, which in turn enables them to violate the ABI and
> +overwrite the cpu_id_start field for their own purposes. This is obviously
> +discouraged as it renders RSEQ incompatible with the intended usage and
> +breaks the expectation of other libraries in the same application.
> +
> +The ABI compliant optimized mode, which respects the read only fields, does
> +not require unconditional updates and therefore is way more performant. The
> +kernel validates the read only fields for compliance. If user space
> +modifies them, the process is killed. Compliant usage allows multiple
> +libraries in the same application to benefit from the RSEQ functionality
> +without disturbing each other.
> +

