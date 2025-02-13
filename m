Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A5DC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 05:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lg44QWzNgGxRPl4Fgh9XxIMpNulbv9qSiqLOX5r61M=; b=xJTnB67pBGQWx6wt/g6jmUxOfe
	ExfYKH1KpaMKGw8KzXMcGIFjScln0YbbKFtCwdJbQDTYhrHwI4oKs+VqXj141CAKJKdzmTjhnfB6a
	87tQwnR61LFcVzH81AK9gPB3k/bKQJEq2WyZnrwrtsAFhL5veq/EgJ5d6rnqKzw+F9BJNaRVF8khv
	nGWFK0pBQm8V3iZ2I3D8cABNZCIeK5Eqr9kUfSaqZcvZNH8H0MeOkhpS15KusfdyHDQKli9qNAkXu
	63iuyrt2uJ0DTS6n2RqSwQkHZ34uOEL+13AFyVJy1MOfa7vBzDJSkej79c5v17JM8sW9GhY2znDYr
	5nNsDzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRoS-00000009nz3-3LMq;
	Thu, 13 Feb 2025 05:31:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRn1-00000009np3-0lfn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 05:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06FFAA41DD6;
	Thu, 13 Feb 2025 05:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A69C4CED1;
	Thu, 13 Feb 2025 05:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739424570;
	bh=6ZxGRcclQsqfn7duofDY2aCW0LoKtmUEeo5XxD9IVvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSCEvkQee5ozQMWVA0R04SgUm1lMDxhcMUTK8bNKo/Vllur8im/S1mxvlr9sXixdT
	 y40U9/1+nyJUF6sWgFSgvPWQCxQpEo1Nre2Nf6PLwoykl7U8WO1oHPS0s746gy1Wye
	 6nqX5rqrlEr52mqQI46vNHJLTqlZPixMJQKpAoEIvcwRcaOABqw0Bk5jY11nyoR5Os
	 mvW6WsEPQXJp4vp5jH4RyfeiiynZ1HfT6TtKfZIY7zAGU2FOljab0oMYc6Hf/Rebsg
	 5jm7Wj9mnKbnmrqv1sjoUd9s57IddFvjpdQo5uFoXELjus8hzpkvNUmLAljURBOU/+
	 CxzUnkGjsiemw==
Date: Wed, 12 Feb 2025 21:29:28 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Graham Woodward <graham.woodward@arm.com>
Subject: Re: [PATCH v1 00/11] perf script: Refactor branch flags for Arm SPE
Message-ID: <Z62DOPuDJ-PrcHQw@google.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
 <CAP-5=fUH6X2F5S5eH+iU+-hT0vNvMKPTqbGt=E9W06sG=MzxEg@mail.gmail.com>
 <20250212085439.GA235556@e132581.arm.com>
 <CAP-5=fX6veqJYbTRfOiOqtpg8Dq+m3nZJRd4zEBCZeNiwB5Xpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fX6veqJYbTRfOiOqtpg8Dq+m3nZJRd4zEBCZeNiwB5Xpw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_212931_284597_CDFAF5E8 
X-CRM114-Status: GOOD (  19.53  )
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

On Wed, Feb 12, 2025 at 08:14:48AM -0800, Ian Rogers wrote:
> On Wed, Feb 12, 2025 at 12:54 AM Leo Yan <leo.yan@arm.com> wrote:
> >
> > Hi Ian,
> >
> > On Tue, Feb 11, 2025 at 02:34:46PM -0800, Ian Rogers wrote:
> > > On Wed, Feb 5, 2025 at 4:16 AM Leo Yan <leo.yan@arm.com> wrote:
> > > >
> > > > This patch series refactors branch flags for support Arm SPE.  The patch
> > > > set is divided into two parts, the first part is for refactoring common
> > > > code and the second part is for enabling Arm SPE.
> >
> > [...]
> > >
> > > Reviewed-by: Ian Rogers <irogers@google.com>
> > >
> > > Built and tested (on x86). A little strange patch 5 adds a new bit not
> > > at the end, but "Sample parsing" test wasn't broken so looks like it
> > > is good. I was surprised the use of value in the union:
> > > ```
> > > struct branch_flags {
> > > union {
> > > u64 value;
> > > struct {
> > > u64 mispred:1;
> > > u64 predicted:1;
> > > ...
> > > ```
> > > didn't get broken. Perhaps there's an opportunity for additional tests.

Probably because it just checks the value as a whole u64, not each
bitfield.  But it seems to test if the value of the input sample data
and synthesized-and-parsed output sample data is same.  So it may not be
important what value it has.

Anyway it'd be nice if any ARM folks can review this series.

Thanks,
Namhyung


