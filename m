Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEB1CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rccDGxo7Zi/+ePrAmZStYRWWCBeSec1uJGq7oyHErE=; b=fgrVOpj3OebdshibqmATZrSKvN
	G9OOhi7vuzONItXK9RNkS5s0LVdSXVBFp9FluUCf8/saVElIbBhprITMgxho2G+ySVJs120eD6XbU
	+Ozw11krzqAWPWXGoTDF9i0lI7BmSClELQSSTTwWga9NDa/fl/BM25n6UbPR+K4QzlWhb9owpmnTX
	GPdGuM1kFHRhH0o0kzJXRuf2pAKLME+SlotBLdObCCZH6FoYFmCtzo8orlu/GB84hj9sBe0BqgqXT
	eS+pCZwhxk6kWELf5/6RUUeYskrzHGWVC/TAD2bSh8MTxOsM6PHK0bHc65vEcH9zks/tiT/6e/vAc
	a9+Knv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmw-0000000GxTd-2MkT;
	Thu, 14 Aug 2025 13:14:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDi-0000000GOhY-3zJ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so3484595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163561; x=1755768361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rccDGxo7Zi/+ePrAmZStYRWWCBeSec1uJGq7oyHErE=;
        b=kh1c480ZVmNt3FE/YS084KQmzTBcGthbEwiVNXiQGXtUtzrQx5QK0KtTCKUm/qp5ch
         WoGGHDjnNDPzok7+GAEZDwcH9L/GKAzXuVT+qirnq9tOubp1HR7lyRNfzp5Qdfqihcm1
         1HE7uuRt5m3y+h65YfyEebqkczOXvq6BpqmbNS78dcSy4q0DBuJl6YQPlDDm3ds9k+tp
         wpPRdk2Z+tizoEvRtVsNhqTD6bUGHdZOXsPGZY9L7YtJ0jFwGtHH+oz++CkDrPYvc4E7
         qzBp0OlJ8XYxbH/G5X8NA6BN90YA3JNiZIPZennIGdqjEpeap4QuqAXfr6WOcq/F3820
         dGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163561; x=1755768361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rccDGxo7Zi/+ePrAmZStYRWWCBeSec1uJGq7oyHErE=;
        b=VaGgkSYwG9QRJV/rZ+IMAiqXIFNquTM0FxbHgUKqv9XBSUTiWJsMct1XUm52VRKIm8
         4fGxSNAVWhVrTzahebpVbOLXusxzcFayuTP/oYUy3W7hnmx09UC/98zBGcOdNlFzYx+Z
         7TecyHF9LnmuV++0i7mr3reJVByL1VF0ROwWIBrNuycKrvpxTTh32Iid2NKZLMd0z2ms
         YHU4OjT6fAFvxYL0lkDDEV7tB/+7XIGI+htoXJivh7J0eAX7UDQMG7MEEkdDIbTF4XSn
         kV/Ttm8WuwxkGExT8Bd1M2XXrS3YLCLjt4UmvDg1+hQtfAWaNeuQOZKBTPsprxYim5f5
         s8jA==
X-Gm-Message-State: AOJu0YzwZes5L0sp11jCwXHSt0I/Gs0UHQhcjrHBAy4w2vl1SlToCYRc
	Zw+aH6gHTaDlY7e5lIG+DF89oo3t8uE8U7FwxyWt3BixQ+gRBjX1CVAmlqoLJnE5kgs=
X-Gm-Gg: ASbGncsf7CDSDlpYlbHNrsKrU6Ri7Rl+cVZAVJmQpx7PsDJAZsDlUQUgV6AcH4NsjBd
	7qQLN9gqMIm5UpfKe9FSGnCZ09/r3cWLuKdACGJMxPkbTEm8z3ozDczxICF2CvbMOwVXAuP7fkE
	+3Imbp4Akt5afRDrtLXK1NC3JL2DRlU+pmJrNYti0drCn/hcY6Wzs/mjy0ALedrkXKSBrPt3N2m
	rKQwEF4YGZOcjQeW/4hPyZX5AH6kCfBBCZbS30xBhsfPi25r69GlRk+EBUuvscaZpwbn0J/tcSU
	qeXettavdlzmfy23b1yy+P1ypXRqfQPB+cipDSTV6KLwaSEGx03GiblMOi923wqYFYFEdCi42ju
	A+hJ1P+LqxmLTlMT59F+JO/0YlQ97wiQ=
X-Google-Smtp-Source: AGHT+IF3mN9YM+z59LW2L2RCIJP1151F1ryrxu3DBo1bIpBosGzWHxhnT9S0+1q8xFvPjiRKK5C0xQ==
X-Received: by 2002:a05:600c:4705:b0:458:bd31:2c27 with SMTP id 5b1f17b1804b1-45a1b6535bemr16452535e9.23.1755163561367;
        Thu, 14 Aug 2025 02:26:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:25 +0100
Subject: [PATCH v7 03/12] perf: arm_spe: Expose event filter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-3-6a743f7fa259@linaro.org>
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
X-CRM114-CacheID: sfid-20250814_022602_987423_92AD520D 
X-CRM114-Status: GOOD (  15.16  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 86c9948ab5a0..ba55bc3db708 100644
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


