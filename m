Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6381C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+od5YJ9p0nUv2AN06du5JF9pN1uvgnK6+9wVlEo+EY=; b=WVvJHV9blUI5CAXbeKn9YEd2Zd
	lVCpeoIra+aqYTQBkYuIU5e+pY3TQyeNOMISL8jZ4PH0doJvJYgOtD6X4TnlIIuxvYYfuAd4ZyiWx
	CLnCFUgT5AWkkbpAqaaPpS4fFbnQg8hExt3hYXm3VDOFZbK0ZPb55HbGWOyADB7sGdF9Y3VPFZqcc
	oHRM3NrzDQ/7TKKUVdFzK9FJwADASmCMBHbM50duLthQYe4g9bZnDiaEwxSUoQNYuKiGC/doWdp4/
	y8gRNYPl2MUFv/pG4hgcaG+GyL4BmD3KP71gyZmoN+jR15s3hMwcEbQAYvnjS5u6UstE/tS5ujzVL
	Z8lwM2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tns1Z-00000009jae-24mR;
	Fri, 28 Feb 2025 04:30:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrjz-00000009gvV-11na
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22328dca22fso26973715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715966; x=1741320766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+od5YJ9p0nUv2AN06du5JF9pN1uvgnK6+9wVlEo+EY=;
        b=J/cd29pQllWWio0TZNXc9JTTMjvT0F8JsX9HoEZ1xSVmc2/EMhzuySvdZ3WGPZ/STA
         E31ct7xqhfCYAJOIL+IO3jK9TSWnCYZZkdYE6iU2NQTI45UpeaCmYdGVkeWQ429i7kGD
         IfF7jKqJYN+84VQ6ZG9qUxeUUqe16OSTsCuAP8tLaqHjaJhZJmAKhtU1RbQYzmrTFM/j
         Eptr4UbH+780LC74x/D+PiBnFhP9xdkVdPNZqoFzhwLFO+Y4tH8tJSfo2vff6H0zdj8g
         WhUGfS+PNTWydQsFO8z7HqbQmwP1WNncanHFiUyTuBUEvS7nJNQIyTu4bjfx1kxOO7BB
         6brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715966; x=1741320766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+od5YJ9p0nUv2AN06du5JF9pN1uvgnK6+9wVlEo+EY=;
        b=L3boAobXGLnxpyeDOOUi/6s0QnV+A5I3K5tMx2X1aem5jDdORCxM+jDHDi19zpMzqw
         RdfGeDjXZqHOKza8tCcXjsUHHBjX/DCdkKSJNATfjlPCFkxmwS6YVTfnl1i05i6GSrVT
         Nly3gbUoEbxeEdek13nbqU8/3VO0Uk2TT7C6mPDozOojhxeDRQQaT5eUHW6d4hdRGdai
         gOn29M82yhqqY7CV5wR7UD9XtnvQ3VWhT03ifEPTrOspYpAhWJ5s0dnI/N8CHeONEjIy
         BjqsAfYD6kKc5lDXxxcp+6KX77GUnYkBjnI3oRqpPXUWr2zoGvz67uJ5Noksl2dz8dJJ
         Xl9g==
X-Forwarded-Encrypted: i=1; AJvYcCXIlyh1tSKy9DYInw9p4qek7IeqUF2P8/k2XkLtg1wfcZfR0tgFW7o21ThC3dFaV4842XoB/nwQM2AoQVZbgjwW@lists.infradead.org
X-Gm-Message-State: AOJu0YxDbB0ZY4Q4SAfUDVA2qh8doM5lx6oGRGPj1WTaP6UeJczzPMFF
	wKhRhHWWg2uUOVNqfRL6QIzmroaMgJU36quRsfNjY+w3srNgGf1/
X-Gm-Gg: ASbGncv5+61xEe21/CvsRv3ZaPG6CwUix+Ele+vZfppyL5DOAeVkYsSDYBXMKVgg3OM
	Ovdr2C9oaazBi5t2cn1OF/nw9MfrMYQ4aWUfOU6hueDjRWrm+FFCudVaJ4zn8vLJfoeoWhvCvEM
	HssQhDgBOsWgWxPJa89Vtm6U3/PiuaZDAtm/uxNY46xP5Cv2djmEkCtdSTlnGhasa8F2y7LHRnW
	Typn/dX/7PVqNLLhE61cPaUrf/b+xffxxjKgwwS6+/LxOHMmRmRcwbDu/0XLJllF+z68ZCmXtmE
	YHKJ7VB3YnX1b4kl2l7Ag5x5+P8=
X-Google-Smtp-Source: AGHT+IH3jun/Z2K4UvU3b0JjkNyhgsqRz0n2b2yF/e1S+BcT8QaOmiJsqCWr/sIagEV9Z7k5b3xmXg==
X-Received: by 2002:a05:6a20:9f88:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-1f2f4e5744fmr2949956637.37.1740715966533;
        Thu, 27 Feb 2025 20:12:46 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:51 +0800
Subject: [PATCH v5 11/11] drivers/perf: apple_m1: Add Apple A11 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-11-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7990; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=XxC160+Tqr+mTtQ6X7QmLpG1hPP7oDUHUV4SHF0c/Ss=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeJDBGjhSQbL4P70UjH1YiLeHfC2A335gKv9
 v8GzqGinxKJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iQAKCRABygi3psUI
 JKGjEACH3k9JOFm9MawJZGkMJ5E5ypJoNn+gPQBZH/dHiEDCqclmmC0w24n8XTCpF/RoR2cH8h7
 P38dKroMnkRDUDylIHUM9K6QD6OWID42cm+BVRJaroSZIJ/lV7PdZ1JrdNvEnp4GyV3nikHRmUg
 cpWomb0LyAeg0UC6za34LxVNURpP/Bw6IGFCtEBIdy0s5sGR8zEn3VnV1pRrfzSd7Nh8ZnYgnx+
 s+14E0ePBzmH3Hhec4klS50lJftHx+SXuugvCCXFojQnT6Tl/R+DC2ZA0PWhLq/7vv9XqecncYZ
 ZESKrXzUS98qn3k2mQv5IDnGhiQo8ZyvCbGdIlY92QvI05jkLFHnEaw843N2I2OkyNZSJk/QyPi
 KTeDaDw8Wa0JYSZLXsPstbvympdo/UlRymaJUPYO56mye2EbfFEGm299cjPudPYD5WA2S60v/RU
 cs0ZxvHCaSbshyccaDiJEc23Myw1jOvOdgj6D3Q8ELXoec8QtR/7D/JGRDmJ+iLj87961V5bhcx
 k7X8icKJeVhgpcnpJcupZgem07fx6DK8b/ybf6Aj6EWnps4ElDjkViTC8r+Jr4aLa6Qzq1v3IpI
 CKPeMRV5D3HA4NWmSUY/o3SL5Jx+OWa4e9r+lfw6s7vtE7rbkSj96F7zjZX5z9g7f4f+Uy2jFEw
 DIGTQo8f/h/EAPA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201247_291547_E19701C1 
X-CRM114-Status: GOOD (  13.06  )
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
index e66ec1426f5d9d48ef52abd539acff7648958785..23d11fcde35b342d841463d83c65b8aee2a493fe 100644
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
@@ -1224,6 +1359,8 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,monsoon-pmu",	.data = a11_pmu_monsoon_init, },
+	{ .compatible = "apple,mistral-pmu",	.data = a11_pmu_mistral_init, },
 	{ .compatible = "apple,fusion-pmu",	.data = a10_pmu_fusion_init, },
 	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
 	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },

-- 
2.48.1


