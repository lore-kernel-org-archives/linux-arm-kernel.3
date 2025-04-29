Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64237C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zud0rDyPmRtSFEeCjx+6zO9A4fHC48w3npIiibg9sIk=; b=jy37WqmupY3ZpgAX6LUqLooCgt
	AKfFRWjcb05d3/Cdqb6CYk1qm/a4pON2fIKrPgSy54yoZm4mkYVe/uAGP9OYT6ehMwvrdbWi4xNjk
	nV+YSYe2Qj+EAeBMT63OjXRph+b5Jx3a9wxuvgz6oWNrAdmKcdYXcWGmD+ZFAMc+w5d+IjgAKOShc
	7W+7dOqonK+O98nP6rYxTHlAVwzT+eYeAAKCLhZobjQam6F0GqbxH6eFweWV2CwDXzr2aO3Kibcqc
	X4jpz/rvOrcfSYI6HGtB3JLDhr1AfbT52kc8dV0d+ZKxKJ+IoZ+7zF+2FaY2Ldey+3pwG4SEDHpVx
	4L4YwIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cHL-00000008GwD-0aPL;
	Tue, 29 Apr 2025 04:09:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btO-00000008DBI-1kuQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 03:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Zud0rDyPmRtSFEeCjx+6zO9A4fHC48w3npIiibg9sIk=; b=DZXbYVVPVunI6f+uwkN4OukMpX
	/sIaeH+JTuqn8IJ93Ut/I1Cp/xqoIWnXsZ4hcS8UqYd+DvL/l6f5VgQnYmdSJybyqCLSgBy4uQFTM
	hixU0oWTOQ2pqwTX8mRrna4oOeqstUGpJCZAwq7ovqb6kg1+5fNajkCPVzS5zgArXH74h31u/Fw74
	6f5ehCuN1l+6NNq2QaBfpnLVt3N3PeM5NWctV/t/GUPA+diESL+wqrBUemC7yvn7lvfD3gaJ86w6t
	Sdgiazg+AhiiMu5/qvOl5bGaJ8Z17vKBb6RIgSNX6LtYKw6oNCWS3lOGzi58cv/cccEHYS9g2CFK8
	t4znG0rg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9btG-0000000DBJk-2Mva
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:20 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30a0c05e2c6so2465753a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898252; x=1746503052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zud0rDyPmRtSFEeCjx+6zO9A4fHC48w3npIiibg9sIk=;
        b=C7R+HcQ2T0LzXiqyhK1exIGLc4STxXFJ2qI5PA/7i+YWw2F1cL2yrP99VyvdciBW41
         ykwxWc7O/1uAAi9Ke5NU0uhixyWkD3oPG/+Hq0NqRMHjSHPgZdINRN5mKUq2rHAUcYDw
         eFS99UN/jufp9UuVPl/K81lm8A95ciS/IjegHOQkPDShhqjBaPMuehrOq80kQrBeym0I
         phAByeMN/LZPo2uYAAIDVZeZ232kVichKmPRyMtzNHgb1CDrozwLHZKxzMQyMP0kzoOV
         NnChPLOG4t3QzqdKJ871677kWXJe/2sCe4r8ckpVE+8Tv/xnhfc84MuJBMBefJbnq+sf
         0MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898252; x=1746503052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zud0rDyPmRtSFEeCjx+6zO9A4fHC48w3npIiibg9sIk=;
        b=XXVh/dEwQeUqyl9paLI+Oqr9T2pplUf4FTCtzn+Lp+vJY1gjzDTw4+tgz5mSO97mEE
         Kl2mXQbqpAOh+yzL3adUa6uyKVn+GINcxtr8vqiz5ulashSvjzVcul20f30t6bmrB/Oo
         2LKX9iJKYfkI9wzfwXRVhRgtQSLM319VG/k1yTWB+utp7SoPYNiPZGAm4JIoxILF8wbo
         uOlNCmgtweftOApIrPbyx+CYfgaWm1D8uwmbJBVx9V1GpmX6/cKBZ3NLI1OS8+4O3AyP
         KVXAjx9itcUSesWWRZmQdQ3/DS9rpFpjldVwC0KxleLt49j/wtaRBGi75+KMYvp3KCZw
         vbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX///4CxvhlxysTBI2/7WybOP+NnKnj48f4lFIklEvBkcpcOS94Q50O5AzfoDxHBDltHmIhcQ3mCi2B07ZlxmNB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/SrJnEhjUa93t9buzjzmkjYTGAYF+Zc7P2ybuMKrjjjrIXu41
	FtQlGPk/vR7x5vWEyGEg39RUcwx4//7yC6EZkr54VnvadirnX58X
