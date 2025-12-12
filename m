Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F11FD49238
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40w1+RpiFWn7cLTaBFnZfKV4QslzhNGDu3cnJiEGNGY=; b=i3iqL5TDkb/1hYL5W2g2j9vV+s
	8sJfRFpelenDSl+VtPAH2hcmyAQkzamsEctIHQ4hsyuUhMCxEC4BHosKGOBYMyMJPmVPK/KgUOlTb
	5vWWuRhy8lMTpBjbNzD69L61u5nfSLgou7v/7q6ZH5Zn/YkI5ZzBUlCmFwc27OrH3oVWfptX/G0F+
	0XWqePVS4vBMgXkPBom/ranDceBE6Opxpp02m2RCkZKdVjLP9+SBI7LM0HSzTrAfdnzvCQdSFGeXo
	JlgBAVP5s9HRutBE+zNd3EQXuwidfJJ9NIKCJp1/jg3kj4BoM3LxlqZmr1OtPH3QyNUFy56EzDSWP
	JQn+rsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58v-00000000jSz-3OUP;
	Fri, 12 Dec 2025 15:33:17 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58m-00000000jGh-1BV1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:33:12 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b75c7cb722aso271486666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553586; x=1766158386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40w1+RpiFWn7cLTaBFnZfKV4QslzhNGDu3cnJiEGNGY=;
        b=lupkXEwoohXSLN4GSR0S+wnQfJ2kray4n8G/AvtTlVj2fVPwI9LfpAlT7wF4+XcWEX
         B5ogyKKdfGJZf+w4pJTsNhrr8fkS+78nK9sS6wjNo6PGsO6exM4HRO5CHCiHEGCAZMVk
         z/5ZOof1UFeGd7aRtKmRDS1442Wl3LJ5wHKydfAcV9G32KRknVwpy1B6aIYofFllzvD1
         if0jRCjUZu2wMlGWB88Cd7Djh6gL0+KobOmvWFj8c90WA7lDxoOByWOmzETMvmmjgaK3
         jzvDWYkTJwZEFGSVXKaad3ZlLnBDKkwmpFYlVw29nK0tWuQaezrvrA2+E1zKOoqtA2Yq
         yEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553586; x=1766158386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=40w1+RpiFWn7cLTaBFnZfKV4QslzhNGDu3cnJiEGNGY=;
        b=nktWweds9cR7uRSmtOW0M3YsyPa+UhmmEZ7tXIhdMydjWgOXtLGZTxVcENCWCodLCT
         UhJXhe2BTbWE417/uLib/CssuiXqc3Puzy/uSklc2EVRoHen5TttbziCvEjuPlwVqO3X
         C9t7AGhmmZt5l9W5zBPMLIDXnId6UHs8L9lQv9Y9eHCu92Vp+UmfmryH3ApzpAyhgQZd
         6BMzDl4FNZ2s45JCDs/AxbOUXlbtMRev+XD/KdI9XjCTbDIsSzEaSkG5CRDrPZlFr/mq
         WuTgBYmAknPVCxrpi1SwZrDh8HCw934livQXBb40KynftehpuGpJWqRpVccQ+FMfjWC+
         YVNg==
X-Forwarded-Encrypted: i=1; AJvYcCWnQx9WG3zVIwZ9VY4QG2NrEsYG0OaEVKCu1PEj/kphIPs1AVwC3KmS77Lbj5CecG/UpwJjbA/wEK1t2oFYJA7v@lists.infradead.org
X-Gm-Message-State: AOJu0YynsT3c2qRtFbAYNQvmPtEdGHv+Ec9cRfBQ0a9UagtT52zItwRe
	ziP+CVntRRdWpmraaAFBZL30cwH90j+C7oIZOXoBrAL+QXlkey8xDeXL3sz/VKQ6aKUMwfCs0yj
	+B65CM29J3T9P
