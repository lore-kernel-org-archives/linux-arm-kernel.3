Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166E8E677E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1bJE594NjB5xayk5BHzRci/xs2vEOkVDLlHSZrqiYE=; b=lLOc1P6AnLnkJ0808RPYmucZSg
	J6LKZ9mPbHXHC4BJUWg3KYcVg573qs60B3P0m/94rb/1gYykKjxVy5zZ7CHSo63O3m7jQqE1VDGI3
	QqtSzHfBEzIaZibxQKM+1OWd3UWg2/8DlEMDdWGhi6rrbeVmDZr6Vis9O3FYWfNSscQ9jdR860zcs
	fC0AfqiLEppBZLsJQdr3JaGQzxj6ECesz8c7IUwgubVrs3aW6DQJmVNpZVLgkb9zAyw8UuxTgWyvX
	ZuPOddvatiY/4OJKcpkD468BAsr1vtMiDz9rECwB0MXMVaAB+yjtOEPkhuIQqbLzE2HUrvbYmGcof
	lSCwVSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhce-0000000DtjR-3KvP;
	Mon, 22 Dec 2025 15:14:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcb-0000000Dtgr-0qRC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:14:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so41033805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416491; x=1767021291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1bJE594NjB5xayk5BHzRci/xs2vEOkVDLlHSZrqiYE=;
        b=Y1hOjsKXedpNBfNB/9jGyTZTCfhFN+R8FYA+nqVji8OY/HbT+lAEj9RAn63RjISdwz
         eT0w55hdAjWF4TrjtjoIX/moX5NlGSADLzNjAezeLcbGhpJMIgJ/vKlN8LSlsk4dNO7k
         ssQ13u7fho0U5outzcjzmCbbJcsRdl6YRtQO2lsrelbCuI7wlJwEu+rnEZwSnNKWMsSj
         XO7t4ILhAA4XXYOzUmiGIDBZKX6ZwAn4zsEtO/p1cd4PYKgEqFW167CH+Lgew8Xtwv2M
         FEqZ8b2W52tXV3KA7CTgqucPi33Od5UoJRZfqh+WdIHT7GIZ+2hLsMcFMdYT97W6maSI
         Nerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416491; x=1767021291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U1bJE594NjB5xayk5BHzRci/xs2vEOkVDLlHSZrqiYE=;
        b=Y5PYuE+sWBrEkhJsqZScYU8m0MecYuCWNttTuYS79rmfRIulj1ZZ25sOoA+MSBSZzF
         fLiuUirgXGfcM+5kR6imAzLYnfP1HDhIBcSKcUODK/9LBK0GVUUm9CSKzbiX4hK7XqoE
         Z+6hJIMtz7atfxSn2ibohajMYopbv+pbCPEqqGODH5ZEHUJiyeQ1dhPidLuq+nXs12hG
         gsKYA6P1sFW3LM1f6G8f2uBPEY8mFyohOuI+8KGZGOaXBf/miFRWcY5GzQIRI2HfbTek
         026IokiqgQuiZOZeec1vMy3NACkVX23OLYuiZncuLDBT6JjkcuxmnJRSEzgWMzU//VJH
         68qg==
X-Forwarded-Encrypted: i=1; AJvYcCXjzG5V3tx5NtQy+fga52taRkR3UReqhyuf7kJba03L0O3j0VAR/bU7d1NOjo0CQpVlRwJ101Ce5fro8f84IpWD@lists.infradead.org
X-Gm-Message-State: AOJu0YxwAVjuSi3dAdJHQIeEU4YBsnbx4Tr+7JEf55kvKkuZHPxyHX85
	AyBgR+C4pNovE2UsTEng/2x69h6+SewyHRrSKObTD9Vy6C5Xg5H4cNgyGHMEZjjDp94=
X-Gm-Gg: AY/fxX6bHbd37IQR3MOTnErA+trvubfYsU0pxEwZE5SQ4cqOKONRJVBuW3/ATQ0jAbA
	67XnDTJUS5XXYXHRwY6I0QKsRaPzCrIn/GivCvqbhjEn82J0S+lnFYpUtb5/Sxh6Bx8lRN3ZuJ+
	PdD4SKFzq9f8rgSNCy0Imi+h2lLgEDEEufuGb4kw56P8SYzpdwh6dThEjECy331dN3gxisBKjSp
	s0N7Lm27Y0wgyQxjQ1MdB0wEi7W5QBdHxj1ZkKs1RYal4tkhYvgk/9tAocxodphH+WyabAfz0wR
	kNkzs5WazBXCE6Y2D2mwX9YFMFvGFLynxWkJOnPqnnFLFNTbl5ufBQeUr4L0kURoe11GdhDotHd
	pBd+11MLGM8tMyKdQAUfupsbB5p7/5s55DOYqF6HVH+bkmXJNSO2t+rDjwzNjKdt/SOn1Unuawn
	M5ICycV6fgjMVorO+Njn1sYAwEVhFbD6c=
X-Google-Smtp-Source: AGHT+IFddjiKvcVB6cB7sXuBjaeFQkW72VpuWm8Z2oCtbr9Um6xxbGDEDSw9Q4XBeyAlVCQFF3b1FQ==
X-Received: by 2002:a05:6000:26d1:b0:430:f463:b6a7 with SMTP id ffacd0b85a97d-4324e50ec19mr13688757f8f.45.1766416491127;
        Mon, 22 Dec 2025 07:14:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:29 +0000
Subject: [PATCH v4 04/14] perf evsel: Support sparse fields in
 evsel__set_config_if_unset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-4-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071453_696597_9B6F4D1A 
X-CRM114-Status: GOOD (  13.90  )
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

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c | 4 +---
 tools/perf/util/pmu.c   | 3 +--
 tools/perf/util/pmu.h   | 1 +
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 21878e9bd029..45ab97beeb34 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1322,7 +1322,6 @@ struct evsel_config_term *__evsel__get_config_term(struct evsel *evsel, enum evs
  * the bit pattern. It is shifted into position by this function, so to set
  * something to true, pass 1 for val rather than a pre shifted value.
  */
-#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
 void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 				u64 val)
 {
@@ -1339,8 +1338,7 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 		return;
 
 	/* Otherwise replace it */
-	evsel->core.attr.config &= ~bits;
-	evsel->core.attr.config |= field_prep(bits, val);
+	pmu_format_value(&bits, val, &evsel->core.attr.config, /*zero=*/true);
 }
 
 void __weak arch_evsel__set_sample_weight(struct evsel *evsel)
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index e3a1f26213ec..599fdf5e28ba 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1404,8 +1404,7 @@ int perf_pmu__format_type(struct perf_pmu *pmu, const char *name)
  * Sets value based on the format definition (format parameter)
  * and unformatted value (value parameter).
  */
-static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
-			     bool zero)
+void pmu_format_value(unsigned long *format, __u64 value, __u64 *v, bool zero)
 {
 	unsigned long fbit, vbit;
 
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 8f11bfe8ed6d..e34db47ae5ef 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -254,6 +254,7 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct parse_events_terms *head_
 			  u64 *alternate_hw_config, struct parse_events_error *err);
 int perf_pmu__find_event(struct perf_pmu *pmu, const char *event, void *state, pmu_event_callback cb);
 
+void pmu_format_value(unsigned long *format, __u64 value, __u64 *v, bool zero);
 void perf_pmu_format__set_value(void *format, int config, unsigned long *bits);
 bool perf_pmu__has_format(const struct perf_pmu *pmu, const char *name);
 int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_callback cb);

-- 
2.34.1


