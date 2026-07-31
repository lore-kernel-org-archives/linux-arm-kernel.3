Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB819C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbwVJZZH8ZzrI+RF7qURJzltXs9Sil7+lRJAZNzSVCE=; b=xm793si70mkY8TvCvW/TwbSc7i
	jkTzulgp1I9XRMCLZq7EQVLHlDY+KwZAyI2yaQeTyHoEoE6lFkmcv+sXCWgYnFeeRFnp4VOEqfBUG
	cQ34bG5Cqw55lOKySUI3EU8AMVPsfRT8J7cg+xZRo5M7TNFHoBt6il8cmNYNkzqCeh59bgATiJldc
	erju9Gbw6I79IGi2vWmwUTyGWCgHFhFjxc2cvAWboG7k4Dnc481XH7nMqlTw5547SL+JRe0fm7PEj
	QqsVrSAoByIRHyF/owuaM3+ys0Wzg36GPMem38gX/Abq2UgM/3Q1CfSqOGHlXO40jPceDYAPbkbG8
	gi3uVkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPx-0000000DIbc-2iWl;
	Fri, 31 Jul 2026 17:53:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPs-0000000DIZC-2Nok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:53:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F6EC22C7;
	Fri, 31 Jul 2026 10:52:59 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E1DA3F66F;
	Fri, 31 Jul 2026 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785520383; bh=aaANCuK6JowsooolSKuvPbBp3qe85hIFwZCVvu0N4OE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hMZznL9/5+ZbCizTCWG6g+v56JwTH1TlbriX/6WfffCJLkKQnpHAkThYq6aGtAGKQ
	 qmHsUFM2YrtxyYQl26uY/ULiC2Ikihj03XmdzefNAPYcp0nhh5uvxTxm3pz6TW8Azn
	 D/7i5WHN6fNfk5IioMBuDyl1kh7tLGdGuCmuc+sc=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com,
	will@kernel.org
Cc: james.morse@arm.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com,
	sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH 3/6] arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
Date: Fri, 31 Jul 2026 18:52:40 +0100
Message-ID: <20260731175243.904730-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731175243.904730-1-ben.horgan@arm.com>
References: <20260731175243.904730-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_105304_700862_0F772AE8 
X-CRM114-Status: GOOD (  12.89  )
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

From: James Morse <james.morse@arm.com>

ABMC, mbm_event mode, has a helper resctrl_arch_config_cntr() for changing
the mapping between 'cntr_id' and a CLOSID/RMID pair.

Add the helper.

For MPAM this is done by updating the mon->mbwu_idx_to_mon[] array, and as
usual CDP means it needs doing in three different ways.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since new rfc:
Mention mbm_event mode in commit message

Changes since v3:
Warning bound (Sashiko)

Changes since v4:
resctrl_arch_reset_rmid() -> reset_arch_reset_cntr()

Changes since v5:
Add Gavin's R-b & T-b
---
 drivers/resctrl/mpam_resctrl.c | 48 +++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 0698a235d15c..ab322865c51b 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -125,12 +125,6 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 {
 }
 
-void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
-			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
-			      u32 cntr_id, bool assign)
-{
-}
-
 int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 			   u32 unused, u32 rmid, int cntr_id,
 			   enum resctrl_event_id eventid, u64 *val)
@@ -1082,6 +1076,48 @@ static void mpam_resctrl_pick_counters(void)
 	}
 }
 
+static void __config_cntr(struct mpam_resctrl_mon *mon, u32 cntr_id,
+			  enum resctrl_conf_type cdp_type, u32 closid, u32 rmid,
+			  bool assign)
+{
+	/* Same CDP index remap as closid; maps cntr_id to assigned_counters[]. */
+	u32 mbwu_idx, mon_idx = resctrl_get_config_index(cntr_id, cdp_type);
+
+	closid = resctrl_get_config_index(closid, cdp_type);
+	mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+
+	if (assign)
+		mon->mbwu_idx_to_mon[mbwu_idx] = mon->assigned_counters[mon_idx];
+	else
+		mon->mbwu_idx_to_mon[mbwu_idx] = -1;
+}
+
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			      u32 cntr_id, bool assign)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+
+	if (evtid != QOS_L3_MBM_TOTAL_EVENT_ID) {
+		pr_debug("unexpected event id\n");
+		return;
+	}
+
+	if (!mon->mbwu_idx_to_mon || !mon->assigned_counters) {
+		pr_debug("monitor arrays not allocated\n");
+		return;
+	}
+
+	if (cdp_enabled) {
+		__config_cntr(mon, cntr_id, CDP_CODE, closid, rmid, assign);
+		__config_cntr(mon, cntr_id, CDP_DATA, closid, rmid, assign);
+	} else {
+		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
+	}
+
+	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 {
 	struct mpam_class *class = res->class;
-- 
2.43.0


