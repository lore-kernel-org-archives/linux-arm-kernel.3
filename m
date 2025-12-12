Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D783BD59D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pzt6Jr/+wkfmociJhlECu3e99FFKHyiFhWTKLOnLQI0=; b=Qkif6+5CMJsJzqTHCfNiH3rdGo
	KiYri4IZ51e7lwjp0doOYvpQktfFD55GuFjIKPZeFT3YAeknzolb2FKG3WtbV6t4rMrA7pFvvcYBn
	nmEdu1Kg4I7SHtCl2xP2gPeWjTopBLy7Vc2JutLKih/4rquNu77Y0aY1qpR8TZLbC/1SjgOuj9SXZ
	4eqlrYlAwidvHmnNI0WGuT6dkDKIEwPz0Y5PW5Q8SqwXZZKmXh2dJ/4zjA/ZPUI9qjUaR7UhatYNN
	5Mbdb/5GITh03MGzdh/ODdH66SgpDzKXtxpkA/PKA/YwrHWzTDbaiHXVZYN3XtTsW8v5wJPMWff9w
	sXDsa4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58n-00000000jJv-1ScH;
	Fri, 12 Dec 2025 15:33:09 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58g-00000000jAu-310T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:33:06 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-649820b4b3aso2043862a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553580; x=1766158380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pzt6Jr/+wkfmociJhlECu3e99FFKHyiFhWTKLOnLQI0=;
        b=f76ulbYrdY1HS2VdeI6XrXxdxxI6jGCIOMoJcHGzm2PnmdzRiGKQmSME4MROL4nqSi
         K/DJeF2p/JBeEMtt77zh5nQ9qzJ7ibPQ3pkk3xRl/XqgoWgB0ATo4Y+wvZD9GzEeP18T
         c5VsQ1xkav+LGnzD4nZdtOV9G+1UZ1PmyWL8VJP6pd8V2VqpXqErwDcYl4W2B0vwVYkZ
         DuWeRIxA7emOpQmRMNAzUUgXlPSqi5Xl2AxxNhag0IiZCm8hJ8C6047ObnjcUI0iWuha
         jDvm+czaf/xfX1chfWA6XBW50s25XqQlOC023oPNTIcLESF5ReCkwCaDInAbXhZq6W0S
         eW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553580; x=1766158380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pzt6Jr/+wkfmociJhlECu3e99FFKHyiFhWTKLOnLQI0=;
        b=JvWcjaPgcvXTIzzLn3vxZt/Iy8zj7b9W9EfAUaLbyTAVik7K/g56TLp2kwvKjWyjAf
         c4ZTAiM4+Y7msaCFwgLqAVfm88e5G7a1kKBXToYXmvPqeDP1+8ESurAZgrfjLIHAjbkf
         Gu2YIYP+iHg5x0ugVQGS7i2VoldKv2YCR4oFW4NNEU6YVM7HCGizsGPR931YUhdXw8EF
         CXnUMPiRJj4eWXu85Ztgzs58RGBK3LNuXu4qhx56XxHhtB+gufwzUJmgDheWMFKEGkpD
         NDk0B9WAZ9W/ppe6i3Mx5TFKHk7bEZIbHHUh/WLOXeAsXns51+NXmc+aEqTfK+MGnn5a
         EkZg==
X-Forwarded-Encrypted: i=1; AJvYcCWl976fvCoEHFFI41xW2D+JqDm4TqvmeY8OxACfn/2uTjnjTUz9udU54GSHRSk5XWLjmWJcWBviaHg3XvEmJBK9@lists.infradead.org
X-Gm-Message-State: AOJu0YwEf0tZdEVz/hoTSMZndfqVtEeub+QPme2D2qaF1qxnvcRhds2w
	3sXOhNnpsy0f1P4CWqsTuY55njyrJppkkxCBzVLM57WHF7qJBDPBKe70XE1daptQLOo=
