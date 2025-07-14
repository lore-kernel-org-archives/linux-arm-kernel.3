Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC26C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZK/Eps0tH+EF/Ex3evTE4MoPJwV6DEvId/UeQB2NzE=; b=Wg5EjrmhTbKJfx0OvtPIIDyhNP
	kh7zmp88ugs92Hv8fprSnUl58RibHj7YP3quRh5Pa9G8IkEERQagMnOnTMrp4amkcq+lcZcFwcdri
	//dwoaJIE1cWHNWbijcoD9M8T+5rkO9aTouGCf2mvZLHEeYf4KtsSgQ4gJG/I/Gycf2FHcFp27tJz
	LzFg58WEvOoGJ7f4y7LNDdkxlRb2gMbsEgCNoMJhY2u5sqP4GHbu6ly6m6gt+7opodJP82VVT4Nyc
	HnpTWHCxF+cdgC91hCaOFtY2QrGyZprcpypJWvZr7LNxd3qSUL1iE5T545/PPsM4pbEs4YFXjOPoS
	47Lm9DwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLzI-00000002pSu-0Kjf;
	Mon, 14 Jul 2025 16:25:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKo0-00000002abp-3rx5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:09:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB2831BC0;
	Mon, 14 Jul 2025 08:09:14 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B0CB3F66E;
	Mon, 14 Jul 2025 08:09:23 -0700 (PDT)
Date: Mon, 14 Jul 2025 16:09:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	German Gomez <german.gomez@arm.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 01/14] drivers/perf: arm_spe: Expose event filter
Message-ID: <20250714150921.GE1093654@e132581.arm.com>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
 <20250707-arm_spe_support_hitm_overhead_v1_public-v3-1-33ea82da3280@arm.com>
 <aHUBFGPck-O3vs9b@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHUBFGPck-O3vs9b@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080925_006595_8E2CBC5B 
X-CRM114-Status: GOOD (  21.29  )
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

Hi Will,

On Mon, Jul 14, 2025 at 02:07:32PM +0100, Will Deacon wrote:

[...]

> > +static u64 arm_spe_pmsevfr_res0(u16 pmsver)
> > +{
> > +	switch (pmsver) {
> > +	case ID_AA64DFR0_EL1_PMSVer_IMP:
> > +		return PMSEVFR_EL1_RES0_IMP;
> > +	case ID_AA64DFR0_EL1_PMSVer_V1P1:
> > +		return PMSEVFR_EL1_RES0_V1P1;
> > +	case ID_AA64DFR0_EL1_PMSVer_V1P2:
> > +	/* Return the highest version we support in default */
> > +	default:
> > +		return PMSEVFR_EL1_RES0_V1P2;
> > +	}
> > +}
> 
> Hmm. This logic was already a little shakey and so I'm not sure it's a
> good idea to expose it directly to userspace. Maintaining RES0 masks for
> different versions of SPE won't scale and there are already things that
> we can't sensibly handle. For example, E[8]:
> 
>   | When (FEAT_SPEv1p4 is implemented or filtering on event 8 is
>   | optionally supported) and event 8 is implemented:
> 
> So, stepping back, can we remove this stuff altogether? The bits are
> RAZ/WI in the case that the even is not implement, but that means that:
> 
>   | Software can rely on the field reading as all 0s, and on writes being
>   | ignored.
> 
> so why are we even bothering to police this?

It's fine with me to remove the validation for the event filter.

However, I have the following question in comment below.

> In other words, remove arm_spe_pmsevfr_res0() and the two checks that
> use it in arm_spe_pmu_event_init(). If userspace tries to filter events
> that aren't implemented, then it gets to keep the pieces.

Then the question is: what information should be exposed to userspace
so that tools can decide which events are valid?

I would suggest to expose a new entry, "caps/version", to indicate the
SPE version number. Tools can use this to apply the appropriate event
validation. Please let me know if this works for you.

Thanks,
Leo

