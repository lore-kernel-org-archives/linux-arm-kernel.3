Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15503D37E5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbXl4NsAkDqXtfh1/waIfkR63u1IJoE9aVRzYhhT54g=; b=1H+tAWX1gAQwU3egnOu6ZXjFzl
	BO/cBAPiPFWCNDgA19T64wHQ5f7ytuhYueGlv5HQzMZ5VPS97aepXrN2bY5jrBA+z4iN6DFiLNUOg
	GT9jnXc/1Ya3fKvcM4SrIFS5GwzMN7Db0xSnMyKV2p5Vrrhj3O0ztLXizhRiMwlLhaIqktzrRv7AY
	pRoxW/nW3NOx31OVt6ghab8WIJ8nmu7IltyAqOJZHPEhF2WSF0dNu3mWR/zqf1Kt8x8p3sIGU5JyW
	gdJIOc1+/s3wtrwDcFAdSA/Kq2vSR7vibu66axng9tNFxJ9xATtXwkifmVWEi1v/lWMQx1LfdWLUa
	LD2otoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fj-00000009o6J-2xJ6;
	Wed, 14 Jan 2026 15:57:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Ff-00000009o2f-2qaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso81986485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406262; x=1769011062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbXl4NsAkDqXtfh1/waIfkR63u1IJoE9aVRzYhhT54g=;
        b=c4l7z7x1LgjcPLziWsO8BQ2ZqjEGFljrGoGl6iVxRMchD9r1fTDUhoOyadYSO/Kr9h
         aoUfiSW79VSliFNYED6epDfQkjZTPdUO5TLCrvfKklZ+npgeMZcUxiEVwSAUeFu2kh/Z
         1M4em2Iz8tlWAqgjDzzUvAbzQ/z3OUAm5fBPHOVvpXyTLrOCqoORrPWkaSD5URZEUyG7
         MdtgfIfPnEwbw+TuSglPcS8F7vWENbUi+nlB1vFK3Jzr2vk+ld7WZLnPi7YVspmbvBW7
         tD8e7Nn8eKWM0NL0prS2pr43dtO+0kaQhZ3aqK3Pg76OoDy2kErjAX0zQXiTJEhimdeO
         +TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406262; x=1769011062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZbXl4NsAkDqXtfh1/waIfkR63u1IJoE9aVRzYhhT54g=;
        b=c0OyP/X0stb4z5v9gLQz7RkHPrw+rq4aEkK0c2VSS06xR5Iv3XJO7FsZsUSWe8CrQx
         oZ0+20A9MrD/WBqY6QqSMzT2Mwxj/+hzhBnMNU0g7J/Dm1k1s25y0wOtbogo30+h9Uy9
         w5aJjfECEvQZCJLBsxi5cSSpuPc+GdHwLuzLoDSOzDJsksjVwg5BaxsoDlq85u0mB5lq
         lm4j/dV5gxarF7WxH771hXSf91RLQQGyLqgYBI40NYaUsXvqEAo0djgy7LPQWl4tRQpT
         xQ7+WjhJ130NM/r3PSU5d8hnVMr+lqr9CbU6ayUZsRSrN4Enycwu0aHxIE2jaGpbUsIf
         vU4A==
X-Forwarded-Encrypted: i=1; AJvYcCW8BXCoTQB1vFPSEs5PX0onh/YOEZyajR/fKP360MMxpCS5w9F9fPrrU7DBykkn3xvAl4S8k8BzJ7Kzeujh8hEV@lists.infradead.org
X-Gm-Message-State: AOJu0YxHS/6eeTIV/c+SljkFKfq34n0i8O9iH9WvLwCxYkNzZtFryiqr
	+L4iniolFQlyeXWN36FaOdqiy+qLLQwbOLYDo/KcTHRHbWPjhSEqIjitxQbq/irFXb4=
X-Gm-Gg: AY/fxX7mqO71uNkCwBxs5WIZ8E/BqzMh/qgZp4jh8abhUqoyiXgRbmlJiBM45yWbMTc
	BOgUlATO92as3pxZqqghy4QcjD3YfbK+cbL5YNSEt6ZIPpgUPBuxeQ964XijsSZy9OBGUU638tA
	Qs6vsfyV2o3o65rHGuYuqubpgoZwdLuxPbRB1fUG9/HnLnwT9U2ssuqZEKdkMfM8E4CedmQN2eF
	URyhn7pGXKSpTloXxESOOt1Acvld3+iNSpaNsogMj1xCirTNgRbl+g+IXOU+i0X7l5Z+abFznRR
	+RizZBQWV+BghEv8NGXRQJqBX40lBnT6iXJ9Y4TV2Q9c1dEx0id0WRqFPco2cyqS1PBy3ZQIn/a
	lK7iqztwuJTg9OTak1B11QwAWj3NmzDhrOIZYfNmQIFqukJH5JolcnZyoCkgLa2qoxA4zNPq/CW
	US51IL0PY89CO5exAykSIL
X-Received: by 2002:a05:600c:8b75:b0:477:af07:dd21 with SMTP id 5b1f17b1804b1-47ee338a5efmr42560995e9.25.1768406261716;
        Wed, 14 Jan 2026 07:57:41 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:41 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:16 +0000
Subject: [PATCH v5 04/14] perf evsel: Support sparse fields in
 evsel__set_config_if_unset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-4-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075744_529344_3B6ACCC8 
X-CRM114-Status: GOOD (  19.97  )
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

Sparse config fields are technically supported although currently
unused. field_prep() only works for contiguous bitfields so replace it
with pmu_format_value().

