Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314B0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nz8h60LGers/LCMxx/FZVBLZipiol25W5EeTvz9jgI=; b=oi4ClkLOcMRH6/eJQDtNJh8qSt
	KX6VOEWLdnyd6sHCLwF+ePAIaLFt8QfvkEpe4yZvll9u4WO0lh9w9wqL+fn5PHJNdbRsYag5jkpkH
	g2r0C2qnbNjUJ0Qv4FyppIh84cfCk7ZejBnUbCRZ/MmAmMX2E7fjqyVXqLeWHK3RHyUeChlNn3lVK
	5w4kSLCNk7l3Ure/vxxLKRbDmhnoRdEeM8E0yNoKf7xrdfrSqkFtkIY1ILux/xqT3qifsFPp6tEyD
	yvDvcj9LxzJipOCc45ruRbfMMMSYNCAEVb7K0P1sPgBhCZEsxvN4sfpBYbvAWD2RiDGpSJlXLYG27
	PdnZ9EhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3ih-00000001BGa-04uD;
	Tue, 22 Jul 2025 03:31:11 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TX-0000000197N-0eZc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:34 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so5082986a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154130; x=1753758930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nz8h60LGers/LCMxx/FZVBLZipiol25W5EeTvz9jgI=;
        b=Bms+Dr350v8heraGpBvbF5UNrzxy+sPD6U7qqGINToGPIs68nS5+cf8ZCXL35Qr60C
         HtvGGQCLK6Z3XxqUwwiW/IPvJgqZQvYJkDqwhDHyAXk5RsoRIv/PW43qaYjCfi1bjBgR
         6IYCTkpNvYnLGvhct1HDQtYj0Ka+NTqU8NFTgwSr5wbVEnOiNtmQbVN0VMiI9bQDBlR9
         qq4uzBGvjXYk0KIWk5W5YK1SNgFteW4vRUiRVuyjxbwvOLCOUumW7ggZg7EKNkvoK42W
         lQbcO+4nzB7rGJnz8wI/RRvzH8hChfDrPJrOyxz7GemJdBilmzkX4aYCjTu0JSRRFQvA
         gDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154130; x=1753758930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nz8h60LGers/LCMxx/FZVBLZipiol25W5EeTvz9jgI=;
        b=aWOcmJgZ5s3vrNpdse3T06qFh0qYyvGeZ0bswCV1CtUSpGpeI0G30Yplw8tnrdTXKt
         ZI3JSRukoYG/rcxgJELke4rkgjePeG/fRMPxa1Uy1HHNdYvs64Nu0RydrvJCovzCPZeh
         OrqVKSM9bIypnU8lJ6LQptsyN85y9nzDX57xifmG9tjjt0AkS9Ess5rwfpSeBlzJQ8D+
         PAAwe/2N1NL/m+BiEcOb1WNLetgdD7R7W6aC6db2nl0UA9EEzG56ra1oY5KTvZgQLypy
         nmDI6srE+5iaWWmJ+IeMCjZDW9w2xW5oPuq+COBUg/xqFGJbgraCsE4Anu3HcGH2MWSI
         078w==
X-Forwarded-Encrypted: i=1; AJvYcCVIiD7FvlakqBTN7BH0LJViPZJJdr2vXzTmdNNHUdoxFMAYRogh5KrnaOgNeYbI6eGbNU68juH8l2sJaGAdh6DK@lists.infradead.org
X-Gm-Message-State: AOJu0YwO1wLKBlV1raA2W1mhrxOV9Mzs2t+MKEaqXFN1fkn/QQ1bb6dI
	346x+UhGGFDdGMVrbLd9QZE2IctUJyL1kOFLEGGkz498Gh4expoNVGLmCztAfDe7y0E=
X-Gm-Gg: ASbGncsQqYC5oIQXq68HQDpJq+/YkLZZ13cX32Q5LVDpLcCfQ8RDTWahW5E7ejUPUDV
	QBevAu9Qq4nYKA3poUqUctx4r8L2oaGZr6GEFk6C7OIZdEawwwy2f4SZ8Cp8d3cL5N8fyk0x2Xf
	SsKaAJtdxsMuWgSem2Ja1KkGXCq8xdxPX/SKQYSHMXUwvRblhpiEgrWh049sCNYzY6eOFjm6dHn
	cLVOoPL08WoOfFK6PdLuRmivJOQKFoeVa0Qr1fMwa7VfL5BPGfxpGpyDJEQG8U3Oj7NmMp/QObL
	ncmpJsqDaAzXn3DsvnUM3pxu81+Lpf+7lCsxCi4/rmvEh/60FBynYX1u8c1jCbOnAPWUGoz6QPX
	9uGiUsks5/gyEmbv9+YWkoPAlz+YoF5n+AtA=
