Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31EEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3ZSQbMXrGRz8ZfxEOxUSi77yriazGREs/X4JZlcd+I=; b=hZC61PXKrAps/EchOsadDtSVaX
	BnjEWBxdFWUaMjTjxpgLE7ysiaO7MxFPa3BpNcyTetPV06DrPCvLItcI7HeB7JAWt2bapA8xx1+TS
	x66LZgyvauSg4iTfBe5LQxuXGZLIcN6GqOfTK4SPaMd5Fj8CMSkCIOLMUfj/v1Nn0gnP0K3bQRE72
	GUAjDeTXYtQCzcAuea/Zl1PwIic2sV4YMK8iV8UuZHT+GdogOHoOsqpLGxCZCAo7Rr16PLapJCJIf
	5nJkSrEbSSPiBQ8hOTglpdUcCpDZDBZqrOFN8QUbQ9RfoliYr3ZommAOaJGdEhlX+rNncBG90BhrF
	9STQYI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2OL-00000001Wkc-35S6;
	Tue, 25 Feb 2025 21:23:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0tO-00000001DeN-3aMt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:47:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43906152B;
	Tue, 25 Feb 2025 11:47:14 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E65263F5A1;
	Tue, 25 Feb 2025 11:46:55 -0800 (PST)
Date: Tue, 25 Feb 2025 19:46:53 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v20 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
Message-ID: <Z74eLRTcVym4sMqh@J2N7QTR9R3.cambridge.arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org>
 <20250224122507.GE8144@e132581.arm.com>
 <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
 <20250224140317.GF8144@e132581.arm.com>
 <Z7yY19UtSnND5KTl@J2N7QTR9R3.cambridge.arm.com>
 <20250224180301.GI8144@e132581.arm.com>
 <CAL_JsqKNad6eEBerUOco=SDWxdp6dgRD3FDrSt5OpGQYwwstSg@mail.gmail.com>
 <20250225123813.GA1821331@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225123813.GA1821331@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_114658_980933_C104D44A 
X-CRM114-Status: GOOD (  54.00  )
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

On Tue, Feb 25, 2025 at 12:38:13PM +0000, Leo Yan wrote:
> On Mon, Feb 24, 2025 at 07:31:52PM -0600, Rob Herring wrote:
> 
> [...]
> 
> > > > > When event rotation happens, if without context switch, in theory we
> > > > > should can directly use the branch record (no invalidation, no injection)
> > > > > for all events.
> > > >
> > > > No; that only works in *some* cases, and will produce incorrect results
> > > > in others.
> > > >
> > > > For example, consider filtering. Imagine a PMU with a single counter,
> > > > and two events, where event-A filters for calls-and-returns and event-B
> > > > filters for calls-only. When switching from event-A to event-B, it's
> > > > theoretically possible to keep the existing records around, knowing that
> > > > the returns can be filtered out later. When switching from event-B to
> > > > event-A we cannot keep the existing records, since there are gaps
> > > > whenever a return should have been recorded.
> > >
> > > Seems to me, the problem is not caused by event rotation.  We need to
> > > calculate a correct filter in the first place - the BRBE driver should
> > > calculate a superset for all filters of events for a session.  Then,
> > > generate branch record based event's specific filter.
> > 
> > The driver doesn't have enough information. If it is told to schedule
> > event A, it doesn't know anything about event B. It could in theory
> > try to remember event B if event B had already been scheduled, but it
> > never knows when event B is gone.
> 
> E.g., I tried below command for enabling 10 events in a perf session:
> 
>   perf record -e armv9_nevis/r04/ -e armv9_nevis/r05/ \
>               -e armv9_nevis/r06/ -e armv9_nevis/r07/ \
>               -e armv9_nevis/r08/ -e armv9_nevis/r09/ \
>               -e armv9_nevis/r10/ -e armv9_nevis/r11/ \
>               -e armv9_nevis/r12/ -e armv9_nevis/r13/ \
>               -- sleep 1
> 
> For Arm PMU, the flow below is invoked for every event on every
> affinied CPU in initialization phase:
> 
>   armpmu_event_init() {
>     armv8pmu_set_event_filter();
>   }
> 
> Shouldn't we calculate a superset branch filter for all events, store
> it into a per-CPU data structure and then apply the filter on BRBE?

