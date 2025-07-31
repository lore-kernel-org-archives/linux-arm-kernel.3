Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC5C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrSw+eGCGXpLJ6+tt0rYK63rM4fn6YXwLnZjkF7X3dk=; b=JteH6Jk20gTxHgePfkyB7W8ymL
	LD1Fnj4+2MmjlUodho2ldy7dmGf784Ps7Cc13ePu6KvkerHtci8PGqhb5vxUg9YBL8K4qrYfLchny
	MUNxcGofRcpe1oPDSs+ynEvkJkawsUlQPyPtoRfpJPj9k3Dx/UYPLB+Y2OB0Ob5evSHMZESG5MwM6
	8w8yf9efd22bdZdEoMTqYokd4w23bC8JorhTOQDNoy7Vj8o4P25Z8JvHApwyiXUvTtRJWQ71tyhws
	BYN8ywGgK4Nv10jyyGIooRHW2sDwGjgpOcfluObxf2hTj7z19MFlRMs5bVgqOeNT1Fa9ATkbbvJI1
	g3UE6Cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTR5-00000003iAc-2yt6;
	Thu, 31 Jul 2025 13:35:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTJN-00000003gnh-2w05
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:27:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 335B12C41;
	Thu, 31 Jul 2025 06:27:01 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FCEC3F66E;
	Thu, 31 Jul 2025 06:27:07 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 31 Jul 2025 14:25:37 +0100
Subject: [PATCH v4 02/15] perf: arm_spe: Expose event filter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-2-58e5677a412b@arm.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 German Gomez <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753968422; l=3101;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=k+twCEul8F3qNmDKPN2nmqib/JEk0/id6nAKyFz8sTs=;
 b=u43Kbvf0jLa9av7zL3IYtDpPMiI14UiYdtWJyokS7sBh7iEImdgH190cEiJRYYBGvfiXvSGiG
 8aXf3NFkNxgBOcM/IKfOPzWF/kQg1v1MkwecSuWaxXfqWq/HmOtglNu
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_062709_862834_29D7ADDE 
X-CRM114-Status: GOOD (  12.76  )
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

Expose an "event_filter" entry in the caps folder to inform user space
about which events can be filtered.

Change the return type of arm_spe_pmu_cap_get() from u32 to u64 to
accommodate the added event filter entry.

Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 051ec885318dd40776ffdedd7d387cdbbd35c52f..3e9221a22a61294b1c7b2c5e3550c3eac51dd399 100644
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


