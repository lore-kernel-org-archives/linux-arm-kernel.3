Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC579C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/ZYNLNYi9izsPpQnS4Vt2j2EX6aZ+ZTlib9rqaQyc0=; b=PrpQeKayU9rcRtNXpoRZWPArB+
	rp5MYT/eeIX5Xhc3xcR9RKj8N/N7Y2wrMwbT/c9lYQCU+RVV92SMfI++F+opmD/YtD1flKz/IfRx7
	RIHpgVKkoQ/2GNMRIPVFPjfNj9KtPoMNFg6a5ogr3MHv7Mcs0vRlYuT/To/lvFPhyYudo4Urz9CHa
	KucnvHDbeWGEmTj+1cFmnQIC0cSO3ro5HTYePic2JbZJQw6X9n+tykCaovLOYe9l2U5JxAY4lB6fU
	cVXluABPnzOR4FZQJXFjFF5lc84JiWpZ87jHL2FMwO7aNv91ctcVbZJhqRWGiWcCzhzhs/rzalXhI
	DzZq8TOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7jH-00000005tYJ-2zbo;
	Mon, 17 Feb 2025 20:28:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7Lj-00000005q0H-3GUL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 20:04:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AB2A152B;
	Mon, 17 Feb 2025 12:04:34 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E09D73F6A8;
	Mon, 17 Feb 2025 12:04:14 -0800 (PST)
Date: Mon, 17 Feb 2025 20:04:09 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/11] perf arm-spe: Fill branch operations and events
 to record
Message-ID: <20250217200409.GC8144@e132581.arm.com>
References: <20250214111936.15168-1-leo.yan@arm.com>
 <20250214111936.15168-9-leo.yan@arm.com>
 <a5d99e7f-1d8d-41f1-976d-7d67a0d5decb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d99e7f-1d8d-41f1-976d-7d67a0d5decb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_120415_860407_83B0FA7C 
X-CRM114-Status: GOOD (  18.94  )
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

On Mon, Feb 17, 2025 at 04:20:57PM +0000, James Clark wrote:

[...]

> > diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> > index ba807071d3c1..52bd0a4ea96d 100644
> > --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> > +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> > @@ -207,6 +207,18 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
> >                               break;
> >                       case SPE_OP_PKT_HDR_CLASS_BR_ERET:
> >                               decoder->record.op |= ARM_SPE_OP_BRANCH_ERET;
> > +                             if (payload & SPE_OP_PKT_COND)
> > +                                     decoder->record.op |= ARM_SPE_OP_BR_COND;
> 
> I think this results in memory events being synthesised for these
> samples because of a bug in arm_spe__synth_data_source().
> ARM_SPE_OP_BR_COND overlaps with bits from other packet types like
> ARM_SPE_OP_LD:
> 
>        if (record->op & ARM_SPE_OP_LD)
>                data_src.mem_op = PERF_MEM_OP_LOAD;
> 
> arm_spe__synth_data_source() needs to only interpret that as a data
> source packet if ARM_SPE_OP_LDST is set. This was reported by Mike
> Williams but you have the privilege of hitting it for real first.

Good catching.  I have added a new patch 06 to fix the bug in the
v3 series.  Thanks for hooking up the info.

Leo

