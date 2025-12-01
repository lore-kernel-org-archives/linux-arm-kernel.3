Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7890D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GmRPB0jBQgoThlmGWejjg28u4BOouUoY2C6pZo+51c=; b=dI6cCdk+8VnpNgz1+6wxfmlA9k
	xRsjT63NyJ/IWSnwRZSNSPxhM0GQHwiNts6laB/Bjz/t1Rzy1Pb4Z/3AZ6GjWqJMSKsGibrneQc4z
	T3NX14rFUnPdWz8Cm6g2XuXYbG7kGKeeFZMw/pl0oUTRU13bCyEHJrDI1HsSCmfjFBWAp9ZDD3dZr
	Gyejtr9Eh0vDZK98H8BchOjQjC1s7DsbEOW6H5anp68cICpr/+ACLluc6RoanfC5dbN4qLed8hMXz
	qxfVuPfIlUMFnzBdd6tJ27PDgpDmH8F0u6BnRBEgp66mftiSPIWZb7kNuAVde8vp3Ta5bANnmpTUn
	BmjKKUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yL-00000004I7w-2G8h;
	Mon, 01 Dec 2025 16:41:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yJ-00000004I4D-0grD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso27939635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607313; x=1765212113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GmRPB0jBQgoThlmGWejjg28u4BOouUoY2C6pZo+51c=;
        b=yVsGko2D5GzjDbq7zFFYqFjr9gphb/ZA4KpSe7ShVf7+Gw1WTX9SqYgonXBjIquQmr
         /VFNW1E6MKj9z+HF1CaMTicyr2BkIqm5iuGpnS0DqeuoRMDuWeu3aQY4TOO+RfUL4Xba
         A2S3yucezFmCLWEK8K1ku5eT5lIqhZhzUBx6JHEFrwPgGC79XID6Lx4X2MZTwIDEjc5k
         c5w+44AF3f9SwEsbLh5xrDqnl0WEkR621a+8uU3fRWnJQEpwzHrNjpSkVKpGxLowPWSr
         qkkS/PjlGkhFJcHBJs/kIofJGwIkuEE63Kvc/9LHok6aJUicSSPwj3FD4XPkiEHyFXaj
         L0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607313; x=1765212113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GmRPB0jBQgoThlmGWejjg28u4BOouUoY2C6pZo+51c=;
        b=OWvBlkB5k56WLHZRsiemVcCa7TuSJphgH9bFyE/vFAK6fok4JUZQgzQlDekNjUapIK
         1vZGGeHhetOjQBf7mVUYN8tfBa3gGdi3h5kjfztIgkyseNsvRpOBf2scxkCXctJeebNq
         HxCjp0d+299qWn9AO9le3vNtN2S6yZDHelwOORMl5XxGIdhDS918M7v7lne6KDxSZLVe
         3iVl+1GiZHQM1hvsJwYhGUCQ8OwqIe7OwPWlY61XwwadjvafYwtCZgB/9ArR7gPjgR3G
         1cPbkJuZifOz0snjXCnQGd/190mXkTxMSjglAGJfi8Ux6UR112Bp2VcrZ1s4Ud4do/pp
         I13A==
X-Forwarded-Encrypted: i=1; AJvYcCUN+lOAnoZNXJkg7tW7AYWQyPBAwGS8hl7pJuWZOoapjONSJuXY9OGKsCjkT6E0yx45R1kjXooA9VR1HdvxOZJq@lists.infradead.org
X-Gm-Message-State: AOJu0YzXgFVN78TpReOGyALbX+1hmtmqGZw+B4FpvddT9Y7ygTSxos/J
	TMaq/H6/FDEPQvpQsq7sQNmPlaqIa9tlBiRCHMdaPkPMfUXb+of6AcEb8vdMXVcRldQ=
X-Gm-Gg: ASbGncvzFMQFcFNEJBJTNlPIqo7/keu4nFL29AeiiltgII2I9BRj/0yuhY4955VOCeg
	/i+U/UN/KZcQurqDY0HQQUqyeGGhGVTh5qtEmuuWBpsiSMXa6RUnXxbBeokyaHr6CxOe/jwRiGx
	YR5lHDtR8H9cQ56IZDfG16Ufagsl4KwSAruymsT2NKcuUdMjee2GGXkVJhYCg8+s7CUjXJuJkbV
	c99u05UYyR394xcblwaaJTP/QzfJN/8l+3IrGJHITxutDdu7ttwhtgMop92kdsPqFtfamII6cZ3
	i3nb3xjzrke1a7y/6rDRjv7fw7BRZeRAtgtZk1MvmbTc7aolEEgylzsSHub+uTwOGINsXjCfZEY
	0cPNDstjgg7BzizWHlHmxx6aGWY0iOajuxQUnpUFybhtqrS0FaVnNz+NOX0Oj1jy6MIGe9YTm+m
	yoGhkqVpmf3FSnA1ArSASy
X-Google-Smtp-Source: AGHT+IFPwkzUwt5EiRHYLaJ1366EfwcLCjCSX4vJLGbexn4dFtCnAICQ5GKj987Mcpxp3OuhbV/5PQ==
X-Received: by 2002:a05:600c:4ed2:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-477c0162dd6mr377290195e9.5.1764607313297;
        Mon, 01 Dec 2025 08:41:53 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Dec 2025 16:41:10 +0000
Subject: [PATCH 7/7] perf arm-spe: Don't hard code config attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-james-perf-config-bits-v1-7-22ecbbf8007c@linaro.org>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
In-Reply-To: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
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
X-CRM114-CacheID: sfid-20251201_084155_224595_2A47A4BE 
X-CRM114-Status: GOOD (  12.44  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index d5ec1408d0ae..6c3dc97fde30 100644
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
+	if (!evsel__get_config_val(evsel->pmu, evsel, "pa_enable", &pa_enable_bit))
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
+			if (!evsel__get_config_val(evsel->pmu, evsel, "discard", &discard_bit))
+				discard = !!discard_bit;
 		}
 	}
 

-- 
2.34.1


