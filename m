Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F7D105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hVS0P9DJVgojc+Au1ojllmLN38KSGK/jCUvNVfA8RaU=; b=4bMznLZB4rhpJtd11Qh7vZeOye
	NpdT2UhyG8w3Uir4jBvntjHQ+Pbu2IygNsSnzuUGDTgavrDLCxXI8mNpMJmpdn4sLoZmgtFnlxB5c
	heSWYwn9+PoDyZk2z+VTC5/7t7HM0CvLXZlviX/zVhSbF0vWZyb9/cHmtTnW+Ddu+1F74MLoz25Fn
	gplVeUGPfetITlE+mGOVJQYeAevpfKnjMpusUOiWjtzr7gsUC04WY/DhbgNdho2GOK4dr3/nM7Uu0
	IrKxJ05H5HYhRCRgXqB2lE8wu5PphoG1yFWHOvh84ZohpXsCuSOxaPuriKZyxWR60WSIiMsXTwpnQ
	Ki98eKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12ST-00000000DJp-0qPh;
	Fri, 13 Mar 2026 13:21:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12SQ-00000000DHc-37rs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:21:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78D47497;
	Fri, 13 Mar 2026 06:21:27 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0E583F73B;
	Fri, 13 Mar 2026 06:21:31 -0700 (PDT)
From: Mike Leach <mike.leach@arm.com>
To: linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	acme@kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@redhat.com,
	namhyung@kernel.org,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH 0/2] perf: tools: cs-etm: Fixes for CoreSight debug dump
Date: Fri, 13 Mar 2026 13:21:27 +0000
Message-ID: <20260313132129.2743468-1-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062138_834748_BA74777D 
X-CRM114-Status: GOOD (  10.49  )
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

perf will output additional CoreSight debug information, from the
'perf report --dump' command, when the build option CSTRACE_RAW=1
is added to the usual CORESIGHT=1 at build time.

This additional information consists of raw trace data in the form of
CoreSight formatted trace frames. This is intended to be used to
investigate possible issues relating to trace data corruption,
trace hardware issues or problems with decode.

The CoreSight formatted trace frames are used when multiple ETMs trace
into an ETR, and not present when a single ETE traces into the TRBE.

When the build option is used and perf is used to dump an ETE/TRBE
generated buffer a segfault will occur in the OpenCSD library.

Patch 1 of this set removes the unnecessary call to print the raw trace
frames when not needed, and fixes the segfault where older versions
of OpenCSD are in use.

Patch 2 enhances the debug output to associate raw data with individual
packets, which means that raw data is now present for ETE and extended
for ETM.

OpenCSD is being fixed independently.

Mike Leach (2):
  perf: tools: cs-etm: Fix print issue for Coresight debug in ETE/TRBE
    trace
  perf: tools: cs-etm: Enhance raw Coresight trace debug display

 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0


