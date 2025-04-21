Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A013C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppEhzGTJ1895vVIrd/yxk1GkqcslORwV/iBHx5nBBw0=; b=V4K3okAQ0m5fbVaSPc1LzzjqYx
	1Qz1pkWHWTSfo02dYNQ4uYec9d06XzfCDWKn+4xPDtarLICeah9wYF5ifdwYzkQWXq9XXi4I/N8iN
	SQFqI/Obx1B25bQv8eETD8P2cQIgAM+uAcPaWB70vdimsTod4xjoflRPq7+Uj/JWjx3jorCpGqn9Q
	1hVXEZ4oqP1d9Gl/NEFGyeijiB0cp4zSFEUXVtQ8YfphOjHy4DDzXCGI2/GFiSnv8BjKDBObLF+hU
	twFovq25xaxvzK3/VIdHistSjAURgRdNCztrOjswUxzLrQDgQTXixGdCg/mjHGwIGAx24fwuMDPtc
	pBqPG9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zL8-00000005IPZ-3z5A;
	Mon, 21 Apr 2025 22:10:10 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6z9o-00000005GAc-1ZMq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:58:29 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-af91ea9e884so2197397a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 14:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745272707; x=1745877507; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppEhzGTJ1895vVIrd/yxk1GkqcslORwV/iBHx5nBBw0=;
        b=lAFW5HvR+NId5BhLwXyz9bve716q3KBKnPpj3xVN11LGhPcjCDWUyMmGaAwdkorzsn
         D+Lg0Op0x5OmLCpPsV8nvUiVAQCJHq/XVtwaQjBKGH1+qF/kG4HCvZjB2a/PB1C6Owme
         oX2NBpwUFehriN3X1FYm3xTjV2jIOCM1tkRiR2LCyB4F3yV3RaZ512QNeBMRQnElSNZv
         XlUMKI7rJnk5+HS/NKmysuZExhrCas+SVu2z1wvPhEZ4xvZmy1j0gMA/F1hzqymBqlTD
         IClS0HACzQTZPl7wMUnO1rPdhNh/es4PTyoFqZsvMaleYMXV/Fogi3vTJuVzNjN8qhxT
         70Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272707; x=1745877507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppEhzGTJ1895vVIrd/yxk1GkqcslORwV/iBHx5nBBw0=;
        b=pxQ57C12sXr55C4my+uW7uW7HkBIAlz7086KTNhtGDZ5Uai+GYs6i5b/mb3jwRaIxv
         JBfSie5+6BpPb4zXpnLrw7EElWlVizX0/U986a4n6qW2B2iXv1Hz+Fgmd9Slv2pHFCUw
         hFXHSi/U5uBheK8ePrDIs/+cedz2xEaRvhui+Hc1AvKUGLLDb/FIsiRdyApkWInKq3Se
         vubDAEOhwtaEa+AvzL1GGpeut+kU3nSsJtmoMwN0x8qRxbhwC5hsu6abpEdYIeOgCB+e
         4wUtjmpIgJVJa4W1ZePKNDLCLUmQwPTb2zoAS/HerxnDXt9dgcSL17SIpdHkjUI9LNiR
         4+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVtoeUnC2wtcvzQB0CQ/2MCMnRl4VPtuQHIbHhKyq9p5Wmz6/zZ46DNtr3oD/9le9WwF9IIUfPcjglzaWnoUswG@lists.infradead.org
X-Gm-Message-State: AOJu0YwUfQ2kTEyhgjKcxrZrYvTZf5viTUJob71MSlEF0j4ROjhM+udW
	SivREutElqAPFIh/qYmQFoNBhEdLdUDGoWXlHfcG28LC9qZKWFmNyYu4r4krGdJS884kzydflga
	r
X-Google-Smtp-Source: AGHT+IEUjbbR7dOsTbPRk4tKnHc0lJD5Lp9uelQGasXEqv+mLjMNCHnAVBHz9WrQmMThkR2ExG51pC8JdTg=
X-Received: from pjbnb11.prod.google.com ([2002:a17:90b:35cb:b0:2fc:201d:6026])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5826:b0:2fe:93be:7c9d
 with SMTP id 98e67ed59e1d1-3087c2ca5a2mr18673508a91.7.1745272707042; Mon, 21
 Apr 2025 14:58:27 -0700 (PDT)
Date: Mon, 21 Apr 2025 14:58:17 -0700
In-Reply-To: <20250421215818.3800081-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250421215818.3800081-2-yabinc@google.com>
Subject: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU capability
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_145828_409432_C398744C 
X-CRM114-Status: GOOD (  14.04  )
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

For PMUs like ARM ETM/ETE, contiguous AUX buffers are unnecessary
and increase memory fragmentation.

This patch introduces PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES, allowing
PMUs to request non-contiguous pages for their AUX buffers.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 include/linux/perf_event.h  | 1 +
 kernel/events/ring_buffer.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0069ba6866a4..26ca35d6a9f2 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -301,6 +301,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
 #define PERF_PMU_CAP_AUX_PAUSE			0x0200
+#define PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES	0x0400
 
 /**
  * pmu::scope
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 5130b119d0ae..87f42f4e8edc 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -710,6 +710,12 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 		max_order = ilog2(nr_pages);
 		watermark = 0;
 	}
+	/*
+	 * When the PMU doesn't prefer contiguous AUX buffer pages, favor
+	 * low-order allocations to reduce memory fragmentation.
+	 */
+	if (event->pmu->capabilities & PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES)
+		max_order = 0;
 
 	/*
 	 * kcalloc_node() is unable to allocate buffer if the size is larger
-- 
2.49.0.805.g082f7c87e0-goog


