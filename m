Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE4EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nl5houdTR6MisLdpFKLKyOE9nnlycsFuyJDKA4ksk7w=; b=nPEUWFDY1n7nfl8cZcnD9BLojM
	79Mkk64hecZF89jWudP8rMcAqkNIXY2n+4pBtyVTlXkE3lTNMly/dzp+DWTsZ6PunIuvo+1AKTQnE
	beuNOwK1kx39ziWQ8qgUCAAvHp8eF4tgXQStwU/hgClqc2CuNjcviy00OD2vA503N9mA2oKoaG7F3
	N+GSpFO7eeg7mlwvPqamqcnX8GEZOzYSZCzjiXtBcGRkX6EIl86t88DO8Wx2dmZtC+jslIsFdf7Yt
	yTyni/qGCXeDZbSZMNb07/8k+26YJmHPkFM69f66VLL5mD//e8u35ockTCEhG3NIZhALSb6soAkGN
	oZ5Tk7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjpM-0000000FhzQ-1wTK;
	Tue, 25 Feb 2025 01:33:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjnr-0000000FhuJ-03Va
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51B9F611CA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E213CC4CEE6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740447124;
	bh=oNFRiRu3B+1F4rETWzHu87g8+8lxN2QQ/bwEbS8L5/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bbxO/luOYTPR1YgMrZi0dz+o/Ag9v3NdrvsC1/fabzUkPRMuQbWnqBQyw09RuDZLw
	 n7hqUskxHaGVIDXX491Yk9EVkngF+m116C06SoiPpZ9aCQc/dgdDYxxWjhFHH4WVbZ
	 c2Tymn9RJVoc7HM9AsJeJL+3tALxsDOOdzwfoyK326E+jLSQszg71owGshnIY7ZTIP
	 5xy65PXhjBi7MAfFRQE4sE1wYyUDDbJUEaNzwZELEzsKDfCC9Z/JVi0MWjBr/U6cZ+
	 cd7S3GS8HTcclu0WIwF4/Q+PoJi/OQKqzUlAWtan0BFT9Wo711jV23OdjFCGq/UsLJ
	 JOXweqkByieTg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so7686066a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:32:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwtYWW4t/RXRvUc/SIL1pr6kl+k+j54D/y3DlnjZonpu7b1MX4am1ahyJflJLpbkiXUY3JWa4F73TpMV7fV0tI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb7zaePlp76Il8ifM3MOnJpnRSVUcObd1kryOje0AdtgSOb1vt
	y5t3TRLQ5FWhpJNFQ7x36E2Y9diULNi7awVSlAJAPidPYiHz5fpwSD+SzB614Dmx5IuwYUdaA4A
	BVtTIJyYeGMMaLpEFIS1JiX6+yA==
X-Google-Smtp-Source: AGHT+IF0oZCxiK/ZFsFb1hIDiizkSgWxjFTx6kKn+fuvN2qWJh20NtQly1HcVhyy6wmhgmp9semm1fTOfMZcyER0TDM=
X-Received: by 2002:a05:6402:440b:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5e444481387mr1053029a12.5.1740447123387; Mon, 24 Feb 2025
 17:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org> <20250224122507.GE8144@e132581.arm.com>
 <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
 <20250224140317.GF8144@e132581.arm.com> <Z7yY19UtSnND5KTl@J2N7QTR9R3.cambridge.arm.com>
 <20250224180301.GI8144@e132581.arm.com>
