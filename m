Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB490D37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jQ8W5nzp73oSPJlX5Jug7ze2sl2RQ53Mf0/SiitI2Y=; b=ZIK3sTTOoFbCyt3tFPKYY8ZxO+
	Uu1AfDcEhKY8O195JlZmurWfRJZ7mLSq3XrbkxhPg2ITe02xWs2/wxeagqzxSsQBHprbZbrcvN+lg
	qwzB44Ct1QEMHh6XzV0/W/WcjGQK0UHElJbqaFWBPEzV6fvmWPO9Fo1m2zx92u2y6RqvaQaGV8qSY
	pWSvXs8FZw38HLOZC7H1h5tPu99vAcQQVNBOYxr1OBvUYSzijH1IBEc4xJXldGfddhF9TKvDAXMzt
	6EwpG6TC+NC/5DfvdXYtWV3mZoL3tS1Wih5QXVYXE6orRQne0PAwpTJ1sU2Sg+lvF12qHK77A0Mzp
	EO9FyYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3GC-00000009oZM-1Im8;
	Wed, 14 Jan 2026 15:58:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fs-00000009oDY-4Bp3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so8095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406275; x=1769011075; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jQ8W5nzp73oSPJlX5Jug7ze2sl2RQ53Mf0/SiitI2Y=;
        b=WIR4uf7w54mwvshtGi7JK3Bq8XsSKRqQ/bD7ll1uGDmJDmvG/ldpFnm3J70VPg3wu3
         DZABLKW6QaB7pHiPGxzE67OBexYH/H/XdE/xUaIwDfPvvlAdHLd+z6DWw7JkLVMtttw0
         Nh56xHxc1JHE0WTHaSVIveqvdJD52uDVnH8vh5he1rROBhDB5PPOWTnXMoPymGfG3lCM
         o84XpycLJrTToUmgqPnpTwXYccAYi97fBdaDq3uPNnBX8Mi8uH5fe5SzoGZX4UId5Sgf
         KkYIV6AI1ZJedcWjLbXPvHbMFdDr+xMC+kaM5pfuCIY/VP8QmDf6minEHT4/VLdLhBY9
         9gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406275; x=1769011075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2jQ8W5nzp73oSPJlX5Jug7ze2sl2RQ53Mf0/SiitI2Y=;
        b=fEJVAxS6F7Loxi5FHXvPLJsIsIqmhsSVP5omrqJqLNhmrDgeHRtQesVfVjKdy6JQHS
         gmBOTwE+FCPmxGD3kvVZhGV3c/uMgJYx6xYZ8UxM6JYzfvGH9cVOYM87t7UJXdOjZwCh
         ZNHQcUtR0YpX2l99dpnnr7NIpQD0V+VaFyCYBaErn+Q2Z8Av8TWKYWlcDaAIt6zSZeV7
         BCHHy3rGGb/94b+Gu3uKwE+kBLA0ZPy54M/RYjSazREXXyWbjkT2nv03M95UCVWgrHGJ
         gk57SpwJBrxOtgN3smBiCu8q+kZFnczIUgtw7oSJawoPZb2TzxlZxLpWN4y7ic07VjKL
         XdnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhjP7nlkJbhmE3r9sBdC+yHIhokrgO2WwVHhiYxaZVU2ciAiYoca7FipgSZmO6JevXlpW9B/tBvi4OB7UM45zO@lists.infradead.org
X-Gm-Message-State: AOJu0YzFU0s9YbTZSY/a/HBsLAwu7zxxvftIFuux6dQDR8yuQzUEu4wa
	O6aaVhLxQ2iSUd6khipBpSEcuam4LER3bv/yPfzhuajsLczvTLX6QaXe5cee6fD/xeI=
X-Gm-Gg: AY/fxX74aqlXw5RcJ4xHb/EgY9iG3T0F6daSo184/x3xYOFBk4EsRwqsbTdRLLMxGIK
	jnQDPvzDfh7RTKBpdEwycC4SEdfnNv71yijmJSdCIrpJenjL30/nhdWnNSfWxdFKufKYWj8h3XT
	FFYqatGQ7adZdftvYGYoikecf7/Zm2zDiUpPeJxl6Zok+Zwm+zwRoAWwf74/WC3Tt9JSY+U6C1r
	DfWNwEu6osU4+Xlw0yVxdzEKYmjQtoH48dpbeJ7ZwuYgSY8wKWliJfBTvSFGkn5X1KRzB3JDPyk
	9jG8PCrvx+6QAZc3Nxd+X/jcBg5nfs1huIHv1fams7DtFbUjhirbw/B0ZMhJ0RovKV4F4owdAK9
	Veb7kZNjqVNBbC+enSP85lwyF47eNtq2lzIdZ3T1t9hIrg+i1ZiUi7zQFLOBe+RiXed3Ys0LB0I
	2VdPC50X8yBimsK0dnXgFw
X-Received: by 2002:a05:600c:1c15:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-47ee339e454mr33949925e9.37.1768406275018;
        Wed, 14 Jan 2026 07:57:55 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:26 +0000
Subject: [PATCH v5 14/14] perf arm-spe: Don't hard code config attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-14-0ef97aaf1ac0@linaro.org>
References: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
In-Reply-To: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075757_077444_F0EC609E 
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


