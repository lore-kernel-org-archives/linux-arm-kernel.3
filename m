Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5BDD30CDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O/TWiz7KmvDz4FXTKrdUQuVFVk8NsUp4b4FAv54g8A=; b=AruU5iREJlaglLbpXXzX9WCboQ
	2x/an7U/CqCPWhv89NdENxIyhlpBn8OVITTBqy9sEKvagYT4ktKtWLj9/SQDapojNZtXKAUO0eLiA
	c/N1xHatZ57aUQDDUDc8nCYenqvolnwEM23i13o7z4IJBATbeeMlJXNfHoFGM9sWbTDF01bsr5pMR
	+jiWe76u5aaM/gESc9/lU3Wef+cTsu9Z6DevrS/jByAZX2QjekfGblyW35DXnI+jp005UcG/nZTGB
	JScE43WXhnaXPL0YETeyvWpGAxcXcvCVbc2zVE4jZjPl/dTx5bRa+CfAy31WsIRpsDGfyrI5CeTeQ
	DZ2yXXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmdn-00000007o9p-0Ngi;
	Tue, 13 Jan 2026 22:13:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmdi-00000007o8n-44M2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 22:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 947A143DED;
	Tue, 13 Jan 2026 22:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2F4C116C6;
	Tue, 13 Jan 2026 22:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342406;
	bh=ZyRwpdeHQJLYuREFufXZqOyxnfIVStjxw0TP41ppM4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFdkia8Ph0P6rGiCN8k8vqU/Pt1Gxk+ATX0IxBrmZkCKk3tdZC3V80iar6hCGe5Uo
	 /dNl3ehyTQKliGbDpwFkOA5aKkqry4zBUvonxKjh+8u+RffBEbRBbOdHYVrnq/tz9y
	 Yloo/9Ky6pgHsKjFDYpxMpAgjNMlFI3X5wNqXNTv8JT7fsTyp+Xq2y0acsIVQGgrgO
	 1KTyVy+Jhtg1ecClMqvS8LUMKv4xtp5Z2cNgVntFhggnMY4Qe5tcuH5ddTixAlb1EY
	 NTCFiN+/cjtMtk2DjpgsS4Ig86qEfxRik4cNJx+78B7hFGjJmqLuxAud+VuHO5HWv4
	 zF73WI5/RiNOQ==
Date: Tue, 13 Jan 2026 19:13:23 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 02/14] perf evsel: Refactor
 evsel__set_config_if_unset() arguments
Message-ID: <aWbDg0kmo-isxkz2@x1>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
 <20251222-james-perf-config-bits-v4-2-0608438186fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-james-perf-config-bits-v4-2-0608438186fc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_141328_593590_8C955745 
X-CRM114-Status: GOOD (  26.78  )
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

On Mon, Dec 22, 2025 at 03:14:27PM +0000, James Clark wrote:
> Make the evsel argument first to match the other evsel__* functions
> and remove the redundant pmu argument, which can be accessed via evsel.

I haven't checked if this is the exactly where this takes place but
should be in this series, 32-bit build is broken:

   3: almalinux:9-i386WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
