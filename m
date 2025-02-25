Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4053FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqknaXKfYz8VwCMtAEXVYCJ7XxYuwOhBbXj4Vop31ng=; b=KcyXqv0J24QOwq3q4LgtsAeAAs
	lmxPNX2C3TFgriAOlBnH9vmoMR3Ev3TYXZWQg9s0Tu7D06ErLMzcyCC7kweZZRHW9wiOLDBUBFOI0
	6eQEIexVpqwCv6FD+BlSUMwZ09ranXQTVYhqMBCZuyPtb0rYpi4UjjKEMil2c8MR8C7b9mU4w4RqI
	NsF2VNhAs46/EZhxRLNZTNDtkAvIXEVOiVsaCWTSkdaj1gWEycHuzqeNxPyHasbiaBl7hfXgFfMP2
	Jf7IV2keCRkafHdcgBumYyA0mQkg120lKhRy2tLa9Y5BZLwhQABMUQjIFk3iDkuxjW/SB1zzxhCdE
	vYFpGbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Li-00000001KZT-15cv;
	Tue, 25 Feb 2025 20:16:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn14S-00000001H0p-471i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:58:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 427E6152B;
	Tue, 25 Feb 2025 11:58:39 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD9303F6A8;
	Tue, 25 Feb 2025 11:58:20 -0800 (PST)
Date: Tue, 25 Feb 2025 19:58:18 +0000
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
Message-ID: <Z74g2vUT9-KtlIvo@J2N7QTR9R3.cambridge.arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org>
 <20250224122507.GE8144@e132581.arm.com>
 <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
 <20250224140317.GF8144@e132581.arm.com>
 <Z7yY19UtSnND5KTl@J2N7QTR9R3.cambridge.arm.com>
 <20250224180301.GI8144@e132581.arm.com>
 <Z72xMLsd37I6X_5-@J2N7QTR9R3>
 <20250225174803.GB1821331@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225174803.GB1821331@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_115825_106775_1C3E4704 
X-CRM114-Status: GOOD (  48.85  )
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

On Tue, Feb 25, 2025 at 05:48:03PM +0000, Leo Yan wrote:
> On Tue, Feb 25, 2025 at 12:01:52PM +0000, Mark Rutland wrote:
> 
> [...]
> 
> > > > Critically, the brbe_enable() function merges the filters of all
> > > > *active* events which have been installed into hardware. It does not
> > > > track all events which can be rotated, and the resulting filter is not
> > > > the same -- it can change as a result of rotation.
> > > 
> > > In a perf session has multiple events, and events have different branch
> > > filters, seems to me, a simple way is to return error for this case.
> > 
> > FWIW, I'd generally prefer to do that since it avoids a number of
> > horrible edge-cases and gets rid of the need to do SW filtering, which
> > falls somewhere between "tricky" and "not entirely possible". However,
> > that's not what LBR and others do, which is why we went with filter
> > merging.
> > 
> > If folk on the tools side are happy with the kernel rejecting
> > conflicting events, then I'd be more than happy to do that. What I don't
> > want is that we start off with that approach and people immediately
> > start to complain that the BRBE driver rejects events that the LBR
> > driver accepts.
> > 
> > See the last time this came up.
> 
> Thanks for the shared links.  Based on the info, let's say we can have two
> cases:
> 
>   Case 1: set different branch filters in a single perf session:
> 
>     perf record -e armv8_pmuv3_0/r03,branch_type=any_call/u \
>                 -e armv8_pmuv3_0/r04,branch_type=any_ret/k ...
> 
>   Case 2: set different branch filters in multiple perf sessions:
> 
>     perf record -e armv8_pmuv3_0/r03,branch_type=any_call/u ...
> 
>     perf record -e armv8_pmuv3_0/r04,branch_type=any_ret/k ...
> 
> In my previous reply, I was suggesting that we should reject the case 1.

Do you mean that the kernel should reject that, or that userspace should
reject that.

As mentioned earlier, I am ok with the idea that we reject *scheduling*
events with mismatched filters, as we do for other resource conflicts.
That would necessarily mean rejecting *groups* of events with
inconsistent filters at open time.

However, I do not think that we should reject indepenent events which
happen to have mismatched filters, regardless of whether they're opened
by the same "session".

> IMO, it is not quite useful to configure different filters for events in
> the same session, especially if this leads complexity in the driver due
> to the hardware limitation.

I generally agree, but IIRC userspace does this today.

> For case 2, when create a new session, if the perf tool can read out the
> current branch filter setting (e.g. via sysfs node) and give suggestion
> what branch filter is compabile with existed sessions, seems to me, this
> is a feasible solution.  My understanding this is a rare case, and a
> clear guidance for users would be sufficient if this happens.  (Maybe
> we can give recommendation for how to use BRBE in the perf doc).

No. We are not going to expose *dynamic* information about the PMU
hardware via sysfs. This is not as simple as you make it out to be.
At any point in time there can be an arbitrary number of events open,
and some arbitrary subset currently scheduled.

I agree that ideally this should be rare, though, and hence either of
the two options I have suggested thus far should handle that acceptably.

> To be clear, an important factor is the trace modes with modifier 'u'
> (user) and 'k' (kernel) should be supported for different events and for
> different sessions.  In a mixed cases (some events are userspace only
> and some are kernel only), the BRBE driver needs to filter out branch
> records for specific mode when taking a sample.

I hate to repeat myself, but the driver has *no concept whatsoever* of a
"session". It only knows:

* Which events are currently active in hardware.

* Which events have been grouped together.

* Which events have been opened for a given task or CPU context.

... and *NONE* of those correspond directly to a "session" managed by
the userspace perf tool.

> > > If we can unify branch filter within a perf session, would this be
> > > much easier for handling?
> > 
> > Do you mean if the perf tool ensured that all events in a given session
> > had the same filter? From the kernel's PoV there's no such thing as a
> > "perf session", and I'm not sure whether you're suggesting doing that in
> > userspace or withing the kernel.
> 
> My understanding is this would be not difficult to do such kind checking
> in the tool.  E.g., the perf tool can iterate every event and check the
> branch filter and detect incompabile issue.

Cool, sounds like we could do that then!

> > Doing that in the perf tool would certianly make a stronger argument for
> > the kernel taking the "reject conflicting branch filters" option.
> > 
> > Doing that within the kernel isn't really possible.
> 
> As said above, if the BRBE driver can provide a knob in sysfs to indicate
> what is the current branch filter in the existed sessions, this would be
> helpful for the tool to do the checking and remind users.

Sorry, as above, that is not going to happen. It is not practical and
will cause many other problems.

> I haven't done any experiments for this. If you think this is the way
> to move forward, I might do a prototype and get back to you to ensure we
> don't run into any unexpected issues.

What specifically are you proposing to prototype?

Mark.

