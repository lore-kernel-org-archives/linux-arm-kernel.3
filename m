Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC2BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+n/fOwu3vnOZMAca95n4Vw6Au6UlYsDHbq/0YFH5/xk=; b=xi9fKg/AGI4gRSIm+DSx8u496T
	HQzLEf9kYi8hQ1eGxDN/R6bY0dsesNXjgQpjPN0rAHA5lYLQ1nfotDxHipCVRRnRxdTJUj2s4peUN
	7f5BQJUT5/UsY9w2wbovjWLriLJat4gDgvy5jc9FR+hjTaD94TVV+ilcrDa9oNrXWrGKi21rGLsAK
	/TEwQhz9wqtrwiSLAE4vTHGcshEw8j+BNV/wl73BWdLLNNMuHtKLI+x6zkBlk108+NOD7GXOL2cbp
	57GhxQXg1dL6g1ObAXKfLoTXK39CnfT9zXRcEJvgCkqf/bMoUt2nXExsUfwLA89FNkNMxadL8eilb
	LX9Yeppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZVk-0000000E6if-1i78;
	Mon, 24 Feb 2025 14:32:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ3L-0000000E0ij-12sy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:03:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37BD71516;
	Mon, 24 Feb 2025 06:03:39 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234F93F5A1;
	Mon, 24 Feb 2025 06:03:22 -0800 (PST)
Date: Mon, 24 Feb 2025 14:03:17 +0000
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <20250224140317.GF8144@e132581.arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org>
 <20250224122507.GE8144@e132581.arm.com>
 <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_060323_335480_C977E80A 
X-CRM114-Status: GOOD (  25.54  )
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

On Mon, Feb 24, 2025 at 06:46:35AM -0600, Rob Herring wrote:
> On Mon, Feb 24, 2025 at 6:25 AM Leo Yan <leo.yan@arm.com> wrote:
> > On Tue, Feb 18, 2025 at 02:40:06PM -0600, Rob Herring (Arm) wrote:
> > >
> > > From: Anshuman Khandual <anshuman.khandual@arm.com>
> >
> > [...]
> >
> > > BRBE records are invalidated whenever events are reconfigured, a new
> > > task is scheduled in, or after recording is paused (and the records
> > > have been recorded for the event). The architecture allows branch
> > > records to be invalidated by the PE under implementation defined
> > > conditions. It is expected that these conditions are rare.
> >
> > [...]
> >
> > > +static void armv8pmu_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
> > > +{
> > > +       struct arm_pmu *armpmu = *this_cpu_ptr(&cpu_armpmu);
> > > +       struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
> > > +
> > > +       if (!hw_events->branch_users)
> > > +               return;
> > > +
> > > +       if (sched_in)
> > > +               brbe_invalidate();
> > > +}
> >
> > Just a minor concern.  I don't see any handling for task migration.
> > E.g., for a task is migrated from one CPU to another CPU, I expect we
> > need to save and restore branch records based on BRBE injection.  So
> > far, the driver simply invalidates all records.
> >
> > I think this topic is very likely discussed before.  If this is the
> > case, please ignore my comment.  Except this, the code looks good
> > to me.
> 
> Not really discussed on the list, but that was present in v18 (though
> not functional because .sched_task() hook wasn't actually enabled) and
> Mark removed it. His work is here[1].The only comment was:
> 
> Note: saving/restoring at context-switch doesn't interact well with
> event rotation (e.g. if filters change)

In the brbe_enable() function, it "Merge the permitted branch filters
of all events".  Based on current implementation, all events share the
same branch filter.

When event rotation happens, if without context switch, in theory we
should can directly use the branch record (no invalidation, no injection)
for all events.

For a context-switch case, we need to save and re-inject branch record.
BRBE record sticks to a process context, no matter what events have been
enabled.

Thanks,
Leo

