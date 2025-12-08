Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8068BD3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo3Ukb8C7ZJ/8SCaXAl1O3xmDhdyoGsW4g7zVBrDJgU=; b=lm4V3K2Ysqe7NtSGnX2x0GlUCi
	olvJt5VwwklwScj/fCis6zWynAriO/mfLIsirwDM7TbpIr5fhDGr7QHATQB2ebO7U81vFpCj0laly
	qxAy7sDVlWuiy9TpnqIaeY2NGqbjJydNVnVDbMbzbESAjsHFidL5O/DpLDRK8yx6R2I/drZnSUG+T
	6myNOIrKH3xK8nrzYl0QKcFPm8BQERDjTamfD/uNLetstA7V12V3H9wUKunJ62LJIPyvUHxdGIwU0
	cRue24h1LzN/Qsugi4m/iQjUc2A6deCuGDsPEBJsvCst2/CgAHM6ExBSv68Gn06zD47CDFQbkswZ5
	YrzKnGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9B-0000000DB6n-1Srk;
	Mon, 08 Dec 2025 14:23:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc93-0000000DB2X-3nFd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so59287755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203800; x=1765808600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fo3Ukb8C7ZJ/8SCaXAl1O3xmDhdyoGsW4g7zVBrDJgU=;
        b=c6B0qXAMrVkuOgYa7gVcapxly3my+6BCfpuU+6XT1U+rdVBe+8+j7BTfogOX6woG1r
         oIE97+DcNqfndJUegDI6rvJyGIwABhwqFFGFRSdfkDmg5o2Td2TVY2lB2A4HjEI+Vt79
         1CQ+vlEukzcrBexKceiccNEfv8ntGymsT/YYwUjb6IYjwld/fm2orErOTGxgqdXc3JAa
         hwFmiIWH+2+0G2lOIbnNBSB+betbZ48dOSOORedfKfAMM6REK1CqdBZktTuXe4Wgv+uX
         PwD5mJX45BuCrFRw6hHFRuXavoTb6X0MQdgSIzHFeETZ98rMjPg8HqEWKnWmPB3C9wGQ
         ByJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203800; x=1765808600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fo3Ukb8C7ZJ/8SCaXAl1O3xmDhdyoGsW4g7zVBrDJgU=;
        b=Q60TVIGzqCwAuUBrzJ0kf8U6Tl5CzPbQ9J8f5z4iVxoStpVrOVMRukgts91NOB32kV
         ecSb2zqoAplLbT7C861Ve+FizMfwbW2MS5owkhGpbXssyluD8/ieT7Digv5m38YRKV/E
         KeSiXUz5LqvBbdA1lAgJITjSra6NSEVfdUFAFCXCsFryk5KERU9ZEBdeWtlQjaow5Zqu
         Ctt0yLmTZxSqki93+wS+g+XWVrkKtO1w79z8UBVrjJm7J2s2v1Y/9JTxVKYWpBfdtnHW
         my0PjtNRAPeI2MJeIJ//ioKJaIwQBjhh/hJePkCKWz8URGSONcDlpIxzlU6kjFWTQItL
         pZeA==
X-Forwarded-Encrypted: i=1; AJvYcCUboJEjFZRZBHCYwmNSs3MTfJrWuG8L7ekcpAm6+s1ZZgwzspfwjYsXipKvcjb2nW262u/HbbMmXA/wRl3aJoMI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4gVLlxC170yoeQiWwysOtUJU3SDvr1CGLd9IAxifkkPHavmvv
	NK3uRtP1vrBNZi+LHKW7mmZD5NBM6i5e/8GI+0DoKGGoIBcx0ozkukhgw7JnrN2e8hIr7lPKELm
	6xKwv
X-Gm-Gg: ASbGncsO+S1Z2iGO26GiUs7+BhrFfO+no5R/qmoFMgGsZcWO8Hh5sFjN8c+TySCLNnT
	Iv7BGsKWgDcfGaaay5QcBRhq5EnTv7X69/q9GT9py8MxRZXi9G3TOtf76FvUSyLlCJcTkb5UN3c
	tekjCwh3ZsK//rmK5sJppU86QelVD+23Ek+5HeLCcWjB2lO3FFQW7jMkOl+R80D0es4m3dgvBJf
	9UnrI6DxAK0dekzssh/PiU+gY68JCi+aNyDqrIM/EwhZ8RR+gC0oJXHlVIGdyT/3kgMlwAA5d+c
	mFydeQ30gBODlksnQiLcJ/aYmDKvVyREPcJBzhrh6unI9H+v2Eh1pcvVQjG9t4W2IKy2/DZti7R
	2jCHcTBJ3/iouM900HlF+j5v1uvBiYMUSyR6GrGnZEoMqmTM6RETjIEMXkGcNYQiIDAduA4xhdW
	/EYV3gpy/LkudifUH3qnQh
X-Google-Smtp-Source: AGHT+IEWXXN+QPhKpdMYQbMuezg4ndaMdLlTrhbxsRoIEQiDGZKKfKzsw7aEJsV99BxsYe4l/srBZw==
X-Received: by 2002:a05:600c:35c1:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-47939dfa0f0mr92586695e9.9.1765203799977;
        Mon, 08 Dec 2025 06:23:19 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:05 +0000
Subject: [PATCH v2 02/12] perf evsel: Support sparse fields in
 evsel__set_config_if_unset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-2-4ac0281993b0@linaro.org>
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
X-CRM114-CacheID: sfid-20251208_062321_983431_6F1B5400 
X-CRM114-Status: GOOD (  13.56  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 956ea273c2c7..2c26c8d76bed 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -144,6 +144,8 @@ struct perf_pmu_format {
 };
 
 static int pmu_aliases_parse(struct perf_pmu *pmu);
+static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
+			     bool zero);
 
 static struct perf_pmu_format *perf_pmu__new_format(struct list_head *list, char *name)
 {
@@ -1381,7 +1383,6 @@ bool evsel__is_aux_event(const struct evsel *evsel)
  * the bit pattern. It is shifted into position by this function, so to set
  * something to true, pass 1 for val rather than a pre shifted value.
  */
-#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
 void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val)
 {
@@ -1398,8 +1399,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 		return;
 
 	/* Otherwise replace it */
-	evsel->core.attr.config &= ~bits;
-	evsel->core.attr.config |= field_prep(bits, val);
+	pmu_format_value(&bits, val, &evsel->core.attr.config, /*zero=*/true);
 }
 
 static struct perf_pmu_format *

-- 
2.34.1


