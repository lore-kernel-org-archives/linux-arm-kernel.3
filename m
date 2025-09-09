Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF86CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnmZ8NkUlTZK5sUaPCJm86+BW+WwmmyvWnWnb0ftr9I=; b=T2J6HsxoUJ+E2WwnXayH9VbjlR
	VLHY1P428XVF1OwcMm8Zra7o5uWHN6l1cZB2572eApAhF3pfiMguh7l9MfAf1kW64n+Dl2jBWx63V
	AwREf6mDGUtFBQvUeOf2HWW1Ixkx4P9rmNo6KvJDShYoerS6nnOT7j3Nsb7IQ29x1f1LJM1n6h2fV
	GvlN9gFskx3/8NxVuTy9bLr4189IyDuyT+o1NgOo5rRemnVzdM0hYoQ+r5hHaun0LbCq+0hNj+6OP
	Q9BKDVsbWddOBYqYLrVEtEDW4N5eVRmY1ahIuHIN7GL3/o+pxUieH/CArtJzZY2Yx/AEyn4MtKjuh
	sc32hhbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtOO-00000005SGp-1HrH;
	Tue, 09 Sep 2025 08:07:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsOB-000000051sv-2eYT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 07:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nnmZ8NkUlTZK5sUaPCJm86+BW+WwmmyvWnWnb0ftr9I=; b=gWNL9KCELB5h8a7/e2rnBqUSfo
	4cbYWYSuX5Kj/Y6wbD21TYtB01Mh4HIhzMY+Nsv3MN35fssSzeeMHGAx8fj8CJGpKSswCinrZiBLj
	kMhuGUyi4PMzSoCvnH+xpTDrO81L3KYjGAtpCZZ7xtzSR/rtUHaWxz7oFVYc+M5bUjjp2kT26B1sY
	ZardZRlXk2Dhh3petW1ISIjIMPJAvrXo4+/XH11mv3QltIw7QFCNryRo1DnhoSay9WPIslJxpc44d
	nRbrnkaPY8FGUEOzTlZBCk3llkbjl5dYn+x9YLHdyy1NUfcRUg9/qWKwq3HVVX3ACQ4uvFstyzCEf
	IsR+OHFw==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO3-00000005ECQ-1HE0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso4622581b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401407; x=1758006207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnmZ8NkUlTZK5sUaPCJm86+BW+WwmmyvWnWnb0ftr9I=;
        b=KOSo9enLZTBDg7zuA2NmE73VSi7L8ySb3xwSVEZjA+qjPf0DzTgcKLUwyNdW4UbiZ4
         f+OhWPiFvxdaPqsGQpQIPjJey8imrAzHU3YyNmImb1I+o7PwoMUj2KGS7xXHYG7fVF+Y
         Oyvf0vaiAOO98+k2ITAEzOWAavqwA1pfoY1NvE5cYTOHLPRg65pimH1gR0Le4RewEvmD
         YGEGEOWWmBitza55uXl9fNAZmlA+2eUccJlcY0zniMvj079WHAjUSWf5gmP7TQbf+g1Y
         KGCXuaWlEYc/GA4DgLpNujWoDqUSPhlMJ27fNGwSbRZwqffltrzzIfZ9pd3yvUcOhxdw
         AKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401407; x=1758006207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnmZ8NkUlTZK5sUaPCJm86+BW+WwmmyvWnWnb0ftr9I=;
        b=chNZPklvykgAXJhb/pfyAOi/trFfeBfvIQp/xMWfr690T56Iv3Vqjq2jE3mfNo8vFb
         sH8xxc2ZDdHdjPiKxdygJug9yGis9xuwUpknAkW2MRjwX0yZ9GHCjd2k2b/fVsNUPKX3
         wybDEArciWqWJAG4YCh2Sqr4D7GVfq5Fa5GzASNkrOaJwWpIoTuJhPOt8lOuexQWoMNl
         OpA46hgmjqBdfHQM+UJU8qpzAtYJsxr8PA9qNdniPl8lerPKU2+FemrZcp0RenL4efxv
         60cHrkJMINlUmJBoyYh0dl9bnJNHo1C+N3Yfad08HNBW1NPAkxTeJPcKc13LAsQZr6y3
         jaFg==
X-Forwarded-Encrypted: i=1; AJvYcCVsjyX5VB827c15G3hfSIIdIZRRU9rEouCHQC+6mR1ZMYEKK7jMT4tw+HNs/BHn/yTcEX6ZypTmXfqF0Q6YtKbJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYeTGtScbpHsf2iteZgdv3YMYJO4ko+reLyhLjZLZMh3jSiq9W
	gl+1ae4l72amZiUGYvvk5H9C50TjDQ5glFqwnTVvmQMDuHnDRIrXgMNTizm17W+I2Ek=
X-Gm-Gg: ASbGncuj1L9Q7OXO+mQmOhv2nqf7DdLxL0DO97hYagNtsAmsYwVnXtnqu2AJnOM14VA
	7ItASN1ZJHZr6EPBTf6jXuim7UFcIOCgdFXqN5YuoWPC0SA3ktj6VCOKIDrnUP9HDkuLKpjIpHg
	LaXyPGpcM0Lojfcscg/N+tzQsWtddR/l4O5V53AaKXLUY6iiu9S5zqpGIU41408G4iIk2rMm7uo
	uZ6SpmBZeQ+jvznq8rdI0KzBnEOmlhouSUOAyrKKAEnjt0iJY2AcabaRx7BlZMwGLo4TvQrBnq4
	bjTaBFTOI7cSr2V9uK9Z/PR8BevTLjLJ7EUPGTVet62WP1Nj/bFH2tufDLZsOL/OSPM1HAnqepf
	OB1Odi+L0jQYAcL64pGkGbT4rgfN9bocX/5c=
X-Google-Smtp-Source: AGHT+IFiF52xK3MSeJlrfdLEf2QXk0FrME34XTCcy1LZr3L0VGDJ3dsrdXofGTbO3mimC4eb9yJmOw==
X-Received: by 2002:a05:6a00:1793:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7742dd1252emr12562314b3a.3.1757401406596;
        Tue, 09 Sep 2025 00:03:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:21 -0700
Subject: [PATCH v6 2/8] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-pmu_event_info-v6-2-d8f80cacb884@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250909_080332_901124_8E730642 
X-CRM114-Status: GOOD (  17.53  )
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
 drivers/perf/riscv_pmu_sbi.c | 16 +++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

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
index cfd6946fca42..3644bed4c8ab 100644
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
@@ -537,8 +539,12 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
-			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			if (sbi_v3_available) {
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
 				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 				ret = RISCV_PMU_RAW_EVENT_IDX;
 			}

-- 
2.43.0


