Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F44CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8sEMoUdmZx3RdAvP1OTi9dV+iysH79W1ma4AxYkWSQ=; b=cZcV5HErqvkZXLMRzeqdX/646h
	Z7OZb2NLfW9fd6UtkTSTQOcxrgqc9RxiouLpFS0/wAjJGz6AZf6YJLSMDboIZGwzmbuodZohbOdMt
	YWSDQ1/GAH3J1F2C7yol68VnF4ztZzmd7rlFGzjHUBp+V+ugrF/OWlOA7v4D4WvAkB0gbC9KvGV69
	KqGIx1+M4+91afx91JfcwxtYrs9QI9isPH4lq9XQptfrXuyOb4Gnpx1hAbd9tyxHIcnpvlbpQuu8R
	u32csTQCs4P+6R5Tv1Bh8LIFZVg/HYxm1/1XHM2aI4hz4k1IW/5GMCco+s8STIVedfSgsq01o4Y70
	6icA0slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDh8-0000000EE8n-1Buj;
	Mon, 01 Sep 2025 23:12:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6tl-0000000DCGv-3XQg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A544406F1;
	Mon,  1 Sep 2025 15:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88B1C4CEF1;
	Mon,  1 Sep 2025 15:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756742209;
	bh=QRrP1L09Z/tIsyyTHnZE5kLupetP4zN0OUXv+gdnLxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s+hHGCrVP5/Uqb2MOTw2HVgpr6oRsF7MUtdSFcFhI89V8gRTjRULuEJoLc8Gpq0hw
	 F1BdujSnDIEvOHM4ihyrNytqHkb8fvgsjy15fYhOhxn7tRljLmCOJU1bFOKcE6onK5
	 Le69W7GBDmgmh5rwo2zvdxM3Y4Tz74rPfPmEaHh1xlzVA/Y5g5DNRYsBUdZEEqOnHB
	 Crdk6XF6mWBQYX0yZoRkV+hxUA70hdzoMFDuWCSs7O2g8rxthmvccZ3etoDMYiyABR
	 dB6yqUkYYfHZsaKUzxyMR3zpUeNklwKUH/tDMCYI3rSlJqwRQ9RyM7Nu7U8OcA7dQv
	 MPp2jFt4xrlzA==
Date: Tue, 2 Sep 2025 00:56:45 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Luo Gengkun <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-Id: <20250902005645.8c6436b535731a4917745c5d@kernel.org>
In-Reply-To: <20250829082604.1e3fd06e@gandalf.local.home>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
	<20250829082604.1e3fd06e@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_085649_927978_40B83355 
X-CRM114-Status: GOOD (  33.22  )
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

On Fri, 29 Aug 2025 08:26:04 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> 
> [ Adding arm64 maintainers ]
> 
> On Fri, 29 Aug 2025 16:29:07 +0800
> Luo Gengkun <luogengkun@huaweicloud.com> wrote:
> 
> > On 2025/8/20 1:50, Steven Rostedt wrote:
> > > On Tue, 19 Aug 2025 10:51:52 +0000
> > > Luo Gengkun <luogengkun@huaweicloud.com> wrote:
> > >  
> > >> Both tracing_mark_write and tracing_mark_raw_write call
> > >> __copy_from_user_inatomic during preempt_disable. But in some case,
> > >> __copy_from_user_inatomic may trigger page fault, and will call schedule()
> > >> subtly. And if a task is migrated to other cpu, the following warning will  
> > > Wait! What?
> > >
> > > __copy_from_user_inatomic() is allowed to be called from in atomic context.
> > > Hence the name it has. How the hell can it sleep? If it does, it's totally
> > > broken!
> > >
> > > Now, I'm not against using nofault() as it is better named, but I want to
> > > know why you are suggesting this change. Did you actually trigger a bug here?  
> > 
> > yes, I trigger this bug in arm64.
> 
> And I still think this is an arm64 bug.

I think it could be.

> > >  
> > >> be trigger:
> > >>          if (RB_WARN_ON(cpu_buffer,
> > >>                         !local_read(&cpu_buffer->committing)))
> > >>
> > >> An example can illustrate this issue:

You've missed an important part.

> > >>
> > >> process flow						CPU
> > >> ---------------------------------------------------------------------
> > >>
> > >> tracing_mark_raw_write():				cpu:0
> > >>     ...
> > >>     ring_buffer_lock_reserve():				cpu:0
> > >>        ...

	preempt_disable_notrace(); --> this is unlocked by ring_buffer_unlock_commit()

> > >>        cpu = raw_smp_processor_id()			cpu:0
> > >>        cpu_buffer = buffer->buffers[cpu]			cpu:0
> > >>        ...
> > >>     ...
> > >>     __copy_from_user_inatomic():				cpu:0

So this is called under preempt-disabled.

> > >>        ...
> > >>        # page fault
> > >>        do_mem_abort():					cpu:0  
> > > Sounds to me that arm64 __copy_from_user_inatomic() may be broken.
> > >  
> > >>           ...
> > >>           # Call schedule
> > >>           schedule()					cpu:0

If this does not check the preempt flag, it is a problem.
Maybe arm64 needs to do fixup and abort instead of do_mem_abort()?

> > >> 	 ...
> > >>     # the task schedule to cpu1
> > >>     __buffer_unlock_commit():				cpu:1
> > >>        ...
> > >>        ring_buffer_unlock_commit():			cpu:1
> > >> 	 ...
> > >> 	 cpu = raw_smp_processor_id()			cpu:1
> > >> 	 cpu_buffer = buffer->buffers[cpu]		cpu:1

	preempt_enable_notrace(); <-- here we enable preempt again.

> > >>
> > >> As shown above, the process will acquire cpuid twice and the return values
> > >> are not the same.
> > >>
> > >> To fix this problem using copy_from_user_nofault instead of
> > >> __copy_from_user_inatomic, as the former performs 'access_ok' before
> > >> copying.
> > >>
> > >> Fixes: 656c7f0d2d2b ("tracing: Replace kmap with copy_from_user() in trace_marker writing")  
> > > The above commit was intorduced in 2016. copy_from_user_nofault() was
> > > introduced in 2020. I don't think this would be the fix for that kernel.
> > >
> > > So no, I'm not taking this patch. If you see __copy_from_user_inatomic()
> > > sleeping, it's users are not the issue. That function is.


BTW, the biggest difference between __copy_from_user() and
 __copy_from_user_inatomic() is `might_fault()` and `should_fail_usercopy()`.
The latter is a fault injection, so we can ignore it. But since
the `might_fail()` is NOT in __copy_from_user_inatomic(), it is designed
not to cause fault as Steve said?

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

