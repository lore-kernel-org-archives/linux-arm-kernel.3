Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32475CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY2oDLNHETrm4S4UMTjXLTKnnOyzMaxUq+RKWvVimrE=; b=vmhLavalkPWRpygJCu5iHsBuwf
	yOGEIrNHKj1nBqAlRBjXVQ6SHuRa5CyC2bJ9vDsDmi6yqfTYKQH+xdMp7meEuK9UTgzD3Q71QvQjv
	P2SRFDbusFo3zD+q2Nxf01ENEu1GBfugVuX4I0OnqD3wCWM5i2kFkZsKu0VC5CtRk/YHO6PtlHwKj
	mgzOWYuIIB4S29aAQKw57ZHBbSg1ri9t/s6mzn94DfwHJhaHIVtGqb2Et+5JUgZfyfDOo+0PLjdUf
	yrwlzczshirpI9J4Y2XR/gniv+HJoXOOxwxxkmxEGPdWJmgfRTl2THjMYCpFr7NS2NRRou+4TBRCI
	Carxqymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOS9-00000005JQn-3MNO;
	Tue, 02 Dec 2025 11:21:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOS7-00000005JQG-3NNM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 11:21:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8D44153B;
	Tue,  2 Dec 2025 03:21:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C214C3F59E;
	Tue,  2 Dec 2025 03:21:49 -0800 (PST)
Date: Tue, 2 Dec 2025 11:21:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: Re: [PATCH 1/7] perf tools: Track all user changed config bits
Message-ID: <20251202112147.GT724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-1-22ecbbf8007c@linaro.org>
 <20251202101556.GR724103@e132581.arm.com>
 <978dd9b1-1cb0-4338-95fa-575a858cea80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <978dd9b1-1cb0-4338-95fa-575a858cea80@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_032151_904175_E02DC30F 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Dec 02, 2025 at 10:40:49AM +0000, James Clark wrote:
> 
> 
> On 02/12/2025 10:15 am, Leo Yan wrote:
> > On Mon, Dec 01, 2025 at 04:41:04PM +0000, Coresight ML wrote:
> > 
> > [...]
> > 
> > > +#define ADD_CONFIG_CHG(format_type, term_type, new_term)		\
> > > +{									\
> > > +	struct parse_events_term *term;					\
> > > +	u64 bits = 0;							\
> > > +	int type;							\
> > > +									\
> > > +	list_for_each_entry(term, &head_config->terms, list) {		\
> > > +		if (term->type_term == PARSE_EVENTS__TERM_TYPE_USER) {  \
> > > +			type = perf_pmu__format_type(pmu, term->config);\
> > > +			if (type != format_type)			\
> > > +				continue;				\
> > > +			bits |= perf_pmu__format_bits(pmu, term->config); \
> > > +		} else if (term->type_term == term_type) {		\
> > > +			bits = ~(u64)0;					\
> > > +		}							\
> > > +	}								\
> > > +									\
> > > +	if (bits)							\
> > > +		ADD_CONFIG_TERM_VAL(new_term, cfg_chg, bits, false);	\
> > > +	return 0;							\
> > 
> > Nitpick: "return 0" is not needed here.  Otherwise:
> > 
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> I think it's worse than not needed, it makes it stop collecting the changes
> after the first one.

Just curious how this can happen.

  foo()
  {
      {
          chunk 1;
      }

      {
          chunk 2;
      }
  }

Seem to me, if without "return 0" in chunk 1, it still can continue to
run chunk 2, no?

> It was annoying that this had to be a macro instead of a function because
> ADD_CONFIG_TERM_VAL constructs the #define name of the first argument.
> 
> It's probably worth putting in some effort to make ADD_CONFIG_CHG() a
> function to avoid problems like this and maybe add a test.

This would be fine for me.

Thanks,
Leo

