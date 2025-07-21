Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD3C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=; b=WckOzMKYw06GoT5uaOrxgCntG2
	g6uU5Lo3O/zz4jUnpPinnnHDRmTPOQZNq7b0iqlqMqtHencPBnVfPmvGcuLP7nvXcOrna8r0tAsMs
	seNcbrDPzRRGkWIoEqnY+ms4ebnhBeCFcuIRee+k1ShJLdfNpGOhyErU5WzSVngGRBxudzdqduzrF
	L5S34HHhDUlC3HzIrDEAYvmVGkFA0v9vorSY4FdWz2rHNtCCe0f+DIqQKPZ/Qw0orVDjoym/ipxKL
	+gXbOnwflJwSbDtUgLS3Xd0CMz/iFa6Bj74PfaGRybStK8Lnmxa4SeQCaeHndBLmsjF8cEZzPgcxi
	lJaCQO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udr43-0000000HS1N-2BEW;
	Mon, 21 Jul 2025 14:00:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqCg-0000000HKnX-2F8B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:05:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso2692991f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103113; x=1753707913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=;
        b=OGOPNJjqeT5V24ENZB13iGS3ry9GsGQPOt1ehwxzzAf1bHTFUPogwW8ahOBEq96+fF
         zNudLGWpd61ys+O/MHoL4b7zvM1ZMMXS/9jghf/46xv9qJR4G6ndbNsfwWIuQNmYRVJk
         MXy3AHN6uSqHA9DCuAqfmVws0n7J1d5m7o1YKpr7FPGAGMWFYXQvBuGUu0/vHx8hEPSO
         uAKXHdVMHnIB+D+D8eNRMxPX0vRSNKEvcChy3zi70gt/QRAPwjBd7JxxBddvBWs5BrsX
         hBa9PqGBLaY74DlH8WWDziji4/EvpFe+20uyi+0dDVvFc3TrXbL+5ZU4L/rgreqLBNoc
         JyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103113; x=1753707913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=;
        b=jjrM37Rke+KUz4WslUuDBiv2XKR8eFkK+O4UDM5it95+85X7JIJ7nXPxc9FcIHwrV9
         quVF/VLwyqngVqz99PCPZ4Nq2CbFgpEAsqVmcxIX1e3bIiwX1Yp3Bv6dcP5ovLlhcgkn
         mEYEuJBrbLh/shJe4gP/PBSPQHrfBDXs96ppgy+k7U3dpZa+oMGaDDFZaFMwc2dzgvwj
         fkzNYqbUMk1KNI6calnZuhKTw+qLqM/90LBFdSNYzy05EwVQOYwsSAtp7bMCakzaKTEB
         E2GLIBX7qwWbWTutMVJ+GMaCFifZvgZUdrOYgjG3dumyePHIFR11KJsUCiC4OcZepe2p
         PkGw==
X-Gm-Message-State: AOJu0YwGpCuGOslPzGitE6+s/1ZZ+p5NRC8LPnl16xbyswW7USgr1Et8
	d+iZisI2e2tW9ZOl53ac5JA/kywQAEB6xLUHYFWHL5XjQdPTNpP+tcS36HM8PaaFDLY=
X-Gm-Gg: ASbGnctTPbsEil+rDeGP7uaqG8UWW0E7gnaSsaE6jX0xS9/GgiFYNzueYq7GhC/MFZ0
	71PGoq/4TCe+lCC7KXoiVJm7uqhqKJ0RJp3m92bcw0sy9Qhb/alQJewZkM5ZagZQ39aPHMCD1Ha
	hgG4EgX+FrKm8sv7PV6lTWRjjEJN7WybcEdqtIu7VGujIuQbp3nwkPx5TKJo+4umY5ffqFHNlZN
	sHDXTHMvpZLlIO+gaLeNNO7uzyp09+JjY37hh0ZTcq7Nssp/WAcZzntomqipzLwv5BpiCdCY/UG
	S7/gEd5DRFocrOr2NsFMdmGGLMSMBzdifLybA9m5wlXK50saVwKNAHfWbknTxgOm97khmWnbWaz
	iZdbePf03fAaRYSuBIx8RP0Yj1I8Tp2Y=
