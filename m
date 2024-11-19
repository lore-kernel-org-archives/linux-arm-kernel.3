Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740D3D6C299
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRmKVkktJnfpekqs0vaEt2UdODXxii8BcnwHInLLVOw=; b=GW2FmlcDCFFyL1wnAUDyO5rWrr
	nLRZo3QRgQ9Ylzwf0No4d/QIW6GvLkPEmRloTra2fFZl8kvfwVRPK0WxpDc1c+y7jNOMJgYS2OlQw
	CkP2VQA9vD/han5biWu8vRl4275IBL2Ahwaopi3DiAhx/j5QLfoKrjeAZdVo7iwf+DlexaCormmgW
	gBGIUs+0GRPUTY58mCFujSxaV4gzrBOln9W2ZZxAuACcq3+EmF0YcTVOn3QNHbB63qS0K/XG3zdlf
	e7lI7dL8GNI/8m2ODXoCwqV2IRlkzi61A1U99JInpuoyXQ1k8JqHP/mRwkkABzt8NO93u01mM2h2H
	a4gm5VQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUuw-0000000Di8b-3DCn;
	Tue, 19 Nov 2024 20:33:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUs9-0000000Dgza-2MrR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20ce65c8e13so50643325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048252; x=1732653052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRmKVkktJnfpekqs0vaEt2UdODXxii8BcnwHInLLVOw=;
        b=tdQuQK3VfHvpeeO5xWbrQBgnx+0ho7qsB1FNIgIAUk5N6uB7zQea8DVi2i5fRConZo
         8AvZK6UWi/aFIoqoQnuAdS6GmbWYHek/8qMRZxHgjGs7QtoFS6NnUgJNdHPtm45SDd0K
         iKOyYQIDbOCXKxYTpw9SzBK8H3FNAjYZ6+0MfaRg99vHPbkGsfbseIyixdTS8BZ0wZcq
         d8YD4ct8jPcU5GnSTDeU0vo2s1UvIPikWUkySVI8pfvlX8ZUnedhP7yMA92opbiCD9OP
         T7zfQwmKuuRg+MqMZT+fJbYWT8Ev0g0dF3nSMR8rSCiAfoPMWixaAp/qADVZR6Vf4as8
         9kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048252; x=1732653052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRmKVkktJnfpekqs0vaEt2UdODXxii8BcnwHInLLVOw=;
        b=HxSyqXf7rU2rQv2ZtsjD8IYkvSmAt1S7rfcGxYBcyQCAdlMGHkeY3ZqHCqzOeMEWHo
         0Bb3kwMQ5sTlN3yP21tbFvMSh1Ljxo7ZGbrJ+zUBXQKg+8KokaT69jE0xh3xuoUYFb6J
         2semYU6p+qtXodOBkNoiuG3TaMoXe+N85teDybvp6Lg9HB1aVg3Cm6bqVNA8C6eUipO4
         j6Y1w8+/4Ixgsciojp6l0C8EI+mgkUqI1bf8qGerfM260ko6+gI1rEckmIlzmXEIS9E5
         3bYMz3/UvaEt9TKXoixeAG7Z7WmLSSUGyF0vH/UdLYeU6zYaDiDyTcJwcxZ8wXN3v2nm
         kTjg==
X-Forwarded-Encrypted: i=1; AJvYcCXQQNr3Zppo93vEM+GC3hLPD10X6NUdhitaZw/2pHudOL3EW0DfI4hbyJFb287Ys9jo7uhCidC5BAr7N+s9uuvF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbc/gzPNHL44JGXvgrEIX1JE4HvxIdrZabRE58EFqfeqxJvLK6
	dfiX0mJaRn86NuhntDZRyoog7S1E03FvMZiPspNS95j/aQCFW9ePZ9T/7xrxw68=
X-Google-Smtp-Source: AGHT+IH6B0MvWBP/cFrV+iSzChrNQ92fntZ29A1EV2WF6+w0INOIuuldt7jmoJ2f0P0WCEdUpH78Ag==
X-Received: by 2002:a17:90b:3c8e:b0:2ea:61de:38ed with SMTP id 98e67ed59e1d1-2eaca7c9f36mr107313a91.26.1732048252407;
        Tue, 19 Nov 2024 12:30:52 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:51 -0800
Subject: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123053_643123_7E8306A8 
X-CRM114-Status: GOOD (  15.48  )
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
 drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 9be38b05f4ad..3ee9bfa5e77c 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 50cbdbf66bb7..f0e845ff6b79 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
@@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
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
 		 * 11 - Risc-V platform specific firmware event
 		 */
-
 		switch (config >> 62) {
 		case 0:
-			ret = RISCV_PMU_RAW_EVENT_IDX;
-			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+			if (sbi_v3_available) {
+				*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+				ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+			} else {
+				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
 			break;
 		case 2:
 			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);

-- 
2.34.1


