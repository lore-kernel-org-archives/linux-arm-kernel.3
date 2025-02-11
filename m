Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB88C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWlUXgrcSfzXV71CLDNlCta0MjhBp7vcCQWkXEx+E1g=; b=nR8M50uW2W0Wf7ue9S1mS5bhk5
	vlkomT3rihF//LBeqnlzuwg9aYXY1FSH9An8ao6Q6nW1ezQDsDttjBUjA88y3WynSC2r9N643OXWH
	/YNxi0lwlz+8bl1+Rxl7umIN+iv6J98t/flMTmaSmInk9HVlfOiaG4/JW4gKUDZioeRWTDGs4Zv68
	/T8HZS1PH2owWuNiHrAU8pOtJTu13SCkAlhCClOgKSK5wC1ZECwogx+wcbDauee+kU9t78UDfOwxe
	TvDQ7uqYOHTrhzvoWtChujRpzcC1gCA43O0dEqJlOvtsjRgR7jkRR3oZk44SH+nxJwivS3OkowrLi
	oMgVqJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tht2o-00000004UGW-1TPs;
	Tue, 11 Feb 2025 16:23:30 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsoS-00000004QWR-1Qrj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fa2eb7eb45so6453632a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290120; x=1739894920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWlUXgrcSfzXV71CLDNlCta0MjhBp7vcCQWkXEx+E1g=;
        b=NBEx1RYLeR9PztlRoWXEGiirpuZtUO6EZffSoKm+jrhMRFKPjcK3OWhjs/a25FLtxf
         P3h2N6He8RLWF5uGPKqsd+96p/UFhlQtSq6a6r/n8MyzYJLB7MAsl5JCCQqJbY0/4cNX
         DylFKecPANgXi1QAynSWz3hvz+ghaNoCqP1SeYPPqyJoa27epj22FBOrq1ytGuTII/88
         hifuxqcr5zFJv6lmiYDVdNjxZiCQ+xMD1GO1D6vbhwBsmyCMvL3OX9zOuqSbNwjBAJVy
         PrS6/HX6Y89RyE87+9srCapHdJqcmbt8bQD+/wQ0WfqQXzusHYvUfaC1Uv1jepWUmJaC
         uQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290120; x=1739894920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWlUXgrcSfzXV71CLDNlCta0MjhBp7vcCQWkXEx+E1g=;
        b=m/oZcG5jdzIInatvEneldINBPtzf9ALzGYGYz0CCUERouekHrlQ159jzPLku9d6kRM
         dPsXpfrIP/q0WVsoPH2LuN2dVr9mJ4XrdlnuQohR6Bj9GkEDnQ492jn2zGmeBUypPdBu
         a9WnY+1RDTALl9xxIqnZ7JCiHY6VD9LkB5BNnM0f2XvcuAEWKqJ3Olk8xJReF8O9Ymz0
         7cRaQcByByGFICmHRHkZ+2ZKK8t8czUf80ULMZdf3frsEX2ws5KqwoFIE9BYBYDnRHNx
         b9TzmBPvOoWBoTv+f5b1/xk3NzMrjP3yTajFFiTZE5boX+HvIzK9WbVFCnGUZwlOVSM0
         Lx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS+pIzxRtPC03MK/BUFhqALZ+EF0+RD8CVGnIoGzTDt4AspWRJBzgevoeMr+oRjimc7nOi46+R5C+U0PPlwuDA@lists.infradead.org
X-Gm-Message-State: AOJu0YyAAsZiXuuKS1wtSApD+WBV5cj9Pc3rCNZ5+not8UXALIpoQmr+
	3G9j7DtGaeWsl1UiR01fXRGih+CUqa3jOn4B+1I7rl2at32eRBa2
X-Gm-Gg: ASbGnctnMwZ5WHBl6e0IS1y1eMVFNV6+nBEklXSE0FXiPwoW7HNtB230+LSaU1fqZlk
	DaN6aYWPLYQfsndp9R7JrA9nDroAA53+5TEQ/9f02cgNbNklOUOnw3huBnmlzQM9xvynOALqZdZ
	b4zlRTzjdybdQhApzH8VhFt84LRt1Ix2jNTQXUn1YLCWu8uU9p2UcS/RqMXk2WBsVCYyLtAdOfI
	8W6PzKy5+jjO3rVyZt0Xu1Ky3fvHshRAojsrsZ7y6iDWnYMkN0y/e85K0bC+3B/8OPBMPJaTxT1
	mKn30F+Sy20wXFyVWg==
