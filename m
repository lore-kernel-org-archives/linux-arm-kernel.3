Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5B7CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZF9k1vN82TPnDjF7LSo1ETHjuA30U+GHEPHdG0wOSw=; b=DtLaNqfC/907Tf7VqHMXEe/cOf
	1sRkokdEp/Dey6351xaQWfoCvQpiDo0z9VN6FLK9ce3zPYuN2eZs6NZCcmrI7z5sJo075IL1OPs/I
	W4YxIHCvOQPFcHtP2fkiQHHslPAtxkPd/l7HrPAufQMUgQXchxFPULI5vGj3A+iWdCeFpVuqygbqx
	Cc3L9eF/5YZVOoaxKp5kIPdhXnSmU2TekW/DBYjFL23O21H5eYgd2c4TyorsmnU3CpbYkZgEOQIiI
	ordB0L3JReY1j5tRWWoVIaebPbBdmraefmswDBxJni5LovEl2Pnssp9R5iVEV/988kUAsyp48oZrm
	E+hk0lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3MK-00000006abH-38gV;
	Fri, 29 Aug 2025 17:57:56 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAu-00000005dnN-0vnp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:25:49 +0000
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 5EE46BADE0;
	Fri, 29 Aug 2025 12:25:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 5CCF120027;
	Fri, 29 Aug 2025 12:25:42 +0000 (UTC)
Date: Fri, 29 Aug 2025 08:26:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <20250829082604.1e3fd06e@gandalf.local.home>
In-Reply-To: <436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5CCF120027
X-Stat-Signature: z4qee96ax9gocnkpiu6zi9es954bzpw8
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1//eG0SPh1gXzSvhvFw/mS6TyA0QJDKqYs=
X-HE-Tag: 1756470342-908911
X-HE-Meta: U2FsdGVkX195ZgDOTbivrDBTaufOHEnsk6PH2OHOVpi9ojybHHHjo+zy+PeSzr/EOxHT+tJW9yhUm44IbnMOZIbQ9I5ne1xKch07oeuKvb843vUBYWVLBhmzJmPTdMMwUrD3UZ5jKD0jWcwB+oouhMyHzFKenViz4q+lSCtfhzKxn5fCJBjZAfjiF/lS7i1B8eE2ND5nI+rBiA9a6ZWJ+2UiTAhUWYAmR4C5ooFf7VFPF/LXnrAnb36shVcxzstQwJp5t9eeyJhrs0mn5AH8v/zHwvU1YGJLeG9Xsavq3ongCZTqfdoVEMKzCcz1SMRbh1dgLJSiwgD1jxqrLBzE2r8JHLs5DsA8h53z7hGGNQ8SjLGpCFqkWqYEhEpLDX+r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_052548_339984_D1DF7FCA 
X-CRM114-Status: GOOD (  33.29  )
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


[ Adding arm64 maintainers ]

On Fri, 29 Aug 2025 16:29:07 +0800
Luo Gengkun <luogengkun@huaweicloud.com> wrote:

> On 2025/8/20 1:50, Steven Rostedt wrote:
> > On Tue, 19 Aug 2025 10:51:52 +0000
> > Luo Gengkun <luogengkun@huaweicloud.com> wrote:
> >  
> >> Both tracing_mark_write and tracing_mark_raw_write call
> >> __copy_from_user_inatomic during preempt_disable. But in some case,
> >> __copy_from_user_inatomic may trigger page fault, and will call schedule()
> >> subtly. And if a task is migrated to other cpu, the following warning will  
> > Wait! What?
> >
> > __copy_from_user_inatomic() is allowed to be called from in atomic context.
> > Hence the name it has. How the hell can it sleep? If it does, it's totally
> > broken!
> >
> > Now, I'm not against using nofault() as it is better named, but I want to
> > know why you are suggesting this change. Did you actually trigger a bug here?  
> 
> yes, I trigger this bug in arm64.

And I still think this is an arm64 bug.

> 
> >  
> >> be trigger:
> >>          if (RB_WARN_ON(cpu_buffer,
> >>                         !local_read(&cpu_buffer->committing)))
> >>
> >> An example can illustrate this issue:
> >>
> >> process flow						CPU
> >> ---------------------------------------------------------------------
> >>
> >> tracing_mark_raw_write():				cpu:0
> >>     ...
> >>     ring_buffer_lock_reserve():				cpu:0
> >>        ...
> >>        cpu = raw_smp_processor_id()			cpu:0
> >>        cpu_buffer = buffer->buffers[cpu]			cpu:0
> >>        ...
> >>     ...
> >>     __copy_from_user_inatomic():				cpu:0
> >>        ...
> >>        # page fault
> >>        do_mem_abort():					cpu:0  
> > Sounds to me that arm64 __copy_from_user_inatomic() may be broken.
> >  
> >>           ...
> >>           # Call schedule
> >>           schedule()					cpu:0
> >> 	 ...
> >>     # the task schedule to cpu1
> >>     __buffer_unlock_commit():				cpu:1
> >>        ...
> >>        ring_buffer_unlock_commit():			cpu:1
> >> 	 ...
> >> 	 cpu = raw_smp_processor_id()			cpu:1
> >> 	 cpu_buffer = buffer->buffers[cpu]		cpu:1
> >>
> >> As shown above, the process will acquire cpuid twice and the return values
> >> are not the same.
> >>
> >> To fix this problem using copy_from_user_nofault instead of
> >> __copy_from_user_inatomic, as the former performs 'access_ok' before
> >> copying.
> >>
> >> Fixes: 656c7f0d2d2b ("tracing: Replace kmap with copy_from_user() in trace_marker writing")  
> > The above commit was intorduced in 2016. copy_from_user_nofault() was
> > introduced in 2020. I don't think this would be the fix for that kernel.
> >
> > So no, I'm not taking this patch. If you see __copy_from_user_inatomic()
> > sleeping, it's users are not the issue. That function is.
> >
> > -- Steve
> >
> >  
> I noticed that in most places where __copy_from_user_inatomic() is used,

"most" but not all?

> it is within the pagefault_disable/enable() section. When pagefault_disable()
> is called, user access methods will no sleep. So I'm going to send a v2patch which use pagefault_disable/enable()to fix this problem. -- Gengkun

No, I don't want that either. __copy_from_user_inatomic() SHOULD NOT SLEEP!
If it does, than it is a bug!

If it can sleep, "inatomic" is a very bad name. The point of being
"inatomic" is that you are in a location that IS NOT ALLOWED TO SLEEP!

I don't want to fix a symptom and leave a bug around.

BTW, the reason not to fault is because this might be called in code that is
already doing a fault and could cause deadlocks. The no sleeping part is a
side effect.

-- Steve