X-Google-Smtp-Source: AGHT+IHeCYnECMIvVJTGoFI3WdlJXM5+Krq/lzUsH6dPnZ6JduY2zNSHMUmatJU7FYEFS6JUREJreQ==
X-Received: by 2002:a05:6a20:3d8a:b0:21f:5324:340 with SMTP id adf61e73a8af0-2381366444amr37445192637.41.1753154130401;
        Mon, 21 Jul 2025 20:15:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:30 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:21 -0700
Subject: [PATCH v4 5/9] drivers/perf: riscv: Export PMU event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-5-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201531_992515_CD18AE4C 
X-CRM114-Status: GOOD (  22.36  )
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

The event mapping function can be used in event info function to find out
the corresponding SBI PMU event encoding during the get_event_info function
as well. Refactor and export it so that it can be invoked from kvm and
internal driver.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 124 ++++++++++++++++++++++-------------------
 include/linux/perf/riscv_pmu.h |   1 +
 2 files changed, 68 insertions(+), 57 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 433d122f1f41..0392900d828e 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
 
+static int pmu_event_find_cache(u64 config);
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -412,6 +413,71 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig)
+{
+	int ret = -ENOENT;
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		if (config >= PERF_COUNT_HW_MAX)
+			return -EINVAL;
+		ret = pmu_hw_event_map[config].event_idx;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = pmu_event_find_cache(config);
+		break;
+	case PERF_TYPE_RAW:
+		/*
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v2.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
+		 * Bits 63:62 are used to distinguish between raw events
+		 * 00 - Hardware raw event
+		 * 10 - SBI firmware events
+		 * 11 - Risc-V platform specific firmware event
+		 */
+		switch (config >> 62) {
+		case 0:
+			if (sbi_v3_available) {
+			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					if (econfig)
+						*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
+			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+				if (econfig)
+					*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
+			break;
+		case 2:
+			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
+			break;
+		case 3:
+			/*
+			 * For Risc-V platform specific firmware events
+			 * Event code - 0xFFFF
+			 * Event data - raw event encoding
+			 */
+			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
+			if (econfig)
+				*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(riscv_pmu_get_event_info);
+
 /*
  * Returns the counter width of a programmable counter and number of hardware
  * counters. As we don't support heterogeneous CPUs yet, it is okay to just
@@ -577,7 +643,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int ret = -ENOENT;
 
 	/*
 	 * Ensure we are finished checking standard hardware events for
@@ -585,62 +650,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	 */
 	flush_work(&check_std_events_work);
 
-	switch (type) {
-	case PERF_TYPE_HARDWARE:
-		if (config >= PERF_COUNT_HW_MAX)
-			return -EINVAL;
-		ret = pmu_hw_event_map[event->attr.config].event_idx;
-		break;
-	case PERF_TYPE_HW_CACHE:
-		ret = pmu_event_find_cache(config);
-		break;
-	case PERF_TYPE_RAW:
-		/*
-		 * As per SBI v0.3 specification,
-		 *  -- the upper 16 bits must be unused for a hardware raw event.
-		 * As per SBI v2.0 specification,
-		 *  -- the upper 8 bits must be unused for a hardware raw event.
-		 * Bits 63:62 are used to distinguish between raw events
-		 * 00 - Hardware raw event
-		 * 10 - SBI firmware events
-		 * 11 - Risc-V platform specific firmware event
-		 */
-
-		switch (config >> 62) {
-		case 0:
-			if (sbi_v3_available) {
-			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
-				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
-					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
-					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
-				}
-			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
-				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
-				ret = RISCV_PMU_RAW_EVENT_IDX;
-			}
-			break;
-		case 2:
-			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
-			break;
-		case 3:
-			/*
-			 * For Risc-V platform specific firmware events
-			 * Event code - 0xFFFF
-			 * Event data - raw event encoding
-			 */
-			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
-			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
-			break;
-		default:
-			break;
-		}
-		break;
-	default:
-		break;
-	}
-
-	return ret;
+	return riscv_pmu_get_event_info(type, config, econfig);
 }
 
 static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 701974639ff2..f82a28040594 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -89,6 +89,7 @@ static inline void riscv_pmu_legacy_skip_init(void) {};
 struct riscv_pmu *riscv_pmu_alloc(void);
 #ifdef CONFIG_RISCV_PMU_SBI
 int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig);
 #endif
 
 #endif /* CONFIG_RISCV_PMU */

-- 
2.43.0


