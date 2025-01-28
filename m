Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1557EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6U8xZqyjao8QAwlfpahdSahI9u3EBcxYiljZLY35B4=; b=0Vn+i1IRbKAdWZWEyM1Q7wS0BF
	pGXuggyb3p2D2tVMNcoog8lUw2IhNIBjXbdwiRAh9ByXLCe+mIrkErUFeb5HVNfp9HNqNOof3vvAh
	fCu5Phnb8BNy7QRhfubuUzSZ0tGFIGQKcWN2vY6fyIaXWFS9wcM+jFvz1K0YnBYUzOgID/hhmybv2
	Ou7jpOzARn2HxoNe0OTkPeV+9PfNygDmBWJcCccuJndOGpHWaHMG3SOyQsxTv17ojPWQxDx7Jnrfz
	TQRHtf7aAt8X99PyawHvifiahDbtj7FeMqLFmI2DZc49c7Cb2G8JW14SmpqGWBWsYmqAu7PfhJtGJ
	jvczw0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdzt-000000048xU-46av;
	Tue, 28 Jan 2025 05:18:49 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhu-000000044hq-0wSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:17 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so8867258a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 21:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040414; x=1738645214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6U8xZqyjao8QAwlfpahdSahI9u3EBcxYiljZLY35B4=;
        b=wZ7uzwmGevafDIU+wKAf9+g8q6nbgZ+x7p8G0Zspro4KD8se8PPqZayXqy9Ybibg0R
         vSKgmKmmbT+yt3uJNIxGj14VE0le/Y8D4qo1FVotL9ZzJJh0BXErXIQWP9LJCEDg1Nzo
         5azGrmY+OVoEMkEX9MxRsDyMVtxWsm2oEVtutS+drgNs+SZ0C+HpI13vkChGLp1GEaYe
         NBtWr7mMLQpKb3xHsb9pwADRrYRa0UvEEq/nVrVX8sJDABqksSdCf7qdjOm6X+IRPH2a
         ruC7QU4dOdup66zofBmPyu91cKSG/fx1NplxRbKKUgQ42ULy0BBW/2RtUy9yhNi1ewB5
         bT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040414; x=1738645214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6U8xZqyjao8QAwlfpahdSahI9u3EBcxYiljZLY35B4=;
        b=RAFWF/I3SdSH0C59i+yJqX42/mTirv5tTeFWe/LFysT4MQd7R3T6cchFw9LSxB0tb1
         ZPDhGm7/a0L/2M1MJgHeoPHwyJNyy9yplW8dGW/1J+7E1iB9dpkbKjLztrg1dmAbUKzD
         /wYLySVKMOTD3hD7V3/MBdn98DFm60NBE6j9BrlvE/lHyprZKbHISwLjewdiRhQnyeWI
         ddM9MGXi4SisKENVEke2Zm6cEuT7dR1TzFqjrUdK1UUtwXKuqg9105AcXynf13tcRHrc
         YlKbypZFiXdgnLSxRBkoO+xge9TVz5QyBiCBAbxc0RMRVrAN6adLn6hDqm9SJ4nyZ7j1
         Mqig==
X-Forwarded-Encrypted: i=1; AJvYcCVgG3/3LWAo6d7AUplOjEAkqMbTse44kuw70WoXIfXqMHhTIsq1DbM9qRY1Xv5SpsEHEBIQYvfRxExrQ/SvlUR+@lists.infradead.org
X-Gm-Message-State: AOJu0YwBp71sQ0NdeIFHT8qdSU8g18MWJv18vG2budTk8a+LKrhuQEWp
	Lvbxqaz86OP2QghcZviRkOnLQp9W0CQGNt2BP32cUnoyFjvc7RbtiS4NorbtXMY=
