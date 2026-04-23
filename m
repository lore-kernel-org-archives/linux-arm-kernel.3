Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC885FDEE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tpjgevItmZWHyXhcU5jFIBGFFYCU+tf9QIwT3/y5a8=; b=z5HsjqHbK+2wamalsFDoZdpgKW
	S/0EK49yF7aSLdCiNQxNq8WhIaQ0l9esw1Nbpvj2MuOTcM4G/Xrie/jvjn3JMoKsqbr67qh3HMWd2
	+p/akklawpVQFbb/XYAZtnao6eAxbn24vzP00Bodcq3Rblggt7kLjzbxXwNiMYC8eGw03ZyV/77L/
	eAyHt271HHFjxHiMTRIXr42G5T/QHw6tuqmjvoi8S3GmdxAENbSVMNQLj3HnLghobVYBJ8jroPUYi
	ef1dza76+u2/PH7dEUWDHGsjxwy/7+06Aj+tcTmjK3rbPbwDXSFZnA1qtlAAZ/nE/rfEZAaElN7/P
	SNkhlpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzAx-0000000C975-0v1o;
	Thu, 23 Apr 2026 18:53:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzAv-0000000C96k-0WRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:53:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E91D1BF3;
	Thu, 23 Apr 2026 11:53:14 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002943F641;
	Thu, 23 Apr 2026 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776970399; bh=+tpjgevItmZWHyXhcU5jFIBGFFYCU+tf9QIwT3/y5a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulWfGaN3+aq1cLh0S77kH9MggoFAWGBM6EKH6BgVfYZSW07gnEEz/dSL6/PM5ZY4P
	 je9sR3D0H86PUpfmRS/PECX+9rIMWiO3GNhvt+WPpKxo/NFV/rZL57yXwRChOwvb0p
	 P1fECuvsJZtfVJiCjeBJvTLrK5yqgybSR3PXzoLY=
Date: Thu, 23 Apr 2026 19:53:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Mathias Stearn <mathias@mongodb.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <aepqMqPLE5b2FE-B@J2N7QTR9R3>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
 <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_115321_206335_C8DF1832 
X-CRM114-Status: GOOD (  11.39  )
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

On Thu, Apr 23, 2026 at 10:41:02AM -0700, Linus Torvalds wrote:
> On Thu, 23 Apr 2026 at 10:19, Thomas Gleixner <tglx@kernel.org> wrote:
> I see some patches flying around, but am not clear on whether there
> was an actual patch that make this work again?

There's not a patch yet.

The diffs sent so far were options for fixing the arm64-specific issue
(missing aborts on preemption), NOT the generic issue (missing
clobbering of cpu_id_start that tcmalloc was depending upon).

For the arm64 issue, I think we can have a fix tomorrow (as it's end of
day here in the UK). Now that I've pored the entry code and the rseq
code, I think a variant of one of Thomas's proposed fixes will work, but
I'd like to make the naming/layering crystal clear so that it's harder
to break this by accident in future.

For the generic issue, hopefully the option Mathias proposed (clearing
cpu_id_start when rseq_cs is cleared) is sufficient. I'll work with
Mathias and Thomas for that.

I've also poked folk to make sure that CI systems run the rseq selftests
(which they evidently weren't), so that we catch this sort of thing
earlier.

Mark.

