Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7560ACAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FP9F2q4zhy2+XABfevv7bpqLyqifn1jlp8vzcsdIhc=; b=oLY261ZefeyevPJBk8efUZjStM
	MLHAU3Y7xJzjRBPIan42ec1ghvojgmz1vSBr1dCwQvcaEU8Y0wcqiw3jNCEixBbMA0uJ1H79CwtkH
	2XjoqCZKhwhEgOI3ASHjFT8JtoRKONkc5ardYwpXcXH/rvub/SALMT2Ig9p72x3fdS1Wk+K+Vq145
	8CvnhSa8124rDRduPlS3D09t6p/wmLirapVamIq9VHJuA4UZotPOtU80IWuvD2vmYxxkFZLAx2CIf
	642KXG5cj1dYvtdf3OSUV2y2ivDPn/K8JzbpHl50aWymARlqtXnlF+VlENVAJYN/8O1X1F+D0HnxC
	3sjCvf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsC3-00000004plV-3LZw;
	Tue, 09 Sep 2025 06:51:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvjEG-00000002Pn2-1iX9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 21:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68EF3601BD;
	Mon,  8 Sep 2025 21:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96706C4CEF7;
	Mon,  8 Sep 2025 21:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757366207;
	bh=J5y9anpPbcZnzbPgCVt9jP6JmKsctgV7OtX+n3Hj8X8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rf9r8XOhD3mO2RluD/ZLcZMFnqDiIyrxGHxxsMC3onceoyCLbXetm8qjOAWzQ+D3r
	 edoqlwKMbjHlFHq0Fvatii33cblSIErw94ODgYtQnvqHA7gomIgPEg9WvECGewxGM5
	 89pxeGbis1brBj6vkZAEXreXiL6zuU9oqYkpsne+n2QkkRCLWioh0Tdgx2FSbWzz4D
	 lCDlDiHAcLkhjEHSR3RtzLoX1tTuMORw+V2lvOl0eNKC3iUGIJ+s8r3/VgEKkFgfu5
	 b/kgWh6FYD7SEPW9++bpDdPcPs7j4vPcTZ2BT+FYRN6UDXCbHGzOnRIfsFN0JlNPG0
	 yGQaKEu7jhnaA==
Date: Mon, 8 Sep 2025 18:16:44 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	George Wort <George.Wort@arm.com>,
	Graham Woodward <Graham.Woodward@arm.com>,
	Ben Gainey <Ben.Gainey@arm.com>,
	Michael Williams <Michael.Williams@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] perf arm-spe: Improve --itrace options
Message-ID: <aL9HvOl-n_IM0qiB@x1>
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
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

On Mon, Sep 08, 2025 at 01:10:17PM +0100, James Clark wrote:
> Most people also want all the SPE samples (instructions group), not just
> the flagged samples that are put into the various memory groups. These
> should have been shown by default but weren't because the default
> interval type wasn't supported.
> 
> Also when looking at this, it appears that the downsampling was behaving
> in a way that would discard samples from one group but not another.
> Improve that and the warning messages.
> 
> I don't want to put fixes tags on these because it's only changing the
> defaults and the behavior, but I don't think the previous behavior was
> incorrect necessarily, just copied from tracing techs but not ideal for
> SPE.

I keep trying to find some hardware to have in my homelab to test these
series, but till then I depend on people having access to such hardware
for acks or better, tested-by, so waiting a bit for those to appear.

- Arnaldo
 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> James Clark (4):
>       perf arm-spe: Show instruction sample types by default
>       perf arm-spe: Downsample all sample types equally
>       perf arm-spe: Display --itrace period warnings for all sample types
>       perf docs: Update SPE doc to include default instructions group
> 
>  tools/perf/Documentation/perf-arm-spe.txt | 14 +++++---
>  tools/perf/util/arm-spe.c                 | 53 ++++++++++++++++---------------
>  2 files changed, 37 insertions(+), 30 deletions(-)
> ---
> base-commit: 75a7b9d29215c5aa813b9620f3c56817918f9f8c
> change-id: 20250908-james-perf-spe-period-4711a566cba4
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 

