Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA6ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3ynmzKfeg3eucqq3bQ/oxYUDdHDjl1e9ZsAJ+TGUGI=; b=NYdX8aRIe4IgyjrnE7YPWkiZqV
	Idhx3oNoaph3YXRhdUnxizK1aAnbNVY309WFE2VuAZn527vJVB8AlIV5E62fDN/9Xlnp7zv/oWLOK
	MX7tb+WUGBLJKAK+GgM2fi/iNwL6J7t2cAp9D+pCNUv+ZPGrCuTpIMEO9gJ4HZsGeq5uczZRewCPA
	IJQQ/EmrmiY/eAsbmd/exrYwJ00X3TkvJch6lWPV68A+ljZifwY6iPLjou7vkyPCBeBbDHA8Lzam+
	a2bXFysFp0m4I/EcQrY9OeYs1IcwMbPC0eVyEV/O0p2lMX7XPIbTkm2hHS+0FQcSi0hBlc1LMJFvh
	R1zX2fCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn5I-0000000FJvd-2ZnB;
	Wed, 03 Jun 2026 15:00:44 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn5A-0000000FJrp-47WC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1780498836; x=1812034836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D3ynmzKfeg3eucqq3bQ/oxYUDdHDjl1e9ZsAJ+TGUGI=;
  b=hExO6i+vyN0w0h1v1uC5xFjYvTtGhN2SZ8LWiW4uJey6x1hG1kMm+oNC
   1BcAW9KT61iosHAphME0AL/EqLo1/Uc+hQ33CIM+soXFChpO+7Ax2jmwD
   53M86lmUH30NhNyiD91bO8HFiUencqduIsrDxMLUssQhlo3KxdVa7FC0C
   DPTtRomQuIXMjj/8Q4KiYhTFcbdt7pKNn3cEqfgletM6CP1cMrkbH/Mst
   7QfEKKPOSzVQfujuher392WazCN4yoE5B6EurLvocA9venQMoefzD+95P
   0wnbhk/KGYpfEVcH8ZR4BAuG2rV8nif6ZKG1ubGvfzTA4lhBrcYKNE88Q
   Q==;
X-CSE-ConnectionGUID: xCgGdqx5TgOfrBY6T35XEA==
X-CSE-MsgGUID: bDB5oeGIRe+qqR1CsJLEyA==
X-IronPort-AV: E=Sophos;i="6.24,185,1774310400"; 
   d="scan'208";a="21003015"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 15:00:32 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:23080]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.245:2525] with esmtp (Farcaster)
 id b9492039-a994-4c34-9baa-4b1c6f9ea2e6; Wed, 3 Jun 2026 15:00:31 +0000 (UTC)
X-Farcaster-Flow-ID: b9492039-a994-4c34-9baa-4b1c6f9ea2e6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 3 Jun 2026 15:00:31 +0000
Received: from dev-dsk-avivb-1b-e28f450e.eu-west-1.amazon.com (10.15.33.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 3 Jun 2026 15:00:29 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<avivb@amazon.com>, <zeev@amazon.com>, <blakgeof@amazon.com>,
	<ilkka@os.amperecomputing.com>
Subject: [PATCH v5 1/2] perf/arm-cmn: Move DTM index data out of hw_perf_event
Date: Wed, 3 Jun 2026 18:00:24 +0300
Message-ID: <20260603150025.30980-2-avivb@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603150025.30980-1-avivb@amazon.com>
References: <20260531110447.10095-1-avivb@amazon.com>
 <20260603150025.30980-1-avivb@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.15.33.9]
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_080037_073622_C88C8096 
X-CRM114-Status: GOOD (  17.77  )
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

From: Robin Murphy <robin.murphy@arm.com>

