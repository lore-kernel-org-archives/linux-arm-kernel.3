Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544FEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+x1KwZxNSrdIMQmJdRQQHZgni7JuWBTiuRq1uomt/9I=; b=Xb2qlxFxkBcCZLOqm3g8Oe6mle
	gvhMm8ncRn9+0zVZB1MsL0GUf1QR1HBXOEj5WIYqlc3IIyZL7jSt9+f1OuNpUJ9OAeiqvaLCt3PJb
	NXA4HhSjAEESVlRQHC3ZOzwRA/6VoKE6l/E2La84mDrxiff1KamXVimQaq0C/8YUAlUHkcen9Qn80
	XvbFxBHhAz/C38GEXzX0KkuaM2HMdj3dTIAh7avDJq4NBjgPtF1EXkAN7siKF4hg8BejG7pr0Q+nZ
	jCuytbEMqUDRgWW0Fl8YrdRpMGkUegPucpWJjM+4C4n5lv/lB0itcJJGL+ROpiUN2XoDa+bQTa0Rh
	LS5fcdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwz7-0000000FD6X-11ZL;
	Fri, 14 Feb 2025 14:48:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwie-0000000F9up-0NdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:31:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220dc3831e3so27537985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543463; x=1740148263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+x1KwZxNSrdIMQmJdRQQHZgni7JuWBTiuRq1uomt/9I=;
        b=exS032qJl7SiyD7fwcPKbPtxkY9nXJ1EADQNT3gEaXNgqgCnKlxdXq6h8AKProFa7Y
         Zm2594OA/tF0BOqPsPpo23Nt6l9QzjWwsMDqpWfUr9LNj6K9JgZJJwCjd+OUvIToHmTO
         FRp52ucBFmRQmvX6pD7gnJ0K9QkKdcosble7ymtHd+pBVumYUT37epwqB4I0oV9lpB57
         tHFy74Gcbcr38GNClsfhz2H3XCN+ytt/xwiy1eAlimgnxknkXQEpQFqwvi2CB2vnGS0B
         dZAzm0PUwiQELLx+ValyXUrNFvvXc6QjDPoxVnp+QnD52hD9KsC7jrFVwLVZDhbchcNu
         1FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543463; x=1740148263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+x1KwZxNSrdIMQmJdRQQHZgni7JuWBTiuRq1uomt/9I=;
        b=G1ZsG5Dv9SIvGcxgZe73pgupsVfb/Gzv2uTZO2hhN/aSfA9kxwm+eksLHySuX8MiBn
         yW65Il8fj4MTGmpzaZ1+XLse9+Qlmja+DqFIMXqN5g0ROSiWN1SucCBNdA1EBe0obzBO
         1/t6YTZOB497S0Pmbe+G/Ahm2rqOHHlpzFXTmhf8lxtl5XVSISp/qXpnpBQ0/QJJL4dp
         YcNPW36j9//IERxnM9zinslkw4FHo++NgfJsEzlsDCJ6lrgUGR0Ep3DQ3Te7V/COXU0i
         w62eUxUBKWafWu1PCB6V2n6AiuO1BH8WqoMsAMe3WjX24djT7/4zaePZcpTxMHgInnzQ
         WUew==
X-Forwarded-Encrypted: i=1; AJvYcCXa5LNwIAreWA5Ic/vnFR7IOEt+Kk22C/EQ3UPskU2WRyuLq6KYhEVheNO2PH5KVCLnPcOw4dyurAQEc0Hwvwkp@lists.infradead.org
X-Gm-Message-State: AOJu0YxGknn6a6ksfZzSWv+7WKcqwgb1RDegfxBaE+jMWcUK0M0ajwxl
	gNvyUxDQZ7cQDPQhEALf2I5ztpGPydhKkvUaD52c4LuZrcKHhzej
X-Gm-Gg: ASbGnctibzx45Px9LOCbH+4xecO2JZ5d+p2VwWv1IyONIL7680nSZVpExJTMmLI/Mb8
	jusIko5vT6wRZaqYd338/tJzVGFg2CtkHlLGb14U4zXH33mELLM4E5nNRDXUZlJXl/6l/rMYtYz
	0dFQ04Vl7/gCBJiZqA2E4G7GDiq3QTbNqTxF4itMgaLby7yR9GjVe7+xLCpc4g9HvxmFEjvfRMi
	zBVUBqT4l37sUmJoiPjaGhtYxc0Pb9QlGP5jXoKB3Kck03U/5wzyXPk6hCNYtKNSFRRoKEiXjIr
	+TSZPRrbYaiglXfSOg==
