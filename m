Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD64D37E5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFM04/cBVS3JjjnsemivS8mMLgjxey36ij8/+pN2RLY=; b=fct0qmYuepbM+8LYxytw/Ay5va
	lZCS4M1A9IkdEqdJUHzPwrVrKEIXMqVzr8YrAC3zEB2lnTF2L1GY2jBFTb4mZR45hBIHHpCMU/iwR
	UjzAL6LhfZ9nU62wo8gCo6Hf6CtYd6QCNMStfXUbwGUDd4b6YmaqIK2LexYLGE0f1aGMX/UjYZvuF
	/pydPUww3gkIEMCrC3WMTpG475231F1lh1vkC5Xr+HTuTSeg9NSa2zNJD8oX2SJxu+lll3xB1sbw5
	hu/QVkDJuSte6e+m965sOhsVO+E5LMzGYcAVTpQaHagBn3tdVa9TWfrp3Iw87j4rsuRCmPZlmQRGe
	vsZ9bHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fs-00000009oEB-1Yyt;
	Wed, 14 Jan 2026 15:57:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fi-00000009o42-0zDM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso8395555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406265; x=1769011065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFM04/cBVS3JjjnsemivS8mMLgjxey36ij8/+pN2RLY=;
        b=Gbp3x8tJ5ZlIFeIu/CacjD8tkaVNOmO35HmRkddHUXtcRi16+p7VIJWIzJfD8UJ4HY
         blz77hTnBxDgLq2Ql7B380/47SFiK4THMdXGGlrkkuEzoRJkZS9d4a2lNXhxI8EIQjgs
         49BrNbk/9wTzf26NLmcpJ23VFj6KV063D3HoOnn+3aZRYGWxGYAQUY0RPgnh1Uz2HFwC
         bIlF0HtVDIgH+Pinfa9zTH0gqi2N2DGHC5E7g6xbZQ2+Rp4QTVjao4ghRtAufO5Echsd
         P5sbAtjdyGTdjUnlZhNU19i2gwCIEu/KRQGGFq8ePMhZUMIQjOyf6zVUu0fquVR5ncHA
         d/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406265; x=1769011065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFM04/cBVS3JjjnsemivS8mMLgjxey36ij8/+pN2RLY=;
        b=fF1uU/yiA408YIbXKWi1towIy8k3qy/krd7RQ9vwTdcfe2Ts2By3BHkE7/+MFc5tuy
         kRBuiJZXloKkoSBz7eDHqZblKQYYGwMuRaauXFq/O3uQkj5iwe12BAfFZVWdSEtf8InT
         eknMg+nRHKmIyK+VPEG1RPolYi4wPvlsB89LpcfpTQUOBmA30tv4p374vWIvrLvfgl5M
         HLm7tPM5j8806h9NAKVKBmUsdrYCqVuR5zXsRvFNnB/c5BzVym0CpjeiHwzkbNIvFtBr
         usO1Ng84Xak9APEe32Hyvhvrby2FJ2AEsvghXRNfxsGAzTGRZ3nnni5xky5RfqgxxhSr
         BlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+KZJvrKAGdI1b/46oy1olDFcT0JqnXCsRSX3f3RcoTN45kqKmnsOz7Q9jST6C1R21fGSqh6qTj1ApSenvvZC@lists.infradead.org
X-Gm-Message-State: AOJu0YxpFqEskAlBdSAQzRX0xbT9r3oFi6J65kkKINA6Sv8m6Qro7QsE
	cAygt7/LKOFwuASf2HA52NAXyvAygBOuN3wxNWWl8EmW/f7u3SnLoH/50gnT+3hk+yM=
X-Gm-Gg: AY/fxX60moJX0v34OmhXAZ1d6V4zv+V7WfsC1nMZlcpzLDOnaYH+OtK4+RBZWYlDHcR
	y0lWVH8HFo9rWeKGMGB4Aw8HnImFoNRRvwY69Xp3piVNpEWjI9EXOIXRKk3rvCHQyQv5/G0MADV
	cztBAwWfTwkWDhzgBOdrlvpqi2/ZMsDw0fc2XA2bCU0gmk25owc4YSvJrV4NenTFNIFdHPS2+R4
	24g4dw/OmbPPJ+dfMSR8vL4ijXaI3ZVIpcmW+pIJVik7MD7c/l0YmeDSdvky1DiI5P5bch70bvM
	iIaBiILm5VRIl54K1bwMM+ViTkdmdLoWz3CO4fOWMcdCz22jZB8n+ty0tgkkPkTYxniO2SHb2GO
	DVcYhmgV8I0cs451Rp+5pIvvY0XjzIQ9Fn1xL/Y+2K9fqY/3/G1VILPhotwjwnsKapRKisUTan5
	KM3O/wbu8w3kcXinsM+vTS
X-Received: by 2002:a05:600c:34cd:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47ee32e94acmr41043225e9.1.1768406264600;
        Wed, 14 Jan 2026 07:57:44 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:18 +0000
Subject: [PATCH v5 06/14] perf evsel: apply evsel__set_config_if_unset() to
 all config fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-6-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075746_296589_2E0B4447 
X-CRM114-Status: GOOD (  15.22  )
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

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/evsel.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 27f4b5212dc6..3162bfc0ccfe 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1335,6 +1335,36 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 	struct perf_pmu_format *format = pmu_find_format(&evsel->pmu->format,
 							 config_name);
 	int fbit;
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
 
 	if (!format)
 		return;
@@ -1348,7 +1378,7 @@ void evsel__set_config_if_unset(struct evsel *evsel, const char *config_name,
 			return;
 
 	/* Otherwise replace it */
-	pmu_format_value(format->bits, val, &evsel->core.attr.config, /*zero=*/true);
+	pmu_format_value(format->bits, val, vp, /*zero=*/true);
 }
 
 void __weak arch_evsel__set_sample_weight(struct evsel *evsel)

-- 
2.34.1


