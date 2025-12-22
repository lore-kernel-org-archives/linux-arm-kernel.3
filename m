Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635CCE674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcmTvJXahQwVxWMEArSL10u6PwPhpeVpWDjIQEb7L7Y=; b=DhtNUgnNBeMr8U3Kkt6X+tQjGM
	pdm28SFfM0qxAMei1eue6lDF0aGT/w+vJQy6Q0qwz2jWTtsoADnuOptB1eiTkknDK05Ko0+4Prh2q
	62ZyoRjafz6QvjRHLvKKzk01kiav3KTeM+v9hJNQiKWRvQGHe8O+ak+rrKt8sZAGpXUm8HyTl/7Zo
	9wsL6rsTYJuC/Lk4pkfR2SMkBATgJNrIFQw5wv9HmAx4cXg8OQYr6aaLoagWZl+4Ob0coLNvEAfCq
	q32l2UAOb2V7qEDFzG30e3u+z1/PUF+qBELeAD01ur6OKWrjQr7HAVIhaamLMqa1O2tjpWmLqAp3o
	Izi0jjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhce-0000000Dtix-1lWR;
	Mon, 22 Dec 2025 15:14:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhca-0000000DtgH-0YJr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:14:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so3308782f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416490; x=1767021290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcmTvJXahQwVxWMEArSL10u6PwPhpeVpWDjIQEb7L7Y=;
        b=n1Lc7hK62vxx8a13bWZeCkThg0EcW7s1wTRm2kBlhONDJ11gS/Xubh0frs5SBw9zX8
         Uhl7U2PSxqlRzJkuHiLba234Iz3D1Zd6kdwv7f1dhL2DOU7ygo/YVjGhVXiqWnx5esx8
         EyT05K6v+VcbUGG9ahnv5gnxq6mRrkd4w0DzL7s8oVTe1YtMyl4gKyr+eNFTGF17rhks
         xGBZ4wLmsTKZ+GHKbq77AM+w/TtwOdFthIsHDIyJrT9rzYSuR30W6vlEF3o0rYKP9tI5
         Q4aChGdo9+EQpohK3HdaWspN4kcOczlTpBofM9b6i5fTIfyj+CH86Pz080SFJ86Z6xOM
         USGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416490; x=1767021290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LcmTvJXahQwVxWMEArSL10u6PwPhpeVpWDjIQEb7L7Y=;
        b=rDRjBYYqWg7IFvxb+7h0o3e2yAmDX6JECKbhp41zq4AeV6U37IUU0Qm04IqdwWxSte
         9Prc8pg7gDw+FvgniUPFwIFNNA0loOuYlxjKTIPDbWu2cTH4ScsWdQFdZKPR7JY6PeUE
         XioRJlL4p198KnZpwYEaH/x6LodJXQKjUnr6ESni1R5FDg4KrUZ5RgzUMZXTqonp7/U/
         9OrXrgvitgvtc3E7Mgxm8ZRFjnF+vrArHBU9J7FPFJSw3kOuE99JiCoFt3JOiG8WT/bk
         ZrfVHLSzlT93YYlEslEoQjJXFLyb3qAgJ3hYpyx3B7H1g+p0at+OIMGsAcoDYomDeK4U
         fsWw==
X-Forwarded-Encrypted: i=1; AJvYcCVkoISSnC0o0hdYVVIF+sIOpfBsOuskDcJjl/Cx7t4Yn47Wvn/jTwtnD4ykiRAP2DHDV9nBBwMcdQOlwCJZ/PXo@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGDdkxUG/URmiVPdTi2afLQyDXuCSG4FgVYcfrF2sGfcliJhp
	YECnWh3l9dSsGJKQ11AgN8LsfMyAvVKt5ZQ5qLky7/hHwcv0cqrQDrJq2f7xjstuFNE=
X-Gm-Gg: AY/fxX66VSdxSopWIL7xlNkTHIwzj5zOIZuV4xW7DxudPGw6ASDiVOV0YnGff0alJqU
	fC+Fzjl6nm2hxlAe/6BClArQm6Ma1l8GUQgATD9dYLmi6dyhO2oZRx2MLLHPVquc/5ZsVrBazBZ
	2mYX/L7wUZ6qggxmwczVFuQ+YLPAcMO/3tR14TqwMW38wxkjJqaxVSg5zYMntHw2ZBPPEt4REVF
	GC8AFAzKUC7dZ9RHDi9dqR0bW5VwowvbnCdO8ijKJf/Bdg91nBCNY/Px1AjQ8s68RjIQSxSnA4V
	coU2NnVef3HaoIjsQxUtTNnXWMicMPvwhcPFkJVvuKa1V/niqGbXlyHXIrXJsp8QlXL8uym5Ly4
	2I48SQtvUKutjWmAiFGA/sX606kaDJhLvWx/ndbvcMFtAVzlg42oVIp6NJ62pl192JpxLGHLj4d
	ugcFoJVmVR54pyWAEWZq1JmbB9AjmZvk4=
