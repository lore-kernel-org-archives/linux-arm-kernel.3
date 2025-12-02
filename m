Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7D3CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLTXvLtq4av/gOYL0BG5++OQ2DKN0uMJjZS6U4Jy600=; b=dW6My0eMTllQsJrVw+5xnNno0y
	qLrySW0HXthfpJFpWL2g2oMxwEkuRPYD/xQ6bLJFb73YZB8rb29XkCGDwIuKSdfkym2r+0qcHdDCc
	Z7d5EDKRZtVktMoNwJQyKpKXkWBP1gr2bR8UrI1KlNdQqEXDSRFz1PxY0gTbXqjqj2FhSOTKA9yom
	7pNtczd4DwPZN7ViAhFecys9YRe8PbrF+NceXzWVCHdJktoO0OQNQNzAvgDtXAMaVr5Y3wyHTDL70
	ob5Ivy+b71zcSv0GdYGxA0FqmGD+iP/DPig3yv0ni6nZcTBmO+NEs9/+rUCa7bgxbGNHDBFb4hu95
	+64T64Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPby-00000005NxE-1mJ6;
	Tue, 02 Dec 2025 12:36:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPbw-00000005Nwr-2R9Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 12:36:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48C20153B;
	Tue,  2 Dec 2025 04:35:55 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 408C23F73B;
	Tue,  2 Dec 2025 04:36:02 -0800 (PST)
Date: Tue, 2 Dec 2025 12:36:00 +0000
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
Subject: Re: [PATCH 1/7] perf tools: Track all user changed config bits
Message-ID: <20251202123600.GZ724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-1-22ecbbf8007c@linaro.org>
 <20251202101556.GR724103@e132581.arm.com>
 <978dd9b1-1cb0-4338-95fa-575a858cea80@linaro.org>
 <20251202112147.GT724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202112147.GT724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_043604_679886_91DFEBCF 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, Dec 02, 2025 at 11:21:47AM +0000, Coresight ML wrote:
> On Tue, Dec 02, 2025 at 10:40:49AM +0000, James Clark wrote:
> > 
> > 
> > On 02/12/2025 10:15 am, Leo Yan wrote:
> > > On Mon, Dec 01, 2025 at 04:41:04PM +0000, Coresight ML wrote:
> > > 
> > > [...]
> > > 
> > > > +#define ADD_CONFIG_CHG(format_type, term_type, new_term)		\
> > > > +{									\
> > > > +	struct parse_events_term *term;					\
> > > > +	u64 bits = 0;							\
> > > > +	int type;							\
> > > > +									\
> > > > +	list_for_each_entry(term, &head_config->terms, list) {		\
> > > > +		if (term->type_term == PARSE_EVENTS__TERM_TYPE_USER) {  \
> > > > +			type = perf_pmu__format_type(pmu, term->config);\
> > > > +			if (type != format_type)			\
> > > > +				continue;				\
> > > > +			bits |= perf_pmu__format_bits(pmu, term->config); \
> > > > +		} else if (term->type_term == term_type) {		\
> > > > +			bits = ~(u64)0;					\
> > > > +		}							\
> > > > +	}								\
> > > > +									\
> > > > +	if (bits)							\
> > > > +		ADD_CONFIG_TERM_VAL(new_term, cfg_chg, bits, false);	\
> > > > +	return 0;							\
> > > 
> > > Nitpick: "return 0" is not needed here.  Otherwise:
> > > 
> > > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > 
> > I think it's worse than not needed, it makes it stop collecting the changes
> > after the first one.
> 
> Just curious how this can happen.
> 
>   foo()
>   {
>       {
>           chunk 1;
>       }
> 
>       {
>           chunk 2;
>       }
>   }
> 
> Seem to me, if without "return 0" in chunk 1, it still can continue to
> run chunk 2, no?

Please ignore my question above.  We need to iterate from config to
config4, if return 0 when handling config, then never add other
configs?

Thanks,
Leo

