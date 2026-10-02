Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F64CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=; b=GyvDg6NqxYsrMUj7DngyyZV07K
	D3i1pgR/DIOvGRogeh4TOFhb1wM2wCOfA9eO90MxASsI/rlljnuYkIvLzrkDFXxfpJxwd8CJi4ji0
	eO8IGMl7iuTGHpwLzQBEslxt3gsHAN/eIS4NfXxYb0gypzcPH9UYlwW7+4WakQTVAnHVVVyPUbRAp
	jYkxvGHnTcKi28AiMuBk652EGbWHECPt7kYU8v3T1hO8n1nZEWE79h6lKc6dJgWoXOE/C9lCmA6aR
	J59PoNEFstU6T7ZHnepGDeNcBxLRp0PadZQHcvqvgE9SAe5n9/WgFNkjddzc91kkprmfIrTJ8Ww9w
	BQafb3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEk-0000000BS7M-13wT;
	Fri, 02 Oct 2026 11:15:34 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbEh-0000000BS5M-1RnD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:15:32 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b09f6bbe8so1060245f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939729; x=1791544529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=;
        b=CbVe4B/wyQo6/DXGTIYr7NaeU8oFgSisvjInXG/S7KmstqpRYFTUNDtTfoLvGgLe6x
         5Jx8m7JohZwOdLmHG1P9MdyCJkQh0C0MjlFjZX2QBChyB2JVNZtulpAhG4qpeoPGXzHj
         R7BXKzq0XTYTsZvyddTSfH/WFHmc3+rKN4Dmyhu+vQl3GJRncVZF8Sx4sAAilpD1Ixe+
         K4+irVBU22KFIEHRg/iCtdSt/ptnJmxvt25fSYEl/BUlQBGVv3eLxMLkxkUUEZeNWydy
         WECJV3koc4rvi/Q295/bIrabXut2BNVVE1CqDTVw93PBecmh0RZu+h7It6xeAHq/bKdx
         Kiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939729; x=1791544529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=;
        b=q+bdOMGtBYb9Rp5pbYl/PA2MzXf2V9tcc5okMEl1DNREMOqyTUX5Ephgue5e+ffBvA
         yiaXeqi5EcltvUATrOE0uGRpPb2MVitWygZF9yXiBLpLc+yvT6QL1E0C6ToIjzCTA5Ax
         3ZQyhRE2tiAduziqHUquB3h+UAa5v8hrlIb0fNziDow3tLI8GArhmhs6EhkSAGHz89ex
         VIVTu6NXPp8hjPxc8yj0DiNl9zBragNFpY58oe+Gw9UUCCXpw5KQ5i7CyV+Z7kLkZbVk
         dHefyT7O6B2qQkcY1Q7gHMMVwe1qH8WmzZFv+5LeOJ/ChfWj9RbdgiEmqZnQLkBT0Jqi
         x1fw==
X-Forwarded-Encrypted: i=1; AKwUvBymgjnvwWDIxXkIoec0GmqiYYnwgP0XNDsi0cfq+HHN86qvPsjq+XWcyuA7YCvqW3cn2bDsz5bHpptoZZvp80vo@lists.infradead.org
X-Gm-Message-State: AFq9FYLxOccPclghakKrhsVBWH9MrP7LUKHnR4Qu50NW115yh48/R9FB
	SxGJ741zyFBEbdzVgP7cxLfNTGEKuqnPr+4iwdGu7hS0e9cH7fNUMyEbbrZ0xw5puF0tC5lIS2V
	sNG/QMnaC4g==
X-Gm-Gg: AYBFou0T9hb+dR2WoUvJfpdVRv2JMrhAsJP2Rd2KM1Aq24Jqsk6n+cwVghBHQvlW/cq
	JbCr8vfpkQshBlwKoca4WDCTcSqSBi56JQhhnwTz01L/wY7ybXW4ABW+jf9pu3x9+YZghfzLz+7
	v+XmXK70P0pX7q8UTLxOyMJ+yNo6bMUK2dIHWAkPpAe88zi/TCU64ef4YT4Lq6Ip3PagBvVMOCk
	ovosGlOcShzeCXe358b+rAr6wKIAWJnMBMxJ7m2GmTB7f2XdhN650IaLIlOtt6sQtSEZlh98ohR
	ZFu0pu9i3lA1NPRkYk8pnE7mPKqPXnn7srv6Mv0BllH9GBHYFg6tQCmrNOTcrSf0GCL/mVCYUTh
	5MprJT/G9fCASWJpx+JQXuhWM4QnXPLJt3iIwUKK1LDHuW/9HJ9XcxI4lPdhs5ryJ4xFrVydG/D
	ZfJqTAWLSAF1WXPhfSBmqguzhDlpdu0iPnPOkmr5uXh0+y0I25zfRdnQimImL9LpQTlEdApHKL+
	GMzNzpD+GnV
