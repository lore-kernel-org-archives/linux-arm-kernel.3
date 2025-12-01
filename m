Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FD0D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCK5jvjqS1OJSbH7Q8M4qbQBHOcn0cDJFYSc0X1U4g8=; b=2rLdB3eZuWNwJiwpDSyj0IFYgL
	SYZgB9nvcwj4r3DerA4XoMGF4bX6P/os2ZSiiLXKELH4sae3aIGqrJ3lYXiIp4lFVHgTD4cHwpSzi
	Xkrgf5sm5n368Wmn5MNEtfxhC6ZTXho5VPBDr7UF6DdqqdRTcWAHmTJXVF7ManVqOD4gHOETB5x31
	CmhorTGrTHL1RNXiA2/HJYLmJfLdyuJAZwSQIHR5s21g0cOAb1J+f2lqjZ2+vA/ObXFJL9lnDbqGm
	J2/7iGSp9m6HzBeDDT+dmKmS93UMB18X4ThCUsghKrrnbWgKt84A09dXHZI+yH0weNUkX52XOfpSJ
	JmUx1upA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yH-00000004I44-3nd5;
	Mon, 01 Dec 2025 16:41:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yF-00000004I0j-3IVR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4775895d69cso19050715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607310; x=1765212110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCK5jvjqS1OJSbH7Q8M4qbQBHOcn0cDJFYSc0X1U4g8=;
        b=FPbn9hxKPXGXfhC8SgpaHZIn2HlJoywcNMRZL84kSxfUPVdLOEp2+WZr9j89a5ctYY
         v0eqJXm6v1yFwmz4Cs0EEBBPyQf1vxLX7XaKrhDuwMm1yXDOKCSECIbEMU7J3QaDW/4q
         QOrVWzddMHl/+fY0YNq62TZurk1YOnKewSkFUujq8clOZ5lmhGhvzC35eUeJ0B9UuTuB
         KnN9IKPbWQl8LOOFBEicyEaT6gcUo/eFMCz7YSZSTeCC3k+3k0dhLNwUmMaV0Z1o2QfB
         FN+qi16pHvRzgMkIoRtlLRh3/vu1/6r45CgyBc9D4Ai6Y1XTJ5Uv470+WC4czlydaxp3
         VxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607310; x=1765212110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCK5jvjqS1OJSbH7Q8M4qbQBHOcn0cDJFYSc0X1U4g8=;
        b=BgRDMcybac5R7cbut9bkOxpE/phqFEaAlTIc9j0iVNA0+f4ah+POXrD5PsmPxcXHKQ
         pipGKwRKnCaO4ggoH/vAhyAywO2B5SJr6JHaHbNUxLHFRrOMp+xHQrSaFS3ercZ86HZL
         eTj84Kw0QekunW6ratkAaTMH5KaN1GYrRK9jDG8lWyDrbkNByKOFyooQIGqEwwccKEBu
         rEhFlRfTpEcWyxpl9R8vccOcFIMjWKU8W9oiBzcGtImYciR49Z4MeToJ27cHy/YAFgXq
         gujHizgO8IPOfvP9PuREfgRi7FJSN3bujkt9pJd1zZB6Pt7pv/hBcLte00UgzFVToz0D
         SG4w==
X-Forwarded-Encrypted: i=1; AJvYcCVzfiFAwHa36tbuhjGQZxUBF1A0/vyin8AzS3LAWmhO65r0DLSrLAdpo2/dXJw4CMJlXcxcqiuswhUvZ+81i5L/@lists.infradead.org
X-Gm-Message-State: AOJu0YylnawTXwrGyZrjuxs+CAEFxwINSpE1pcyDKLLUwppik/ewHxNT
	BHiafFWvP+6+kuAzZ8Hgq8wRb5bicNAhquLnZyXNkpKyR2oOjDIOrC0X1WG389M4wXA=
