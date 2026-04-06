Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CAEF46C6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgyOFP71TDyPreDGMJUVimZObBX6ejHMT0AJsGrNDhw=; b=OAK5fPdlSbVcljeAdx+WS1EwBF
	ZelE9kVr9+Z5m4Sflt1PDywlMEhF+rlGWaLLItpGkLG4WqjMeiJgzMqjotLbElycLCSQ1krMVBE2F
	SBPxfFmBJzuuZHSub0dG8JQQ4ZseHA0mVkLaNqTqHBZlAmwN8DFFChTilDrCRk7njGGwVmp8PAqAF
	tnq0LsbVxgsGCOrL+P53gB5x7qtYfd57mOEPR1lkC2KpbnaOjLQxrtebG7OAPORw6B37IwKvw7MV0
	boilB5YSH/wJuLDO5+OXjvfuDXT57tXsKCDLJXxjiBByA9+bog5z0qza/BO8jHDqk6qkJ6D5HO0cz
	wjrC6XaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9oWc-00000005OMG-2EHt;
	Mon, 06 Apr 2026 18:18:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9oWb-00000005OM8-0LKW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:18:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1660E60103;
	Mon,  6 Apr 2026 18:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D995C4CEF7;
	Mon,  6 Apr 2026 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775499491;
	bh=+jNcEeJCB0s1TuZwaY9HBVQLpAwN4rI0/P/O0NrQfHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pp8NSskaS5bqEU5b1lBjt+AswPtIWTg/v5wR/9yrI+7Y9oRYLT3oNuRT3Zd37bDkX
	 PUqRkRPJDHUWW9GiCDH+KmmAZBacea+Z4Cl/Z7frE3MIxe+BM+WLPnU/vZhrOGA29t
	 R1YA4v/CdsqvH5G5hjNOrESt2KVNEPzcsoBWWM9ylYBlAGNpveWEP0RLpdnpUPY2F/
	 R4DgAyfBatCu8TyrYf3Z1IBHN+3zgKCOu8m7Bj79KXrpCxQogzpSPmOMHLECaCkP7n
	 bSgExsL2YLK+HzF0a0jm4Kaq0CussiEPpIuRFRlxcvOTLaYVwwHVsesc2WLkqVFRtV
	 WFQ6arp9LYmxA==
Date: Mon, 6 Apr 2026 11:18:09 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] perf arm_spe: Dump IMPDEF events
Message-ID: <adP44THdD-HBB8cY@google.com>
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
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

Hi James,

On Wed, Apr 01, 2026 at 03:25:48PM +0100, James Clark wrote:
> In the Arm SPE raw data dump, IMPDEF events aren't printed. Add the
> ability to add names for some known events or print the raw event number
> for unknown events.
> 
> For example:
> 
>   $ perf report -D
> 
>   ... ARM SPE data: size 0xd000 bytes
>   00000000: b0 18 c6 32 80 00 80 ff a0  PC 0xff80008032c618 el1 ns=1
>   00000009: 64 e7 42 00 00              CONTEXT 0x42e7 el1
>   0000000e: 00 00 00 00 00              PAD
>   00000013: 49 00                       LD GP-REG
>   00000015: 52 16 10               	EV RETIRED L1D-ACCESS TLB-ACCESS
> 
> On N1 the event line becomes:
> 
>   00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS LATE-PREFETCH
> 
> Or on other cores it becomes:
> 
>   00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS IMPDEF:12
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> James Clark (4):
>       perf arm_spe: Make a function to get the MIDR
>       perf arm_spe: Turn event name mappings into an array
>       perf arm_spe: Decode Arm N1 IMPDEF events
>       perf arm_spe: Print remaining IMPDEF event numbers

Will you send v2 or do you think it's ok to merge v1?

Thanks,
Namhyung

> 
>  tools/perf/util/arm-spe-decoder/Build              |   2 +
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 147 ++++++++++++++-------
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   5 +-
>  tools/perf/util/arm-spe.c                          |  49 ++++---
>  4 files changed, 135 insertions(+), 68 deletions(-)
> ---
> base-commit: 74e2dbe7be5037a5e5eed6bc1ad562747ac88566
> change-id: 20260331-james-spe-impdef-decode-d944f4fdcff7
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 

