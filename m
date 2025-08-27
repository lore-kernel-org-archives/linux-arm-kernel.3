Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D252ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6196K8b9+MG5o4AtOQJKUUdlGUlbg/6yMa2kEgseBX0=; b=hLXRMOJ8f7+xZz6uDZqqCsIVP2
	OgcZTmp3v5/U2JC7yVDY7ey68Fx3ok3tEJnofuhyOMobimVRmdWyUdu7EJr0Vva58G7eeRF6jkN16
	k5As56xvA0pcDP2hAjniMHFz5tjKVtraXCRc76SQjW3d5nymYKNF91T1KrIZwIDO/5Ae2npmvC0pF
	PNHWs9mPTPbUhrI40QDrUmhZ5VrlkRqyx6wbSiaMSljI0/o7xKFeCjVzjsPIR/TDYcZzpJ7PHrHTq
	+bJsdVJ/D3DTJFaO2f5FC7izhaC4//VTdrBGzZfxMGok6jFT31b6OjAlGS9oZZBWuSu1fXnG+CrfR
	6SkL9PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBCR-0000000Eb0v-2rsD;
	Wed, 27 Aug 2025 08:08:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urB9i-0000000EaJ8-1x34;
	Wed, 27 Aug 2025 08:05:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E3641691;
	Wed, 27 Aug 2025 01:05:09 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D650B3F694;
	Wed, 27 Aug 2025 01:05:07 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:04:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 18/19] perf: Introduce positive capability for raw events
Message-ID: <aK68Ht03vZ0G3Xpt@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com>
 <aK259PrpyxguQzdN@J2N7QTR9R3>
 <015974a4-f129-4ae5-adf9-c94b29f0576a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015974a4-f129-4ae5-adf9-c94b29f0576a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_010518_583736_FA2FA692 
X-CRM114-Status: GOOD (  38.16  )
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

On Tue, Aug 26, 2025 at 11:46:02PM +0100, Robin Murphy wrote:
> On 2025-08-26 2:43 pm, Mark Rutland wrote:
> > On Wed, Aug 13, 2025 at 06:01:10PM +0100, Robin Murphy wrote:
> > To bikeshed a little here, I'm not keen on the PERF_PMU_CAP_RAW_EVENTS
> > name, because it's not clear what "RAW" really means, and people will
> > definitely read that to mean something else.
> > 
> > Could we go with something like PERF_PMU_CAP_COMMON_CPU_EVENTS, to make
> > it clear that this is about opting into CPU-PMU specific event types (of
> > which PERF_TYPE_RAW is one of)?
> 
> Indeed I started with that very intention after our previous discussion, but
> soon realised that in fact nowhere in the code is there any definition or
> even established notion of what "common" means in this context, so it's
> hardly immune to misinterpretation either.

We can document that; it's everything less than PERF_TYPE_MAX:

	enum perf_type_id {
		PERF_TYPE_HARDWARE                      = 0, 
		PERF_TYPE_SOFTWARE                      = 1, 
		PERF_TYPE_TRACEPOINT                    = 2, 
		PERF_TYPE_HW_CACHE                      = 3, 
		PERF_TYPE_RAW                           = 4, 
		PERF_TYPE_BREAKPOINT                    = 5, 

		PERF_TYPE_MAX,                          /* non-ABI */
	};

... and maybe you could use "PERF_PMU_CAP_ABI_TYPES" to align with that
comment?

> Furthermore the semantics of the cap as it ended up are specifically
> that the PMU wants the same behaviour as if it had registered as
> PERF_TYPE_RAW, so having "raw" in the name started to look like the
> more intuitive option after all (plus being nice and short helps.)

I appreciate the shortness, but I think it's misleading to tie this to
"RAW" specifically, when really this is a capabiltiy to say "please let
me try to init any events for non-dynamic types, in addition to whatever
specific type I am registered with".

> If anything, it's "events" that carries the implication that's proving hard
> to capture precisely and concisely here, so maybe the answer to avoid
> ambiguity is to lean further away from a "what it represents" to a "what it
> actually does" naming - PERF_PMU_CAP_TYPE_RAW, anyone?

I'm happy with TYPE in the name; it's just RAW specifically that I'm
objecting to.

> > Likewise, s/is_raw_pmu()/pmu_supports_common_cpu_events()/.
> 
> Case in point: is it any more logical and expected that supporting common
> CPU events implies a PMU should be offered software or breakpoint events as
> well? Because that's what such a mere rename would currently mean :/

Yes, I think it is.

> > > ---
> > > 
> > > A further possibility is to automatically add the cap to PERF_TYPE_RAW
> > > PMUs in perf_pmu_register() to have a single point-of-use condition; I'm
> > > undecided...
> > 
> > I reckon we don't need to automagically do that, but I reckon that
> > is_raw_pmu()/pmu_supports_common_cpu_events() should only check the cap,
> > and we don't read anything special into any of
> > PERF_TYPE_{RAW,HARDWARE,HW_CACHE}.
> 
> OK, but that would then necessitate having to explicitly add the cap to all
> 15-odd other drivers which register as PERF_TYPE_RAW as well, at which point
> it starts to look like a more general "I am a CPU PMU in terms of most
> typical assumptions you might want to make about that" flag...
> 
> To clarify (and perhaps something for a v2 commit message), we currently
> have 3 categories of PMU driver:
> 
> 1: (Older/simpler CPUs) Registers as PERF_TYPE_RAW, wants
> PERF_TYPE_RAW/HARDWARE/HW_CACHE events
> 2: (Heterogeneous CPUs) Registers as dynamic type, wants
> PERF_TYPE_RAW/HARDWARE/HW_CACHE events plus events of its own type
> 3: (Mostly uncore) Registers as dynamic type, only wants events of its own
> type

Sure, but I think that separating 1 and 2 is an artificial distinction,
and what we really have is:

(a) Wants to handle (some of) the non-dynamic/common/ABI types (in
    addition to whatever specific type it was registered with). Needs to
    have a switch statement somewhere in pmu::event_init().

(b) Only wants to handle the specific type the PMU was registered with.

> My vested interest is in making category 3 the default behaviour, given that
> the growing majority of new drivers are uncore (and I keep having to write
> them...) 

Yes, we're aligned on that.

> However unclear the type overlaps in category 1 might be, it's been
> like that for 15 years, so I didn't feel compelled to churn fossils like
> Alpha more than reasonably necessary. Category 2 is only these 5 drivers, so
> a relatively small tweak to distinguish them from category 3 and let them
> retain the effective category 1 behaviour (which remains the current one of
> potentially still being offered software etc. events too) seemed like the
> neatest way to make progress.

I just think we should combine 1 and 2 (into categroy a as above), since
that removes the need to treat RAW specially going forwards.

> I'm not saying I'm necessarily against a general overhaul of CPU PMUs being
> attempted too, just that it seems more like a whole other side-quest, and
> I'd really like to slay the uncore-boilerplate dragon first.

I think that adding the cap to those 15 PMUs would take less time than
it has taken me to write this email, so I do not understand the
objection.

Mark.