X-Gm-Gg: AY/fxX7Up6vBXxCRNcmAp9Zx8oJ95bHCADOWejpn5R8AWIQl6yduhGdfqSSr/i7UqcY
	6QNmvSxjav8x47CHt8I0XN/u2bHkv20+0UAsrjP83fsVG5rz4Bjp/qhCqhnH/eoEUnm+pS3ecfR
	MN2W+YYnxC2HfvKR5miUembYDHD5ISw3TjJLlFJgnz/SIf/bk0vYj/Ukk/fCo8Ojpkw89L2zPEv
	PpcWSq3tpTvadjz3gvd3pshLobTvTcC6PsJS7FGSCRzNHyIefBNJmo15g6egw+q7G6+niVLfy4V
	5Zlelp8qFDTxVRmvSEb77YOtXQbegg7WQucz6DL/wFSN68lyZnx3bVw5/9sgnrIh1O7+68MNqhw
	yqJ0XzoPqbOpL12OYgapeI94ZVZ0RkUsec0kbuO2mgLkg4k7gQdLAxPBPlb+LHveTNikgKaO7aX
	eLrY2PXeVeNKcsDFmsTqjo
X-Google-Smtp-Source: AGHT+IHuJrYzbGSy3G76dO6PcCNRHA+ZNmNldDx24ULUjiT5Wo9EMki68zi3Oygn9G+PH2eBroytyA==
X-Received: by 2002:a05:6402:35ca:b0:640:9993:3cb8 with SMTP id 4fb4d7f45d1cf-6499b16e779mr2529095a12.5.1765553580465;
        Fri, 12 Dec 2025 07:33:00 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:33:00 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:26 +0200
Subject: [PATCH v3 09/12] perf cs-etm: Don't use hard coded config bits
 when setting up ETMCR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-9-aa36a4846776@linaro.org>
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
X-CRM114-CacheID: sfid-20251212_073305_437636_EB2737BE 
X-CRM114-Status: GOOD (  19.31  )
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

Perf only looks at attr.config when determining what was programmed into
ETMCR. These bits could theoretically be in any of the config fields.
Add a generic helper to find the value of any named format field in any
config field and then use it to get the attributes relevant to ETMCR.

The kernel will also stop publishing the ETMCR register bits in a header
[1] so preempt that by defining them here.

Move field_prep() to util.h so we can define it along side field_get().
Unfortunately FIELD_PREP() and FIELD_GET() from the kernel can't be used
as they require the mask to be a compile time constant.

[1]: https://lore.kernel.org/linux-arm-kernel/20251128-james-cs-syncfreq-v8-10-4d319764cc58@linaro.org/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 22c6272e8c367e5671809771b841c5babe2d5282..a5135b743e6f18789026323ea75b2a78d6495d73 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -68,6 +68,12 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+
+/* ETMv3 ETMCR register bits */
+#define ETMCR_CYC_ACC		BIT(12)
+#define ETMCR_TIMESTAMP_EN	BIT(28)
+#define ETMCR_RETURN_STACK	BIT(29)
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -487,6 +493,33 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	return err;
 }
 
+static u64 cs_etm_synth_etmcr(struct auxtrace_record *itr)
+{
+	struct cs_etm_recording *ptr =
+		container_of(itr, struct cs_etm_recording, itr);
+	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
+	struct evsel *evsel = cs_etm_get_evsel(ptr->evlist, cs_etm_pmu);
+	u64 etmcr = 0;
+	u64 val;
+
+	if (!evsel)
+		return 0;
+
+	/*
+	 * Synthesize what the kernel programmed into ETMCR based on
+	 * what options the event was opened with. This doesn't have to be
+	 * complete or 100% accurate, not all bits used by OpenCSD anyway.
+	 */
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "cycacc", &val) && val)
+		etmcr |= ETMCR_CYC_ACC;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val) && val)
+		etmcr |= ETMCR_TIMESTAMP_EN;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "retstack", &val) && val)
+		etmcr |= ETMCR_RETURN_STACK;
+
+	return etmcr;
+}
+
 static u64 cs_etm_get_config(struct auxtrace_record *itr)
 {
 	struct cs_etm_recording *ptr =
@@ -746,7 +779,7 @@ static void cs_etm_get_metadata(struct perf_cpu cpu, u32 *offset,
 	case CS_ETMV3:
 		magic = __perf_cs_etmv3_magic;
 		/* Get configuration register */
-		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_get_config(itr);
+		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_synth_etmcr(itr);
 		/* traceID set to legacy value in case new perf running on old system */
 		info->priv[*offset + CS_ETM_ETMTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 		/* Get read-only information from sysFS */

-- 
2.34.1


