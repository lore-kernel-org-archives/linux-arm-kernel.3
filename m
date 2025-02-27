Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603F6C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pyagFwJdqIJYS0C6MN1+Y+BjlIi/TEbJjGRfYXxupE=; b=LPxcyhO5BBodvVHoSMAykOB2Lt
	MUXYWJ7nhZQFSw7PYNRCTHy4IBKsziGz0zx3JtRq2vwGR2Y//l2pchRJ1So/cXkxTVKwKfJhvrbIB
	MBOjyKOuY/u+FXM/OJtW2xzUroj9uemnfqGEhPHOyGo4ZvVAusxOO1ZoUWVSQw6fz6EW9ZLyBN7Jx
	dGlCJIb8xmaxeWFiuZVyt4oYhSRu3WpAZDWJ+gNpkdu0/QrWQMhLZQdM0qZin4KPAMF2KImKxM4Fi
	dm/Uej0sxGDTyXmX/lC0gZRiIktM4Fm1vUxPFWm/W2ELQ7R6tDIT4aPzRfoGG1Y+mE+CrFjeMrjyt
	d/TGk6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXyo-00000006Wbv-1J1y;
	Thu, 27 Feb 2025 07:06:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXxH-00000006WMu-1OXD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 07:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C68775C0EC9;
	Thu, 27 Feb 2025 07:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F85C4CEDD;
	Thu, 27 Feb 2025 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740639910;
	bh=x/fvxQXO3R9Lw7VjrELLy8bNhalAiL/Wcmz0kXpRovk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2PzNv+dc6QwbxX8E6WheaomB4CsP0CeHFi4lakvzTeBNCR/P+kXc3Cem3UbuKLre
	 UH7wLyRQXSUdHtVFcsMhTfoh+yGj2dzVQTFjxiNtXlnsFYhHwYriqTGUZU64+7yFHz
	 6bDAjOBkCOohHApVotttaw7RDGOqw1voJ2vcC3Yw5HuqYQRhfp95nUlEYInBNxkcrQ
	 hmMjejl1ddEiXrKARMGSmylunvW62NTE09VE6sXfot003UXxI+beJCPgA85Mv9q5Pk
	 GIL0VbE5KZatmtCrrfPdeA/xS6mPeXXloWVBM/rZRM2fcsm6DhKW+BAJ1WRorbIj9z
	 F+AWRGr7klqlQ==
Date: Wed, 26 Feb 2025 23:05:08 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf arm-spe: Report error if set frequency
Message-ID: <Z8AOpLW6RSUU09Ns@google.com>
References: <20250205183009.224182-1-leo.yan@arm.com>
 <20250217082008.GA8144@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250217082008.GA8144@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_230511_460341_50749221 
X-CRM114-Status: GOOD (  27.37  )
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

On Mon, Feb 17, 2025 at 08:20:08AM +0000, Leo Yan wrote:
> On Wed, Feb 05, 2025 at 06:30:09PM +0000, Leo Yan wrote:
> > When users set the parameter '-F' to specify frequency for Arm SPE, the
> > tool reports error:
> > 
> >   perf record -F 1000 -e arm_spe_0// -- sleep 1
> >   Error:
> >   Invalid event (arm_spe_0//) in per-thread mode, enable system wide with '-a'.
> > 
> > The output logs are confused and it does not give the correct reminding.
> > Arm SPE does not support frequency setting given it adopts a statistical
> > based approach.
> > 
> > Alternatively, Arm SPE supports setting period.  This commit adds a
> > for frequency setting.  It reports error and reminds users to set period
> > instead.
> > 
> > After:
> > 
> >   perf record -F 100 -e arm_spe_0// -- sleep 1
> >   Arm SPE: Frequency is not supported. Check manual 'man perf-record' on how to set period.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Gentle ping.

Sorry for the late reply.

Isn't it just -c <period> to set period for Arm SPE?  If so, it'd be
better to say that explicitly.

Thanks,
Namhyung

> 
> > ---
> >  tools/perf/arch/arm64/util/arm-spe.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
> > index 4301181b8e45..baef0812dc19 100644
> > --- a/tools/perf/arch/arm64/util/arm-spe.c
> > +++ b/tools/perf/arch/arm64/util/arm-spe.c
> > @@ -40,6 +40,19 @@ struct arm_spe_recording {
> >  	bool			*wrapped;
> >  };
> >  
> > +/* Iterate config list to detect if the "freq" parameter is set */
> > +static bool arm_spe_is_set_freq(struct evsel *evsel)
> > +{
> > +	struct evsel_config_term *term;
> > +
> > +	list_for_each_entry(term, &evsel->config_terms, list) {
> > +		if (term->type == EVSEL__CONFIG_TERM_FREQ)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  /*
> >   * arm_spe_find_cpus() returns a new cpu map, and the caller should invoke
> >   * perf_cpu_map__put() to release the map after use.
> > @@ -389,6 +402,13 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
> >  				return -EINVAL;
> >  			}
> >  			opts->full_auxtrace = true;
> > +
> > +			if (opts->user_freq != UINT_MAX ||
> > +			    arm_spe_is_set_freq(evsel)) {
> > +				pr_err("Arm SPE: Frequency is not supported. "
> > +				       "Check manual 'man perf-record' on how to set period.\n");
> > +				return -EINVAL;
> > +			}
> >  		}
> >  	}
> >  
> > -- 
> > 2.34.1
> > 

