Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5D5CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=; b=uQhjOhbbd2+p11awYmtiP9PU/w
	ysNj+D+OOJxakWZDNfB6EPwzxqYMxh6qbKFNqf+a4lY/X6xWKolGKgYeUI6nR8Vy4Mo3Hi1QamtWt
	9ojjiCn81DP9wHl9l6mffYOn3TFA+qtYKjhbvQik1P6liJ8LY94hcntI92ulvI0LsiJ0MbfHg+9BG
	W+L0Sbhz88Fat57LMreSQ5ekkQ6SFPzQWAYqbICXjrzXJGg2QDxr4fkMhqkkphC/jf3Qt2QkNyJO2
	5NG9BJ+yR1UnDQSMNoz/+GcJ8+gJ1BxK8Vz+v7XyCuwNSqGc1I0LkFCZC+W999dXo0qnDAJkdMgaz
	94OfyIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3x-0000000BQNu-1cA1;
	Fri, 02 Oct 2026 11:04:25 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3u-0000000BQLk-2DQb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:04:23 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so42496605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939061; x=1791543861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=XBQwz8a4X0VkXxtvLf2Jx7gEJ1Yo0i+ELKOo2mZOYxyfHf8GPqTzCVr2z/RaoMRr33
         x9HH6w1ghWF5MwX6uL08BVehg04UrwcKZngbh89DAeH4RrS5mGrkbcxOmHWUr3dl5byP
         KsmeUst0xIAMm5qLvZiDqos1CcoAKA6Y2IHA/YIMYmj5Gzm3hCrhw6Iv/dzH33+9mEn3
         gWc/UHntQfUEjZfrWhB50GB52Lyiaf8f9kpUHF4azguMU4vxNYQ+gQ0RYUu/WNzY6aAZ
         TNFQaxRojF+ccxcLZw52CM2BqJC18YpJDKNfUFdRZ6Gxjdj+r3jE71cCp+Hry4uGVP5q
         kfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939061; x=1791543861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=0KCz24vU3rvPrDJZYAMF/ivd3H5cLdDpO4oTsV4e1BOrLW9Cg5WDOAQ0VwqGf8J5De
         jwE+CxXe1jbfy06MqBdmTl2PPbuWNxxCRkWkieXT50nzzYflZ3SFncFKRQIEvnLVk42M
         CgbUugMc8NjkD5usd3nw23yhGN3xlg7F1lQyHsDzlWMtl4dCtzVMiayjmFecmuj2pPsI
         DErmftNFkZKX3B0OxzA5z+PnIECLKuYw4i+hoHWlQggJ11pQml/HnG+klHVljh6s3/v3
         JPYJZirp2uTzDLMqONx3LfBZxl++bt1h9iwCEt47SMMc5uCrJcwSPa3T7ke0Sgiq3OZo
         k71w==
X-Forwarded-Encrypted: i=1; AKwUvBw7JLjkYUFOn2cd54d5rASfcnAxZ2Jp0JaumkQAZfZfaEczq3r1tM7lQr13TUaeRtsQzc0JlIyG0EpLVpRS3Tzy@lists.infradead.org
X-Gm-Message-State: AFuF++n9KA6HVpKmGczb5gKVWLFhPOaNo9PLj3NRBFJMaUjPTSll3j7G
	HsZhpMWuuTkB7KJmzk6CLhhiVyoTT43gVC3YRJC7ocUOkWzM0XQimng/AyY+FJpmhzs=
X-Gm-Gg: AYBFou3XzWwBerfK7qdlIZ9Db7MT539JqwraK/hjkXNMK4QNUvH/gf7ijTZKZVfsqNA
	uTMlO4IeMwpIrglTOdPw41iQxqy7A7B4tkUBEjxDFC3xzN6wEDHwPs5VS8rGHLJRuv3K6Is+lJY
	F5Q0ufYYwmz+YhilcYFZ8pFPK4byuvjGnDelhRDWzCryG6MsG+dSm0vG/UwTqtI9DtPvzq35ALM
	4CM3o9jkxkY+JQ+zH2DVOnCcRXuAsDzPIycuVuI/jZFEFYd2eDzRKUxf9cguGgPKlOjlneV+6s1
	XxGg+fpruxVkTH2yzDzowmwgN0t/jbpsIGlzvy1Bd5+2C4Xc44y7djZ3KpcvbwuEbJzFWYML5wv
	eMGfbwuN9hIyg0p+4+62AV9E0dnk7XGkVl2VT88O3PgvcsXQhqF/eM8nkEyF3COBAqNgxM5GU9D
	E0hRdynTP8HlgeIS8E0dPY5AwoH7gOdxc00rqD4sCibFFipAOEk3hR6FHFCOnOAqH24Q6UlFCgB
	Q==
X-Received: by 2002:a05:600c:350a:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a02769cf7fmr40489485e9.22.1790939060892;
        Fri, 02 Oct 2026 04:04:20 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75669465e9.9.2026.10.02.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:04:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:03:53 +0100
Subject: [PATCH v2 1/4] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v2-1-7a194aa61173@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
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
X-CRM114-CacheID: sfid-20261002_040422_600876_B2410077 
X-CRM114-Status: GOOD (  16.73  )
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

In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
fallback, formatted queues will write their HW_IDs to unformatted
queues. This will result in an assert because of multiple decoders on an
unformatted queue.

Fix it by not inserting trace ID nodes on other unformatted queues. This
isn't an issue for v0.1 HW_IDs because they aren't global so will only
add to their own queue.

Fixes: 19c3e4db38c5 ("perf: cs-etm: Create decoders based on the trace ID mappings")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 2d1ab34f7b6b..fda6b6c02e26 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -309,27 +309,27 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 {
 	struct cs_etm_queue *etmq;
 
-	/*
-	 * If the queue is unformatted then only save one mapping in the
-	 * queue associated with that CPU so only one decoder is made.
-	 */
 	etmq = cs_etm__get_queue(etm, cpu_metadata[CS_ETM_CPU]);
 	if (!etmq)
 		return -EINVAL;
 
+	/*
+	 * If the queue is unformatted then only save one mapping in the
+	 * queue associated with that CPU so only one decoder is made.
+	 */
 	if (etmq->format == UNFORMATTED)
 		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
 						    cpu_metadata);
 
 	/*
 	 * Otherwise, version 0 trace IDs are global so save them into every
-	 * queue.
+	 * formatted queue.
 	 */
 	for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
 		int ret;
 
 		etmq = etm->queues.queue_array[i].priv;
-		if (!etmq)
+		if (!etmq || etmq->format == UNFORMATTED)
 			continue;
 
 		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,

-- 
2.43.0


