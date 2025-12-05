Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93758D374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWQIwEWSlt4xQRnu8tlUiFCJpBWybukUfgmqb3lB26Q=; b=hoN5eq98morcqESbVZ4cV0dAPB
	Ng4WT0oEGP/UTyvxfLk9CssR+w1Xhym0tgntWF0lJ+jLN9ABCt49re/QyUiAVbuaIwdMGof2CaOhJ
	LzVHX0Z/ZCjg5bJA9B8DUHCcOz+JV57xSlumsJXgK6EMxuZpvq67P02cd/cNd+xIlAtRl4/IxWjjz
	rzJe70MYEdMv5XYJX/j5qV6QW1vY2OvEKkdBMro2gBWjWXVOlLfRkOhrwohc0F1Ie6D4hOO52Av9K
	JjSR6b3/K5s4oBIFwC8ZdPX807QIhx185KSCY1YNJ12zLCxnXZgrtD3qe4JEr84RL6w/zNyeoKqdo
	5y9Sr6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRe0R-0000000A8QS-2QkI;
	Fri, 05 Dec 2025 22:10:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRe0Q-0000000A8Ps-1GLS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vWQIwEWSlt4xQRnu8tlUiFCJpBWybukUfgmqb3lB26Q=; b=oPGBRq/YtdNd1E2Od8dF5unLC9
	cUJsFiMi4699DFd52skBI6G1Pidv14gqDBixHa9d/EsNOUDFIVGaGf25un+7fcowtytldqx+muGJk
	u4651JEDDJuN5tPDuXCDeDu1McZyP82Cj/cbWI7BPVgPpkhOtgHMJ4sCT3qtpR8SIbU6qYQJNnDJv
	6NdsznjULuhgCSfkOT/HKNNy9H812WO5WRn8yp9Xe3PgCQuJGFtneLdnmOG5uKRzuEuvsGZQmFWW+
	a122lkP/6rwokfywhh/DS9BMcEoJQnR6LL2MAVdf3joMGZ22MgydSwDokDZ8tUNEtBJvYonHv5oiY
	8FnRoIVQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRd8p-00000006tnQ-25UX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:15:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C58E91A32;
	Fri,  5 Dec 2025 14:01:02 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60B863F740;
	Fri,  5 Dec 2025 14:01:06 -0800 (PST)
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
Subject: [RFC PATCH 25/38] arm_mpam: resctrl: Add resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()
Date: Fri,  5 Dec 2025 21:58:48 +0000
Message-Id: <20251205215901.17772-26-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_211504_210637_D17B5968 
X-CRM114-Status: GOOD (  15.71  )
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

resctrl uses resctrl_arch_rmid_read() to read counters. CDP emulation
means the counter may need reading in three different ways. The same
goes for reset.

The helpers behind the resctrl_arch_ functions will be re-used for the
ABMC equivalent functions.

Add the rounding helper for checking monitor values while we're here.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 154 +++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |   5 ++
 2 files changed, 159 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a2b238d47117..dc8a819d0976 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -355,6 +355,160 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
 }
 
+static int
+__read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
+	   enum mpam_device_features mon_type,
+	   int mon_idx,
+	   enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
+{
+	struct mon_cfg cfg = { };
+
+	if (!mpam_is_enabled())
+		return -EINVAL;
+
+	/* Shift closid to account for CDP */
+	closid = resctrl_get_config_index(closid, cdp_type);
+
+	if (mon_idx == USE_PRE_ALLOCATED) {
+		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
+		if (mon_idx == -1) {
+			if (mpam_resctrl_abmc_enabled()) {
+				/* Report Unassigned */
+				return -ENOENT;
+			}
+			/* Report Unavailable */
+			return -EINVAL;
+		}
+	}
+
+	cfg.mon = mon_idx;
+	cfg.match_pmg = true;
+	cfg.partid = closid;
+	cfg.pmg = rmid;
+
+	if (irqs_disabled()) {
+		/* Check if we can access this domain without an IPI */
+		return -EIO;
+	}
+
+	return mpam_msmon_read(mon_comp, &cfg, mon_type, val);
+}
+
+static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
+			     enum mpam_device_features mon_type,
+			     int mon_idx, u32 closid, u32 rmid, u64 *val)
+{
+	if (cdp_enabled) {
+		u64 code_val = 0, data_val = 0;
+		int err;
+
+		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
+				 CDP_CODE, closid, rmid, &code_val);
+		if (err)
+			return err;
+
+		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
+				 CDP_DATA, closid, rmid, &data_val);
+		if (!err)
+			*val += code_val + data_val;
+		return err;
+	}
+
+	return __read_mon(mon, mon_comp, mon_type, mon_idx,
+			  CDP_NONE, closid, rmid, val);
+}
+
+/* MBWU when not in ABMC mode, and CSU counters. */
+int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
+			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
+			   u64 *val, void *arch_mon_ctx)
+{
+	struct mpam_resctrl_dom *l3_dom;
+	struct mpam_component *mon_comp;
+	u32 mon_idx = *(u32 *)arch_mon_ctx;
+	enum mpam_device_features mon_type;
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+
+	resctrl_arch_rmid_read_context_check();
+
+	if (eventid >= QOS_NUM_EVENTS || !mon->class)
+		return -EINVAL;
+
+	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
+	mon_comp = l3_dom->mon_comp[eventid];
+
+	switch (eventid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+		mon_type = mpam_feat_msmon_csu;
+		break;
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		mon_type = mpam_feat_msmon_mbwu;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return read_mon_cdp_safe(mon, mon_comp, mon_type, mon_idx,
+				 closid, rmid, val);
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
+/* Called via IPI. Call with read_cpus_lock() held. */
+void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
+			     u32 closid, u32 rmid, enum resctrl_event_id eventid)
+{
+	struct mpam_resctrl_dom *l3_dom;
+	struct mpam_component *mon_comp;
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
+
+	if (!mpam_is_enabled())
+		return;
+
+	/* Only MBWU counters are relevant, and for supported event types. */
+	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
+		return;
+
+	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
+	mon_comp = l3_dom->mon_comp[eventid];
+
+	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
+}
+
 static bool cache_has_usable_cpor(struct mpam_class *class)
 {
 	struct mpam_props *cprops = &class->props;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index e1461e32af75..86d5e326d2bd 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -67,6 +67,11 @@ struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
 void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
 
+static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	return val;
+}
+
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
  * @partid_max:		The maximum PARTID value the requestor can generate.
-- 
2.39.5


