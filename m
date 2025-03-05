Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E82FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z6P/2xsQVe9zk5ymqOFyVdkmvhozujdFy5ENMTLZyI=; b=qRl4rkITQwDQu6uauU4lNiHElE
	u/OpzaLGwpTGysPB2DO7bPToSeMqCRRH3RqGK+rTzPxLx5tAeNUlEjSzDvUTZVOPuPcYJgMmjI6ey
	vqWsqp4nCqbHQsw8vVBMV5VnxPv5FCJigilu/eQbMd2uStzztDd1fYCIE7oH6qqjMGrwe+PX8IJ+N
	53daPGhj7nLnRL5CF/wO587ceZBNEY5bOkr9UpHmQpTMpaFAGIySodlx555dahvvp/TvNZc/3zYtd
	XbaQarGyvzkmPBmG263XyNwpa+/kdyXaxeolaVbyov/kV6vZa493pIpVI09biEaS6E/ghRBrKet9u
	p8iK8P0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprQN-00000008dAR-15Vt;
	Wed, 05 Mar 2025 16:16:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprK6-00000008cIZ-0Fz5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:10:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF9B1713;
	Wed,  5 Mar 2025 08:10:28 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FC773F5A1;
	Wed,  5 Mar 2025 08:10:14 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	bwicaksono@nvidia.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 2/3] perf/arm_cspmu: Generalise event filtering
Date: Wed,  5 Mar 2025 16:10:07 +0000
Message-Id: <c0cd4d4c12566dbf1b062ccd60241b3e0639f4cc.1741190362.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1741190362.git.robin.murphy@arm.com>
References: <cover.1741190362.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_081018_315720_233F0756 
X-CRM114-Status: GOOD (  20.70  )
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

The notion of a single u32 filter value for any event doesn't scale well
when the potential architectural scope is already two 64-bit values, and
implementations may add custom stuff on the side too. Rather than try to
thread arbitrary filter data through the common path, let's just make
the set_ev_filter op self-contained in terms of parsing and configuring
any and all filtering for the given event - splitting out a distinct op
for cycles events which inherently differ - and let implementations
override the whole thing if they want to do something different. This
already allows the Ampere code to stop looking a bit hacky.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/ampere_cspmu.c | 24 ++++++----------------
 drivers/perf/arm_cspmu/arm_cspmu.c    | 29 +++++++++++----------------
 drivers/perf/arm_cspmu/arm_cspmu.h    |  8 ++++----
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 21 ++++++++++++++++++-
 4 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/drivers/perf/arm_cspmu/ampere_cspmu.c b/drivers/perf/arm_cspmu/ampere_cspmu.c
index 31cc1a4ac9df..b8ca69fd9d1d 100644
--- a/drivers/perf/arm_cspmu/ampere_cspmu.c
+++ b/drivers/perf/arm_cspmu/ampere_cspmu.c
@@ -132,32 +132,20 @@ ampere_cspmu_get_name(const struct arm_cspmu *cspmu)
 	return ctx->name;
 }
 
-static u32 ampere_cspmu_event_filter(const struct perf_event *event)
+static void ampere_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
+				       const struct perf_event *event)
 {
 	/*
-	 * PMEVFILTR or PMCCFILTR aren't used in Ampere SoC PMU but are marked
-	 * as RES0. Make sure, PMCCFILTR is written zero.
+	 * PMCCFILTR is RES0, so this is just a dummy callback to override
+	 * the default implementation and avoid writing to it.
 	 */
-	return 0;
 }
 
 static void ampere_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
-				       struct hw_perf_event *hwc,
-				       u32 filter)
+				       const struct perf_event *event)
 {
-	struct perf_event *event;
-	unsigned int idx;
 	u32 threshold, rank, bank;
 
-	/*
-	 * At this point, all the events have the same filter settings.
-	 * Therefore, take the first event and use its configuration.
-	 */
-	idx = find_first_bit(cspmu->hw_events.used_ctrs,
-			     cspmu->cycle_counter_logical_idx);
-
-	event = cspmu->hw_events.events[idx];
-
 	threshold	= get_threshold(event);
 	rank		= get_rank(event);
 	bank		= get_bank(event);
@@ -233,7 +221,7 @@ static int ampere_cspmu_init_ops(struct arm_cspmu *cspmu)
 
 	cspmu->impl.ctx = ctx;
 
-	impl_ops->event_filter		= ampere_cspmu_event_filter;
+	impl_ops->set_cc_filter		= ampere_cspmu_set_cc_filter;
 	impl_ops->set_ev_filter		= ampere_cspmu_set_ev_filter;
 	impl_ops->validate_event	= ampere_cspmu_validate_event;
 	impl_ops->get_name		= ampere_cspmu_get_name;
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 769466d55bea..053bb7920df6 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -66,7 +66,9 @@ static unsigned long arm_cspmu_cpuhp_state;
 static DEFINE_MUTEX(arm_cspmu_lock);
 
 static void arm_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
-				    struct hw_perf_event *hwc, u32 filter);
+				    const struct perf_event *event);
+static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
+				    const struct perf_event *event);
 
 static struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
 {
@@ -205,11 +207,6 @@ static bool arm_cspmu_is_cycle_counter_event(const struct perf_event *event)
 	return (event->attr.config == ARM_CSPMU_EVT_CYCLES_DEFAULT);
 }
 
