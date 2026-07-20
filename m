Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603DC44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=10GckTjhfZGgdyb4+SoDUN2U0nJyezLnFpIIYVOOPAc=; b=yqQA/p0t9KJXH281aloF0/cA21
	BhMXyYf3941dEFl00gpeG7+pyhkqB+/EMbckfi70OF8z/GioUZ0lu2T5dIwwwXYebasNO86hxyZX/
	nTvOgFps5Y/vOjelXQahWgLNmJr5ob57U5ipIBbEb4ugRY31hSR7rHH4QGJs4WhOcZyirZ5Dl9zsx
	Osa2k023c8S8G8A1RzxovtCzIyhFYADSxNv+C2MKW5brgv1UqrxJ0VC54NmHDg/CYcvzbk/wqwBUz
	fW54bDT714t1bTt4ye/39cTaFMHaxxiqc/JYdgXTRAEBcHtRSK+wvAfCt/4tw8215HY09H7epyJ9y
	PGe34hPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkof-00000006PSP-1JwY;
	Mon, 20 Jul 2026 10:01:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkod-00000006PRM-0NLN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:01:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABC302B;
	Mon, 20 Jul 2026 03:01:31 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 665193F86F;
	Mon, 20 Jul 2026 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784541695; bh=HvH60az2pgbHIpr+00e5DtDk22sQ4vHKOnqPd/nOpz0=;
	h=From:Date:Subject:To:Cc:From;
	b=USzRiFifRaM1egoAR25PE6nkkvG/vL0F4AoCyTalJzWFsyjlhkjfYuMogevZ+GW4k
	 VL7r3jjtXSFzMG/GMCuYDpIR1nODL3AV7mYe5I6LHgx4snMReu6XYdIIU+e4EBbKvi
	 njLcrRjiplmJrv48wa/td74yukWe6CNsVCydGywE=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 20 Jul 2026 11:01:21 +0100
Subject: [PATCH] perf cs-etm: Avoid truncating AUX buffer sizes to int
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-perf_cs_etm_fix_big_size-v1-1-97ded24636b1@arm.com>
X-B4-Tracking: v=1; b=H4sIAPDxXWoC/x2MwQqDMBAFf0X23EAMNCn+SpHFxhe7B61ki4iSf
 zd4HIaZkxRZoNQ1J2VsovJbKrSPhuJ3WCYYGSuTs87b4KxZkRNHZfxnTrLzRyZWOWAQn96+UvB
 hTFTzNaP6e/3uS7kAbyJ1zGoAAAA=
X-Change-ID: 20260720-perf_cs_etm_fix_big_size-ec5608f767df
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Suyash Mahar <smahar@meta.com>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784541694; l=3060;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HvH60az2pgbHIpr+00e5DtDk22sQ4vHKOnqPd/nOpz0=;
 b=EnprNlHgaiV8R5vwtyiaanocyQCXT4KPvm+chm9kn032dyPaIvytisSsqcb3dx6lzIeYbZNw+
 wkUGCFRpZusC1HQ2RQ2csrA2ZjJr7WSFPq1zcG9LPH4NpBY9Pv2RtAG
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030139_223308_A4FF93CB 
X-CRM114-Status: GOOD (  16.89  )
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

cs_etm__get_trace() returns an int, but it used to return etmq->buf_len
on success. That value comes from auxtrace_buffer::size, which is a
size_t. For a large AUX trace block, returning the byte count through an
int can overflow and make a valid buffer look like a negative error.

The callers do not need the actual byte count from cs_etm__get_trace().
The buffer length is already stored in the etmq->buf_len. The callers
only need to distinguish three states:

  < 0: error
  = 0: no more AUX buffers
  > 0: data is available

Make cs_etm__get_trace() return 0 for all non-error cases and use
etmq->buf_len to indicate whether a new buffer was found. Then make
cs_etm__get_data_block() return 1 whenever data is available, instead of
returning the buffer length.

Also refactor cs_etm__get_data_block() to make its return value
semantics clearer.

Reported-by: Suyash Mahar <smahar@meta.com>
Fixes: 8224531cf5a1 ("perf cs-etm: Modularize auxtrace_buffer fetch function")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 46 ++++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 95e3ec1171acc8442d8539a72a26a1a5a53a2f37..114b3cd2da495e54e78df8fbd707898312f95079 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1467,8 +1467,7 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 	etmq->buf_used = 0;
 	etmq->buf_len = aux_buffer->size;
 	etmq->buf = aux_buffer->data;
-
-	return etmq->buf_len;
+	return 0;
 }
 
 /*
@@ -2151,26 +2150,33 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 {
 	int ret;
 
-	if (!etmq->buf_len) {
-		ret = cs_etm__get_trace(etmq);
-		if (ret <= 0)
-			return ret;
-		/*
-		 * We cannot assume consecutive blocks in the data file
-		 * are contiguous, reset the decoder to force re-sync.
-		 */
-		ret = cs_etm_decoder__reset(etmq->decoder);
-		if (ret)
-			return ret;
+	/* The current block is not finished */
+	if (etmq->buf_len)
+		return 1;
 
-		/*
-		 * Since the decoder is reset, this causes a global trace
-		 * discontinuity. Flush all thread stacks.
-		 */
-		cs_etm__flush_all_stack(etmq);
-	}
+	ret = cs_etm__get_trace(etmq);
+	if (ret < 0)
+		return ret;
+
+	/* No more buffer to read */
+	if (!etmq->buf_len)
+		return 0;
+
+	/*
+	 * We cannot assume consecutive blocks in the data file
+	 * are contiguous, reset the decoder to force re-sync.
+	 */
+	ret = cs_etm_decoder__reset(etmq->decoder);
+	if (ret)
+		return ret;
+
+	/*
+	 * Since the decoder is reset, this causes a global trace
+	 * discontinuity. Flush all thread stacks.
+	 */
+	cs_etm__flush_all_stack(etmq);
 
-	return etmq->buf_len;
+	return 1;
 }
 
 static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,

---
base-commit: e01c7bd5b1eece254bcbf282db066b12c4815d21
change-id: 20260720-perf_cs_etm_fix_big_size-ec5608f767df

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