X-Google-Smtp-Source: AGHT+IH4/L5Fd2bdzY3Fz+9C/VnJ0iwvm8BOZw7bzpSdKuWzvPUtGRSH0pZWBQVoeSUMScAftQbCdA==
X-Received: by 2002:a05:6000:609:b0:430:f7bc:4cf1 with SMTP id ffacd0b85a97d-4324e4d50f7mr14023332f8f.26.1766416490049;
        Mon, 22 Dec 2025 07:14:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:28 +0000
Subject: [PATCH v4 03/14] perf evsel: Move evsel__* functions to evsel.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-3-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071452_221723_DC381FB9 
X-CRM114-Status: GOOD (  18.82  )
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

At least one of these were put here to avoid a Python binding linking
issue which is no longer present. Put them back in their correct
location to avoid confusion about which file to add a new evsel__*
function to later.

Link: https://lore.kernel.org/all/ZEbAS2yx2fguW60w@kernel.org/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c | 40 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.c   | 40 ----------------------------------------
 2 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index ec6552a6f667..21878e9bd029 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1314,6 +1314,35 @@ struct evsel_config_term *__evsel__get_config_term(struct evsel *evsel, enum evs
 	return found_term;
 }
 
+/*
+ * Set @config_name to @val as long as the user hasn't already set or cleared it
+ * by passing a config term on the command line.
+ *
+ * @val is the value to put into the bits specified by @config_name rather than
+ * the bit pattern. It is shifted into position by this function, so to set
+ * something to true, pass 1 for val rather than a pre shifted value.
+ */
+#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
+void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
+				u64 val)
+{
+	u64 user_bits = 0, bits;
+	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
+
+	if (term)
+		user_bits = term->val.cfg_chg;
+
+	bits = perf_pmu__format_bits(evsel->pmu, config_name);
+
+	/* Do nothing if the user changed the value */
+	if (bits & user_bits)
+		return;
+
+	/* Otherwise replace it */
+	evsel->core.attr.config &= ~bits;
+	evsel->core.attr.config |= field_prep(bits, val);
+}
+
 void __weak arch_evsel__set_sample_weight(struct evsel *evsel)
 {
 	evsel__set_sample_bit(evsel, WEIGHT);
@@ -4098,6 +4127,17 @@ void evsel__set_leader(struct evsel *evsel, struct evsel *leader)
 	evsel->core.leader = &leader->core;
 }
 
+bool evsel__is_aux_event(const struct evsel *evsel)
+{
+	struct perf_pmu *pmu;
+
+	if (evsel->needs_auxtrace_mmap)
+		return true;
+
+	pmu = evsel__find_pmu(evsel);
+	return pmu && pmu->auxtrace;
+}
+
 int evsel__source_count(const struct evsel *evsel)
 {
 	struct evsel *pos;
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index e87c12946d71..e3a1f26213ec 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1362,46 +1362,6 @@ void perf_pmu__warn_invalid_formats(struct perf_pmu *pmu)
 	}
 }
 
-bool evsel__is_aux_event(const struct evsel *evsel)
-{
-	struct perf_pmu *pmu;
-
-	if (evsel->needs_auxtrace_mmap)
-		return true;
-
-	pmu = evsel__find_pmu(evsel);
-	return pmu && pmu->auxtrace;
-}
-
-/*
- * Set @config_name to @val as long as the user hasn't already set or cleared it
- * by passing a config term on the command line.
- *
- * @val is the value to put into the bits specified by @config_name rather than
- * the bit pattern. It is shifted into position by this function, so to set
- * something to true, pass 1 for val rather than a pre shifted value.
- */
-#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
-void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
-				u64 val)
-{
-	u64 user_bits = 0, bits;
-	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
-
-	if (term)
-		user_bits = term->val.cfg_chg;
-
-	bits = perf_pmu__format_bits(evsel->pmu, config_name);
-
-	/* Do nothing if the user changed the value */
-	if (bits & user_bits)
-		return;
-
-	/* Otherwise replace it */
-	evsel->core.attr.config &= ~bits;
-	evsel->core.attr.config |= field_prep(bits, val);
-}
-
 static struct perf_pmu_format *
 pmu_find_format(const struct list_head *formats, const char *name)
 {

-- 
2.34.1


