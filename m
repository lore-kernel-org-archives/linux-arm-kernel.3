Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470EAC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Dl2n6AN12/YUm/7LNgqtmWXmHek9Kpp3INfHpWYEAI=; b=dzY0WmdgeCn04VAA3jUDn8UTE0
	Q4ueSDFpnNLPhnMslMsbIbdRC1ZFhPo13tUIpkq5pTP4X9xuvqM4rygI1y3GCRb7uN7BHm/+3BppG
	klatcuB4TcgqlQrIewXq9WpvCvTKZYTgaAipu7/L8MdEzZ3RuGhec499WpPHsDQGxLAiZtoMJhBad
	41a6u7Gr7TIZLPXakzP93iN1/9wP8+6jLNqsoLvgnYCsqsrXMbxL5k5X/qjLxURSgtjIaELmyroFK
	lqvbjFZ/OuM2RtEvf0svIwTqCFU9Hdp6BsYzW6576QZdEYholJJFyRusm8EwKbgVYiNlbvWzfRqY6
	HaXOqIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tht03-00000004Try-064M;
	Tue, 11 Feb 2025 16:20:39 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsoM-00000004QUF-17ES
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso8877076a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290113; x=1739894913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Dl2n6AN12/YUm/7LNgqtmWXmHek9Kpp3INfHpWYEAI=;
        b=E6JuWw9s2oHrgU186TJWNcdzhx10ITndeRHCBcfCXNePXNN3ObJZkZrjqDCe4RXu2W
         Lld16oYNsQhTKR7OwpE8jFqDKKio7jxYu9mVrZEESg2tocqF1YEDwXU+MQx3IVWLL6RQ
         imA6qZHpsM7UCpgU3AEaYcxbS1UhKJRzYt0cCgEeQbD+KyiqtlFU6Va1i9Zis5yHWRck
         CMbHJiDPsJ0gv/aGwYX7uZYewVRkUUqAwG5rShH/JTIneCtdKIP0v9G1aFWEVA73CyF+
         S90GjeWWg+z7cBaMPy/W9kpXuhGHmZp0uqIm47dTKZ+OhrJ97i3nm7Wr9fAt9d7TBqa+
         B8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290113; x=1739894913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Dl2n6AN12/YUm/7LNgqtmWXmHek9Kpp3INfHpWYEAI=;
        b=iQgWk9jIngx4kH5gFOYizDiOPvEotIGJH0myMOLU9U2WKuxfMTlyZW3cCLKF1AYcyc
         azGEkx0fp6Zhn2gTS16CG8ch4851ius618iVpdvwhXXFGKcPQTWig6T+h8fgMOfghtyI
         IxToDl06Jw3HdbVr962R8NBn3bsv2iXl6PbEYy4xyJp+bMj5JElYX/F0aWoa+dzZeAYX
         hxyZnoIZy9WYAjuu57/j0dUFs8wk9PJZD9DuwU/+ahfXnd92UvFAPmjBq78OZ+4Nff0T
         853bjzxhbcSlIypam4d2lz9ZDmX3sJ39Z2WWuL16nHJLOpiXY+5PD4UH3dCpvO+ZZZls
         ZJIg==
X-Forwarded-Encrypted: i=1; AJvYcCXgum1IXTVGJrAe5f0n3Z/yJTObAzuVHOFIoiTG0W2hTEfU8k+fiDSO9VgD96G5RjEnXQmByN2J8glcLSwZiwNy@lists.infradead.org
X-Gm-Message-State: AOJu0YyzAkflICQcFIF9W1xqF/Na5USUjoUBsy7C2BxkHDvqfCVAHRHJ
	RoCC+g/ki0e+b2wfs/cwihHHv1qL2y4jBVQdPQgN5l9ZPOUOaMOi
X-Gm-Gg: ASbGncsesekYjdW5679NGji4avAegEQtb96P1/pSy6mUPKQKfdk30ov5wJywqu0ctAp
	SG5oscHhHjUkEqmLMvpyIg4WMBh+2KrM00CBpt5oujPUWuWx5XlZqzq5zKJV6pLigHpnlVsQOR/
	FlGsFr5S1wsoj476iXOcGQhPipRp4h+hbeK75kQfZ33ny+OCa25Cz3mhWMkrzJPGYw+SXXRDuoK
	Sz+wqntpr0SkCDKsahGQK2g2vXfcH9BWz8wdAtFEkCNfKNQrkDT4Ca0vtqWX3Rdsxn7NQzJUjrr
	x+LhEIQs1bTNKvTaRw==
