Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9008B105F7AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE+QyFKBFuKIE6UOYDYkEGSxagOWhjG5FfwL5uDvRCk=; b=N8cc/tBjbdANb7Fqw3yIPmhFLf
	FG4kRSQjAh/nlxi8Cbgo1xz+WRr03YLOKd1+xV3kJahILL7jktdfhDVL3Me0wMBcqkHQVuB4O+eba
	PhQoXB3GxzSn0n0Xe6W0gpjA37vKZzIuLOxvg1iFVPatMblYARSjRYD9lIgqQn0yuvMsg8oftyhZj
	LiY0fQgwFgdzgosTsGBYhMWNxXNgD+H9Rz1EyDubebQGE37JqeW32VVzLc/MMMNJKsJuag6YF/eHq
	9ykP2DMwM/V2VzATfDqrJg35BbYnb69ITebKeMvGdthMR2GnXPwBBU2+Wy0vJTtyUAE3V5JGjjL5y
	pYZflDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12ST-00000000DKb-2Lf9;
	Fri, 13 Mar 2026 13:21:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12SR-00000000DHm-0feV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:21:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F4A4176A;
	Fri, 13 Mar 2026 06:21:29 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF0A63F73B;
	Fri, 13 Mar 2026 06:21:33 -0700 (PDT)
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
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH 1/2] perf: tools: cs-etm: Fix print issue for Coresight debug in ETE/TRBE trace
Date: Fri, 13 Mar 2026 13:21:28 +0000
Message-ID: <20260313132129.2743468-2-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313132129.2743468-1-mike.leach@arm.com>
References: <20260313132129.2743468-1-mike.leach@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062139_264421_AB008B06 
X-CRM114-Status: GOOD (  11.59  )
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

Building perf with CORESIGHT=1 and the optional CSTRACE_RAW=1 enables
additional debug printing of raw trace data when using command:-
perf report --dump.

This raw trace prints the CoreSight formatted trace frames, which may be
used to investigate suspected issues with trace quality / corruption /
decode.

These frames are not present in ETE + TRBE trace.
This fix removes the unnecessary call to print these frames.

Due to an addtional fault with the OpenCSD library, this call when ETE/TRBE
are being decoded will cause a segfault in perf. This fix also prevents
that problem for perf using older (<= 1.8.0 version) OpenCSD libraries.

Fixes: 68ffe3902898 ("perf tools: Add decoder mechanic to support dumping trace data")

Reported-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Mike Leach <mike.leach@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 3050fe212666..f7e89693cf16 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -739,7 +739,8 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 		goto err_free_decoder;
 
 	/* init raw frame logging if required */
-	cs_etm_decoder__init_raw_frame_logging(d_params, decoder);
+	if (format == OCSD_TRC_SRC_FRAME_FORMATTED)
+		cs_etm_decoder__init_raw_frame_logging(d_params, decoder);
 
 	for (i = 0; i < decoders; i++) {
 		ret = cs_etm_decoder__create_etm_decoder(d_params,
-- 
2.43.0


