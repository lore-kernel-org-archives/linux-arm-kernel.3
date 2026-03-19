Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922091090256
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVAFZaOvBS0QrCQ5i/giYFWEuHhjdjTqjc9hhslVMH8=; b=h1LFvj5uWmm87SWVpFZdgHabul
	VUSRj/tYY5EOVqCGAvhSFel0k1gG03e9scHIOvKHAkjbLqqAJPh3EIwPHIM/PuXWogbHIxZIgAFh/
	isP/aRjlSXXTjh2AAjdOxF+xSCKdXJ9XoE3XK/ldgI2yJ55nIHBKwy2sAIWBc9Eqbb6zbvqKv1iTq
	nNEGLYgjVxG1zpB1+9WoiDBYKZdQJQTYkngI7+Z59lsG5++GWsggFN/llMfjafs0MORN0kym5s2St
	CXfoQ9+KMoIujuIxUcOQ5++w4+V6riT+F4ZqJ3PZmjXoiLl7P+4/gsbiuHHUOxcXRMh9h/nnTN4nv
	cCHSPhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GfO-0000000B7qo-3NcP;
	Thu, 19 Mar 2026 16:56:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GfD-0000000B7kh-2IF9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:56:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FF3C2247;
	Thu, 19 Mar 2026 09:55:56 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1ABD3F7BD;
	Thu, 19 Mar 2026 09:55:59 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/5] arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
Date: Thu, 19 Mar 2026 16:55:38 +0000
Message-ID: <20260319165540.381410-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319165540.381410-1-ben.horgan@arm.com>
References: <20260319165540.381410-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_095603_715897_D301C577 
X-CRM114-Status: GOOD (  12.52  )
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

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since new rfc:
Mention mbm_event mode in commit message
---
 drivers/resctrl/mpam_resctrl.c | 43 +++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 74b6ca59ce4a..4f49483f6445 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -127,12 +127,6 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
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
@@ -1078,6 +1072,43 @@ static void mpam_resctrl_pick_counters(void)
 	}
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
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
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
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 {
 	struct mpam_class *class = res->class;
-- 
2.43.0


