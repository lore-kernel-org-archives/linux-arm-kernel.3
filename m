Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A043CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI741R36HWDh2RhVHZyQphWWAJjaxVoQsq24GTtFdYc=; b=Y2izu2ZBSd1mMeoUdhwQesWHo8
	BIiNVfSYPgKAlITUMFxKtxt7KhTeRiKOP+Q4sC02V1kB8p6l3D77QVPXeun8ehGh/l/SVR/rl1IAI
	QdyVWy/z7dpXz/D0reNyzThezH+CF4JNdnwu4BwxGpEyIvRMANbrrALOMSsQDb0UVlk42qyMkInYW
	xiD4vBu1+VpeWeS6aiDrWj4nDzmtIjrbwtntWKak/qYBlXvcnJ1g35kuhlC8cEgRL2LGy927ugoXO
	CLpaRAGXqVboJwpjw9XObCm9+Xkd11JbZUZWBz2qT6DOUP7oFjcl1BamBpmdUFkCtDYF9NfFId2c3
	mRKEo5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iI-000000076Us-1eXu;
	Sat, 30 Aug 2025 00:45:02 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hu-0000000640m-46ny
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7722f8cf9adso676551b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478470; x=1757083270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tI741R36HWDh2RhVHZyQphWWAJjaxVoQsq24GTtFdYc=;
        b=LFhPt44Jz7OUp7R4MoSZpNqqvg8P9j3l7C2ZZWaysrv1LuJfkaue7rW+zmkDXgMzst
         0KEv8uAJJ8YAIyyGvTi5NHhvJHwk0L3xUtfokeLAjKBBKjds8RtJadaKA0+mw6dSnKzR
         v1uUjnqp+fvuKuJ86CwT0jj5kkRop/3jPsF05IFZ7qDMEe5JfqMlZreplztHhEwwvlJz
         I1+Sub14ai9JnBfcF76Na5oexBZ/457sMZutTCchn4QFS37JpBesRe0tWm0sgwqRgPED
         cA4lGtDVJmv0j1zlGts3TsM5Ybs2GToteR4I32bVOmvOAUu+IP2h/XKQvVNjMgmVzr8l
         ESAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478470; x=1757083270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tI741R36HWDh2RhVHZyQphWWAJjaxVoQsq24GTtFdYc=;
        b=tw0GppANgsM+c5zQP9i8GrJDrpN8+2qKLR0RO1s6r4S/LVWCFzlPP7PF7qG463T1Ft
         D7AyfPbheId8giNAymP6hevFls7xk4uCmMeqSlTT5dOdiTDk/LXy5fVzgBjlbrouOAQj
         sJBGXMOv1s471As1xv7F/fKfoAm4aCPMzuEw4oIlJVL7zOFaKqULgkYSyRHehPB++Vy5
         LA0PFWCyt35UZ9AN0jz/1eeW2378orE2fD4actBeGdh8QXoaeQyTrcYmkupgRDwfikVd
         XlfX5nmpxxvVwgR7TsU0P4owt9DQX/WACLL95wx+Py+gnd6JywhZE+tC2toP+wlTYSRf
         nFTw==
X-Forwarded-Encrypted: i=1; AJvYcCVQMFm5+uaIB/YF5/FOu36rEQvmlUupiYkEQy65ztQ9FB+Ua9tgw0NTr0IuGSL+m2YAxVEkwZhCqmMegB9bC+/z@lists.infradead.org
X-Gm-Message-State: AOJu0YyfbNlVmrz9IC3Q9uyHD+fUgD3O7A79m0mRMMVDYPVeSzuPYIjX
	3yt7H2RsYrNjDQHhCDDSNJnScKT255kV54A72fzZXaS7wnQmGFD4SlCrAdQ4UmN+Dbc=
X-Gm-Gg: ASbGnctXXyjlF1HWH6TTa3wh7OMfpWKicWSADpSd03dJbsHpKOPDhl8F/gUIibBqJM5
	nJ51sGuJbjjPfOovumkkpuF2kmDUJXw/sNDiSXyCS98CSS23hN1vV0h5xCLFg5m+76/ukU3SIAY
	/pMKf6OmXwhOvbaoP5ZXlIyDe6VCn9EaIST8BJuB+lcw5bGCFLtfA40HPy+Uy1FrugrIMZWU9hu
	mPTu3pR1gZ8SNy+6Cm/u0MlpcaaP9fHVJa1y8BA4NI3n4xlwiwxYgPGZkljYvPMRF4Fg+pWLF4P
	j9IeusWzEkA2gtXzw6tIorOuTKvCODTTgqZf6L8djdhW/WqT21brxrb2fT35UL66uYcmuj4Yqp3
	hRLQLBrpH7FlLSzMRObZiQYR003ao60FRajC4viN/I+WNqg==
X-Google-Smtp-Source: AGHT+IFF8VEo1uPvNaAIFv8C/+fiPXouMqAeY9Jx+FQMbKLtAKcRvd4Ch7pGF/LiqKMh1EOfkolHEw==
X-Received: by 2002:a05:6a00:148e:b0:771:f4d4:24fa with SMTP id d2e1a72fcca58-771f4d4290bmr21272864b3a.18.1756478470351;
        Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:03 -0700
Subject: [PATCH v5 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-pmu_event_info-v5-2-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074111_059091_BF3EB8B0 
X-CRM114-Status: GOOD (  17.40  )
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
 drivers/perf/riscv_pmu_sbi.c | 18 +++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

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
index cfd6946fca42..7e984ab717c6 100644
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
-			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			if (sbi_v3_available) {
+			/* Return error if any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
+			/* Return error if any bits [48-63] is set  as it is not allowed by the spec */
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
 				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 				ret = RISCV_PMU_RAW_EVENT_IDX;
 			}

-- 
2.43.0


