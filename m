Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14EECA1001
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQUnw+Sdz0PcD5v/qZdgAYAMyHrJUo8RlG16Ax/TAcQ=; b=WXdcZGX64qRBQjPx0veJZcn3np
	mRQO4TqEsDJaOgxrtNRMHWHTIDvc70nNfmQSwoA30oohCbVa6UI+Kgead+YTOBviC4MKJmAycmepQ
	HrmDkw3jAX4mmqm8FZNxWkGBGcnImsAXIe6GkM1onLr+OFwHBCqFRMsfFf7SupJClWJMQhutjCcpg
	3g8xXRNkKE/1J1Vra8RjxFnYSYOGH2UjBxaboKURbkklg4rN+hVWhmYbaGYY8PdsQaY2S+5NXL2A5
	cX+L2HLDH+Zzoz8Go3iNz7hLK9eTPMdepId6ypNSsjBSZZ3XRCdbtsjNoC+WNrBz4rVWy+PcWwy3a
	awmiBSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oE-00000007C6h-1FfJ;
	Sat, 30 Aug 2025 00:51:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5AQ-00000006oIX-2jbs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 19:53:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AE6A60142;
	Fri, 29 Aug 2025 19:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BD8C4CEF0;
	Fri, 29 Aug 2025 19:53:42 +0000 (UTC)
Date: Fri, 29 Aug 2025 20:53:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Luo Gengkun <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <aLIFRHcsEo2e2GE7@arm.com>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
 <20250819135008.5f1ba00e@gandalf.local.home>
 <436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
 <20250829082604.1e3fd06e@gandalf.local.home>
 <20250829083655.3d38d02b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829083655.3d38d02b@gandalf.local.home>
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

On Fri, Aug 29, 2025 at 08:36:55AM -0400, Steven Rostedt wrote:
> On Fri, 29 Aug 2025 08:26:04 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > BTW, the reason not to fault is because this might be called in code that is
> > already doing a fault and could cause deadlocks. The no sleeping part is a
> > side effect.
> 
> The difference between __copy_from_user_inatomic() and
> copy_from_user_nofault() is the above. It is possible to fault in memory
> without sleeping. For instance, the memory is already in the page cache,
> but not the user space page tables. Where that would be OK for
> __copy_from_user_inatomic() but not OK with copy_from_user_nofault(), due
> to the mentioned locking.

The semantics of __copy_from_user_inatomic() are not entirely clear. The
name implies it is to be used in atomic contexts but the documentation
also says that the caller should ensure there's no fault (well, the
comment is further down in uaccess.h for __copy_to_user_inatomic()).

The generic implementation uses raw_copy_from_user() in both atomic and
non-atomic variants. The difference is pretty much a might_fault() call.
So it's nothing arm64 specific here.

> For things like trace events and kprobes, copy_from_user_nofault() must be
> used because they can be added to code that is doing a fault, and this version
> must be used to prevent deadlocks.
> 
> But here, the __copy_from_user_inatomic() is in the code to handle writing
> to the trace_marker file. It is directly called from a user space system
> call, and will never be called within code that faults. Thus,
> __copy_from_user_inatomic() *is* the correct operation, as there's no
> problem if it needs to fault. It just can't sleep when doing so.

The problem is that it's the responsibility of the caller to ensure it
doesn't fault. In most cases, that's a pagefault_disable(). Or you just
go for copy_from_user_nofault() instead which actually checks that it's
a valid user address.

BTW, arm64 also bails out early in do_page_fault() if in_atomic() but I
suspect that's not the case here.

Adding Al Viro since since he wrote a large part of uaccess.h.

-- 
Catalin

