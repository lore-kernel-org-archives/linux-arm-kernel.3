Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBECAEEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9+piKMs9G1VmQiTpap3yj2Hp00XA4sCypGJ/MWdS5Q=; b=4QH5OPLzkAMMN/TTCGwnO+jwHN
	2YQcDNqWTEVNHXAj50KJ+azwZRqf02oTS5ytMFp5+m6ax98FvL0C3UV7NYr/194w7iK1FFqIrR9K1
	mEvJ4aX2X0fQJLoK6jf2LyJc+i2IIDF+1rQQNtfRcol0X/KKyycHwTPNR0LvulYQfq0SJg/kq3q4O
	UGefIp8u89lbZ1NSyUGZPXgQNDVO/7fES/mLCuzUz9NP5oFBU7w1Mo6iT19I3IU3X+J2vhIJOtAiP
	0VojsPNCap7hD/J43jE4jKP7uqDy3v6v0zjLwqJURYE/hNohZVGdLwdRGTVk92uI8ljOT8p1AB+Wz
	RJAnkGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaO-00000006it9-2z9p;
	Thu, 01 Jan 2026 09:03:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaL-00000006ipX-32SS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a07fac8aa1so122678595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258189; x=1767862989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9+piKMs9G1VmQiTpap3yj2Hp00XA4sCypGJ/MWdS5Q=;
        b=W+t6hWG+c0HS97YRR8qpnetN43WisMiRlOfIFQSfpc4MllU3r96iFMC3pwLeEnOjMw
         46HP/o6QdXwRi2g/ae/sppD6KRf/hpaPXzeW8iBkueE3yN9J6nhTfPubbbGMs00dPPgM
         DYFhcg3z8sfDZXls1Ua2EC8bdiw/98HN134brmBjpOM63bOLawce3HJ0Giw122wr/l1r
         DF6OHVE76LbZVOvjHAIVsMyVglQnee3L11PJAPfT+0NFeHdzxNwyi2RvtAOydCwI9loE
         Fp5Y86D2nW+txSbjOMCheubFfynlp8f9G7DKp3OvGxgWjvCK0/kqe6Pf63rkUSbQrOLP
         dV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258189; x=1767862989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9+piKMs9G1VmQiTpap3yj2Hp00XA4sCypGJ/MWdS5Q=;
        b=cfxwvgsE3G9RfnksWFrmmq46YlVQM4Bd80Ryi06PdKVLApNGhKs/N+7ikr1pdgn2kC
         BbXlYnf1JuH6E40Lfe2tW8oCSr9pYY8rvpNBd60AidpWkfB5fBNKKVnUVJugzereLPaD
         8Ly1rujrII8w4EMNJMwslJKjwLg0nj6zlhD4q/H4J+tHsHzbelzzNKStn8YAYIZPh+MK
         Z9dtFUOPgtpSQSwn7cDiOJqORv4cQIQEnGORFHCyG88aBwORfgwyX7+xEGAm71HrVns4
         0TWsXc8FaTgMuCtE3F4log7VK2gbVEm5FVyYFt8gr0pL/ouAcY7HEz3Jhivo4Be7IAZA
         Ik9g==
X-Forwarded-Encrypted: i=1; AJvYcCWSARLkjDjBpUVUGtY+zg5yZPXXoUNEcs8pgbkLmwwlmcfGJDNM137nF+s7WQk2PRiVKXYCN0LIrkYEukmwx0aX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3IbWT65SBL+GhEKJ6aeSauDUsZWt/5J5hr14LcYAZ0ksC47MY
	7tcekoBei5dUMC1/BAVx5IotOuCkDIrIWH59z+ZlZFU0g2ikHYzlVgBN
X-Gm-Gg: AY/fxX6kfTbFNGVZvWtbirGy9J5uvZncJIozxYWc55Jj0IQIHIAekwdRJNTQESyM2xx
	HA3ez66PaFIRXdKi7utqmY/dgP3QLUz9qXjdQtFRaWCegzIjYUSIM563203Dv2mPdZRdiKZViCI
	Y/510YnIODb9w6gfVp+j+zT/J0Js1PmW8D7BkzwRGYfLujiM+cgigx7CYFrL+GKO903ZzRDoGQz
	2jpkw4SVLh5ch1LwrmBeUxdl9+ovssGxUpaVZ+MH/e/D0nSf+/Fb/Pe2zWVBqnqXs7gtI0He7QV
	ul6f2GApgGiZJ5cmqHauThOUYKBDZMTrI+mMbhfUbQntO/HGPK2j1/sZy+OGTUExb9Lp74iKCqH
	y4n2AQrsahHW0SvCUGluxbTDXCb/ORbhTnNvfQVkBfb0IdEDxn/1jJDJQmOtBf9iE1nPl2K81k9
	4JmnK2k/nehhk3
