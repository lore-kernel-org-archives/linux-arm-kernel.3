Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC921C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Fj/S5h5TUMHTzCHsOViq/AI/WrLILuDALSnTCQOzjI=; b=myZzv4b4AvwwgYIQ7yFcUpiB1h
	hQ0MfZWtPk0eZ7C/3sTeN9arcWUXmUkd8NToB17zdiFbR9wKBs551iKPECQxtfIiBoulHELd8Zzj3
	KR7Gb4OTsxx2OuyLRLWeP+pQwwre5GZ3OqecGNSsS5h1n+Y97Bk5Mn0z1bK5ui8ozb5Df6jBs1v5I
	RgQBp2d4K4kyNuTwsTw1UrilNVa655oEaLObmQvAeL62H17Y30lHUOTaE7muceuXcncxXJ196UTLY
	F2+j0Itw8593QGlg7QKEg6xcA1oJNHDra8q89pnm6S3a3LY2sVbmyaqe7LUxsMxfVrK5kns/C/IDj
	nHbMLvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokDW-00000005kop-1HUH;
	Tue, 28 Jul 2026 15:59:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokDR-00000005kli-2nyT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:59:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DC9C1A9A;
	Tue, 28 Jul 2026 08:59:33 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 515293F66F;
	Tue, 28 Jul 2026 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785254377; bh=o2pRixdG0hxsXdhOTXSoB/dMF5B2i93AyhZvCU5xcfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/JlIyNAQzucUL8iAJtmrJb1WYsOBDljZM7wggkBaYO+y+XiGnjOE2qPUDdF/cFp4
	 17p3wFMx0ZP5ukeBLAzUxZUtfCOMUn7XgiND59xbjWW0DEtsbInhSiMguQKEDkpf/t
	 ZcyeoQQyoKLU+seWwf37s9MxZXMOw0YRIXlZBGGs=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com,
	leo.yan@arm.com
Subject: [PATCH v2 3/5] perf/arm-cmn: Refactor event filter data
Date: Tue, 28 Jul 2026 16:59:23 +0100
Message-ID: <2f1dee73fe016249e13fe74d6137a044c900c9e4.1785252273.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1785252273.git.robin.murphy@arm.com>
References: <cover.1785252273.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085937_798803_FB6B9E58 
X-CRM114-Status: GOOD (  14.75  )
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

The ABI hole I have dug myself into requires the driver to know which
event encodings are associated with which particular filter control.
Since we will soon have a notion of multiple filters per event, refactor
the event data to encapsulate filters in an explicit structure, which
can then more easily scale as an array in future.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Avoid transient bug with filter.val in _CMN_EVENT_ATTR()

 drivers/perf/arm-cmn.c | 95 ++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 46 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 14c267d2e2f9..74bc2aae4a06 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -717,13 +717,17 @@ static void arm_cmn_clear_idx(struct arm_cmn_hw_event *hw)
 		bitmap_zero(hw->wp_idx, CMN_MAX_XPS);
 }
 
