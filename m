Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FA3D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpxmoGZlCGWci4RYJQsukYp/h5kR1+QCzzjmaZQmdKI=; b=0zFJhO4j5Ct/M4sMxozJ+B2UdI
	ViG/Ugd2LpXmi/OhEXjnr8WBCyUuh9eGt0amqBTZZlqhuLlJcyGaYAUe0LVMi9mvI16HZ3PdXh4Nk
	7fXaeUVY9XKqRrFc00TIIKbIPtt365rhBvAv5MCtCsFPpFIEgkNMOPgfmXi9RDdj/Kb40gdRYTvKX
	KdzSMjTFqmSiNSBC+524oMz1QcLwur16kQvFTSUwxKg42fQEhZPM5Br+0mX394XYQ4c+Bt2z59pan
	m/jmEBSSPd7wV0TZZgay4WQ4MbvkSPbfJscUm4FY2MNXmHt7tnUrPzgRG1EIFG52tMcWMY7vVmPQZ
	k41r+n3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yD-00000004HzY-2pIx;
	Mon, 01 Dec 2025 16:41:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yB-00000004Hxd-1Bo3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso49520935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607305; x=1765212105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpxmoGZlCGWci4RYJQsukYp/h5kR1+QCzzjmaZQmdKI=;
        b=PHMUl62SS0SZ0orZ83yYHoCW/4oOU69SpKON2Y9foNEioisgz4mkVO4v8w4E3QxIJ7
         yqpjvHWt2qPTpbPeBYfaNo8iR+aYk/3tyjnmHri4a02NSnQQwZyNmAsdYmDyJbWwsFr+
         FBp/BorPwjIiMevvgu2kd60k0GI8y5Aq5e/qCr+ltpLLTYpcNtfOTWubmiQAIs+xd4wq
         eeMc1vcAGtp0J553wtGX27JwjKLiluKB9ccovFTYSttMXbhIuhs6OiMryheYfFegQf+A
         88hOmEJtRrenRhni6jR5kuWODVsACXdVPLdaN5T6N8ZHfyYrRhfvKayV2rZjNZc0Xkqj
         eKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607305; x=1765212105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cpxmoGZlCGWci4RYJQsukYp/h5kR1+QCzzjmaZQmdKI=;
        b=NiAMicIXpCy7BF68G3r56Exe87hqaVW5OZwPBncUw+cS+i0B3wm6P4lscysc9o0SK6
         6SnbJex1Hr+sBZ50hDR0ItpdiIs7ACpsq34mc7iw1bKKvzxrNAx0YIBIhUHzjwJ0A5XH
         jF0MHkGPpfzaPREDutWhDNDgwEkopgakssMgJUPNj7hUzAmCdWwvCoMaUZ3a7qPoCw+k
         QyvbTKYIu7i7lAcnBT1owNHoxZjKWzF+fH0aXoAoTJ8Oau6n0WbaBpGNMlmxUwJZidjk
         WU/aeNARLsngJdX2Uk586TIlP/J4RgsQQ3HqaKesT77dL41iNV2tGnvlQNjvhiNXm8fb
         4byg==
X-Forwarded-Encrypted: i=1; AJvYcCXbarGwjbU77Q5A1p0bI7Jt5XmLljAgu5dLVVXA0ZtPK1pb9IccPI3Qida9ucwaoq4BINFljJuXyK2qlry/u8cI@lists.infradead.org
X-Gm-Message-State: AOJu0YziyIEDs46Zv9Y556Flxv22yo7g3gDo6PDQwGDvOsBDlN5EKztH
	bfJTCibLBrKJvi8f5FxONRCJDphHlA6k8kSpp7f+5Um9dSU+IkUhxvzI7qIZXpF9pm4=
X-Gm-Gg: ASbGncukw4N9tlZCcASmP+4kNf4gE+jnxvYW5HlPbbYC4bjv+fuZPM0c7JnNJyBIb5s
	BBvqnMP+Dfm+rEHUQvRij2EcdElAqROuD1Ue6xzHflG68jM+9wBmqchXokLesKgRCVmYHIsANVT
	wHrFMGP8124n5BUAPa+jIwVygp4wULXp6K9GndsZ5lFxACUUhOctfJE6hacv8h4nxiqMgUcHK3U
	KB7heh5rOq2r/STigEvtOnzshwF4KF+Kr0FpprYicbhNJQ3+FKrJknBR/wo8tlEjKeAI5uXTTka
	6RUeGxZFUMuvSMiEycxlSQSTjSW7uCJpf0ei8nv17Q3KDeVfXdsg6KXffebdYjhcRPzUMiUwRvl
	ZzDP/H6ce9hoENfF0gaV5u5ct3EP7U0nL1vv1kgphZ9QC6EeofE1AB7p7kZi3rDVcOJNt6H+462
	cccKP+CiWv1KSeBEl/oa1j
X-Google-Smtp-Source: AGHT+IFv850C8awUZtGHTOiLNICfiiJUYFGeJOYwfQRd2+Nt5FLiP4oGJKVYYX9fX1k/MFpwo7/ZRA==
X-Received: by 2002:a05:600c:1ca4:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-477c10c92d8mr469875015e9.7.1764607305455;
        Mon, 01 Dec 2025 08:41:45 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Dec 2025 16:41:05 +0000
Subject: [PATCH 2/7] perf tools: apply evsel__set_config_if_unset() to all
 config fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-james-perf-config-bits-v1-2-22ecbbf8007c@linaro.org>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
In-Reply-To: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
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
X-CRM114-CacheID: sfid-20251201_084147_428594_875C40D5 
X-CRM114-Status: GOOD (  20.00  )
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
 tools/perf/util/pmu.c | 60 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 7a7db31be70d..c8968cddc0a9 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/list.h>
+#include <linux/bitfield.h>
 #include <linux/compiler.h>
 #include <linux/string.h>
 #include <linux/zalloc.h>
@@ -1371,6 +1372,18 @@ bool evsel__is_aux_event(const struct evsel *evsel)
 	return pmu && pmu->auxtrace;
 }
 
+static struct perf_pmu_format *
+pmu_find_format(const struct list_head *formats, const char *name)
+{
+	struct perf_pmu_format *format;
+
+	list_for_each_entry(format, formats, list)
+		if (!strcmp(format->name, name))
+			return format;
+
+	return NULL;
+}
+
 /*
  * Set @config_name to @val as long as the user hasn't already set or cleared it
  * by passing a config term on the command line.
@@ -1379,12 +1392,39 @@ bool evsel__is_aux_event(const struct evsel *evsel)
  * the bit pattern. It is shifted into position by this function, so to set
  * something to true, pass 1 for val rather than a pre shifted value.
  */
-#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
 void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val)
 {
 	u64 user_bits = 0, bits;
-	struct evsel_config_term *term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
+	struct evsel_config_term *term;
+	struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
+	__u64 *vp;
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
@@ -1396,20 +1436,8 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 		return;
 
 	/* Otherwise replace it */
-	evsel->core.attr.config &= ~bits;
-	evsel->core.attr.config |= field_prep(bits, val);
-}
-
-static struct perf_pmu_format *
-pmu_find_format(const struct list_head *formats, const char *name)
-{
-	struct perf_pmu_format *format;
-
-	list_for_each_entry(format, formats, list)
-		if (!strcmp(format->name, name))
-			return format;
-
-	return NULL;
+	*vp &= ~bits;
+	*vp |= FIELD_PREP(bits, val);
 }
 
 __u64 perf_pmu__format_bits(struct perf_pmu *pmu, const char *name)

-- 
2.34.1