X-Gm-Gg: ASbGncsNi5ewXJT7gFUSYGC7xEs1ME18Fs7QIlXFeflZSJsz97PDckXbq9Go09QxQaK
	nL0qvbZFx7iC7DETgQbjcjIOJSgfrgea1N1uP6Q58Ip1GoB7OMGgLCoGYKhWldiPgR97aFqTSEH
	hQLPoqNCpuhUIkazB8cnTrRE6llU9oBrbhkKi2KcPUezd4sMIruJaV8A947rVIOYva+0dgaBft5
	YDVm12OM8YZsA6img5L13jy5UdvQD60Bqo7Gc7+5wPo5/9a5pd+/E5yl8qdNv1vD+uSdfAqae6p
	h+WHMFxwsBbQ3lhzT4hDnLopV5IVsZmPZM0nIdY1YljXPMPk4cRAyAdfqrFx5WANuPfo
X-Google-Smtp-Source: AGHT+IHfIzozlj8YgE6Iu7wuMUCBp9SR4AIXbCVqliJ9pBWHex6sA60apxWIGxwjUcZXocO34qR04A==
X-Received: by 2002:a17:90a:c2cb:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-30a23dd6d1fmr2059498a91.12.1745898251810;
        Mon, 28 Apr 2025 20:44:11 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:11 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:34 +0800
Subject: [PATCH RESEND v6 10/21] drivers/perf: apple_m1: Add A9/A9X support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-10-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6996; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EBSRx3c6U11weHNs7rjc5+muXlHyhv1nGdUlu9ALZYY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErkGd4ROCHIuc5+Zh4pEPpd2vjZCxq3TGQd4
 zZ+j8DCT+uJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5AAKCRABygi3psUI
 JI4kD/9pXy7hz1euWX4lpCewM64g4T9Rlrdgs2DTkdTYnNRE7p7bdz20vYDKKM9vHzaSyY+cWQR
 Zcd1zLfR74Kg4+mC90WPbGPNoXh3cJK+A5DIayunIDFcI3YmKW+9jdax0RZVmtkznM9owxgPKD1
 bdYyNE7FBLl+5x/8c8vCe2nsxx0MvWaHled3Qb9ofQcrJ9tluVJZCCOocle6dL2W4/OmB4Qrt4V
 Z76Osg9noeFRlvXqiekW0wQrnnGfspr8RCs0mI4UZycT4bIYLZ++VUR/Ok99pypMMrjR+XxN6H3
 /Xqlib2E1XZR/0nn8C7KNBJvu3+LkfNY7bioTDZx8njs5F0RkB+6rLbaqdEmEo8lauW5jodZBIO
 I0Kr4LIyauYHhd+NRSWPq9uZMFvMgYqnc75y2tQsrpuK5f/2TMXLt85nGTeadXVMFCneV/1pXVT
 +p+eKJArm/vPZrg7U3B++LYHXy4naehAh0pc49ip/HkUiVY8GHhRu65DjjGXCnQe+p40Io2hHIc
 ZEo3b/QXuLcjqMBytn7iVWdd8En591AlZYbh8BA3tw/YuNnJ11Rm9RJ3KBJfznUliOL5EnOthdg
 FrT5yWra8hXBPh7CpHK8RwA2jVoG3xaDjbFPVm5BtkYCzH0wgrJkltAcR4GmMNgWyG0Wo9QfV2J
 l8kB1YMTVCDECeQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_044415_980724_F36A6870 
X-CRM114-Status: GOOD (  13.66  )
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

