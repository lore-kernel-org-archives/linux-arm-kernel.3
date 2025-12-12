Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140C7D59D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfXl40fnB74AGQ/vJ3IYApuDFV3Ub/cQrhNchAtNkEM=; b=NTd4zz2jbo+sS7RkV6wNGadx4f
	scpDfn0Rr8D8Mt+emXes5fnKWVVaBhaV4HjNmb4mC+saMa5HFos02euk5J+jStkkRiPsnpdqWr3VO
	18NUiOHItytFriDl3h+Arr8G3IIDo5zZqbPUlyxP18PUuwpWnWY1lbwHukqAy3q5QwIcfRcEGezcR
	bUk4+KKihcU4uhRHDQ7MitWTKtfAjf+c/Q6ivYtjrU9yQWdcsaJi9wzsqPqK0kdjQFqevhj5hJ7al
	AteJUF2QVz7hU5Afdc3SDui19pqv1D79H1U4TUZ/eI0Ia7LxZmWISoAYUzcZdsQzJ+7GsoOKd1x5O
	NYYdpSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58d-00000000jAS-2VCs;
	Fri, 12 Dec 2025 15:33:01 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58W-00000000j5C-454L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:32:56 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64981b544a1so1799894a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553571; x=1766158371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfXl40fnB74AGQ/vJ3IYApuDFV3Ub/cQrhNchAtNkEM=;
        b=cyBu5UtYOMjbCfn+w49OAzFcLqxmhYpAZS+ep6snL1E2+mcMZmT9B73+zvdo5Zq46b
         vbDcapSxUxIwJBXWpC1DzDjdJpoDwjzJdHn0mXWXmsbulOIwEz0zKe1eH9rAjm+0WFxA
         CkxNQzoJ/CQY4qtuorxZKgjN7rOfFBUBb6q5c2/HhgIP+WjFe2A6XH0/q7dUhlVwQtED
         oIQJaYEdN/8YI/8m927Gfyujn0FRDIhJt4J28MQkLWrZiJH05NXp5IE1hd0U+FAVLF8W
         m9t3IvzAsd1YuOC8wbQH3zTG3nd5ZUMGZ3TZeH0ZH71IRDRgXtO2EUsRXoOXSmzIeDom
         ZysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553571; x=1766158371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfXl40fnB74AGQ/vJ3IYApuDFV3Ub/cQrhNchAtNkEM=;
        b=Yn35P5IWwYZE3sfkNX99nf09GyVBarfmIeM+ZxPDAdy05XbhwFAGtttFr6ZtMa0qBR
         Hf7sxPegjY5JjCbXsbpiasr2KV23PhiFNJutNBwFX5QYFJwfbttnPnWabHxuCorkIAf1
         7c2O3evd/OOwXcrUwpFCTWewJMIMhUa6pM27feZ5vmfzPI5o+Cx/O+FHE60wEbRYvj3p
         ZMydmoBACTyrEttZw8gj0N71+LUWxtgAH+ZOAMVmYsyobYCoDzmI5lRfXHGoDtkztIbm
         b9Eft6kgCYE0WhN1kcgRL3Xl0ZVe9tQrDkbA6hHnJaUQXhr+vTYzUkuCDCIKm+lI+qDK
         93Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUdN/SWsqTCiAVHMqPFhMpG2moKDjy2aPFZmuCPbttiVwydQqxa/l05drr4b6+Pmp15fFP9zqkscp93eu4DoURM@lists.infradead.org
X-Gm-Message-State: AOJu0YzegzLtiiSN7nn1Ia9EU3E1RYR4U5Du+tYnVq8uCTk3RKUA1Ur0
	2B7BaiyiTOuVOKUwJPpJKRM7lRJXySPjYanT+Mg+YGrZvgETxR6lGaCN2wTvTQzDKp4=
X-Gm-Gg: AY/fxX4G2dOD3oXEfqj2uEF1Vm+mXAZYJ32gUGU4E0PKsMNKHFxjcVh/qnaFyHZXeK1
	bzTYVfDC6HYbbyVgjUcPD/7l9o3gjXk45i/c/l5r4ioN2pcA8jeKblYkYgOLm4DNVMNvYwarJZG
	SCmDrjOwwyDPvvuAhrDp/PBSl4nGqNFMhVFN4f43xDSWjSN5I5ED32rAg9QFAnZLP2mVXmIaz5W
	ie9++4bM+IezV6cABSL6e7qme6yA08fC8U/Z0LslqIw96D7fxRDAZ/iGTIlr25+1OsmT1QAIf30
	pAu2CmbyArggByt4RW/z16QJ2wD48IaG7VJh9ujEdE+7dh+SXKAdrDjPWNLvhEfNxqWj5qQIpHJ
	SaXXyY3vBReB6A09E2xPFzGzw3dYmD63H/jcwbbCARbNDI0rrnf5rfENuHKSHZvzoAcPhONNizf
	x+D+3zqeyI6U+tu2+l79uW
