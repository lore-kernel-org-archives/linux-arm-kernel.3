Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD3C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDdBSUCJgB3OLmZje/+wFtxU+EoDdH4/lnK7yN7M4uk=; b=glitPFFJg++i98P6D6CARjBk9P
	wuv2dITp82IXtMCavHGEXD3WyMQcoR/V10aHY61ByUrxKEsOMxLwWvTAPOWLM/yKhFa0y64EVg6AA
	iK0DIx3+fkUCNrJy2sKQrA2mefsK5Fu7KobwgS9hQxs61fkb/kd12Ux7qpFf3VEk5fVxJ2Y3nI2KL
	/iclIygD9rZKW38k+ryEjrV7wYhA/6i/r1sHcahIZZbTosfWeIFr6cufuw0VmxbrL2Irt/RccHFDD
	vo2qy5wHLlwLKZPsDEU7Tfpbx0ncFxZ+IUjdm62rlRK6ftWfm3DnnII7P4w8E/oEE8TbGlmDGH8mA
	6yK7GqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SDa-00000006U36-05Nh;
	Tue, 15 Sep 2026 12:24:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SDX-00000006U2O-3wD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:24:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66719169E;
	Tue, 15 Sep 2026 05:24:51 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 292323F882;
	Tue, 15 Sep 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789475095; bh=FbBe7/k1TqP33+Njsxlol9/gjyQJhzoXVBpNLujR+dc=;
	h=From:To:Cc:Subject:Date:From;
	b=rgV7xHEM6Dz2Aff3x9O8lvj2Bn4Z3/i2s6zWIWNskBXxTc1zJCZ8gQrCWFQiC2OSG
	 87qGPqLFl5WWQFWaFSM+0NSLUG6ZywsJ/BJhiT/rqnkCm3L5Kd19H7Gor3PlKa+ZxR
	 NCnkNWRdkh28/3MwJ+/lMI9XDTNEp/hbcfCVkWU0=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	leo.yan@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] perf/arm-cmn: Fix multi-filter encoding
Date: Tue, 15 Sep 2026 13:24:22 +0100
Message-ID: <ec590cd4cc61b54d6ad3b306b69777ad7729c9d6.1789475062.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_052456_233544_FF63694B 
X-CRM114-Status: GOOD (  16.50  )
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

The current special-case for EVICT_STATE_SEL filtering effectively
assigns the "filter" and "filter2" controls in the opposite order from
how the CMN S3 r2 TRM states "Filtering is programmed in pmu_hbt_lbt_sel
and pmu_evict_state_sel". On reflection, not only does this seem
unnecessarily non-obvious to users, but it's also likely to be a problem
for scaling to a full multi-filter abstraction in future. There is a
logical order to filters based on their bitfield positions in the
pmu_event_sel register, which the TRM descriptions allude to, and the
cmn_filter_select enum already (almost) follows, so let's fix the UABI
to follow suit while it's still unreleased.

