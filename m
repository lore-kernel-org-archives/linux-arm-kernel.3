Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C265CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhZMcUxsy6JYqWOC3or2cXZEhT1Fgv3FiewmctcehUQ=; b=u0bqwJTmqg6DcUVwlgAQs4V8l8
	f7rTLXNvXyVaQd30EUXIYK0ayDnd7JatGJcRhgixmX2ZnYrXW+5alEf0ZbjbbBS9i62sWWoqWwSpc
	wmzUmbFGupHxjCqz//ABID2/BU5xC8j2LakFFPTEuL1/HntpdBUpvtEmFjwgg8W4dQ9IKYb27XgjK
	8fP96cQKNWO9nY2CSjaQaxAF2sFMctY6eYjEZMSt2XNhDeYHKvdTYWOizmmCx53IjOfPwsjXqm417
	f3W7upEgwhCmUnuJk+9jwEQdt0SS1HrlDH2UXdvgHGe7QXVSxiobbwFlR3yxskN34H7fBrY1yPql0
	M2OSJRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuJ5-00000005nn6-3Qtf;
	Tue, 09 Sep 2025 09:06:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO2-000000051kM-19T3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32d6c194134so3169597a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401409; x=1758006209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhZMcUxsy6JYqWOC3or2cXZEhT1Fgv3FiewmctcehUQ=;
        b=gjTSLLlgmz9/YbTLemad73akC/UF1ZW7Q6NOH2oPfKoyVv8npZNK9hL/afvuPXub6z
         aZC/lGHAnJf8chDhg9hPxt+dKIIuxE/S5EEEFlcsAVNs1GB3+w0FBaPntuazbnrnTaEO
         /FKOXn1wWiEfqjqSJ7VagqaXvOBxlXTCEgowwRyVGN4M7zpjQ0RzZc/TIJvxeRewdabA
         FOlvFJDi7haun+y9P2u9PYpIStZhph5m2ONHEfCYqBfM/j2DJtOkcrUX89FsiSqk351i
         u6gq//SzcMm2HLt+Sl9A4lY/397nJiWpWOVR/K3QmdioVVFap7Hk3Me3jyWLSTuDHQC6
         p/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401409; x=1758006209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhZMcUxsy6JYqWOC3or2cXZEhT1Fgv3FiewmctcehUQ=;
        b=mF2CRL1gnRo1+5EmIWY753sARJZuUbeCQ4mgiQ53oVk/J22N/YPapPK+4IX8XzPnjH
         SfNBnHooxq91Dub5hWhi00IhyCxnuPKKIHjOmLiHJc6AFJNtwZo+M6YgLg5t+IiKnIdl
         2Yp5K/ab2aSC2sNMwQF8iaj9RH0j8PvaOfzWyxwgOZgkaAUvid7aqY9Jmp4zAGgCGRUU
         FZfPhPe2BpAOW+20JpWCQANaIfzUbjxQQKXMDsqpwfK48UUSEF22AP64s//AORN4f3Ig
         Y9LSbN9roR9AwvOHvGPgtIEKJCf4a+ls3Y8R4lUpW4+SsNq9f6tef8DRgfGG+Jg9lng3
         J0SQ==
X-Forwarded-Encrypted: i=1; AJvYcCX830bfYYiJzq8tZ0dqiOehG3YV3w7Vrf/Iug7toEPig0pdrwyhKkGDf7+n50WPppzOZPvMcYefZa9C+zoKWOQP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wos3oMLPKGdZ1LIxSjQrw73/82nz0loI18IfADLmsxJiSydo
	5vJv6FgJxvVPlGESAPEoArAEx21nfz6f5pD7YAWI/r5IweJbHD8jVRnblwSynx9Jff4YqT+62by
	ABlyF
X-Gm-Gg: ASbGncvbUbDTqL6vp01KYiG8Y8uFrpNCfssvsfKH5zOpjEwZuEu9ultURSgk6068sEi
	I2e7ICqKT8GKzLtd2lJxNheVUgqxBAnCYyv0YkWRk0PtmJDNjyaOofbvhxOBJ3e0VSa+sD6Gk6Q
	Vp+NhBKhBJrZDDVJvGfjbtI1Pj+LB1vf9EyHamqO81vvyww+KJ73R1yWI1gOEO8lSMyfbfk48Tx
	qRHzzgBFSgKTiuymR7L9vrEDKMAxUii8CLYnwCdriPcr9imWvd+Of7T2Ahx9vSUGbkNkN1yh++L
	Fah1tO8RRskFu6MjIfhjsCSmPeBlNLEjhG7W+mKIYMUNQT/utnLb2/WdSqZQpvdmzhw+h8snz/t
	umPMKpyEA/oahyaU6y/IiwCHDITDORxTn9OroKSEdxVyxVw==
X-Google-Smtp-Source: AGHT+IFakW9GI3X7KiwSZ6TB6r+qigeRh7zHPYJe3gZqGJm1TvXIR0iLLkZpUst0NZABNZYOk/hzVA==
X-Received: by 2002:a17:90b:3f4c:b0:32b:6132:5f8c with SMTP id 98e67ed59e1d1-32d43f772c9mr13153440a91.18.1757401409453;
        Tue, 09 Sep 2025 00:03:29 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:24 -0700
Subject: [PATCH v6 5/8] drivers/perf: riscv: Export PMU event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-pmu_event_info-v6-5-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000330_321768_FD5C16D3 
X-CRM114-Status: GOOD (  22.64  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 drivers/perf/riscv_pmu_sbi.c   | 122 ++++++++++++++++++++++-------------------
 include/linux/perf/riscv_pmu.h |   1 +
 2 files changed, 68 insertions(+), 55 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index a6c479f853e1..0392900d828e 100644
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
@@ -585,60 +650,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
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
-				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
-					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
-					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
-				}
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


