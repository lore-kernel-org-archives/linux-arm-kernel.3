Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C38C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlLudR/sWk/Kne4yinSxqoxYxOt3q1pcjfuUzQsQpng=; b=JOdlBpFh7b2vgY1i+W34N1w+pl
	Wsa4PBeEEEPdJvH297jbnga91AVVs+1ffmZPRTChtBsjuouPdAcYzK/PS0nu/WI7Zw/ZamOrHGG2K
	AfQxAAFTmZ/G1ia2KAjAuO1Iz3Q9jUYsmWYOdRwMI0VNgBB2AJCcMPh4jgV1T+mGvKR79oQ/wwL9c
	ZRw8Vd1DWjyJJb1dN28xlaJGhVtTo8mTWrLg8hd5tx9V9t1odG2j3YRf5D025xZGD+BBhxafMT2O9
	lBzhIoV9ruxS5N/W2DcOssfZJFbUnOYoHc3c5ElMphOyKebBHes0GsGR/EU4UdmUnhFSMPId0bFwQ
	0HzqC9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eeL-0000000GPNw-0jTk;
	Mon, 07 Apr 2025 05:03:57 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNX-0000000GMl5-0XYV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:36 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso3667814a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001194; x=1744605994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlLudR/sWk/Kne4yinSxqoxYxOt3q1pcjfuUzQsQpng=;
        b=bJAg04gRlVCvb6loywbg1i7zTZQGxrL7y+u4uux8K9r9cJm8vkL5mdktHlcgS8Ydkh
         obO8nb/15XRfL/HAWpfZF8lYCQkmxF7C4ZyvTRY6XzHvAwQBCWJ0SJ3HqdPUe9nzvUJZ
         M/qYT1vGvcLGsgH7pvLZ13jBeEn1fQsJoVNRBIY6t66FAE6BjurFWkljMRzSTaPThsJR
         hKAZxjrYMm5QzpVBoCid7ABO4Hm5GTM+jL4FNBKjTcez7Vb9F9zBg5LjmWttr8Qetcit
         Yc6mBwP/pr4zBrj/d8mq2BQLkG3AvwY9GT5nUxb1V5IqFfTFZnDflmLgAQ+kgkuYhzLs
         e+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001194; x=1744605994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlLudR/sWk/Kne4yinSxqoxYxOt3q1pcjfuUzQsQpng=;
        b=qXoG7QTv2kqgEXqLhBoqRAP5rXrRjDz7UiLu2WEvVV2T9XVYtl74ZgAdq7ZcYbpi+8
         wQLlOrWZSsxPMkPPzqA5Obnrx3tfTLt0W2mJU4h4wjogJwlhzIGcZ9yUluz/1+VpWULd
         H26XUUauY5RJBOrZCzHBgVv0hUf2txn7+8Ak0+1BmWk95w0l5ngiXe4nO4I62LK8tLU3
         oFluecXWiDtKHQvkoWa0d1bgr+GnRLTkC5BDHoCCi1Q/mpZnFTPouPr9eVB8XBAoPYjI
         xUw7QeQA+Rd8Km7Cyuz6cDjkbWKvt7j/j63mGqAVtRYNWiW6O4jAW1Py32gFkC16yqF8
         1exg==
X-Forwarded-Encrypted: i=1; AJvYcCWIgpjBgo6iBKLuqEz1cQZZi/iCWOWguDVsng9/BA1w2lrnJ4VR+yGTtGpg0F8ucn4KBSwrb2/Od4gqD0P4ETTr@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWI96eDPo34J7oGoAnjrW9trn3eDJRUQD6n+EoE/91T7X04E1
	DzF2AjD5t0razDIh6eJ42dKshI2bFXVlQaa0D+kkYjcAlLucxSyJHy44ug==
