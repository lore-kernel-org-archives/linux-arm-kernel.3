Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFBCCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOec7JCeOzKAR+RrPU86ss9vqed4P49rNrP3SnxLnHY=; b=oqfn/WxWz0cg2vvYNsyBOmFwIm
	GRK9lHDzI03eOy2H9PBsKCrymgN9IBFxLp0UHO8S3ZQCy64LdhQ63eOGNHX1FKFPkxSszQNYd66QB
	/MEtQgUGA11BNHBUJso+B9FxPbWwW2TMEyToaPwCPw70df7ngUrAVURGVOy+b40evQB+Gg7IN5I9U
	maN3YFW/tesWN99BHWKCm+0HekbJTC7E//HKcqe8Zg0Zmlcjhxuxrldi5OTmaQff8TFlfoLI0QAXh
	VD6zVshkCZqsTCNoFtTMidSq/3xTPHSicZdsd5xdv1VEkukLfR68yyHNlx3BXH+wARhVz38Tgr0sT
	5W1QiZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY9s-00000003QeG-1rC5;
	Mon, 08 Jun 2026 11:28:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY9o-00000003QdE-3A2S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:28:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C3EE2454;
	Mon,  8 Jun 2026 04:28:32 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9F803F86F;
	Mon,  8 Jun 2026 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780918117; bh=BobVUEY4qK+mzZSb5/y7VZVL+wSb1xSXIUpsrNTTNa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKYMfOE4ZeM0wxfN3x/MnCQ7zYLbVQoWb5WhmH0QI3hW9uJyCC90I1Cm1maGDXjqw
	 re2UU9irWDrkejRy80eeIz376GpNGfpsqemWL09OzvHZI+qwg4Jxm1YVvSfxtD2/I3
	 YnNVYRQ9Gz7Y74dL091QRC06zhcl6gzp5v/kDtzs=
Date: Mon, 8 Jun 2026 12:28:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v6 6/8] perf cs-etm: Filter synthesized branch samples
Message-ID: <20260608112834.GM101133@e132581.arm.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-6-f9f49f53c9dd@arm.com>
 <fbe0a097-ced7-44c6-ada1-01c3e9c1d7e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe0a097-ced7-44c6-ada1-01c3e9c1d7e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_042841_042090_9BEBBB15 
X-CRM114-Status: GOOD (  18.28  )
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

On Thu, Jun 04, 2026 at 03:42:32PM +0100, James Clark wrote:

[...]

> > @@ -3442,6 +3447,16 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
> >   		etm->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
> >   	}
> > +	if (etm->synth_opts.calls)
> > +		etm->branches_filter |= PERF_IP_FLAG_CALL |
> > +					PERF_IP_FLAG_TRACE_BEGIN |
> > +					PERF_IP_FLAG_TRACE_END;
> > +
> > +	if (etm->synth_opts.returns)
> > +		etm->branches_filter |= PERF_IP_FLAG_RETURN |
> > +					PERF_IP_FLAG_TRACE_BEGIN |
> > +					PERF_IP_FLAG_TRACE_END;
> > +
> 
> This changes the default "perf script" output quite significantly and will
> possibly break people's workflows. synth_opts.calls is true by default but
> synth_opts.returns is false so we lose all the returns that we used to have.
> Not sure if the new behavior is more consistent with other tools so we can
> justify changing it? Personally I think including returns by default made
> more sense, and it's a more literal representation of the flow.

Makes sense. I will add below chunk to enable return events for default
option:

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index ab3aa76dddb3..bd9eb794cc07 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3541,6 +3541,14 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
                                session->itrace_synth_opts->default_no_sample);
                etm->synth_opts.callchain = false;
                etm->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
+
+               /*
+                * By default, only call events are enabled but no return
+                * events. Enable return events to better represent the
+                * execution flow.
+                */
+               if (etm->synth_opts.calls)
+                       etm->synth_opts.returns = true;
        }

> 
> itrace.txt says the default is "all events i.e. the same as
> --itrace=iybxwpe", but I thought the default was branches? At least for
> Coresight it is, so I'm a bit confused.

"--itrace=iybxwpe" would be used for "perf report" command, the doc also
mentions "--itrace=ce" for "perf script" specific.

Thanks,
Leo

