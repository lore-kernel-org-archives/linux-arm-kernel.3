Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2748ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHd8HPOm/LFAxhlOS9e+lKUAamxvrPZUbEjnXUTZJIA=; b=Xf2AMCkYSp0EJHALkf+YyIqu2b
	1pSMjm4sKp4+zskWLAsT6IwlAgjyoF7o4nYmDnFKNKL384KPaeURq1GcJZ3mUYMOPOas3sClclmWy
	t8+H7ZrhypuWh2NjezpPwhsqU1y31Q1RwcqRjBPUJQLcDV9NG6SjeY52UtPFrGXXXDTR2uBGDxhad
	SAEItoyTVD7FMjnvR9LEAMlhhRPFJkhSieaXBspFbADbfMYOjG9sqFp0HgqxfSOYOW2AMsQZzLxxd
	DXRi1e2g368GOcu5OL3gpfILa31iPryOb7Hqi9JkQb4hhVC4R9GSX2VIevNw4UZlRTJJHioQ2+GZA
	ZwPycDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUwI-0000000GXNR-3ugf;
	Thu, 14 Aug 2025 10:12:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDl-0000000GOk8-26Bp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so4565465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163564; x=1755768364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHd8HPOm/LFAxhlOS9e+lKUAamxvrPZUbEjnXUTZJIA=;
        b=MaKWxSZpzeDPa1gOeIY/PZM7Ua9E2UlP6hBXp8cxPiigAL2IEiViBD71SUZJSi3z0Y
         JYr4vnvp7Loif+ED5GyA2RqeBY0J3eiZ1cWiWcWwZ7j7H0pDeVJtLtP6GaNLa1cbp9EE
         QUQSyJe6lTTotr6wcAODGI5rWzLW+GHp6Ehs097UPTv/dmdA8Hs2UllsAg3M7IT6njHG
         0M4rU5NkrhbdN5Rqda8uAOeH1V6rZIDFrxOwy+9Z91nb6FSWxiEsSnauZNOELZgR2gqi
         UqZOo3MXbBgvVj4zFZttFaz1dhRhZGZFtuuS6HjG49BBkkqaRI8pdYPmfVultIKgHF+V
         tKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163564; x=1755768364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHd8HPOm/LFAxhlOS9e+lKUAamxvrPZUbEjnXUTZJIA=;
        b=H5tXbeWpGEHVa/Fbl4MX7U4Sq1mvla+C5U52ifwHdZEGbz2mJ93epmyL7UkRydX0kk
         7n0wJyE/ECGmFJxBWRswVmRfNgqNfRq2Z7XZTYhjuro+VO0ArpV/9/WpTCnl4e6i32lr
         P3fpoxWVn6yntmoGxBghU5aM5l8cZeE6WibtoKoqqlp0BY1PVNY1ZVa0ZLRtYhCmdByK
         Q0i24GGp5xcobwWMFGaLbzol3CWl8rT0NOo8YufsxvbLneWWXlr25Yh1Skqbk2zT7c0+
         xjVP05Bq8/BWeVxXlyIl+sq+2KWKXJOWDDQ5EQCNU16HueOorOWmcrTjWwnVBk/S1dBB
         6h9w==
X-Gm-Message-State: AOJu0Ywxl5zYaFWZfu6vdRbHkx6kre/QZr7K+uQV4D189Cbn5frgNNnm
	eWtof0mShMxhHIf18Zu8IBLzi75HXSFreBYUlv4LjmUGshlbrQRGTHZaSw4gf2KfMzA=
X-Gm-Gg: ASbGnct8k4vua7BhdQevHzGpe1MEtpAuzidMWR6xSWXQCQHVmbJLyLtS+EL4VNe7hEP
	ibriqaht8UL3W4WhPuIM1xNBiIDwmvTVCUPcwSio/pdz6y4dRSydeJn2qTw+KbY1ifG5eez2rFF
	lqtyEzQJ4WUEOVWqCcAmnCLKI9ovmhFG7cV6yV4UbEipRLm+5fYsimiAizuEAs8UAia+aIqDNFS
	lDGfc0tGGCcXL67WcrNzqYZYg6tksgTV0puJll2kh5VemFSFBA6QBs/sYedTTTZxAspFHLPlPmx
	9CIBBGssVl6te3pSalwliLze1kVuj7dYPPY1G5Kb+qmWjaoD6hr/mvoo2xww04BKv7dqsyU4nYP
	OPPHP+w5WLdRMxq3X3cNCOhfEQ9WAJQM=
X-Google-Smtp-Source: AGHT+IHVbFNevY/X+5Fk3dLFGyCp8s96euJO8o8AaVBD0HLHGypEL/usVLk1GhbMm0uoIXFS5XgajQ==
X-Received: by 2002:a05:600c:458a:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45a1b791232mr17035875e9.5.1755163564130;
        Thu, 14 Aug 2025 02:26:04 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:27 +0100
Subject: [PATCH v7 05/12] arm64/boot: Factor out a macro to check SPE
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-5-6a743f7fa259@linaro.org>
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
X-CRM114-CacheID: sfid-20250814_022605_547372_64094A4C 
X-CRM114-Status: GOOD (  13.56  )
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

We check the version of SPE twice, and we'll add one more check in the
next commit so factor out a macro to do this. Change the #3 magic number
to the actual SPE version define (V1p2) to make it more readable.

No functional changes intended.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..3a4ca7f9acfb 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -103,8 +103,7 @@
 	csel	x2, xzr, x0, eq			// all PMU counters from EL1
 
 	/* Statistical profiling */
-	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
+	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
 
 	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
 	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
@@ -255,6 +254,14 @@
 .Lskip_brbe_\@:
 .endm
 
+/* Branch to skip_label if SPE version is less than given version */
+.macro __spe_vers_imp skip_label, version, tmp
+    mrs    \tmp, id_aa64dfr0_el1
+    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+    cmp    \tmp, \version
+    b.lt   \skip_label
+.endm
+
 /* Disable any fine grained traps */
 .macro __init_el2_fgt
 	mrs	x1, id_aa64mmfr0_el1
@@ -263,10 +270,8 @@
 
 	mov	x0, xzr
 	mov	x2, xzr
-	mrs	x1, id_aa64dfr0_el1
-	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cmp	x1, #3
-	b.lt	.Lskip_spe_fgt_\@
+	/* If SPEv1p2 is implemented, */
+	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
 	/* Disable PMSNEVFR_EL1 read and write traps */
 	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
 	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK

-- 
2.34.1