X-Google-Smtp-Source: AGHT+IHEd6g8rP3PTcEbBpzib/KLNqeBwuG6Z4mi0XCVCkr3oKIt0ITp/BFhBdGufa+NvOOdmbN/zA==
X-Received: by 2002:a17:903:2f81:b0:21f:40de:ae4e with SMTP id d9443c01a7336-220d36ea10amr117696205ad.9.1739543463400;
        Fri, 14 Feb 2025 06:31:03 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:31:02 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:37 +0800
Subject: [PATCH v4 11/11] drivers/perf: apple_m1: Add Apple A11 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-11-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7988; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=vvdMzw8bbPqoK9nrfiGpyfrLmTCkg8tuW8G+NgndUa8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OBOzmp7pWtB1lpiFZND5Ndbu/T1g/ic/Bft
 qX0WwtkiuuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgQAKCRABygi3psUI
 JBBKD/9yFe75eK7f5/j3i4+TcAJIGyyJ4DFJC1sEoNntPqQc0achTFOrYvOBV/IRd3e+VX0jxkH
 wNoxXgT68wzXzV872iUFuHCVuKJNpy8zV5Tta1ig1GaqB5USx9egspLv7svPJ1i9fRnZvPkBzNh
 6P0rm+lQk0/F4C2zDXCUea37WyrGtDajyMjPaFEILOsdZ88QEmH49sNIgRpKS5qch4yTwdZ1uAz
 ffePcFyz+CNmZ4eR7hAWEf/5ZvSkP+iVftf7vpuCMus/yNTaya9ULZdarccwqOPEeZkEfT9GRTT
 jyO2E6nr2n72kgucJL6AY0V2DIV/DHBzHt8bhD7AscXdhyRtcj5obwR6TxUlBqbPqGHB6bq/5jT
 Um4JDPaQAJMTLNGdmzfpNvIw+jkStpFHBM29c4bTmB37NS4YDVPVGhttQ1xriXHsSTyO83C4wcY
 jCRphxeMmT6C5FHKQ1aOQNIuv+pfXRfPWFGPun4z2yE114SsWvcZbGmFHRoFa2fsvyIjQWHf5/P
 hrfYCXL5JkVz0vGDeNunpXa3sxgAQxGdUMV3Tt36W+3j8c6tXfE47qEnKxlCBAGYahFLg+7UjQg
 OBJyHl8jKGwx4F78+fMgFZ0jAONi+nQF+3Id2G7ed0S47RjKYEl6lG3U+5mSAYyV/eHXWCuLBjS
 iqGovy2dSHL77Eg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063104_136760_8FDE11F8 
X-CRM114-Status: GOOD (  13.23  )
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

