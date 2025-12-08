Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B71D3B7F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jd2yrStTOWGOmxByUtMp4BdKIyOeVJpeKEcTyld+gI=; b=b42w5ogxdtYmJsCxaP1dcC4K6J
	9TP2Wpu6HkXVjsANVPd9wHvp2qdMf31Oh30OiAVRgCD+/usxiGSD4CLB8tt9XdR5WwnDBcp+6erza
	uRD2kavf185bYGeVS36IR1UZVEyNPAwDFz428BjDXeGZ9YPKfRmAhTDnc2ruKP6RL9DYxy6Dwezg7
	FtqbqO3WerCgR85c0Whyh0SWAQJXL/t+y4rb+Wc8yP9bjF1D4UOZeXeplMalGNTiMXjam2WU6Apg4
	Eyj1M5L/Ua5iWOhLiuHTxfcNE9fu+5IDYAQ58CQYGdf9VT4MfsQTprW1XyGV8ugrMaNg1Fg/Dw+y8
	4nr6CcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9G-0000000DBB5-1Pij;
	Mon, 08 Dec 2025 14:23:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9B-0000000DB6S-3MM2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779a637712so33700225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203808; x=1765808608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jd2yrStTOWGOmxByUtMp4BdKIyOeVJpeKEcTyld+gI=;
        b=KKudF+W5USxvDgLx8aEsGLMlO7Xn0nXnkXNKNhneXa09YITGNyzFQQetZFVMUeNmb+
         GTONFlBwLyB5QvfpBOgnXnCcVKOKIR2z7fY8eVz5++uiPuoXaqHoY2iRaBhg4mpmjM3P
         XDCdpUknxEtDjTFmqlr4M8eCMqh6gjCnZt4elfwKo/e8UCweacGitgNFZ59kh4XYD/Gq
         DKocWBPJxuJPk9Z8n9nu0LcekUj23ly6thSLD2kpKWwutwYLG9u4Y6NAeDo7/gYrAMOi
         IKUcnOhvKdBUpQD+vsfQN4JVxvz653sHZeyd9YIzTsBk5Xmv9mSHxfBuyrhKLBr4XoTn
         h6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203808; x=1765808608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jd2yrStTOWGOmxByUtMp4BdKIyOeVJpeKEcTyld+gI=;
        b=EnRcdreMLro1Q10D8c823ab+/dLimucsMEZLki3q/3dWQeNNozBHJoMjynK7NaYMSR
         J7LZss3/2DxZuYoEnSAeZ+zfqXyN/43/HM/gqAUkHSjr5dKdJg059uR3l2PjED+1D4Mq
         BQa+GC0y66RGkHO4N9PtwowrlpL0Tc2D7BsL66k8CaWrQVl9X/nCi9wprj/R5gT2dPca
         gkvkZd/GHWn95k7hq0lyHbyhbkwt3IQqcnsaCFPHF8boGFC/n0uUB3RwSa0djlU28+vr
         ygVH9r/0O4vdelU82pdeIo9sWxMuSsacPHKEdYFbOZMQ/4mplomToJmt45qq5xtyH0vW
         wZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdCk7xioY4/g1Ykj8w4K329VOVcCtob2u3olAJ9A30Fxj1EtITqnHr+vk69LJUvhNuGT2C10IMHExcAP81387H@lists.infradead.org
X-Gm-Message-State: AOJu0YzV4sxauTjGJjIReXN6yZ4pfbiZTGt6b2gH+eaQxh80lf5+Sse1
	O+8r1Yy3U55LK8hTOjbOsgEIZOQyeNdP7qQLO8r9dF5d1/d4XcnX8XDneQNmxPmA1AQQzaChXLO
	fm2kU
