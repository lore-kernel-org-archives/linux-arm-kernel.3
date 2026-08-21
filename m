Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BB3C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=; b=ZPG+OXWaeIRdcXH4rKd9/dHKvI
	W/10XYoUAJTIjgOmJDnKL4AUTQD1RA2wE7C0nCNkS/tBQ0z5wRMw6/4rTrHFv6LLfLIEGlpL23Hwc
	+J+YXfhb6mbURwkpPHCuV0KXfGcvxSwlIQNVWOS98GBLrYFhof2u4ic9jAt4olW+PNrlQgU3E0z+5
	3JqYWTqEraLot68TSZ0Txv7bz9nRilpvWPgtHpMaymFC6spvJM2HdhJ0TI7XoXr3Z/ItkQ7y4LSDS
	7U8LW3qXa3nyyUyBTnxlSgYmYAZxl921BdEbQsOH/KGxMbrv7tGhf8wjcoVi3sjPbW6qe/S1PZQtF
	GA64TjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsd-0000000Cx4g-1a9l;
	Fri, 21 Aug 2026 09:49:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsS-0000000CwxW-4Afc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso330480f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305771; x=1787910571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=;
        b=Vxegr00Xhd5fu1H+AfyI4iBShxndscKKBa8M6aEvnQvtvk0GG50FFAAIcbAqYBKNwj
         aor4aKV0AekVkNfPkVCb6V6vKMD19M6uwN9xb5i0tsRceBYwyoIx5WVW8mvZdAMnEsvU
         uoVHxinbpuEZXlLaN0V+b6wxZHQwMbC9dhkhD7DpW0KAKq2nAAd851KzVeSPX5vTOpiM
         zgdMwGphtrJYE+qqW52xZ8fyq28rn4sSGairwhrGRSaLGVkEsZoMrbTHaOHxZ8jD1bW8
         qhwIIdtRxOqZgW4q8cUL6LjRE9YAME81miV49BrFEH1bWMTCBlS71lsxduLrD3+VzvNz
         kWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305771; x=1787910571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=;
        b=UJscyscESpv+vz1wIeETa3xsCMgNdkLlID/uS13Kz16FQwkgjuI+zydIpo66uFzc87
         FkXXP4MrxI87ehMLBR72s/uzUXY64E6W3k4EMOvL0w5MZhfU5gOsVIDGjZz6jgCdsSU5
         ag3r2ZihI2juAgefGVnxSu2DOCQ30uVbe1eo88si71o8uaxoD3tE0j/HjBeXhaQTsIj8
         kRxNqB28YHrskgzXldbuPiDcE5qyq8heOJdArKyY96HskLZDyf+udnLj2xRMxyroBkN8
         V/lIdndy4pZKT1wyHTAlQWWk0KdlhIG9buoXYkH7/I70v9L9KUkGkE+aiXEne+/EAGrR
         n6zw==
X-Forwarded-Encrypted: i=1; AHgh+RqD6sCjcP51dkInbDXDvBm9YFJNjnBOebvJRv2w6T0QyYLxmiEe3PeryzCepa5vBxpdqBj/qGQKDWtY8dBmXeoJ@lists.infradead.org
X-Gm-Message-State: AFuF++khlZcTA8pdbjAZMZoSNOl/Zyua8hWq5j1/wWmUToY04BJnGFbt
	UkoYsjDkH6Yxf2ygAaNV2OHBnlvM9IxOrOMPiGesm99xgQE0ygtXRKeVfGWd4Wkwsow=
X-Gm-Gg: AR+sD10OBM+f2NkmYx2EonzEGsC4HUllO57QTeuC7NJQSLPl+MzZcme5T0h1ik6LwRz
	KYwe2SlRK4JyumIkMf6VGkKQnK2U0bOIWSlLK7W/JWrSWtpEpXvSOBwsw0ZXXaTnAZAJ666pbp8
	q3U8wTVze4H5k1BceYaF7+RU9Vw+EZOynYt7/grGAPTIqAcyqd/fhvp1wRsvMYLNHBhk1pH3h22
	5Kw8tB4mb/b7KCoY3T3i51ZXmQvzi3t8u7aIX9+IVF1+xHqLDq84rEGGKm6/MNd94CUEuV1e9dN
	G7na9ARo4rNqf55iv44LKLIpJzJxG116ApIPfB1L2DMbhibooTXV55iCwZi1Ap5KOYgv6N93bYz
	f8aryynwLuCcyvwGzZFSn/D3JZoS/BLtVIGdJ8DZ4SIV99pn0TTzcKPMWdqXX2fFl2DGwAiZnO8
	+xAzYA1lQSDqcNmAOfHKRomeF1Ci/1+CkwSlWYx66MWdnaLm8CnhYKcDUk6N4jWeXD
X-Received: by 2002:a05:6000:461c:b0:47f:86d5:d1d7 with SMTP id ffacd0b85a97d-482c0b63396mr7979910f8f.6.1787305771015;
        Fri, 21 Aug 2026 02:49:31 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:03 +0100
Subject: [PATCH v2 05/14] perf cs-etm: Increase default timestamp
 generation period
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-5-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024934_315428_DFA34216 
X-CRM114-Status: GOOD (  16.13  )
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

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d0486a164a70..d36b7e41399b 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -70,6 +70,9 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* Default timestamp period of 256 cycles (2 ^ (9 - 1) = 256). */
+#define DEFAULT_TS	9
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -458,7 +461,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		 * Timestamps are required to interleave samples from different
 		 * CPUs.
 		 */
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
 	} else {
@@ -477,7 +480,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");

-- 
2.43.0


