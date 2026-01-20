Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CA8D262A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyEcZT0kKlUcF1Yh5ua6DZeWgC3/SBWz00KP7hAdEEQ=; b=Hb4UhlLy+uiNKqpSKCwu7q2wz1
	SIrY5VyNw52WKIQboKzi6y6AsWH2bKZ+3bH+b/xcLxrg3K9E5rbr1x/KNvzjS9+aD2yM+XkWzkSGC
	GhPKtzBpugUK0AaZF+/y1quBbL4jFNjOL5if80Ab4JCrWSjlxLdsc0UkN3XQutd7vJIc/imTkry37
	QC6WObDtW7cOnTFw17q9tgJykoGlswOr8kO7NLfgb4TzmWHjSIb1ltxZDS6DUllj2kNDqIpCcb6ea
	q6rEWYqh3uVPxp+eLDwfSO9YmeS9VCRSI9MvNZBDb+CzADZircFYNEKPRziaddzuocy6L5Nyc1Odt
	R86+9pMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIYT-00000004SFY-1A1L;
	Tue, 20 Jan 2026 20:42:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIYQ-00000004SEr-2zr8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06F7640462;
	Tue, 20 Jan 2026 20:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884E2C16AAE;
	Tue, 20 Jan 2026 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768941741;
	bh=U9XtcS6SGnMCQXfPrjDwQsK082uXb9exkeo9uwuSYXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqxpQ21PI2UhqN/koWbLjfVpCeJPzMraKphjfy1VY6q95j40R0vcDs7jLyxGrGTmI
	 Wq49a8KQZ467OkiIulPTeO39G6xl3VAW4g7ge0nxIr1j822kPfeNgCZFPJ2qE9AwwL
	 7yOHXpx0FQ/2aFGfyUOka7MJQDdZwwa64B5DGEWSnaH4QG7JGSvhVwrFHtHA1mOLXn
	 VSbStBqMybS4lNkQ0KNvSyL2oUh7vChzW72j091BwFyhfTuubrYd4JB4nSlUGdxiBA
	 NrX+w7uldusD9WE+MkFHblyoeXvfmN5qb4hBq0KD263iD3auxj69qvbga+aWveKN1w
	 swhG5lBhl2VnQ==
Date: Tue, 20 Jan 2026 17:42:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] perf cs-etm: Test sparse CPU maps
Message-ID: <aW_oq49HegG5kZ6b@x1>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-2-56b956a629ee@linaro.org>
 <20260120112238.GH2732125@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120112238.GH2732125@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_124222_769025_1E0AC8FD 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, Jan 20, 2026 at 11:22:38AM +0000, Leo Yan wrote:
> On Mon, Jan 19, 2026 at 10:18:36AM +0000, Coresight ML wrote:
> > We only currently test with default (all CPUs) or --per-thread mode.
> > Different permutations of the "-C" option can affect decoding so add
> > tests for some of them.

> > Signed-off-by: James Clark <james.clark@linaro.org>
 
> LGTM and verified on Juno board:
 
> Tested-by: Leo Yan <leo.yan@arm.com>

Thanks, applied both patches to perf-tools-next,

- Arnaldo