X-Google-Smtp-Source: AGHT+IGWq4jzpIhEdv6123LGkJS3kcsTALE6uCDdvRzPU6u7cW14a0/tv2JQi8/2wxRmO1WYzyv6ew==
X-Received: by 2002:a05:6000:430c:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3b613e984ccmr12134458f8f.32.1753103112960;
        Mon, 21 Jul 2025 06:05:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:04:57 +0100
Subject: [PATCH v5 03/12] perf: arm_spe: Expose event filter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-3-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
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
X-CRM114-CacheID: sfid-20250721_060514_588891_DA90B9E0 
X-CRM114-Status: GOOD (  15.47  )
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

From: Leo Yan <leo.yan@arm.com>

Expose an "event_filter" entry in the caps folder to inform user space
about which events can be filtered.

Change the return type of arm_spe_pmu_cap_get() from u32 to u64 to
accommodate the added event filter entry.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 051ec885318d..3e9221a22a61 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -116,6 +116,7 @@ enum arm_spe_pmu_capabilities {
 	SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_CNT_SZ = SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_MIN_IVAL,
+	SPE_PMU_CAP_EVENT_FILTER,
 };
 
 static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
@@ -123,7 +124,7 @@ static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
 	[SPE_PMU_CAP_ERND]	= SPE_PMU_FEAT_ERND,
 };
 
-static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
+static u64 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 {
 	if (cap < SPE_PMU_CAP_FEAT_MAX)
 		return !!(spe_pmu->features & arm_spe_pmu_feat_caps[cap]);
@@ -133,6 +134,8 @@ static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 		return spe_pmu->counter_sz;
 	case SPE_PMU_CAP_MIN_IVAL:
 		return spe_pmu->min_period;
+	case SPE_PMU_CAP_EVENT_FILTER:
+		return ~spe_pmu->pmsevfr_res0;
 	default:
 		WARN(1, "unknown cap %d\n", cap);
 	}
@@ -149,7 +152,19 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 		container_of(attr, struct dev_ext_attribute, attr);
 	int cap = (long)ea->var;
 
-	return sysfs_emit(buf, "%u\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+	return sysfs_emit(buf, "%llu\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+}
+
+static ssize_t arm_spe_pmu_cap_show_hex(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct arm_spe_pmu *spe_pmu = dev_get_drvdata(dev);
+	struct dev_ext_attribute *ea =
+		container_of(attr, struct dev_ext_attribute, attr);
+	int cap = (long)ea->var;
+
+	return sysfs_emit(buf, "0x%llx\n", arm_spe_pmu_cap_get(spe_pmu, cap));
 }
 
 #define SPE_EXT_ATTR_ENTRY(_name, _func, _var)				\
@@ -159,12 +174,15 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 
 #define SPE_CAP_EXT_ATTR_ENTRY(_name, _var)				\
 	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show, _var)
+#define SPE_CAP_EXT_ATTR_ENTRY_HEX(_name, _var)				\
+	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show_hex, _var)
 
 static struct attribute *arm_spe_pmu_cap_attr[] = {
 	SPE_CAP_EXT_ATTR_ENTRY(arch_inst, SPE_PMU_CAP_ARCH_INST),
 	SPE_CAP_EXT_ATTR_ENTRY(ernd, SPE_PMU_CAP_ERND),
 	SPE_CAP_EXT_ATTR_ENTRY(count_size, SPE_PMU_CAP_CNT_SZ),
 	SPE_CAP_EXT_ATTR_ENTRY(min_interval, SPE_PMU_CAP_MIN_IVAL),
+	SPE_CAP_EXT_ATTR_ENTRY_HEX(event_filter, SPE_PMU_CAP_EVENT_FILTER),
 	NULL,
 };
 

-- 
2.34.1


