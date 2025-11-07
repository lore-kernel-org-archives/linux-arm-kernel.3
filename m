Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA000CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhY+UexH76pvfAwwh84uwVyslSK/a/FnEV3YSEfi4vE=; b=qTZuXUtVtvUKPIQwSG6+aTEscs
	NpmeJ6dxnW2z9MkpkKLr3hJ8P20xA08HFl2G8YsIv6Yzy+4hCfZ/WJzqw4uZhcVjj1M66EuuNB2Zw
	lo+5KtkFKDRVulH4VmU6Ze7vfRghSMWCKTeozPuFPT+hrrhUUQN5vErb5SU/wVaWI+hs6h6R0HMwf
	g61QYE2fL95dDwxoA0IINKEE2wzOcSaKNA1y/Vri76awP7YdueKEdTKWNGue1d3LLzfCh0ZP3SJBb
	zZDmsqcFWcdQP0o6ALxXXRZI5P0UgvFwYo5XObe+bn8woW7QT6kMHl9yYZJKyg7LwsutWE5xKC//g
	OBQOjLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLj0-0000000HKaQ-2QCv;
	Fri, 07 Nov 2025 12:37:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLiw-0000000HKVW-0K1x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:37:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D042D1515;
	Fri,  7 Nov 2025 04:37:41 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A927E3F66E;
	Fri,  7 Nov 2025 04:37:44 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	Zeng Heng <zengheng4@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 27/33] arm_mpam: Track bandwidth counter state for power management
Date: Fri,  7 Nov 2025 12:34:44 +0000
Message-ID: <20251107123450.664001-28-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_043750_266421_51B379AE 
X-CRM114-Status: GOOD (  20.82  )
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

Bandwidth counters need to run continuously to correctly reflect the
bandwidth.

Save the counter state when the hardware is reset due to CPU hotplug.
Add struct mbwu_state to track the bandwidth counter. Support for
tracking overflow with the same structure will be added in a
subsequent commit.

Cc: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Drop tags
Fix correction accounting
Split out overflow checking
---
 drivers/resctrl/mpam_devices.c  | 126 +++++++++++++++++++++++++++++++-
 drivers/resctrl/mpam_internal.h |  21 +++++-
 2 files changed, 145 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 86abbac5e1ad..2d1cef824b8e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -994,6 +994,7 @@ static void __ris_msmon_read(void *arg)
 	struct mon_read *m = arg;
 	struct mon_cfg *ctx = m->ctx;
 	struct mpam_msc_ris *ris = m->ris;
+	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_props *rprops = &ris->props;
 	struct mpam_msc *msc = m->ris->vmsc->msc;
 	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
@@ -1024,11 +1025,21 @@ static void __ris_msmon_read(void *arg)
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
+		/* Include bandwidth consumed before the last hardware reset */
+		now += mbwu_state->correction;
 		break;
 	default:
 		m->err = -EINVAL;
@@ -1041,7 +1052,6 @@ static void __ris_msmon_read(void *arg)
 		return;
 	}
 
-	now = FIELD_GET(MSMON___VALUE, now);
 	*m->val += now;
 }
 
@@ -1239,6 +1249,67 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	mutex_unlock(&msc->part_sel_lock);
 }
 
+/* Call with msc cfg_lock held */
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
+/* Call with MSC cfg_lock held */
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
@@ -1310,6 +1381,9 @@ static void mpam_reset_msc(struct mpam_msc *msc, bool online)
 		 * for non-zero partid may be lost while the CPUs are offline.
 		 */
 		ris->in_reset_state = online;
+
+		if (mpam_is_enabled() && !online)
+			mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
 	}
 	mutex_unlock(&msc->cfg_lock);
 }
@@ -1364,6 +1438,9 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 			mpam_touch_msc(msc, __write_config, &arg);
 		}
 		ris->in_reset_state = reset;
+
+		if (mpam_has_feature(mpam_feat_msmon_mbwu, &ris->props))
+			mpam_touch_msc(msc, &mpam_restore_mbwu_state, ris);
 	}
 	mutex_unlock(&msc->cfg_lock);
 }
@@ -2117,7 +2194,22 @@ static void mpam_unregister_irqs(void)
 
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
@@ -2141,6 +2233,8 @@ static void mpam_reset_component_cfg(struct mpam_component *comp)
 
 static int __allocate_component_cfg(struct mpam_component *comp)
 {
+	struct mpam_vmsc *vmsc;
+
 	mpam_assert_partid_sizes_fixed();
 
 	if (comp->cfg)
@@ -2158,6 +2252,36 @@ static int __allocate_component_cfg(struct mpam_component *comp)
 
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
index d8f8e29987e0..1f2b04b7703e 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -91,7 +91,10 @@ struct mpam_msc {
 	 */
 	struct mutex		part_sel_lock;
 
-	/* cfg_lock protects the msc configuration. */
+	/*
+	 * cfg_lock protects the msc configuration and guards against mbwu_state
+	 * and save and restore racing.
+	 */
 	struct mutex		cfg_lock;
 
 	/*
@@ -200,6 +203,19 @@ struct mon_cfg {
 	enum mon_filter_options opts;
 };
 
+/* Changes to msmon_mbwu_state are protected by the msc's mon_sel_lock. */
+struct msmon_mbwu_state {
+	bool		enabled;
+	struct mon_cfg	cfg;
+
+	/*
+	 * The value to add to the new reading to account for power management.
+	 */
+	u64		correction;
+
+	struct mpam_garbage	garbage;
+};
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
@@ -293,6 +309,9 @@ struct mpam_msc_ris {
 	/* parent: */
 	struct mpam_vmsc	*vmsc;
 
+	/* msmon mbwu configuration is preserved over reset */
+	struct msmon_mbwu_state	*mbwu_state;
+
 	struct mpam_garbage	garbage;
 };
 
-- 
2.43.0


