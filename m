Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFBDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1k4oEUXTOJ+rriLdoEhZFlwz+/uASP6aupeBWAGMgeM=; b=QkB8Fq2wRCmSmD6QFidfRv5e9i
	mW03iE0i6D6t4RYP47kogSVBYcMN3+RE0hZJ3Po/LcXWN4YxRZUzoUruimRfMHnUqGPL2H+GNhwN5
	OjWqUqQiHiRov1iGFojt19NBeaePSGCkHza8Nor3085yRTQDrwsr5uH6rbi9YIcTqV0Zu7JBw5Rt2
	6w4JOLxcT21HAwwNn9PFXy9wCn0Ia2hn0hzHyY+gWPiAZ1FTK7/Ft3PxvO9R5SZwXjXWBbhiMna9V
	mdKDoH2pS7806182EAlE6LpZNT2rPkcJEM92Ra78oT1/d5VbDB7mYMAL2Fq5vHvryYzgBh14ECguq
	RCb0jRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHnS-00000003y8c-1AQt;
	Wed, 26 Feb 2025 13:49:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHlw-00000003y1K-0eDN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 13:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1k4oEUXTOJ+rriLdoEhZFlwz+/uASP6aupeBWAGMgeM=; b=coGKEO27y+8cE4t34PPfR4Ig+T
	3Mw+5I9cgZKnCJ3lJRRmBQOO89XKl1r4WFEkIVAX0O20ww4WyOa5o+TyAXCjmW4Cy4AGK6Yr0ZFgt
	PrJ2LK9qEP6BRZUNLbLse8WSINK1so0p7mEkNXDuSlD69WMlMxHn309jyM9fVwzIqew5MdNR6coBB
	0VeY7b1l5HmT1UFeP9WgphN9tReH0ALT4FISHdpBBD0hDZdodnrqYCZzed9k/jYTTn785uo6HD3h0
	2E39mgKnFDjJ4Eekti+4Eu8LrA5rHD01PIxlYW3R5qFFJglExw1u2zEUOOeKQYAA6YmrQ9Y4CnAsl
	VencPJRg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHls-00000003bUo-2xN6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 13:48:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC0D31516;
	Wed, 26 Feb 2025 05:48:33 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8908A3F673;
	Wed, 26 Feb 2025 05:48:17 -0800 (PST)
Date: Wed, 26 Feb 2025 13:48:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <20250226134813.GC1821331@e132581.arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org>
 <20250224122507.GE8144@e132581.arm.com>
 <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
 <20250224140317.GF8144@e132581.arm.com>
 <Z7yY19UtSnND5KTl@J2N7QTR9R3.cambridge.arm.com>
 <20250224180301.GI8144@e132581.arm.com>
 <Z72xMLsd37I6X_5-@J2N7QTR9R3>
 <20250225174803.GB1821331@e132581.arm.com>
 <Z74g2vUT9-KtlIvo@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z74g2vUT9-KtlIvo@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134821_134860_3F1AD74A 
X-CRM114-Status: GOOD (  54.21  )
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

On Tue, Feb 25, 2025 at 07:58:18PM +0000, Mark Rutland wrote:
> On Tue, Feb 25, 2025 at 05:48:03PM +0000, Leo Yan wrote:
> > On Tue, Feb 25, 2025 at 12:01:52PM +0000, Mark Rutland wrote:
> > 
> > [...]
> > 
> > > > > Critically, the brbe_enable() function merges the filters of all
> > > > > *active* events which have been installed into hardware. It does not
> > > > > track all events which can be rotated, and the resulting filter is not
> > > > > the same -- it can change as a result of rotation.
> > > > 
> > > > In a perf session has multiple events, and events have different branch
> > > > filters, seems to me, a simple way is to return error for this case.
> > > 
> > > FWIW, I'd generally prefer to do that since it avoids a number of
> > > horrible edge-cases and gets rid of the need to do SW filtering, which
> > > falls somewhere between "tricky" and "not entirely possible". However,
> > > that's not what LBR and others do, which is why we went with filter
> > > merging.
> > > 
> > > If folk on the tools side are happy with the kernel rejecting
> > > conflicting events, then I'd be more than happy to do that. What I don't
> > > want is that we start off with that approach and people immediately
> > > start to complain that the BRBE driver rejects events that the LBR
> > > driver accepts.
> > > 
> > > See the last time this came up.
> > 
> > Thanks for the shared links.  Based on the info, let's say we can have two
> > cases:
> > 
> >   Case 1: set different branch filters in a single perf session:
> > 
> >     perf record -e armv8_pmuv3_0/r03,branch_type=any_call/u \
> >                 -e armv8_pmuv3_0/r04,branch_type=any_ret/k ...
> > 
> >   Case 2: set different branch filters in multiple perf sessions:
> > 
> >     perf record -e armv8_pmuv3_0/r03,branch_type=any_call/u ...
> > 
> >     perf record -e armv8_pmuv3_0/r04,branch_type=any_ret/k ...
> > 
> > In my previous reply, I was suggesting that we should reject the case 1.
> 
> Do you mean that the kernel should reject that, or that userspace should
> reject that.