X-Gm-Gg: ASbGnctMmT9Q6ny62qz4e05XLrtaYposa4KLnpsKFpxR7jM1eb3SPPv48snkbG+bxGC
	dQULiDCnSMFBmA+X5jh2Lqkq3MLoN/tNHLnnRx0/q/yq37yq+Jb48GTvwzYFZRncR0BroA+9IWm
	R9t7RjF2vVH20/y1IpR5zjEk4hvDXh3XuTDmIhXd7QJd60SnTTIH3B2FybWNdOfjvR7N7P/8+GM
	V5gZ3hAT9qIWqd1RiiMh+pfQNq40Qc4vmA4L+o6iSDMi12zHwBJ10xbaWVqhX8ECjo4kSUA2YqL
	QFRqLjWdm3nFBaKJZHsCLmBRkij1HjGBy5jErSXFe78p7FZedzl/Kv0YVbZel1PI+Vu7IBIcNqK
	AaCRVRhzYavhUw8z5sGrv+K5mV5vj2906Zdn+uqx0nXEvDca4gNWLASy9aLquKQYLqPic+6IMB/
	7Za7hp7gmmx8cXXmCr5TA2
X-Google-Smtp-Source: AGHT+IEP/tNXfSvGkzJDnroSc7cg8nQooiX3N1v7Fw5uWyfNSqPrA6fMWwoGMhgB5DjA5qOUhENmxw==
X-Received: by 2002:a05:600c:1c82:b0:477:9c73:268b with SMTP id 5b1f17b1804b1-47904b2b36amr283793595e9.33.1764607309963;
        Mon, 01 Dec 2025 08:41:49 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Dec 2025 16:41:08 +0000
Subject: [PATCH 5/7] perf cs-etm: Don't use hard coded config bits when
 setting up TRCCONFIGR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-james-perf-config-bits-v1-5-22ecbbf8007c@linaro.org>
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
X-CRM114-CacheID: sfid-20251201_084151_860485_AB0F15F4 
X-CRM114-Status: GOOD (  19.59  )
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
TRCCONFIGR. These bits could theoretically be in any of the config
fields. Use the evsel__get_config_val() helper so it's agnostic to
which config field they are in.

The kernel will also stop publishing the TRCCONFIGR register bits in a
header [1] so preempt that by defining them here.

[1]: https://lore.kernel.org/linux-arm-kernel/20251128-james-cs-syncfreq-v8-10-4d319764cc58@linaro.org/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 79 +++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 45 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 414cafb21c98..51ca8fa66ef8 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -68,6 +68,14 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* ETMv4 CONFIGR register bits */
+#define TRCCONFIGR_BB		BIT(3)
+#define TRCCONFIGR_CCI		BIT(4)
+#define TRCCONFIGR_CID		BIT(6)
+#define TRCCONFIGR_VMID		BIT(7)
+#define TRCCONFIGR_TS		BIT(11)
+#define TRCCONFIGR_RS		BIT(12)
+#define TRCCONFIGR_VMIDOPT	BIT(15)
 
 /* ETMv3 ETMCR register bits */
 #define ETMCR_CYC_ACC		BIT(12)
@@ -520,56 +528,37 @@ static u64 cs_etm_guess_etmcr(struct auxtrace_record *itr)
 	return etmcr;
 }
 
-static u64 cs_etm_get_config(struct auxtrace_record *itr)
+static u64 cs_etmv4_guess_trcconfigr(struct auxtrace_record *itr)
 {
+	u64 trcconfigr = 0;
 	struct cs_etm_recording *ptr =
-			container_of(itr, struct cs_etm_recording, itr);
+		container_of(itr, struct cs_etm_recording, itr);
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
-	struct evlist *evlist = ptr->evlist;
-	struct evsel *evsel = cs_etm_get_evsel(evlist, cs_etm_pmu);
-
-	/*
-	 * Variable perf_event_attr::config is assigned to
-	 * ETMv3/PTM.  The bit fields have been made to match
-	 * the ETMv3.5 ETRMCR register specification.  See the
-	 * PMU_FORMAT_ATTR() declarations in
-	 * drivers/hwtracing/coresight/coresight-perf.c for
-	 * details.
-	 */
-	return evsel ? evsel->core.attr.config : 0;
-}
-
-#ifndef BIT
-#define BIT(N) (1UL << (N))
-#endif
+	struct evsel *evsel = cs_etm_get_evsel(ptr->evlist, cs_etm_pmu);
+	u64 val;
 
