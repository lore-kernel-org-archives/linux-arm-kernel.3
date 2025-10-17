Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C556CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vG8Hdi45pKlNF/doLNO0UPwUD9/HsuKWh7VRLUJVB9o=; b=uA3pK99FYMnfwiojUGPuuqflBS
	ifrTVB/OVVVdkjA5Dx7PyPq09HSN1UoHfc7VRV9vM3FKK0f7HTYa2+0LJYMznqCiLE4+pmRb/CtED
	VOCWewJKD3Bp1/YQa3/73IyE1AWPNnp7Tw4KT1JtdLYfAbZKkDzBwMGMkHYzt5LxsiZ0zBKs8wiim
	rTfmtFCz8I79PSNYuQ4mkRa89Lq7HUIXK7dOqHu/ETXQl7lE2L0Gc9bfmj565SaW8iWlqu37KWC68
	w5cSKU10ZYLSkFbyTxIlaFb0OqiQfKwgbLhHJZQ3fAiHspkoKkk+9qDqQkT8KSiMwTxlvaFAX5tc0
	smWasz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pfe-00000008lYJ-0PT7;
	Fri, 17 Oct 2025 18:59:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pfX-00000008lQc-06l5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:59:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97C5A1515;
	Fri, 17 Oct 2025 11:59:06 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84B0B3F66E;
	Fri, 17 Oct 2025 11:59:09 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
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
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 24/29] arm_mpam: Track bandwidth counter state for overflow and power management
Date: Fri, 17 Oct 2025 18:56:40 +0000
Message-Id: <20251017185645.26604-25-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115915_173480_3F60895F 
X-CRM114-Status: GOOD (  24.79  )
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

Bandwidth counters need to run continuously to correctly reflect the
bandwidth.

The value read may be lower than the previous value read in the case
of overflow and when the hardware is reset due to CPU hotplug.

Add struct mbwu_state to track the bandwidth counter to allow overflow
and power management to be handled.

Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v2:
 * Removed bogus 'if (!mbwu_state)' checks.
 * Fixed __allocate_component_cfg() losing error return values.
 * Moved variable definitions into the loop.
 * Removed spurious lockdep assert from mpam_reset_component_cfg().

Changes since v1:
 * Fixed lock/unlock typo.
---
 drivers/resctrl/mpam_devices.c  | 146 +++++++++++++++++++++++++++++++-
 drivers/resctrl/mpam_internal.h |  23 +++++
 2 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index fb5414c6b3eb..deb1dcc6f6b1 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -955,6 +955,7 @@ static void clean_msmon_ctl_val(u32 *cur_ctl)
 static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 				     u32 flt_val)
 {
+	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = m->ris->vmsc->msc;
 
 	/*
@@ -973,20 +974,31 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
 		mpam_write_monsel_reg(msc, MBWU, 0);
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
+
+		mbwu_state = &m->ris->mbwu_state[m->ctx->mon];
+		mbwu_state->prev_val = 0;
+
 		break;
 	default:
 		return;
 	}
 }
 
+static u64 mpam_msmon_overflow_val(struct mpam_msc_ris *ris)
+{
+	/* TODO: scaling, and long counters */
+	return GENMASK_ULL(30, 0);
+}
+
 /* Call with MSC lock held */
 static void __ris_msmon_read(void *arg)
 {
-	u64 now;
 	bool nrdy = false;
 	struct mon_read *m = arg;
+	u64 now, overflow_val = 0;
 	struct mon_cfg *ctx = m->ctx;
 	struct mpam_msc_ris *ris = m->ris;
+	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_props *rprops = &ris->props;
 	struct mpam_msc *msc = m->ris->vmsc->msc;
 	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
@@ -1014,11 +1026,28 @@ static void __ris_msmon_read(void *arg)
 		now = mpam_read_monsel_reg(msc, CSU);
 		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
 			nrdy = now & MSMON___NRDY;
+		now = FIELD_GET(MSMON___VALUE, now);
 		break;
 	case mpam_feat_msmon_mbwu:
 		now = mpam_read_monsel_reg(msc, MBWU);
 		if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
 			nrdy = now & MSMON___NRDY;
+		now = FIELD_GET(MSMON___VALUE, now);
+
+		if (nrdy)
+			break;
+
+		mbwu_state = &ris->mbwu_state[ctx->mon];
+
+		/* Add any pre-overflow value to the mbwu_state->val */
+		if (mbwu_state->prev_val > now)
+			overflow_val = mpam_msmon_overflow_val(ris) - mbwu_state->prev_val;
+
+		mbwu_state->prev_val = now;
+		mbwu_state->correction += overflow_val;
+
+		/* Include bandwidth consumed before the last hardware reset */
+		now += mbwu_state->correction;
 		break;
 	default:
 		m->err = -EINVAL;
@@ -1031,7 +1060,6 @@ static void __ris_msmon_read(void *arg)
 		return;
 	}
 
-	now = FIELD_GET(MSMON___VALUE, now);
 	*m->val += now;
 }
 
@@ -1250,6 +1278,67 @@ static int mpam_reprogram_ris(void *_arg)
 	return 0;
 }
 
