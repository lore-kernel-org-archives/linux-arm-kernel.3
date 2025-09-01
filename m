Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EDFCA100D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7aLgN87ZEac08ars72zd0AA23So6Dzql00TJKw/JWw=; b=S65wGfSdlxwnYo0WFLZhZ8Ax2C
	WxUi7WtZCbQBEtUaBm0EvIKSPMjtKgXAWO3WSBCNS2xQmYkxkbX7JVrepzWCi/B/fqX/8kBaVnRSa
	bwySKOcZBYl51gNGv9gAEivi3HynYYjy+87gg6fVgkglH7WV9crUVF2VS7nedV4UnNO1kDVIQ4xuq
	6eWWCvzP1R6jflEOuLPSr3w0l+vXWcamwCFwaRnhKNIUo4tNH69JK7kf9iZIJHcH1UW1mgy4zisUA
	OHYYKYOAGxM2LqTxjSbwZ6DQO+JXq8Sk02izLCt+JYSw2Nfw+XsHecB2o9Ryp5Co05qa6wMOaxKSN
	gkAFf4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6AW-0000000CzGV-1QyY;
	Mon, 01 Sep 2025 15:10:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3dm-0000000CRrp-2zuJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22966601D6;
	Mon,  1 Sep 2025 12:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194E0C4CEF0;
	Mon,  1 Sep 2025 12:28:03 +0000 (UTC)
Date: Mon, 1 Sep 2025 13:28:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Luo Gengkun <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <aLWRUTFeumwr1--E@arm.com>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
 <20250819135008.5f1ba00e@gandalf.local.home>
 <436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
 <20250829082604.1e3fd06e@gandalf.local.home>
 <20250829083655.3d38d02b@gandalf.local.home>
 <aLIFRHcsEo2e2GE7@arm.com>
 <20250829181311.079f33bf@gandalf.local.home>
 <aLLQ-43Ll8rF7kon@arm.com>
 <aLVt30-Lc9lesqS6@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLVt30-Lc9lesqS6@J2N7QTR9R3>
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

On Mon, Sep 01, 2025 at 10:56:47AM +0100, Mark Rutland wrote:
> On Sat, Aug 30, 2025 at 11:22:51AM +0100, Catalin Marinas wrote:
> > On Fri, Aug 29, 2025 at 06:13:11PM -0400, Steven Rostedt wrote:
> > > On Fri, 29 Aug 2025 20:53:40 +0100
> > > Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > valid user address.
> > > > BTW, arm64 also bails out early in do_page_fault() if in_atomic() but I
> > > > suspect that's not the case here.
> > > > 
> > > > Adding Al Viro since since he wrote a large part of uaccess.h.
> > > 
> > > So, __copy_from_user_inatomic() is supposed to be called if
> > > pagefault_disable() has already been called? If this is the case, can we
> > > add more comments to this code? I've been using the inatomic() version this
> > > way in preempt disabled locations since 2016.
> > 
> > This should work as long as in_atomic() returns true as it's checked in
> > the arm64 fault code. With PREEMPT_NONE, however, I don't think this
> > works.
> 
> Sorry, what exactly breaks for the PREEMPT_NONE case?

This code would trigger a warning:

	preempt_disable();
	WARN_ON(!in_atomic());
	preempt_enable();

More importantly, a faulting __copy_from_user_inatomic() between
get/put_cpu() could trigger migration.

> > > I just wanted to figure out why __copy_from_user_inatomic() wasn't atomic.
> > > If anything, it needs to be better documented.
> > 
> > Yeah, I had no idea until I looked at the code. I guess it means it can
> > be safely used if in_atomic() == true (well, making it up, not sure what
> > the intention was).
> 
> I think that was the intention -- it's the caller asserting that they
> know the access won't fault (and hence won't sleep), and that's why
> __copy_to_user_inatomic() and __copy_to_user() only differ by the latter
> calling might_sleep().
> 
> It looks like other inconsistencies have crept in by accident. AFAICT
> the should_fail_usercopy() check in __copy_from_user() was accidentally
> missed from __copy_from_user_inatomic() when it was introduced in
> commit:

I was wondering about that but some code comment for the inatomic
variant states that it's the responsibility of the caller to ensure it
doesn't fault. Not sure one can do other than pinning the page _and_
taking the mm lock. So I agree we should add the fault injection here as
well.

> ... so there's a bunch of scope for cleanup, and we could probably have:
> 
> 	/*
> 	 * TODO: comment saying to only call this directly when you know
> 	 * that the fault handler won't sleep.
> 	 */
> 	static __always_inline __must_check unsigned long
> 	__copy_from_user_inatomic(void *to, const void __user *from, unsigned long n)
> 	{
> 		...
> 	}
> 
> 	static __always_inline __must_check unsigned long
> 	__copy_from_user(void *to, const void __user *from, unsigned long n)
> 	{
> 		might_fault();
> 		return __copy_from_user_inatomic();
> 	}
> 
> ... to avoid the inconsistency.

I think the _inatomic variant should be reserved to arch code that knows
the conditions. Generic code/drivers may not necessarily be aware of
what the arch fault handler does. The _nofault API I think is better
suited in generic code.

-- 
Catalin

