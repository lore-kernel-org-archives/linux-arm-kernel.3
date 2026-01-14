Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A23DD37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIFLeU/rZDWgQfxqeduMgDTr6BnNNm0nr5ZzvbheRLg=; b=Szzif2bNCeag7dMoRdhE8m6FaF
	feS4qlNePKiaZFLFH/bgx4/+jBa+0VlmvfkcIoSPqeDBhwExfpcPbPSyN4JdiBXdxWFgvk2Si9Rwx
	Ia5Z8X9edXZMP+WlAAXVXeVsrA32mi0fGCUly+BD2oGJvxgCSYNRMfLH1Jf5Dvr1RK1YnTbVuPlha
	gAMOcaXWDufqjVXWTDDCtZkqAHMSC/4RzaGyvgu2JiGdfMZqX9wiQsIVQk9WfYnReDWR2O3xlR5ku
	UB43y3u8ys83dmxdCBQpjCivCzY0ci+/YwYf4nkeTwoLmx3XfJu3nYn2AO/dEB7NjlLUyhh5JPLJA
	NvOyBCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fz-00000009oN2-0Ab0;
	Wed, 14 Jan 2026 15:58:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fo-00000009oAe-40Bb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so30025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406271; x=1769011071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIFLeU/rZDWgQfxqeduMgDTr6BnNNm0nr5ZzvbheRLg=;
        b=TJ4CX716ohSCZjqOj+anz/P3PZvGrpHJEfLof2ZGAB27k6pwa0JS+W/K6qjhcodrRl
         ZYln9/Pu3nr5MLtoxu3mTkpqfavwFRZq50AFSPU3rfOlfCcIRuOQhAkUv9DOet9Pe14E
         wQvISlC1OQL/oYVjM4eLxL6sNBBs7YSsvBzgWP61bUiyDSDZXDn0gPo15g3/t+91KYqh
         rJ3fO1CJf6as6OQS7dJddQUUh3q/nbjtNh+B08L6Qys2UKf1vdXm2O9yaLPd+8Q4ZUiT
         PMPJY2gAcPyvN265iSM92ieZgqSXGLJ7qFd3FRbt7M0E3Gb7CBO/WJSQ5kfD0Ps8ZjP+
         75hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406271; x=1769011071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIFLeU/rZDWgQfxqeduMgDTr6BnNNm0nr5ZzvbheRLg=;
        b=sI0X5eRi1YpXGZwvWXEOJSvp5M+6ijzGIuiZYsZagJhUrkm5hpKgyTNlzUvzCWq8KA
         qKFHwsaMQIx4vh3EvUzdJRUfoetqPoQSyWrcN3SIta1hGW2c4aOT/q6pnP+KPBQj3TTS
         hi8bD8rc6LC+K56z6vUxhQbgwQF0XzvlNFVwE1hX56H888S7O6dd7zFbj7RRpacUBFad
         enyIiheeMnQj2yDHQlyIaUvAwWFz/RGWDl4oJa+/K4Rd7CgH+oEQMmZgovJJVugeHjKi
         BIf2tF12mNPqFe/hXooPbL1cvgaJwAUmLYnkoKsZDA2buJi18RACTORy1SoiljKdsns2
         NTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzKS9RXFrkl9zEITzSLvhU4YydYpWfgrl7QxnxJGZ4Nuxng/Otyas5EGPizqaSx/k1lmW0uUhIfdiyZ6b7mn+P@lists.infradead.org
X-Gm-Message-State: AOJu0YzlKJSUfXHXkb35TJiGsiLyXhtEVEV9Y7BbOiJa6UozZNtZEDdG
	JNcL5H+L/7YKQJZrRnWLJqXSJ6S09dt7JS4mtN2ZJV9qxmGFPi18H7de3cNTHBRl+y0=
X-Gm-Gg: AY/fxX4uJm17P+wgnbvcTyVWwOgM+N5ToJdB65uj8xIes/WAvxX/tlTEXP6VEzxiM17
	5R1rLZHSf99ctnOXa0yHiRJen7Tm5o63DIRlabUkpq/ecELL2P1qTvdbkvx2k0BQo5alUipsQIX
	yM0qXM+mzOMTf5v68mfuthZMTRYPks63keJ/2UrsVZXCk0Gq9gsfEPK1olTj3LWCOXjotjQWrAI
	T9MtcRXWbxrqDzIyIApgrHCT5AvIiUKFTf616m4Dm6pDFM0B/NqGKZeRfzDLarNEyeq/S8Z1ILY
	yGcGnIJqjY+yeGsSeUD8cznkulo/KCFsOkiAcJfuLZJj0Bkr8jF/c2A7IZbg6F0sll9w4+qhTiz
	gW4Ih7JgDh90COo4474wDGetJzDTsSgoAtrUf155Ek923aT0Z9mJI97U9Wty+nobJcuP8Ys68tD
	oc5tve5W7ylES+j4OQCTdo
X-Received: by 2002:a05:600c:35c6:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-47ee3323ccbmr41291455e9.4.1768406271314;
        Wed, 14 Jan 2026 07:57:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:23 +0000
Subject: [PATCH v5 11/14] perf cs-etm: Don't use hard coded config bits
 when setting up ETMCR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-11-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075753_026729_150E1A32 
X-CRM114-Status: GOOD (  19.39  )
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

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index a49753f0d20f..f535027ce862 100644
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
@@ -484,6 +490,33 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
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
+	if (!evsel__get_config_val(evsel, "cycacc", &val) && val)
+		etmcr |= ETMCR_CYC_ACC;
+	if (!evsel__get_config_val(evsel, "timestamp", &val) && val)
+		etmcr |= ETMCR_TIMESTAMP_EN;
+	if (!evsel__get_config_val(evsel, "retstack", &val) && val)
+		etmcr |= ETMCR_RETURN_STACK;
+
+	return etmcr;
+}
+
 static u64 cs_etm_get_config(struct auxtrace_record *itr)
 {
 	struct cs_etm_recording *ptr =
@@ -743,7 +776,7 @@ static void cs_etm_get_metadata(struct perf_cpu cpu, u32 *offset,
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