Add support for the CPU PMU found attached to the performance and
efficiency cores of the Apple A11 SoCs. This PMU can deliver its
interrupt via IRQ or FIQ. Use FIQ as that is faster.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 137 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index e66ec1426f5d9d48ef52abd539acff7648958785..612ec0dfacaa9c3fc43a3c122d836193494967ad 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -500,6 +500,113 @@ static const u16 a10_pmu_event_affinity[A10_PMU_PERFCTR_LAST + 1] = {
 	[A10_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
 };
 
+enum a11_pmu_events {
+	A11_PMU_PERFCTR_RETIRE_UOP				= 0x1,
+	A11_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	A11_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0xa,
+	A11_PMU_PERFCTR_L2_TLB_MISS_DATA			= 0xb,
+	A11_PMU_PERFCTR_SCHEDULE_UOP				= 0x52,
+	A11_PMU_PERFCTR_MAP_REWIND				= 0x75,
+	A11_PMU_PERFCTR_MAP_STALL				= 0x76,
+	A11_PMU_PERFCTR_MAP_INT_UOP				= 0x7c,
+	A11_PMU_PERFCTR_MAP_LDST_UOP				= 0x7d,
+	A11_PMU_PERFCTR_MAP_SIMD_UOP				= 0x7e,
+	A11_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x84,
+	A11_PMU_PERFCTR_INST_A32				= 0x8a,
+	A11_PMU_PERFCTR_INST_T32				= 0x8b,
+	A11_PMU_PERFCTR_INST_ALL				= 0x8c,
+	A11_PMU_PERFCTR_INST_BRANCH				= 0x8d,
+	A11_PMU_PERFCTR_INST_BRANCH_CALL			= 0x8e,
+	A11_PMU_PERFCTR_INST_BRANCH_RET				= 0x8f,
+	A11_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x90,
+	A11_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x93,
+	A11_PMU_PERFCTR_INST_BRANCH_COND			= 0x94,
+	A11_PMU_PERFCTR_INST_INT_LD				= 0x95,
+	A11_PMU_PERFCTR_INST_INT_ST				= 0x96,
+	A11_PMU_PERFCTR_INST_INT_ALU				= 0x97,
+	A11_PMU_PERFCTR_INST_SIMD_LD				= 0x98,
+	A11_PMU_PERFCTR_INST_SIMD_ST				= 0x99,
+	A11_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
+	A11_PMU_PERFCTR_INST_LDST				= 0x9b,
+	A11_PMU_PERFCTR_INST_BARRIER				= 0x9c,
+	A11_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	A11_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
+	A11_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
+	A11_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
+	A11_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0xa3,
+	A11_PMU_PERFCTR_LD_UNIT_UOP				= 0xa6,
+	A11_PMU_PERFCTR_ST_UNIT_UOP				= 0xa7,
+	A11_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0xa8,
+	A11_PMU_PERFCTR_LDST_X64_UOP				= 0xb1,
+	A11_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_SUCC		= 0xb3,
+	A11_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_FAIL		= 0xb4,
+	A11_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xbf,
+	A11_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xc0,
+	A11_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xc1,
+	A11_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xc4,
+	A11_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xc5,
+	A11_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xc6,
+	A11_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC	= 0xc8,
+	A11_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xca,
+	A11_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xcb,
+	A11_PMU_PERFCTR_FED_IC_MISS_DEMAND			= 0xd3,
+	A11_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xd4,
+	A11_PMU_PERFCTR_MAP_DISPATCH_BUBBLE			= 0xd6,
+	A11_PMU_PERFCTR_L1I_CACHE_MISS_DEMAND			= 0xdb,
+	A11_PMU_PERFCTR_FETCH_RESTART				= 0xde,
+	A11_PMU_PERFCTR_ST_NT_UOP				= 0xe5,
+	A11_PMU_PERFCTR_LD_NT_UOP				= 0xe6,
+	A11_PMU_PERFCTR_UNKNOWN_f5				= 0xf5,
+	A11_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	A11_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	A11_PMU_PERFCTR_UNKNOWN_f8				= 0xf8,
+	A11_PMU_PERFCTR_UNKNOWN_fd				= 0xfd,
+	A11_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
+
+	/*
+	 * From this point onwards, these are not actual HW events,
+	 * but attributes that get stored in hw->config_base.
+	 */
+	A11_PMU_CFG_COUNT_USER					= BIT(8),
+	A11_PMU_CFG_COUNT_KERNEL				= BIT(9),
+};
+
+static const u16 a11_pmu_event_affinity[A11_PMU_PERFCTR_LAST + 1] = {
+	[0 ... A11_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[A11_PMU_PERFCTR_RETIRE_UOP]				= BIT(7),
+	[A11_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[A11_PMU_PERFCTR_INST_ALL]				= BIT(7) | BIT(1),
+	[A11_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_INT_ST]				= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_INT_ALU]				= BIT(7),
+	[A11_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_SIMD_ALU]				= BIT(7),
+	[A11_PMU_PERFCTR_INST_LDST]				= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_INST_BARRIER]				= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_UNKNOWN_9f]				= BIT(7),
+	[A11_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A11_PMU_PERFCTR_UNKNOWN_f5]				= ONLY_2_4_6,
+	[A11_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_2_4_6,
+	[A11_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_2_4_6,
+	[A11_PMU_PERFCTR_UNKNOWN_f8]				= ONLY_2_TO_7,
+	[A11_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
+};
+
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
 	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
@@ -993,6 +1100,12 @@ static int a10_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return apple_pmu_get_event_idx(cpuc, event, a10_pmu_event_affinity);
 }
 
+static int a11_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				 struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a11_pmu_event_affinity);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -1175,6 +1288,28 @@ static int a10_pmu_fusion_init(struct arm_pmu *cpu_pmu)
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
+static int a11_pmu_monsoon_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_monsoon_pmu";
+	cpu_pmu->get_event_idx	  = a11_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
+}
+
+static int a11_pmu_mistral_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_mistral_pmu";
+	cpu_pmu->get_event_idx	  = a11_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
@@ -1225,6 +1360,8 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
 	{ .compatible = "apple,fusion-pmu",	.data = a10_pmu_fusion_init, },
+	{ .compatible = "apple,monsoon-pmu",	.data = a11_pmu_monsoon_init, },
+	{ .compatible = "apple,mistral-pmu",	.data = a11_pmu_mistral_init, },
 	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
 	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },

-- 
2.48.1


