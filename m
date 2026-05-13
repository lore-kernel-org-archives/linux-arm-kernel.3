Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E7CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kIyN+HMniuQx33gEcZ3ohcmrFYZ4Sh9SC8B88K2wcc=; b=KOmH/dmE/F31jHm1TaKaZkhijm
	rYL1KT5JgMWR1QcvSxxc+1toGLylx1JjGz7YVKGXVms5dSxdavAA/WnfWgB7pBVdDA3iyxMmmIXaJ
	d6+tqWxV89BTxlGZpe8SIuinxyOv1N3O0GCjLIkfmwKyhSkcGuTKxnhUZzu96Gqczhn7Dm+j/2+HB
	kPKs4X+ObDgXw9Tk4ABQqX+RYXgStZw70cUm0xLRaYn3MGyzGUaJLHPxaQsACOakZKFTVXqbeRrFt
	H5Q4PHuYoIkFSyj0M69c5yRiKTgMUPlTVo6Nw2ya66M+kEm3GTpHqMguaLpWLMjtYyHbHJ50AelZQ
	KcsRYJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6hd-000000029IW-1cxD;
	Wed, 13 May 2026 10:20:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6hY-000000029GR-2FBz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:20:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 644611650;
	Wed, 13 May 2026 03:20:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C50C3F7B4;
	Wed, 13 May 2026 03:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778667626; bh=kFvTrr5lJpNJvDr3fdaHSC+zFry1lWQIXZUKTBx3L1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNYAxVKza3PQJhUpXaSnZ2e+T2igw4Q9GliYm71/gsnjf4PaRVCerBtdlH66+l+rk
	 ynkUM/HOkTGS3UDX3FKRfdKrBrp1vR7GNMwF9ZYxzSaZCbMQ33Pazf5+KY/32tpgNg
	 V64XoKhQhFZoP50NY5f/QUhffdPUQC6O51PZtEag=
Date: Wed, 13 May 2026 11:20:24 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf arm-spe: Don't warn about the discard bit if it
 doesn't exist
Message-ID: <20260513102024.GE34802@e132581.arm.com>
References: <20260410-james-spe-discard-warning-v1-1-985c02756ee4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-james-spe-discard-warning-v1-1-985c02756ee4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032029_040969_4C7E54A0 
X-CRM114-Status: GOOD (  15.86  )
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

On Fri, Apr 10, 2026 at 12:05:12PM +0100, James Clark wrote:
> Opening an SPE event shows a warning that doesn't concern the user:
> 
>   $ perf record -e arm_spe
>   Unknown/empty format name: discard
> 
> Perf only wants to know if the discard bit is set for configuring the
> event, not in response to anything the user has done. Fix it by adding
> another helper that returns if a config bit exists without warning.
> 
> We should probably keep the warning in evsel__get_config_val() to avoid
> having every caller having to do it, and most format bits should never
> be missing.
> 
> Add a test for the new helper. Rename the parent test function to be
> more generic rather than adding a new one as it requires a lot of
> boilerplate.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

