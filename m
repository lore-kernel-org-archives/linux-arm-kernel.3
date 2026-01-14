Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F4BD37E5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHuJ8xIDoo5vqekEsW8kb8XOXUQ7JU8mQQu2ivsjyMg=; b=GGToH6RcH+K913RTnhApIkCuDE
	kEQ+sAV8RrIVcI0jpKg2BZfAF9zTAakHVo73+BQ068LetFaMitSQrYJig2IKUzKTIq7z6oqrgcSvn
	LNH287DqZk1up/xUBIG34hRdYOmAgdSSQbB5vLKg7EIM9v9ojBy94/16VrAMNUq++sB4Ygik5+9N9
	hBGb+XsFn7/b991jbmOuIEINI1jLJyhSvfNtOu1icWmO+v5gLwQyz7nQls2pIKvxEs69po6E0FbJB
	CNSWanCNKakdOeJ7FdLVgQpaLlmNwqrH8ebuKWNF/SzGVBqiZcIXuqi58XVXdn/R8T9K/o+MnuAsl
	kr3x/VUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fy-00000009oLt-1T0f;
	Wed, 14 Jan 2026 15:58:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fn-00000009o9G-2qB9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47ee0291921so12801835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406270; x=1769011070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHuJ8xIDoo5vqekEsW8kb8XOXUQ7JU8mQQu2ivsjyMg=;
        b=tsxrb6fOW3xLBxA5IxLVz1Um7ghNLzIgXCXFaPqdP3doB5ijEOBetdQq8w35ndoC4b
         Qemvvkx2pGkx9/+WbvfcOYGqNcfK0TPI2T4OSGPnW6YwkVtY3lHKKAvZzJnd4J7DZEWN
         JVIe2nJnBKDi+kHX30Z6qF1bmIo+3l+tKmOwET8QoLpmFjLKdEfPPSJrI781KV+Gcenh
         on/X3OdL3FxOzDvmQjZhwgpdx409jSQYSJKSlEhF/4Xx+CBBBzH3I8JZnfBZkHmwV7rc
         WRNaf9nYF+GuqjdWYfICzCBheotcDLywUwzICpGHcVsTECooVvhys45guEuXF6Kqoxcs
         3LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406270; x=1769011070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHuJ8xIDoo5vqekEsW8kb8XOXUQ7JU8mQQu2ivsjyMg=;
        b=dTkbKCrks6sMj6bQLoBw/p8xnzulkErq0UsJibnMJNXVYclS2XnzFoE5S94lAtyWqY
         FFnAGQOIdndiG4IvLzwnHzZGtjR4S3zPx9SG5yBj8Y9Lu+pczEGcAdzDiEXKP9+KknBU
         DIbnw/XZrOW09HCEJX+JuE5ptVC7NwFmaojkS7rxNjrxrGZOMbktBM3fIAlTpVCzctwb
         9mvlvycUgjXOhN3CIHVLR0EhfRSyKurmo1h0Buu5SML/h9xVFvhBFBcFByuNKjy6Z3EH
         t9HUaUwUEYPv6HASbVOQigU+o5DwLOU3Rmm9udId74mpdSaruf1R1LUGLWEvAZzmNwMC
         uepg==
X-Forwarded-Encrypted: i=1; AJvYcCW6KAhFPIqIxWoYs07nv1ULY8Yv0eeEAKuVvKRq4bxAFH6Hii421qRnXgpII5v+H9qxICmTqaiaWyxVxS9tz04P@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2x+ENbN71WNzL8ZnQuPjswNxLy7UFZh0z5l9PYFBNPR+6Nz3W
	jJN2LM6BcspxjwqwQtEGa2vwG/NqT5avLYoqZeXm4Vu4JzRXeigxL+qjxPBZsviCaCk=
X-Gm-Gg: AY/fxX5QuNswL1TBFViwRFAaWgg+/D9isYVM2aM6WsclgbvQ7u0MOmKhkXsmYXQdKdn
	7GFad2ihjixPR69aYQ2Cwt5dtNVqTdnoDTImYoB5Rlull5e1C2KxFxrS1l89jTtaBfna+UsdOvD
	JIrvEYjFpksLkLGXt8IZ8xT44XHDG9TmtRcvM4vyY9XiqZdPJZ/8Yn8XgjRzkI1KkOKKfPquktM
	mJ4lxcMv4+z2tiIRzXxWKAVxc9kbyJzHR+QQIQ1C/SHHI8orz5VybJIFEf4W4ioC+cz2edo7lTv
	s4VMyg+jDqrjFuajzeSEJDD8vJAK6Drx/TdPW0DUdQvfN8FYL/1Xe1JbTrlTc04m4ufrmU6sctq
	9aZXYlOJF/YW57//vjAwOFkIw8IWEl4YjIAzHCh//QIX0h8lTgib3/g6dAYDZkZP0dQwSIQAX7s
	ajk7oZHqFmWjtY4Z1/N9JX
X-Received: by 2002:a05:600c:8b0a:b0:47a:7fd0:9f01 with SMTP id 5b1f17b1804b1-47ee3356c0amr37970915e9.16.1768406270036;
        Wed, 14 Jan 2026 07:57:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:22 +0000
Subject: [PATCH v5 10/14] perf cs-etm: Make a helper to find the Coresight
 evsel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-10-0ef97aaf1ac0@linaro.org>
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
 Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_075751_751469_2FAB30E0 
X-CRM114-Status: GOOD (  16.29  )
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
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 50 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index c28208361d91..a49753f0d20f 100644
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
@@ -473,29 +486,21 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 
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
@@ -829,12 +834,11 @@ static int cs_etm_snapshot_start(struct auxtrace_record *itr)
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