Add support for CPU PMU found in the Apple A9 and A9X SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 121 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 5739a85f3ae07c52f4ce91c4eda3e4bcdf91015d..0f59a22812a424ecd442e731a5c6b5be828be77c 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -289,6 +289,109 @@ static const u16 a8_pmu_event_affinity[A8_PMU_PERFCTR_LAST + 1] = {
 	[A8_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_3_5_7,
 };
 
+
+enum a9_pmu_events {
+	A9_PMU_PERFCTR_UNKNOWN_1				= 0x1,
+	A9_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	A9_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0xa,
+	A9_PMU_PERFCTR_L2_TLB_MISS_DATA				= 0xb,
+	A9_PMU_PERFCTR_L2C_AGENT_LD				= 0x1a,
+	A9_PMU_PERFCTR_L2C_AGENT_LD_MISS			= 0x1b,
+	A9_PMU_PERFCTR_L2C_AGENT_ST				= 0x1c,
+	A9_PMU_PERFCTR_L2C_AGENT_ST_MISS			= 0x1d,
+	A9_PMU_PERFCTR_SCHEDULE_UOP				= 0x52,
+	A9_PMU_PERFCTR_MAP_REWIND				= 0x75,
+	A9_PMU_PERFCTR_MAP_STALL				= 0x76,
+	A9_PMU_PERFCTR_MAP_INT_UOP				= 0x7c,
+	A9_PMU_PERFCTR_MAP_LDST_UOP				= 0x7d,
+	A9_PMU_PERFCTR_MAP_SIMD_UOP				= 0x7e,
+	A9_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x84,
+	A9_PMU_PERFCTR_INST_ALL					= 0x8c,
+	A9_PMU_PERFCTR_INST_BRANCH				= 0x8d,
+	A9_PMU_PERFCTR_INST_BRANCH_CALL				= 0x8e,
+	A9_PMU_PERFCTR_INST_BRANCH_RET				= 0x8f,
+	A9_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x90,
+	A9_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x93,
+	A9_PMU_PERFCTR_INST_BRANCH_COND				= 0x94,
+	A9_PMU_PERFCTR_INST_INT_LD				= 0x95,
+	A9_PMU_PERFCTR_INST_INT_ST				= 0x96,
+	A9_PMU_PERFCTR_INST_INT_ALU				= 0x97,
+	A9_PMU_PERFCTR_INST_SIMD_LD				= 0x98,
+	A9_PMU_PERFCTR_INST_SIMD_ST				= 0x99,
+	A9_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
+	A9_PMU_PERFCTR_INST_LDST				= 0x9b,
+	A9_PMU_PERFCTR_INST_BARRIER				= 0x9c,
+	A9_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	A9_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
+	A9_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0xa3,
+	A9_PMU_PERFCTR_LD_UNIT_UOP				= 0xa6,
+	A9_PMU_PERFCTR_ST_UNIT_UOP				= 0xa7,
+	A9_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0xa8,
+	A9_PMU_PERFCTR_LDST_X64_UOP				= 0xb1,
+	A9_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_SUCC			= 0xb3,
+	A9_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_FAIL			= 0xb4,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xbf,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xc0,
+	A9_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xc1,
+	A9_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xc4,
+	A9_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xc5,
+	A9_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xc6,
+	A9_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC		= 0xc8,
+	A9_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xca,
+	A9_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xcb,
+	A9_PMU_PERFCTR_FED_IC_MISS_DEMAND			= 0xd3,
+	A9_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xd4,
+	A9_PMU_PERFCTR_MAP_DISPATCH_BUBBLE			= 0xd6,
+	A9_PMU_PERFCTR_FETCH_RESTART				= 0xde,
+	A9_PMU_PERFCTR_ST_NT_UOP				= 0xe5,
+	A9_PMU_PERFCTR_LD_NT_UOP				= 0xe6,
+	A9_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	A9_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	A9_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
+
+	/*
+	 * From this point onwards, these are not actual HW events,
+	 * but attributes that get stored in hw->config_base.
+	 */
+	A9_PMU_CFG_COUNT_USER					= BIT(8),
+	A9_PMU_CFG_COUNT_KERNEL					= BIT(9),
+};
+
+static const u16 a9_pmu_event_affinity[A9_PMU_PERFCTR_LAST + 1] = {
+	[0 ... A9_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[A9_PMU_PERFCTR_UNKNOWN_1]				= BIT(7),
+	[A9_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[A9_PMU_PERFCTR_INST_ALL]				= BIT(7) | BIT(1),
+	[A9_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_INT_ST]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_INT_ALU]				= BIT(7),
+	[A9_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_SIMD_ALU]				= BIT(7),
+	[A9_PMU_PERFCTR_INST_LDST]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BARRIER]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_UNKNOWN_9f]				= BIT(7),
+	[A9_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_3_5_7,
+	[A9_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_3_5_7,
+};
+
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
 	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
@@ -797,6 +900,12 @@ static int a8_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return apple_pmu_get_event_idx(cpuc, event, a8_pmu_event_affinity);
 }
 
+static int a9_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a9_pmu_event_affinity);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -986,6 +1095,17 @@ static int a8_pmu_typhoon_init(struct arm_pmu *cpu_pmu)
 	return apple_pmu_init(cpu_pmu, A7_PMU_NR_COUNTERS);
 }
 
+static int a9_pmu_twister_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_twister_pmu";
+	cpu_pmu->get_event_idx	  = a9_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = a7_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	return apple_pmu_init(cpu_pmu, A7_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
@@ -1035,6 +1155,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
 	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
 	{ },

-- 
2.49.0


