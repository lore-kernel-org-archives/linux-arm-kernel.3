Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12635E674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIFLeU/rZDWgQfxqeduMgDTr6BnNNm0nr5ZzvbheRLg=; b=SM7jWMvEleGmVrUlWjxcOeNRo0
	A+zCrgVkjczT9QiYaOMtki5P1TGq6vFYCDk6d62Upb+1Ws4xnysjj492m/iwfdJO8SkxzKjYcHYb8
	0tm0l1DBeq2algLOSvCPx8FgIaHbpXgOEaeqj/KVbOt83+zeE+owFXwPNenabv1fbgqq22mVkd+WH
	AaMlXDjsdplxPLz2/RDs/pJRt9XFj75UEjfaPn1TBWQiciYtYGutN93DiDD353ZthCmdW/VnXYQnp
	IFKoOJYs1E4H4RuYgtU9VTZ6QS1UrMl70c047g5JZ6JVrWDiyzQLXbTv8CuTVWvsDEG4dPa9z6SQ+
	bJRfgcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcx-0000000DtzW-2LmS;
	Mon, 22 Dec 2025 15:15:15 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhci-0000000DtlN-4A8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:15:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so2064956f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416499; x=1767021299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIFLeU/rZDWgQfxqeduMgDTr6BnNNm0nr5ZzvbheRLg=;
        b=L3LLq7NdcKJNKa+cUkQrtBNRb1B13J/ekjf70DGp1LO6lyUZs8pFNE3dGo9wma9cK1
         SBphDNrx+wmdTlmCYHArLm3YHr08EUt59VYMLXvubnPokE3Adv0O7PfhHOR39T9WRst8
         NlrrAaq3y9nse4B3sVonAbjBmiXrdes+5DNdUX05u4dgIweWJFKJnLS3ZRRoeGu0eU3V
         8CSFKoXJH+T42GWw38Xj74pOn/N04sLzWGAUMcXb8K/mYWOrusVAoG8qLAu9tabqRkAD
         ttj774ZU3LSLUPnNPUnWPlxg3iKwXnblvL0iarUwdLGpa8QuqEjG5YrAGhZudCipKbZS
         Zibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416499; x=1767021299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIFLeU/rZDWgQfxqeduMgDTr6BnNNm0nr5ZzvbheRLg=;
        b=AexTDo5HOJeEluYhpIFOwAICEdFwRX2gZvJp/3IO+Pu/mzClqXF+GWyM4l33FCgXLM
         5Jy2E3qNIXb2yzeYZHbct6Nnt22HO0qoK0E592jE9PBrBwJV/h/NA1ZfNj3LgGgWbvwW
         zNg+TRoJ27ldcu1fvApbpr/yK2YXiK7jk6pIiHutuSTQAUTToxfkE0vxPy5RYmv/jxvj
         zxC12tCUX4UDF7UMPULzNt8MjWxgZtcU/xmApX6XPLTALwp4W+CF9ilivTHMY6vGB7XG
         xyyzl/G9mL3jW/NDq9yYjWM3S3+iyDLfiWJhXtVwd13NeAEejKdMuEMCZFlxjzlW3SEt
         WpMA==
X-Forwarded-Encrypted: i=1; AJvYcCXZisMRxNxxq2BUswRT3nD5gIMHylyVee5+DUfFNJZY0ju6T6SXYrVASX6Uthp21O0zP5Q0VMxbyXHhptulDNGk@lists.infradead.org
X-Gm-Message-State: AOJu0YxOUwM4+cJLdMsDQaZdWwVff1u8SOZkMjnRSOEEX5LCUDeShy8G
	sHNHbS+IwrwnydMy+k1+h+n7dBfWENdooerGb+xGegP1+nw0or5BiwSKYGn1IJSayow=
X-Gm-Gg: AY/fxX6APQI4TLaJ6NIah9e61WpIkZQykT2nwdzmWA9mzYI/hZCADo/kM7D2B9kZgHT
	vEmzZYaWJuh+75bN0FOVIej0J5bYMd2YdCzX6ozwpjHZSQMDtJCTMm789oA/iPcgr97bCcapL5u
	xWdPSND7nIpSCW2TyApfdVoIjR4i3v5/17Bd1u5vxdjiwAg2+0FWt7sG1mu1ieDmNPzkQO6XUqu
	nv1mvQrRWrKumxBbYhs7J51zKS/jZoLEHSOdLvyo1YH+Xv4YtGmI4+3o8B+PKxo9+2b9pD3Uy8z
	JYf97YaFHS1bXOLWqNszL5Zsv6X4asU4VikhgGIu5KI9tnHxm5bBBwmYyqoHt/ZRlcWQbafVZ29
	saqQt/aUWdfiFxYiDNcZhr+23RH7v5gcucQ1qzMyCu6lUrvqaBkUHmaK5GVCXxyxYhlo7vkL5OP
	qsE3sZKk1RuL7whqrUt1VZ
X-Google-Smtp-Source: AGHT+IFsoNIU0EBEL2Gy8nEZDRr2zOvkFn21BezY9JDZ5LUC88dlX4X1p9ulUl+LSAp548pvzltUbQ==
X-Received: by 2002:a05:6000:2387:b0:430:fdfc:7dde with SMTP id ffacd0b85a97d-4324e4fabe8mr11530837f8f.36.1766416498814;
        Mon, 22 Dec 2025 07:14:58 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:36 +0000
Subject: [PATCH v4 11/14] perf cs-etm: Don't use hard coded config bits
 when setting up ETMCR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-11-0608438186fc@linaro.org>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
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
X-CRM114-CacheID: sfid-20251222_071501_181308_270448D2 
X-CRM114-Status: GOOD (  19.72  )
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


