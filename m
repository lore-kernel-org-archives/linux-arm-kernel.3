Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AA9D49238
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R0fqOMnWx/kXqG5KJ5IdcBa/s5Ujlxo3aE4ef72JzE=; b=tH2/vjcvXnPWPqjYfISP1cWWT+
	OJ4J5UqL0JzsRDscKpbVloNPldtaLPKbN43t5IR8OCY4QGSyGQjUF/0wiOYlp6j+DPAqO4WjX9vaJ
	BA3/SrY6B04lcZUyuU56j2mjSLWLZSg/mEtOpCRkMCv4T5oVZofBTa00dy0MhsyfWd1kKnfuCksZc
	jcaZ3Nu950hb9onJbQ8eI9M2l//S00qmnJJ8jvgEWCvrrfCSEYJb9cbqXbl5WM/GuD7HRb9XdmJs9
	bzfR6lAXFzaaqU/jsEsMCDqBNSSwvNcFgniVjE0eHreO7UGPjtQZ3DOVC2746FQP7sEmP6F9AGTw3
	Wv1sH/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58d-00000000jA6-18sC;
	Fri, 12 Dec 2025 15:32:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58V-00000000j4b-16Ra
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:32:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7a6e56193cso250071666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553569; x=1766158369; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9R0fqOMnWx/kXqG5KJ5IdcBa/s5Ujlxo3aE4ef72JzE=;
        b=HDB+J+NoXASd1v3gBQ20kD05D7Azd52eJekA0zfagiLt+BxW9z8xNw1t97NRSaZahu
         qzD+boOhnyIRfG3m4/2tdy4TUY1eSqpBHu2CNqp2bn6KgIiblLA2QA4dO+wbCa9yQid1
         PEnG8R3qKjDUi4bHHWOh69ObDeOjtyfzUoXWdqd2BnyjLMh0xcTH68UVtjeM6J1lUngk
         wZxut5K/0qSXWaXW4kYY9ElJax8RRjPDeNULP38cb8kjO7pnmwicOt+L5vLCW5bti0Tv
         98sxg18K9rzc3VeVqZe2zN8utfF9I+SYCKi9ePbLgjqBlbf8vhkevgr3v3afZbbkdYDc
         zxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553569; x=1766158369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9R0fqOMnWx/kXqG5KJ5IdcBa/s5Ujlxo3aE4ef72JzE=;
        b=W6mJXtqa0WXORSbXZ20nD5EeYB7HCBtB8H1hmCDuCk6hERXXo4ShLnUVnbPa2h+SGh
         4McJwwy/8Jixg75AiUzwAgXDkz2YZGs6faMpsJDcMlP8kEQPxr+fZ8CaMLHXRN8oBefH
         9TCUv/yKho1hUoFh2rZDDZOpC6zGse+QIjdbmoluBh/BrWN+F30520vFiUtUuwexK1gg
         m70/k+qAkq9Rk8ay7Y9KR7rtCBWZ3NnA3uwYJRvuibpnn/dg7IQphbeFG/q8LIqWUA/8
         cAdhAR0UKlPfUalaAiuDTWdk4K1Pb6V3yKgJ2oUp7MSNPSwfqQkYtsqygELtiQOhcsR6
         TXcg==
X-Forwarded-Encrypted: i=1; AJvYcCXDNqHcEeqKWZyuR/IjwtBwdlO2pHkEi3Rld6YZAWrDw/Lco8FcmCyqRITfrX6hEUAwSRHVobpbyfPakVk8G+Bs@lists.infradead.org
X-Gm-Message-State: AOJu0YyW1FaRat/S5FJTVTuycA6zfqA8EXb2khPMxaeIVRFZeMFwto0I
	TsRBo+69n1DEvmvt1onATPpc0NVijL2KUz6xGUbeDJRq4m8a3LONF2C73ELc+fEB3hA=
