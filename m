Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A7ED3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRhf5LqtwI1BCs/MXxqcrvCOGauWve2lGZSZRvbtNrM=; b=DiTI10ELiehemiFEVRvMTTHG3E
	9dJs5AZUmFthDQczBtYapEmXmUn8zT9k6DJ4x8d0flQuSv5ZOV3/sjE18tcxFJMKdujb12jmZL1fA
	eEbLRdDZFD9uFCp8DN3xUrNS9O1iT5Z/QvwVGLaQefk9ehRmEaTg773LP8+y9zV30O3C6gOOS9UFx
	DxX4tu+bOKV2o1chxZbZ4VbPdAqBUya++N6WvaS6QdRkBN0yUwfFFNYI5LSJPvpaY34qDQcP8Ipcd
	l1CvmORz3Q0G1aguwCGZA+1cEV3HxOYiBrUB/hQezhedPXg1ot/VLekKBaWHK86qKOXAzSre7FZYK
	WEz/6ZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9C-0000000DB7i-0JAr;
	Mon, 08 Dec 2025 14:23:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc96-0000000DB3i-1kFX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso33860905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203803; x=1765808603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRhf5LqtwI1BCs/MXxqcrvCOGauWve2lGZSZRvbtNrM=;
        b=W8oK8Uwagq4h5n4OjWoHSlonxS48qVNpXnAjAFwxwZbvBSWeKQFcC/zH/1klFWibxg
         cI14vtY9OQJAkjRxKV+MvTWTtffa+iIGUFISl8WCg9DKYXNcB2s0zXrIQIFTrx2LAJgG
         kCHAJSZq7a2w7/LvA3otAvllw0ONNe8hXoGmaadO8jE+7q0yjBM77TKBEwVejW5aWqdn
         KxRALoIgWH3y96HUwWDKdGi+36NBuciTGtcx9vxwWj235Wnc9IxSsX5E8PHGWdhFQREq
         ybv7Mznv7YXdI+wp2HoOajKT0wvsQn2qLl1d5FKPm2tD3LnNOJirv2ZHdKWgkOAVI0ZP
         NBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203803; x=1765808603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZRhf5LqtwI1BCs/MXxqcrvCOGauWve2lGZSZRvbtNrM=;
        b=T+pYHtumQW3Z95D7b88U++zP9yMpEpYDMnLqWppb+jVbzl+fQI6bqqdtSJVNwQUYRq
         Emy6zhiCar+XZ1mOvrMDtrT06rTZVkvPmKacv2/eA6wg8YjL7viyUwCTx1rz/dwDyIjo
         2jpHA7xAmFAkaLnWNiwG5RQ4B6NGq2apaqoW3VTFJyqK5s/SZAojT9918ESUk/A/6Lhm
         kciK5r4Jr8A0WWrFoSi8L4GnI8ZUNLMPS6JARIQQVGi7XRhV40LxJXCGjR+vQbakRk21
         Ht1OnlzQ4rGFhLtKROgmXyet65OWhm8YSMbfXIzs542+9+bkhwjooBVxRJgZTwqEwR4l
         tA7w==
X-Forwarded-Encrypted: i=1; AJvYcCXXPOllEiI9WTwWDyHjhgHjuMTXDvrh502H/QdyCNoYiVLUUlPlk5x+hwmFJnf8r7XRxCGYM6PlZv/N91RRXT5w@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8lvhKvLcJPNIKkGdlEWw3epO2xtZCF1iK5vlI80nlDWRpDryI
	wcyLtDKnV6gd4D1HCG4qGIzDLsVvpe2Y+Ad0rBlZGlqyD/oT/VDjClIqg+hHgG3TjCNKZPaNo/6
	SDYyZ
X-Gm-Gg: ASbGncuRD0R8iUFxfEXTGEw7MupJX3QFy3awc+kW/twgKyinQOWvcIqUbvye+lgtD+O
	ty50djrxjzvN07uD5WLyGOQnKr4M9YqOnRBvonj9oWlVFsxOQEZyWItF48+1rg3mZ90KgJ98O4R
	TIxpYDh0H1GDd4okCPqNI1jJhGa80+x1cl3yht5pl5xNCmAtcQ4W40Swp6WdXtWt2fgIVbDlEWq
	IfePM/Wk3NuDLuYDZi7MX9O5+SKNBygH7C52xTwnw75ds/QcymjxwKYGbr4BalBXCo44CmX0rNO
	T9Jc5DsQsKHxSKtYhs5kfsrYnjkMfRdtuotqRCkxCDjT1i352Tuq6zufS+BaZC3Rt1QjI1BSsBp
	fA+NyvlkLmCFgUoZSsV4HgcQT8m8UitAH3a+nUiaYEWRw+k1wTF1ElQ4L/UgEofqWGaPwLzlVJ+
	cSen7x/qQ180PB1nRn0aYF
X-Google-Smtp-Source: AGHT+IEhpoMN4+zTETFkcztiEWYM4FtF59nv9AEONwYh8tAIN/5BaZy8msPhg0ncsD8sYg+q3JZCMw==
X-Received: by 2002:a05:600c:3514:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-47939deac5bmr91892805e9.7.1765203802717;
        Mon, 08 Dec 2025 06:23:22 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:07 +0000
Subject: [PATCH v2 04/12] perf evsel: apply evsel__set_config_if_unset() to
 all config fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-4-4ac0281993b0@linaro.org>
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
In-Reply-To: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_062325_641918_9615C258 
X-CRM114-Status: GOOD (  17.71  )
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
index e02f74d4020c..514cba91f5d9 100644
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