X-Google-Smtp-Source: AGHT+IEIOp+XGPrwJW4/JKLX8mEcEEgyiukNRwRyimMyprziw7oEUoS6JuVmvLqcmRvsKw6+P5+WYg==
X-Received: by 2002:a17:90b:4b0d:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2faa0960968mr6370291a91.14.1739290119538;
        Tue, 11 Feb 2025 08:08:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:30 +0800
Subject: [PATCH 09/10] drivers/perf: apple_m1: Add Apple A10/A10X/T2
 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-9-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7446; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=W9uY1CyO/fNFWnV4SvZDTZzRBUZIyLr+QMGimmcF68Q=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3XoOyvVI1097oDlq0qYDGdrP6JqU4Lc0evSz
 6+3jNETf5mJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t16AAKCRABygi3psUI
 JBXGD/9kzjVE7bdpwvNITu6iyMf7pc17P8PeXlQj5dDu/tY3BSe+jxQUghg+kLSBGg4ARaZVXsV
 pFjiTqXeO7I7XES11u7c90S8Sxx0El4qnRqdbZosr5KhmQb34rc5by89IQgG3BTRCL2EHO1ztxG
 vxDhuRCDtxUO1LrZiJVxEB8RU+gz9bmzceAip7mKBAdBbFWSHCQq+VZY3h6kq4Uguav9LWIpdkn
 5Hp6nUTTCbWSMfIYmErOrS/lAdBUQSd6ZVu7SkGDF9cI8iBcMHbgrp53nitbM0UIAxNTrszV9Sr
 FHhPpLprGsuJ3JzWthabbckK91WhGtIRU1LYDxbkSJDJB66mwMN9DwaKOd/YSfGF4dJFIGMGAcJ
 XyI6SL5outuc9s7q1VIpFt88TR/vfVu/Gll9iIwLaV1NKhGdcJbeyOKyOeQqX2OaDleUte7cdmf
 8szuny1ikj3qDoJ8CMAI379c3aHHonFTJn9uCXq55mvwUBtel4yzgFcZtYUQGL5jmlFszytaIli
 i82ndSBWuM3COxJ4ysgfMexr0jxju1zN/ASIIKyXwvofG2x+4CspDGl1IfsBKHqe2IJyhyNfVU9
 Cst2TfP4HygJgC6kHV6j8dkhUXUm0tRUt4FRXV2AgenpXSRI5qB4lCk0aeB6Y+ZhJZ7/5BucHq5
 4+o1Y4oRvFz/fjA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080840_393606_101F789F 
X-CRM114-Status: GOOD (  13.44  )
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

