Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685A3D64072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkIMmqnaIwxCDxAxQnGBThPQ8LryV1hyY5P6s4g7aUo=; b=PTBCUeFkadlko4HQVBMbCFZixE
	qUa+ZlERy870bcB/X3Cu5fY0HqMKbaxTmFp/zcMtitSxa4dhFSqUVTbpQmqSKLcWihbsXQZoqLdv1
	57paDKMqp44iQY3IGondUVPG0exqufEUK0bfTKlv+6xX6F1wdipSDYDfjMDkNlhuQ5XXF7DYYi1OX
	4KTlZc4MJjrQoC26jODzrfkULEJsPhHn1eIG9ZVl3LgeqRnje4KX7jkK0L1AFk9zyByf+tIObCVB5
	icaWgUAB0ATkI/O8AECMM9v4z5xC517lRPTGExK4oRUkR42vvSvtANPz0Wf5mR2XKihXhgu55s0bc
	5EB4uRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9T37-0000000BSl9-2o1h;
	Fri, 08 Nov 2024 17:45:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SxN-0000000BQjw-0tL5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 17:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC4FBA444E5;
	Fri,  8 Nov 2024 17:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C76C4CECD;
	Fri,  8 Nov 2024 17:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731087576;
	bh=XaQuID8TiBvkIJf++1pkBK7/hInFT3o78kefgCoQrrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3/ZQTYaURutgBxr6XMKFBmeTH0eKRChi4TpAbxg7YZsoL5qJp0vKhFLW//S2vv1V
	 8VAav/SUFJW/+jz0/DQ/kDwQM9OCBUwd3zn/+P6ZIb/EdPEW60QaIKL5P3Su2aVBgp
	 m6zeQyXjRj8TRe7FwaNq8dNJrevNivjeKpm1BG7IJZmCzVvKvUL/SJyC/jImEEuTiA
	 HfdRU7fCD94SmTrULBSL+3GID33C3LgLLo6ZXeQVTO3saP/u7IeTvsDSKWnlEPNTLx
	 tC0wyAwYM5+UlGkf9J2w1bJljd9kXcgtyWM0OmUMfGoycIGU570oG9I5L+oP5CJDrQ
	 T3bHapN/LVC9A==
Date: Fri, 8 Nov 2024 09:39:33 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Will Deacon <will@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Andi Kleen <ak@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	H Peter Anvin <hpa@zytor.com>,
	Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH V14 08/11] perf tools: Add missing_features for
 aux_start_paused, aux_pause, aux_resume
Message-ID: <Zy5M1WJ97GprNniq@google.com>
References: <20241022155920.17511-1-adrian.hunter@intel.com>
 <20241022155920.17511-9-adrian.hunter@intel.com>
 <20241108154152.GA197781@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108154152.GA197781@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_093937_415395_C3939B1C 
X-CRM114-Status: GOOD (  23.16  )
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

Hello,

On Fri, Nov 08, 2024 at 03:41:52PM +0000, Leo Yan wrote:
> Hi Adrian,
> 
> On Tue, Oct 22, 2024 at 06:59:14PM +0300, Adrian Hunter wrote:
> > 
> > Display "feature is not supported" error message if aux_start_paused,
> > aux_pause or aux_resume result in a perf_event_open() error.
> > 
> > Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> > Acked-by: Ian Rogers <irogers@google.com>
> > Reviewed-by: Andi Kleen <ak@linux.intel.com>
> > ---
> > 
> > 
> > Changes in V13:
> >         Add error message also in EOPNOTSUPP case (Leo)
> > 
> > 
> >  tools/perf/util/evsel.c | 12 ++++++++++++
> >  tools/perf/util/evsel.h |  1 +
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> > index 95593b55d9a7..88b31a005ac6 100644
> > --- a/tools/perf/util/evsel.c
> > +++ b/tools/perf/util/evsel.c
> > @@ -2102,6 +2102,12 @@ bool evsel__detect_missing_features(struct evsel *evsel)
> >                 perf_missing_features.inherit_sample_read = true;
> >                 pr_debug2("Using PERF_SAMPLE_READ / :S modifier is not compatible with inherit, falling back to no-inherit.\n");
> >                 return true;
> > +       } else if (!perf_missing_features.aux_pause_resume &&
> > +           (evsel->core.attr.aux_pause || evsel->core.attr.aux_resume ||
> > +            evsel->core.attr.aux_start_paused)) {
> > +               perf_missing_features.aux_pause_resume = true;
> > +               pr_debug2_peo("Kernel has no aux_pause/aux_resume support, bailing out\n");
> > +               return false;
> 
> This patch fails to apply on the latest perf-tools-next branch due to
> conflict:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
>   branch: perf-tools-next
> 
> You might need to rebase it on the latest code base.

Yep, please do for the tooling patches.

Thanks,
Namhyung


