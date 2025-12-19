Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47135D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyU1mrUn8wrTH7cO9L+sYDnc3A0e4ehrv9wRPATLxfw=; b=jb9ZGJAB0evZexjtmQYyAQXJ25
	YbgvVlwv73ULz3q2KMjEeVcpYbesS9wVSNX7tSnQcb6BOCFrd93Z6ZFpDs027z9R/36L5R7mnypAx
	MtTPluzf30Wy8LL/jNOjFNOpZ8JRhSGVd8OOSczsOgSXzJOUZJLyZU3iOyYUwb37E4lbI7jaBAPEa
	1AohJWmnQjwver0hAS6UT2RJFyAtmzo+uHSXQ7JZqGBXatxBy4oNGhlgdL9IR8LsD91xvF8nxOBjY
	nBdYbHci8sVm/z2NfI5kv6bXbEoFQKGV631yL3W3r7pNmam5U3rw8aEyGWWOYKpsdXTRdD6nSQy9X
	hl8TTbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf03-0000000AnL5-3FFd;
	Fri, 19 Dec 2025 18:14:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWezs-0000000An9A-0LZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:14:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65A1C1650;
	Fri, 19 Dec 2025 10:14:28 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BA7A3F5CA;
	Fri, 19 Dec 2025 10:14:30 -0800 (PST)
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
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 32/45] arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
Date: Fri, 19 Dec 2025 18:11:34 +0000
Message-ID: <20251219181147.3404071-33-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101436_218668_BC8F0464 
X-CRM114-Status: GOOD (  10.60  )
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

ABMC has a helper resctrl_arch_config_cntr() for changing the mapping
between 'cntr_id' and a CLOSID/RMID pair.

Add the helper.

For MPAM this is done by updating the mon->mbwu_idx_to_mon[] array, and as
usual CDP means it needs doing in three different ways.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index e96d320c219c..328a81ab68b4 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -765,6 +765,43 @@ static void mpam_resctrl_pick_counters(void)
 			     mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID].class);
 }
 
+static void __config_cntr(struct mpam_resctrl_mon *mon, u32 cntr_id,
+			  enum resctrl_conf_type cdp_type, u32 closid, u32 rmid,
+			  bool assign)
+{
+	u32 mbwu_idx, mon_idx = resctrl_get_config_index(cntr_id, cdp_type);
+
+	closid = resctrl_get_config_index(closid, cdp_type);
+	mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+	WARN_ON_ONCE(mon_idx > l3_num_allocated_mbwu);
+
+	if (assign)
+		mon->mbwu_idx_to_mon[mbwu_idx] = mon->assigned_counters[mon_idx];
+	else
+		mon->mbwu_idx_to_mon[mbwu_idx] = -1;
+}
+
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			      u32 cntr_id, bool assign)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
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
+	resctrl_arch_reset_rmid(r, d, closid, rmid, evtid);
+}
+
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
 	if (r != &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res)
-- 
2.43.0


