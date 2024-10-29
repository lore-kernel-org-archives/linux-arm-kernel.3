Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B40D3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fU7cyGBfooFNsBX8MqWStdGjWRAG+XFOSb3+XeN3B2Q=; b=dNBZL4W65eXSUls24W7I5n94ET
	G5nr1DEVRKjkpJdxLGlKJS3zGMiyJ3dz0Q1/48879imWeZnGFfnTKGCABKkxDQv7NWAXmr98fbLLX
	8zjdmsaIMYKenNoqnBiU9dtTNq4bv7keu8qWJG3KttSMY878y79XYkkLntARz5JIKDRYphJlB+3jp
	WJFiUZbVpkSkghtrwui29ZbfI74O3QFTp03UTCrRCBeH1yT4Lq/zDD9hV0A7eC88XVwEfLhyCmBCU
	UQC/XYadhbqpZ57TtUW5M7eegLX33yUB4reAfpVaZ6Iuiq0Dy5pQmvfWVe783hXfIuqXrbGb6lBj7
	y8O6ohtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nNj-0000000EkXT-1ZCW;
	Tue, 29 Oct 2024 14:39:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nM5-0000000EkI8-3PGQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:37:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so4860670e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730212675; x=1730817475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fU7cyGBfooFNsBX8MqWStdGjWRAG+XFOSb3+XeN3B2Q=;
        b=aMhYm9eZX3dZuuo+txC1wd+QJe4ZITHTxZDzDyCDE3zVuitx58TGn0/VXP7EQkLGqR
         lBnniemvr3f1hdJ2y6T2uMu945+lxfEv8muPe8Djw2dG53hXupbbGqdmqJfTKIOnuFC4
         RxY3clFzuYJZeoALBZI24rvh5gKzNxge0IVe4gxUJHTQpdEJWWDf8IcxJJxU9FlMv+et
         E16zbZEc+dAQWlCniXcCxFPwnZFEVYYv/Kv/PX0v9h4s489tJqkhlhWBm7hIRcTIhz7W
         HH6wnjL/g1j38w+N7Beoyuc5F1ypWzDmnPutzTuehJfQXmMN2lNeJ78l/S8N6fOcyWbU
         2GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730212675; x=1730817475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU7cyGBfooFNsBX8MqWStdGjWRAG+XFOSb3+XeN3B2Q=;
        b=qwRx3qfFbrHoQaN1/2OZ2p39jtNVVgSahTPsGKW9v+SW/qMj7lo8rZXM1X2o0YHlUM
         w/NNiSyH2Hve7JSsecZIt/Qs0BeVT53FsHoc388nXFBkoLoTqzUEjYWcAYK0sXHX5JIO
         bAuL6J3eLH55PCt0Lh8bfLcyNJh75cNCGISaZDOS7eJhsY1jlfuUX1pN3zHBnX9GRToH
         IG6AGLyfQK0UlkMRkEID7lt5WdCziu2MFULjQpRx2PoQVZUj/R2AKt89w5ddoqWaTPWU
         F+z7WsFZ5ymM/cUd8p+u0+XpouSGraz3M5qAw0Vo/9X4OA6WSw3WbK/Ffw8r0VsUYtLJ
         MzQw==
X-Forwarded-Encrypted: i=1; AJvYcCV6GHlqVKLdn0Tb1jpWYz3uooOGmN63qyk7EJInrDgDwKum3dBsQZztj7gsX6wbKunsipwux/86gzggPkIaoOis@lists.infradead.org
X-Gm-Message-State: AOJu0YxZfs8qOjVClGeIHDUqgV+5QBPRjEj7OJEhAMqCWl14kpcetK3N
	5Xq3EgTh1o2onuw1RkxRVgGfa6Wo6RFRYKPU8iujGSAS5Yd08wOWF75fJ+EsPJcujMjGLIufh94
	G/mU=
X-Google-Smtp-Source: AGHT+IGcubgmYg8gT6lXgSEjMqbjB74jbZ3p18R/hr4YQBD8lqBWu95UmeIvYZfd9U8KseVfDpuE2w==
X-Received: by 2002:a05:6512:3e1f:b0:539:eb82:d45b with SMTP id 2adb3069b0e04-53b34c41d5amr4316658e87.56.1730212674909;
        Tue, 29 Oct 2024 07:37:54 -0700 (PDT)
Received: from pop-os.. ([145.224.65.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b437d362sm27554455e9.0.2024.10.29.07.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 07:37:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: linux-perf-users@vger.kernel.org,
	leo.yan@arm.com
Cc: Ryan.Roberts@arm.com,
	Kiel.Friedt@arm.com,
	Julio.Suarez@arm.com,
	James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf arm-spe: Use old behavior when opening old SPE files
Date: Tue, 29 Oct 2024 14:37:33 +0000
Message-Id: <20241029143734.291638-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_073757_876815_E6C83C35 
X-CRM114-Status: GOOD (  20.05  )
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

Since the linked commit, we stopped interpreting data source if the
perf.data file doesn't have the new metadata version. This means that
perf c2c will show no samples in this case.

Keep the old behavior so old files can be opened, but also still show
the new warning that updating might improve the decoding.

Also re-write the warning to be more concise and specific to a user.

Fixes: ba5e7169e548 ("perf arm-spe: Use metadata to decide the data source feature")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 50 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 856cc36f33d7..fb5ab8607b64 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -546,37 +546,35 @@ static bool arm_spe__is_common_ds_encoding(struct arm_spe_queue *speq)
 	u64 *metadata = NULL;
 	u64 midr = 0;
 
-	/*
-	 * Metadata version 1 doesn't contain any info for MIDR.
-	 * Simply return false in this case.
-	 */
+	/* Metadata version 1 assumes all CPUs are the same (old behavior) */
 	if (spe->metadata_ver == 1) {
-		pr_warning_once("The data file contains metadata version 1, "
-				"which is absent the info for data source. "
-				"Please upgrade the tool to record data.\n");
-		return false;
-	}
-
-	/* CPU ID is -1 for per-thread mode */
-	if (speq->cpu < 0) {
-		/*
-		 * On the heterogeneous system, due to CPU ID is -1,
-		 * cannot confirm the data source packet is supported.
-		 */
-		if (!spe->is_homogeneous)
-			return false;
+		const char *cpuid;
 
-		/* In homogeneous system, simply use CPU0's metadata */
-		if (spe->metadata)
-			metadata = spe->metadata[0];
+		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
+		cpuid = perf_env__cpuid(spe->session->evlist->env);
+		midr = strtol(cpuid, NULL, 16);
 	} else {
-		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-	}
+		/* CPU ID is -1 for per-thread mode */
+		if (speq->cpu < 0) {
+			/*
+			 * On the heterogeneous system, due to CPU ID is -1,
+			 * cannot confirm the data source packet is supported.
+			 */
+			if (!spe->is_homogeneous)
+				return false;
+
+			/* In homogeneous system, simply use CPU0's metadata */
+			if (spe->metadata)
+				metadata = spe->metadata[0];
+		} else {
+			metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+		}
 
-	if (!metadata)
-		return false;
+		if (!metadata)
+			return false;
 
-	midr = metadata[ARM_SPE_CPU_MIDR];
+		midr = metadata[ARM_SPE_CPU_MIDR];
+	}
 
 	is_in_cpu_list = is_midr_in_range_list(midr, common_ds_encoding_cpus);
 	if (is_in_cpu_list)
-- 
2.34.1


