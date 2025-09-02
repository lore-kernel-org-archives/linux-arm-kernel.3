Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EE5CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZSLYhdlIbnghXt6TwaEm7+yoO4aoLtOznhHPUnvjTU=; b=F5fQR1uBR2COLqVKBom27w4rv9
	UlidcwWi1hiklIvilG6eZJTlciabNh9oifcYfE4L1ZCZJ4ndeijUUlrIXMqgL6ziVdEFtCu6NiSRY
	KZALOcuVTH7Zjne+IK7CsOivLKk6SLQcB97K9aX4TkwxuEaBm+wY54C1x+7Cp8b/DDbw/EItweN5f
	c0q1OLjparONbQkEhkkdAjaq7xN7VlidO4Tj0cDi9Hg5ATc+UOFq+rCys4jq9JiliRukhirpBUA5o
	dCQv48Wc85QCtnMkFIw5FEFzloKrHm67iDWrsH3D3iWiOTxBLjgYrgIKl4Jzr5w3ixhWy4UKd/uoO
	0BoMjw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLaf-0000000Fms1-1QKS;
	Tue, 02 Sep 2025 07:38:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLXy-0000000FmEG-02XU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CA704348F;
	Tue,  2 Sep 2025 07:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F30C4CEED;
	Tue,  2 Sep 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756798517;
	bh=E/WY5o6a97fVHU8e5uy2CoWMRAn7yHxp4l1Tt05M7pQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nymPyFHaAcgHY3kjoLFAWTfg/VeqM5171gZw/UhNyg9PSulFo70S9+Uf89ywYHI2F
	 TP0kj0tj7CVr8uk31H7r6i8kgwp/Vz/lIMQJfsFXZ+qe5QdumAEUtB7oaB6fWS30oA
	 ba0B1Z4l66xfrJs0oNuIbiVCvOJzTxdFntl4jR8aunxFyTXYVkITEOMVs9zZvzFT9I
	 BksleDrnd05NzHesNhvNdLu7bpN3EkUHHVKhhYu27OCgSambrPhwWIieAEK8n3eQys
	 9QgBDGPKGDm6KMWAW2efFr5R/C+a3M3oSggjnqSZSBuK2CHxWS5GxKmt453CYagsKq
	 0tCjlMKVdJOnA==
Date: Tue, 2 Sep 2025 16:35:14 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, mathieu.desnoyers@efficios.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-Id: <20250902163514.f877d9c96e913f08c0c6b0b1@kernel.org>
In-Reply-To: <cc6eb973-d82b-4afc-83fb-a2c28cc79d36@huaweicloud.com>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
	<20250829082604.1e3fd06e@gandalf.local.home>
	<20250902005645.8c6436b535731a4917745c5d@kernel.org>
	<cc6eb973-d82b-4afc-83fb-a2c28cc79d36@huaweicloud.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_003518_127397_08A3C471 
X-CRM114-Status: GOOD (  27.74  )
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

On Tue, 2 Sep 2025 11:47:32 +0800
Luo Gengkun <luogengkun@huaweicloud.com> wrote:

> 
> On 2025/9/1 23:56, Masami Hiramatsu (Google) wrote:
> > On Fri, 29 Aug 2025 08:26:04 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> >> [ Adding arm64 maintainers ]
> >>
> >> On Fri, 29 Aug 2025 16:29:07 +0800
> >> Luo Gengkun <luogengkun@huaweicloud.com> wrote:
> >>
> >>> On 2025/8/20 1:50, Steven Rostedt wrote:
> >>>> On Tue, 19 Aug 2025 10:51:52 +0000
> >>>> Luo Gengkun <luogengkun@huaweicloud.com> wrote:
> >>>>   
> >>>>> Both tracing_mark_write and tracing_mark_raw_write call
> >>>>> __copy_from_user_inatomic during preempt_disable. But in some case,
> >>>>> __copy_from_user_inatomic may trigger page fault, and will call schedule()
> >>>>> subtly. And if a task is migrated to other cpu, the following warning will
> >>>> Wait! What?
> >>>>
> >>>> __copy_from_user_inatomic() is allowed to be called from in atomic context.
> >>>> Hence the name it has. How the hell can it sleep? If it does, it's totally
> >>>> broken!
> >>>>
> >>>> Now, I'm not against using nofault() as it is better named, but I want to
> >>>> know why you are suggesting this change. Did you actually trigger a bug here?
> >>> yes, I trigger this bug in arm64.
> >> And I still think this is an arm64 bug.
> > I think it could be.
> >
> >>>>   
> >>>>> be trigger:
> >>>>>           if (RB_WARN_ON(cpu_buffer,
> >>>>>                          !local_read(&cpu_buffer->committing)))
> >>>>>
> >>>>> An example can illustrate this issue:
> > You've missed an important part.
> >
> >>>>> process flow						CPU
> >>>>> ---------------------------------------------------------------------
> >>>>>
> >>>>> tracing_mark_raw_write():				cpu:0
> >>>>>      ...
> >>>>>      ring_buffer_lock_reserve():				cpu:0
> >>>>>         ...
> > 	preempt_disable_notrace(); --> this is unlocked by ring_buffer_unlock_commit()
> >
> >>>>>         cpu = raw_smp_processor_id()			cpu:0
> >>>>>         cpu_buffer = buffer->buffers[cpu]			cpu:0
> >>>>>         ...
> >>>>>      ...
> >>>>>      __copy_from_user_inatomic():				cpu:0
> > So this is called under preempt-disabled.
> >
> >>>>>         ...
> >>>>>         # page fault
> >>>>>         do_mem_abort():					cpu:0
> >>>> Sounds to me that arm64 __copy_from_user_inatomic() may be broken.
> >>>>   
> >>>>>            ...
> >>>>>            # Call schedule
> >>>>>            schedule()					cpu:0
> > If this does not check the preempt flag, it is a problem.
> > Maybe arm64 needs to do fixup and abort instead of do_mem_abort()?
> 
> My kernel was built without CONFIG_PREEMPT_COUNT, so the preempt_disable()
> does nothing more than act as a barrier. In this case, it can pass the
> check by schedule(). Perhaps this is another issue?

OK, I got it. Indeed, in that case, we have no way to check this
happens in the preempt critical section.
Anyway, as in discussed here, __copy_from_user_inatomic() is for
the internal function, so I'm also OK to this patch.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

BTW, currently we just write a fault message if the
__copy_from_user_*() hits a fault, but I think we can retry with
normal __copy_from_user() to a kernel buffer and copy it in the
ring buffer as slow path.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

