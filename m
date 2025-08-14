Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0616CCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ufcAb3VHeR+uwp3SrFDBKP9OtJsomlijITnASDdFZ4=; b=ZLJkuWeGZCBkB3iST4sxqS2oIC
	3Q9jTGvvNikAB5B202p9Z0tOp9U71VYoISnov1le4g/mpaHvQmDjf3b4f116YVW4bTSIf7Q33w70X
	D6XYEb4WA4Y0RK+gWdRr/HUYoi1Ax6eMqfelRib5U8Dq3ezmL7xNzjR6+eykxRec68RfTEJ3jiaXy
	a6dAd1rW/TQaxzc4ulwDoRtBAxco44AxzafjCDH+OnMLbSOWCFz1fP9Yoh4dhuILi/3BYFizr0QQq
	p1CFQYZ4Dhy7y0J4EfS9lulvYNQcXiJHNlAYZDA2trUauWrF5P18HD5rz4EMqM1Abx8S2dgJbBpvJ
	sb1upyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUyp-0000000GXva-3NfL;
	Thu, 14 Aug 2025 10:14:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDm-0000000GOlH-3YVh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so3142855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163565; x=1755768365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ufcAb3VHeR+uwp3SrFDBKP9OtJsomlijITnASDdFZ4=;
        b=qjJcMmKnGkLRrMK8ZJTku0UFQaEUfr389mikVxuYMLJsGFUopK4YIb+AC1U5vCh053
         hrS/zRmmXR3eXVDBWNmNMon6gWm6NxIkGnA/F21P7zcujjy0hJ/Li3VsFYdnA5KqMxfL
         SSs7QRRHOYcYy7tD24A0N5x6uGPbk+A7S4iSHUcKuu4JVbXLG9Sro4ZwElCkEvqJCu5x
         /QKGHi9wJDuCIb/03iG/mF8XkKzd9ZLoqzJH0pdmOEPOcObwNKImfdVls0n0edPUDdKy
         LJF8ic/0NFD09/iRMfJilUz9DHG298hUtYPSTqNaGrWbBhiXgQUWEKTkpPnrU2MA8F1J
         1ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163565; x=1755768365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ufcAb3VHeR+uwp3SrFDBKP9OtJsomlijITnASDdFZ4=;
        b=YTSHfBQIMcUr00/9rGyvIphEVkDH4O3r1FLGJTh1+iLMzdTrqyUG7vw6kVix5yWRTd
         t6/YEXq0BANxnb7mOePLBaTHPHzfaRnE0uYED/sV3/txJwtRvyZ38RNP0shsxk9XPPTA
         xMb7lSxIL+vQv6shKRtyt0l9SeNGO073SUfnqBNogY9XORzAM7fBMXCkT4jdkI6X0M9v
         SZnULhUD3OwQ7pZWbKEUYW98hooiG+v81e0IQTkqR8+uCPUtbYpSjD7/68QzC1mpE/5m
         QMyuzsmUEfkgjl/J71iF+zLfni0qbDvo5JRXHoczb4IyC85nsZuM2S1km3kO/3FbmcBk
         hoXw==
X-Gm-Message-State: AOJu0YxsaTRPJ/YBdH95rW8eGoxnsV+EchB27Xye+Lbq0nh5Xb7JCYoh
	rPlbVXk5ajlXnF47y8xJW/3iXt2vB42V2yldbcC9v7XjlBOLPHdK/Fp2pgezmfJ6I1w=
X-Gm-Gg: ASbGncsmap23axVmN3vsEDzzx/p5YHVQTpqbA+e+8amQzsMBWa108Lb67GTC0ri3Q83
	J/XexBukn/J850/ckciRf2le3wF65AbrFPv7uL4DAaAhyxHJ4s+iSHXA7sLGRwIUysblsLPmqpC
	gGwBOLUw6ecrcfWYV7q7ICmNt5nj8yM61QIDieSLEBBm1+RyhbNHaD6DFvDz6FE/WQnn76bXXOx
	GUeUkIG0XN3C5YfSnXhdx84ykj9lZ1EAfIB+Q/CTliT/KMSvGTn9h42ZnVivyfCsBrsbVuVXNTh
	TUqXbCHGWhsjcXk2MyEHme/+Cd7nKPBsY/8aOCZgwJiLroXdegP13bUu3edTC5+7u4aiNqrOdVx
	VBy53QvpAgyu1cwZsXklqyCQKhwqeyQI=
X-Google-Smtp-Source: AGHT+IHAe77kAGKOL9ac19qggXFCssFULmcjf7EqpMgCC95aWkBTN0oGZBZjWaCvCRy5GyrpGxVt+Q==
X-Received: by 2002:a05:600c:450e:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45a1b6753a2mr19670995e9.31.1755163565465;
        Thu, 14 Aug 2025 02:26:05 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:28 +0100
Subject: [PATCH v7 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-6-6a743f7fa259@linaro.org>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
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
X-CRM114-CacheID: sfid-20250814_022606_896911_86BE2809 
X-CRM114-Status: GOOD (  11.60  )
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

SPE data source filtering (optional from Armv8.8) requires that traps to
the filter register PMSDSFR be disabled. Document the requirements and
disable the traps if the feature is present.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/arch/arm64/booting.rst | 11 +++++++++++
 arch/arm64/include/asm/el2_setup.h   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 2f666a7c303c..e4f953839f71 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -466,6 +466,17 @@ Before jumping into the kernel, the following conditions must be met:
     - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
     - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
 
+  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
+
+  - If EL3 is present:
+
+    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
+    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
+
   For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
 
   - If the kernel is entered at EL1 and EL2 is present:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 3a4ca7f9acfb..a0361ddcdca4 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -392,6 +392,17 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
 .Lskip_pmuv3p9_\@:
+	/* If SPE is implemented, */
+	__spe_vers_imp .Lskip_spefds_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x1
+	/* we can read PMSIDR and */
+	mrs_s	x1, SYS_PMSIDR_EL1
+	and	x1, x1,  #PMSIDR_EL1_FDS
+	/* if FEAT_SPE_FDS is implemented, */
+	cbz	x1, .Lskip_spefds_\@
+	/* disable traps to PMSDSFR. */
+	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
+
+.Lskip_spefds_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
 	msr_s   SYS_HDFGWTR2_EL2, x0
 	msr_s   SYS_HFGRTR2_EL2, xzr

-- 
2.34.1


