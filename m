Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11EBC02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0GIYRIUkHOX6pavlrSY0IDuWab7ZgvgXgHE4LMqjQc=; b=ibw3xA8EUkWpG7JPYX/6ynYrA8
	/QPWHyzjJz3otmwMIMcIKNsMcPudlIpevtJUsZ5tJLB60+pTiEQosywgHqYsP6+Y5KCli077a3yIl
	jthhcCCQ8R/Zqju2pJoDUxe4TGj9S8SJSLf+hGKIIH8qUD9DApA6u8A+e2WmpO+wFzTl+FxpqK3UU
	JXYCKFzHB37uYqRi+s6PHvwaAJYG8CjRTyYiTg44vGrwTmHisdXehPelO1pRFHQX+BwmRObieyVnY
	OPNI2dSdQfaUeo3pn/cvmV9/NUK9L+AmPD4GTTYoP4+ppc/7I7siS4QicQz74/0O7dyPFfVySqvWm
	LddSKzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyCD-0000000FqCm-25xE;
	Mon, 03 Feb 2025 15:17:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyAs-0000000Fpz8-3buo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B54AA412BA;
	Mon,  3 Feb 2025 15:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66F2C4CED2;
	Mon,  3 Feb 2025 15:15:43 +0000 (UTC)
Date: Mon, 3 Feb 2025 10:16:17 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 roman.gushchin@linux.dev, Will Deacon <will@kernel.org>, Ian Rogers
 <irogers@google.com>, linux-toolchains@vger.kernel.org,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] arm64: Enable livepatch for ARM64
Message-ID: <20250203101617.5300f930@gandalf.local.home>
In-Reply-To: <ceabc7b5-a9b8-4f3b-9a73-5cc2af4e9af9@linux.microsoft.com>
References: <20250127213310.2496133-1-wnliu@google.com>
	<20250127213310.2496133-9-wnliu@google.com>
	<ceabc7b5-a9b8-4f3b-9a73-5cc2af4e9af9@linux.microsoft.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_071546_966514_2A870447 
X-CRM114-Status: GOOD (  11.59  )
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

On Fri, 31 Jan 2025 21:38:46 +0530
Prasanna Kumar T S M <ptsm@linux.microsoft.com> wrote:

> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -271,6 +271,8 @@ config ARM64
> >   	select HAVE_SOFTIRQ_ON_OWN_STACK
> >   	select USER_STACKTRACE_SUPPORT
> >   	select VDSO_GETRANDOM
> > +	select HAVE_RELIABLE_STACKTRACE if SFRAME_UNWINDER
> > +	select HAVE_LIVEPATCH		if HAVE_DYNAMIC_FTRACE_WITH_ARGS && HAVE_RELIABLE_STACKTRACE
> >   	help
> >   	  ARM 64-bit (AArch64) Linux support.
> >   
> > @@ -2498,3 +2500,4 @@ source "drivers/acpi/Kconfig"
> >   
> >   source "arch/arm64/kvm/Kconfig"
> >   
> > +source "kernel/livepatch/Kconfig"  
> 
> Will this work for ftrace'd (kprobe'd) function as well?

What work? The stack walker? It may require updates to the tracing
trampolines, but it should be doable just like ORC is.

-- Steve

