Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6556C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTd9Qo5vidtOLE+cxHwuaQqNzwk6goJIP9mJXkel4TI=; b=pnNaVLgvurVlrzWfMrx+Cj1z+v
	pgTReH3U8awBtQWIJUQkW8bp6VlbQy7lsew8da9Qzqhnusn6ti5QtMLK9lDmgSRPG4vazinmc+3gn
	gfo+zXCxaIF6mu0l72R3HuYHB443g8gOEKfC8O7TnpLZAyYm4zzhfEhCjzfbRguVr5ZEzPxe9b0oT
	POPNq7GrXw9VLE9MJYpVJxahZOoRTGjQdh+QoCszekCeVEzY/SkjbBsbVZ3MkGTNSoKfe1lGb5EL8
	wXeQzDKk0npCbGuRlU7T89ks4JkQi8xW9xgzix5gQO/gVtuD/X+wbQmGsUBrGu0PTHB9PRPS08u4s
	Y2+rtGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8EA-0000000CmRd-07OX;
	Wed, 15 Jan 2025 18:34:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AM-0000000Cl9T-2ajr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:30:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2167141dfa1so1961255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965858; x=1737570658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTd9Qo5vidtOLE+cxHwuaQqNzwk6goJIP9mJXkel4TI=;
        b=wzg+C70y9UjY0htO85yiAYz8hzdw7aQUWp0ioyCGBnW5lCzQ9YPMU5X84FeEtMD8PG
         P5GBibOKB5nmkf4qm7TzdoYRyrPcpP1UpzjXXeH4l9ys7mEjpaWXaqEkYDig39qOkB+0
         QBmgdZf6vbWsBspYs+yEntoZGmwou6fAWzbvHex282RE3ni82+Pc9Ep5Xx3XZpMGpZWA
         gCaBvFJaYuR45DeALO6owTMQ0HwCxgVjUcupTekGFYYQUj90rgdsRSQBX4dCQcyIDXMB
         BJBnlXz/VpqLEHe+IHsO84nFdjAieXUy6RlcJ2CWaM/TvLDGLeGBbVlLSPHQpGF4Mnux
         gFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965858; x=1737570658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTd9Qo5vidtOLE+cxHwuaQqNzwk6goJIP9mJXkel4TI=;
        b=h4OjE6qhSKlqZiibJKwiQAM3EDnLOVXXef9te2LlXqcTjNkLL1CcGbgr4v1nGqeUEF
         UeD5sP9BKmqSYa/Aazm3IGyN5OqCQFodRwq6+dhULQdFDLffBcwfExUZVB7Q7BDrrDnl
         EakOvh3MJCOITizPy1UFNkxFLVAP/CuEVpnquczJaAbbvYzbo47y1vGW8KPCnACDFTmY
         F6dgXeOnZjpM7HwYEJWHX5+lOHDm5zBWWOY1MG+nGmJQb9xiBf+n6jBG2mEpp/xJ7wNX
         cGJN2CIgVX0RZT+Pf22KkKxLHLnlDnq9+9jx4ySec1wFT06z9YT+MfRUw6zsxIQaF9Bt
         +UTg==
X-Forwarded-Encrypted: i=1; AJvYcCX5i2p7XXgkG84AHJ3q5DH3KB7bGVlFkqEA2VCetKMl4Ex8jeIZNTOyFdl4kQHKVEWvUVEhNoq4iw3nrp/+EBrx@lists.infradead.org
X-Gm-Message-State: AOJu0YwjzdAWz8ZJhAoRo5yriAwdEYdHXRH5ApzrbQqww2nS0x6Vawy0
	oUZ7Rw9xq1lyWC/A08eC/2/T7vzwYsh2sEa10iGHK6sMoCzR6SiqyCe7h6XiNl1BX4MxyaAwVII
	v
X-Gm-Gg: ASbGncvf3JkQN4Drf8Q7fMq7dHWlaiRWiaCNmoGyJ0yi+g+aH22bdJ33T5BQjJVyQOc
	kB5E4kq5cNkcnHNmsMQBiY7KaQnkZF2GR41IVNDJ4KyxaadoBkDA5ho3nQsUnJKwCIN53zyK+bo
	1ECL73eQtTGgCWILGS5/VHZC43vliKujwdEtkzf61tpUdz6hThVc7ufKCmW7N2OCFqlsoP3eThm
	V5Y7Ue/aGPcslTHp/gHg3Q2n+AMJutjYjSNydmILAiRKW4YHunoHygK47p2ge7WDbpHxQ==
X-Google-Smtp-Source: AGHT+IHHO3B1HJhEuywvwBIX7b7bfSC/4ve6r1ZbOzw3ZYVhbL87vWT2YRpjRvKHUMwV10zBAIgK0g==
X-Received: by 2002:a17:903:2291:b0:215:58be:334e with SMTP id d9443c01a7336-21bf0bb89cemr59154695ad.10.1736965857674;
        Wed, 15 Jan 2025 10:30:57 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:42 -0800
Subject: [PATCH v2 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_event_info-v2-2-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103058_683949_6962240B 
X-CRM114-Status: GOOD (  17.49  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..6ce385a3a7bb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -160,7 +160,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -218,6 +221,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 170aa93106b9..5d5b399b3e77 100644
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
+		 * As per SBI v3.0 specification,
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
2.34.1


