Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43DFCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYPEIHnOd/9ENj5YhEbvYpX1FgPuoCr14RyQyLjRaZw=; b=ZKyJH53tNxA5WculZ4BDQmK1R7
	yecOexWb2j0AU5fb6YAnX/dsPYR32RBJ9vBRrhY78TnkpFdVJN8D0KlDfj0T43u/eO/vRvFmtDzXl
	7Bl2qQXkVZ2RRAeO38gDlBitgEXIj+9tVRHkumcm0Pm5sZoWchwr56cPucB482QzBeiEbEsc7roS+
	LpRPVqW1We7xtSLHd+Xz4CvwoaMkuoNoaf7pGGDtGTka5NRmsOu/p6qBQ3GPxdtRza3pm07WTUVFJ
	A5VzmhbU2AT0lqqCOrDSq6FbZAwaSrsg9Fdx3zWCkxPDZjbzYVBo9Hzc5xmj18N9K2fLdhgGcRxHO
	lAsjr4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPiQ-00000005OER-0ERr;
	Tue, 02 Dec 2025 12:42:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPiN-00000005OE4-432o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 12:42:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CE67153B;
	Tue,  2 Dec 2025 04:42:35 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 065FF3F73B;
	Tue,  2 Dec 2025 04:42:41 -0800 (PST)
Date: Tue, 2 Dec 2025 12:42:40 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] perf arm-spe: Don't hard code config attribute
Message-ID: <20251202124240.GA724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-7-22ecbbf8007c@linaro.org>
 <20251202122835.GY724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202122835.GY724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_044244_051069_48BBA1F2 
X-CRM114-Status: GOOD (  24.35  )
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

On Tue, Dec 02, 2025 at 12:28:35PM +0000, Coresight ML wrote:
> On Mon, Dec 01, 2025 at 04:41:10PM +0000, Coresight ML wrote:
> > Use the config attribute that's published by the driver instead of
> > hard coding "attr.config".
> > 
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> >  tools/perf/arch/arm64/util/arm-spe.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
> > index d5ec1408d0ae..6c3dc97fde30 100644
> > --- a/tools/perf/arch/arm64/util/arm-spe.c
> > +++ b/tools/perf/arch/arm64/util/arm-spe.c
> > @@ -256,7 +256,7 @@ static __u64 arm_spe_pmu__sample_period(const struct perf_pmu *arm_spe_pmu)
> >  
> >  static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
> >  {
> > -	u64 bit;
> > +	u64 pa_enable_bit;
> >  
> >  	evsel->core.attr.freq = 0;
> >  	evsel->core.attr.sample_period = arm_spe_pmu__sample_period(evsel->pmu);
> > @@ -288,9 +288,10 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
> >  	 * inform that the resulting output's SPE samples contain physical addresses
> >  	 * where applicable.
> >  	 */
> > -	bit = perf_pmu__format_bits(evsel->pmu, "pa_enable");
> > -	if (evsel->core.attr.config & bit)
> > -		evsel__set_sample_bit(evsel, PHYS_ADDR);
> > +
> > +	if (!evsel__get_config_val(evsel->pmu, evsel, "pa_enable", &pa_enable_bit))
> > +		if (pa_enable_bit)
> > +			evsel__set_sample_bit(evsel, PHYS_ADDR);
> 
> Hmm... I am a bit concerned for the evsel__get_config_val() usage
> throughout the series.
> 
> evsel__get_config_val() returns a whole config value rather than the
> bit field specified by the format name.  If other bits (but not the
> "pa_enable" bit) are set in the same config set, would it wrongly set
> the PHYS_ADDR sample bit?

I saw you used FIELD_GET() to read specific bit field in
evsel__get_config_val().  This is not concerned anymore.

Sorry for noise.

> Seems to me, for reading specific format, perf_pmu__format_bits() is
> more suitable than evsel__get_config_val().

For me, this comment is still valid, given perf_pmu__format_bits()
will always exist.

Thanks,
Leo

