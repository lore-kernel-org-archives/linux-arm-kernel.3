Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367FBD3B7F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GmRPB0jBQgoThlmGWejjg28u4BOouUoY2C6pZo+51c=; b=ONBCg29VNiPYW2VSD/lI/M5NiI
	JyfCigO9DcXemMflmExlD0FwCD2WtpFN6ajgUaBqh+UtQa6NRqHwId7i/smmE7OhnqdBvfIfCASEB
	a7OR0KgHBsS8Qjjgf46OfCJZdC+6eJlMhIpzs1D0PBUd+QQXh6CUJZ2dQegZel8TjQCnxcYuUhXED
	x2R325qKuzhwP4akCauPLQKzRI/5OlNPxORrfAllTFGwFInyUK2tRWQgBATRW5KQK4i0i5+PoZlMI
	vkIti8NGZV40OOXgWIRNEl0zFr3/pQ+BlRF1m/sT3Lan5mpN9EjncpOQPY5hkqzBDNgB2BG5Xoioa
	nXENkC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9M-0000000DBIh-4Anw;
	Mon, 08 Dec 2025 14:23:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9J-0000000DBDg-1PO4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47755de027eso32302585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203816; x=1765808616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GmRPB0jBQgoThlmGWejjg28u4BOouUoY2C6pZo+51c=;
        b=S5WVJdcyAfXmTg9Li6DYZXR55LvmGUyApVWxCNMMPcNJpPEv8ODWlosAjZEdwdbxa4
         RwB7g4m/MRP5Lv+PMy/VRyNHYm0nOYwH9NYonkEgt6vxfg/7LGwDWn5sVEq458eSyh0u
         Sf+z2GD2khcfBzGoeq+p/qdNpoGrVEVLxUVgxkeFZbW3Z7LXqVmBmsvI2fUP9HMwct2t
         MBec8LNujAUhjkh1W6iE9xww51lN71g3y9gUQoF5qA68RPaFXBg+P30AcrNMnwrDA7Y2
         L8882k9dd1uE7nXnfXYB0Q4nPaai3u19cvZ2deTyTtd7lzibJBbe9frASYdM/j+BGBNa
         m5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203816; x=1765808616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GmRPB0jBQgoThlmGWejjg28u4BOouUoY2C6pZo+51c=;
        b=ZQOrntf7j47evsO1PQ8e3mQxqd3BgnB1CZM8idCiUaGBedslTrc6GCpsRKSt57XG/q
         4ssErh39IS0kjNmNQNuqLhlGfaJkQaif+HOmGylqkfJMS1cHFP9QaYo8D3WwkHHaZWw/
         Y89ZT7uYZ711SXjHSaKste5SEsV2D1qgFglF9mTitb68cJTkRT1rwZTC5kQV9YR4/X84
         MXgKwK1s/Kt2tlH9oEdWHhc8qs6M4tUDIKp0S4lLHsl/TlQL2WvE0bG+X0hBRfFciEka
         oEJR8Qn0w+uQElK8yEJdV83D5WEIZTciFHfviO+wrFpGQfWqAsxroipVoPRS5lU3+aUm
         5Gow==
X-Forwarded-Encrypted: i=1; AJvYcCWD2X4GF2cKylSPx17B9lSWDGXrcK0WSw8iVSDTL0VomR5sqHcjxkfSQMfILcxGzza1hfCsrmfHIR3UVJLrIocc@lists.infradead.org
X-Gm-Message-State: AOJu0YxCXUMdnWil25IQwoM4NI7MwsICHpJWJVKEe0k+6r3rYedjwpcG
	truilpF1EQa5dvgxlyAscv813aVVM3XBDVVWNlr4e50KyB8cPwlICvfgkd3ayRYZjLDvN4aHxbZ
	hJpeY
X-Gm-Gg: ASbGncvvWGPXj/PYEaRsHxzPFoClSbLm74cl37gwFal+vEqFEF+YpgPRUmxmDzPsQoy
	qrkIht70YWlj5Zt6okwDSAFCUNSzIpiKzFZPDJdi+7BQCyhy8ggsO9wMQvwtYxzDqVk6cSdw4T8
	R5GJPuIZcOKKoJCEGp3sicI5ZEEwi4pG08pdXXRCFKdcmX3V6PwOi2lXFKp+gJIZYIR44fV6TFs
	yMzPvmAsBEg9wIkKcrw7yYSsGbhDVrD9pFVzj/F9L+FA2LSEBuqUFrvKv0Loo1m7aHDhbnsw0mE
	0NWuWdextZlJbgQk69gH2grPlDJLfHQeKFxCyNJzxu7VsSr40lIuG77gK+bkZjrYsI7AKFWQHp8
	GHTzG0cZdxoFVMpDb4KVBUQpuCCVRozwQboAOzttN9vEeT6TdncB2y94XCvw/6szQiZwt0AJHnj
	27XfPpq7RGjPbaRggJaq4t
X-Google-Smtp-Source: AGHT+IFoZPHDAM2lHyoM1YfjpO1gRYPlnwmwM67jG630YI+YhFcyltm9tk5Ti0SdAOyhTdmrTISiWQ==
X-Received: by 2002:a05:600c:1715:b0:479:3a87:2093 with SMTP id 5b1f17b1804b1-4793a8720eamr49221135e9.37.1765203815511;
        Mon, 08 Dec 2025 06:23:35 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:35 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:15 +0000
Subject: [PATCH v2 12/12] perf arm-spe: Don't hard code config attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-12-4ac0281993b0@linaro.org>
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
X-CRM114-CacheID: sfid-20251208_062337_398621_32FBE899 
X-CRM114-Status: GOOD (  12.27  )
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