X-Gm-Gg: ASbGncssvlw5qP3TzTbsRWw033erK5/CDBcUS6cPxspZeGGJDX3JnkJVofVg8EQMuR+
	RVmbiLn3/HO8ikBm2S//w6B5m6nySer5iTfYWE5XIjpNL6daDHPVsqtMHKzW7J77oiU0ir1tX0t
	lvYOzfnOzYVanX31zSb+fyLNMrm5Ora4KJpMb5Jw74ZIBKkn2j6pDi+8V/D4MjOxBeVV9AEFi2C
	d0GMIQplsaESx+QzU6ktixC8IHDvEKqNzLyeNFdbT8uVC4pF4dKagSk/jSWLzecrsRi68U1mSH8
	YaPr9DwYCoU75cwVkVab2KPCgfCp
X-Google-Smtp-Source: AGHT+IFgdohYqccPp8BM6+1NKCY6Ks2M+aFjD71kBC5/Uka5+FjgMiLBaROCKnbBuozTYd+KOO+EXw==
X-Received: by 2002:a17:90b:524b:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f782c9846fmr65179131a91.15.1738040413684;
        Mon, 27 Jan 2025 21:00:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:56 -0800
Subject: [PATCH v3 15/21] RISC-V: perf: Skip PMU SBI extension when not
 implemented
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-15-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210014_303996_704342BE 
X-CRM114-Status: GOOD (  19.14  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 49 +++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index e075d0d15221..52d927576c9b 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -410,18 +410,22 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	}
 }
 
-static void rvpmu_sbi_check_std_events(struct work_struct *work)
+static void rvpmu_check_std_events(struct work_struct *work)
 {
-	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
-		rvpmu_sbi_check_event(&pmu_hw_event_map[i]);
-
-	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
-		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++)
-			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
-				rvpmu_sbi_check_event(&pmu_cache_event_map[i][j][k]);
+	if (riscv_pmu_sbi_available()) {
+		for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
+			rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
+
+		for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
+			for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
+				for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
+					rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+	} else {
+		DO_ONCE_LITE_IF(1, pr_err, "Boot time config matching not required for smcdeleg\n");
+	}
 }
 
-static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
+static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
 
 static ssize_t rvpmu_format_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
@@ -549,6 +553,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 
 	cflags = rvpmu_sbi_get_filter_flags(event);
 
+	if (!riscv_pmu_sbi_available())
+		return -ENOENT;
+
 	/*
 	 * In legacy mode, we have to force the fixed counters for those events
 	 * but not in the user access mode as we want to use the other counters
@@ -562,10 +569,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
 			ctr_mask = BIT(CSR_INSTRET - CSR_CYCLE);
 		}
-	}
-
-	if (pmu_sbi_is_fw_event(event) && cdeleg_available)
+	} else if (pmu_sbi_is_fw_event(event) && cdeleg_available) {
 		ctr_mask = firmware_cmask;
+	}
 
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
@@ -871,7 +877,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
 		return val;
 	}
 
-	if (pmu_sbi_is_fw_event(event)) {
+	if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
 		if (ret.error)
@@ -1524,9 +1530,8 @@ static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
 	config1 = event->attr.config1;
 	if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
 		return rvpmu_cdeleg_event_map(event, econfig);
-	} else {
+	else
 		return rvpmu_sbi_event_map(event, econfig);
-	}
 }
 
 static int rvpmu_ctr_get_idx(struct perf_event *event)
@@ -1944,14 +1949,16 @@ static int __init rvpmu_devinit(void)
 	int ret;
 	struct platform_device *pdev;
 
-	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
-	    sbi_probe_extension(SBI_EXT_PMU)) {
-		static_branch_enable(&riscv_pmu_sbi_available);
-		sbi_available = true;
+	if (sbi_probe_extension(SBI_EXT_PMU)) {
+		if (sbi_spec_version >= sbi_mk_version(0, 3)) {
+			static_branch_enable(&riscv_pmu_sbi_available);
+			sbi_available = true;
+		}
+
+		if (sbi_spec_version >= sbi_mk_version(2, 0))
+			sbi_v2_available = true;
 	}
 
-	if (sbi_spec_version >= sbi_mk_version(2, 0))
-		sbi_v2_available = true;
 	/*
 	 * We need all three extensions to be present to access the counters
 	 * in S-mode via Supervisor Counter delegation.

-- 
2.34.1


