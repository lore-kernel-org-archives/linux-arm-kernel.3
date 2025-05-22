Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A63AC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vACMU+uOLyj1bSQA4LVJfCqGiOCws5jCYjHnigZ5yyQ=; b=ut0k+5uO86GM3HU3evgftmL4Aj
	2h37lsOwClJsxKxC/yEfMHOBqKczW1p2EQbt7DO13FmO1DH/Xbc5AxqDCRNSvkemB9UC2UpCdPgpV
	Xk/ggJdwqbWs20ZtjzH11hmSzpByoeCqOwGLVj8txynsepTVavyUgDPDwzkhZwCCntc3S6SYrF9rp
	yuB6+nu99LeG7MmgTwozzQ+86eACJnYgenFyi/P4RrGU4vFr1Jd+a0UkYYw8rAR3usoundPxhuaDQ
	izdHGqKl0SWeGn2HY1ikndlkWWan+xUIFfC3grp6fvLXBF4neWr14Is8Zl+C9NJg8YnoDbZIf2paX
	5/OX6YMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBOu-00000001zko-00R0;
	Thu, 22 May 2025 19:16:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCo-00000001wPo-2vQK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:03:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-231e98e46c0so55194555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940630; x=1748545430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vACMU+uOLyj1bSQA4LVJfCqGiOCws5jCYjHnigZ5yyQ=;
        b=IJzNHhDvhvlt9SPsWuDNXD8BZJi46+g50aHTmKF7zR2WSnqP8kNMqX0FdBuFkKpMxz
         0uQibDM6+wIFXvBkJnVjpCtROJAJfNpWLHTR3eZ3wza2B/+AUsZ/cIo+ck90tikQ/4/2
         EHoVP44rq7iHWqy/dgG+KV673Zn3XCCQsapFCeNQLPlhQXmUKsN/Mq/ZUVHvndftTLYQ
         01AqB50SnU9eCkq+7W1y6GO9XDPSYNXH4273EdRC0kw4y3kP8FvnZxcWmVhzTFXIDTvs
         C7Yo/eKkcyJflcPGX635FPOfj70mjY6kvY/v2QfBwmaI+hYxNxYM6dlWpfqasXcsO4ax
         eoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940630; x=1748545430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vACMU+uOLyj1bSQA4LVJfCqGiOCws5jCYjHnigZ5yyQ=;
        b=ciGh1sXr+NoxSlYWKcAd7ul3t8uWys/rk5BfD2abjPGUyO8thYgLPdTsm8Ps7JHoMv
         Vhrp2ZKXsMqUp/vbJBhmL9eCQqCIduqLA9L5yFOlvp1IMAC5G4Z0i4WAzaVkVwF5989F
         izwv65rxun7i+JtDnQXgOQI4Etq9D/Dub51xwm6pZsrz2TjDGHu57F28rS6UK7ODNGWL
         Go/JcjI3kDlEO4pYmE4+HAPJwvNwdg3vG/RZA7rmCyNcfYZbYXCMrjoRSM2CLIllG1yD
         27B44gey5wDZerdR7jX4hLgYHPkBnvMdbuQQDdG5S1vZUWl+OR05GssjpL9JztXHvZOh
         dEpA==
X-Forwarded-Encrypted: i=1; AJvYcCXq5Tx6hYTxUCz0rkcIo5gl2VbeoYrzhM2mLYVUJ1FDeujmIVqphivFPAY3DkxgWzf3hqaYLr8pvFIBrMMZcuJ1@lists.infradead.org
X-Gm-Message-State: AOJu0YzZDOJ1k9HAmDOE4aHekdn6WzvsZpTuCFdx34Cry0cb6Ymetf1Z
	ToXnGG1KVjjCkDkVH3hjOoD7YFkVej3JfaT0fbEZN2xtI4wBpE4bRCD1FCESEud4AFA=
X-Gm-Gg: ASbGncu7ZEEaEl3pEYPIMsSIDpVu4Qvh1xjBFnK/PfF3wAq8GqexP/nUQpOOPlSf1Uh
	zsGho70SLLlCSA6d2aP+p7R15w+TbEC7QZDoWlgpr1vOGnBoDJyGX0oOJPckTA9L9x4as2biV+w
	JTlM0f2Lg+K+z73SlGRf935s61LevGJY1AZriAka3kxONDuG0Q9o4XZJrGNmTKYC0Xu+EdCXQ9J
	nfYHZ60EIQk/OJ6mmY8n7LkaUr3J7/Nhp6pqV4liudR6sbtDpiBeYDzJwL1TiOWBIvBhqFyIjLj
	/UhS2iC9HBCS3nJB5KRNH/0RP2omwh73L1rzieKYF2LquLhCzmBFLeKZ5GLkNByeQiwMGqsX5/U
	=
X-Google-Smtp-Source: AGHT+IE3kKHYdKAzGiVNjvDReRIr3YIXelNJnoPPmROIVHQY8jqz/Q50hb8MBVNgcI6K6CgV+C9sRg==
X-Received: by 2002:a17:902:ea0e:b0:22e:8183:1fae with SMTP id d9443c01a7336-233f25f4019mr1589425ad.41.1747940629899;
        Thu, 22 May 2025 12:03:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:39 -0700
Subject: [PATCH v3 5/9] drivers/perf: riscv: Export PMU event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-5-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120350_868426_2D0BC141 
X-CRM114-Status: GOOD (  22.17  )
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
 include/linux/perf/riscv_pmu.h |   2 +
 2 files changed, 69 insertions(+), 57 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 33d8348bf68a..f5d3db6dba18 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
 
+static int pmu_event_find_cache(u64 config);
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -411,6 +412,71 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
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
+		 * As per SBI v3.0 specification,
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
@@ -576,7 +642,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int ret = -ENOENT;
 
 	/*
 	 * Ensure we are finished checking standard hardware events for
@@ -584,62 +649,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
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
-		 * As per SBI v3.0 specification,
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
index 701974639ff2..4a5e3209c473 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -91,6 +91,8 @@ struct riscv_pmu *riscv_pmu_alloc(void);
 int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 #endif
 
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig);
+
 #endif /* CONFIG_RISCV_PMU */
 
 #endif /* _RISCV_PMU_H */

-- 
2.43.0


