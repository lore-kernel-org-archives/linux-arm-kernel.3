Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E38C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBZpahadp8ZrZhJyJWwel8h8qPB13hbCzONzlIfRU0E=; b=kKGY7JAa0LRBgu38Ln1qGAeZrX
	LfqkyFckG/orrpsUBNMNmVbGSG9gqWY9iVl74g0x7SYiLvgmJCuhk2dV8RYW94rA6oxEVSazctCps
	5UjQsVA+rjtYpr7QEojspA+g+Hivvebqh/T/6hzIIjQkmKq95rFmERYH8VapA1FKGcG1d6fF3OVI4
	HpAfm3GMQrzIcq9eT9ACaV8K182Xz2sE4sUtlfqzJGZW5846G521ON6NT0HlrHCCOYaSy7FjAbxw3
	ebS8V863XxsCHBt7HO+Ty4dkNb0WdeEaRwV9WUSEguidJefdYhuyH4Cj/sbpvMbLIvOHmxM3uYagw
	X9i/Sf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaFN-0000000HM62-05B2;
	Tue, 30 Jun 2026 15:19:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaFJ-0000000HM2s-3e7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:19:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8E222F27;
	Tue, 30 Jun 2026 08:19:28 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1ACF73F66F;
	Tue, 30 Jun 2026 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782832773; bh=MZyRicMuoQY1LjnQeuCl5hEYf202UFUKt6oQfp/mZno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CB+8eO1PTNKnc/qfW6ETteKzaKEKED7eHWy9aV8tZmSceLkqPwY/L31grAy1XKB2p
	 DmgAr5D5/vLWVKZWxjDLnu1TbP/SAInEBcDfoiFK7NE9qhyVi2MFoS91Iqxpe+DhKT
	 F9bojNPOGMVYTyCQywl093avQxS4tCMzi/2Ubw48=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com
Subject: [PATCH 4/5] perf/arm-cmn: Add new filters
Date: Tue, 30 Jun 2026 16:19:19 +0100
Message-ID: <5304caf0300992329742d22b746167b2f3e4174c.1782830759.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1782830759.git.robin.murphy@arm.com>
References: <cover.1782830759.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_081934_005239_6CD74CE2 
X-CRM114-Status: GOOD (  11.75  )
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

Add the logic to handle events with the upcoming new filter controls.
Since for now we will have the sole invariant of all EVICT_STATE_SEL
events having HBT_LBT_SEL as a secondary filter, for the sake of
simplicity we can just special-case that, and save the complication
of a full abstraction until unavoidably necessary.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 4ba78df87045..c935ddcf462a 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -166,12 +166,14 @@
 #define CMN_CONFIG_FILTER		GENMASK_ULL(30, 27)
 #define CMN_CONFIG_BYNODEID		BIT_ULL(31)
 #define CMN_CONFIG_NODEID		GENMASK_ULL(47, 32)
+#define CMN_CONFIG_FILTER2		GENMASK_ULL(51, 48)
 
 #define CMN_EVENT_TYPE(event)		FIELD_GET(CMN_CONFIG_TYPE, (event)->attr.config)
 #define CMN_EVENT_EVENTID(event)	FIELD_GET(CMN_CONFIG_EVENTID, (event)->attr.config)
 #define CMN_EVENT_FILTER(event)		FIELD_GET(CMN_CONFIG_FILTER, (event)->attr.config)
 #define CMN_EVENT_BYNODEID(event)	FIELD_GET(CMN_CONFIG_BYNODEID, (event)->attr.config)
 #define CMN_EVENT_NODEID(event)		FIELD_GET(CMN_CONFIG_NODEID, (event)->attr.config)
+#define CMN_EVENT_FILTER2(event)	FIELD_GET(CMN_CONFIG_FILTER2, (event)->attr.config)
 
 #define CMN_CONFIG_WP_COMBINE		GENMASK_ULL(30, 27)
 #define CMN_CONFIG_WP_DEV_SEL		GENMASK_ULL(50, 48)
@@ -284,6 +286,9 @@ enum cmn_filter_select {
 	SEL_CBUSY_SNTHROTTLE_SEL,
 	SEL_HBT_LBT_SEL,
 	SEL_SN_HOME_SEL,
+	SEL_SNP_VC_SEL,
+	SEL_ENHANCED_HBT_LBT_SEL,
+	SEL_EVICT_STATE_SEL,
 	SEL_MAX
 };
 
@@ -1377,6 +1382,7 @@ static struct attribute *arm_cmn_format_attrs[] = {
 	CMN_FORMAT_ATTR(filter, CMN_CONFIG_FILTER),
 	CMN_FORMAT_ATTR(bynodeid, CMN_CONFIG_BYNODEID),
 	CMN_FORMAT_ATTR(nodeid, CMN_CONFIG_NODEID),
+	CMN_FORMAT_ATTR(filter2, CMN_CONFIG_FILTER2),
 
 	CMN_FORMAT_ATTR(wp_dev_sel, CMN_CONFIG_WP_DEV_SEL),
 	CMN_FORMAT_ATTR(wp_chn_sel, CMN_CONFIG_WP_CHN_SEL),
@@ -1745,6 +1751,8 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
 
 		if (sel)
 			val->filter[dtm][sel] = CMN_EVENT_FILTER(event) + 1;
+		if (sel == SEL_EVICT_STATE_SEL)
+			val->filter[dtm][SEL_HBT_LBT_SEL] = CMN_EVENT_FILTER2(event) + 1;
 
 		if (type != CMN_TYPE_WP)
 			continue;
@@ -1799,6 +1807,10 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
 		    val->filter[dtm][sel] != CMN_EVENT_FILTER(event) + 1)
 			goto done;
 
+		if (sel == SEL_EVICT_STATE_SEL && val->filter[dtm][SEL_HBT_LBT_SEL] &&
+		    val->filter[dtm][SEL_HBT_LBT_SEL] != CMN_EVENT_FILTER2(event) + 1)
+			goto done;
+
 		if (type != CMN_TYPE_WP)
 			continue;
 
@@ -1943,6 +1955,8 @@ static void arm_cmn_event_clear(struct arm_cmn *cmn, struct perf_event *event,
 
 		if (hw->filter_sel)
 			hw->dn[i].filter[hw->filter_sel].count--;
+		if (hw->filter_sel == SEL_EVICT_STATE_SEL)
+			hw->dn[i].filter[SEL_HBT_LBT_SEL].count--;
 
 		dtm->pmu_config_low &= ~CMN__PMEVCNT_PAIRED(dtm_idx);
 		writel_relaxed(dtm->pmu_config_low, dtm->base + CMN_DTM_PMU_CONFIG);
@@ -1961,6 +1975,11 @@ static int arm_cmn_set_event_filter(struct arm_cmn_node *dn, struct perf_event *
 	if (fsel)
 		ret = arm_cmn_set_event_sel_hi(dn, fsel, CMN_EVENT_FILTER(event));
 
+	if (fsel == SEL_EVICT_STATE_SEL && !ret) {
+		ret = arm_cmn_set_event_sel_hi(dn, SEL_HBT_LBT_SEL, CMN_EVENT_FILTER2(event));
+		if (ret)
+			dn->filter[fsel].count--;
+	}
 	return ret;
 }
 
-- 
2.54.0.dirty