+/* Call with MSC lock held */
+static int mpam_restore_mbwu_state(void *_ris)
+{
+	int i;
+	struct mon_read mwbu_arg;
+	struct mpam_msc_ris *ris = _ris;
+
+	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
+		if (ris->mbwu_state[i].enabled) {
+			mwbu_arg.ris = ris;
+			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
+			mwbu_arg.type = mpam_feat_msmon_mbwu;
+
+			__ris_msmon_read(&mwbu_arg);
+		}
+	}
+
+	return 0;
+}
+
+/* Call with MSC lock and held */
+static int mpam_save_mbwu_state(void *arg)
+{
+	int i;
+	u64 val;
+	struct mon_cfg *cfg;
+	u32 cur_flt, cur_ctl, mon_sel;
+	struct mpam_msc_ris *ris = arg;
+	struct msmon_mbwu_state *mbwu_state;
+	struct mpam_msc *msc = ris->vmsc->msc;
+
+	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
+		mbwu_state = &ris->mbwu_state[i];
+		cfg = &mbwu_state->cfg;
+
+		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+			return -EIO;
+
+		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
+			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
+		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+
+		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
+		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
+		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+
+		val = mpam_read_monsel_reg(msc, MBWU);
+		mpam_write_monsel_reg(msc, MBWU, 0);
+
+		cfg->mon = i;
+		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
+		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
+		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
+		mbwu_state->correction += val;
+		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
+		mpam_mon_sel_unlock(msc);
+	}
+
+	return 0;
+}
+
 static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
 {
 	*reset_cfg = (struct mpam_config) {
@@ -1322,6 +1411,9 @@ static void mpam_reset_msc(struct mpam_msc *msc, bool online)
 		 * for non-zero partid may be lost while the CPUs are offline.
 		 */
 		ris->in_reset_state = online;
+
+		if (mpam_is_enabled() && !online)
+			mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
 	}
 }
 
@@ -1355,6 +1447,9 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 			mpam_reprogram_ris_partid(ris, partid, cfg);
 		}
 		ris->in_reset_state = reset;
+
+		if (mpam_has_feature(mpam_feat_msmon_mbwu, &ris->props))
+			mpam_touch_msc(msc, &mpam_restore_mbwu_state, ris);
 	}
 }
 
@@ -2096,7 +2191,22 @@ static void mpam_unregister_irqs(void)
 
 static void __destroy_component_cfg(struct mpam_component *comp)
 {
+	struct mpam_msc *msc;
+	struct mpam_vmsc *vmsc;
+	struct mpam_msc_ris *ris;
+
+	lockdep_assert_held(&mpam_list_lock);
+
 	add_to_garbage(comp->cfg);
+	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
+		msc = vmsc->msc;
+
+		if (mpam_mon_sel_lock(msc)) {
+			list_for_each_entry(ris, &vmsc->ris, vmsc_list)
+				add_to_garbage(ris->mbwu_state);
+			mpam_mon_sel_unlock(msc);
+		}
+	}
 }
 
 static void mpam_reset_component_cfg(struct mpam_component *comp)
@@ -2114,6 +2224,8 @@ static void mpam_reset_component_cfg(struct mpam_component *comp)
 
 static int __allocate_component_cfg(struct mpam_component *comp)
 {
+	struct mpam_vmsc *vmsc;
+
 	mpam_assert_partid_sizes_fixed();
 
 	if (comp->cfg)
@@ -2131,6 +2243,36 @@ static int __allocate_component_cfg(struct mpam_component *comp)
 
 	mpam_reset_component_cfg(comp);
 
+	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
+		struct mpam_msc *msc;
+		struct mpam_msc_ris *ris;
+		struct msmon_mbwu_state *mbwu_state;
+
+		if (!vmsc->props.num_mbwu_mon)
+			continue;
+
+		msc = vmsc->msc;
+		list_for_each_entry(ris, &vmsc->ris, vmsc_list) {
+			if (!ris->props.num_mbwu_mon)
+				continue;
+
+			mbwu_state = kcalloc(ris->props.num_mbwu_mon,
+					     sizeof(*ris->mbwu_state),
+					     GFP_KERNEL);
+			if (!mbwu_state) {
+				__destroy_component_cfg(comp);
+				return -ENOMEM;
+			}
+
+			init_garbage(&mbwu_state[0].garbage);
+
+			if (mpam_mon_sel_lock(msc)) {
+				ris->mbwu_state = mbwu_state;
+				mpam_mon_sel_unlock(msc);
+			}
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 0c84e945c891..28c475d18d86 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -199,6 +199,26 @@ struct mon_cfg {
 	enum mon_filter_options opts;
 };
 
+/*
+ * Changes to enabled and cfg are protected by the msc->lock.
+ * Changes to prev_val and correction are protected by the msc's mon_sel_lock.
+ */
+struct msmon_mbwu_state {
+	bool		enabled;
+	struct mon_cfg	cfg;
+
+	/* The value last read from the hardware. Used to detect overflow. */
+	u64		prev_val;
+
+	/*
+	 * The value to add to the new reading to account for power management,
+	 * and shifts to trigger the overflow interrupt.
+	 */
+	u64		correction;
+
+	struct mpam_garbage	garbage;
+};
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
@@ -291,6 +311,9 @@ struct mpam_msc_ris {
 	/* parent: */
 	struct mpam_vmsc	*vmsc;
 
+	/* msmon mbwu configuration is preserved over reset */
+	struct msmon_mbwu_state	*mbwu_state;
+
 	struct mpam_garbage	garbage;
 };
 
-- 
2.39.5


