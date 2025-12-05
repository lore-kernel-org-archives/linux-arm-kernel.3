Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C97D374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzrwjXDb7KovTpj6ZT4L4GDOtO3PzUeenp48P1CDY8M=; b=UUh9Tj3W/EdpKW/CXzqz3FtSms
	dom04Rwu9lIA0rR9zuOgbMcYl1F5NHiIH9c+VovXO2AOwD2Q8ECML25o7/itrYorY8ubR5lXra4As
	IwkVNWnNgU7M2ELKUY2g8BpmDfTds75XbbNoyxDAN8Okcn64IuOoC7AKP+vTQBVk2IZBIgitR9LLv
	e1/jWHiLZSj5vZ5KUmQaVlL6I4DSdZt8uasBPeuUCz9sToH1EuoTQrCxZzDzBRj7xMeqqoMhMpSem
	IVKSjhxbklqCuX4bseIDYmadQF0IjN+KxHFv7nAfEKP0U4xAWAu2W05DZYCHspBDnffD2xhcSCFX9
	BhInTGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrN-0000000A6JY-2gmM;
	Fri, 05 Dec 2025 22:01:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrK-0000000A6Bx-3LYn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:01:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A62B81A25;
	Fri,  5 Dec 2025 14:00:54 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41FCB3F740;
	Fri,  5 Dec 2025 14:00:58 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 23/38] arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
Date: Fri,  5 Dec 2025 21:58:46 +0000
Message-Id: <20251205215901.17772-24-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140102_987000_F4565E44 
X-CRM114-Status: GOOD (  10.70  )
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

ABMC has a helper resctrl_arch_config_cntr() for changing the mapping
between 'cntr_id' and a CLOSID/RMID pair.

Add the helper.

For MPAM this is done by updating the mon->mbwu_idx_to_mon[] array,
and as usual CDP means it needs doing in three different ways.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index f607feaf0126..22ad5dd3c383 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -767,6 +767,43 @@ static void mpam_resctrl_pick_counters(void)
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
2.39.5