X-Google-Smtp-Source: AGHT+IHTK60JzgqMoXpjzU7e1RoFVa6ExYTj3cwQgdkRaejKQS0ukfr1CN2Po78C7Fi34EABIQiNlQ==
X-Received: by 2002:a17:907:3c91:b0:b73:6b24:14a0 with SMTP id a640c23a62f3a-b7d236670demr231854966b.18.1765553570929;
        Fri, 12 Dec 2025 07:32:50 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:22 +0200
Subject: [PATCH v3 05/12] perf evsel: Add a helper to get the value of a
 config field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-5-aa36a4846776@linaro.org>
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
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073254_610996_BD7F08E7 
X-CRM114-Status: GOOD (  21.80  )
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

This will be used by aux PMUs to read an already written value for
configuring their events and for also testing.

Its helper pmu_format_unpack() does the opposite of the existing
pmu_format_value() so rename that one to pmu_format_pack() so it's clear
how they are related.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.h |  2 ++
 tools/perf/util/pmu.c   | 77 ++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index a08130ff2e47a887b19f6c47bfa9f51e0c40d226..092904a61ec7afdc59253f9b78a9fe8b7cb5bfa7 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -575,6 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
 	((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
 
 u64 evsel__bitfield_swap_branch_flags(u64 value);
+int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
+			  const char *config_name, u64 *val);
 void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val);
 
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 514cba91f5d99b399d2d6a1e350971660c54a9fc..ef7358ad1fb955f29f2e68b3d0ce711754e4d67c 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -144,8 +144,8 @@ struct perf_pmu_format {
 };
 
 static int pmu_aliases_parse(struct perf_pmu *pmu);
-static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
-			     bool zero);
+static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v,
+			    bool zero);
 static struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
 					       const char *name);
 
@@ -1377,6 +1377,61 @@ bool evsel__is_aux_event(const struct evsel *evsel)
 	return pmu && pmu->auxtrace;
 }
 
+/*
+ * Unpacks a raw config[n] value using the sparse bitfield that defines a
+ * format attr. For example "config1:1,6-7,44" defines a 4 bit value across non
+ * contiguous bits and this function returns those 4 bits as a value.
+ */
+static u64 pmu_format_unpack(u64 format, u64 config_val)
+{
+	int val_bit = 0;
+	u64 res = 0;
+	int fmt_bit;
+
+	for_each_set_bit(fmt_bit, &format, PERF_PMU_FORMAT_BITS) {
+		if (test_bit(fmt_bit, &config_val))
+			res |= BIT_ULL(val_bit);
+
+		val_bit++;
+	}
+	return res;
+}
+
+int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
+			  const char *config_name, u64 *val)
+{
+	struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
+	u64 bits = perf_pmu__format_bits(pmu, config_name);
+
+	if (!format || !bits) {
+		pr_err("Unknown/empty format name: %s\n", config_name);
+		*val = 0;
+		return -EINVAL;
+	}
+
+	switch (format->value) {
+	case PERF_PMU_FORMAT_VALUE_CONFIG:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG1:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config1);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG2:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config2);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG3:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config3);
+		return 0;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		*val = pmu_format_unpack(bits, evsel->core.attr.config4);
+		return 0;
+	default:
+		pr_err("Unknown format value: %d\n", format->value);
+		*val = 0;
+		return -EINVAL;
+	}
+}
+
 /*
  * Set @config_name to @val as long as the user hasn't already set or cleared it
  * by passing a config term on the command line.
@@ -1432,7 +1487,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 		return;
 
 	/* Otherwise replace it */
-	pmu_format_value(&bits, val, vp, /*zero=*/true);
+	pmu_format_pack(&bits, val, vp, /*zero=*/true);
 }
 
 static struct perf_pmu_format *
@@ -1477,8 +1532,8 @@ int perf_pmu__format_type(struct perf_pmu *pmu, const char *name)
  * Sets value based on the format definition (format parameter)
  * and unformatted value (value parameter).
  */
-static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
-			     bool zero)
+static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v,
+			    bool zero)
 {
 	unsigned long fbit, vbit;
 
@@ -1595,23 +1650,23 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 		switch (term->type_term) {
 		case PARSE_EVENTS__TERM_TYPE_CONFIG:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config1, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config1, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config2, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config2, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config3, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config3, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
-			pmu_format_value(bits, term->val.num, &attr->config4, zero);
+			pmu_format_pack(bits, term->val.num, &attr->config4, zero);
 			break;
 		case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
@@ -1749,7 +1804,7 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 		 */
 	}
 
-	pmu_format_value(format->bits, val, vp, zero);
+	pmu_format_pack(format->bits, val, vp, zero);
 	return 0;
 }
 

-- 
2.34.1