-static u64 cs_etmv4_get_config(struct auxtrace_record *itr)
-{
-	u64 config = 0;
-	u64 config_opts = 0;
+	if (!evsel)
+		return 0;
 
 	/*
-	 * The perf event variable config bits represent both
-	 * the command line options and register programming
-	 * bits in ETMv3/PTM. For ETMv4 we must remap options
-	 * to real bits
+	 * Roughly guess what the kernel programmed into TRCCONFIGR based on
+	 * what options the event was opened with. This doesn't have to be
+	 * complete or 100% accurate, not all bits used by OpenCSD anyway.
 	 */
-	config_opts = cs_etm_get_config(itr);
-	if (config_opts & BIT(ETM_OPT_CYCACC))
-		config |= BIT(ETM4_CFG_BIT_CYCACC);
-	if (config_opts & BIT(ETM_OPT_CTXTID))
-		config |= BIT(ETM4_CFG_BIT_CTXTID);
-	if (config_opts & BIT(ETM_OPT_TS))
-		config |= BIT(ETM4_CFG_BIT_TS);
-	if (config_opts & BIT(ETM_OPT_RETSTK))
-		config |= BIT(ETM4_CFG_BIT_RETSTK);
-	if (config_opts & BIT(ETM_OPT_CTXTID2))
-		config |= BIT(ETM4_CFG_BIT_VMID) |
-			  BIT(ETM4_CFG_BIT_VMID_OPT);
-	if (config_opts & BIT(ETM_OPT_BRANCH_BROADCAST))
-		config |= BIT(ETM4_CFG_BIT_BB);
-
-	return config;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "cycacc", &val) && val)
+		trcconfigr |= TRCCONFIGR_CCI;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &val) && val)
+		trcconfigr |= TRCCONFIGR_CID;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val) && val)
+		trcconfigr |= TRCCONFIGR_TS;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "retstack", &val) && val)
+		trcconfigr |= TRCCONFIGR_RS;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &val) && val)
+		trcconfigr |= TRCCONFIGR_VMID | TRCCONFIGR_VMIDOPT;
+	if (!evsel__get_config_val(cs_etm_pmu, evsel, "branch_broadcast", &val) && val)
+		trcconfigr |= TRCCONFIGR_BB;
+
+	return trcconfigr;
 }
 
 static size_t
@@ -691,7 +680,7 @@ static void cs_etm_save_etmv4_header(__u64 data[], struct auxtrace_record *itr,
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 
 	/* Get trace configuration register */
-	data[CS_ETMV4_TRCCONFIGR] = cs_etmv4_get_config(itr);
+	data[CS_ETMV4_TRCCONFIGR] = cs_etmv4_guess_trcconfigr(itr);
 	/* traceID set to legacy version, in case new perf running on older system */
 	data[CS_ETMV4_TRCTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 
@@ -723,7 +712,7 @@ static void cs_etm_save_ete_header(__u64 data[], struct auxtrace_record *itr, st
 	struct perf_pmu *cs_etm_pmu = ptr->cs_etm_pmu;
 
 	/* Get trace configuration register */
-	data[CS_ETE_TRCCONFIGR] = cs_etmv4_get_config(itr);
+	data[CS_ETE_TRCCONFIGR] = cs_etmv4_guess_trcconfigr(itr);
 	/* traceID set to legacy version, in case new perf running on older system */
 	data[CS_ETE_TRCTRACEIDR] = cs_etm_get_legacy_trace_id(cpu);
 

-- 
2.34.1


