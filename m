Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0689CF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0ah1FjE6pyZ26TxhhOOpZSFwNEJAEV9ISIw7wdB6XY=; b=dHjCPi9g5pO8a5ude2qddiJOqw
	c6E37UDKFeTDew7q+P5npDEaKYRarz+Lhv7Bv0h7Lm6T4J2Lds58ivB1qZo06qjJOKtu4qaHYZkcB
	fMR0RjHEI/nkA/O4RkkX87FYPhpiGK12QFaANmHyRLVWCSb+K7laBH9+t5TeynQuJEvhjvL7Yvnk0
	Luv+hWovsixo/Md/saT4yjZp7r20NFpG0axqEgOvnxAeIk+l87r7A+tc6tu9OScr9BYN7l/l73BDo
	sAM83vOIfA1Tan/FOLwDFfbzJ0NPFLpDGRb8ozCo4NBMFlsIt8vVPu8GRPdj8s8l35L2HL1hzUAVh
	eJEGRj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLJs-00000005nia-1LEw;
	Mon, 12 Jan 2026 17:03:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLJm-00000005nd3-3wm5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:03:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97319153B;
	Mon, 12 Jan 2026 09:02:55 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 363C73F694;
	Mon, 12 Jan 2026 09:02:57 -0800 (PST)
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
Subject: [PATCH v3 35/47] arm_mpam: resctrl: Add resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()
Date: Mon, 12 Jan 2026 16:59:02 +0000
Message-ID: <20260112165914.4086692-36-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090303_111468_C78BCA92 
X-CRM114-Status: GOOD (  16.84  )
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

resctrl uses resctrl_arch_rmid_read() to read counters. CDP emulation means
the counter may need reading in three different ways. The same goes for
reset.

The helpers behind the resctrl_arch_ functions will be re-used for the ABMC
equivalent functions.

Add the rounding helper for checking monitor values while we're here.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
cfg intialisation style
code flow at end of read_mon_cdp_safe()

Changes since v2:
Whitespace changes
---
 drivers/resctrl/mpam_resctrl.c | 158 +++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |   5 ++
 2 files changed, 163 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index c01419c1a381..921be9b53c00 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -360,6 +360,164 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
 }
 
+static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
+		      enum mpam_device_features mon_type,
+		      int mon_idx,
+		      enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
+{
+	struct mon_cfg cfg;
+
+	if (!mpam_is_enabled())
+		return -EINVAL;
+
+	/* Shift closid to account for CDP */
+	closid = resctrl_get_config_index(closid, cdp_type);
+
+	if (mon_idx == USE_PRE_ALLOCATED) {
+		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+
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
+	if (irqs_disabled()) {
+		/* Check if we can access this domain without an IPI */
+		return -EIO;
+	}
+
+	cfg = (struct mon_cfg) {
+		.mon = mon_idx,
+		.match_pmg = true,
+		.partid = closid,
+		.pmg = rmid,
+	};
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
+		if (err)
+			return err;
+
+		*val += code_val + data_val;
+		return 0;
+	}
+
+	return __read_mon(mon, mon_comp, mon_type, mon_idx,
+			  CDP_NONE, closid, rmid, val);
+}
+
+/* MBWU when not in ABMC mode, and CSU counters. */
+int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
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
2.43.0


