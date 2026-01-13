Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8491D30CC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQtw1QlINWaHXohytA44MIFS3mdzdTN7dCu4SDPP/2Q=; b=m84PieafRwFg+RWq+jk/p2UTg6
	gJGz3sEMSVZwwiUh5shhZ4DngQRTeZ1u77kJeAwC6NjYbjdmJgrEZ1jZY2Sc4ElVfQlcuzbP/MRUQ
	d5n8uHY5NhBqj51m3Fgw9lJmzikA3tLY1HNAKVajGCcQb74SobhrhDxSaI+s55YO7MivFRz13uchR
	uVhvs2h9LGwSEzeEHHp1XwZksSx0nX7pZNhQlX62SCaCAD3W0K5jAVE6ok9RYZBAeoNAuLaf69Hub
	ixqDBl+nQkVdurpn3i20ofuapdDdlE1KJCKlEkHPrOIfDcNTf3ry+APYhx3FHoxaqqDCsA+Rzre3G
	FmvzSBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflWJ-00000007igM-2Clo;
	Tue, 13 Jan 2026 21:01:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vflWH-00000007igG-3uvG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 21:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1AE96001A;
	Tue, 13 Jan 2026 21:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A5FC116C6;
	Tue, 13 Jan 2026 21:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338100;
	bh=8BuC3uPN/BYM88IDzqSaQ1+hs1vVGCV47S+Cpmif9yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCilBLwtTFRvZt+lRmRumMfvNaGG4EnOPWncpu8wEGnJJSVjNRVHzaV8qahSInZIm
	 atUPE8FACN4WXuvG6h7MTK5TuQOTNpVTDRvlqqVrOh4odMbv9Wkw3IKkHonN5OToiz
	 oA3MDuVs2Sofz0iyBymLyKyem4s0JHSrc3YPex2bufAhOw1tn88GInt5XhcQ/Fw6ug
	 7VlMOlutjIOnCHAE0tyUqnOYaEwXb0mWMdhdAkFJNFeFtqqoixxs6Wb2w7Ch2JZyCC
	 lf6zTxhpaRdunStI0aHgT74rXbvp4C6xBHHHHzib8ieU6LMRGnNV+Vqag1mS2d51Up
	 RKjiUKxb4M01g==
Date: Tue, 13 Jan 2026 18:01:37 -0300
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
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v4 00/14] perf cs-etm/arm-spe: Remove hard coded config
 fields
Message-ID: <aWaysdXYIWi4nB1D@x1>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
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

On Mon, Dec 22, 2025 at 03:14:25PM +0000, James Clark wrote:
> The specific config field that an event format attribute is in is
> consistently hard coded, even though the API is supposed to be that the
> driver publishes the config field name. To stop this pattern from being
> copy pasted and causing problems in the future, replace them all with
> calls to a new helper that returns the value that a user set.
> 
> This reveals some issues in evsel__set_config_if_unset(). It doesn't
> work with sparse bitfields, which are an unused but documented feature.
> And it also only writes to the attr.config field. To fix it we need to
> start tracking user changes for all config fields and then use existing
> helper functions that support sparse bitfields. Some other refactoring
> was also required and a test was added.

Thanks, applied to perf-tools-next,

- Arnaldo
 
> ---
> Changes in v4:
> - Constify some function args (Ian)
> - Move some evsel__* functions to evsel.c and make some pmu.c functions
>   public to support this (Ian)
> - Drop pmu arg where it can be fetched from evsel->pmu (Ian)
> - Link to v3: https://lore.kernel.org/r/20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org
> 
> Changes in v3:
> - Fix uninitialized variable warning on GCC
> - Fix leak of evlist in test
> - Confirm no type punning issues with ubsan (Ian)
> - Link to v2: https://lore.kernel.org/r/20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org
> 
> Changes in v2:
> - Remove macros in get_config_chgs() and some other refactoring.
> - Support sparse bitfields in evsel__set_config_if_unset().
> - Always track user changes instead of only when
>   'pmu->perf_event_attr_init_default' is set.
> - Add a test.
> - Don't bail out in cs-etm.c if any format fields are missing (Leo).
> - Rename 'guess' to 'synth' (Mike).
> - Link to v1: https://lore.kernel.org/r/20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org
> 
> ---
> James Clark (14):
>       perf parse-events: Refactor get_config_terms() to remove macros
>       perf evsel: Refactor evsel__set_config_if_unset() arguments
>       perf evsel: Move evsel__* functions to evsel.c
>       perf evsel: Support sparse fields in evsel__set_config_if_unset()
>       perf parse-events: Track all user changed config bits
>       perf evsel: apply evsel__set_config_if_unset() to all config fields
>       perf evsel: Add a helper to get the value of a config field
>       perf parse-events: Always track user config changes
>       perf tests: Test evsel__set_config_if_unset() and config change tracking
>       perf cs-etm: Make a helper to find the Coresight evsel
>       perf cs-etm: Don't use hard coded config bits when setting up ETMCR
>       perf cs-etm: Don't use hard coded config bits when setting up TRCCONFIGR
>       perf cs-etm: Don't hard code config attribute when configuring the event
>       perf arm-spe: Don't hard code config attribute
> 
>  tools/perf/arch/arm/util/cs-etm.c    | 201 +++++++++++++++-------------
>  tools/perf/arch/arm64/util/arm-spe.c |  17 +--
>  tools/perf/arch/x86/util/intel-pt.c  |   3 +-
>  tools/perf/tests/pmu.c               |  91 +++++++++++++
>  tools/perf/util/evsel.c              | 112 +++++++++++++++-
>  tools/perf/util/evsel.h              |   6 +-
>  tools/perf/util/evsel_config.h       |   7 +-
>  tools/perf/util/parse-events.c       | 248 ++++++++++++++++++++---------------
>  tools/perf/util/pmu.c                |  95 ++++----------
>  tools/perf/util/pmu.h                |  34 ++++-
>  10 files changed, 529 insertions(+), 285 deletions(-)
> ---
> base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
> change-id: 20251112-james-perf-config-bits-bee7106f0f00
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 