In-Reply-To: <20250224180301.GI8144@e132581.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Feb 2025 19:31:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKNad6eEBerUOco=SDWxdp6dgRD3FDrSt5OpGQYwwstSg@mail.gmail.com>
X-Gm-Features: AQ5f1JpZnmkKohlVKFAFaoTDPyBucm92D6dTQtNc_f9Z3M6ImuFJVuDiTExv_eA
Message-ID: <CAL_JsqKNad6eEBerUOco=SDWxdp6dgRD3FDrSt5OpGQYwwstSg@mail.gmail.com>
Subject: Re: [PATCH v20 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Feb 24, 2025 at 12:03=E2=80=AFPM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Feb 24, 2025 at 04:05:43PM +0000, Mark Rutland wrote:
>
> [...]
>
> > > > > Just a minor concern.  I don't see any handling for task migratio=
n.
> > > > > E.g., for a task is migrated from one CPU to another CPU, I expec=
t we
> > > > > need to save and restore branch records based on BRBE injection. =
 So
> > > > > far, the driver simply invalidates all records.
> > > > >
> > > > > I think this topic is very likely discussed before.  If this is t=
he
> > > > > case, please ignore my comment.  Except this, the code looks good
> > > > > to me.
> > > >
> > > > Not really discussed on the list, but that was present in v18 (thou=
gh
> > > > not functional because .sched_task() hook wasn't actually enabled) =
and
> > > > Mark removed it. His work is here[1].The only comment was:
> > > >
> > > > Note: saving/restoring at context-switch doesn't interact well with
> > > > event rotation (e.g. if filters change)
> > >
> > > In the brbe_enable() function, it "Merge the permitted branch filters
> > > of all events".  Based on current implementation, all events share th=
e
> > > same branch filter.
> >
> > Critically, the brbe_enable() function merges the filters of all
> > *active* events which have been installed into hardware. It does not
> > track all events which can be rotated, and the resulting filter is not
> > the same -- it can change as a result of rotation.
>
> In a perf session has multiple events, and events have different branch
> filters, seems to me, a simple way is to return error for this case.
>
> I would argue BRBE is an IP for recording branches per CPU wise, it does
> not support recording for event wise.  If we can unify branch filter
> within a perf session, would this be much easier for handling?

And the PMU is an IP for recording events per CPU, but that is not
perf (only)...

>
> > > When event rotation happens, if without context switch, in theory we
> > > should can directly use the branch record (no invalidation, no inject=
ion)
> > > for all events.
> >
> > No; that only works in *some* cases, and will produce incorrect results
> > in others.
> >
> > For example, consider filtering. Imagine a PMU with a single counter,
> > and two events, where event-A filters for calls-and-returns and event-B
> > filters for calls-only. When switching from event-A to event-B, it's
> > theoretically possible to keep the existing records around, knowing tha=
t
> > the returns can be filtered out later. When switching from event-B to
> > event-A we cannot keep the existing records, since there are gaps
> > whenever a return should have been recorded.
>
> Seems to me, the problem is not caused by event rotation.  We need to
> calculate a correct filter in the first place - the BRBE driver should
> calculate a superset for all filters of events for a session.  Then,
> generate branch record based event's specific filter.

The driver doesn't have enough information. If it is told to schedule
event A, it doesn't know anything about event B. It could in theory
try to remember event B if event B had already been scheduled, but it
never knows when event B is gone.

> > There are a number of cases of that shape given the set of configurable
> > filters. In theory it's possible to retain those in some cases, but I
> > don't think that the complexity is justified.
> >
> > Similarly, whenever kernel branches are recorded it's necessary to drop
> > the stale branches whenever branch recording is paused, as there's
> > necessarily a blackout period and hence a gap in the records.
>
> If we save BRBE record when a process is switched out and then restore
> the record when a process is switched in, should we can keep a decent
> branch record for performance profiling?

Keep in mind that there's only 64 branches recorded at most. How many
branches in a context switch plus reconfiguring the PMU? Not a small
percentage of 64 I think. In traces where freeze on overflow was not
working (there's an example in v18), just the interrupt entry until
BRBE was stopped was a significant part of the trace. A context switch
is going to be similar.

> I understand it might be many things happen in the middle of a task
> switching or migration, but it is fine for not recording branches during
> the blackout period.  The missed branch records are not very helpful for
> forming a flow for a profiled program itself, especially, if we
> consider we will optimize userspace program in many cases.

We can't really not record during a blackout period. The only way we
can is with freeze on overflow.

> > Do you think that you have a case where losing branches across rotation
> > *really* matters?
>
> I agreed that event rotation case might be rare and complex.  Please see
> a comment below.
>
> > > For a context-switch case, we need to save and re-inject branch recor=
d.
> > > BRBE record sticks to a process context, no matter what events have b=
een
> > > enabled.
> >
> > I had originally wanted to keep per-event records around, but it doesn'=
t
> > work in all cases. One reason events get discarded at context-switch
> > time is that CPU-bound events can sample branches, and would
> > mis-attribute stale userspace branches to the wrong context when
> > switching tasks. There are explicit comments about this in
> > amd_pmu_brs_sched_task() and intel_pmu_lbr_sched_task().
> >
> > Given we discard records when reprogramming events, we *could* try to
> > preserve events in some cases, but I suspect that as with the rotation
> > case this'll be a lot of complexity for little gain. Note that as we
> > discard events when enabling the PMU, we'd throw some task-bound record=
s
> > away anyway, and practically the gain would be limited to cpu-bound
> > records.
> >
> > Do you have a reason why you think we *must* keep events around?
>
> Here I am really concerned are cases when a process is preempted or
> migrated.  The driver doesn't save and restore branch records for these
> cases, it just invalidates all records when a task is scheduled in.
>
> As a result, if an event overflow is close to context switch, it is
> likely to capture incomplete branch records.  For a userspace-only
> tracing, it is risk to capture empty branch record after preemption
> and migrations.

There's the same risk if something else is recording kernel branches
when you are recording userspace only. I think the user has to be
aware if other things like context switches are perturbing their data.

Rob

