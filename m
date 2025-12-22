Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0978DE677E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jQ8W5nzp73oSPJlX5Jug7ze2sl2RQ53Mf0/SiitI2Y=; b=bTAcmVj2h+TwYrWIp5ijsHlSlE
	myDBQWXks0hhTGnL0iSbTglJnvhReO6zC6w1Vp9P4iowSLEOuXf5+eZJjYBaPfEs9Aji30OEDjtwb
	M7FS8PFPkcl/4bv3lZHySE6va7bXThgALh0NX1d8fSnM3uv5gBb+EDrleLukIMkYyAMz7k+OF5+aP
	JnMkqy9rmnVHyPSeez+axnj20UsUA1Tb1nKNrLHvkcTBfkR5d70r198koSNLqkGsTWnW8WwL8/Eqw
	px0nvKJ1FzOMuAxkRoI+Z1rJoWcEHXIT//KD4cIuyHKA70NuCZE7F2ubUnbwWZ7zLultxLcsIQTD5
	slrnBSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcy-0000000Du1A-3RZm;
	Mon, 22 Dec 2025 15:15:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcm-0000000DtoX-0aIw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:15:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so39287605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416502; x=1767021302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jQ8W5nzp73oSPJlX5Jug7ze2sl2RQ53Mf0/SiitI2Y=;
        b=CW8ev/zjsItgImf1TFTQqOnItVq/Ul2EsdygI3BntGJ78b7HERl7wJu/neGOQqje2H
         zGJG8wLpIsvgnhw7L+k1mlyzVbxIwQYekFSaK0q8wqh2UFUPFdjV2glMPGfGBGU+BtPB
         w2Uaze2Ix1c/McnnDCh1bFRuklMerIW03x97JVyNf/WqhfYcyjfPkqkdOwDLOD72oKOs
         fq6AnTeYlMK8Lc1bUY98jdKA7TXbaVrovdyOi4Mfmg6LevjAnNnRnwwLHflE2zKl0wNa
         YZsrH4FnCKHcvy0vnzqIVEbz/597xgkKnHsnkP7oeX83HkMrpmwhjNI1iq9L4fnwu9R2
         qGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416502; x=1767021302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2jQ8W5nzp73oSPJlX5Jug7ze2sl2RQ53Mf0/SiitI2Y=;
        b=R1Wh2BeI4o9QHqjRI3Bw/9xuF/V33t/NZgX2NGDXWVMSTMIP6JfrKPi45z76wPvd0n
         ZYOt/YP+kalXMRKyx6SfaUfmYKycu7+Uk4/HdYwU1dKb6IcmClcYQUBpXYraDQqKCTm1
         FXjqPTMBw/UPVwLt3Sr/vXLVKBJlFr5saoTendro8OEYTy+S7tMmRihMDu6L6qHPqZrY
         jZ8qF7grb7PIraGG30iKrMzs7J/c25JjQcDAxGmwED8xA6kTq9uzXjjZ7KxWmJTZVcAs
         8r/KU/1f2UTeJfSsJETVSOQHtP3fJrfEzeoy/DWcXa54KsfFaulMn7RtTUd9WnAjhLeL
         aqmw==
X-Forwarded-Encrypted: i=1; AJvYcCXIWLwOOxXJXx4aJctrZF+NeblDChD/wvRaVdkp/1tL9V89oAKCQFqzZQ76fPg/2i9zDFN1TcoassLfLDQlSR+6@lists.infradead.org
X-Gm-Message-State: AOJu0YyQuN/TXeuQ9TJ/AeRObRWoWHIBzLyo/4aH+hqy+mVDPHT69Qiq
	DgvU6bw0r3NyLudB3hLzx5aDDmoOe+JqQYR1wugIdeJFFSt6FmiC/T73yFq+aYhOFsM=
X-Gm-Gg: AY/fxX56sajTrWv+W1Ddaaujyq8YfoPlJ/ehSt5YXU4vQYBmQ+MrGB2KQGSL7RjuSLD
	a5sFFfVU8GIKiRn2ntBYYFGX3TLNhJbOx7arQsu3g9gqndf3kmdFzUowxtwZVVjtpM4D+BcqU4F
	SDioog0TFWTFbowTMjhIse07tON5UqcjEbDdz7RDb7Xo6c1N2Ani6IyASqzc/HunIyrCzGeN36A
	cW6TwptEqzcpBMeb41A4SL7lYW8bklGeP/BOeEbacCU0e5WgLBNu75XdLSWB0ppAt0B57/AYl9A
	G/4UYcfFNPFCjQHYNhPFbdGqvf8jmHTruoE3Bvb9ft5+p53R1J+AaqE6cXhERUCVjIYyFkmmPdN
	YzFMO5Ept412+9JnGNjrJANDd1kaJ3e4lWvjoNHJrAfPPEDaVuhWFPcYI9nYqAPue7E+RdJuOuW
	8CDiF6KTb+lKZWVnkaeOqR
X-Google-Smtp-Source: AGHT+IGVW2AQoFnt+YQeUkk1+45K7c9zrckQIjMupb2A7/EyJF6AN1n+ruma4tqVGKfvSqChhpvFvg==
X-Received: by 2002:a05:6000:22c9:b0:430:f72e:c998 with SMTP id ffacd0b85a97d-4324e51081bmr14459005f8f.51.1766416502023;
        Mon, 22 Dec 2025 07:15:02 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:15:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:39 +0000
Subject: [PATCH v4 14/14] perf arm-spe: Don't hard code config attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-14-0608438186fc@linaro.org>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_071504_216242_9220CB11 
X-CRM114-Status: GOOD (  12.36  )
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

Use the config attribute that's published by the driver instead of
hard coding "attr.config".

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 51014f8bff97..17ced7bbbdda 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -256,7 +256,7 @@ static __u64 arm_spe_pmu__sample_period(const struct perf_pmu *arm_spe_pmu)
 
 static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
 {
-	u64 bit;
+	u64 pa_enable_bit;
 
 	evsel->core.attr.freq = 0;
 	evsel->core.attr.sample_period = arm_spe_pmu__sample_period(evsel->pmu);
@@ -288,9 +288,10 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
 	 * inform that the resulting output's SPE samples contain physical addresses
 	 * where applicable.
 	 */
-	bit = perf_pmu__format_bits(evsel->pmu, "pa_enable");
-	if (evsel->core.attr.config & bit)
-		evsel__set_sample_bit(evsel, PHYS_ADDR);
+
+	if (!evsel__get_config_val(evsel, "pa_enable", &pa_enable_bit))
+		if (pa_enable_bit)
+			evsel__set_sample_bit(evsel, PHYS_ADDR);
 }
 
 static int arm_spe_setup_aux_buffer(struct record_opts *opts)
@@ -397,6 +398,7 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
 	bool discard = false;
 	int err;
+	u64 discard_bit;
 
 	sper->evlist = evlist;
 
@@ -425,9 +427,8 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 	evlist__for_each_entry_safe(evlist, tmp, evsel) {
 		if (evsel__is_aux_event(evsel)) {
 			arm_spe_setup_evsel(evsel, cpus);
-			if (evsel->core.attr.config &
-			    perf_pmu__format_bits(evsel->pmu, "discard"))
-				discard = true;
+			if (!evsel__get_config_val(evsel, "discard", &discard_bit))
+				discard = !!discard_bit;
 		}
 	}
 

-- 
2.34.1