Should we? No.

*NONE* of the events in your example are CPU-bound, and the call to
armpmu_event_init() can happen on an arbitrary CPU which the relevant
event never actually runs on, while other unrelated events may run on
that CPU.

It makes no sense for armv8pmu_set_event_filter() to write to a per-cpu
structure. That's purely there to determine what the filters *should* be
when *that specific event* is programmed into hardware.

As Rob and I have pointed out already, the *only* thing that can be
relevant to deciding the configuration of HW filtering is the set of
events which are *active* on that CPU.

> > > > There are a number of cases of that shape given the set of configurable
> > > > filters. In theory it's possible to retain those in some cases, but I
> > > > don't think that the complexity is justified.
> > > >
> > > > Similarly, whenever kernel branches are recorded it's necessary to drop
> > > > the stale branches whenever branch recording is paused, as there's
> > > > necessarily a blackout period and hence a gap in the records.
> > >
> > > If we save BRBE record when a process is switched out and then restore
> > > the record when a process is switched in, should we can keep a decent
> > > branch record for performance profiling?
> > 
> > Keep in mind that there's only 64 branches recorded at most. How many
> > branches in a context switch plus reconfiguring the PMU? Not a small
> > percentage of 64 I think. In traces where freeze on overflow was not
> > working (there's an example in v18), just the interrupt entry until
> > BRBE was stopped was a significant part of the trace. A context switch
> > is going to be similar.
> 
> That is true for kernel mode enabled tracing.  But we will have no
> such kind noises for userspace only mode tracing.

As mentioned elsewhere, it's not a problem for x86, so why is it
magically a problem for arm64?

> > > > Do you have a reason why you think we *must* keep events around?
> > >
> > > Here I am really concerned are cases when a process is preempted or
> > > migrated.  The driver doesn't save and restore branch records for these
> > > cases, it just invalidates all records when a task is scheduled in.
> > >
> > > As a result, if an event overflow is close to context switch, it is
> > > likely to capture incomplete branch records.  For a userspace-only
> > > tracing, it is risk to capture empty branch record after preemption
> > > and migrations.
> > 
> > There's the same risk if something else is recording kernel branches
> > when you are recording userspace only. I think the user has to be
> > aware if other things like context switches are perturbing their data.
> 
> I am confused for the decription above.  Does it refer to branch
> recording cross different sessions?  It is fine for me that the branch
> data is interleaved by different sessions (e.g. one is global tracing
> and another is only per-thread tracing).

Imagine that there's an existing process with some pid ${PID}, and
concurrently, the following commands are run, either by the same user or
different users with appropriate permissions:

	# Trying to record user branches only
	perf record -j any,u -e cycles -p ${PID}

	# Trying to record kernel branches only
	perf record -j any,k -e cycles -p ${PID}

Whatever you do, the task trying to record user branches only will lose
some records:

* If we make the events mutually exclusive, the branches will only be
  recorded when the user event is installed.

* If we merge the HW filters and later apply a SW filter, it's very
  likely that kernel branches taken after exception entry have filled
  all the records, and there are no user branches left to sample.

> We might need to consider an intact branch record for the single perf
> session case.  E.g. if userspace program calls:
> 
>     func_a -> func_b -> func_c
> 
> In a case for only userspace tracing, we will have no chance to preserve
> the call sequence of these functions after the program is switched out.

If those functions are small, it's very likely that they'll all be in
the branch history. If they're so large that they're not executed in one
scheduling quantum, do you expect them to fall within the same event
period?

I think that you're making a big deal out of an edge case that doesn't
matter much in practice.

Mark.