X-Google-Smtp-Source: AGHT+IG5e2xC8neFWXScdjmBlYktxqiTkUekJYUnYqefzLOE2TQp1Vdct7IJHfwRyqzlQJMS2iUOMw==
X-Received: by 2002:a17:902:ecc8:b0:2a0:a4b7:44af with SMTP id d9443c01a7336-2a2f232bb66mr312113185ad.26.1767258188670;
        Thu, 01 Jan 2026 01:03:08 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:08 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:46 +0800
Subject: [PATCH v10 10/21] drivers/perf: apple_m1: Add A9/A9X support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-10-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7154; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oVjy541ZBoiQRLhg3yJtDhlPYNwhomAgw5k8/id/+cE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgncoCTt+ciC+1PLUm11mFFPV2nA2i1R1w9X
 lHzlgeHgVqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JwAKCRABygi3psUI
 JHY9D/0aADWM1apo1lxJlfin56ZAnvAD6UHgG7mD8ziOpcxv8mesbSBVwmQZD4VWk5YUs0RISS2
 tuuCSHFw+//wZFa59pV9TLuKV+5tPif2pXdBFCyK0OMBN2VTNBJA/fGID4ntnA2f/UObT0Iau2D
 eY1t1fMxdweyfmahdw7EkbMSqXRlLeINMOYSSby/egqFsWa6QxZHyzLav9/Vt7nCfjCjJqu2x56
 6VzBM20Hy4y+oVVhnoBkI6vHbr8o4zNfFwPpPk6ZDVUrsv4qCye1ikCj/93zxM15jC/zgMGU5DQ
 b4Xp7tMfIOhEiFfLBOm+2bRzeHOCkeRCKl7ab60QhyI1d8eAEGwkkkpzTq0rMAB+mL0mlbhyTi9
 LjL9z1lt0Bz+6I0giYbQEUGbSUkz1WUgcbOGGMHO8lf7uD7ku6jeV6zqN8ys71jx0TyMAB67ZIJ
 9G94S6EdNlVlQEjHujrVUCi2XC7YL9o/6E55zs12esFI8RvilElHuHEKeSO+TZc2krohy3dJCLN
 DBhlgqHyHdRTfx1Jq7onXJ5R3m/VOaMVrHQvE5k1Q/z+e/nJwIy29iWfQKWq2KZguIjSqORHAmP
 GrFPw6uVCE62KxcCbAHDUjFcXX6LlzeU3LMgeqtFlm8SMinaGCksqow3Xr2tXIIs2uOr+06un1X
 kPMLPXOrdCJOLGg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010309_792965_C2E3110C 
X-CRM114-Status: GOOD (  13.82  )
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
 drivers/perf/apple_m1_cpu_pmu.c | 126 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 512b3186326b12627febd033886774ba44641846..fbf13e1ab5c0b61f60a1bcf1e66cb179ae7dc809 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -289,6 +289,113 @@ static const u16 a8_pmu_event_affinity[A8_PMU_PERFCTR_LAST + 1] = {
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
+	A9_PMU_PERFCTR_INST_A32					= 0x8a,
+	A9_PMU_PERFCTR_INST_T32					= 0x8b,
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
+	[A9_PMU_PERFCTR_INST_A32]				= BIT(7),
+	[A9_PMU_PERFCTR_INST_T32]				= BIT(7),
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
@@ -799,6 +906,13 @@ static int a8_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				       A7_PMU_NR_COUNTERS);
 }
 
+static int a9_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a9_pmu_event_affinity,
+				       A7_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -989,6 +1103,17 @@ static int a8_pmu_typhoon_init(struct arm_pmu *cpu_pmu)
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
@@ -1038,6 +1163,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
 	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
 	{ },

-- 
2.52.0


