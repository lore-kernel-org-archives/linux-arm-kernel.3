Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7011C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GFlDSvdW/TKd/1FN1dOOil65FUvgytCNICKt9gpydQ=; b=xEqc2uaFgPfvJJgUCPlVv6S2MG
	7uryBlkPcQ8Ab4tHm6EBNewsyslDOirbAalAS9FtBpwK64oJQeljZlU6g/2kCz2VMJM8QikZw3uD8
	8VdB97JgtkenaQFaorPuEj3kFTORHhoTrNl7RAiWdFRby1CSakIjqwchS64bzDgoY0QMy6w7zoubt
	B5ADwVyckkzdxEv7pEM22/Mincln49YBTe2wDkje+XuOhv8FbRL+8Q9X+nAj4qwSccnPHG3n2cYOl
	xTPM+JvPkcnxw7CAegilRHM9wQX87Hg1R/h5ttIQQpn3n2p3zd/vjdZ9py92wbAl60jseTvArTLif
	cU65KRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN79-00000002yfF-01SQ;
	Mon, 14 Jul 2025 17:37:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLKR-00000002jS2-1aOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:42:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B279B1BC0;
	Mon, 14 Jul 2025 08:42:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 717183F66E;
	Mon, 14 Jul 2025 08:42:53 -0700 (PDT)
Date: Mon, 14 Jul 2025 16:42:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	German Gomez <german.gomez@arm.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 01/14] drivers/perf: arm_spe: Expose event filter
Message-ID: <20250714154251.GF1093654@e132581.arm.com>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
 <20250707-arm_spe_support_hitm_overhead_v1_public-v3-1-33ea82da3280@arm.com>
 <aHUBFGPck-O3vs9b@willie-the-truck>
 <20250714150921.GE1093654@e132581.arm.com>
 <aHUerfpLyAPEc9R_@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHUerfpLyAPEc9R_@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_084255_456411_5DF35C63 
X-CRM114-Status: GOOD (  18.87  )
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

On Mon, Jul 14, 2025 at 04:13:49PM +0100, Will Deacon wrote:

[...]

> > > In other words, remove arm_spe_pmsevfr_res0() and the two checks that
> > > use it in arm_spe_pmu_event_init(). If userspace tries to filter events
> > > that aren't implemented, then it gets to keep the pieces.
> > 
> > Then the question is: what information should be exposed to userspace
> > so that tools can decide which events are valid?
> > 
> > I would suggest to expose a new entry, "caps/version", to indicate the
> > SPE version number. Tools can use this to apply the appropriate event
> > validation. Please let me know if this works for you.
> 
> I thought userspace typically had midr-based json files to figure this
> stuff out?

Yes, the perf tool records the CPU MIDR in the metadata.

However, I deliberately tried to avoid relying on this approach,
because the perf would then need to maintain a mapping between:

  MIDR -> Arm SPE version -> Events

Given the large number of CPU variants, maintaining this relationship
between CPU ID and SPE version, and subsequently mapping it to supported
events, would be quite complex. Additional effort would be required each
time a new CPU variant is introduced.

> The supported events aren't probe-able afaict so I don't
> think the driver can help.

Although the events are not probe-able, some events are specific to
certain Arm SPE versions. For example, E[23]:

  | Data snooped.
  | When FEAT_SPEv1p4 is implemented

With SPE version information, the perf tool can decode E[23] == 0 as:

  "No snooping" for SPEv4

  "No available information for snooping" for earlier SPE versions

Without SPE version information, it's impossible to distinguish
between these two cases.

Thanks,
Leo

