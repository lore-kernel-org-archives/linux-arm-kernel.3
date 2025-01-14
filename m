Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565B5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5NzVVWM8qA9Fo1+GRIirXQzRfzq/r/+NUc9JNQjhEc=; b=pAkwns3rQCClIv/iYYy5K8F7ru
	ky1oe+UkTKaLMUHWcZ3+yfptcmofrcXZoGPnsOUNlLUUj/HxSYJ96mFvkrAxYe11t/cj37ecpCAqv
	xP3llro6+YGRupkcuDvg85EZ99FV1pNZ2mqnnfo4NV88EZbiRZPHg7gC2xdl87/ml422stWqWF3H3
	nIVARv7xOlnLKGeVWmjQLI69sAArwrHLLTWCUN14ORSDVA4R4kcqRuAd+sqS2BGXTqVjixnWtXCKM
	wx2dDy72a5e5N3DKI5bJI7wJ5BfQ5tMUP5t1aTQa6Lt0MBew+kQ+lpXFA7MRpCg034TYmdpGqTqWt
	U65xU2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqB8-0000000A54X-1g51;
	Tue, 14 Jan 2025 23:18:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprx-0000000A066-0ZEE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166651f752so136856585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895524; x=1737500324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5NzVVWM8qA9Fo1+GRIirXQzRfzq/r/+NUc9JNQjhEc=;
        b=wUBSBkPmiWUpIxQ/7ex4W187v9yOpQdceZhDR4w6tHc6rt8AORHoxs6lA5sgYnucS9
         PsFsBv7U9o8KszpqR0dTz3QxP51jq5XKCOHn6mbt5l9769HsvQTraAPXfs+YDSWAsHbD
         BCS0jL0DTsbVluK+gJaQKgpONuFlSoHVxFY3UpPMYjaZWcEeRyRk7XzL8If2J7ehDuUG
         7898u8irI3YV66Ia0TZsvjnCUBpjQyiB+ljwqWYfgEr/RKAqZjf1PqrDCaoFXxYjW0PG
         myO7gdpUPXCnX/kfOfg/vKdWEpO+Ot1FuN7fQRvUbKI1xh8Wcgk4hb46eEzkJOwMfyuX
         vJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895524; x=1737500324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5NzVVWM8qA9Fo1+GRIirXQzRfzq/r/+NUc9JNQjhEc=;
        b=PNoRFp9yeaDxJH2DIRg5kPVqOetSrRzDknUL83CAhhfXK2CVpBM5gAQTJMkxMFlzZA
         LYihvJHBxgpOP2nth9n5nCtY0kz1kNnNbg5A4lViHtq00yZQ1vHiSOPTbIK9Xo4kmbNX
         Ke9ddatizEUK9H2j/lZ0gZAeAC5vI6TiYfhZPHNF4MXxz1TYY928sO89d4Bh352JDn7J
         QnSuIz04oa9AtmKyCF2uIUaL1q3xqB7bmAXSBgNN/g2RX4tjxL/dCZuQeTzfN5rU7gtK
         q+xhkIvCaZ2xKDPQDobz9/t7SF9fTGLsVp3Q7FKZJM65b1dJjO3aswX5Vxr5bQj4EJT5
         2ksg==
X-Forwarded-Encrypted: i=1; AJvYcCWPUuPK0HofuBBGnIFGaIXg3Dr076m81OagEsVkNbR8LJdBldkcBM+IUN9jt9pCESk2lskXrOyONavjxhrEKyyr@lists.infradead.org
X-Gm-Message-State: AOJu0YyOHFDD8PuG3aZIdl2DOPxMT/yzgviB+mH7Nw5p07k2ItvRMKZM
	WhP3vuPc+CWV7raJoMhisBJZc2MhTQwf+RPq2Cgs3ZFu13cr5lQzBEXcZsXBbHY=
X-Gm-Gg: ASbGnct813BL9BrfbyYCqJQykWJhxXwolRYhcp9fuF7vkxQVML/0XhiT/AXPqbb3YPk
	gD66T3o5ij/Ow4eJitLKxRTL3BonqSQaQz8q+t6ujWEKnf7d49ShN7FH8lnSmRc51j9b16/hTrw
	wkfcZS16N0LZtcIMZOlhNkxuGXLDRrAR+Bc9wZP1BPd35asfkMDiv9PMI8ArvL9e86byDRnCrp3
	cjQhM4QAqxYInAFCesqFpn5Sqgnf0hlM8f2pRn1K77CCg4Ja3gBXWPGgmtM3xdKP/iNgQ==
X-Google-Smtp-Source: AGHT+IEMFajbox3otJ+OHxS2DGlG5iVgYY9Ppx0qRDeaLCpVzaKhI8pKM7MfO5qFetS73gaIgtP45A==
X-Received: by 2002:a17:903:32c3:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-21a83fe4f63mr405013495ad.41.1736895524581;
        Tue, 14 Jan 2025 14:58:44 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:44 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:40 -0800
Subject: [PATCH v2 15/21] RISC-V: perf: Skip PMU SBI extension when not
 implemented
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-15-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145845_212443_20F96E75 
X-CRM114-Status: GOOD (  18.36  )
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
 drivers/perf/riscv_pmu_dev.c | 46 ++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index c80f8ef79204..83e7d1f6b016 100644
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
@@ -1952,14 +1958,16 @@ static int __init rvpmu_devinit(void)
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


