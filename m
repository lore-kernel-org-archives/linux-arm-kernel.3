Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F147ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C67O4LVeg8WMDJ8KU9F1/iW0QK6epKrLMnUjULyR+wE=; b=5Goh5Q+yuejyT+7rXznNp09g1J
	WQkAYKTJiJdczoIvPluB8g2q1+yssKOI01CvTSgCRCUA/UgSg8rzU5SUfujL1YHGVCn4a0bG+Tmvh
	7C1DgHEHd1OzJWe6QhvyqnVs50qiQgnJcvmiB6xThJUbQxy1PAtMEXWKpM6Q7ggCYs1qQg3ajk+rP
	rQhM7r6Bq9bodh75nj1nuoGyOFS9+/MWYw5qEeC/haW5IiUgz0HnWVGYs3SEPNaFnnAM/Mvw/CcSh
	zlf0SQt4avjUFwEekfmx84t+6BUw0yrJIVPo62t4t9QMhYJok5HtOy78A+wNtGt8jjSMJLpszfBhW
	3SOzI0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU8C-00000005jGM-00lh;
	Mon, 10 Nov 2025 15:48:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU8A-00000005jGC-3aZM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Nov 2025 15:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C67O4LVeg8WMDJ8KU9F1/iW0QK6epKrLMnUjULyR+wE=; b=wJ0M+0LacOP1OLv0g4ScRMqglS
	LJK9h7xh6K4qf0modj5inMpydmTdGbcMa7u9oY50NBpmiUWjjm5opruYL1W72Y/GSXDF7DHO25qvl
	586Dr6AONOKccWRf436bm2xB571dWjwNdOivv0ZI/CfrO4M/nk0JrLuNmgUUCwJIjsx7OGodPSPQe
	phSKMDJo6WAUVBX4EMKgDFu58GhCxYg0ZomDpAcyLYAzI8slSTAwij3VIviu89UTMFO0YE+gtPFnF
	WqwJJegK0lW/mea8+L2aG91IiywF2Z/9h726ZmklZ5XudGqzHMoitlRUo7gWB+t5NQNkaMGgzzgTU
	eyvGuy2Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU85-000000016gd-0EKo;
	Mon, 10 Nov 2025 15:48:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DE6E330029E; Mon, 10 Nov 2025 16:48:27 +0100 (CET)
Date: Mon, 10 Nov 2025 16:48:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v9 2/5] perf: arm_spe: Add support for filtering on data
 source
Message-ID: <20251110154827.GA278048@noisy.programming.kicks-ass.net>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
 <20251029-james-perf-feat_spe_eft-v9-2-d22536b9cf94@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-2-d22536b9cf94@linaro.org>
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

On Wed, Oct 29, 2025 at 03:46:02PM +0000, James Clark wrote:
> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
> when any of the filter bits are set.
> 
> Each bit maps to data sources 0-63 described by bits[0:5] in the data
> source packet (although the full range of data source is 16 bits so
> higher value data sources can't be filtered on). The filter is an OR of
> all the bits, so for example clearing bits 0 and 3 only includes packets
> from data sources 0 OR 3.
> 
> Invert the filter given by userspace so that the default value of 0 is
> equivalent to including all values (no filtering). This allows us to
> skip adding a new format bit to enable filtering and still support
> excluding all data sources which would have been a filter value of 0 if
> not for the inversion.

So from that I'm reading the config4 field will only have like 16 bits,
but here:

> +#define ATTR_CFG_FLD_inv_data_src_filter_CFG	config4	/* inverse of PMSDSFR_EL1 */
> +#define ATTR_CFG_FLD_inv_data_src_filter_LO	0
> +#define ATTR_CFG_FLD_inv_data_src_filter_HI	63

you claim all 64 bits.

Also, afaict:

  #define ATTR_CFG_FLD_min_latency_CFG            config2 /* PMSLATFR_EL1.MINLAT */
  #define ATTR_CFG_FLD_min_latency_LO             0
  #define ATTR_CFG_FLD_min_latency_HI             11

Still has more than 16 bits left.


So why exactly are we needing config4? Can we please get a more solid
argument?

