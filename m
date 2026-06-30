Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJIJ3oSfkNsvxECffsoPHq6bZsDdPJ4smh1ZKfuCrj4=; b=lEN7wyrPTwg68vVH8oQG0rw8tJ
	w+n8FRvjJGGXM4euQnbfoWG1/fVEHIi6bPPN6ohbDsJcYlF2LgbCg8+wdFR+qS1IsLKpz5l1P+GZM
	gXz1TYjevkChvzZAqe18pb3Bzm/PWd5Y43A28YrjJfUd+DpeuWFUl9HGVluyJsTnlnF/07UxebOZK
	BU0Bw42EcGR8bsHfAOl2E8IJhH8psslmLAFOOD9HD+1hx3N2yMb1FFYkAXvJEybQvOdppfJZI2KvM
	WDd4EFJd5k02H38iWBEWNhQ81Or4eRn4FuuNQHvAiRVsV4Ubd0moCY4FGk+jxi/Uc9OjzELkKeKRs
	FzozTE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaFM-0000000HM52-2WbF;
	Tue, 30 Jun 2026 15:19:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaFG-0000000HM26-0IG1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C2622F34;
	Tue, 30 Jun 2026 08:19:24 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEF723F66F;
	Tue, 30 Jun 2026 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782832769; bh=WXNChX3qLc+61leAsPUeTWHIOePOKl21uu2MAvibi6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J9EjfpI8HsreibXyPFjFioTqSkL9k/WWjl+332Fs/kMqTAcb8c6p4PX7HjpMTK0Gv
	 ktVken9Xfoogj5wGDPkVVHD3moINZ9oien3hUXSmuZ18zJp4MEOrP5jaf/hSZ5R3E6
	 swYBIQXwEvs2/NCkkjjOCFTtnnJ4teUNZeDC6Eww=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com
Subject: [PATCH 1/5] perf/arm-cmn: Rename filter variables for clarity
Date: Tue, 30 Jun 2026 16:19:16 +0100
Message-ID: <7022c44c7ef30cacf9923a704eca6953ffaea6b7.1782830759.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1782830759.git.robin.murphy@arm.com>
References: <cover.1782830759.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_081930_187935_5A226EC6 
X-CRM114-Status: GOOD (  17.42  )
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

CMN has already grown many more event-specific filters than the original
Occupancy ID, but since they are all independent of each other we've
just overloaded them onto the same name. Before we add yet more, and
they begin to overlap, rename all our "occupid" variables to "filter" so
that things can be a bit clearer and more consistent (but leaving the
format attribute itself, to avoid UAPI concerns).

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 53 ++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 50402bc4a21d..2a8a67da72c3 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -163,13 +163,13 @@
 /* Event attributes */
 #define CMN_CONFIG_TYPE			GENMASK_ULL(15, 0)
 #define CMN_CONFIG_EVENTID		GENMASK_ULL(26, 16)
-#define CMN_CONFIG_OCCUPID		GENMASK_ULL(30, 27)
+#define CMN_CONFIG_FILTER		GENMASK_ULL(30, 27)
 #define CMN_CONFIG_BYNODEID		BIT_ULL(31)
 #define CMN_CONFIG_NODEID		GENMASK_ULL(47, 32)
 
 #define CMN_EVENT_TYPE(event)		FIELD_GET(CMN_CONFIG_TYPE, (event)->attr.config)
 #define CMN_EVENT_EVENTID(event)	FIELD_GET(CMN_CONFIG_EVENTID, (event)->attr.config)
-#define CMN_EVENT_OCCUPID(event)	FIELD_GET(CMN_CONFIG_OCCUPID, (event)->attr.config)
+#define CMN_EVENT_FILTER(event)		FIELD_GET(CMN_CONFIG_FILTER, (event)->attr.config)
 #define CMN_EVENT_BYNODEID(event)	FIELD_GET(CMN_CONFIG_BYNODEID, (event)->attr.config)
 #define CMN_EVENT_NODEID(event)		FIELD_GET(CMN_CONFIG_NODEID, (event)->attr.config)
 