X-Google-Smtp-Source: AGHT+IFDGZ/Bx9q7X3jCnm8fIUcT9G/3gb+ZXY2eRiFlETWVFMsxD3mcOsNA/DA54Zf7lGCxm0sMTg==
X-Received: by 2002:a17:90a:f497:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-2fa24063f89mr32162513a91.12.1739290113296;
        Tue, 11 Feb 2025 08:08:33 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:28 +0800
Subject: [PATCH 07/10] drivers/perf: apple_m1: Add Apple A8/A8X support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-7-f8c7f2ac1743@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7283; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=vxKtbeDMRmIy8scNUcIryhiSkCBNLCQvbpOGN3JABho=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3Xn3CNSFZKaWSmqOGm0xBZ63F3gY95gkZdnb
 zR/+yZN6t+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JNs2D/4yzcU71+IRjQTqcnRVQuJenaIrIfheNGOp/U0QT2bGLpq06VhGTNYxD4WzTfnfn2niJyx
 U3bqHHoCZTS4srDSeBivYKeQW4MA5IH+WnVm0ZUEVIRGfRagN6FGJs+9mnaAjjEE74KAIEm5vhH
 3CTiET/AzLIbQgAv4boRs3L+xijBn3kuRgdVCKznoOqCsxO/9bSkuwgP+dT5wBWlFbRP6f4Aoa2
 j2zBdPe+08OsnCLPe2AoIFzaLqtEAY8iJNXbRuPD0uYX+nfwLnKLb0ZFoJR64/EYmzxaj0w2qZq
 /RmiwSoyZ9o6fsFgfTmGSFhKekSpA4hY9p8MlylZnK1JnEa7bfRYmOQaFfyH4bHievHQT713mHQ
 ZUa330CVXbvh20JO/uSclmO7ANLF6u+I0jus2KBWJwNbYbVM4ilpIjXDz70KIkTRjcr8haSMxdn
 cKC19+3ZMJdUrAbing4KbtZhbPyGK7x7MfGrjR0SRCH7AVNHyX4e9BcFNKavCBDfamYTMdDNt5L
 v18deNwoDZDZ8n5hPZtXpkipr58rFiBrPBaClHLKsaRKzDFdWDolMM6bHCpSBER9OHRcUZWQjVt
 OLYJDBIFKgzCdoU3kDiPdO7zNINfE/smmurRGB/GmEZSAgEV59piM9s0ZIC6Agl57dXcUHYYESa
 EC+jlM2MkpXKPvw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080834_308385_1AF1A115 
X-CRM114-Status: GOOD (  14.23  )
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
 drivers/perf/apple_m1_cpu_pmu.c | 123 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index a4f04e4647e5f554984dc219473afb837b81e6cd..0adad923d50f05db1f977342c66f2b70d5e0de9a 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -27,6 +27,7 @@
 #define ANY_BUT_0_1			GENMASK(9, 2)
 #define ONLY_2_TO_7			GENMASK(7, 2)
 #define ONLY_2_4_6			(BIT(2) | BIT(4) | BIT(6))
+#define ONLY_3_5_7			(BIT(3) | BIT(5) | BIT(7))
 #define ONLY_5_6_7			(BIT(5) | BIT(6) | BIT(7))
 
 /*
@@ -182,6 +183,111 @@ static const u16 a7_pmu_event_affinity[A7_PMU_PERFCTR_LAST + 1] = {
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
@@ -643,6 +749,12 @@ static int a7_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -792,6 +904,16 @@ static int a7_pmu_cyclone_init(struct arm_pmu *cpu_pmu)
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, A7_PMU_NR_COUNTERS);
 }
 
+static int a8_pmu_typhoon_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_typhoon_pmu";
+	cpu_pmu->get_event_idx	  = a8_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = a7_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, A7_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
@@ -837,6 +959,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
 	{ },
 };

-- 
2.48.1


