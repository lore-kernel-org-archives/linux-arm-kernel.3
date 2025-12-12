Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C8FD49238
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OERRRk3y48q4ktL/F5cCy8Sn/Ar6UF3zQz2qyOlFtzY=; b=NL6A0Hz39iStj86KF69p2jRG14
	4JFvMEaQOOfogJo56fpeNjs2A4m0Cxzh/StevjHmc5La2QbgvaCtg03fSdAZVwOhoTu6kHoRU0jH6
	1QFORMmmKhJazMf6zvpl5zd3Z9dWAHd5EJZbnXRzdhxLis6zHB6Hl+qAkzbNq4C63f4LdfDgI2fqW
	l8WmP+zsq3BRyawXljrFAKjYb4oc6qq4cDbxnH0VpURo5a1h6+ik82hwitN6sVcCFETvqJXY0e63o
	8Nv48tJVc/M4hAqB//bzomoqmQmF9U7j/J5Su6/OwLkWGNGMmS7Qx6ipAe8jOANe+yL9s2EMbp9pX
	oHFGxVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58m-00000000jIo-1tj9;
	Fri, 12 Dec 2025 15:33:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58e-00000000jAQ-3jGM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:33:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6498a6f8ab4so1993110a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553579; x=1766158379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OERRRk3y48q4ktL/F5cCy8Sn/Ar6UF3zQz2qyOlFtzY=;
        b=btnhhbfpE1/xV2VERwj5j4wulLc0/GYpTqkns0vXFldiegmefnjO5S9GrcGViUCljA
         L8xvzVzQpxECc5Xr6t3Ey+G8lD1SW+/R4Gg6FhiP3QQBNN2hDycxjTEJ876msurWbjQX
         fliUUhh0VinHBL89p38b3JUEjEEm9ZmK0J/xis8AZbmwTXlTYhX42dtX4qlCiOiIjCGF
         zxjiI1WRrjVQ8k6IybR+pWspQ/pO7395KWBNY9UaY0Q8hwgmLKWD4fut8anguuq6Pl8H
         d0RVzeAEUUng9c6F3fI215atplQu52HwMkzCNh9Q+dnTHnjZkQVC8xEENMsGXrwlnzvN
         xpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553579; x=1766158379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OERRRk3y48q4ktL/F5cCy8Sn/Ar6UF3zQz2qyOlFtzY=;
        b=FzkR1tx50jZOcWSf4A5FJrKX0ku7QEBaSkObDXtkgJtlqEj/Oiz/iIXqztHKu4FvV6
         xsv4DS/+elwWe7x28Jy1MhJlcDyeqkyP2/CF0rA0iufyPu7visglOWjzn6Ci88W4SSas
         5ALawC/32CSssK0MED39uO9G6BRkUz/lRTvovc+/jSBKEVsFV+a7qUuRgRzNJVzrc0vD
         oqzcrqBO400IXRJ7pKEPXepvT6JOhu5XP8WHTfBDwDZZARZH09m+4KLSV5K8x3JO07WR
         /zW2EIRrZakQLN13YJwYeMSPKjSbpXtmYL39mHDmV0NQUI5PrRTzM81NieMyWGe2ZO03
         bJTg==
X-Forwarded-Encrypted: i=1; AJvYcCUxzETZscDVwURqcpW2elEMWp/v/SoYR85+/XwIgaH54zm9G/Fa8Spm458O/f9H+aVXNEPsmhyC7Jb1pCzOo+uJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7mEy1uAtKOhPc6Eyp3CBHq77IRRI8hEkta4bdPNrZzh6NZ0HR
	zNTZFUV1ileUpquEHO7MkRxljMtt9qUlIwjE+YCUD9T6avEAPRLwW6mMPwwrokr5Buw=
X-Gm-Gg: AY/fxX7riNsLzanUuYvsnpNUpHDqhaJkvZwRGrY+D7TSAruCzwlFR5+TWqvXEZaLlrs
	lLW0s3efoPBVYzqjHgDkZ1Lti9HhXcbwSFldRlzjdobwSwOo44li/a4TKFh8q4QCff28JTh5sv0
	D40GfI6Tklhv0QooUGnxuB7eRpnq/SdPU/rrzypIE92SgjHTbje4OlOxXpOOHZFkMg6fmUQ1ttE
	LcJBZ16OZZlIpqugiKGWji6U3EpFCKaaSNxt1jJ//Phjvk7fZn3tcAAI7V0sHmnUZ0gueYs7aUo
	+hKCdJK9VYPeXv4mxd1qJFbOYPiMt9I7j4A1y6rOfsMpO8g4NT+c9gbZ9faROgcjT7YNIGRKJPX
	Qq9LsCuUu0Ns8Vy7uCFR10cIi+HnFsq3g2NG0NaZS0Q7GcRlasyoIK6frQZ8xrzGSAUqJpHvuF/
	jbViuT5nISFfhwopMJni2q
X-Google-Smtp-Source: AGHT+IGKOsI6qPk5daX8P1jxmI9pL8L+QcZ2sUXB0l9hmBt0/lTf0xmqKtrLbY0Q9t9jSG5KaAnb6w==
X-Received: by 2002:a05:6402:35ce:b0:63c:3c63:75ed with SMTP id 4fb4d7f45d1cf-6499b1c6ab0mr2342038a12.22.1765553578761;
        Fri, 12 Dec 2025 07:32:58 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:25 +0200
Subject: [PATCH v3 08/12] perf cs-etm: Make a helper to find the Coresight
 evsel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-8-aa36a4846776@linaro.org>
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
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
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073301_325449_A70E47C1 
X-CRM114-Status: GOOD (  16.16  )
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
index ea891d12f8f40beebf8dee1d3db71cad701f5666..22c6272e8c367e5671809771b841c5babe2d5282 100644
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