+struct arm_cmn_filter_attr {
+	enum cmn_filter_select sel;
+	u8 val;
+};
+
 struct arm_cmn_event_attr {
 	struct device_attribute attr;
 	enum cmn_model model;
 	enum cmn_node_type type;
-	enum cmn_filter_select fsel;
 	u16 eventid;
-	u8 filter;
+	struct arm_cmn_filter_attr filter[1];
 };
 
 struct arm_cmn_format_attr {
@@ -732,24 +736,25 @@ struct arm_cmn_format_attr {
 	int config;
 };
 
-#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _filter, _fsel)\
+#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _fa, _fb, ...)	\
 	(&((struct arm_cmn_event_attr[]) {{				\
 		.attr = __ATTR(_name, 0444, arm_cmn_event_show, NULL),	\
 		.model = _model,					\
 		.type = _type,						\
 		.eventid = _eventid,					\
-		.filter = _filter,					\
-		.fsel = _fsel,						\
+		.filter = {{_fa, _fb}},					\
 	}})[0].attr.attr)
-#define CMN_EVENT_ATTR(_model, _name, _type, _eventid)			\
-	_CMN_EVENT_ATTR(_model, _name, _type, _eventid, 0, SEL_NONE)
+#define CMN_EVENT_ATTR(_model, _name, _type, _eventid, _filter...)	\
+	_CMN_EVENT_ATTR(_model, _name, _type, _eventid, ##_filter, 0, 0)
 
 static ssize_t arm_cmn_event_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	struct arm_cmn_event_attr *eattr;
+	struct arm_cmn_filter_attr *filter;
 
 	eattr = container_of(attr, typeof(*eattr), attr);
+	filter = eattr->filter;
 
 	if (eattr->type == CMN_TYPE_DTC)
 		return sysfs_emit(buf, "type=0x%x\n", eattr->type);
@@ -759,9 +764,9 @@ static ssize_t arm_cmn_event_show(struct device *dev,
 				  "type=0x%x,eventid=0x%x,wp_dev_sel=?,wp_chn_sel=?,wp_grp=?,wp_val=?,wp_mask=?\n",
 				  eattr->type, eattr->eventid);
 
-	if (eattr->fsel)
+	if (filter[0].sel)
 		return sysfs_emit(buf, "type=0x%x,eventid=0x%x,filter=0x%x\n",
-				  eattr->type, eattr->eventid, eattr->filter);
+				  eattr->type, eattr->eventid, filter[0].val);
 
 	return sysfs_emit(buf, "type=0x%x,eventid=0x%x\n", eattr->type,
 			  eattr->eventid);
@@ -849,8 +854,8 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-#define _CMN_EVENT_DVM(_model, _name, _event, _occup, _fsel)	\
-	_CMN_EVENT_ATTR(_model, dn_##_name, CMN_TYPE_DVM, _event, _occup, _fsel)
+#define CMN_EVENT_DVM(_model, _name, _event, _filter...)	\
+	CMN_EVENT_ATTR(_model, dn_##_name, CMN_TYPE_DVM, _event, ##_filter)
 #define CMN_EVENT_DTC(_name)					\
 	CMN_EVENT_ATTR(CMN_ANY, dtc_##_name, CMN_TYPE_DTC, 0)
 #define CMN_EVENT_HNF(_model, _name, _event)			\
@@ -880,32 +885,30 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
 #define CMN_EVENT_HNS(_name, _event)				\
 	CMN_EVENT_ATTR(CMN_ANY, hns_##_name, CMN_TYPE_HNS, _event)
 
-#define CMN_EVENT_DVM(_model, _name, _event)			\
-	_CMN_EVENT_DVM(_model, _name, _event, 0, SEL_NONE)
 #define CMN_EVENT_DVM_OCC(_model, _name, _event)			\
-	_CMN_EVENT_DVM(_model, _name##_all, _event, 0, SEL_OCCUP1_ID),	\
-	_CMN_EVENT_DVM(_model, _name##_dvmop, _event, 1, SEL_OCCUP1_ID),	\
-	_CMN_EVENT_DVM(_model, _name##_dvmsync, _event, 2, SEL_OCCUP1_ID)
+	CMN_EVENT_DVM(_model, _name##_all, _event, SEL_OCCUP1_ID, 0),	\
+	CMN_EVENT_DVM(_model, _name##_dvmop, _event, SEL_OCCUP1_ID, 1),	\
+	CMN_EVENT_DVM(_model, _name##_dvmsync, _event, SEL_OCCUP1_ID, 2)
 
 #define CMN_EVENT_HN_OCC(_model, _name, _type, _event)		\
-	_CMN_EVENT_ATTR(_model, _name##_all, _type, _event, 0, SEL_OCCUP1_ID), \
-	_CMN_EVENT_ATTR(_model, _name##_read, _type, _event, 1, SEL_OCCUP1_ID), \
-	_CMN_EVENT_ATTR(_model, _name##_write, _type, _event, 2, SEL_OCCUP1_ID), \
-	_CMN_EVENT_ATTR(_model, _name##_atomic, _type, _event, 3, SEL_OCCUP1_ID), \
-	_CMN_EVENT_ATTR(_model, _name##_stash, _type, _event, 4, SEL_OCCUP1_ID)
+	CMN_EVENT_ATTR(_model, _name##_all, _type, _event, SEL_OCCUP1_ID, 0), \
+	CMN_EVENT_ATTR(_model, _name##_read, _type, _event, SEL_OCCUP1_ID, 1), \
+	CMN_EVENT_ATTR(_model, _name##_write, _type, _event, SEL_OCCUP1_ID, 2), \
+	CMN_EVENT_ATTR(_model, _name##_atomic, _type, _event, SEL_OCCUP1_ID, 3), \
+	CMN_EVENT_ATTR(_model, _name##_stash, _type, _event, SEL_OCCUP1_ID, 4)
 #define CMN_EVENT_HN_CLS(_model, _name, _type, _event)			\
-	_CMN_EVENT_ATTR(_model, _name##_class0, _type, _event, 0, SEL_CLASS_OCCUP_ID), \
-	_CMN_EVENT_ATTR(_model, _name##_class1, _type, _event, 1, SEL_CLASS_OCCUP_ID), \
-	_CMN_EVENT_ATTR(_model, _name##_class2, _type, _event, 2, SEL_CLASS_OCCUP_ID), \
-	_CMN_EVENT_ATTR(_model, _name##_class3, _type, _event, 3, SEL_CLASS_OCCUP_ID)
+	CMN_EVENT_ATTR(_model, _name##_class0, _type, _event, SEL_CLASS_OCCUP_ID, 0), \
+	CMN_EVENT_ATTR(_model, _name##_class1, _type, _event, SEL_CLASS_OCCUP_ID, 1), \
+	CMN_EVENT_ATTR(_model, _name##_class2, _type, _event, SEL_CLASS_OCCUP_ID, 2), \
+	CMN_EVENT_ATTR(_model, _name##_class3, _type, _event, SEL_CLASS_OCCUP_ID, 3)
 #define CMN_EVENT_HN_SNT(_model, _name, _type, _event)			\
-	_CMN_EVENT_ATTR(_model, _name##_all, _type, _event, 0, SEL_CBUSY_SNTHROTTLE_SEL), \
-	_CMN_EVENT_ATTR(_model, _name##_group0_read, _type, _event, 1, SEL_CBUSY_SNTHROTTLE_SEL), \
-	_CMN_EVENT_ATTR(_model, _name##_group0_write, _type, _event, 2, SEL_CBUSY_SNTHROTTLE_SEL), \
-	_CMN_EVENT_ATTR(_model, _name##_group1_read, _type, _event, 3, SEL_CBUSY_SNTHROTTLE_SEL), \
-	_CMN_EVENT_ATTR(_model, _name##_group1_write, _type, _event, 4, SEL_CBUSY_SNTHROTTLE_SEL), \
-	_CMN_EVENT_ATTR(_model, _name##_read, _type, _event, 5, SEL_CBUSY_SNTHROTTLE_SEL), \
-	_CMN_EVENT_ATTR(_model, _name##_write, _type, _event, 6, SEL_CBUSY_SNTHROTTLE_SEL)
+	CMN_EVENT_ATTR(_model, _name##_all, _type, _event, SEL_CBUSY_SNTHROTTLE_SEL, 0), \
+	CMN_EVENT_ATTR(_model, _name##_group0_read, _type, _event, SEL_CBUSY_SNTHROTTLE_SEL, 1), \
+	CMN_EVENT_ATTR(_model, _name##_group0_write, _type, _event, SEL_CBUSY_SNTHROTTLE_SEL, 2), \
+	CMN_EVENT_ATTR(_model, _name##_group1_read, _type, _event, SEL_CBUSY_SNTHROTTLE_SEL, 3), \
+	CMN_EVENT_ATTR(_model, _name##_group1_write, _type, _event, SEL_CBUSY_SNTHROTTLE_SEL, 4), \
+	CMN_EVENT_ATTR(_model, _name##_read, _type, _event, SEL_CBUSY_SNTHROTTLE_SEL, 5), \
+	CMN_EVENT_ATTR(_model, _name##_write, _type, _event, SEL_CBUSY_SNTHROTTLE_SEL, 6)
 
 #define CMN_EVENT_HNF_OCC(_model, _name, _event)			\
 	CMN_EVENT_HN_OCC(_model, hnf_##_name, CMN_TYPE_HNF, _event)
@@ -916,21 +919,21 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
 
 #define CMN_EVENT_HNS_OCC(_name, _event)				\
 	CMN_EVENT_HN_OCC(CMN_ANY, hns_##_name, CMN_TYPE_HNS, _event),	\
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_rxsnp, CMN_TYPE_HNS, _event, 5, SEL_OCCUP1_ID), \
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_lbt, CMN_TYPE_HNS, _event, 6, SEL_OCCUP1_ID), \
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_hbt, CMN_TYPE_HNS, _event, 7, SEL_OCCUP1_ID)
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_rxsnp, CMN_TYPE_HNS, _event, SEL_OCCUP1_ID, 5), \
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_lbt, CMN_TYPE_HNS, _event, SEL_OCCUP1_ID, 6), \
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_hbt, CMN_TYPE_HNS, _event, SEL_OCCUP1_ID, 7)
 #define CMN_EVENT_HNS_CLS( _name, _event)				\
 	CMN_EVENT_HN_CLS(CMN_ANY, hns_##_name, CMN_TYPE_HNS, _event)
 #define CMN_EVENT_HNS_SNT(_name, _event)				\
 	CMN_EVENT_HN_SNT(CMN_ANY, hns_##_name, CMN_TYPE_HNS, _event)
 #define CMN_EVENT_HNS_HBT(_name, _event)				\
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_all, CMN_TYPE_HNS, _event, 0, SEL_HBT_LBT_SEL), \
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_hbt, CMN_TYPE_HNS, _event, 1, SEL_HBT_LBT_SEL), \
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_lbt, CMN_TYPE_HNS, _event, 2, SEL_HBT_LBT_SEL)
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_all, CMN_TYPE_HNS, _event, SEL_HBT_LBT_SEL, 0), \
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_hbt, CMN_TYPE_HNS, _event, SEL_HBT_LBT_SEL, 1), \
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_lbt, CMN_TYPE_HNS, _event, SEL_HBT_LBT_SEL, 2)
 #define CMN_EVENT_HNS_SNH(_name, _event)				\
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_all, CMN_TYPE_HNS, _event, 0, SEL_SN_HOME_SEL), \
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_sn, CMN_TYPE_HNS, _event, 1, SEL_SN_HOME_SEL), \
-	_CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_home, CMN_TYPE_HNS, _event, 2, SEL_SN_HOME_SEL)
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_all, CMN_TYPE_HNS, _event, SEL_SN_HOME_SEL, 0), \
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_sn, CMN_TYPE_HNS, _event, SEL_SN_HOME_SEL, 1), \
+	CMN_EVENT_ATTR(CMN_ANY, hns_##_name##_home, CMN_TYPE_HNS, _event, SEL_SN_HOME_SEL, 2)
 
 #define _CMN_EVENT_XP_MESH(_name, _event)			\
 	__CMN_EVENT_XP(e_##_name, (_event) | (0 << 2)),		\
@@ -1814,9 +1817,9 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
 	return ret;
 }
 
-static enum cmn_filter_select arm_cmn_filter_sel(const struct arm_cmn *cmn,
-						 enum cmn_node_type type,
-						 unsigned int eventid)
+static enum cmn_filter_select arm_cmn_event_filter(const struct arm_cmn *cmn,
+						   enum cmn_node_type type,
+						   unsigned int eventid)
 {
 	struct arm_cmn_event_attr *e;
 	enum cmn_model model = arm_cmn_model(cmn);
@@ -1824,7 +1827,7 @@ static enum cmn_filter_select arm_cmn_filter_sel(const struct arm_cmn *cmn,
 	for (int i = 0; i < ARRAY_SIZE(arm_cmn_event_attrs) - 1; i++) {
 		e = container_of(arm_cmn_event_attrs[i], typeof(*e), attr.attr);
 		if (e->model & model && e->type == type && e->eventid == eventid)
-			return e->fsel;
+			return e->filter[0].sel;
 	}
 	return SEL_NONE;
 }
@@ -1889,7 +1892,7 @@ static int arm_cmn_event_init(struct perf_event *event)
 	}
 
 	/* This is sufficiently annoying to recalculate, so cache it */
-	hw->filter_sel = arm_cmn_filter_sel(cmn, type, eventid);
+	hw->filter_sel = arm_cmn_event_filter(cmn, type, eventid);
 
 	bynodeid = CMN_EVENT_BYNODEID(event);
 	nodeid = CMN_EVENT_NODEID(event);
-- 
2.54.0.dirty


