Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A2CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5D6uZtpETbhd4HoJQylmheHaCo4t+91HApCBgAgE5I=; b=a8K5CQ9sgabkW/gmbKzACoMZSr
	PRb+AdU0CPX9da6dB5PPXKyRIyPaUqBrRmXRJJTP1To0lC/w7wgPkYIfbzpESNgXPutlnLRuQzcmB
	jMo8JJ3Pydp8xsfH29OU/TH1QCcJwGdydZGuKTdpts7GMuwE6eev45wnC18fJvbUdaBo/bfnk/m4q
	d/w41TXE5JAEm/qa94dXac2xBdUHW09ZltWbsGXnRoxt7P/4SOusNe7YUI+f5DoXgKHepjbw9fRVN
	p4EWoXF9gzNwJDT7xa0nAfwDWxGG/CLIa8+GZ8AhLjyo8jMiuV1TKfbjAi/IJD2c7m5gemVNF64Ua
	IWmAtc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bk-0000000FSMV-2VcR;
	Tue, 07 Jul 2026 16:25:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bh-0000000FSKX-2Wcd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D9C11E8D;
	Tue,  7 Jul 2026 09:25:08 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AE3D3F7B4;
	Tue,  7 Jul 2026 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783441512; bh=db4rqXD/JAjn+C3kEGmjhYD7A+v95iW7WFvSdQMXlng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hnr6DgRa8XEPuIoafL4/S+CiasOseZcBcrNFRd548Uq3DNJhxX+PTlziM4MduVkdf
	 MATECpSsbgXP/RO7FAX4lxAHrtJKUkAhsLWoFFO7C0dhIXLnkIJMnWy/G2P7xIpNxN
	 9gAGVUyZOMwsAkEjGzBv1xbdKeFfm6TKoSvLVXuo=
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
	jic23@kernel.org,
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
	zengheng4@huawei.com,
	x86@kernel.org,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v5 4/5] arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()
Date: Tue,  7 Jul 2026 17:24:39 +0100
Message-ID: <20260707162440.12132-5-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707162440.12132-1-ben.horgan@arm.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_092513_755130_B0FBBDDF 
X-CRM114-Status: GOOD (  15.01  )
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

When used in 'mbm_event' mode, ABMC emulation, resctrl uses arch hooks to
read and reset the memory bandwidth utilization (MBWU) counters.

Add these.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since rfc v1:
Move __reset_mon() and reset_mon_cdp_safe() helpers here
support mbwu in __read_mon()
Mention mbm_event mode in commit message

Changes since v3:
USE_PREALLOCATED_IDX, separate h/w counters are needed for code and data
when cdp_enabled is true
---
 drivers/resctrl/mpam_resctrl.c | 99 +++++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 29a8cf8092e0..7769c16bf319 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -119,19 +119,6 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
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
 	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
@@ -469,6 +456,14 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 	/* Shift closid to account for CDP */
 	closid = resctrl_get_config_index(closid, cdp_type);
 
+	if (mon_idx == USE_PRE_ALLOCATED) {
+		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+
+		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
+		if (mon_idx == -1)
+			return -ENOENT;
+	}
+
 	if (irqs_disabled()) {
 		/* Check if we can access this domain without an IPI */
 		return -EIO;
@@ -541,6 +536,84 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
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
+	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
+				 USE_PRE_ALLOCATED, closid, rmid, val);
+}
+
+static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
+			int mon_idx,
+			enum resctrl_conf_type cdp_type, u32 closid, u32 rmid)
+{
+	struct mon_cfg cfg = { };
+
+	if (!mpam_is_enabled())
+		return;
+
+	/* Shift closid to account for CDP */
+	closid = resctrl_get_config_index(closid, cdp_type);
+
+	if (mon_idx == USE_PRE_ALLOCATED) {
+		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+
+		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
+	}
+
+	if (mon_idx == -1)
+		return;
+	cfg.mon = mon_idx;
+	mpam_msmon_reset_mbwu(mon_comp, &cfg);
+}
+
+static void reset_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
+			       int mon_idx, u32 closid, u32 rmid)
+{
+	if (cdp_enabled) {
+		__reset_mon(mon, mon_comp, mon_idx, CDP_CODE, closid, rmid);
+		__reset_mon(mon, mon_comp, mon_idx, CDP_DATA, closid, rmid);
+	} else {
+		__reset_mon(mon, mon_comp, mon_idx, CDP_NONE, closid, rmid);
+	}
+}
+
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


