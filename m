Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71131C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ao7OlEh12lpRfhENXnzwKUwXbWabkHGccxknuUI7tI=; b=vnn1PkZkWOgheRIjx2owWoWwoG
	KjZhE30E2O1lmlSGoBzwiVEnN34Czz9rExGNDDmkvPP1JLBFwj1m0hepD/9y7nOKzzuYAMm/OhRjY
	pDetLOc+irj5Ui5jnPX3lqkjQLExvvTit1uUL4BSKqBr8GCZidzO0bLXl07jAd6xLB1DIRTuqp+sM
	G32/XJaNuI3QiyJjTrkkJD3TR9ZSRsLFb5N6+YXcMsANhDgrpUq8IGT3CZYduOMyQlONfloURaGqq
	hX3gPrFq3o9qnyp3stsIv/x+eoYphXg39W2+seAILS/EU2zoc+jSSWpstagwPeRAGbV+mNafptayO
	6It+/t+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcDr-0000000FiZu-3zqs;
	Thu, 29 May 2025 12:18:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVZ-0000000Fd8Y-14WE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4c9024117so618011f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518391; x=1749123191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ao7OlEh12lpRfhENXnzwKUwXbWabkHGccxknuUI7tI=;
        b=nU0NucXcOKstHMTPQu3C+l+cfbMXkGfV9gaGb2CiCyws9HmONyQNMKDXpiOL9qJb3N
         8Z1BFBKIaFiputAuySvokoYbjcAyRl86ZVvWn2z7V0ZsIv/BUSg00oUkU/I7NAb5+FwQ
         ZFpD1SqrTPUI7uQXvx4mC/Edoc+0ZLM+HCjRfaY6hE7FcWzzOoWGfQrjpZZDNqJDLzK2
         cnaolZrHyMgyDjUFpti5emA7jUF+9+qbP/QdirkdYSl7L9OWBzCgwa9+zFS+CBJ60ARb
         L1B/2ajZllcZ75D+4g/P/f7cSivhz87hRHP614suFTkyCakVVYKsiZZax/fLhT+vP6Vu
         xCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518391; x=1749123191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ao7OlEh12lpRfhENXnzwKUwXbWabkHGccxknuUI7tI=;
        b=B0tYgTfzAdAGlEnRdrkmEDz5XxxpJ8ZLuSalBXMqr5f1f4ZW4vWEq999rYdkBcIQr/
         KhTHq73NJO0LHKqXQcSIyoAd+FvjY/fgugwIVXv51rF6ZcC3tgYvS+KCLVFZ8juZF3qr
         hYGE7ocGJw+2XiHR88VEx5YRPrGtKztiEe5H8GYtbfkpVgE8gQZLAltUZCTp/MBH15AU
         4Ej3Ors4tmcR8rIMJhG8lT9ORb5YndvIz6bq4K+CPZK8zLCRXTozih5fuJflwQrJfp0K
         xqiaG42c3JfqkJzcon14noSckwzFsLL1Fx+hEAmpYcA4/ZCzGWY0E+lUe+CmRXg7bzrv
         KTVg==
X-Gm-Message-State: AOJu0YxDFLfiLdL1qPstVq1brmt49kRODrnFOPdmXvBNJjEd4++Vf59t
	Us/8JmXABo9aGmx7J8HHzVaxJMGdhfFkkex84aiv0rAX/o3xBJDq5dT5GGB5QiFjirs=
X-Gm-Gg: ASbGnctRm/Ao/n5w5XRPmCfN3m/Qbh+Ar87r1J0x26uijaQfcBf8WHBytDGhoPWODHC
	r+nW6Pi6l4DFONC2hAUDdq00WlmAFx/heiPbQnlmE1f0MQdTCis6P9nlmUzmh4ooD27TxuQAnSa
	FmqYl7t7cZLuzRxM8NaAYGiS6PeFyhbWNI5XQp4RDOCn/aCGr1f277Oske2/Q7TZWWsGJ+/NCHR
	kPoovt7mnTJr97kJl8luBHTgklsF7SMFLfAiRLu+YHDGasfpqwHf28Cr8asn0rc3/0s1Ti7FSd5
	W/e9MPNCrsEoWWREURpMpfXHVC09c5jPG/dwlzXVna/Ga8gcO1zZECtjnB/J
X-Google-Smtp-Source: AGHT+IGCVcVUkYf0t9hJfA1IEOCLHRWCcVLSmCqfshXf0Ly5nAMyifnx2BqS+BSK2ezf753KYr0JOA==
X-Received: by 2002:a05:6000:2dc5:b0:3a4:db4a:3004 with SMTP id ffacd0b85a97d-3a4eedb8ab6mr2607351f8f.22.1748518391182;
        Thu, 29 May 2025 04:33:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:23 +0100
Subject: [PATCH v2 02/11] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-2-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043313_307831_12575C5F 
X-CRM114-Status: GOOD (  10.58  )
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

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e7a8423500f7..e2cadf224f7e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2205,11 +2205,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT
@@ -2311,6 +2320,10 @@ Field	16	COLL
 Field	15:0	MSS
 EndSysreg
 
+Sysreg	PMSDSFR_EL1	3	0	9	10	4
+Field	63:0	S
+EndSysreg
+
 Sysreg	PMBIDR_EL1	3	0	9	10	7
 Res0	63:12
 Enum	11:8	EA

-- 
2.34.1


