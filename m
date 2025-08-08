Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745C8C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=; b=1qlgxRr63yW63cwHcS01yx5NQ/
	PeGQlUrlLgmsQ29l53rCylcOSElWnh2ffyxAiL/R05Vnucx1SkI9AgZgGQ6Yxk+fLQupqunUPVEeS
	zkTPWdWZQrAqvGkktNxeiAKuPtf+X3xKgCyzwKIanTFfAQ4+rU8Bk/3pCjUhOhs6s3ep3Y6nxaDJ9
	HS+BxI3wCa+ZU0hAC4drXNNvrXA4/TeOsNFWOoqx3Et6gmAQxl/9npe4TTObmzt2EIYVKk2Fs+7bS
	9tD8ZTMjvMcQA1tjhJSrirH8MRix7+QZkxMjroRiabz1DA/J0vJu9yudmnpGY4O79M44MxhJBUmxR
	3Wwyrlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLHJ-00000002g1q-1PkH;
	Fri, 08 Aug 2025 11:28:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCN-00000002emR-06p1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:23:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b7886bee77so1563778f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652225; x=1755257025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=MSIWNSUMJsff1jxBkDMmOenJqGifBIeQYpsAQX+KiiNkUxBcfaCfSjMOTLIMxCtnBQ
         Cxvqmzcj+KRhyaj7YdsSE6KJR+MiznxaAaL0f9PUhn3uMyo7/Yr5FfDI2kYD3rI56DyR
         GuSUGfWxQCIKu8dyu98NOOPOSAcw+rg5Ai3siluo8Czd1QCoFnA1UWOcEGHRrOi3zto2
         pWEqdniv+Jb1MUQlTT5SBXolBL1LqO5KoCE51kzWKNvliQKlDyHVcdz6Vn3GFKjl+vAD
         eKQcmtqnMD9xnz/98nkz89nnqty5qjj/AaU69mtOtwgCvhjOmvh/zu9iv+5D2VhrYP3p
         aLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652225; x=1755257025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=pB7tHfdiZfp1rotbdp7HrHMKvm9jrIdG3HChsg7811YwYagUKuOaX6zkoQHptNQLhn
         xP7DwDOW3ac4DtmSAIGARGEp3HjudD9x6do/PccU+Vs49caKJOybzttlCvG/W5jB68+O
         Z7x38eAfe44oKkdvxsi78YNtnGNND8MlggU4ooGTaCEqxyhp5CgmAWEgw3fCNPaYkiTi
         u9I+/XpwXkjAzBnZBA6TP/RjyOlaz80iEeWPDFMd1GX6q8M4ZqatYWu9V0amIviJyq3z
         /luPsMv0blGyAPFW1cSqctmZEXj/EDgtLDD/5pio/KyJtnOwDDpBUdIthbCgyAzRjZoA
         2uGw==
X-Gm-Message-State: AOJu0YyepIhmaRWnO3qjY4uSD6SH7oBk06DQrsKC4CnkWpwrvuridxSZ
	Ij3CCS/+I3LsbqdHqzYf5+JiecWaG5AtG/FWECAGPBYtvjkMgQ7GCvv8CeERJwykSIg=
X-Gm-Gg: ASbGncu3/CvCsBAZvXMGOvG15nD0JoWJfWj8bsx/iAXO14PiWXPZfY3qsKnBW5q3sXB
	Yqpt0RQaYm17oiyMU+nOs0bfarKgOvaPMCSNYSi9tPA1Wj2VRe8Kd0XxFromSnyZLvuqdke4Lbe
	OUqlcqpgJNlXX8GIzOEhXA75kKRwX6G+2/HuNF670VMmCVZt2E7Hkya+3dBYpoiIPHdrk3HD6C/
	JxIrYMi8DogQmpnPCtETsly6ylKhBDbF7WmCfkLxkt6HACTgxXlmtzTBjdz9tWzH6iD1N9eT6CD
	4q4Drud4BH3Em/gJqFeg7tG6x6HmCCapVfjc4QcieJ2JSFKqQSgMgU5ijljxYXBh+0U2ACsr+r4
	NcVik0bAL2ACkHGkJzP4IeoWF+P/ByT4=
X-Google-Smtp-Source: AGHT+IFB5Rhb7EHeEiI/ams6KhI9UuNHFiZtaUNiO/aRfCno9CNSrWB+oIrGqone/4N7uev3L98hjA==
X-Received: by 2002:a05:6000:2083:b0:3b8:d493:31f4 with SMTP id ffacd0b85a97d-3b900b83c8bmr1969857f8f.48.1754652225356;
        Fri, 08 Aug 2025 04:23:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:22:58 +0100
Subject: [PATCH v6 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-1-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_042347_066291_CD02C228 
X-CRM114-Status: GOOD (  11.50  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 696ab1f32a67..b743fc8ffe5d 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2994,11 +2994,20 @@ Field	0	RND
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

-- 
2.34.1


