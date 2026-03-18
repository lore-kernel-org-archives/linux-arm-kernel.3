Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FA5107BCF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HGULTiH3yhQh2ei8XHzEwWCdJYNyeJJdmBPtXxQ1vVc=; b=qFUPji5+lYYs17q7FGwBFbNRA6
	JJOfowSfMDzv8c+tzVScxcqoz8OIBgPRtL/XEviY8mdtU3LURidkylaOwDkuS7vsv/nIDjQrkpMCJ
	/SxbgmMbS9jCyw9vT2a7aURUNhdfKIkx6XTR52xGDi3+UGSuKKUfDr3aJvSUK2NjHdZMBRyhF2Fko
	wQiktT73n5NrV4xSP47gzlJcZV5VFaww5WfxNyUCpSLScBCOx0gWYfmVfnuDDwK4hpx32Vd6Q5FCg
	6EiF1XOIiMRWx4rcCWpwCLwaSch/aa3UgU4FCNdWB5+G1mWFjRGGQL8HhM1ytR1KmeiPaOThFgh0T
	Owxtkn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oGi-00000008DZo-2PlW;
	Wed, 18 Mar 2026 10:36:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oGf-00000008DZ9-0OAu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:36:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C40501E2F;
	Wed, 18 Mar 2026 03:36:38 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0F5C3F778;
	Wed, 18 Mar 2026 03:36:42 -0700 (PDT)
From: Mike Leach <mike.leach@arm.com>
To: linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	acme@kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@redhat.com,
	namhyung@kernel.org,
	irogers@google.com,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH v2 1/2] perf: tools: cs-etm: Fix print issue for Coresight debug in ETE/TRBE trace
Date: Wed, 18 Mar 2026 10:36:39 +0000
Message-ID: <20260318103640.464982-1-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_033649_250453_0A06B6C8 
X-CRM114-Status: GOOD (  16.43  )
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

This fix also rationalises implementation - original code had helper
function that unnecessarily repeated initialisation calls that had
already been made.

Due to an addtional fault with the OpenCSD library, this call when ETE/TRBE
are being decoded will cause a segfault in perf. This fix also prevents
that problem for perf using older (<= 1.8.0 version) OpenCSD libraries.

Fixes: 68ffe3902898 ("perf tools: Add decoder mechanic to support dumping trace data")
Reported-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Mike Leach <mike.leach@arm.com>
---
Changes in v2: Rationalise implementation
---
 .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 51 +++++--------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 3050fe212666..8592a778b26a 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -237,46 +237,24 @@ cs_etm_decoder__init_def_logger_printing(struct cs_etm_decoder_params *d_params,
 					      (void *)decoder,
 					      cs_etm_decoder__print_str_cb);
 	if (ret != 0)
-		ret = -1;
-
-	return 0;
-}
+		return -1;
 
 #ifdef CS_LOG_RAW_FRAMES
-static void
-cs_etm_decoder__init_raw_frame_logging(struct cs_etm_decoder_params *d_params,
-				       struct cs_etm_decoder *decoder)
-{
-	/* Only log these during a --dump operation */
-	if (d_params->operation == CS_ETM_OPERATION_PRINT) {
-		/* set up a library default logger to process the
-		 *  raw frame printer we add later
-		 */
-		ocsd_def_errlog_init(OCSD_ERR_SEV_ERROR, 1);
-
-		/* no stdout / err / file output */
-		ocsd_def_errlog_config_output(C_API_MSGLOGOUT_FLG_NONE, NULL);
-
-		/* set the string CB for the default logger,
-		 * passes strings to perf print logger.
-		 */
-		ocsd_def_errlog_set_strprint_cb(decoder->dcd_tree,
-						(void *)decoder,
-						cs_etm_decoder__print_str_cb);
-
+	/*
+	 * Only log raw frames if --dump operation and hardware is actually
+	 * generating formatted CoreSight trace frames
+	 */
+	if ((d_params->operation == CS_ETM_OPERATION_PRINT) &&
+	    (d_params->formatted == true)) {
 		/* use the built in library printer for the raw frames */
-		ocsd_dt_set_raw_frame_printer(decoder->dcd_tree,
-					      CS_RAW_DEBUG_FLAGS);
+		ret = ocsd_dt_set_raw_frame_printer(decoder->dcd_tree,
+						    CS_RAW_DEBUG_FLAGS);
+		if (ret != 0)
+			return -1;
 	}
-}
-#else
-static void
-cs_etm_decoder__init_raw_frame_logging(
-		struct cs_etm_decoder_params *d_params __maybe_unused,
-		struct cs_etm_decoder *decoder __maybe_unused)
-{
-}
 #endif
+	return 0;
+}
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__do_soft_timestamp(struct cs_etm_queue *etmq,
@@ -738,9 +716,6 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	if (ret != 0)
 		goto err_free_decoder;
 
-	/* init raw frame logging if required */
-	cs_etm_decoder__init_raw_frame_logging(d_params, decoder);
-
 	for (i = 0; i < decoders; i++) {
 		ret = cs_etm_decoder__create_etm_decoder(d_params,
 							 &t_params[i],
-- 
2.43.0