X-Gm-Gg: AY/fxX7KcMggoJVPYTD50NBMfs1mv5ZUCNfm250Hj7gjzw4M9OuSAm9bOvUGAtBtG5j
	DgapVKz2ZyRoKiVTO+/pd/VjTHGPyCcwXMcRXcEsFbdmk23Dsj45ggDYkHdn7F+8AiZLv8duymy
	H0GaizDbB6v9niwM2cc72ycxe1rhBlghaC2XtzzHhpaQyR736nEQ+GHKd/z+N8UQuvA2YT2MCmW
	LRMrIfIB4tThJ9bsE1TI4YShlI0brv6CfhkNmGQbD0/Ip73/8vrH5IX+9gZDuk8MIPSq1QwdwIM
	FaYmN3ExoebMzCHHDBsNBOlQglt3wDcbY5tQJTDCW52knAqP8VX497NYBNWymaKt3QoHByVrQwz
	PRa9hzv3ajT25lW6r63Vu+HveFZwDPJ6eIQDwzxGOSgOr/hAcEy7UDaOSSU6eMJ3okGDnFMRh1D
	h2HmxStWj492FoOWjugCrcNsLc3BkiLas=
X-Google-Smtp-Source: AGHT+IFbuckV0/lVSbpz/gLDBbP/OWExCz0AsI758ga/mOuq3N+WcR0TmjT9gy99TZcqWy5LGpaTmw==
X-Received: by 2002:a17:907:d29:b0:b7a:1bdd:3311 with SMTP id a640c23a62f3a-b7d23c5c413mr246282266b.62.1765553569104;
        Fri, 12 Dec 2025 07:32:49 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:21 +0200
Subject: [PATCH v3 04/12] perf evsel: apply evsel__set_config_if_unset() to
 all config fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-4-aa36a4846776@linaro.org>
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
X-CRM114-CacheID: sfid-20251212_073254_609152_A4951836 
X-CRM114-Status: GOOD (  17.67  )
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

Misleadingly, evsel__set_config_if_unset() only works with the config
field and not config1, config2, etc. This is fine at the moment because
all users of it happen to operate on bits that are in that config field.
Fix it before there are any new users of the function which operate on
bits in different config fields.

In theory it's also possible for a driver to move an existing bit to
another config field and this fixes that scenario too, although this
hasn't happened yet either.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/pmu.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index e02f74d4020c151082ecc434c29c0ec4c2c9b2c8..514cba91f5d99b399d2d6a1e350971660c54a9fc 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -146,6 +146,8 @@ struct perf_pmu_format {
 static int pmu_aliases_parse(struct perf_pmu *pmu);
 static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
 			     bool zero);
+static struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
+					       const char *name);
 
 static struct perf_pmu_format *perf_pmu__new_format(struct list_head *list, char *name)
 {
@@ -1387,7 +1389,38 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val)
 {
 	u64 user_bits = 0, bits;
-	struct evsel_config_term *term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
+	struct evsel_config_term *term;
+	struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
+	__u64 *vp;
+
+	if (!format)
+		return;
+
+	switch (format->value) {
+	case PERF_PMU_FORMAT_VALUE_CONFIG:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
+		vp = &evsel->core.attr.config;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG1:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG1);
+		vp = &evsel->core.attr.config1;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG2:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG2);
+		vp = &evsel->core.attr.config2;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG3:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG3);
+		vp = &evsel->core.attr.config3;
+		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		term = evsel__get_config_term(evsel, USR_CHG_CONFIG4);
+		vp = &evsel->core.attr.config4;
+		break;
+	default:
+		pr_err("Unknown format value: %d\n", format->value);
+		return;
+	}
 
 	if (term)
 		user_bits = term->val.cfg_chg;
@@ -1399,7 +1432,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 		return;
 
 	/* Otherwise replace it */
-	pmu_format_value(&bits, val, &evsel->core.attr.config, /*zero=*/true);
+	pmu_format_value(&bits, val, vp, /*zero=*/true);
 }
 
 static struct perf_pmu_format *

-- 
2.34.1