Fixes: 09178f536bb9 ("perf/arm-cmn: Plumb in new filter types")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Also fix filter lookup order and missing return in set_event_filter

 drivers/perf/arm-cmn.c | 58 +++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index b162de3d9d16..33e8a040c903 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -305,9 +305,9 @@ enum cmn_filter_select {
 	SEL_NONE,
 	SEL_OCCUP1_ID,
 	SEL_CLASS_OCCUP_ID,
-	SEL_CBUSY_SNTHROTTLE_SEL,
 	SEL_HBT_LBT_SEL,
 	SEL_SN_HOME_SEL,
+	SEL_CBUSY_SNTHROTTLE_SEL,
 	SEL_SNP_VC_SEL,
 	SEL_ENHANCED_HBT_LBT_SEL,
 	SEL_EVICT_STATE_SEL,
@@ -978,10 +978,14 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
 	_CMN_EVENT_HNS(_model, _name##_all, _event, _sel, 0),		\
 	_CMN_EVENT_HNS(_model, _name##_hbt, _event, _sel, 1),		\
 	_CMN_EVENT_HNS(_model, _name##_lbt, _event, _sel, 2)
-#define _CMN_EVENT_HNS_HBT2(_model, _name, _event, _fsel1, f1)		\
-	_CMN_EVENT_HNS(_model, _name##_all, _event, _fsel1, f1, SEL_HBT_LBT_SEL, 0), \
-	_CMN_EVENT_HNS(_model, _name##_hbt, _event, _fsel1, f1, SEL_HBT_LBT_SEL, 1), \
-	_CMN_EVENT_HNS(_model, _name##_lbt, _event, _fsel1, f1, SEL_HBT_LBT_SEL, 2)
+#define _CMN_EVENT_HNS_EVICT(_model, _name, _event, _fsel1, f1)			\
+	_CMN_EVENT_HNS(_model, _name##_all, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 0), \
+	_CMN_EVENT_HNS(_model, _name##_eu, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 1), \
+	_CMN_EVENT_HNS(_model, _name##_en, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 2), \
+	_CMN_EVENT_HNS(_model, _name##_su, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 3), \
+	_CMN_EVENT_HNS(_model, _name##_sn, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 4), \
+	_CMN_EVENT_HNS(_model, _name##_mu, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 5), \
+	_CMN_EVENT_HNS(_model, _name##_mn, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 6)
 
 #define CMN_EVENT_HNS_OCC(_model, _name, _event)			\
 	CMN_EVENT_HN_OCC(_model, hns_##_name, CMN_TYPE_HNS, _event),	\
@@ -1014,13 +1018,9 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
 	_CMN_EVENT_HNS(CMNS3R2, _name##_ccglcn, _event, SEL_ENHANCED_HBT_LBT_SEL, 5), \
 	_CMN_EVENT_HNS(CMNS3R2, _name##_ccgrn, _event, SEL_ENHANCED_HBT_LBT_SEL, 6)
 #define CMN_EVENT_HNS_EVICT(_model, _name, _event)			\
-	_CMN_EVENT_HNS_HBT2(_model, _name##_all, _event, SEL_EVICT_STATE_SEL, 0), \
-	_CMN_EVENT_HNS_HBT2(_model, _name##_eu, _event, SEL_EVICT_STATE_SEL, 1), \
-	_CMN_EVENT_HNS_HBT2(_model, _name##_en, _event, SEL_EVICT_STATE_SEL, 2), \
-	_CMN_EVENT_HNS_HBT2(_model, _name##_su, _event, SEL_EVICT_STATE_SEL, 3), \
-	_CMN_EVENT_HNS_HBT2(_model, _name##_sn, _event, SEL_EVICT_STATE_SEL, 4), \
-	_CMN_EVENT_HNS_HBT2(_model, _name##_mu, _event, SEL_EVICT_STATE_SEL, 5), \
-	_CMN_EVENT_HNS_HBT2(_model, _name##_mn, _event, SEL_EVICT_STATE_SEL, 6)
+	_CMN_EVENT_HNS_EVICT(_model, _name##_all, _event, SEL_HBT_LBT_SEL, 0), \
+	_CMN_EVENT_HNS_EVICT(_model, _name##_hbt, _event, SEL_HBT_LBT_SEL, 1), \
+	_CMN_EVENT_HNS_EVICT(_model, _name##_lbt, _event, SEL_HBT_LBT_SEL, 2)
 
 #define CMN_EVENT_HNSR0_HBT(_name, _event)				\
 	_CMN_EVENT_HNS_HBT(CMN700 | CMNS3R01, _name, _event, SEL_HBT_LBT_SEL)
@@ -1856,10 +1856,12 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
 
 		val->dtm_count[dtm]++;
 
+		if (sel == SEL_EVICT_STATE_SEL) {
+			val->filter[dtm][sel] = CMN_EVENT_FILTER2(event) + 1;
+			sel = SEL_HBT_LBT_SEL;
+		}
 		if (sel)
 			val->filter[dtm][sel] = CMN_EVENT_FILTER(event) + 1;
-		if (sel == SEL_EVICT_STATE_SEL)
-			val->filter[dtm][SEL_HBT_LBT_SEL] = CMN_EVENT_FILTER2(event) + 1;
 
 		if (type != CMN_TYPE_WP)
 			continue;
@@ -1910,14 +1912,17 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
 		if (val->dtm_count[dtm] == CMN_DTM_NUM_COUNTERS)
 			goto done;
 
+		if (sel == SEL_EVICT_STATE_SEL) {
+			if (val->filter[dtm][sel] &&
+			    val->filter[dtm][sel] != CMN_EVENT_FILTER2(event) + 1)
+				goto done;
+			sel = SEL_HBT_LBT_SEL;
+		}
+
 		if (sel && val->filter[dtm][sel] &&
 		    val->filter[dtm][sel] != CMN_EVENT_FILTER(event) + 1)
 			goto done;
 
-		if (sel == SEL_EVICT_STATE_SEL && val->filter[dtm][SEL_HBT_LBT_SEL] &&
-		    val->filter[dtm][SEL_HBT_LBT_SEL] != CMN_EVENT_FILTER2(event) + 1)
-			goto done;
-
 		if (type != CMN_TYPE_WP)
 			continue;
 
@@ -1946,7 +1951,7 @@ static enum cmn_filter_select arm_cmn_event_filter(const struct arm_cmn *cmn,
 	for (int i = 0; i < ARRAY_SIZE(arm_cmn_event_attrs) - 1; i++) {
 		e = container_of(arm_cmn_event_attrs[i], typeof(*e), attr.attr);
 		if (e->model & model && e->type == type && e->eventid == eventid)
-			return e->filter[0].sel;
+			return e->filter[1].sel ?: e->filter[0].sel;
 	}
 	return SEL_NONE;
 }
@@ -2077,16 +2082,21 @@ static void arm_cmn_event_clear(struct arm_cmn *cmn, struct perf_event *event,
 static int arm_cmn_set_event_filter(struct arm_cmn_node *dn, struct perf_event *event)
 {
 	enum cmn_filter_select fsel = to_cmn_hw(event)->filter_sel;
+	bool evict_state = fsel == SEL_EVICT_STATE_SEL;
 	int ret = 0;
 
+	if (evict_state) {
+		ret = arm_cmn_set_event_sel_hi(dn, fsel, CMN_EVENT_FILTER2(event));
+		if (ret)
+			return ret;
+		fsel = SEL_HBT_LBT_SEL;
+	}
 	if (fsel)
 		ret = arm_cmn_set_event_sel_hi(dn, fsel, CMN_EVENT_FILTER(event));
 
-	if (fsel == SEL_EVICT_STATE_SEL && !ret) {
-		ret = arm_cmn_set_event_sel_hi(dn, SEL_HBT_LBT_SEL, CMN_EVENT_FILTER2(event));
-		if (ret)
-			dn->filter[fsel].count--;
-	}
+	if (ret && evict_state)
+		dn->filter[SEL_EVICT_STATE_SEL].count--;
+
 	return ret;
 }
 
-- 
2.54.0.dirty


