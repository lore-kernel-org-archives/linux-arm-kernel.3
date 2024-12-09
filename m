Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E1E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fa4+dfikM2ZOlhjREuluzrauUtHDjxqBGPUZDlMZAM=; b=v/dfkASsS9ZDhiY1AUj3maE8+E
	I4Y6UnpyTETJbR1xjfqlv6yH81mCutqUpAyF+GSBL0qLRBKr2ucG5KhGSlZnBdnzAXzMV0nmvZ2Og
	u6Nd23NZxXf4eptkBQ9Os3tUgyTcJQ3+j5aVvdX0k5wEh4d7v1xJewvFpEbhhM2QcAhz/hieTIsHZ
	LFHtkm/pVXOplFOrwd9p7v+0hJkpePehsHQpWUKkqdx/KWDQRpDpq3+OBWprDnKQ4Hz6ryycVImIR
	7UIT3PaDblk3PJGIbUjjJkH6x5eGbTVFIT3/SpH7MVAOaqMDBkVy9aeFCmg53WtMasXkZoIKj4iRM
	wGdIhxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfg0-00000008Nwc-237Q;
	Mon, 09 Dec 2024 15:28:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfex-00000008Nmy-1Y2Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 376CA5C231C;
	Mon,  9 Dec 2024 15:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED98C4CED1;
	Mon,  9 Dec 2024 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733758014;
	bh=jX2fG3yy1vClj8I8QX5XNbxjsW2ue2euNd6qooAXzig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mug28Atfp1fKyAIC1Jocey/QGugRYe/PCDC88Lc3dwW6/WNXMIHl4X6SSizQBIPg5
	 EQrMMc3W8hrxo332Syv++PG4SXEka0yYe80jlt1xOpyPqGlaLAO4LpdTBceHTxhD69
	 fGrXwyRGs0moRzwI/EI0OQxBPpVkyMWjIRAacPGyvrTzMLgXinfyAOE7+rYNjp40bu
	 s7X9AY0meLtYVhUwKmbTwbKi02NAgaqTdZoHN+1aT5FZsgZK0qWW3aWtaE90GHt6tL
	 7mvhqEW3u/ylcOSh9IaJrgN7UYYmwqHDJSBXDh5xeJSGbhW5OwtaCfzYN+viG5jlS1
	 c0nEzasbfEZwA==
Date: Mon, 9 Dec 2024 12:26:46 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] perf arm-spe: Add support for SPE Data Source
 packet on AmpereOne
Message-ID: <Z1cMNiWELdUJy2QH@x1>
References: <20241108010911.58412-1-ilkka@os.amperecomputing.com>
 <20241108010911.58412-3-ilkka@os.amperecomputing.com>
 <20241108145138.GF47850@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108145138.GF47850@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_072655_490933_2C997302 
X-CRM114-Status: GOOD (  22.18  )
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

On Fri, Nov 08, 2024 at 02:51:38PM +0000, Leo Yan wrote:
> On Fri, Nov 08, 2024 at 01:09:11AM +0000, Ilkka Koskinen wrote:
> > 
> > Decode SPE Data Source packets on AmpereOne. The field is IMPDEF.
> > 
> > Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks, applied to perf-tools-next,

- Arnaldo
 
> > ---
> >  .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 ++++
> >  tools/perf/util/arm-spe.c                     | 44 +++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> > 
> > diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> > index 358c611eeddb..4bcd627e859f 100644
> > --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> > +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> > @@ -67,6 +67,15 @@ enum arm_spe_common_data_source {
> >         ARM_SPE_COMMON_DS_DRAM          = 0xe,
> >  };
> > 
> > +enum arm_spe_ampereone_data_source {
> > +       ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE    = 0x0,
> > +       ARM_SPE_AMPEREONE_SLC                           = 0x3,
> > +       ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE             = 0x5,
> > +       ARM_SPE_AMPEREONE_DDR                           = 0x7,
> > +       ARM_SPE_AMPEREONE_L1D                           = 0x8,
> > +       ARM_SPE_AMPEREONE_L2D                           = 0x9,
> > +};
> > +
> >  struct arm_spe_record {
> >         enum arm_spe_sample_type type;
> >         int err;
> > diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> > index dfb0c07cb7fe..df84933b673d 100644
> > --- a/tools/perf/util/arm-spe.c
> > +++ b/tools/perf/util/arm-spe.c
> > @@ -455,8 +455,14 @@ static const struct midr_range common_ds_encoding_cpus[] = {
> >         {},
> >  };
> > 
> > +static const struct midr_range ampereone_ds_encoding_cpus[] = {
> > +       MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> > +       {},
> > +};
> > +
> >  static const struct data_source_handle data_source_handles[] = {
> >         DS(common_ds_encoding_cpus, data_source_common),
> > +       DS(ampereone_ds_encoding_cpus, data_source_ampereone),
> >  };
> > 
> >  static void arm_spe__sample_flags(struct arm_spe_queue *speq)
> > @@ -548,6 +554,44 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
> >         }
> >  }
> > 
> > +/*
> > + * Source is IMPDEF. Here we convert the source code used on AmpereOne cores
> > + * to the common (Neoverse, Cortex) to avoid duplicating the decoding code.
> > + */
> > +static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *record,
> > +                                                union perf_mem_data_src *data_src)
> > +{
> > +       struct arm_spe_record common_record;
> > +
> > +       switch (record->source) {
> > +       case ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE:
> > +               common_record.source = ARM_SPE_COMMON_DS_PEER_CORE;
> > +               break;
> > +       case ARM_SPE_AMPEREONE_SLC:
> > +               common_record.source = ARM_SPE_COMMON_DS_SYS_CACHE;
> > +               break;
> > +       case ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE:
> > +               common_record.source = ARM_SPE_COMMON_DS_REMOTE;
> > +               break;
> > +       case ARM_SPE_AMPEREONE_DDR:
> > +               common_record.source = ARM_SPE_COMMON_DS_DRAM;
> > +               break;
> > +       case ARM_SPE_AMPEREONE_L1D:
> > +               common_record.source = ARM_SPE_COMMON_DS_L1D;
> > +               break;
> > +       case ARM_SPE_AMPEREONE_L2D:
> > +               common_record.source = ARM_SPE_COMMON_DS_L2;
> > +               break;
> > +       default:
> > +               pr_warning_once("AmpereOne: Unknown data source (0x%x)\n",
> > +                               record->source);
> > +               return;
> > +       }
> > +
> > +       common_record.op = record->op;
> > +       arm_spe__synth_data_source_common(&common_record, data_src);
> > +}
> > +
> >  static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
> >                                         union perf_mem_data_src *data_src)
> >  {
> > --
> > 2.47.0
> > 
> > 

