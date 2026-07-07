Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8A5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1ip6Lmh1P0INji+F/4w1ccvuRXlRzLGglpGWaakh0c=; b=yQ7du93xeDUO+Y/0g9L8tMBVpY
	A7PuLPFin35BzD4bzWYTIWDgCqRFkuujl0BFbad/hNQCFv8fS6PFb6Wp63Oocsc0Bex+PL680YVoD
	WnQwbM7Uj6KtO2VdquKPCg9DrRpwG1kSwywdUUkEz9+rFe4GjDPs2JkqP+PQj2OnnpAdsz+jPubY0
	Kzxii3eERLaR1NyiG2gyg51IVIrG7RY3fTbQqU0q6hRsqWaFcFBwTNq4iaTpGdvrFsjLTEyxUPYx+
	DjRRZesTXYqndpnuAm8JeE99LjXW09IEgRhpb7SbzvjbrXjqs+I9qnVC3ZIewzpkCteykMS8nwdSI
	e6lrVjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bg-0000000FSJq-23Ay;
	Tue, 07 Jul 2026 16:25:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bd-0000000FSHo-01ff
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:25:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A42A51BB0;
	Tue,  7 Jul 2026 09:25:03 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 701CE3F7B4;
	Tue,  7 Jul 2026 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783441508; bh=fzcXwM/UdAqXU0ERE8z+m1du4XepKt3JYuYeFtKTS0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ru/Fg4/9RnGRU3jFCE/y15KQ2TM28Fx1pCiQc9ellW2zjZhCcBQ1j/cyamnKSqBt6
	 Ki4XaRESMlRH7wKi/AnzMrKLSQymrIdjhoiuYStgjF/O6al6CIn0K1wJD243uzMiMP
	 0/m7i7pC75gB/jkXeqZpM9vDcpXFQ1Ebx2MUY56k=
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
Subject: [PATCH v5 3/5] arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
Date: Tue,  7 Jul 2026 17:24:38 +0100
Message-ID: <20260707162440.12132-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707162440.12132-1-ben.horgan@arm.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_092510_136606_B943D4A0 
X-CRM114-Status: GOOD (  13.22  )
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since new rfc:
Mention mbm_event mode in commit message

Changes since v3:
Warning bound (Sashiko)

Changes since v4:
resctrl_arch_reset_rmid() -> reset_arch_reset_cntr()
---
 drivers/resctrl/mpam_resctrl.c | 48 +++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 91b589b110a2..29a8cf8092e0 100644
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


