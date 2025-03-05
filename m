Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25952C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA19RtWNw+lBJmV2qOnKmSX3liVTesVtIZ50KboZNvc=; b=hZO4VwCyd9FxAKKiojS9po88Ky
	rhwzPUwH7sfupG1pdBglZtMw2yUotAyA0Pxh/wvtjyJ/WzlBzNErzGTiI7sjWE/0tCAfgkQYKUiu8
	NozZakLQpFrTpcLvpx7TsRTH/N9jk0e2P7+Z0qjbSDnDV3yh1Q3Lu4yrsWaAaxlMKq3UezxCWBAzE
	xBpNwsb41ztpfJa3yuChbd8VTAoj49EZkL9cECKn3SafKxoibs8ge+AvZfHYfBLZ71d/oI/GcPKFY
	zV8D/44bXyE22P0/R6kwOE6xUX7Zhi/De3df/TYA5cJgiuPo6lyvvaDe9yUIeIGKmP7IRDP6VPH6B
	FCBFKs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprOo-00000008cx1-2c2X;
	Wed, 05 Mar 2025 16:15:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprK5-00000008cJ2-15rT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:10:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0FDA175D;
	Wed,  5 Mar 2025 08:10:29 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AEDAD3F5A1;
	Wed,  5 Mar 2025 08:10:15 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	bwicaksono@nvidia.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 3/3] perf/arm_cspmu: Add PMEVFILT2R support
Date: Wed,  5 Mar 2025 16:10:08 +0000
Message-Id: <b11be3f23a72bc27088b115099c8fe865b70babc.1741190362.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1741190362.git.robin.murphy@arm.com>
References: <cover.1741190362.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_081017_341012_FFB707CE 
X-CRM114-Status: GOOD (  13.20  )
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

Architecturally we have two filters for each regular event counter,
so add generic support for the second one too.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 7 +++++--
 drivers/perf/arm_cspmu/arm_cspmu.h | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 053bb7920df6..efa9b229e701 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -183,6 +183,7 @@ arm_cspmu_event_attr_is_visible(struct kobject *kobj,
 static struct attribute *arm_cspmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
 	ARM_CSPMU_FORMAT_FILTER_ATTR,
+	ARM_CSPMU_FORMAT_FILTER2_ATTR,
 	NULL,
 };
 
@@ -767,9 +768,11 @@ static void arm_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
 				    const struct perf_event *event)
 {
 	u32 filter = event->attr.config1 & ARM_CSPMU_FILTER_MASK;
-	u32 offset = PMEVFILTR + (4 * hwc->idx);
+	u32 filter2 = event->attr.config2 & ARM_CSPMU_FILTER_MASK;
+	u32 offset = 4 * event->hw.idx;
 
-	writel(filter, cspmu->base0 + offset);
+	writel(filter, cspmu->base0 + PMEVFILTR + offset);
+	writel(filter2, cspmu->base0 + PMEVFILT2R + offset);
 }
 
 static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index d59040d6a7e3..19684b76bd96 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -47,6 +47,8 @@
 /* Default filter format */
 #define ARM_CSPMU_FORMAT_FILTER_ATTR	\
 	ARM_CSPMU_FORMAT_ATTR(filter, "config1:0-31")
+#define ARM_CSPMU_FORMAT_FILTER2_ATTR	\
+	ARM_CSPMU_FORMAT_ATTR(filter2, "config2:0-31")
 
 /*
  * This is the default event number for cycle count, if supported, since the
@@ -72,6 +74,7 @@
 #define PMEVCNTR_HI			0x4
 #define PMEVTYPER			0x400
 #define PMCCFILTR			0x47C
+#define PMEVFILT2R			0x800
 #define PMEVFILTR			0xA00
 #define PMCNTENSET			0xC00
 #define PMCNTENCLR			0xC20
-- 
2.39.2.101.g768bb238c484.dirty


