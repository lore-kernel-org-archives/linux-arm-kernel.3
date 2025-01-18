Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4D9C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 18:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo3rpTSi+jBfXnSO8YN8k4tnnWnfA56WQ0EdZUpufnQ=; b=DVHo50CN9gojtSSSYHM3c427FM
	SKmqRjYawediFp45WA4ke0tprHduIfoPKs6BQwCgsk29p6PxqWMcdP1ktmvuHGERGkek4EhBJtq5r
	OQ1kIvpFEglVoL9v67+skxT6DLP1+YkOns7r/8PM6z9CXQWeXE+dGuz2DbWvk5LazIrH3GNuOlT6m
	Vzmcb3a571gyWOfNy91Rai5XkBxRBwwyrrAk1EtpNEp+/IPOh2xxDwwXWBwng+eTGWPMEHpDUJYjo
	Zz5cEuuePO1Qj5Q5WLCZ+Eivj3IKBtiydx2+Z2MBZ6PB2uijqzxn1nwFZXc+dqbXv4ho7KjyVwCHH
	hGtLOVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZDU9-00000002o62-1ZcH;
	Sat, 18 Jan 2025 18:23:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZDSr-00000002o1S-3vxV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 18:22:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85A015C0E6B;
	Sat, 18 Jan 2025 18:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F321C4CED1;
	Sat, 18 Jan 2025 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737224552;
	bh=01DSwYqRpSJ8Rt/wkPDDfZiBI9kDYIOhQvGlKBCpzFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzIU50bIa0R/uPc/vmIIlriGK2SgOK/4bK0TN13w2PJ7xYeL8tGYLwGtQwDU05Vlg
	 i5t1zYRg06Avhzg8JYahGXeAvCJ95SNt9e3iTAIcMn0e7mGQwq1B0TD3o++A4uoMZ6
	 OI0qimAYpnZkPBHEGDaRWOpJk7JK+pwfmXaldiJY3O905PwMm0xto8ENu5W9GkUtbK
	 7eocAFcC74XJm0c3K3jvMFPD86qgFzTObLRGqGBTB3kSl/ppTgEprxoaTicy05raKt
	 mYRbD5jRxtpbovy2f+gM4fmsiLHoXslX7wPV9zwBsdokSZRhTUIsOicCoKX3rgYffc
	 77ZK+VReBKxfw==
Date: Sat, 18 Jan 2025 10:22:30 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Nick Forrington <nick.forrington@arm.com>
Subject: Re: [PATCH v1 1/2] perf vendor events arm64: Add N3 events/metrics
Message-ID: <Z4vxZj2YzfwU-m46@google.com>
References: <20250110172006.680753-1-irogers@google.com>
 <da5792c3-8f53-4be8-8f53-e1cf6660feab@linaro.org>
 <CAP-5=fXyVtZChi1fkochiyKw6AztdhEE_rfpJUsz_P9po5bhXA@mail.gmail.com>
 <d0ebae42-99b6-42be-beaa-947160da3b88@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0ebae42-99b6-42be-beaa-947160da3b88@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_102234_055396_A43CE4A7 
X-CRM114-Status: GOOD (  30.87  )
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

On Mon, Jan 13, 2025 at 04:48:06PM +0000, James Clark wrote:
> 
> 
> On 13/01/2025 3:51 pm, Ian Rogers wrote:
> > On Mon, Jan 13, 2025 at 4:35 AM James Clark <james.clark@linaro.org> wrote:
> > > 
> > > 
> > > 
> > > On 10/01/2025 5:20 pm, Ian Rogers wrote:
> > > > Using the scripts at:
> > > > https://gitlab.arm.com/telemetry-solution/telemetry-solution/
> > > > 
> > > > Generate perf json for neoverse-n3 using the following command:
> > > > ```
> > > > $ telemetry-solution/tools/perf_json_generator/generate.py \
> > > >     tools/perf/ --telemetry-files \
> > > >     telemetry-solution/data/pmu/cpu/neoverse/neoverse-n3.json:neoverse-n3
> > > > ```
> > > > 
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > ---
> > > >    .../arm64/arm/neoverse-n3/core-imp-def.json   | 930 ++++++++++++++++++
> > > 
> > > I assume you got warnings about missing groups, if one is missing that
> > > results in everything being dumped in core-imp-def.json. I have an
> > > internal ticket open about it which is why I didn't post N3 and V3 jsons
> > > yet, I'll check on it again.
> > 
> > I was testing with JEVENTS_ARCH=all. I'm not sure what the group
> > warning is, do you have a link?
> > 
> 
> From the perf_json_generator:
> 
>  $ telemetry-solution/tools/perf_json_generator/generate.py \
>    tools/perf/ --telemetry-files \
>    telemetry-solution/data/pmu/cpu/neoverse/neoverse-n3.json:neoverse-n3
> 
>  Warning: Not writing events which do not have a group (note that the
>  mnemonic printed may differ to the one in the source json if it differs
>  in the common Perf files):
> 
>  IMP_CT_FLUSH: Counts flushes including architectural,
>  microarchitectural, and branch redirects.
>  ...
> 
> > > Up to you whether you want to continue with it like this and I can send
> > > a fix up later but there's also a conflict with the recent Fujitsu
> > > Monaka events.
> > 
> > I'm happy to let you push the updates. An alternative, that may work
> > around the group issue, is just to push the event updates. Any chance
> > on an ETA?
> > 
> > Thanks,
> > Ian
> 
> Can't say on an eta. There was a fix already done but not made live yet, but
> now it turns out maybe we don't want to put these particular events into
> Perf because they're not in the TRM. Could be several weeks before anything
> goes live.
> 
> It's a bit of a hack but I can regenerate them without these particular
> events in a V2, and then whatever the outcome is from above will be an
> incremental change later.
 
So what's the final decision?

James, do you want to publish the metrics later at once or are you ok
with this patch for now (and do the incremental change later)?

Thanks,
Namhyung


