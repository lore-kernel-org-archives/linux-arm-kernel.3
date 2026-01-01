Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5A3EEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaoiL5FANkEOVhoN0vN9Mr5fINQletooJki8aiNj0OI=; b=I4Pqh5M6wjrIko0dOR6rCrGSB+
	USzbTiapBmgQY75x5bVtuHIvhq13ySqBhhM8UfWv7LbxgdyhW8w8vftB9OMy+VxXcoD/zAgorsz9x
	YOCdUM72it29GDA7PoOGtWffxZdQWnaQdpvNCL4b/kj7xXC+8ll7xXFfxVVNA7dJRwV3V4z0/8qv6
	y8UQdgF8p+O0HVZ7fViV9yqZupIs6Jf7NYptrsGC3aeA0pMbgxg9LBiKXCCKSG/ddx1Ic+O8gQrzw
	RvNlyQi/24xBlh53djCSUnSvsc2JPD37E/w1W8qnmHMN6/EWhavlLQQprvLGjYDBWb0rAggGRWfd5
	sbsw3F+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaL-00000006ipe-1KOm;
	Thu, 01 Jan 2026 09:03:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaI-00000006imD-2oZJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:07 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so9851781b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258185; x=1767862985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaoiL5FANkEOVhoN0vN9Mr5fINQletooJki8aiNj0OI=;
        b=ibFmNHWqSvMkzPZSM4gtBQEH5xc1ou+31grlnoTW+rfUh+jkF3ZJtjFccJBnglN4vJ
         siZs/reM7LMxcPgCLVKiAOCqb5svSPg5ekmjF9YfF4ysFtDcMAhpI6q+rtpe02R42d7E
         4QSeq/Rt8Tdhzq2jtPzNwK+pJwXbRI9w+4Wnvq2X2zgVFzj7MOftR4c45JWEMRC8fHr5
         lKh3QiI2VJP6XZPJFLw4527nunevX1g7GHiGbnfAc3HNFH+6NC76bYkxgw/nKoXmadcd
         rCe/yHJ0C6hBVnx+CWe0BVAz5ByD/ynFwNsMXGPF5iA8kKNR++UVQg3jBhe2UgbolMqH
         wj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258185; x=1767862985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XaoiL5FANkEOVhoN0vN9Mr5fINQletooJki8aiNj0OI=;
        b=d83YXniyk/g3O+MFZ6FH0AIzxuJVrLPsasm4bxZQYu2cWHbb5npSJtV2ZvejOmDogY
         hZ1lRyNQTvL67dS31fqNGhp48MECQ19t/UaF0E4qfWaVWQIVxVHO9qDM8BHSfkdVWUHm
         lx4ujV1LhpjOl21wGER2SJlwYjlSYtsPJnRKg8IzsB7JSi0CnD3YuMvo7yFoB1JKNCIm
         SxuLRnD1yoBHYZKOjbT64iIBrv6/U4JAiXc8ACOmmpX36s+gskmX0YHCxToIhQc7LrJk
         BnjsyTGPDg77+oM2DC3+rxtLDvbxIjv+GzB6C4dNIy6nlMLuH/xlfARqyt4nkxdNa4xS
         PKaA==
X-Forwarded-Encrypted: i=1; AJvYcCWu3Xuehn4wNupJbjSwcjclJ/1qVetkR3ERRDIxJ50XlKnN3xyoYkqYKopOp8LbUq5qzIBHjSIdB2laDkr03U0c@lists.infradead.org
X-Gm-Message-State: AOJu0YwAfV4Ue7hkXAyHs7WdkaNvUa1UiNn8h6G9Lc3X+nXcBPpWh9ry
	5/KPjwdOoWUxXh9ISxeXcQJHuCMWMIIOm1cIz7UTKtFWeIuI9fZXkYdM
X-Gm-Gg: AY/fxX5QWV4Hybk8txzi3rnEeb9J9MUbwvkjWxy2O92lXW9Ag1sf0H7fmgJczAXUJd7
	jRVSit4nSmUzcjqVeLKEK6sF8Kh9y/0dyU3jajgOWVasIE7zkIl2J7h/+4WVlwo4YUXATLLfHm5
	fWMWbk1gvqDijr+MPtEWchFC2QoRcoI9zs+Pbt0igyBOCe48Zljz8bF/BrJzbKes6t8w6M+lrDp
	kSu9QAPKbe5rDlI8jzxqpALc+N5Lpi9poWlK2Ak3a40Gc1LTX0VhGvNs35neCK7rI0b2WHGOSF6
	S2cTpCxQGxARA+zYwZaHNhYrbp4cZdvutVSgow7OexPfeBhAtvAcoQsWll84oapX50dIV74wJPp
	OQmh7yJlIqvle4vzo1ESgUzxtH9X/2NAh8S/WAtcnPqJkmkWw4eVM9owxiKEHW4o/wkepz3U5vq
	DkoxpWzh+ktetf
