Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF23F36BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 05:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R64izSY6l9zcdWWOFI8k1qjWyXxj1SLKYc00O2ndEvg=; b=WDjkB7dXwKFaPmbYHRu/+1ncdm
	WHaHR2rB+qL01/DCKGVm1yKBuzGIfFmyOdHddha3PuWJYzugGa73jZRnoEo5rUKmXtB4MoOmpPp9g
	oAx1YsDZUtgqotPPKgtUNgClI7zoo+XOxNc6kSYoTVZz+rGQCH7xrDBLg0qLY4kFBoV4qs2/6Qykx
	bVxf8Vc951rMOqufweOYzaqRx5rT9Qb4bq2oV31u9MhCZsewedbP5sKXBk8t5Irku5RtVtOZgQ7T2
	ZRRYVrCH4M6p9eo8ct4JHEb94b8H52Yw0u48Vw4ItUQ5VuUoJxlgLm2nQeARek+13bMfJY18htHj+
	vJsSh0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB48b-0000000BcOt-0ms3;
	Fri, 10 Apr 2026 05:10:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB48X-0000000BcOO-3sWY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 05:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C2C0401FA;
	Fri, 10 Apr 2026 05:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6C3C19421;
	Fri, 10 Apr 2026 05:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775797833;
	bh=fJ7v0Jhvk3LlyZE3av0sez+GL2CuEUcfvz33Z3lQ5nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nw8D1mu8rQkAZrj92tK/gsFrIws1UtWgBqPKeQBzjx3Up5YQMFlCWzsVmg8dvgLoh
	 jd2LrFR24Z63p6cOktfLjLronZfIcyPOjZN1JuF3D7QQ0ruzGaon0a4YGOtzEUnOWj
	 KS7nCdU42Eb7RELmhOb8oYKI7x/3ydQFR26CkgNL7so/ejxTtkhTmI1oHLsw6vToYG
	 /FPWGLcF7E3kIpYyihRUFyHDsQjDsrRqLnzAZ8FKLJI/0Uw2+ufEkuyZMHO+iU4rWp
	 pBNfPRLei0wTMHhxcxQtHv3tqgO6miMVcHFqt7+7vAwX0CR2/w1suBtXZI2Ha0Yuze
	 UXK8ob8mOYuFQ==
Date: Thu, 9 Apr 2026 22:10:31 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/4] perf arm_spe: Extend SIMD operations
Message-ID: <adiGR-A-N1tMzxTE@google.com>
References: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_221034_025844_C266BB67 
X-CRM114-Status: GOOD (  18.60  )
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

On Wed, Apr 08, 2026 at 10:42:30AM +0100, Leo Yan wrote:
> This series extends SIMD flag for Arm SPE and updated the document.
> 
> Since I failed to get perf core maintainer's review for uAPI header
> updating for data source fields (since last year's Sepetember), this
> series I dropped uAPI changes and sent only SIMD flag changes, hope
> it is easier for perf tool maintainer's picking up.
> 
> Anyway, uAPI patches will be sent out separately.
> 
> This version is rebased onto the latest perf-tools-next branch.

Unfortunately it doesn't apply due to a recent change.  Can you please
rebase it once again?

Thanks,
Namhyung

> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v5:
> - Dropped uAPI header changes for data source fields updating.
> - Link to v4: https://lore.kernel.org/r/20260106-perf_support_arm_spev1-3-v4-0-b887bb999f6e@arm.com
> 
> Changes in v4 (resend):
> - Updated for Ian and James' review tags.
> - Link to v4: https://lore.kernel.org/r/20260106-perf_support_arm_spev1-3-v4-0-bb2d143b3860@arm.com
> 
> Changes in v4:
> - Updated for Ian and James' review tags.
> - Rebased on the latest perf-tools-next branch.
> - Link to v3: https://lore.kernel.org/r/20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com
> 
> Changes in v3:
> - Rebased on the latest perf-tools-next branch.
> - Link to v2: https://lore.kernel.org/r/20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com
> 
> Changes in v2:
> - Refined to use enums for 2nd operation types. (James)
> - Avoided adjustment bit positions for operations. (James)
> - Used enum for extended operation type in uapi header and defined
>   individual bit field for operation details in uaip header. (James)
> - Refined SIMD flag definitions. (James)
> - Extracted a separate commit for updating tool's header. (James/Arnaldo)
> - Minor improvement for printing memory events.
> - Rebased on the latest perf-tools-next branch.
> - Link to v1: https://lore.kernel.org/r/20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com
> 
> ---
> Leo Yan (4):
>       perf sort: Support sort ASE and SME
>       perf sort: Sort disabled and full predicated flags
>       perf report: Update document for SIMD flags
>       perf arm_spe: Improve SIMD flags setting
> 
>  tools/perf/Documentation/perf-report.txt |  5 ++++-
>  tools/perf/util/arm-spe.c                | 26 ++++++++++++++++++++------
>  tools/perf/util/sample.h                 | 21 ++++++++++++++++-----
>  tools/perf/util/sort.c                   | 21 +++++++++++++++------
>  4 files changed, 55 insertions(+), 18 deletions(-)
> ---
> base-commit: dc647eb00969cd213c84d6caee90c480317e857d
> change-id: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2
> 
> Best regards,
> -- 
> Leo Yan <leo.yan@arm.com>
> 

