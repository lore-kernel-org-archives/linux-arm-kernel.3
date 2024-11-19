Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAF2D6C295
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FB/tddqfX+5D+NwPYtCZBvpcbtznximYassXddDySaI=; b=2twylc9GFc05x9IuMDSWPZ4jfC
	pZYwyK0ozHMDuFCdRlP8Ziomo3jfXd9mf7bvQpkQAC0+1L7TShub1HP6o98Xd6RCmzZ2HPVsDcrfl
	GnyEAsdbNFMy5algP/wH/KkSYuN+0w4McZW4B8YYIlRBrEFU1+mFvGqwnqR4z3MEFwoAIDIWjb2Nv
	c8cijCO1axl8c4syg7AAt5DTtnEOkB0avVVVkQx4CRGu6vu5/2K6m4o4dt8Fj9OmhOwHZiDoxQ0wz
	Cl1dXrOpeQ+266uGz/tCL2ZQmtIunfBLmUb0svR/H9mjhoGXm39NkpZvMDM0hsf0JP9whwex8+/Uq
	q+708MIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUvr-0000000DiOD-4AUx;
	Tue, 19 Nov 2024 20:34:44 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUsA-0000000Dh08-02qb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:55 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so1123037a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048253; x=1732653053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB/tddqfX+5D+NwPYtCZBvpcbtznximYassXddDySaI=;
        b=EKQ35d/zj/eCIDyCs5WxKKU4Odkw33a91eskAoJrs9seScr6jfuQXWkGBL0qW9cFZ4
         K1xkvV5rbznK85d15/iJo4im2jxHEyuUraog5boZJ1i+cf8MVAAQ8x4dncP5amel1ERm
         U+Po/aq4jg2iPa4LBfXC8dFmTDrIUNdmzJoJsnRvluPJWZMWeY/lEbegbwULYj7GQEkW
         u36ptU1EKHvoS2T4TTwrrtGYYalTAF1+HduxB+UF0794A/Hjlk7QGayjhF+C/2xhKIbw
         4tXWkKrTiFTE9zXw90D4fI/X1+m+TcyKPOZOjSdFXa4DkDTkcd6lml6VnuSgByrG6/+C
         tH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048253; x=1732653053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FB/tddqfX+5D+NwPYtCZBvpcbtznximYassXddDySaI=;
        b=lBt15V7PYA/Tc10i1obi5Y1kPHN6iRp6PPOKGWyJGpROVaLdZnz6YXcNUsY+NlaIQI
         lR619Bd+kHzOcJowTzZui4RXiuv1H+41Mw9S84GtuLWGiyP5KFbUeaAhTpTb28dmW8ET
         enLp8zWSB7Q79H/tLC/XE5K4iYA/8Xb+j/J94LCdkybUDVyfPUPMPzlQAPaVlQhWnV3X
         hkKsMZFlaffTEcxxNL4Fcf26LP0fBFZ5oVkzBNGSkHZ2Rahd27GjYs86gQyn1dYVIXZS
         M15CTws6vZABB84xAckudlH1EcpcrPTQ5NtwDvWYazhZXjnD3n8/R32tRasEA4MActbi
         /shg==
X-Forwarded-Encrypted: i=1; AJvYcCVvGcMDkXk+rF3kbrfZ9tS+7oVG/C81/bjXYTa2onsu5/836rLeR8CUXHSVb9RheTmb/aU7YpSZSYd5ZaNuoYfC@lists.infradead.org
X-Gm-Message-State: AOJu0YzvS4mGplmQQjze0eYsPl3bbmiwcj3jWJ8FUL1Grr8Wvc0p2Ucl
	hnU5h0x7MTAKbSigYMZ7kXZ6Ol0gCkDfGCnv+TJCxyZVMNRi2xGHY2axT39GhW4=
X-Google-Smtp-Source: AGHT+IGG3BOEKBQHByHPNxLGRscpaUzNEj7RMHYMCOiguADUgT/ZA6zCcmpHgOYphyvS5L29CLFFRQ==
X-Received: by 2002:a05:6a21:3287:b0:1d8:a29b:8f6f with SMTP id adf61e73a8af0-1ddae4e24bbmr613518637.16.1732048251371;
        Tue, 19 Nov 2024 12:30:51 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:50 -0800
Subject: [PATCH 2/8] drivers/perf: riscv: Fix Platform firmware event data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
In-Reply-To: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123054_058976_713D25C3 
X-CRM114-Status: GOOD (  15.88  )
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

Platform firmware event data field is allowed to be 62 bits for
Linux as uppper most two bits are reserved to indicate SBI fw or
platform specific firmware events.
However, the event data field is masked as per the hardware raw
event mask which is not correct.

Fix the platform firmware event data field with proper mask.

Fixes: f0c9363db2dd ("perf/riscv-sbi: Add platform specific firmware event handling")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  1 +
 drivers/perf/riscv_pmu_sbi.c | 12 +++++-------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 98f631b051db..9be38b05f4ad 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -158,6 +158,7 @@ struct riscv_pmu_snapshot_data {
 };
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
+#define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index cb98efa9b106..50cbdbf66bb7 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -508,7 +508,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	u64 raw_config_val;
 	int ret;
 
 	/*
@@ -529,21 +528,20 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	case PERF_TYPE_RAW:
 		/*
 		 * As per SBI specification, the upper 16 bits must be unused
-		 * for a raw event.
+		 * for a hardware raw event.
 		 * Bits 63:62 are used to distinguish between raw events
 		 * 00 - Hardware raw event
 		 * 10 - SBI firmware events
 		 * 11 - Risc-V platform specific firmware event
 		 */
-		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
+
 		switch (config >> 62) {
 		case 0:
 			ret = RISCV_PMU_RAW_EVENT_IDX;
-			*econfig = raw_config_val;
+			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 			break;
 		case 2:
-			ret = (raw_config_val & 0xFFFF) |
-				(SBI_PMU_EVENT_TYPE_FW << 16);
+			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
 			break;
 		case 3:
 			/*
@@ -552,7 +550,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 			 * Event data - raw event encoding
 			 */
 			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
-			*econfig = raw_config_val;
+			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
 			break;
 		}
 		break;

-- 
2.34.1