X-Gm-Gg: ASbGncsQgpPiX65T6PL3r/KDmbNWgEOcz7dQxv1PY582yC4w83qyXmCRqsKaGVTlJhX
	FZo9PJVgui327qpDPDu40T4A1WyXcIR/+fMsI2vU2ySBDxwD41EPR/A/gX6bUPS6ZXJus7L4vlq
	nc15syqzXUef6e4Ab5i3IpaPN2GXMpGN1QNKAvzcv2OFYDv1n796pPhafHoEkm/GYXikMaLP1XW
	IAGCjFAWrng8kO5gbD10hmEpVLSvIsshfeLtnw/g6QACkn1FdO8VJrm86TBm1T6N+vaL6RXInin
	d3i/lqx2CsiyZhE19lJST83WUc0GP7eaiz6/bFT1ElF0JDaxPDZMZMCamUj8EdyI3/4B4Vpgg33
	EeEmeunennZQfNGy3HHhNiBjV/q8+zM549kKhlBidMeJGAXay6T9gorC3hRz+Oz5Xp9YRnZqCYT
	Iqd+nwwGyVcOZzerb/fMMg
X-Google-Smtp-Source: AGHT+IFGmwb2kb7IVcMJGI+bmMQWoQ9Xck7BMYDULw0ILtMY20pG9v/l2Oz2SqT1V002Z0ra/fhTlw==
X-Received: by 2002:a05:600c:4ecb:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-47939e4ff58mr81937945e9.34.1765203807943;
        Mon, 08 Dec 2025 06:23:27 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:27 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:11 +0000
Subject: [PATCH v2 08/12] perf cs-etm: Make a helper to find the Coresight
 evsel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-8-4ac0281993b0@linaro.org>
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
In-Reply-To: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_062329_897204_1A7B8CB0 
X-CRM114-Status: GOOD (  16.32  )
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

This pattern occurs a few times and we'll add another one later, so add
a helper function for it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 50 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index ea891d12f8f4..22c6272e8c36 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -302,6 +302,19 @@ static int cs_etm_set_sink_attr(struct perf_pmu *pmu,
 	return 0;
 }
 
+static struct evsel *cs_etm_get_evsel(struct evlist *evlist,
+				      struct perf_pmu *cs_etm_pmu)
+{
+	struct evsel *evsel;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == cs_etm_pmu->type)
+			return evsel;
+	}
+
+	return NULL;
+}
+
 static int cs_etm_recording_options(struct auxtrace_record *itr,
 				    struct evlist *evlist,
 				    struct record_opts *opts)
@@ -476,29 +489,21 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 
 static u64 cs_etm_get_config(struct auxtrace_record *itr)
 {
-	u64 config = 0;
 	struct cs_etm_recording *ptr =
 			container_of(itr, struct cs_etm_recording, itr);
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 	struct evlist *evlist = ptr->evlist;
-	struct evsel *evsel;
+	struct evsel *evsel = cs_etm_get_evsel(evlist, cs_etm_pmu);
 
-	evlist__for_each_entry(evlist, evsel) {
-		if (evsel->core.attr.type == cs_etm_pmu->type) {
-			/*
-			 * Variable perf_event_attr::config is assigned to
-			 * ETMv3/PTM.  The bit fields have been made to match
-			 * the ETMv3.5 ETRMCR register specification.  See the
-			 * PMU_FORMAT_ATTR() declarations in
-			 * drivers/hwtracing/coresight/coresight-perf.c for
-			 * details.
-			 */
-			config = evsel->core.attr.config;
-			break;
-		}
-	}
-
-	return config;
+	/*
+	 * Variable perf_event_attr::config is assigned to
+	 * ETMv3/PTM.  The bit fields have been made to match
+	 * the ETMv3.5 ETRMCR register specification.  See the
+	 * PMU_FORMAT_ATTR() declarations in
+	 * drivers/hwtracing/coresight/coresight-perf.c for
+	 * details.
+	 */
+	return evsel ? evsel->core.attr.config : 0;
 }
 
 #ifndef BIT
@@ -832,12 +837,11 @@ static int cs_etm_snapshot_start(struct auxtrace_record *itr)
 {
 	struct cs_etm_recording *ptr =
 			container_of(itr, struct cs_etm_recording, itr);
-	struct evsel *evsel;
+	struct evsel *evsel = cs_etm_get_evsel(ptr->evlist, ptr->cs_etm_pmu);
+
+	if (evsel)
+		return evsel__disable(evsel);
 
-	evlist__for_each_entry(ptr->evlist, evsel) {
-		if (evsel->core.attr.type == ptr->cs_etm_pmu->type)
-			return evsel__disable(evsel);
-	}
 	return -EINVAL;
 }
 

-- 
2.34.1


