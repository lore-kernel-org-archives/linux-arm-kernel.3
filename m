Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A5DC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBh51vvyiyhareusQPjv3Jd+V2PWdf2x4DOb/Anfvgk=; b=T286RAaKk6ZXGK7s+J8SOjYrJA
	EItte2PzG72iHAI4x6skKuMN6LybC+clPL4TA64WD8YW0agRYdemRbVRyTtVbaTKeNXsqhuT4ZuGU
	GgO14CKytDcDrBSZUSdU8mUeaJsTcdLKqt92FPSXvC3ipBPiwkgbPX+bPkoJvF7O5J463foB0IpQq
	TPN4gKNr821RaARA/eC5zwFNcJx28IXgJ2lOr6Rw1t7VEmGVK4OKjIM5j7/YJqkePhf++MWpkZiBV
	Bs/up7SP/lqwqkfY0Q8rH/M5fDuV+KupuCzSfGOEgMm22QZMICfw+nf5BVLn3/31UqbVtDM7w5ZRf
	fdTkbfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcFy-0000000Fih0-2o0x;
	Thu, 29 May 2025 12:21:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVa-0000000Fd8p-0pza
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so5460545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518393; x=1749123193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBh51vvyiyhareusQPjv3Jd+V2PWdf2x4DOb/Anfvgk=;
        b=ZK5/b0DGJ6KmRglACVlnu9AlJsvoagSY4MsU6ohBTdBneKkdBOrEiyyFZgrBJC6MpO
         d4IljfA0uYbxWl3KXFNi4WtjCViVAzywmvWeUXdvxa6vNjDZKxgLHl5iXIcW2dMmgDqU
         uj49CKL1DZPRQqsWpnO2LmaxpLXYGajJZOqAvbiUv4vdGoBJY9FTF6IALXwLqI6a4Eg6
         693EnW/IgIqE/K+Bb3PoAGZgrVEXgTl+nVYqw1nIGVU7M/HTZrulxok6tRotOWoxe8hj
         vgE9+6ULLJF4lkFcLOm7WFUjyPk6ld9+ZfaiAkbYS3PBCixC/HVYbZgI08pPp9j4BhO1
         lnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518393; x=1749123193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBh51vvyiyhareusQPjv3Jd+V2PWdf2x4DOb/Anfvgk=;
        b=TXbBwZOZ4UIxEq868LxBXrIRz05nBSa/L0KZyXB0LjOUX3+s3nl/X1EMibDbowiRxs
         cGDRtGDFD6sfTkS5aQ2bKPDt0WuaKyIkraVe4T9UQKGSbrl9ZBW3OT5N2jP2Pap3rfj3
         nreP54/xvq3dIQ6ajoOFcr+6BJH2wcMrIDMNNCyXnqUrsDpvXBYCkdOE4v09zqMqzYvB
         tU7pBOPuVbVRhaeFCwMjGoA1jqSwNWKo9eaGGOQMBarLLJTA2uHpB/rwlfxkf/likieO
         V28P2cWcqWwNDg9i70yhsy3GIwEHe8ISg4mLEUE/BaPsaG/FFbN+jaCSWuuCXB4k/yKN
         E4OQ==
X-Gm-Message-State: AOJu0YxtcnmJowhDgw78jGMC498w8wMpyCwcjCe65b5rNNa7YPBHDPXO
	g9F/7GTCT3B0w48TS5u+TcCGFmzEMje5Wj89TAtCZ/dN9Fkc8f5ZRasAXobDyOgVPtEASJDaz2Z
	CnocsfHpjMw==
X-Gm-Gg: ASbGncvKEXObwiFuBLdYo7XJPZo6ewQ3zxa/CU0fTKs7WNR7TBdXXG/rgUkL2e6aqtO
	fQPR0pBRw9vsWhR6I7J68MjgQ0W+tqo76F0IrUD5IVyrx4TeLH16W2PhXzkwRpXhLlWCn9OLe7+
	EXl5lQfQqyJverc6P2irjUIsjWeD6TYBNxOrCWGDytJAoBwYL/NakdJ0fSZZ42ichIyPQpD1AuH
	JCYd/wA0m6Vrh7lsQsvZnZGZ50pcNB2X4vfYgIpSSsXYcWGHX5YlBmUTjFuOIQxLEPyQOs+2DZr
	moAcNOQDTRcaSDybGcBX6mf8YDzK7+tKabT0+PzDUan1Z/ZLupqipHu0rIPt
X-Google-Smtp-Source: AGHT+IEtrMK0+qCLgw3Q1exhgAhuym8fUYhFgSSn+IhOQ2msA1tWH3EQ6muEHr0G05oi7CZJdKSgdw==
X-Received: by 2002:a05:600c:4f0e:b0:442:f861:3536 with SMTP id 5b1f17b1804b1-450ce83c85bmr27386615e9.7.1748518392610;
        Thu, 29 May 2025 04:33:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:24 +0100
Subject: [PATCH v2 03/11] perf: arm_spe: Support FEAT_SPEv1p4 filters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-3-a01a9baad06a@linaro.org>
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
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043314_240216_1AC0EB8D 
X-CRM114-Status: GOOD (  15.08  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h | 7 +++++++
 drivers/perf/arm_spe_pmu.c      | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 2639d3633073..e24042e914a4 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -354,6 +354,13 @@
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