X-Gm-Gg: AY/fxX6A+5VHG2yhQZMtqGNKXeP19nxgW8Xd31rKqvdvBd2wI9DgYDP9gXhIFFcqEew
	yfJBdAeAUBJk29onMVJgn0U3BkDKcWgNpX+CwgmBBUwPenn8OBdiJGOOSwWZ9U8vZiX0hsr0VkX
	OdmnlinjjLGz262P8rrNnLaeUpv1KmT0qenwmHTbf7yZcwbL2tHrGAmmgVhbUNOVfUIainxXKHm
	tTg4AlMYP/bur+Kg8FIl//Ajle5d0LrBPlJgrDrHmqx0b0MiNLX5KJ/1Zmh4EkDd2oE+TRYa3dC
	XxWfIDnBVT/Y/ckWR9H8Mi0vUMywXUwAA6G4fxp0DKSa4ku/EKV7++n8HnToy8HsTo+efLI2yKU
	II+x9zamfgCSeNRT//p21ebY5HxZoomX0Kq/sEIsmtKZwOK1RRXyVXMov4T00KAHlwuAQe2q8t4
	/7fWfOnHw+B9n8aUSZTewI
X-Google-Smtp-Source: AGHT+IGymdzTOhM5jbelcMXcQ4KMKi4yIZCo10XakrCUVGapuKUtwGCZXcqj0byfMgnvUtzZVv51aQ==
X-Received: by 2002:a17:907:1ca1:b0:b76:bfa9:5ae7 with SMTP id a640c23a62f3a-b7d236bcc17mr232174966b.29.1765553586158;
        Fri, 12 Dec 2025 07:33:06 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:33:05 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:29 +0200
Subject: [PATCH v3 12/12] perf arm-spe: Don't hard code config attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-12-aa36a4846776@linaro.org>
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
X-CRM114-CacheID: sfid-20251212_073308_385336_1E174568 
X-CRM114-Status: GOOD (  12.34  )
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

Use the config attribute that's published by the driver instead of
hard coding "attr.config".

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index d5ec1408d0aec7e0d39a2cae7ad73694950ab67b..6c3dc97fde308cf4a1f289fab5101ead2765b140 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -256,7 +256,7 @@ static __u64 arm_spe_pmu__sample_period(const struct perf_pmu *arm_spe_pmu)
 
 static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
 {
-	u64 bit;
+	u64 pa_enable_bit;
 
 	evsel->core.attr.freq = 0;
 	evsel->core.attr.sample_period = arm_spe_pmu__sample_period(evsel->pmu);
@@ -288,9 +288,10 @@ static void arm_spe_setup_evsel(struct evsel *evsel, struct perf_cpu_map *cpus)
 	 * inform that the resulting output's SPE samples contain physical addresses
 	 * where applicable.
 	 */
-	bit = perf_pmu__format_bits(evsel->pmu, "pa_enable");
-	if (evsel->core.attr.config & bit)
-		evsel__set_sample_bit(evsel, PHYS_ADDR);
+
+	if (!evsel__get_config_val(evsel->pmu, evsel, "pa_enable", &pa_enable_bit))
+		if (pa_enable_bit)
+			evsel__set_sample_bit(evsel, PHYS_ADDR);
 }
 
 static int arm_spe_setup_aux_buffer(struct record_opts *opts)
@@ -397,6 +398,7 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
 	bool discard = false;
 	int err;
+	u64 discard_bit;
 
 	sper->evlist = evlist;
 
@@ -425,9 +427,8 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 	evlist__for_each_entry_safe(evlist, tmp, evsel) {
 		if (evsel__is_aux_event(evsel)) {
 			arm_spe_setup_evsel(evsel, cpus);
-			if (evsel->core.attr.config &
-			    perf_pmu__format_bits(evsel->pmu, "discard"))
-				discard = true;
+			if (!evsel__get_config_val(evsel->pmu, evsel, "discard", &discard_bit))
+				discard = !!discard_bit;
 		}
 	}
 

-- 
2.34.1