For the case 1, the userspace can reject it as it has sufficient info to
detect mismatched filters by iterating event list.

> As mentioned earlier, I am ok with the idea that we reject *scheduling*
> events with mismatched filters, as we do for other resource conflicts.
> That would necessarily mean rejecting *groups* of events with
> inconsistent filters at open time.

This rejects the case 2 in the PMU driver.

> However, I do not think that we should reject indepenent events which
> happen to have mismatched filters, regardless of whether they're opened
> by the same "session".

Can I understand "independent events" are events that are not in a event
group?

If independent events can have mismatched filters, the PMU driver can
activate them simultaneously, this means the BRBE driver needs to merge
the branch filters.  If so, I still see the complexity caused by this
case.

> > IMO, it is not quite useful to configure different filters for events in
> > the same session, especially if this leads complexity in the driver due
> > to the hardware limitation.
> 
> I generally agree, but IIRC userspace does this today.
> 
> > For case 2, when create a new session, if the perf tool can read out the
> > current branch filter setting (e.g. via sysfs node) and give suggestion
> > what branch filter is compabile with existed sessions, seems to me, this
> > is a feasible solution.  My understanding this is a rare case, and a
> > clear guidance for users would be sufficient if this happens.  (Maybe
> > we can give recommendation for how to use BRBE in the perf doc).
> 
> No. We are not going to expose *dynamic* information about the PMU
> hardware via sysfs. This is not as simple as you make it out to be.
> At any point in time there can be an arbitrary number of events open,
> and some arbitrary subset currently scheduled.

If so, the perf tool will miss info for checking the existed branch
filter and defer to handle the mismatched filter error until the
kernel reports the issue.

> I agree that ideally this should be rare, though, and hence either of
> the two options I have suggested thus far should handle that acceptably.
> 
> > To be clear, an important factor is the trace modes with modifier 'u'
> > (user) and 'k' (kernel) should be supported for different events and for
> > different sessions.  In a mixed cases (some events are userspace only
> > and some are kernel only), the BRBE driver needs to filter out branch
> > records for specific mode when taking a sample.
> 
> I hate to repeat myself, but the driver has *no concept whatsoever* of a
> "session". It only knows:
> 
> * Which events are currently active in hardware.
> 
> * Which events have been grouped together.
> 
> * Which events have been opened for a given task or CPU context.
> 
> ... and *NONE* of those correspond directly to a "session" managed by
> the userspace perf tool.

Sorry for that.  After your reminder, I understood that the PMU driver
has no knowledge for perf session.

The description above does not refer to perf session.  As you said, the
PMU driver has its own context to track active events, and it is
possible that some active events might trace only user mode while others
trace only kernel mode.  In this case, BRBE needs to be enabled for both
user and kernel modes.  When capturing samples, the BRBE driver needs to
filter out branch records based on a specific event for its
corresponding mode.

For better understanding, though we don't allow mismatched filters, I
still think we should set both E0BRE and ExBRE bits if there are
multiple active events with different modes.

[...]

> > I haven't done any experiments for this. If you think this is the way
> > to move forward, I might do a prototype and get back to you to ensure we
> > don't run into any unexpected issues.
> 
> What specifically are you proposing to prototype?

I mean, in Linux perf, we can add code to check branch filters for
opened events when creating a session and report an error for
mismatching filters.  I would suggest we implement it specifically
for Arm64 to avoid dispute with other archs.

Thanks,
Leo

