Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77123C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GuTH66a7om+hKPzIAaumTbnyUI8t1CBRcmWmMpd7G0=; b=lqp7KEVuqse7wvQsX+LEyC/Jmu
	6FhZeoYskBvtoexVr32+w9cFXCn/ZAcJFrc6Jx0JOptTFIvP++9CTMsGhanToo1K2UVlQARpLfOa3
	XQ4+Z+dFJGvIHZuHhYk6VEUdpzIrSM/jNl35bndDbpTAxqH3BovFh/kCE7NyKc9OXVOG8Dr+Du633
	7e+jEiDxm80Efw4gW6Zc6sHhlS/OjOeN6s6JDb/LltayYJJyaZ/tkhdwxQXJM0bMDbtaOxHkP/rag
	FqQoxoRYaOJ7Fth5P4oh+x4U1D/xnQVU2g2d2j1vw+jRZXUqNuv/HezizQ8VvhJ6vzBbXw6iURRcc
	eZhS/3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFey-00000007MRh-39yL;
	Fri, 07 Aug 2026 08:10:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFex-00000007MO5-3csV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4GuTH66a7om+hKPzIAaumTbnyUI8t1CBRcmWmMpd7G0=; b=BHydpbYqIP+N1GOGvaWtK5i6Qc
	q71gb6GohLMZzx6JBhUQKnwcRXF26eGWRUUUeyChrV4spuvHz2Wr/3qnX/K6mLVtItu5yUFJjG4g9
	7s85zQEE7+NitRwXF6EcIrkwksf8oBwf4VnKPPwgI6rGVXNg4U7jJDg3UWAY/rukZr8KPEY9eLBJ0
	NeB9m52hhGoPbfYGltLNBqWhrPhrd3nCMIqgVa3F+TR+KjKyEYEThbOdix8L1Uwk/Ey/L7HLDXZu+
	UvC83BKL1nq1cvkckOtOMa767HB+5e1AfXa1bhOovAhMD5SePLvbldVLT5UTYYWJymRjfLRS/EnfF
	TrgjPxhg==;
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFer-0000000CAtn-3waW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:10:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4GuTH66a7om+hKPzIAaumTbnyUI8t1CBRcmWmMpd7G0=;
	b=fBbqefKDfroq66VgGYz2OkcvJTEVJKlPBRTz49dqIJgqc52uE9tYKuWPXXK32UmvJDo3A9
	eriOzHrT+UuQVS2iEuZdfG3RV/hgoqOIvhm21JDJTjMJbLs8QxtQREfJP5I0Zia7wgL5DM
	4+2BNUmr57/p7ZG3bppWjKteSgNtTC8=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:10 -0700
Subject: [PATCH v9 15/20] RISC-V: perf: Skip PMU SBI extension when not
 implemented
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-15-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091026_156141_E8B24273 
X-CRM114-Status: GOOD (  15.83  )
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

From: Charlie Jenkins <charlie@rivosinc.com>

When the PMU SBI extension is not implemented, sbi_v2_available should
not be set to true. The SBI implementation for counter config matching
and firmware counter read  should also be skipped when the SBI extension
is not implemented.

Signed-off-by: Atish Patra <atishp@meta.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 55 ++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index fd4bf8804c9a..f0b8b6eff2ea 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -493,27 +493,32 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	}
 }
 
-static void rvpmu_sbi_check_std_events(struct work_struct *work)
+static void rvpmu_check_std_events(struct work_struct *work)
 {
 	int ret;
 
-	if (sbi_v3_available) {
-		ret = pmu_sbi_check_event_info();
-		if (ret)
-			pr_err("pmu_sbi_check_event_info failed with error %d\n", ret);
-		return;
-	}
+	if (riscv_pmu_sbi_available()) {
+		if (sbi_v3_available) {
+			ret = pmu_sbi_check_event_info();
+			if (ret)
+				pr_err("pmu_sbi_check_event_info failed with error %d\n", ret);
+			return;
+		}
 
-	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
-		rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
+		for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
+			rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
 
-	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
-		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
-			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
-				rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+		for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
+			for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
+				for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
+					rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+	} else {
+		DO_ONCE_LITE_IF(1, pr_info,
+				"Boot time config matching not required for smcdeleg\n");
+	}
 }
 
-static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
+static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
 
 static ssize_t rvpmu_format_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
@@ -712,6 +717,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 
 	cflags = rvpmu_sbi_get_filter_flags(event);
 
+	if (!riscv_pmu_sbi_available())
+		return -ENOENT;
+
 	/*
 	 * In legacy mode, we have to force the fixed counters for those events
 	 * but not in the user access mode as we want to use the other counters
@@ -999,7 +1007,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
 		return val;
 	}
 
-	if (pmu_sbi_is_fw_event(event)) {
+	if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
 		if (ret.error)
@@ -2132,12 +2140,16 @@ static int __init rvpmu_devinit(void)
 	int ret;
 	struct platform_device *pdev;
 
-	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
-	    sbi_probe_extension(SBI_EXT_PMU))
-		static_branch_enable(&riscv_pmu_sbi_available);
+	if (sbi_probe_extension(SBI_EXT_PMU)) {
+		if (sbi_spec_version >= sbi_mk_version(0, 3)) {
+			static_branch_enable(&riscv_pmu_sbi_available);
+			if (sbi_spec_version >= sbi_mk_version(2, 0))
+				sbi_v2_available = true;
+			if (sbi_spec_version >= sbi_mk_version(3, 0))
+				sbi_v3_available = true;
+		}
+	}
 
-	if (sbi_spec_version >= sbi_mk_version(2, 0))
-		sbi_v2_available = true;
 	/*
 	 * We need all three extensions to be present to access the counters
 	 * in S-mode via Supervisor Counter delegation.
@@ -2152,9 +2164,6 @@ static int __init rvpmu_devinit(void)
 	if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_available_boot()))
 		return 0;
 
-	if (sbi_spec_version >= sbi_mk_version(3, 0))
-		sbi_v3_available = true;
-
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      rvpmu_starting_cpu, rvpmu_dying_cpu);

-- 
2.53.0-Meta


