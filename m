Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC09FCA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeSUlDsVo1s6+AYYrQ/dOA7YcHXnvKye1ADL9d8nv6w=; b=UxTekQn9PYQzuYL7FwU4lB7N0u
	MuFZqwiBDaEz6Odp1vF355LSmzQCKZjt6PgI2rTg3BYXT6JYnYPEmNEdmSWXW6K+EMthYL3lbW05B
	vppQ9Bl2vIM7cZ9HQb7lqeR9hTyfrC0sLr33nRW7B93fijfstHXq0i/ZAlpzaTQ7XWJIp4LvKGC87
	Dex6LBMkHfCvwZEG2ZJwYuDFuuze2rtcGVY+jTlnz+4pl1hIHFg4NG8XFEBgWZoSvKydu1cdusp51
	9favs7Oxs+avijfSaqY3elkSnlTHWlvi1t77Yh0sjr+bSmAmyqJY/NCU27jVYRZEqpnGmhwAAJXQE
	1T4tp2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETcP-00000002i5p-3O21;
	Wed, 07 Oct 2026 15:31:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETcN-00000002i5c-0SoA;
	Wed, 07 Oct 2026 15:31:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D41543931;
	Wed,  7 Oct 2026 15:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FF21F000FF;
	Wed,  7 Oct 2026 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791387102;
	bh=NeSUlDsVo1s6+AYYrQ/dOA7YcHXnvKye1ADL9d8nv6w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RCz9UumVg7MCcfX/YLxNtqhItlWET/Z1k3RTfAdRoaVqQs3a3NbcouYkfoRa6pqRa
	 jwfkKjqQFvJme9MJKzccjiWaBIYZnIQSr30tk3sN4Oj/ENR3fiTTmnTFWWwKGQFoeb
	 x9MjmhgJ0kmmNmAq7/tqTt3LsMeN1sIUKC0DCxHLXLAtieAlsD1mwQnpdmG5vQOb9x
	 gKl7THQ6pA6fWIQSfzbdAEF4m5wwnmOXtTZPUxHiS3kdutQ2LiJefIBqdvg40dMq37
	 aGslvNm0CR4bws0xNVP1YK9frHlVIP5ANSZZpLjn1VMDryR0iTmV1KpEpZDZdQ/QN0
	 RS+2rsBgM/2fw==
Date: Wed, 7 Oct 2026 09:31:36 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>
cc: Chen Pei <cp0613@linux.alibaba.com>, acme@kernel.org, peterz@infradead.org, 
    mingo@redhat.com, namhyung@kernel.org, mark.rutland@arm.com, 
    alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
    james.clark@linaro.org, leo.yan@linux.dev, john.g.garry@oracle.com, 
    will@kernel.org, mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
    guoren@kernel.org, linux-perf-users@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] perf tsc: Declare TSC support from the build
 system
In-Reply-To: <66136aa8-adbe-4fdf-9b7c-d44ea0e5cf1e@intel.com>
Message-ID: <d58889fc-71a1-0144-dc5a-4eb354536748@kernel.org>
References: <20260929034133.2153-1-cp0613@linux.alibaba.com> <20260929034133.2153-3-cp0613@linux.alibaba.com> <66136aa8-adbe-4fdf-9b7c-d44ea0e5cf1e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 6 Oct 2026, Adrian Hunter wrote:

> On 29/09/2026 06:41, Chen Pei wrote:
> > The "TSC support" subtest of the "Convert perf time to TSC" test decides
> > whether the architecture is covered by matching compiler macros for
> > x86_64, i386 and arm64.  That list has to be edited for every new
> > architecture and can drift apart from the set of architectures that really
> > provide a counter.
> > 
> > Declare the capability where the implementation is, following the
> > PERF_HAVE_JITDUMP pattern: an architecture with a usable counter sets
> > PERF_HAVE_RDTSC in its arch Makefile, Makefile.config turns it into
> > -DHAVE_RDTSC, and the test keys off that.
> > 
> > x86 and arm64 keep the same behaviour, riscv starts running the subtest
> > where the previous patch defines rdtsc().
> > 
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> 
> One minor style comment below.  In any case:
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

Reviewed-by: Paul Walmsley <pjw@kernel.org> 


- Paul

