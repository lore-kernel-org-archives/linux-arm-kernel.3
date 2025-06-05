Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F44C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHbW2UQ+G7ko5zDPsKOZEBPKiZAxVSAKWEGcyVL84GY=; b=0KKsfwonUK4LUgIlunQPWf05eG
	ChDckvPzPh5z/TgI0jVsug+qfGuiWONrlaEF5pNiGkEHTyVJ1/RZJMTj6vqMwhDVxlePTixEbO+1c
	KP2rHv7eWqHRbDolOTSDl+vdaxznuuON0Q7riWiXteWyqUBANR9Yh+ITAI8Lf8/iV7QVCL+/fj00C
	cTp2MbV4dtpV7vYNq7zStDgGTsL7oHAKbdz3LiuYxGS2m86buRPc9efpq/GHQKv0Trs486QTCQIdu
	JfeF5xAwKhxNJb6DNecMTP6XJWQ6EieQUFllnHm0uefSt+nvgsQjjFZhrvlwq65/7DQuQKtujiyHO
	ragIv54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Hc-0000000FJkX-2so8;
	Thu, 05 Jun 2025 10:57:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Ag-0000000FIEK-3LXM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:50:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a375888297so549504f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120605; x=1749725405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHbW2UQ+G7ko5zDPsKOZEBPKiZAxVSAKWEGcyVL84GY=;
        b=W8zCXT5yYDDfH8aQQxQ9GfYQtYV6QAloz2XeynAnQFPUkcpBQQ8ySxs0qKRqxJ4x1/
         qcmNAmP+CvbdWmTDowcDBzf/b9zE/aLPvFTlyBJHntVinBNdZVW8M38bvPwLIS4k5cbs
         E2Z45sWZlEhQvS0JjvMiGmGC2w7Jq6wM+86Vw8na5xWbjhw/eUKtSIb1H5+Ww9kh6Bbr
         FPaWJKcZjJEqLZn9OMMllqD6wpgVH9wprO27jFz9V1+ZB0DA765TWUZ5TuGl5eyF5gc2
         MpLDMpNXbfIAHUht498798ynSweyk+mmvC1ln/rAKThiX923/tLZwXIZxLxOHuO6MNdJ
         Fxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120605; x=1749725405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHbW2UQ+G7ko5zDPsKOZEBPKiZAxVSAKWEGcyVL84GY=;
        b=Kvb9PfXWxQFxf6YgdPKieNEZm7nlao0z++ANi9PpdKiAkUkZC19GpmB6Fkd8lmyFwp
         H4S1ZpvwZKTmsftDpDvw7r2X3r+5+8mwE7kBRWEuFtjIAEY+fikiQcnLZgEU4iI0Qvee
         i+oZBkXiOVPt1BqOig+bJfRuM6tIUQwUXai6PZl3Ek/9/y6lLU2O+0hYJOQDgNOM1SMz
         WpDTwUgECA62zpdYQos/dlR6wajLwVlekouy/ap0tNyHcWpLdowawOIfhimM75/2XF14
         ylR4MPDu/Q0PC53iXCDjEAgBH1fCF5g2JcsR0Ov42KhFI2DatG9QPeZg/mEVI00xUX21
         xFuA==
X-Gm-Message-State: AOJu0Yz4FhEc9i+tjRDUSTdxIVI0ZqCEUK7wRslI9YWaFub1aXk+EGon
	anpGnAj+7xEFbn7do2X6GEuVJif/ZjE9vRIWE9nwzelqEZCcnO3WeWiwwHL6ZB8XCIY=
X-Gm-Gg: ASbGncuPRseZ8Krr9cBun2gCOIT/MHPU5W1+HUgTQGGb2KJu19kyD5Wi1DruEXNZdIb
	5hMf+2ggMRb+ZHHyWFfYAOph8foPn7fcraYiFPmIB8UX8K+D9kzwNVv4jYRd7aObKtp/o0ztI7H
	l2H8/GBiT6IhnSlymvjhJ9OVY9RKTQk/VqmdGdG/ncACGFE134Kz+c6/hwZIM0IBKZqWQywmuki
	Z+x/M6CP/QW1xyv6KX+QVjD/iD29gk0UOM5sXzxf1RV4/hTpspuNO9BcHIE+3LAIX5l9lw1pifw
	7k2uDKfLMsupPBozcmty20sWvnx/sL35DhShJUIzJSZn/9grKx9BWV0Xs/1I
X-Google-Smtp-Source: AGHT+IFRWzZEtfMJIm7ANoPCr8nsDJf/OxJ3jlNOmnbV1HMLW3JnGbA0M2qGF1W+QvYQi0862CiYjA==
X-Received: by 2002:a05:6000:2485:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a526ddadedmr2646825f8f.14.1749120605010;
        Thu, 05 Jun 2025 03:50:05 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:04 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:00 +0100
Subject: [PATCH v3 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_035006_880841_CDD13BED 
X-CRM114-Status: GOOD (  14.99  )
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

FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
remove them from the previous version's RES0 bits using
PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
E.g:

  E[30], bit [30]
  When FEAT_SPEv1p4 is _not_ implemented ...

FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
switch.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h | 7 +++++++
 drivers/perf/arm_spe_pmu.c      | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a..880090df3efc 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -358,6 +358,13 @@
 	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
 #define PMSEVFR_EL1_RES0_V1P2	\
 	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
+#define PMSEVFR_EL1_RES0_V1P4_EXCL \
+	(BIT_ULL(2) | BIT_ULL(4) | GENMASK_ULL(10, 8) | GENMASK_ULL(23, 19))
+#define PMSEVFR_EL1_RES0_V1P4_INCL \
+	(GENMASK_ULL(31, 26))
+#define PMSEVFR_EL1_RES0_V1P4	\
+	(PMSEVFR_EL1_RES0_V1P4_INCL | \
+	(PMSEVFR_EL1_RES0_V1P2 & ~PMSEVFR_EL1_RES0_V1P4_EXCL))
 
 /* Buffer error reporting */
 #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..d9f6d229dce8 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -701,9 +701,12 @@ static u64 arm_spe_pmsevfr_res0(u16 pmsver)
 	case ID_AA64DFR0_EL1_PMSVer_V1P1:
 		return PMSEVFR_EL1_RES0_V1P1;
 	case ID_AA64DFR0_EL1_PMSVer_V1P2:
+	case ID_AA64DFR0_EL1_PMSVer_V1P3:
+		return PMSEVFR_EL1_RES0_V1P2;
+	case ID_AA64DFR0_EL1_PMSVer_V1P4:
 	/* Return the highest version we support in default */
 	default:
-		return PMSEVFR_EL1_RES0_V1P2;
+		return PMSEVFR_EL1_RES0_V1P4;
 	}
 }
 

-- 
2.34.1