-static u32 arm_cspmu_event_filter(const struct perf_event *event)
-{
-	return event->attr.config1 & ARM_CSPMU_FILTER_MASK;
-}
-
 static ssize_t arm_cspmu_identifier_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *page)
@@ -371,7 +368,7 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
 		DEFAULT_IMPL_OP(get_name),
 		DEFAULT_IMPL_OP(is_cycle_counter_event),
 		DEFAULT_IMPL_OP(event_type),
-		DEFAULT_IMPL_OP(event_filter),
+		DEFAULT_IMPL_OP(set_cc_filter),
 		DEFAULT_IMPL_OP(set_ev_filter),
 		DEFAULT_IMPL_OP(event_attr_is_visible),
 	};
@@ -767,26 +764,26 @@ static inline void arm_cspmu_set_event(struct arm_cspmu *cspmu,
 }
 
 static void arm_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
-					struct hw_perf_event *hwc,
-					u32 filter)
+				    const struct perf_event *event)
 {
+	u32 filter = event->attr.config1 & ARM_CSPMU_FILTER_MASK;
 	u32 offset = PMEVFILTR + (4 * hwc->idx);
 
 	writel(filter, cspmu->base0 + offset);
 }
 
-static inline void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu, u32 filter)
+static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
+				    const struct perf_event *event)
 {
-	u32 offset = PMCCFILTR;
+	u32 filter = event->attr.config1 & ARM_CSPMU_FILTER_MASK;
 
-	writel(filter, cspmu->base0 + offset);
+	writel(filter, cspmu->base0 + PMCCFILTR);
 }
 
 static void arm_cspmu_start(struct perf_event *event, int pmu_flags)
 {
 	struct arm_cspmu *cspmu = to_arm_cspmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
-	u32 filter;
 
 	/* We always reprogram the counter */
 	if (pmu_flags & PERF_EF_RELOAD)
@@ -794,13 +791,11 @@ static void arm_cspmu_start(struct perf_event *event, int pmu_flags)
 
 	arm_cspmu_set_event_period(event);
 
-	filter = cspmu->impl.ops.event_filter(event);
-
 	if (event->hw.extra_reg.idx == cspmu->cycle_counter_logical_idx) {
-		arm_cspmu_set_cc_filter(cspmu, filter);
+		cspmu->impl.ops.set_cc_filter(cspmu, event);
 	} else {
 		arm_cspmu_set_event(cspmu, hwc);
-		cspmu->impl.ops.set_ev_filter(cspmu, hwc, filter);
+		cspmu->impl.ops.set_ev_filter(cspmu, event);
 	}
 
 	hwc->state = 0;
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 576249e0deea..d59040d6a7e3 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -149,11 +149,11 @@ struct arm_cspmu_impl_ops {
 	bool (*is_cycle_counter_event)(const struct perf_event *event);
 	/* Decode event type/id from configs */
 	u32 (*event_type)(const struct perf_event *event);
-	/* Decode filter value from configs */
-	u32 (*event_filter)(const struct perf_event *event);
-	/* Set event filter */
+	/* Set event filters */
+	void (*set_cc_filter)(struct arm_cspmu *cspmu,
+			      const struct perf_event *event);
 	void (*set_ev_filter)(struct arm_cspmu *cspmu,
-			      struct hw_perf_event *hwc, u32 filter);
+			      const struct perf_event *event);
 	/* Implementation specific event validation */
 	int (*validate_event)(struct arm_cspmu *cspmu,
 			      struct perf_event *event);
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index 8116c7846a46..9e817f120828 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -183,6 +183,24 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
 	return filter_val;
 }
 
+static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
+				   const struct perf_event *event)
+{
+	u32 filter = nv_cspmu_event_filter(event);
+	u32 offset = PMEVFILTR + (4 * event->hw.idx);
+
+	writel(filter, cspmu->base0 + offset);
+}
+
+static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
+				   const struct perf_event *event)
+{
+	u32 filter = nv_cspmu_event_filter(event);
+
+	writel(filter, cspmu->base0 + PMCCFILTR);
+}
+
+
 enum nv_cspmu_name_fmt {
 	NAME_FMT_GENERIC,
 	NAME_FMT_SOCKET
@@ -322,7 +340,8 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 	cspmu->impl.ctx = ctx;
 
 	/* NVIDIA specific callbacks. */
-	impl_ops->event_filter			= nv_cspmu_event_filter;
+	impl_ops->set_cc_filter			= nv_cspmu_set_cc_filter;
+	impl_ops->set_ev_filter			= nv_cspmu_set_ev_filter;
 	impl_ops->get_event_attrs		= nv_cspmu_get_event_attrs;
 	impl_ops->get_format_attrs		= nv_cspmu_get_format_attrs;
 	impl_ops->get_name			= nv_cspmu_get_name;
-- 
2.39.2.101.g768bb238c484.dirty


