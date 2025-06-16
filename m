Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE25C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1Ef58P4CZiJKncAdu2DCccWJXMfX5tqD5QoG4RSffM=; b=si/0iewylwLKnBzeTLQZZg2mKh
	KBpSsxvLXfRxs3UWeAogEylahy2McCgwG8KBVD5DKkf0d/xciwWwhVzUr7CNDGbjKJqI0iO+fpo4+
	8B8Hx66K6qylk83MFxrlSoTSYyRVGCR6CbsMe4uwXr3dXDhxiPzbEhxpfDPAmPjp5FYDZME28T8cF
	eZTwXcdG+k4P1O7bYPxMkN9PKMPQ/Stgq9zcV2Pi93H2Md4MfDJi/Y+sdGkTTOZINb4UQ2mWcePpg
	eHN/9KmxwQKqjBml72s9NQ5Ywzk1UayRaQ0Hl/QXjitAG6tAz+a1WfrEGn8tq1ki7CcD1YOBG6ggc
	dSJfC+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQz3l-000000037R8-2rXr;
	Mon, 16 Jun 2025 01:54:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyiK-000000034IX-1HAI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2363497cc4dso32235825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037563; x=1750642363; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1Ef58P4CZiJKncAdu2DCccWJXMfX5tqD5QoG4RSffM=;
        b=kV5aR+qVrkSNTTaq7nGZrDnl77NRb6tCaMu3X3bkOkMa4qKlcSwLPombqKR2zD97vt
         astDRehMKG6o762uXQ6JsbJ0w536bRoUzyVLHcC5bvEcHYiPIRn0uQSWEzEfqhtRgaTs
         WPe2fZVSkExvpZxx0JdSr4yTeP9txiqlumw93EvCxt2smOj0xZ8pdJ55QsCHn+XKiHMa
         /WjzlZy82X7jAlCplL9PbbQKtu51YB9YikQ9ETaa6KTYUcdnBPcpKfRXJ3XbwjR32y/O
         RplA7TJGxb76MU4Pz4gGQV6uo0UVKJolM0dOUTFshGOuGWFTxpFqb/m4wr7DSxtINHt6
         Es1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037563; x=1750642363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1Ef58P4CZiJKncAdu2DCccWJXMfX5tqD5QoG4RSffM=;
        b=rd6RwHi1Egt8bD38GLdmPiYOqBmRuvJ3WD8ddED4FXEI8+mSoqYDIlys21PQHPYzk+
         BpPrI3nQqknCh/d03u2YUdCaPGmzFOadPMaWRUmKD2wqvGNQjFyNc8sj/XKEvA+hdi2z
         3xnvkW9Oq7ZFMhTm+h0GwlM9YQyGDpp2lgjAtlT6/fCPxMNLglh+dRyD/1a4ty5lEN6w
         un4cKBo2KVuN205zPeCRYVB9YxucOAr+6eiDYPfGPWjG7wf/3/rLljGQTWuZ7p6WoUaC
         GbXJBLIASvN0Fx5n+joiO5ecNdCYUyQHML0FL6ZmQD8R6Tq6Ppjfsa2+IcbItUMQ1wJY
         vFLA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ApV7JZYXSI2bBHEV3D4MwaOvt2ZwgzvDS3kcisVvCauxM+kdEXTOKsL/5sUKgmIl6vnItiAf5o9F0g5nL/98@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/taynWgYbKE1+KAd35nuBhqKhYzZyuTvUWbxJLyhqyFb6dCFu
	ieLtOrOM8GhWW5QQ/TxGj63/qiBnAGiKU6wmn7ePUfJAvXp1Hpc2+xKZ
X-Gm-Gg: ASbGncvYREM+C7bMpsJXLDhwgQeY5IEhYhBoBPt3XulZGVAb6+e4y7ErT7JwEx6K0Xs
	B2g8RHxaSNg/hvi8NKl3AIerMxmaFKchPYZdBd8Fpvd+NdbfTN7f8ZlQw5T4yCUnmfjMSOFhJ39
	bEjltV4j93KZ1FD5VCn9QEdpBDwl42k/RQZOaaO0qhoAR87bmS4Wp148JL93TrJA7iZtOwVpuMD
	Xs6mvYpSbXw/zjZDDMNPCvMZ9hAdECAKBaS6PF8Zk8f2n7polh1mQGBIAD4tV5uJ9/r2de/6Tif
	qSf6AtWTAx8g+KbJnqIZBXAMc0DKHYwaiFzjdctQKQXV5zlmuP7TTDhSrDi6MWKtsgudqPWFKrY
	UwwA=
X-Google-Smtp-Source: AGHT+IGzgn8x9GH2fnBRE8OJX5D1ftpxVvWrn+GxjRK42tJAqkin6Zz8PqZgb0FbjBUwZoreECVLzQ==
X-Received: by 2002:a17:902:ce92:b0:233:f3df:513d with SMTP id d9443c01a7336-2366b144dadmr120458625ad.35.1750037563553;
        Sun, 15 Jun 2025 18:32:43 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:43 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:58 +0800
Subject: [PATCH RESEND v7 09/21] drivers/perf: apple_m1: Add Apple A8/A8X
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-9-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7313; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=YYxBoRi9tg74DJBz5VJpYdMNCrAuGOPZ8JV7L/qISSk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QY9jCRcgHRf+ghE+yXd7sFBwZIkZSNZjTO5
 xCXvU6dMqiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GAAKCRABygi3psUI
 JKpzEACSmZ2P6P4SHeIyebwYCiQuR2tWnhDgXRgM7Dh8gbKzlv5wY5aCh6YEVGrItTQUnCPWfIa
 gbyURQoJZX+EJcZ90Gn0z0o6vvXcv+Tz969BMSX1NUoReGASAdiDtxJJ3YX7iZ47cKOIj+F/SS0
 E1K+tEj2w6pUnFjnfxwFtjMtrv5I1ngKDAmvuzDNOEdUi1izHH9MmtFk4UJiskRrvJtm7nAVgx/
 YE/UtHGil5Dff9hYUBfgR3ferCGFNQALObq6ug2oItCtZGEe60VesBF7YXmzYUFYTBAcBnriRGz
 8lq8aa4oP4q4LUfXpHOW/AzN5ukO1QwnS61lIhawpdIvCEfMpM0DsqmvTXfXD60NDOsST5H2Stn
 4RN8oWX3yM7BWiCSCdGnytng/dcJvaRs4NIToseN/emn56CEYFj4OIpQMrpzfulCGGEHgtIx7bw
 kQtRfQIWiJuhp1/zEjHU1SwKqk12FrNHMWVgZWMiNXIqfi6nBxxzl3sIj6uqyCxcCpIGhDPOWHP
 wHhEaFhXXCigvzlJlU+Z76nnmLQNwXXfr2Q4gui6RIe34eqtX8TOgw3yR7uyNGWi9FEji3GQZ4s
 EaWi6eEex2b602HkjF+umdbPRi6nfrVxS4C/1blIXGCe8G5xBff/F4V30XdS69PU7oKkri16A07
 nnlSdjOVo8oIYKg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183244_349232_EB3F9F9E 
X-CRM114-Status: GOOD (  13.69  )
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
index ac9beafff3d691b226c261f222c2dfb057959a56..e56f7fa9829da9e9444c6834b03e4a79dbc02c22 100644
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


