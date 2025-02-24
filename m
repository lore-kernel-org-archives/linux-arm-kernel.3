Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95626C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4liPRUauSk7j3cphN3GxnVBQH70wiNZYYEv+G4e9rg=; b=Ag7nG9rYjRkqqZ1+n3mTdv0FJJ
	J3H4YCMzO9S8ExT6OiYNawgRMgCRccvHk9szpF8a1upak6a9U38fx8CpYvrV3J8ndgZNCqLXnbYqg
	J8OaVHXKOOvfiMfs/hP5rURM/0qr9NRredT4jPVP0Dcf8HnvQvMz5X2PRGfzdc1Ilz71c77OH33uF
	GeHuoYbwWYPPsZPUefG57TK1cUJqKXiDnk11oNZg5INR13x9vB7D74Tw7wtBndonK/sYROEw5lu4i
	XbbqOYU/cCNjDDv5g3umEeSHTfMPmhdovJtWqPPTOejLE5GQWyBZwmH2RGXlkhFjukg4nq0ieaxyS
	dpLOREoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmazT-0000000EPO8-0hrO;
	Mon, 24 Feb 2025 16:07:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaxs-0000000EP9C-0h6K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 16:05:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 074DE1477;
	Mon, 24 Feb 2025 08:06:05 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0BE73F6A8;
	Mon, 24 Feb 2025 08:05:45 -0800 (PST)
Date: Mon, 24 Feb 2025 16:05:43 +0000
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
Message-ID: <Z7yY19UtSnND5KTl@J2N7QTR9R3.cambridge.arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org>
 <20250224122507.GE8144@e132581.arm.com>
 <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
 <20250224140317.GF8144@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224140317.GF8144@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_080552_295100_F219BE38 
X-CRM114-Status: GOOD (  37.35  )
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

On Mon, Feb 24, 2025 at 02:03:17PM +0000, Leo Yan wrote:
> On Mon, Feb 24, 2025 at 06:46:35AM -0600, Rob Herring wrote:
> > On Mon, Feb 24, 2025 at 6:25 AM Leo Yan <leo.yan@arm.com> wrote:
> > > On Tue, Feb 18, 2025 at 02:40:06PM -0600, Rob Herring (Arm) wrote:
> > > >
> > > > From: Anshuman Khandual <anshuman.khandual@arm.com>
> > >
> > > [...]
> > >
> > > > BRBE records are invalidated whenever events are reconfigured, a new
> > > > task is scheduled in, or after recording is paused (and the records
> > > > have been recorded for the event). The architecture allows branch
> > > > records to be invalidated by the PE under implementation defined
> > > > conditions. It is expected that these conditions are rare.
> > >
> > > [...]
> > >
> > > > +static void armv8pmu_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
> > > > +{
> > > > +       struct arm_pmu *armpmu = *this_cpu_ptr(&cpu_armpmu);
> > > > +       struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
> > > > +
> > > > +       if (!hw_events->branch_users)
> > > > +               return;
> > > > +
> > > > +       if (sched_in)
> > > > +               brbe_invalidate();
> > > > +}
> > >
> > > Just a minor concern.  I don't see any handling for task migration.
> > > E.g., for a task is migrated from one CPU to another CPU, I expect we
> > > need to save and restore branch records based on BRBE injection.  So
> > > far, the driver simply invalidates all records.
> > >
> > > I think this topic is very likely discussed before.  If this is the
> > > case, please ignore my comment.  Except this, the code looks good
> > > to me.
> > 
> > Not really discussed on the list, but that was present in v18 (though
> > not functional because .sched_task() hook wasn't actually enabled) and
> > Mark removed it. His work is here[1].The only comment was:
> > 
> > Note: saving/restoring at context-switch doesn't interact well with
> > event rotation (e.g. if filters change)
> 
> In the brbe_enable() function, it "Merge the permitted branch filters
> of all events".  Based on current implementation, all events share the
> same branch filter.

Critically, the brbe_enable() function merges the filters of all
*active* events which have been installed into hardware. It does not
track all events which can be rotated, and the resulting filter is not
the same -- it can change as a result of rotation.

> When event rotation happens, if without context switch, in theory we
> should can directly use the branch record (no invalidation, no injection)
> for all events.

No; that only works in *some* cases, and will produce incorrect results
in others.

For example, consider filtering. Imagine a PMU with a single counter,
and two events, where event-A filters for calls-and-returns and event-B
filters for calls-only. When switching from event-A to event-B, it's
theoretically possible to keep the existing records around, knowing that
the returns can be filtered out later. When switching from event-B to
event-A we cannot keep the existing records, since there are gaps
whenever a return should have been recorded.

There are a number of cases of that shape given the set of configurable
filters. In theory it's possible to retain those in some cases, but I
don't think that the complexity is justified.

Similarly, whenever kernel branches are recorded it's necessary to drop
the stale branches whenever branch recording is paused, as there's
necessarily a blackout period and hence a gap in the records.

Do you think that you have a case where losing branches across rotation
*really* matters?

> For a context-switch case, we need to save and re-inject branch record.
> BRBE record sticks to a process context, no matter what events have been
> enabled.

I had originally wanted to keep per-event records around, but it doesn't
work in all cases. One reason events get discarded at context-switch
time is that CPU-bound events can sample branches, and would
mis-attribute stale userspace branches to the wrong context when
switching tasks. There are explicit comments about this in
amd_pmu_brs_sched_task() and intel_pmu_lbr_sched_task().

Given we discard records when reprogramming events, we *could* try to
preserve events in some cases, but I suspect that as with the rotation
case this'll be a lot of complexity for little gain. Note that as we
discard events when enabling the PMU, we'd throw some task-bound records
away anyway, and practically the gain would be limited to cpu-bound
records.

Do you have a reason why you think we *must* keep events around?

Mark.

