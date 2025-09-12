Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F18CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 21:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ9DZUA5chLDGyUXJpZKwNcUX4Db1ZyPPNbPNwZoNio=; b=jXNign+I4D5JJA78t9AiMgvDba
	RV7Kmg0hp7+QiACWWgNbrAyukXfQi7zjVOAqHVAt2pDuSGK7XESTAeYijOzbIYTeAXTUfKACuqGqD
	aWMX6EszgBo+93YveBkoIKl14+yzs5hTWHvLwX2iuxcov09DC0DpaITDyZ1dF2B5W10Z+GSAOz/K4
	1hp6hIqgI2URx3mwBZ9w+tvqlzm/p3dFRE+ErRE9lJc6H8aoibyyKTSWHLtRMV0JS//f+Qr4Qinrv
	/LAK5dk44CtAuTUUkAIaNNLxnmxR3URTBBdPIY/PYFyJwbLmAfEkp4CGsAp9+OD1o/l/xVMyKHfIB
	8LVHJzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBMX-0000000Beat-2GUd;
	Fri, 12 Sep 2025 21:31:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBMV-0000000BeZw-1qcN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 21:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C8314012E;
	Fri, 12 Sep 2025 21:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B018EC4CEF1;
	Fri, 12 Sep 2025 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757712678;
	bh=9TERDqn0+X15pemyziSWgElEtDSQeG3yOmJ2tsVV1aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iREMowba37peCo9YQa9I8FHr0kMyK5OJaH6mCuzGf+RdMdF6ZKADbNouUnzgZ0ZQv
	 8Op40WBI+63WgZD0sChj/ni4W0lb8nI1ILcnx3TcKmQ+FBLInolnZSF9ZhDDcOYPXC
	 EeczJ3Gh0eCD/6PYXT4CRA5/V0dDP5ImJ3mjGkyhH5Hez3cecM5/RC9jZAYVcYTMmP
	 jACTD+BGn3aUWmT39SL6/km9RlIUU9iXwWRyz7QKk6XoybOZH7EzaYNZzVO30Epz5h
	 k7FugFSLJO55CvssmFMBCbsn43FL9StpZgTUA4d85PG7erA+CU22c2ndzVCWAcVMUW
	 Il8JXINCM4qnw==
Date: Fri, 12 Sep 2025 18:31:15 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix typo - should
 be l1d_cache_access_prefetches
Message-ID: <aMSRIzjysMXxFeVI@x1>
References: <20250909210120.9823-1-ilkka@os.amperecomputing.com>
 <6a24df18-832c-41b8-8226-5dc5b3c9995d@linaro.org>
 <c48690ca-f7d-e711-5b9a-d18c138568d@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c48690ca-f7d-e711-5b9a-d18c138568d@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_143119_528485_FEDC14A4 
X-CRM114-Status: GOOD (  21.39  )
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

On Wed, Sep 10, 2025 at 12:46:24PM -0700, Ilkka Koskinen wrote:
> 
> 
> On Wed, 10 Sep 2025, James Clark wrote:
> > On 09/09/2025 10:01 pm, Ilkka Koskinen wrote:
> > > Add missing 'h' to l1d_cache_access_prefetces
> > > 
> > > Also fix a couple of typos and use consistent term in brief descriptions
> > > 
> > > Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core
> > > PMU events and metrics")
> > > Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > ---
> > >   .../arch/arm64/ampere/ampereonex/metrics.json          | 10 +++++-----
> > 
> > The same typos are in arch/arm64/ampere/ampereone/metrics.json as well.
> 
> Ah, that's right. The descriptions do have the same typos. I'll prepare
> another patch for AmpereOne and submit them together as v2.
> 
> Cheers, Ilkka

Thanks, applied to perf-tools-next,

- Arnaldo
 
> > 
> > Reviewed-by: James Clark <james.clark@linaro.org>
> > 
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git
> > > a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> > > b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> > > index 5228f94a793f..6817cac149e0 100644
> > > --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> > > +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> > > @@ -113,7 +113,7 @@
> > >       {
> > >           "MetricName": "load_store_spec_rate",
> > >           "MetricExpr": "LDST_SPEC / INST_SPEC",
> > > -        "BriefDescription": "The rate of load or store instructions
> > > speculatively executed to overall instructions speclatively
> > > executed",
> > > +        "BriefDescription": "The rate of load or store instructions
> > > speculatively executed to overall instructions speculatively
> > > executed",
> > >           "MetricGroup": "Operation_Mix",
> > >           "ScaleUnit": "100percent of operations"
> > >       },
> > > @@ -132,7 +132,7 @@
> > >       {
> > >           "MetricName": "pc_write_spec_rate",
> > >           "MetricExpr": "PC_WRITE_SPEC / INST_SPEC",
> > > -        "BriefDescription": "The rate of software change of the PC
> > > speculatively executed to overall instructions speclatively
> > > executed",
> > > +        "BriefDescription": "The rate of software change of the PC
> > > speculatively executed to overall instructions speculatively
> > > executed",
> > >           "MetricGroup": "Operation_Mix",
> > >           "ScaleUnit": "100percent of operations"
> > >       },
> > > @@ -195,14 +195,14 @@
> > >       {
> > >           "MetricName": "stall_frontend_cache_rate",
> > >           "MetricExpr": "STALL_FRONTEND_CACHE / CPU_CYCLES",
> > > -        "BriefDescription": "Proportion of cycles stalled and no
> > > ops delivered from frontend and cache miss",
> > > +        "BriefDescription": "Proportion of cycles stalled and no
> > > operations delivered from frontend and cache miss",
> > >           "MetricGroup": "Stall",
> > >           "ScaleUnit": "100percent of cycles"
> > >       },
> > >       {
> > >           "MetricName": "stall_frontend_tlb_rate",
> > >           "MetricExpr": "STALL_FRONTEND_TLB / CPU_CYCLES",
> > > -        "BriefDescription": "Proportion of cycles stalled and no
> > > ops delivered from frontend and TLB miss",
> > > +        "BriefDescription": "Proportion of cycles stalled and no
> > > operations delivered from frontend and TLB miss",
> > >           "MetricGroup": "Stall",
> > >           "ScaleUnit": "100percent of cycles"
> > >       },
> > > @@ -391,7 +391,7 @@
> > >           "ScaleUnit": "100percent of cache acceses"
> > >       },
> > >       {
> > > -        "MetricName": "l1d_cache_access_prefetces",
> > > +        "MetricName": "l1d_cache_access_prefetches",
> > >           "MetricExpr": "L1D_CACHE_PRFM / L1D_CACHE",
> > >           "BriefDescription": "L1D cache access - prefetch",
> > >           "MetricGroup": "Cache",
> > 
> > 

