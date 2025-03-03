Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910AEC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYlMDktcvKr9/7e9uidmY61Axvb6gzsgOEBOBRvPcmc=; b=v7TCj6PLXpVYD0QyEIbfJDn5Gk
	kWSrcpxbtxs4uF26wQFP6dB7+qv436FmWtSRh9G4j8G1vHjZSU2Tfc5vJ+kk14f8wxOy3J+8ry7XN
	laItYbFqBxLkxXD33AGy/fzJ65/n06HJBiAzbQ0l8gIOkeSaa1yeUKSiILQopFpxrId0s+uL5Zjo7
	xK9lPPdp96+kER1fVNDxCYpTPsqhA/EG44BksibGdAiBASd2Yr+5PcIdOalxCyXReD3uxwRZGsL1P
	EpXQUuTtsnvj+mvkJRPsVLmhZZBnumc1mfvOuRg4kOs1p8FNN3EmtZKsHS0xZSTsdU/OPAt6dxiBj
	OH1pMi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8aA-00000001VeW-3GeQ;
	Mon, 03 Mar 2025 16:23:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8Ya-00000001V7B-1plO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:22:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B55C106F;
	Mon,  3 Mar 2025 08:22:29 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D61B73F673;
	Mon,  3 Mar 2025 08:22:14 -0800 (PST)
Date: Mon, 3 Mar 2025 16:22:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>,
	Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/12] perf script: Make printing flags reliable
Message-ID: <20250303162210.GH2157064@e132581.arm.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250217195908.176207-2-leo.yan@arm.com>
 <34795c29-d256-49ce-9d01-435f8cd91611@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34795c29-d256-49ce-9d01-435f8cd91611@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_082216_563060_B4BA7AD3 
X-CRM114-Status: GOOD (  23.73  )
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

Hi Adrian,

On Mon, Mar 03, 2025 at 12:44:33PM +0200, Adrian Hunter wrote:
> On 17/02/25 21:58, Leo Yan wrote:
> > Add a check for the generated string of flags.  Print out the raw number
> > if the string generation fails.
> 
> How does it fail?

In practice, I agreed perf_sample__sprintf_flags() will not fail.  This
bases on a careful calculation for every invoking snprintf().

Please see comment below.

> > In another case, if the string length is longer than the aligned size,
> > allow the completed string to be printed.
> > 
> > Reviewed-by: Ian Rogers <irogers@google.com>
> > Reviewed-by: James Clark <james.clark@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  tools/perf/builtin-script.c   | 10 ++++++++--
> >  tools/perf/util/trace-event.h |  2 ++
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> > index d797cec4f054..2c4b1fb7dc72 100644
> > --- a/tools/perf/builtin-script.c
> > +++ b/tools/perf/builtin-script.c
> > @@ -1709,9 +1709,15 @@ static int perf_sample__fprintf_bts(struct perf_sample *sample,
> >  static int perf_sample__fprintf_flags(u32 flags, FILE *fp)
> >  {
> >  	char str[SAMPLE_FLAGS_BUF_SIZE];
> > +	int ret;
> > +
> > +	ret = perf_sample__sprintf_flags(flags, str, sizeof(str));
> > +	if (ret < 0)
> 
> AFAICT ret is always >= 0

Since I refactored perf_sample__sprintf_flags() in the sequential
patches, for easier capturing and debugging, here checks the return
value to detect any potential issues.

Later when we review a perf log, a printed raw number for error cases
can remind there must be something wrong for printing flags.

> > +		return fprintf(fp, "  raw flags:0x%-*x ",
> > +			       SAMPLE_FLAGS_STR_ALIGNED_SIZE - 12, flags);
> >  
> > -	perf_sample__sprintf_flags(flags, str, sizeof(str));
> > -	return fprintf(fp, "  %-21s ", str);
> > +	ret = max(ret, SAMPLE_FLAGS_STR_ALIGNED_SIZE);
> > +	return fprintf(fp, "  %-*s ", ret, str);
> 
> -21 means the field width is 21 and left-justified.  It should not
> truncate the string.

No, it does not truncate the string.

It calculates a maximum value between the returned length and 21 (
defined in SAMPLE_FLAGS_STR_ALIGNED_SIZE).  It keeps left-justified and
can printing a complete string if the string length is bigger than 21.

Thanks,
Leo

> 
> >  }
> >  
> >  struct printer_data {
> > diff --git a/tools/perf/util/trace-event.h b/tools/perf/util/trace-event.h
> > index ac9fde2f980c..71e680bc3d4b 100644
> > --- a/tools/perf/util/trace-event.h
> > +++ b/tools/perf/util/trace-event.h
> > @@ -145,6 +145,8 @@ int common_flags(struct scripting_context *context);
> >  int common_lock_depth(struct scripting_context *context);
> >  
> >  #define SAMPLE_FLAGS_BUF_SIZE 64
> > +#define SAMPLE_FLAGS_STR_ALIGNED_SIZE	21
> > +
> >  int perf_sample__sprintf_flags(u32 flags, char *str, size_t sz);
> >  
> >  #if defined(LIBTRACEEVENT_VERSION) &&  LIBTRACEEVENT_VERSION >= MAKE_LIBTRACEEVENT_VERSION(1, 5, 0)
> 