@@ -301,7 +301,7 @@ struct arm_cmn_node {
 	struct {
 		u8 val : 4;
 		u8 count : 4;
-	} occupid[SEL_MAX];
+	} filter[SEL_MAX];
 	union {
 		u8 event[4];
 		__le32 event_sel;
@@ -672,7 +672,7 @@ struct arm_cmn_event_attr {
 	enum cmn_node_type type;
 	enum cmn_filter_select fsel;
 	u16 eventid;
-	u8 occupid;
+	u8 filter;
 };
 
 struct arm_cmn_format_attr {
@@ -681,13 +681,13 @@ struct arm_cmn_format_attr {
 	int config;
 };
 
-#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _occupid, _fsel)\
+#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _filter, _fsel)\
 	(&((struct arm_cmn_event_attr[]) {{				\
 		.attr = __ATTR(_name, 0444, arm_cmn_event_show, NULL),	\
 		.model = _model,					\
 		.type = _type,						\
 		.eventid = _eventid,					\
-		.occupid = _occupid,					\
+		.filter = _filter,					\
 		.fsel = _fsel,						\
 	}})[0].attr.attr)
 #define CMN_EVENT_ATTR(_model, _name, _type, _eventid)			\
@@ -709,8 +709,8 @@ static ssize_t arm_cmn_event_show(struct device *dev,
 				  eattr->type, eattr->eventid);
 
 	if (eattr->fsel > SEL_NONE)
-		return sysfs_emit(buf, "type=0x%x,eventid=0x%x,occupid=0x%x\n",
-				  eattr->type, eattr->eventid, eattr->occupid);
+		return sysfs_emit(buf, "type=0x%x,eventid=0x%x,filter=0x%x\n",
+				  eattr->type, eattr->eventid, eattr->filter);
 
 	return sysfs_emit(buf, "type=0x%x,eventid=0x%x\n", eattr->type,
 			  eattr->eventid);
@@ -1320,7 +1320,7 @@ static ssize_t arm_cmn_format_show(struct device *dev,
 static struct attribute *arm_cmn_format_attrs[] = {
 	CMN_FORMAT_ATTR(type, CMN_CONFIG_TYPE),
 	CMN_FORMAT_ATTR(eventid, CMN_CONFIG_EVENTID),
-	CMN_FORMAT_ATTR(occupid, CMN_CONFIG_OCCUPID),
+	CMN_FORMAT_ATTR(filter, CMN_CONFIG_FILTER),
 	CMN_FORMAT_ATTR(bynodeid, CMN_CONFIG_BYNODEID),
 	CMN_FORMAT_ATTR(nodeid, CMN_CONFIG_NODEID),
 
@@ -1333,6 +1333,9 @@ static struct attribute *arm_cmn_format_attrs[] = {
 	_CMN_FORMAT_ATTR(wp_val, 1, CMN_CONFIG1_WP_VAL),
 	_CMN_FORMAT_ATTR(wp_mask, 2, CMN_CONFIG2_WP_MASK),
 
+	/* Old name for UAPI compatibility */
+	CMN_FORMAT_ATTR(occupid, CMN_CONFIG_FILTER),
+
 	NULL
 };
 
@@ -1544,30 +1547,30 @@ static void arm_cmn_event_read(struct perf_event *event)
 }
 
 static int arm_cmn_set_event_sel_hi(struct arm_cmn_node *dn,
-				    enum cmn_filter_select fsel, u8 occupid)
+				    enum cmn_filter_select fsel, u8 filter)
 {
 	u64 reg;
 
 	if (fsel == SEL_NONE)
 		return 0;
 
-	if (!dn->occupid[fsel].count) {
-		dn->occupid[fsel].val = occupid;
+	if (!dn->filter[fsel].count) {
+		dn->filter[fsel].val = filter;
 		reg = FIELD_PREP(CMN__PMU_CBUSY_SNTHROTTLE_SEL,
-				 dn->occupid[SEL_CBUSY_SNTHROTTLE_SEL].val) |
+				 dn->filter[SEL_CBUSY_SNTHROTTLE_SEL].val) |
 		      FIELD_PREP(CMN__PMU_SN_HOME_SEL,
-				 dn->occupid[SEL_SN_HOME_SEL].val) |
+				 dn->filter[SEL_SN_HOME_SEL].val) |
 		      FIELD_PREP(CMN__PMU_HBT_LBT_SEL,
-				 dn->occupid[SEL_HBT_LBT_SEL].val) |
+				 dn->filter[SEL_HBT_LBT_SEL].val) |
 		      FIELD_PREP(CMN__PMU_CLASS_OCCUP_ID,
-				 dn->occupid[SEL_CLASS_OCCUP_ID].val) |
+				 dn->filter[SEL_CLASS_OCCUP_ID].val) |
 		      FIELD_PREP(CMN__PMU_OCCUP1_ID,
-				 dn->occupid[SEL_OCCUP1ID].val);
+				 dn->filter[SEL_OCCUP1ID].val);
 		writel_relaxed(reg >> 32, dn->pmu_base + CMN_PMU_EVENT_SEL + 4);
