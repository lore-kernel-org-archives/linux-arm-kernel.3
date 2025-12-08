Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92712D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOIYYaELVWTJuyOlfjACt8LftXuc+RvaZVZxn3iQ/Mc=; b=S7pZFYHGG8tSZfeAR7lkT0gIhO
	Zjm59Kw1ec9hfc4JoWp8k8uGbKRieunfg6Okkfnw3sjvZhLT2VmHrtpNlgWKQhSnGpGubKRM4mlwf
	CcXsqP7IQy+4Nms5/WBmXYSfHP5WUKyblCZh0nG2OFnzGOmZct/XNqXhlq1a5NuOKwqepF+mzyXD2
	MFvbdqgw6A2LUETOCa9L6FkBsP0CdGPCRFJP7vVWQ/wJmf1VO2M75ELrvNkLZmEXl2AJ9yubzEdps
	ek6ckw30u9IixrxZ27czUYjCp3y8y5XKKcPImmze7q43Q2sWw+ExW6Y5NMPVHCERbk6botvF+v3+W
	PZCdN5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9G-0000000DBBR-2fTm;
	Mon, 08 Dec 2025 14:23:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9D-0000000DB7C-0Kqw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47774d3536dso42814075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203809; x=1765808609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOIYYaELVWTJuyOlfjACt8LftXuc+RvaZVZxn3iQ/Mc=;
        b=eAvDATZ19gOexpjEShGO/O/EQG1SnANQEjGFBDzjXygneu/rmrldAVpcRixzoGW7w4
         8O19JL2NA9nrBGAjwYBFxifCErURIo1dR2tX1LTUHkDeS47T5STkuMCsj/P9aM/5jxFX
         ZxgSy0NXmz3gEJTNALAVJ8bNMAjXGdl7s9KPDWRUF1SpMFfAsoRoif9GhHMRkoetoXsM
         Vp2cZw4cjv16vVQVx7L0NFwHBqM23HX63bzSEGzgM6o+7r+vhESmdtiqZXiyYyxhx3Cf
         oADXnIzf5zfhsB/UM52KbQCDs7W3DyGXoQFxJrwCRx+dUx4vqHjd3HOERXbnbkrZiXSz
         k4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203809; x=1765808609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOIYYaELVWTJuyOlfjACt8LftXuc+RvaZVZxn3iQ/Mc=;
        b=Mf53erouYz6FrcIA+aCCZeeQDKXA+t5PCBv45w72kRl2PKqs08BmYwtGUtNjfEfxlt
         Ul5L2NuwdTv1A8eaT5Xq9axVeuw+dQqgHpGFuM+A2yj82EyGGPd1p4coN85Dz2zDJYwP
         BU9WkJhrlhyrHDVvjdhCLpMKP3nus4s/cz7CI3TWwHW8mHsxeO7oXqNBfit2zWe9FYbF
         VTptyK/B0ljMxJAyNdzcgqonlex7P2SuflIV5yK7Nml8j5tZOvgcSU3xCntkbITsOms2
         MPrQ6WjelS97fwgDz0OlxQrlTNx19+S2juf5gF/oaqF0ZnA1Ii8NVCY1GOuKCandyxEP
         +DRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJCDISx6fO7AzQ8HADSUoR8SfbMKxhK9zM4599owOtpuiK1UxnP/c3jWjV1vD7PNWfpq3FuB+DRQ7Dfqgew3Ua@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Q+BnBbd+fNP+3yh0PVz2/pHi9ldZrIvdoPxORcwJMIanLn2p
	svbqTY1Jnb3qNqN8h61ngBqUg+mYo/yPDDzk4bCLfQDPCfREkoJsQKKFmS/NyB1XahAgu7uYFq7
	0p5ul
X-Gm-Gg: ASbGncsCsKbfMNjV6lHqYSGFN6vAr5rU+3TVwbWgIoBCYIsar/AjA8FfyYs7+jcIs/6
	LLr5lLjmkahLo1syHgBSLUqAD3p6wATIb96KoYh58/hcxTXx2cdxsNi7x+vY24NbxI2svw6vwa3
	vzvoSRvGolbuc+2opDNauLdrmTf8xgcsOYtHx+upN18GTfzR7hE3zinThZ0gaOtfAAnxtTfsFD1
	hTAm3/huAWCHbFXekEaW1ovMf6XI9pl6ScmeEbLslxLuleza/Eg3/TUF+DczhEVozDlsEPmEuSM
	i0VpGxndgWCNYp0zH1Usm1u5VOaVIM/nT4K+MGdlUnBemZTSk8Qa9fwOwHuHsPFok1wdtqaoq9a
	h0zsInr+/00Do8xvXR9QJ9x3jt4y3s0L3H/QGiDi1ci/AYYNEvsx3PjTEekmUaamfyWRhuq5Zvk
	nD79mxUYrKNZkiYOK9FmWb
X-Google-Smtp-Source: AGHT+IEiiKIAKZltC2nX6+7tYL9Tdb7Gn5KWFk1rr5OgzmQFNmbmqB60aAPM6H1XwO1G4r9HgabKPQ==
X-Received: by 2002:a05:600c:a11b:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-4792eb5e5b9mr134591805e9.11.1765203809123;
        Mon, 08 Dec 2025 06:23:29 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Dec 2025 14:22:12 +0000
Subject: [PATCH v2 09/12] perf cs-etm: Don't use hard coded config bits
 when setting up ETMCR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-james-perf-config-bits-v2-9-4ac0281993b0@linaro.org>
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
X-CRM114-CacheID: sfid-20251208_062331_170221_30A0E5EC 
X-CRM114-Status: GOOD (  19.33  )
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
index 22c6272e8c36..a5135b743e6f 100644
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


