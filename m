Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF91CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Foe2CicxDk3WNhkgIZaS9bziagmtWXzImPpSCCMXj9U=; b=xY/pGWAhkbaTL1Z9DZw9Pph8mt
	xrwmuz1bzNxLsb1QkdB7lG7nY6R43aAAtaEara8j3QNvmeA2RvK6zI3Ho+4Fm2LKg0R9JgmzImNSd
	emQgEiTqYNQVsPW+TpqOM8eqHkC4lp2brT71YuMyYurEAqfor4vr6s9kG+KbQwr3HH9dqNTKFzzJ0
	duAWEFtPJDIDxdbZFoJQbpFSyIWrOoITtYSWDBXZvvNUincnsaQat1l//YRCzIw9LycOlIvld3kNC
	gXMEBulyblxKSND3b10vTaDNfihfiAu1rDOQlz6ovBXKJ+n8oTP1H7GZhRi84+qu/twiSzNLekCuB
	R/OYLRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7jF-0000000DLId-1Uje;
	Mon, 01 Sep 2025 16:50:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4G3-0000000Cdee-2kgB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:07:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B37A316A3;
	Mon,  1 Sep 2025 06:07:30 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 314873F694;
	Mon,  1 Sep 2025 06:07:37 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:07:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Luo Gengkun <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <aLWalJm3cdfBS70l@J2N7QTR9R3>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
 <20250819135008.5f1ba00e@gandalf.local.home>
 <436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
 <20250829082604.1e3fd06e@gandalf.local.home>
 <20250829083655.3d38d02b@gandalf.local.home>
 <aLIFRHcsEo2e2GE7@arm.com>
 <20250829181311.079f33bf@gandalf.local.home>
 <aLLQ-43Ll8rF7kon@arm.com>
 <aLVt30-Lc9lesqS6@J2N7QTR9R3>
 <aLWRUTFeumwr1--E@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLWRUTFeumwr1--E@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_060739_777049_11CDE7C4 
X-CRM114-Status: GOOD (  45.67  )
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

On Mon, Sep 01, 2025 at 01:28:01PM +0100, Catalin Marinas wrote:
> On Mon, Sep 01, 2025 at 10:56:47AM +0100, Mark Rutland wrote:
> > On Sat, Aug 30, 2025 at 11:22:51AM +0100, Catalin Marinas wrote:
> > > On Fri, Aug 29, 2025 at 06:13:11PM -0400, Steven Rostedt wrote:
> > > > On Fri, 29 Aug 2025 20:53:40 +0100
> > > > Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > > valid user address.
> > > > > BTW, arm64 also bails out early in do_page_fault() if in_atomic() but I
> > > > > suspect that's not the case here.
> > > > > 
> > > > > Adding Al Viro since since he wrote a large part of uaccess.h.
> > > > 
> > > > So, __copy_from_user_inatomic() is supposed to be called if
> > > > pagefault_disable() has already been called? If this is the case, can we
> > > > add more comments to this code? I've been using the inatomic() version this
> > > > way in preempt disabled locations since 2016.
> > > 
> > > This should work as long as in_atomic() returns true as it's checked in
> > > the arm64 fault code. With PREEMPT_NONE, however, I don't think this
> > > works.
> > 
> > Sorry, what exactly breaks for the PREEMPT_NONE case?
> 
> This code would trigger a warning:
> 
> 	preempt_disable();
> 	WARN_ON(!in_atomic());
> 	preempt_enable();

Ah, you mean in the absence of pagefault_disable()..pagefault_enable().

The page fault handling code uses faulthandler_disabled(), which checks
whether either pagefault_disabled() or in_atomic() are true, and aborts
if either are. Given that, using pagefault_disable() should work fine on
PREEMPT_NONE.

> More importantly, a faulting __copy_from_user_inatomic() between
> get/put_cpu() could trigger migration.

Yep, in the absence of pagefault_disable().

> > > > I just wanted to figure out why __copy_from_user_inatomic() wasn't atomic.
> > > > If anything, it needs to be better documented.
> > > 
> > > Yeah, I had no idea until I looked at the code. I guess it means it can
> > > be safely used if in_atomic() == true (well, making it up, not sure what
> > > the intention was).
> > 
> > I think that was the intention -- it's the caller asserting that they
> > know the access won't fault (and hence won't sleep), and that's why
> > __copy_to_user_inatomic() and __copy_to_user() only differ by the latter
> > calling might_sleep().
> > 
> > It looks like other inconsistencies have crept in by accident. AFAICT
> > the should_fail_usercopy() check in __copy_from_user() was accidentally
> > missed from __copy_from_user_inatomic() when it was introduced in
> > commit:
> 
> I was wondering about that but some code comment for the inatomic
> variant states that it's the responsibility of the caller to ensure it
> doesn't fault.

I think you mean the kerneldoc comment for __copy_to_user_inatomic(),
which says:

| The caller should also make sure he pins the user space address
| so that we don't result in page fault and sleep.

... and I think the key aspect is to avoid the sleeping, and actually
taking a fault (and failing the uaccess) has to be fine, or the _nofault
API (which uses the _inatomic API) is broken by design.

I think the bit about pinning the address space is misleading.

> Not sure one can do other than pinning the page _and_ taking the mm
> lock. So I agree we should add the fault injection here as well.

Cool.

> > ... so there's a bunch of scope for cleanup, and we could probably have:
> > 
> > 	/*
> > 	 * TODO: comment saying to only call this directly when you know
> > 	 * that the fault handler won't sleep.
> > 	 */
> > 	static __always_inline __must_check unsigned long
> > 	__copy_from_user_inatomic(void *to, const void __user *from, unsigned long n)
> > 	{
> > 		...
> > 	}
> > 
> > 	static __always_inline __must_check unsigned long
> > 	__copy_from_user(void *to, const void __user *from, unsigned long n)
> > 	{
> > 		might_fault();
> > 		return __copy_from_user_inatomic();
> > 	}
> > 
> > ... to avoid the inconsistency.
> 
> I think the _inatomic variant should be reserved to arch code that knows
> the conditions. Generic code/drivers may not necessarily be aware of
> what the arch fault handler does. The _nofault API I think is better
> suited in generic code.

I agree. In almost all situations it's better for code to use the
_nofault API.

Mark.