X-Google-Smtp-Source: AGHT+IHg73z9ZdqhaaDh3CFWLOHwdJ+u6aAXOPP2Y1lIFxCOEJU5nDwiMNigUZYDOE0ZU5Xv9lSdlw==
X-Received: by 2002:a05:6a00:4006:b0:7e8:4398:b362 with SMTP id d2e1a72fcca58-7ff6667949dmr38762300b3a.53.1767258185508;
        Thu, 01 Jan 2026 01:03:05 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:05 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:45 +0800
Subject: [PATCH v10 09/21] drivers/perf: apple_m1: Add Apple A8/A8X support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-9-48812c529ffc@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7366; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=utwIbIun5N6ro7R2BVn23GQsh+IxQPMPqrtsXecbcGQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgnmgstDKMPGJk4epobI3PHVgXcm1TSct178
 V3vLY4487aJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JwAKCRABygi3psUI
 JLSSD/oDyJ0hLnF8hfNSa6xEGqXpZWI6/ObRFmIm7Uuy0tShvcOQKqR8P43JAmutoSIZNoXSJfg
 Dode/uS1IcK9qYq3onJh1LaiDYduITwF6ayrt9DXcT4fqG2x5lkOQ86t1N8xrNnfk/irLrKxIYi
 zgllWpax0dnr6Xk0dWOYUTxIpUD4XnKlW+/UQQVbY9MxJ1FqSE0UbHJ2kbQ/8V55Ryzlg+qQZFV
 1oEYtm9EVXjTuABtWUnrYvIp4agVe+Gv4ISuB9+Jv6j3rPf0goNUNRvpP3i+bqWha1TmPauT1uj
 CTF52TJwqYyimYRKh9VJjWvRfiBFO0gaj3zaXj7gpaVsMN6mPv5XPrcIhmenZyN2kRpDB86fNuH
 jOkoICZN6GQU7qFBv+bVpAz4sn1Rgoxvg21pDOXQ+UHZVqAZl0qAHPO8oEwVUnV4s1H0F2E0SjR
 5ml0a7Xn0LWiw+dRrp79Ee8yyf3cufV5iWIGaIMEVBcYnSDcJsQ2TK1HRBgy9rezQec8SeNOFUZ
 WWkKEDM8Flvl0oBjjUHE0U258ubMtSLdk83nuGkqQ2wgs9XZljfZ7nOcvbxu8Ra0wd3Fy7N+D3Y
 voVbUaYPc6F77AszOhT1BtuGjoVbUy3Mf2od4fIGEcPU6uNwsbY2jwgOFKq71t8JHwbLbZxVF9X
 9ATqqx1wfYppP+Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010306_772751_DFD39262 
X-CRM114-Status: GOOD (  14.66  )
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

Add support for the CPU PMU found on the Apple A8, A8X SoCs.

Tested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 125 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 68c7a1ee0b0e43993d9e4f437def15bee771a364..512b3186326b12627febd033886774ba44641846 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -28,6 +28,7 @@
 #define ANY_BUT_0_1			GENMASK(9, 2)
 #define ONLY_2_TO_7			GENMASK(7, 2)
 #define ONLY_2_4_6			(BIT(2) | BIT(4) | BIT(6))