X-Received: by 2002:a05:6000:2887:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48b1272b4d3mr4696930f8f.46.1790939729422;
        Fri, 02 Oct 2026 04:15:29 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm4752986f8f.43.2026.10.02.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:15:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:15:12 +0100
Subject: [PATCH v3 2/4] perf cs-etm: Free partially created queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v3-2-1d8b6ef339c8@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_041531_624562_56549258 
X-CRM114-Status: GOOD (  16.20  )
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

cs_etm__create_decoders() can fail half way through and the
err_free_queues label won't free them. Call the full queue free function
here instead. If no decoders were created it's a nop.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 12 ++++++------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  2 +-
 tools/perf/util/cs-etm.c                        | 25 ++++++++++++++++---------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 26940f1f1b0b..b56cf57a68c8 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -741,7 +741,7 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	return decoder;
 
 err_free_decoder:
-	cs_etm_decoder__free(decoder);
+	cs_etm_decoder__zfree(&decoder);
 	return NULL;
 }
 
@@ -793,14 +793,14 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	return ret;
 }
 
-void cs_etm_decoder__free(struct cs_etm_decoder *decoder)
+void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder)
 {
-	if (!decoder)
+	if (!(*decoder))
 		return;
 
-	ocsd_destroy_dcd_tree(decoder->dcd_tree);
-	decoder->dcd_tree = NULL;
-	free(decoder);
+	ocsd_destroy_dcd_tree((*decoder)->dcd_tree);
+	(*decoder)->dcd_tree = NULL;
+	zfree(decoder);
 }
 
 const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder)
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 12c782fa6db2..2a8214f17958 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -96,7 +96,7 @@ cs_etm_decoder__new(int num_cpu,
 		    struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[]);
 
-void cs_etm_decoder__free(struct cs_etm_decoder *decoder);
+void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder);
 
 int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 				      u64 start, u64 end,
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index fda6b6c02e26..78ae8443ac96 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1002,7 +1002,7 @@ static void cs_etm__free_queue(void *priv)
 	if (!etmq)
 		return;
 
-	cs_etm_decoder__free(etmq->decoder);
+	cs_etm_decoder__zfree(&etmq->decoder);
 	cs_etm__free_traceid_queues(etmq);
 
 	if (etmq->own_traceid_list) {
@@ -1017,13 +1017,10 @@ static void cs_etm__free_queue(void *priv)
 	free(etmq);
 }
 
-static void cs_etm__free_events(struct perf_session *session)
+static void cs_etm__free_queues(struct cs_etm_auxtrace *etm)
 {
 	unsigned int i;
-	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
-						   struct cs_etm_auxtrace,
-						   auxtrace);
-	struct auxtrace_queues *queues = &aux->queues;
+	struct auxtrace_queues *queues = &etm->queues;
 
 	for (i = 0; i < queues->nr_queues; i++) {
 		cs_etm__free_queue(queues->queue_array[i].priv);
@@ -1033,13 +1030,23 @@ static void cs_etm__free_events(struct perf_session *session)
 	auxtrace_queues__free(queues);
 }
 
+static void cs_etm__free_events(struct perf_session *session)
+{
+	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
+
+	cs_etm__free_queues(aux);
+}
+
 static void cs_etm__free(struct perf_session *session)
 {
 	int i;
 	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	cs_etm__free_events(session);
+
+	cs_etm__free_queues(aux);
 	session->auxtrace = NULL;
 
 	for (i = 0; i < aux->num_cpu; i++)
@@ -3476,7 +3483,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 	return 0;
 
 out_free_decoder:
-	cs_etm_decoder__free(etmq->decoder);
+	cs_etm_decoder__zfree(&etmq->decoder);
 out_free:
 	zfree(&t_params);
 	return -EINVAL;
@@ -3758,7 +3765,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	return 0;
 
 err_free_queues:
-	auxtrace_queues__free(&etm->queues);
+	cs_etm__free_queues(etm);
 	session->auxtrace = NULL;
 err_free_etm:
 	zfree(&etm);

-- 
2.43.0