pmu_format_value() also takes a bitmap rather than a u64 so replace
'u64 bits' with format->bits.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c | 19 +++++++++++--------
 tools/perf/util/pmu.c   | 32 +++-----------------------------
 tools/perf/util/pmu.h   | 28 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 21878e9bd029..9ef94632106b 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1322,25 +1322,28 @@ struct evsel_config_term *__evsel__get_config_term(struct evsel *evsel, enum evs
  * the bit pattern. It is shifted into position by this function, so to set
  * something to true, pass 1 for val rather than a pre shifted value.
  */
-#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
 void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 				u64 val)
 {
-	u64 user_bits = 0, bits;
+	u64 user_bits = 0;
 	struct evsel_config_term *term = evsel__get_config_term(evsel, CFG_CHG);
+	struct perf_pmu_format *format = pmu_find_format(&evsel->pmu->format,
+							 config_name);
+	int fbit;
+
+	if (!format)
+		return;
 
 	if (term)
 		user_bits = term->val.cfg_chg;
 
-	bits = perf_pmu__format_bits(evsel->pmu, config_name);
-
 	/* Do nothing if the user changed the value */
-	if (bits & user_bits)
-		return;
+	for_each_set_bit(fbit, format->bits, PERF_PMU_FORMAT_BITS)
+		if ((1ULL << fbit) & user_bits)
+			return;
 
 	/* Otherwise replace it */
-	evsel->core.attr.config &= ~bits;
-	evsel->core.attr.config |= field_prep(bits, val);
+	pmu_format_value(format->bits, val, &evsel->core.attr.config, /*zero=*/true);
 }
 
 void __weak arch_evsel__set_sample_weight(struct evsel *evsel)
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index e3a1f26213ec..7967d9159742 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -118,31 +118,6 @@ struct perf_pmu_alias {
 	bool info_loaded;
 };
 
-/**
- * struct perf_pmu_format - Values from a format file read from
- * <sysfs>/devices/cpu/format/ held in struct perf_pmu.
- *
- * For example, the contents of <sysfs>/devices/cpu/format/event may be
- * "config:0-7" and will be represented here as name="event",
- * value=PERF_PMU_FORMAT_VALUE_CONFIG and bits 0 to 7 will be set.
- */
-struct perf_pmu_format {
-	/** @list: Element on list within struct perf_pmu. */
-	struct list_head list;
-	/** @bits: Which config bits are set by this format value. */
-	DECLARE_BITMAP(bits, PERF_PMU_FORMAT_BITS);
-	/** @name: The modifier/file name. */
-	char *name;
-	/**
-	 * @value : Which config value the format relates to. Supported values
-	 * are from PERF_PMU_FORMAT_VALUE_CONFIG to
-	 * PERF_PMU_FORMAT_VALUE_CONFIG_END.
-	 */
-	u16 value;
-	/** @loaded: Has the contents been loaded/parsed. */
-	bool loaded;
-};
-
 static int pmu_aliases_parse(struct perf_pmu *pmu);
 
 static struct perf_pmu_format *perf_pmu__new_format(struct list_head *list, char *name)
@@ -1362,8 +1337,8 @@ void perf_pmu__warn_invalid_formats(struct perf_pmu *pmu)
 	}
 }
 
-static struct perf_pmu_format *
-pmu_find_format(const struct list_head *formats, const char *name)
+struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
+					const char *name)
 {
 	struct perf_pmu_format *format;
 
@@ -1404,8 +1379,7 @@ int perf_pmu__format_type(struct perf_pmu *pmu, const char *name)
  * Sets value based on the format definition (format parameter)
  * and unformatted value (value parameter).
  */
-static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
-			     bool zero)
+void pmu_format_value(unsigned long *format, __u64 value, __u64 *v, bool zero)
 {
 	unsigned long fbit, vbit;
 
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 8f11bfe8ed6d..3a53e1882cf1 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -233,6 +233,31 @@ struct pmu_event_info {
 	bool deprecated;
 };
 
+/**
+ * struct perf_pmu_format - Values from a format file read from
+ * <sysfs>/devices/cpu/format/ held in struct perf_pmu.
+ *
+ * For example, the contents of <sysfs>/devices/cpu/format/event may be
+ * "config:0-7" and will be represented here as name="event",
+ * value=PERF_PMU_FORMAT_VALUE_CONFIG and bits 0 to 7 will be set.
+ */
+struct perf_pmu_format {
+	/** @list: Element on list within struct perf_pmu. */
+	struct list_head list;
+	/** @bits: Which config bits are set by this format value. */
+	DECLARE_BITMAP(bits, PERF_PMU_FORMAT_BITS);
+	/** @name: The modifier/file name. */
+	char *name;
+	/**
+	 * @value : Which config value the format relates to. Supported values
+	 * are from PERF_PMU_FORMAT_VALUE_CONFIG to
+	 * PERF_PMU_FORMAT_VALUE_CONFIG_END.
+	 */
+	u16 value;
+	/** @loaded: Has the contents been loaded/parsed. */
+	bool loaded;
+};
+
 typedef int (*pmu_event_callback)(void *state, struct pmu_event_info *info);
 typedef int (*pmu_format_callback)(void *state, const char *name, int config,
 				   const unsigned long *bits);
@@ -254,6 +279,9 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct parse_events_terms *head_
 			  u64 *alternate_hw_config, struct parse_events_error *err);
 int perf_pmu__find_event(struct perf_pmu *pmu, const char *event, void *state, pmu_event_callback cb);
 
+void pmu_format_value(unsigned long *format, __u64 value, __u64 *v, bool zero);
+struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
+					const char *name);
 void perf_pmu_format__set_value(void *format, int config, unsigned long *bits);
 bool perf_pmu__has_format(const struct perf_pmu *pmu, const char *name);
 int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_callback cb);

-- 
2.34.1