X-Gm-Gg: ASbGncshSNpwS/vY2ZyKSWXGVFu6mogGBrDVTvG7zctUUgbf9A0680SsVpXDLBWYHMV
	z8PR8yWD30puRgTWA9+U/267Lqp2Rs/LX1VJ4RElr8FLJJJGkvu2SZbwgSDNw22Dcx6mPUSa9xm
	hnFJh+kHonwyVBgu3Obi5e5VrAkgmF0yekF6O1in44qByxjv7eVtNBJh6UuOicJpFB+a2nRf6ed
	zX8x57ga3mz5kAMT73+N6uFt7nZDy0GMZhY/aVqOwJhvUwDBiyZBXEpzr60KDd2gwu0yX+TdMKb
	HUbPyxPxaAILeXHfvOIVSEU+4CBzwHu4mNeD3mMvinfqUU8=
X-Google-Smtp-Source: AGHT+IH5JkTcBJMuukZNf+9MfA8BQT+SAwA+y/0C4BCeewQDuZqf4Pc9lMKi4zvJRM0gplro6hv1dw==
X-Received: by 2002:a17:90b:2811:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-306a61208c8mr15295672a91.2.1744001194224;
        Sun, 06 Apr 2025 21:46:34 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:18 +0800
Subject: [PATCH v6 09/21] drivers/perf: apple_m1: Add Apple A8/A8X support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-9-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7313; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=W4HZa+NpM2ESOXzUAr4zGaMv7Cw7ppma9xh4UBE8JRI=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGjHVDO1ZdGaJ2zjtbAtFktvr9MybUKBWfy
 qeT+d0oFtqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JMNFD/9B8m1X5mOPQEZmSkz0OKhtjGEllvIteJRoj7VWubBmsU1DpKwumnPYr0YD2iHNEM941A+
 OUqgZtWtsif3MsYGwEFwNvvVVgj8QLe5HZwW0PX6DrspNkCMDd+QJYZHYs19Yl2dbBKB31jIV4j
 PyOcH/oxNeno85GWMoUHCWgqhdhqTQap8826wZInY/jG1vANlJgIz5eZCVBvXBPEDwo3JGcVhDW
 wsdsJDQXHWyX4T5NJiUejr6mxJazo3sqnsFnItKk1C0GpmLyPTS2UN/TU0Qqe1qb6ooxVUMfKD1
 DFJ3yZ6KuNPFbM7l9fRyA5V4A7W6I5dkRE6R6CPoGJR10GHOJmW0tgr0fTajS8gf9K6oIrDXkGw
 AmtSU+8OBpN19Dwbm4zujfQNKp0tCVaGbKwO2k2PdZ3cB9xjGgYzQzxQl2LXr8rBXVYuX0w3A/W
 x3vdlBl+cLy0E+zlrqPGU7zErf/nxWjEQVToIvCC+ujJdbLs3avlN9/Z5TNIlrnUlgMIvRylV0m
 v/Sqq+o3ihQBIW8Uit6QyPnEMc41XZORioadwkqXcQ+1wEhsarKnhNp3Jykg2O7xM4NyH9Dla8w
 w4WeterZG0ndlJJOWC3CYTAa/5EQCXL2cKsVsN4TVfn6lTvZIyEepeVN85ESanKIOYsx0oCUez0
 K/sIm6bl/tfq6Hw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214635_224914_DBC8BA2F 
X-CRM114-Status: GOOD (  13.96  )
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 124 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 3c03d0e99ddaf90605cb8dafa68ab8770d371a05..5739a85f3ae07c52f4ce91c4eda3e4bcdf91015d 100644
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
@@ -685,6 +791,12 @@ static int a7_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return apple_pmu_get_event_idx(cpuc, event, a7_pmu_event_affinity);
 }
 
+static int a8_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a8_pmu_event_affinity);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -863,6 +975,17 @@ static int a7_pmu_cyclone_init(struct arm_pmu *cpu_pmu)
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
@@ -912,6 +1035,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
 	{ },
 };

-- 
2.49.0