-	} else if (dn->occupid[fsel].val != occupid) {
+	} else if (dn->filter[fsel].val != filter) {
 		return -EBUSY;
 	}
-	dn->occupid[fsel].count++;
+	dn->filter[fsel].count++;
 	return 0;
 }
 
@@ -1649,7 +1652,7 @@ static void arm_cmn_event_stop(struct perf_event *event, int flags)
 
 struct arm_cmn_val {
 	u8 dtm_count[CMN_MAX_DTMS];
-	u8 occupid[CMN_MAX_DTMS][SEL_MAX];
+	u8 filter[CMN_MAX_DTMS][SEL_MAX];
 	u8 wp[CMN_MAX_DTMS][4];
 	u8 wp_combine[CMN_MAX_DTMS][2];
 	int dtc_count[CMN_MAX_DTCS];
@@ -1694,7 +1697,7 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
 		val->dtm_count[dtm]++;
 
 		if (sel > SEL_NONE)
-			val->occupid[dtm][sel] = CMN_EVENT_OCCUPID(event) + 1;
+			val->filter[dtm][sel] = CMN_EVENT_FILTER(event) + 1;
 
 		if (type != CMN_TYPE_WP)
 			continue;
@@ -1745,8 +1748,8 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
 		if (val->dtm_count[dtm] == CMN_DTM_NUM_COUNTERS)
 			goto done;
 
-		if (sel > SEL_NONE && val->occupid[dtm][sel] &&
-		    val->occupid[dtm][sel] != CMN_EVENT_OCCUPID(event) + 1)
+		if (sel > SEL_NONE && val->filter[dtm][sel] &&
+		    val->filter[dtm][sel] != CMN_EVENT_FILTER(event) + 1)
 			goto done;
 
 		if (type != CMN_TYPE_WP)
@@ -1892,7 +1895,7 @@ static void arm_cmn_event_clear(struct arm_cmn *cmn, struct perf_event *event,
 		}
 
 		if (hw->filter_sel > SEL_NONE)
-			hw->dn[i].occupid[hw->filter_sel].count--;
+			hw->dn[i].filter[hw->filter_sel].count--;
 
 		dtm->pmu_config_low &= ~CMN__PMEVCNT_PAIRED(dtm_idx);
 		writel_relaxed(dtm->pmu_config_low, dtm->base + CMN_DTM_PMU_CONFIG);
@@ -1978,7 +1981,7 @@ static int arm_cmn_event_add(struct perf_event *event, int flags)
 			input_sel = CMN__PMEVCNT0_INPUT_SEL_DEV + dtm_idx +
 				    (nid.port << 4) + (nid.dev << 2);
 
-			if (arm_cmn_set_event_sel_hi(dn, hw->filter_sel, CMN_EVENT_OCCUPID(event)))
+			if (arm_cmn_set_event_sel_hi(dn, hw->filter_sel, CMN_EVENT_FILTER(event)))
 				goto free_dtms;
 		}
 
-- 
2.54.0.dirty


