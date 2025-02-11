Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83489C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 02:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCuf9UySzxvXYdFYJ0AnI8m2dQBC+8tFVHRIg4l690o=; b=ogXGJfJ10sXnt5RcId4iQlBmsD
	/09Fu258+3FI2iG12FMcbgUiJg2dnVjIXErnRViqMOhIHxwfKrxxsVhNO7lcFEot006C+7Bc83h3V
	ihm8gcySsnkRAIm4oke927bZeE9qR4g6Cv6Qsx1MLK2j4OmurcEjP3g/5wdh0iEl9tWjOh5QGvt+K
	Ys4iSUV6XJmGbA9NBNUaYD1lsDe+kRq/3WysuLRo1K31GGwlTA1h929KYc/KHbbh3oYRmogxqPInH
	Jd2E6IIplzk2RZspqB60zH3tONMWuiLGS6eqkkq4fUE6YcoyNPawAa1MMxFJVYqxRbyJAJiws4NBm
	b5ZZvUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgNz-00000002KIF-2nJk;
	Tue, 11 Feb 2025 02:52:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgMY-00000002K4I-0vGH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 02:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB81D5C618D;
	Tue, 11 Feb 2025 02:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507C5C4CED1;
	Tue, 11 Feb 2025 02:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739242260;
	bh=W2Jnw9t+bdCtAUM79lKQHiCogtFzeFZgQuCi6Zt5dSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CplYxa37C0+A1Kvn8MffZPOPk2q9uwTL75xoaRHaSsiIaHRr0f8llxJWXLUHWLOhD
	 8FhcQbiITZYfFbjXrSydylcje5v5dorMD+fGJuEJkfHzAmS2+Wwhzj/eWo7CcNigOI
	 lN/nY0uGSZgxq86/7w56lZ8rqalyP0uZ0cELMUtIH2UksDu7599fpncPEp6m/U5u6j
	 zT4cxvoBhd6AWmzck71ZITTrOjgusBOFfPGpw+NnJElOZD7PiZB5AsEIVPPQ+XybRG
	 ngZk/kNseN8IgsvysZvz8Mx0axW1ZeqJj5cIssoB96q7JDOa+fbTR05rcDGEQVWgLq
	 AdZtrk/+R+Qow==
Date: Mon, 10 Feb 2025 18:50:57 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Tavian Barnes <tavianator@tavianator.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andi Kleen <ak@linux.intel.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Michael Petlan <mpetlan@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Subject: Re: [PATCH v1] perf sample: Make user_regs and intr_regs optional
Message-ID: <Z6q7EZxAvskBE4H3@google.com>
References: <20250113194345.1537821-1-irogers@google.com>
 <CAP-5=fVoQRhd-8jyXfjc2dCuwt7_o1sU208aADT1FriwCNa9qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVoQRhd-8jyXfjc2dCuwt7_o1sU208aADT1FriwCNa9qw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_185102_515209_0E9A6C9C 
X-CRM114-Status: GOOD (  18.64  )
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

On Mon, Feb 10, 2025 at 10:15:22AM -0800, Ian Rogers wrote:
> On Mon, Jan 13, 2025 at 11:43 AM Ian Rogers <irogers@google.com> wrote:
> >
> > The struct dump_regs contains 512 bytes of cache_regs, meaning the two
> > values in perf_sample contribute 1088 bytes of its total 1384 bytes
> > size. Initializing this much memory has a cost reported by Tavian
> > Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> > script --itrace=i0`:
> > https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7.1736618095.git.tavianator@tavianator.com/
> >
> > Adrian Hunter <adrian.hunter@intel.com> replied that the zero
> > initialization was necessary and couldn't simply be removed.
> >
> > This patch aims to strike a middle ground of still zeroing the
> > perf_sample, but removing 79% of its size by make user_regs and
> > intr_regs optional pointers to zalloc-ed memory. To support the
> > allocation accessors are created for user_regs and intr_regs. To
> > support correct cleanup perf_sample__init and perf_sample__exit
> > functions are created and added throughout the code base.
> 
> Ping. Given the memory savings and performance wins it would be nice
> to see this land. Andi Kleen commented on doing a reimplementation,
> which is fine but out-of-scope of what I'm doing here.

Yeah, I like the core of the change.  Andi's concern is that it touches
too many places.  It'd be nice if we can do that without allocating
memory for regs and eliminating the perf_sample__{init,exit}.  But I'm
not if it's possible.

Thanks,
Namhyung