+#define ONLY_3_5_7			(BIT(3) | BIT(5) | BIT(7))
 #define ONLY_5_6_7			(BIT(5) | BIT(6) | BIT(7))
 
 /*
@@ -183,6 +184,111 @@ static const u16 a7_pmu_event_affinity[A7_PMU_PERFCTR_LAST + 1] = {
 	[A7_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
 };
 
+enum a8_pmu_events {
+	A8_PMU_PERFCTR_UNKNOWN_1				= 0x1,
+	A8_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	A8_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0xa,
+	A8_PMU_PERFCTR_L2_TLB_MISS_DATA				= 0xb,
+	A8_PMU_PERFCTR_BIU_UPSTREAM_CYCLE			= 0x13,
+	A8_PMU_PERFCTR_BIU_DOWNSTREAM_CYCLE			= 0x14,
+	A8_PMU_PERFCTR_L2C_AGENT_LD				= 0x1a,
+	A8_PMU_PERFCTR_L2C_AGENT_LD_MISS			= 0x1b,
+	A8_PMU_PERFCTR_L2C_AGENT_ST				= 0x1c,
+	A8_PMU_PERFCTR_L2C_AGENT_ST_MISS			= 0x1d,
+	A8_PMU_PERFCTR_SCHEDULE_UOP				= 0x52,
+	A8_PMU_PERFCTR_MAP_REWIND				= 0x75,
+	A8_PMU_PERFCTR_MAP_STALL				= 0x76,
+	A8_PMU_PERFCTR_MAP_INT_UOP				= 0x7b,
+	A8_PMU_PERFCTR_MAP_LDST_UOP				= 0x7c,
+	A8_PMU_PERFCTR_MAP_SIMD_UOP				= 0x7d,
+	A8_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x84,
+	A8_PMU_PERFCTR_INST_A32					= 0x8a,
+	A8_PMU_PERFCTR_INST_T32					= 0x8b,
+	A8_PMU_PERFCTR_INST_ALL					= 0x8c,
+	A8_PMU_PERFCTR_INST_BRANCH				= 0x8d,
+	A8_PMU_PERFCTR_INST_BRANCH_CALL				= 0x8e,
+	A8_PMU_PERFCTR_INST_BRANCH_RET				= 0x8f,
+	A8_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x90,
+	A8_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x93,
+	A8_PMU_PERFCTR_INST_BRANCH_COND				= 0x94,
+	A8_PMU_PERFCTR_INST_INT_LD				= 0x95,
+	A8_PMU_PERFCTR_INST_INT_ST				= 0x96,
+	A8_PMU_PERFCTR_INST_INT_ALU				= 0x97,
+	A8_PMU_PERFCTR_INST_SIMD_LD				= 0x98,
+	A8_PMU_PERFCTR_INST_SIMD_ST				= 0x99,
+	A8_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
+	A8_PMU_PERFCTR_INST_LDST				= 0x9b,
+	A8_PMU_PERFCTR_UNKNOWN_9c				= 0x9c,
+	A8_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	A8_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
+	A8_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
+	A8_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
+	A8_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0xa3,
+	A8_PMU_PERFCTR_LD_UNIT_UOP				= 0xa6,
+	A8_PMU_PERFCTR_ST_UNIT_UOP				= 0xa7,
+	A8_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0xa8,
+	A8_PMU_PERFCTR_LDST_X64_UOP				= 0xb1,
+	A8_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xbf,
+	A8_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xc0,
+	A8_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xc1,
+	A8_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xc4,
+	A8_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xc5,
+	A8_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xc6,
+	A8_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC		= 0xc8,
+	A8_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xca,
+	A8_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xcb,
+	A8_PMU_PERFCTR_FED_IC_MISS_DEMAND			= 0xd3,
+	A8_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xd4,
+	A8_PMU_PERFCTR_FETCH_RESTART				= 0xde,
+	A8_PMU_PERFCTR_UNKNOWN_f5				= 0xf5,
+	A8_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	A8_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	A8_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
+
+	/*
+	 * From this point onwards, these are not actual HW events,
+	 * but attributes that get stored in hw->config_base.
+	 */
+	A8_PMU_CFG_COUNT_USER					= BIT(8),
+	A8_PMU_CFG_COUNT_KERNEL					= BIT(9),
+};
+
+static const u16 a8_pmu_event_affinity[A8_PMU_PERFCTR_LAST + 1] = {
+	[0 ... A8_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[A8_PMU_PERFCTR_UNKNOWN_1]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[A8_PMU_PERFCTR_INST_A32]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_T32]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_ALL]				= BIT(7) | BIT(1),
+	[A8_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_INT_ST]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_INT_ALU]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_SIMD_ALU]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_INST_LDST]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_UNKNOWN_9c]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_UNKNOWN_9f]				= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]			= ONLY_5_6_7,
+	[A8_PMU_PERFCTR_UNKNOWN_f5]				= ANY_BUT_0_1,
+	[A8_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_3_5_7,
+	[A8_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_3_5_7,
+};
+
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
 	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
@@ -686,6 +792,13 @@ static int a7_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				       A7_PMU_NR_COUNTERS);
 }
 
+static int a8_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a8_pmu_event_affinity,
+				       A7_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -865,6 +978,17 @@ static int a7_pmu_cyclone_init(struct arm_pmu *cpu_pmu)
 	return apple_pmu_init(cpu_pmu, A7_PMU_NR_COUNTERS);
 }
 
+static int a8_pmu_typhoon_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_typhoon_pmu";
+	cpu_pmu->get_event_idx	  = a8_pmu_get_event_idx;
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
@@ -914,6 +1038,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
 	{ },
 };

-- 
2.52.0


