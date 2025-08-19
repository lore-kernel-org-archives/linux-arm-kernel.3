Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20C8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aarNRVpQrcdhWvWzPuZ4O+zmiwkW5vV1OFJeRBhLGMk=; b=VNzTLVRAqhhK7V58WEgZ/N7ugG
	laDIyDYAPcYaO8UXQHmPPFoIsFF41qaBOQXGysq1UnHIZnf+pECIG3dYef5E4Azi3JZgAbxewjz9j
	jMnpmYSqMFbndAnYoykMMI1ZsS999JmwboAbKjuY2tvy7TD9GpbMDyaJZaqe27Vj80vlSyZkvFggY
	Aoq26WYtkmu4XtYdwe1G1FmbiexRad1UDa26atPFqYsIeBsla+3xsXVkbR231ZXQb6FL8qUrkZOEq
	+bgn6RNpLYOKLC2j6l5Tn6yAwrlhFi3o99AltjOmHrSiJ82ISD+5VgtIZrdN5Gmlt2YhMmZemUVav
	At5bTbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoL5d-0000000ANaH-3QNx;
	Tue, 19 Aug 2025 12:05:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJNK-0000000A6DY-2nR7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CAF895C5943;
	Tue, 19 Aug 2025 10:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43B9C4CEF1;
	Tue, 19 Aug 2025 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755598529;
	bh=vpLOTu6ZuSIscsnYbHpLOnSo0w7zb/mTZyGvaB0D0Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtQbQwanw50GY2R5i426Q4AmJOuIULqWkIexyYP0lavMM714U79QUAPNF25KsZdqd
	 woUR3d/4ieMbU5F+mIBwUq6l4lLkHY7bCw+i0/6Zx8mZHeg+K1MKbmoqgRKdY6qy9y
	 SYuErEu27tyQbptl96WEu+GrnLn2ORH9icoda41EGtjQs7wc83DEc1iVDyNHRBQmg3
	 cCHMTa24ZUNpT6L+KoqjHB+iohVWV7pXlBu7eKCIP2giF3/ysBEZLlRNGqFXnq1mS0
	 tZRz47/LMeMQ1dwbg+sUdh5GH6+7ByH23X41etxnlyVNRjWkwCQocixaHUHHdBLBAe
	 eJ0J+HSA74IPg==
Date: Tue, 19 Aug 2025 11:15:22 +0100
From: Will Deacon <will@kernel.org>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm64: Sync ESR_ELx_EC_* macros in
 arm64_exception_types.h with esr.h
Message-ID: <aKROus1HA4ch9XJz@willie-the-truck>
References: <20250814151452.618765-2-ysk@kzalloc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814151452.618765-2-ysk@kzalloc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_031530_742389_1D38A021 
X-CRM114-Status: GOOD (  12.66  )
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

On Thu, Aug 14, 2025 at 03:14:53PM +0000, Yunseong Kim wrote:
> Update perf util arm64_exception_types.h to match the exception class
> macros defined in tools/arch/arm64/include/asm/esr.h. This ensures
> consistency between perf tooling and the kernel header definitions for
> ESR_ELx_EC_* values.
> 
> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> ---
>  tools/perf/arch/arm64/util/arm64_exception_types.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

This looks consistent with asm/esr.h on arm64, so:

Acked-by: Will Deacon <will@kernel.org>

Will