WARNING: image platform (linux/386) does not match the expected platform (linux/amd64)
    21.72 almalinux:9-i386              : FAIL gcc version 11.4.1 20231218 (Red Hat 11.4.1-3) (GCC)
     1378 |         perf_pmu__format_pack(&bits, val, vp, /*zero=*/true);
          |                               ^~~~~
          |                               |
          |                               u64 * {aka long long unsigned int *}
    In file included from util/evsel.h:14,
                     from util/evsel.c:38:
    util/pmu.h:282:43: note: expected ‘long unsigned int *’ but argument is of type ‘u64 *’ {aka ‘long long unsigned int *’}
      282 | void perf_pmu__format_pack(unsigned long *format, __u64 value, __u64 *v,
          |                            ~~~~~~~~~~~~~~~^~~~~~


What I have is in perf-tools-next/tmp.perf-tools-next BTW, I'll try and
fix this tomorrow if you don't do it first. :-)

There are some more build problems in other containers/distros, I'll be
reporting as replies to the patches that looks related

- Arnaldo
 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/arch/arm/util/cs-etm.c    | 9 +++------
>  tools/perf/arch/arm64/util/arm-spe.c | 2 +-
>  tools/perf/arch/x86/util/intel-pt.c  | 3 +--
>  tools/perf/util/evsel.h              | 4 ++--
>  tools/perf/util/pmu.c                | 6 +++---
>  5 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
> index ea891d12f8f4..c28208361d91 100644
> --- a/tools/perf/arch/arm/util/cs-etm.c
> +++ b/tools/perf/arch/arm/util/cs-etm.c
> @@ -441,10 +441,8 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>  	 * when a context switch happened.
>  	 */
>  	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
> -		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
> -					   "timestamp", 1);
> -		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
> -					   "contextid", 1);
> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
> +		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>  	}
>  
>  	/*
> @@ -453,8 +451,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>  	 * timestamp tracing.
>  	 */
>  	if (opts->sample_time_set)
> -		evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
> -					   "timestamp", 1);
> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>  
>  	/* Add dummy event to keep tracking */
>  	err = parse_event(evlist, "dummy:u");
> diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
> index d5ec1408d0ae..51014f8bff97 100644
> --- a/tools/perf/arch/arm64/util/arm-spe.c
> +++ b/tools/perf/arch/arm64/util/arm-spe.c
> @@ -274,7 +274,7 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
>  	 */
>  	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>  		evsel__set_sample_bit(evsel, CPU);
> -		evsel__set_config_if_unset(evsel->pmu, evsel, "ts_enable", 1);
> +		evsel__set_config_if_unset(evsel, "ts_enable", 1);
>  	}
>  
>  	/*
> diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
> index b394ad9cc635..c131a727774f 100644
> --- a/tools/perf/arch/x86/util/intel-pt.c
> +++ b/tools/perf/arch/x86/util/intel-pt.c
> @@ -664,8 +664,7 @@ static int intel_pt_recording_options(struct auxtrace_record *itr,
>  		return 0;
>  
>  	if (opts->auxtrace_sample_mode)
> -		evsel__set_config_if_unset(intel_pt_pmu, intel_pt_evsel,
> -					   "psb_period", 0);
> +		evsel__set_config_if_unset(intel_pt_evsel, "psb_period", 0);
>  
>  	err = intel_pt_validate_config(intel_pt_pmu, intel_pt_evsel);
>  	if (err)
> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
> index a08130ff2e47..2cf87bc67df7 100644
> --- a/tools/perf/util/evsel.h
> +++ b/tools/perf/util/evsel.h
> @@ -575,8 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
>  	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
>  
>  u64 evsel__bitfield_swap_branch_flags(u64 value);
> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
> -				const char *config_name, u64 val);
> +void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
> +				u64 val);
>  
>  bool evsel__is_offcpu_event(struct evsel *evsel);
>  
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index 956ea273c2c7..e87c12946d71 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -1382,8 +1382,8 @@ bool evsel__is_aux_event(const struct evsel *evsel)
>   * something to true, pass 1 for val rather than a pre shifted value.
>   */
>  #define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
> -				const char *config_name, u64 val)
> +void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
> +				u64 val)
>  {
>  	u64 user_bits = 0, bits;
>  	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
> @@ -1391,7 +1391,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>  	if (term)
>  		user_bits = term->val.cfg_chg;
>  
> -	bits = perf_pmu__format_bits(pmu, config_name);
> +	bits = perf_pmu__format_bits(evsel->pmu, config_name);
>  
>  	/* Do nothing if the user changed the value */
>  	if (bits & user_bits)
> 
> -- 
> 2.34.1
> 

