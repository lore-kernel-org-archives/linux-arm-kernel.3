Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A1CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaJ9aiB4PvqQF4lL2czHSQpu5RmdGPHGPdEr5UPHKqo=; b=hYQZaNg2C/+wdog6FVTcI0CydT
	kwsG0lQugLremVmmRcpdGtJU9zT0Cv98exrKlY+Ti4QidvQlUP3GoDfvzu3VTpB1EOyaTTf7aCKYv
	4LwYuOmBLsyk8bRojljoPJG1NMDl0zK97EmFwimuR5HVDv5ptyu2+J/xmxnaqU2IxMsRC4BuwR8qC
	GCZRVrFpaHSHPnSyocinWnrImZt6jqT00nkeHxuT7qkp/e7Fk7fOJVxmLDL/hW2X9+HTU+Py3h+gR
	1N80/fqgvhQum+g5ScI7GAIiuuNSAjYstvDnbvjUDkXW1W1ZthMnPFMR8h5wDYJ8R46yXLs5TO1w0
	KHI0KVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3av-00000001AJ5-2jT9;
	Tue, 22 Jul 2025 03:23:09 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TT-0000000194S-41Mn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:30 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-75ce8f8a3a1so983330b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154127; x=1753758927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaJ9aiB4PvqQF4lL2czHSQpu5RmdGPHGPdEr5UPHKqo=;
        b=amcQa53eCjygstr5Ccd2On9XKEqGrf30MWmpThIEiiPwNMu2lpXXiL0f2+FAJhySx0
         3PZ/AGgZari06a6Z9j5qnFUmDcrjmYwy7lsPpklm4Qv8jH6IcTZG2WvLCJOo6n0vAhS3
         K5/70ToMVZSIMrKeCW4So6WKglAcvZdIO+xQuvkQQSpLh3fAy/f389g+d7X7/mMIJ+yf
         B5VmZ+2KxibOzk2S7m041LU5rU8i1ZViNu/ap6HrYDiw/ZaYPrlwYToggGEOBivWJ4cV
         ciZimXP+H8VvFJatlBGsTdoxl25+zqUKczxNw+6yMgZZJTwzrEttJeCrhC+uGDNuTMTf
         iQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154127; x=1753758927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaJ9aiB4PvqQF4lL2czHSQpu5RmdGPHGPdEr5UPHKqo=;
        b=Lqws72r7QDlCbdxuCVIRtnYrRFtUbkUEniBJKiG0cnvgGCHzmSIg+ahCaRZAMxUjp4
         F040fJFpTysd31SLKTgcPlD88nxcXozEji80Xc9zk5F8z/eVo5ZB18JLNaBvBQS3KYLY
         dK29r1fY6YxJ9e6mjBk6CTaApoapeQh7ZDGifjYa1x67Q12fiYO50VoGKUyTfH3UhAZI
         kFKkf0HaSdOG0ziw3eV8gVY38G9KsgdpopzDmuK3OaDmZ4l+cXmitLurXEQ0HcJZhju5
         O0GGu3eulJn6OpEOEnU/X/Xnmqi4UnB3h1YqbaxX0JkQPWKJ2CZTjyxreaKrO0RlpWQX
         h8WA==
X-Forwarded-Encrypted: i=1; AJvYcCUYnuaVHD4P6WtzoECRd7U8pzJKTIlxr+g/8tJfmvwXmiG9AWycqTs0actSM8QzNGvtICC+uk6fpeNhpPMzHL9e@lists.infradead.org
X-Gm-Message-State: AOJu0YwN8164wT/bK9Cg/9e6X7eKviuFDxMnZ9W5RKQDGduTTe+/GICk
	ENpvz/hc19V7nU3fmb9SpnbJiJtMD54Q14HF1nCSmSQxejUTwqoLQV67ym7qfjcAtHU=
X-Gm-Gg: ASbGnctkfwrfA255kbpnu/AhiVIfM/8stXPbjlyBv6DMVkGDFraJKKJ6Cif5cvnruQY
	Q9BbxbCPRvCPpiVxNUSqDbBN4fgYDk2+/2+v4FmNtZQIPcFi0RshvdK9Ly6znPNpqur9gULEif/
	NBos5ImyWIEEPxENNMxhtkFNgO0k91qcD+CuRYjDwDqPFzsnC0au7ZD/l4ooLyRvLdZWFJkKmf9
	gJRkxUWJIV9S9MSfUZJKz5nWnsMCG+JVou62oTruoobCrReI1incQZg7iPi6jkdmhcFshY+n2Jn
	gtaIMF5HGkm6ORb1It3S1rQFgotaUuizmzim01rxgqP5yuJ1X9C1qUQ17ZyXlytTap512Nl+BHd
	LlKrFI2WNPHMEF7aI5rWX2/m/YMDZoOsngL0=
X-Google-Smtp-Source: AGHT+IGF6Po1DKvJeXFzJdS6UmW3bPEOUN9x/0ZpQhlGwgu/vmfAIzOtjATRI7XYcQq7ZH2Dfk1C/g==
X-Received: by 2002:a05:6a21:a81:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-2391c92a648mr23761386637.9.1753154127264;
        Mon, 21 Jul 2025 20:15:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:18 -0700
Subject: [PATCH v4 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-2-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201528_060323_2486E399 
X-CRM114-Status: GOOD (  17.45  )
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

SBI v3.0 introduced a new raw event type that allows wider
mhpmeventX width to be programmed via CFG_MATCH.

Use the raw event v2 if SBI v3.0 is available.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..b0c41ef56968 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -161,7 +161,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -219,6 +222,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index cfd6946fca42..7331808b1192 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
@@ -527,8 +527,10 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		break;
 	case PERF_TYPE_RAW:
 		/*
-		 * As per SBI specification, the upper 16 bits must be unused
-		 * for a hardware raw event.
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v2.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
 		 * Bits 63:62 are used to distinguish between raw events
 		 * 00 - Hardware raw event
 		 * 10 - SBI firmware events
@@ -537,8 +539,14 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
+			if (sbi_v3_available) {
+			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
 			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
 				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 				ret = RISCV_PMU_RAW_EVENT_IDX;
 			}

-- 
2.43.0