Add support for the CPU PMU found in the Apple A10, A10X, T2 SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 126 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 1575f8eda874345eb56c00f8243833308c63a84a..2eafcb1bfcf6bf4b57a939c5470552cba81e7758 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -391,6 +391,115 @@ static const u16 a9_pmu_event_affinity[A9_PMU_PERFCTR_LAST + 1] = {
 	[A9_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_3_5_7,
 };
 
+enum a10_pmu_events {
+	A10_PMU_PERFCTR_RETIRE_UOP				= 0x1,
+	A10_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	A10_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0xa,
+	A10_PMU_PERFCTR_L2_TLB_MISS_DATA			= 0xb,
+	A10_PMU_PERFCTR_L2C_AGENT_LD				= 0x1a,
+	A10_PMU_PERFCTR_L2C_AGENT_LD_MISS			= 0x1b,
+	A10_PMU_PERFCTR_L2C_AGENT_ST				= 0x1c,
+	A10_PMU_PERFCTR_L2C_AGENT_ST_MISS			= 0x1d,
+	A10_PMU_PERFCTR_SCHEDULE_UOP				= 0x52,
+	A10_PMU_PERFCTR_MAP_REWIND				= 0x75,
+	A10_PMU_PERFCTR_MAP_STALL				= 0x76,
+	A10_PMU_PERFCTR_MAP_INT_UOP				= 0x7c,
+	A10_PMU_PERFCTR_MAP_LDST_UOP				= 0x7d,
+	A10_PMU_PERFCTR_MAP_SIMD_UOP				= 0x7e,
+	A10_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x84,
+	A10_PMU_PERFCTR_INST_ALL				= 0x8c,
+	A10_PMU_PERFCTR_INST_BRANCH				= 0x8d,
+	A10_PMU_PERFCTR_INST_BRANCH_CALL			= 0x8e,
+	A10_PMU_PERFCTR_INST_BRANCH_RET				= 0x8f,
+	A10_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x90,
+	A10_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x93,
+	A10_PMU_PERFCTR_INST_BRANCH_COND			= 0x94,
+	A10_PMU_PERFCTR_INST_INT_LD				= 0x95,
+	A10_PMU_PERFCTR_INST_INT_ST				= 0x96,
+	A10_PMU_PERFCTR_INST_INT_ALU				= 0x97,
+	A10_PMU_PERFCTR_INST_SIMD_LD				= 0x98,
+	A10_PMU_PERFCTR_INST_SIMD_ST				= 0x99,
+	A10_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
+	A10_PMU_PERFCTR_INST_LDST				= 0x9b,
+	A10_PMU_PERFCTR_INST_BARRIER				= 0x9c,
+	A10_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	A10_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
+	A10_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0xa3,
+	A10_PMU_PERFCTR_LD_UNIT_UOP				= 0xa6,
+	A10_PMU_PERFCTR_ST_UNIT_UOP				= 0xa7,
+	A10_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0xa8,
+	A10_PMU_PERFCTR_LDST_X64_UOP				= 0xb1,
+	A10_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_SUCC		= 0xb3,
+	A10_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_FAIL		= 0xb4,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xbf,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xc0,
+	A10_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xc1,
+	A10_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xc4,
+	A10_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xc5,
+	A10_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xc6,
+	A10_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC	= 0xc8,
+	A10_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xca,
+	A10_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xcb,
+	A10_PMU_PERFCTR_FED_IC_MISS_DEMAND			= 0xd3,
+	A10_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xd4,
+	A10_PMU_PERFCTR_MAP_DISPATCH_BUBBLE			= 0xd6,
+	A10_PMU_PERFCTR_L1I_CACHE_MISS_DEMAND			= 0xdb,
+	A10_PMU_PERFCTR_FETCH_RESTART				= 0xde,
+	A10_PMU_PERFCTR_ST_NT_UOP				= 0xe5,
+	A10_PMU_PERFCTR_LD_NT_UOP				= 0xe6,
+	A10_PMU_PERFCTR_UNKNOWN_f5				= 0xf5,
+	A10_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	A10_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	A10_PMU_PERFCTR_UNKNOWN_f8				= 0xf8,
+	A10_PMU_PERFCTR_UNKNOWN_fd				= 0xfd,
+	A10_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
+
+	/*
+	 * From this point onwards, these are not actual HW events,
+	 * but attributes that get stored in hw->config_base.
+	 */
+	A10_PMU_CFG_COUNT_USER					= BIT(8),
+	A10_PMU_CFG_COUNT_KERNEL				= BIT(9),
+};
+
+static const u16 a10_pmu_event_affinity[A10_PMU_PERFCTR_LAST + 1] = {
+	[0 ... A10_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[A10_PMU_PERFCTR_RETIRE_UOP]				= BIT(7),
+	[A10_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[A10_PMU_PERFCTR_INST_ALL]				= BIT(7) | BIT(1),
+	[A10_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_INT_ST]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_INT_ALU]				= BIT(7),
+	[A10_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_SIMD_ALU]				= BIT(7),
+	[A10_PMU_PERFCTR_INST_LDST]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BARRIER]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_UNKNOWN_9f]				= BIT(7),
+	[A10_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_UNKNOWN_f5]				= ONLY_2_4_6,
+	[A10_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_2_4_6,
+	[A10_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_2_4_6,
+	[A10_PMU_PERFCTR_UNKNOWN_f8]				= ONLY_2_TO_7,
+	[A10_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
+};
+
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
 	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
@@ -864,6 +973,12 @@ static int a9_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return apple_pmu_get_event_idx(cpuc, event, a9_pmu_event_affinity);
 }
 
+static int a10_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a10_pmu_event_affinity);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -1033,6 +1148,16 @@ static int a9_pmu_twister_init(struct arm_pmu *cpu_pmu)
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, A7_PMU_NR_COUNTERS);
 }
 
+static int a10_pmu_fusion_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_fusion_pmu";
+	cpu_pmu->get_event_idx	  = a10_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, M1_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
@@ -1078,6 +1203,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,fusion-pmu",	.data = a10_pmu_fusion_init, },
 	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
 	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },

-- 
2.48.1


