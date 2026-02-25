Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE096FD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+LYWjzwpTA5nw3Zf2Wz1QjxqS14+mOTD0zQJCYYXyY=; b=IjDSxxKymSjF58IdQPeVlPdv51
	F7B69MPoq+TELmW/KW0AT88pqZLzbkcDmTSZ5QRdvdscZwzs2twNIef8iNQwYA2ExGCyLu+dUnS6N
	/9ZFWpJCT/Y7D4zxw0Qzbj+sUCYIj+CZTGvr2ZN9tps5YCKzRnJsgvhw2ssXJ3ZCKzmXQi+646ymZ
	NT2fF+STgRqi6A2jph2AEY/QznR4Hh7i6LOCvNKC9FSaRpNuIerj6cd58iVAkjP4VoITGNQzjJZbd
	dd6spcfef9WJw12E5iKh5lOnR343oG7d3TCUncP4L+ps+b+8nSZLJCrp0UOEDvdp6djaMoHpFmt2j
	IvXLg/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLuc-00000004sjQ-01TR;
	Wed, 25 Feb 2026 20:55:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLuV-00000004sh6-3RCh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 20:55:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5526F175A;
	Wed, 25 Feb 2026 12:55:00 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23F803F73B;
	Wed, 25 Feb 2026 12:55:03 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	zengheng4@huawei.com
Subject: [RFC PATCH v1 4/4] arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()
Date: Wed, 25 Feb 2026 20:54:36 +0000
Message-ID: <20260225205436.3571756-5-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225205436.3571756-1-ben.horgan@arm.com>
References: <20260225205436.3571756-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_125508_866282_2FAA8FF1 
X-CRM114-Status: GOOD (  11.48  )
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

When used in ABMC mode, resctrl uses a different set of helpers to read and
reset the counters.

Add these.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 56 ++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 18528210ba46..6c2542cfb0df 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -137,19 +137,6 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_domai
 {
 }
 
-void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
-			     u32 closid, u32 rmid, int cntr_id,
-			     enum resctrl_event_id eventid)
-{
-}
-
-int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
-			   u32 unused, u32 rmid, int cntr_id,
-			   enum resctrl_event_id eventid, u64 *val)
-{
-	return -EOPNOTSUPP;
-}
-
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
 	if (r != &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res)
@@ -544,6 +531,28 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 				 closid, rmid, val);
 }
 
+/* MBWU counters when in ABMC mode */
+int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			   u32 closid, u32 rmid, int mon_idx,
+			   enum resctrl_event_id eventid, u64 *val)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_dom *l3_dom;
+	struct mpam_component *mon_comp;
+
+	if (!mpam_is_enabled())
+		return -EINVAL;
+
+	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
+		return -EINVAL;
+
+	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
+	mon_comp = l3_dom->mon_comp[eventid];
+
+	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu, mon_idx,
+				 closid, rmid, val);
+}
+
 static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
 			int mon_idx,
 			enum resctrl_conf_type cdp_type, u32 closid, u32 rmid)
@@ -600,6 +609,27 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
 }
 
+/* Reset an assigned counter */
+void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			     u32 closid, u32 rmid, int cntr_id,
+			     enum resctrl_event_id eventid)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+	struct mpam_resctrl_dom *l3_dom;
+	struct mpam_component *mon_comp;
+
+	if (!mpam_is_enabled())
+		return;
+
+	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
+		return;
+
+	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
+	mon_comp = l3_dom->mon_comp[eventid];
+
+	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
+}
+
 /*
  * The rmid realloc threshold should be for the smallest cache exposed to
  * resctrl.
-- 
2.43.0