The amount of data we need to store all the per-DTM counter and
watchpoint allocations is already testing the limits of hw_perf_event,
and future CMNs are only likely to keep growing larger, so move these
arrays out to separate memory allocations. As part of that we can use
an explicit union for allocating cycle counters to dtc_cycles events,
which is arguably nicer anyway.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Aviv Bakal <avivb@amazon.com>
Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
---
 drivers/perf/arm-cmn.c | 89 ++++++++++++++++++++++++++++--------------
 1 file changed, 59 insertions(+), 30 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index f5305c8fdca4..f1978a53d1c1 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -597,17 +597,14 @@ static void arm_cmn_debugfs_init(struct arm_cmn *cmn, int id) {}
 
 struct arm_cmn_hw_event {
 	struct arm_cmn_node *dn;
-	u64 dtm_idx[DIV_ROUND_UP(CMN_MAX_NODES_PER_EVENT * 2, 64)];
+	union {
+		u64 *dtm_idx;
+		int cc_idx;
+	};
+	unsigned long *wp_idx;
 	s8 dtc_idx[CMN_MAX_DTCS];
 	u8 num_dns;
 	u8 dtm_offset;
-
-	/*
-	 * WP config registers are divided to UP and DOWN events. We need to
-	 * keep to track only one of them.
-	 */
-	DECLARE_BITMAP(wp_idx, CMN_MAX_XPS);
-
 	bool wide_sel;
 	enum cmn_filter_select filter_sel;
 };
@@ -625,25 +622,42 @@ static struct arm_cmn_hw_event *to_cmn_hw(struct perf_event *event)
 	return (struct arm_cmn_hw_event *)&event->hw;
 }
 
-static void arm_cmn_set_index(u64 x[], unsigned int pos, unsigned int val)
+static void arm_cmn_set_dtm_idx(struct arm_cmn_hw_event *hw, unsigned int pos, unsigned int val)
 {
-	x[pos / 32] |= (u64)val << ((pos % 32) * 2);
+	hw->dtm_idx[pos / 32] |= (u64)val << ((pos % 32) * 2);
 }
 
-static unsigned int arm_cmn_get_index(u64 x[], unsigned int pos)
+static unsigned int arm_cmn_get_dtm_idx(struct arm_cmn_hw_event *hw, unsigned int pos)
 {
-	return (x[pos / 32] >> ((pos % 32) * 2)) & 3;
+	return (hw->dtm_idx[pos / 32] >> ((pos % 32) * 2)) & 3;
 }
 
-static void arm_cmn_set_wp_idx(unsigned long *wp_idx, unsigned int pos, bool val)
+static u64 *arm_cmn_alloc_dtm_idx(void)
+{
+	return kzalloc(DIV_ROUND_UP(CMN_MAX_NODES_PER_EVENT * 2, 64) * sizeof(u64), GFP_KERNEL);
+}
+
+static void arm_cmn_set_wp_idx(struct arm_cmn_hw_event *hw, unsigned int pos, bool val)
 {
 	if (val)
-		set_bit(pos, wp_idx);
+		set_bit(pos, hw->wp_idx);
+}
+
+static unsigned int arm_cmn_get_wp_idx(struct arm_cmn_hw_event *hw, unsigned int pos)
+{
+	return test_bit(pos, hw->wp_idx);
+}
+
+static unsigned long *arm_cmn_alloc_wp_idx(void)
+{
+	return bitmap_zalloc(CMN_MAX_XPS, GFP_KERNEL);
 }
 
-static unsigned int arm_cmn_get_wp_idx(unsigned long *wp_idx, unsigned int pos)
+static void arm_cmn_clear_idx(struct arm_cmn_hw_event *hw)
 {
-	return test_bit(pos, wp_idx);
+	memset(hw->dtm_idx, 0, DIV_ROUND_UP(CMN_MAX_NODES_PER_EVENT * 2, 64) * sizeof(u64));
+	if (hw->wp_idx)
+		bitmap_zero(hw->wp_idx, CMN_MAX_XPS);
 }
 
 struct arm_cmn_event_attr {
@@ -1376,7 +1390,7 @@ static int arm_cmn_get_assigned_wp_idx(struct perf_event *event,
 				       struct arm_cmn_hw_event *hw,
 				       unsigned int pos)
 {
-	return CMN_EVENT_EVENTID(event) + arm_cmn_get_wp_idx(hw->wp_idx, pos);
+	return CMN_EVENT_EVENTID(event) + arm_cmn_get_wp_idx(hw, pos);
 }
 
 static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
@@ -1387,7 +1401,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
 	struct arm_cmn_hw_event *hw = to_cmn_hw(event);
 
 	dtm->wp_event[wp_idx] = hw->dtc_idx[dtc];
-	arm_cmn_set_wp_idx(hw->wp_idx, pos, wp_idx - CMN_EVENT_EVENTID(event));
+	arm_cmn_set_wp_idx(hw, pos, wp_idx - CMN_EVENT_EVENTID(event));
 }
 
 static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
