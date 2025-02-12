Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4C1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goB9OpNx+yU8RZpRcA21xMEnss0omXSShOn3xae45KY=; b=k1OKrHqwNEv/8amDVqZJuEfcc+
	XkY8uMwYcG7GoMMeVPv+hHSnwqnMsc/SjCj+ngb8GvRldVb1Iagqqh0RiFUf5Xmb3xU4l+k9rwvUr
	g9p+jRdLJFN6QGLYPRG/GU5pweWccVEuUOo0Qy7/LZorkm4M4jqquS1Gv3QWMtn9h/lTxEeqqWCPT
	IzySDBoyaZoPi0PYd1IoA2dAW0dJny1Zn/4H3OwxOZKfWnhUmuDs05RLidW2UlZX8zziT2BJLipUY
	l7iYePhAfqeCef71XmDMMwjDcTcEZ4QxRlIC44dLxuzs13XG3Hsn9xsUkX7BewaGoH8L5Ec6U+rWx
	f8353pQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGhr-00000008LiM-3IP2;
	Wed, 12 Feb 2025 17:39:27 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGSO-00000008Iw9-0gA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:23:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f48ebaadfso122915675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381007; x=1739985807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goB9OpNx+yU8RZpRcA21xMEnss0omXSShOn3xae45KY=;
        b=Td2MkB2gXmcoWxtlu8/ugRpnMST79Cw64Gpc5gTjLeLDFx8yof2JYobcbV7pLpKrjV
         tQOeL9id6dnVdAHp5xzmdcUuQ/1XKvBCyHUPTOex5i0fzKpaMrOd3/H0OxTm5UcHwCYz
         eJj5T/s7Ejwv8m7QV9Z0K9r19JYXWabQY8gxDIMTN7TfIWmYKjlxlGptuByi/8PSF9Oy
         fTFzdj8JT1Q7sVWnSw/DXiFd3FjmDCxF5HzjHCygrShXKzKXAx0ZLlDr1b42lpslDD6D
         plqoYW5zQVAOAgaCxSNooN0ZEadJvRgrN0MGO/S3Ts1hxVRvOnD9H9X5toCQVVDiCA1a
         ghZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381007; x=1739985807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goB9OpNx+yU8RZpRcA21xMEnss0omXSShOn3xae45KY=;
        b=IShtWW6dzpVqtuAmr9GCUzeMw7pdcGg1kK5Oj5hm5TirlmpfUICVPDEJy9+46SNMtJ
         OzRKUMUMl7oJQoFWWth9dtX1AtbMzvKtfM415G/XAsWckIHQbbFlcNe0Bp94Wp9eS0fw
         GakJ+CndLi1ehDHLyvobsZ6TV41j60W6xA94xJ/JdTGaJHl/yky4OAjZo7uDJFEXaURS
         IQP85YaymJqNwHuMN7YQmGmoHw97tMRhC5mCAy6xXmEEZe/flNZ0BI0l8+K/Dwq1HAb+
         bGItvKh2PtdkXemqPJs6V+DEXacQOYLwKolys5iCqWllk+lLdmA+iiqziq5BDMa7lfPE
         8lJw==
X-Forwarded-Encrypted: i=1; AJvYcCVKak4T7n19GDE5kdXwQImysI0oGn8yLfiprG3mtx4ztDRIugtJ9k+uLegR/BfGhP0YvueqpQgkD2PoE8W+MF6S@lists.infradead.org
X-Gm-Message-State: AOJu0Yztmm5YkKjH94K0S5LWXbTMWiwgJTBz+EbmCm94mM0zmP1gZ9MF
	uELimrCXaLUYe9n413LdNozBB5o/nN5Si+moUdeIykYkOlrPP/Xl
X-Gm-Gg: ASbGncsQpF29U+Drv6j8Iyt0V9OqtbEOKwGcHvkbLn1w/WbDXxFtnMQK9/gqeWvLIlL
	FbEaadXr21ZodPkEibhxzC3YSbLg8hd6aMxcVGHn4DGQFeC+yBoPMwoy2rlbx1uiZFelTKSbX/v
	QZrOnxOEX5SaSJcAdct1j89OcItGIY0eGLdaOaBMi4E6IZ4ImmLADqRyZgvgdlHofISBpQfbm5k
	TxTKBlWqMiyWOmlcf4MnfNnGKTZjOd+m/EnaTHSN+COEhSL/IQxMkz4IXWVZQpHYPiCCb971qmO
	zsWccjmTBLnFHSzw0w==
X-Google-Smtp-Source: AGHT+IE4buFawDT9VEc8troyiPBCP5gBpQdzGXfGs+x7e1+jJIJo9PI4VYyoD+qQgg7ozPGNCiozZA==
X-Received: by 2002:a05:6a21:7a82:b0:1e1:ccfb:240 with SMTP id adf61e73a8af0-1ee5c8228dbmr8183451637.41.1739381007141;
        Wed, 12 Feb 2025 09:23:27 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:26 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:32 +0800
Subject: [PATCH v2 09/10] drivers/perf: apple_m1: Add Apple A10/A10X/T2
 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-9-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7410; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=hXVD/MHAjavl4ZXvSUc2VxlC0ifqcAGukxBhH8HTG9A=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjw+arhwIKYtKtQ3YjobPTYIt823UXgNhjNe
 ZQVqsBixnuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY8AAKCRABygi3psUI
 JByTEACW7jEh5mxoGGJbcZgAf6jmdXgZjaRDvbepoCCen/xIi8WBcrw0jVTKeqPUJ7q+1RrzXj1
 zNJDlkH+IwF7+W086H5N3C1VjVECLQ1J0g4wo5ybP04l1HOuiPRWu8ZIgSf2eEOuWiMBKrbCyJV
 6M2l83Ce23hHArEVKDpojpAEvQWEe0tdpOaXZJUVFGDdugCeCZUUTEwlChxQWVoo4Uf+hg6i3zZ
 BkUwkiekObq8jPIfR6XzFXkJclWWYYwqTZKjCi75U5CyH8qRZwME3LLuxhoPAC+Ac33gwUJGt7Z
 d0GuYTnMdG9FYVK+DOWAyBD4wc8mX9EPAdcM2zKtFH2W14teyEqRM1/2BWiYvE4MZrQGenSSWFE
 g2PujtWRyJooNxlsieoTPmmdYHPgHZTNEDNXD/hZKN7XwxwriIqRQlfWLwNefvqJJdyjzG3DFHU
 /CA20VwKdmDLbd9iDIOkfdGeIdK4EHiVE9Fpasg3yXuRQ6jAml4DKtdHk1pvF5hqZh8vIEBNmdN
 aQJC8ymUXiFhahkm+DadvxYW/i4YzrmpyhzDTzXZ1vq6xPz2nN1ykXs9LK6GhryZFLR5ZgKddkb
 qWcCXlJWt5iv+Q8TnBgIwBvcMT/eDZv+JPvGajdd/4bUHumRtVzbJRAuMxUJb2EzDjZmpmGcTjU
 1sCptU1bPQw3ouw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092328_209544_CCD21827 
X-CRM114-Status: GOOD (  13.46  )
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
index 3f72de1051b31a1c0b417092590bfd89e747755d..c084c25f69d29756ea7a2e542e33888c1142d80a 100644
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
 	return apple_pmu_init_common(cpu_pmu, A7_PMU_NR_COUNTERS);
 }
 
+static int a10_pmu_fusion_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_fusion_pmu";
+	cpu_pmu->get_event_idx	  = a10_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
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


