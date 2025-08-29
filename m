Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8649CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW9XVzeRu3JRJnrtHvHeMi/5AgVk0i3MECbY4YOyDbk=; b=ekGN87WhAuq9QUXgHstF7V/O2e
	9YGjy0c9c/Fu1maQvIoFyAiJFXMBmjV47eZOUaOJxdb3a00ABlCCfYLmjafqalG0+CTHWr3pPq1eM
	vNB7VqvzXMV5B63pvzrI6diYhGkAt4lAJvCwVffySJ5iQJnemeJ33WyC1vm1Azba1CzQZIQD9rgMa
	+DQJzTDKU9B7Q87yBG8pQoOO+px/hUNZk8b0wcAY3yWpTRivJ1iGFB+a8sO70sqH4McvzR8kzWFvW
	vtirLSR+LveS1t+xELgehMy/pnwKOP0l/Y2MhuvHTMyZlhi+hQDW+hrwn6PjicFy69aF+rEBKe5Aq
	u4dMOTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us25W-00000006Q3X-3lr9;
	Fri, 29 Aug 2025 16:36:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urz5p-00000005oUu-0HmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:24:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050EA12FC;
	Fri, 29 Aug 2025 06:24:28 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F0D3F738;
	Fri, 29 Aug 2025 06:24:35 -0700 (PDT)
Date: Fri, 29 Aug 2025 14:24:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH v2] perf: arm64: Sync ESR_ELx_EC_* macros in
 arm64_exception_types.h with esr.h
Message-ID: <20250829132434.GI745921@e132581.arm.com>
References: <20250822145855.53071-2-ysk@kzalloc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822145855.53071-2-ysk@kzalloc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_062437_142683_12144471 
X-CRM114-Status: GOOD (  10.08  )
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

On Fri, Aug 22, 2025 at 11:58:56PM +0900, Yunseong Kim wrote:
> Update perf util arm64_exception_types.h to match the exception class
> macros defined in tools/arch/arm64/include/asm/esr.h. This ensures
> consistency between perf tooling and the kernel header definitions for
> ESR_ELx_EC_* values.
> 
> In v2, ESR_ELx_EC_OTHER and ESR_ELx_EC_GCS, which were missing in v1, were
> included.
> 
> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