@@ -1458,7 +1472,7 @@ static u64 arm_cmn_read_dtm(struct arm_cmn *cmn, struct arm_cmn_hw_event *hw,
 			dtm = &cmn->dtms[dn->dtm] + hw->dtm_offset;
 			reg = readq_relaxed(dtm->base + offset);
 		}
-		dtm_idx = arm_cmn_get_index(hw->dtm_idx, i);
+		dtm_idx = arm_cmn_get_dtm_idx(hw, i);
 		count += (u16)(reg >> (dtm_idx * 16));
 	}
 	return count;
@@ -1505,7 +1519,7 @@ static void arm_cmn_event_read(struct perf_event *event)
 	unsigned long flags;
 
 	if (CMN_EVENT_TYPE(event) == CMN_TYPE_DTC) {
-		delta = arm_cmn_read_cc(cmn->dtc + hw->dtc_idx[0]);
+		delta = arm_cmn_read_cc(cmn->dtc + hw->cc_idx);
 		local64_add(delta, &event->count);
 		return;
 	}
@@ -1572,7 +1586,7 @@ static void arm_cmn_event_start(struct perf_event *event, int flags)
 	int i;
 
 	if (type == CMN_TYPE_DTC) {
-		struct arm_cmn_dtc *dtc = cmn->dtc + hw->dtc_idx[0];
+		struct arm_cmn_dtc *dtc = cmn->dtc + hw->cc_idx;
 
 		writel_relaxed(CMN_DT_DTC_CTL_DT_EN | CMN_DT_DTC_CTL_CG_DISABLE,
 			       dtc->base + CMN_DT_DTC_CTL);
@@ -1590,7 +1604,7 @@ static void arm_cmn_event_start(struct perf_event *event, int flags)
 			writeq_relaxed(mask, base + CMN_DTM_WPn_MASK(wp_idx));
 		}
 	} else for_each_hw_dn(hw, dn, i) {
-		int dtm_idx = arm_cmn_get_index(hw->dtm_idx, i);
+		int dtm_idx = arm_cmn_get_dtm_idx(hw, i);
 
 		arm_cmn_set_event_sel_lo(dn, dtm_idx, CMN_EVENT_EVENTID(event),
 					 hw->wide_sel);
@@ -1606,7 +1620,7 @@ static void arm_cmn_event_stop(struct perf_event *event, int flags)
 	int i;
 
 	if (type == CMN_TYPE_DTC) {
-		struct arm_cmn_dtc *dtc = cmn->dtc + hw->dtc_idx[0];
+		struct arm_cmn_dtc *dtc = cmn->dtc + hw->cc_idx;
 
 		dtc->cc_active = false;
 		writel_relaxed(CMN_DT_DTC_CTL_DT_EN, dtc->base + CMN_DT_DTC_CTL);
@@ -1619,7 +1633,7 @@ static void arm_cmn_event_stop(struct perf_event *event, int flags)
 			writeq_relaxed(~0ULL, base + CMN_DTM_WPn_VAL(wp_idx));
 		}
 	} else for_each_hw_dn(hw, dn, i) {
-		int dtm_idx = arm_cmn_get_index(hw->dtm_idx, i);
+		int dtm_idx = arm_cmn_get_dtm_idx(hw, i);
 
 		arm_cmn_set_event_sel_lo(dn, dtm_idx, 0, hw->wide_sel);
 	}
@@ -1763,6 +1777,14 @@ static enum cmn_filter_select arm_cmn_filter_sel(const struct arm_cmn *cmn,
 }
 
 
+static void arm_cmn_event_destroy(struct perf_event *event)
+{
+	struct arm_cmn_hw_event *hw = to_cmn_hw(event);
+
+	kfree(hw->dtm_idx);
+	bitmap_free(hw->wp_idx);
+}
+
 static int arm_cmn_event_init(struct perf_event *event)
 {
 	struct arm_cmn *cmn = to_cmn(event->pmu);
@@ -1787,6 +1809,11 @@ static int arm_cmn_event_init(struct perf_event *event)
 	if (type == CMN_TYPE_DTC)
 		return arm_cmn_validate_group(cmn, event);
 
+	event->destroy = arm_cmn_event_destroy;
+	hw->dtm_idx = arm_cmn_alloc_dtm_idx();
+	if (!hw->dtm_idx)
+		return -ENOMEM;
+
 	eventid = CMN_EVENT_EVENTID(event);
 	/* For watchpoints we need the actual XP node here */
 	if (type == CMN_TYPE_WP) {
@@ -1797,6 +1824,9 @@ static int arm_cmn_event_init(struct perf_event *event)
 		/* ...but the DTM may depend on which port we're watching */
 		if (cmn->multi_dtm)
 			hw->dtm_offset = CMN_EVENT_WP_DEV_SEL(event) / 2;
+		hw->wp_idx = arm_cmn_alloc_wp_idx();
+		if (!hw->wp_idx)
+			return -ENOMEM;
 	} else if (type == CMN_TYPE_XP &&
 		   (cmn->part == PART_CMN700 || cmn->part == PART_CMN_S3)) {
 		hw->wide_sel = true;
@@ -1847,7 +1877,7 @@ static void arm_cmn_event_clear(struct arm_cmn *cmn, struct perf_event *event,
 
 	while (i--) {
 		struct arm_cmn_dtm *dtm = &cmn->dtms[hw->dn[i].dtm] + hw->dtm_offset;
-		unsigned int dtm_idx = arm_cmn_get_index(hw->dtm_idx, i);
+		unsigned int dtm_idx = arm_cmn_get_dtm_idx(hw, i);
 
 		if (type == CMN_TYPE_WP) {
 			int wp_idx = arm_cmn_get_assigned_wp_idx(event, hw, i);
@@ -1861,8 +1891,7 @@ static void arm_cmn_event_clear(struct arm_cmn *cmn, struct perf_event *event,
 		dtm->pmu_config_low &= ~CMN__PMEVCNT_PAIRED(dtm_idx);
 		writel_relaxed(dtm->pmu_config_low, dtm->base + CMN_DTM_PMU_CONFIG);
 	}
-	memset(hw->dtm_idx, 0, sizeof(hw->dtm_idx));
-	memset(hw->wp_idx, 0, sizeof(hw->wp_idx));
+	arm_cmn_clear_idx(hw);
 
 	for_each_hw_dtc_idx(hw, j, idx)
 		cmn->dtc[j].counters[idx] = NULL;
@@ -1882,7 +1911,7 @@ static int arm_cmn_event_add(struct perf_event *event, int flags)
 				return -ENOSPC;
 
 		cmn->dtc[i].cycles = event;
-		hw->dtc_idx[0] = i;
+		hw->cc_idx = i;
 
 		if (flags & PERF_EF_START)
 			arm_cmn_event_start(event, 0);
@@ -1947,7 +1976,7 @@ static int arm_cmn_event_add(struct perf_event *event, int flags)
 				goto free_dtms;
 		}
 
-		arm_cmn_set_index(hw->dtm_idx, i, dtm_idx);
+		arm_cmn_set_dtm_idx(hw, i, dtm_idx);
 
 		dtm->input_sel[dtm_idx] = input_sel;
 		shift = CMN__PMEVCNTn_GLOBAL_NUM_SHIFT(dtm_idx);
@@ -1980,7 +2009,7 @@ static void arm_cmn_event_del(struct perf_event *event, int flags)
 	arm_cmn_event_stop(event, PERF_EF_UPDATE);
 
 	if (type == CMN_TYPE_DTC)
-		cmn->dtc[hw->dtc_idx[0]].cycles = NULL;
+		cmn->dtc[hw->cc_idx].cycles = NULL;
 	else
 		arm_cmn_event_clear(cmn, event, hw->num_dns);
 }
-- 
2.47.3


