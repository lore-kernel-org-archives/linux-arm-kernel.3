Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C3CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdPxnaYSPvilPDFIjZqYA5aStZSSabX1ZhR1+PCSRFI=; b=JSx+dhbwDZk42KdBcNzFMCaU2P
	N2h4OAwy/kuRhx0IQCFwbrjXfy6qLdeMQfgvGd0F3FOF4kHYxWc/OOiC0icmj2GKxbEyjvoEb91Di
	W6u0/xZO7xlkX6W3X2BHsxdw68SkdRt3Fx5x8fWgxc36bvWdrsXxS8+u/pQgP+XcnbNVES3T5yXiN
	umP/WKKLe0O7B0mmEC7thkfj9lzAsjePyGcnZ409ichXSOLj9Aj7ESOhJGFj6lDfmhQqXhdmpN2qh
	N6h1UgqEZOuvR5GVEWLEUEpQ34QGs2tNopbAzy61fUyLa6/WK00JFS+Ak/qtIbWJNeQbRQZHdNONR
	ks8uSNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLiy-0000000HKXn-0crM;
	Fri, 07 Nov 2025 12:37:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLiv-0000000HKV1-3Ufd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 12:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IdPxnaYSPvilPDFIjZqYA5aStZSSabX1ZhR1+PCSRFI=; b=pFq4UUd6ljF/QICiatZ/Ro/sdw
	Cyjld9qXmlH+QGFBudULxjO9z6iChSPNB0K/BFL7FhnXR7ZozW2S1FLdmixAiWMBFDQZ5lsVZcnU2
	k8+XI3v34gu/fwsPs66M9LxH+PF0PNOe6fAMuK/LbUvHHLuWcTIxjV7rsNnkC40kPZy2K1ih/K1ja
	MbN5vYYFuirWDX8Vn66CctUnLMJrx+ulT5nUrenPwfnJTgFTsYRT+0iA0Aoi9vrI8aQagCpvCL8KU
	hbKTrTgTxUQIRcuIN+XTkqI64oZa8wC9WnMnMsGwG45XH1SdOqXuGLm7WFU4i7kMEugRUXTvuk7aR
	72x13GhA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKrA-00000006OGe-2Rl5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:42:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ED5E1515;
	Fri,  7 Nov 2025 04:37:36 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 777133F66E;
	Fri,  7 Nov 2025 04:37:39 -0800 (PST)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 26/33] arm_mpam: Add mpam_msmon_read() to read monitor value
Date: Fri,  7 Nov 2025 12:34:43 +0000
Message-ID: <20251107123450.664001-27-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_114217_052121_4477081C 
X-CRM114-Status: GOOD (  19.65  )
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

Reading a monitor involves configuring what you want to monitor, and
reading the value. Components made up of multiple MSC may need values
from each MSC. MSCs may take time to configure, returning 'not ready'.
The maximum 'not ready' time should have been provided by firmware.

Add mpam_msmon_read() to hide all this. If (one of) the MSC returns
not ready, then wait the full timeout value before trying again.

CC: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Shaopeng Tan (Fujitsu) <tan.shaopeng@fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Add tag - thanks
Bring config_mismatch into this commit (Jonathan)
whitespace
---
 drivers/resctrl/mpam_devices.c  | 237 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h |  19 +++
 2 files changed, 256 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index f51ffb1400db..86abbac5e1ad 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -886,6 +886,243 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	return 0;
 }
 
+struct mon_read {
+	struct mpam_msc_ris		*ris;
+	struct mon_cfg			*ctx;
+	enum mpam_device_features	type;
+	u64				*val;
+	int				err;
+};
+
+static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
+				   u32 *flt_val)
+{
+	struct mon_cfg *ctx = m->ctx;
+
+	/*
+	 * For CSU counters its implementation-defined what happens when not
+	 * filtering by partid.
+	 */
+	*ctl_val = MSMON_CFG_x_CTL_MATCH_PARTID;
+
+	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
+
+	if (m->ctx->match_pmg) {
+		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
+		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);
+	}
+
+	switch (m->type) {
+	case mpam_feat_msmon_csu:
+		*ctl_val |= MSMON_CFG_CSU_CTL_TYPE_CSU;
+
+		if (mpam_has_feature(mpam_feat_msmon_csu_xcl, &m->ris->props))
+			*flt_val |= FIELD_PREP(MSMON_CFG_CSU_FLT_XCL,
+					       ctx->csu_exclude_clean);
+
+		break;
+	case mpam_feat_msmon_mbwu:
+		*ctl_val |= MSMON_CFG_MBWU_CTL_TYPE_MBWU;
+
+		if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ris->props))
+			*flt_val |= FIELD_PREP(MSMON_CFG_MBWU_FLT_RWBW, ctx->opts);
+
+		break;
+	default:
+		return;
+	}
+}
+
+static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
+				    u32 *flt_val)
+{
+	struct mpam_msc *msc = m->ris->vmsc->msc;
+
+	switch (m->type) {
+	case mpam_feat_msmon_csu:
+		*ctl_val = mpam_read_monsel_reg(msc, CFG_CSU_CTL);
+		*flt_val = mpam_read_monsel_reg(msc, CFG_CSU_FLT);
+		return;
+	case mpam_feat_msmon_mbwu:
+		*ctl_val = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
+		*flt_val = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
+		return;
+	default:
+		return;
+	}
+}
+
+/* Remove values set by the hardware to prevent apparent mismatches. */
+static void clean_msmon_ctl_val(u32 *cur_ctl)
+{
+	*cur_ctl &= ~MSMON_CFG_x_CTL_OFLOW_STATUS;
+}
+
+static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
+				     u32 flt_val)
+{
+	struct mpam_msc *msc = m->ris->vmsc->msc;
+
+	/*
+	 * Write the ctl_val with the enable bit cleared, reset the counter,
+	 * then enable counter.
+	 */
+	switch (m->type) {
+	case mpam_feat_msmon_csu:
+		mpam_write_monsel_reg(msc, CFG_CSU_FLT, flt_val);
+		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
+		mpam_write_monsel_reg(msc, CSU, 0);
+		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
+		break;
+	case mpam_feat_msmon_mbwu:
+		mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
+		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
+		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
+		/* Counting monitors require NRDY to be reset by software */
+		mpam_write_monsel_reg(msc, MBWU, 0);
+		break;
+	default:
+		return;
+	}
+}
+
+static void __ris_msmon_read(void *arg)
+{
+	u64 now;
+	bool nrdy = false;
+	bool config_mismatch;
+	struct mon_read *m = arg;
+	struct mon_cfg *ctx = m->ctx;
+	struct mpam_msc_ris *ris = m->ris;
+	struct mpam_props *rprops = &ris->props;
+	struct mpam_msc *msc = m->ris->vmsc->msc;
+	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
+
+	if (!mpam_mon_sel_lock(msc)) {
+		m->err = -EIO;
+		return;
+	}
+	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
+		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
+	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+
+	/*
+	 * Read the existing configuration to avoid re-writing the same values.
+	 * This saves waiting for 'nrdy' on subsequent reads.
+	 */
+	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	clean_msmon_ctl_val(&cur_ctl);
+	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
+	config_mismatch = cur_flt != flt_val ||
+			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
+
+	if (config_mismatch)
+		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
+
+	switch (m->type) {
+	case mpam_feat_msmon_csu:
+		now = mpam_read_monsel_reg(msc, CSU);
+		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
+			nrdy = now & MSMON___NRDY;
+		break;
+	case mpam_feat_msmon_mbwu:
+		now = mpam_read_monsel_reg(msc, MBWU);
+		if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
+			nrdy = now & MSMON___NRDY;
+		break;
+	default:
+		m->err = -EINVAL;
+		break;
+	}
+	mpam_mon_sel_unlock(msc);
+
+	if (nrdy) {
+		m->err = -EBUSY;
+		return;
+	}
+
+	now = FIELD_GET(MSMON___VALUE, now);
+	*m->val += now;
+}
+
+static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
+{
+	int err, any_err = 0;
+	struct mpam_vmsc *vmsc;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(vmsc, &comp->vmsc, comp_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		struct mpam_msc *msc = vmsc->msc;
+		struct mpam_msc_ris *ris;
+
+		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
+					 srcu_read_lock_held(&mpam_srcu)) {
+			arg->ris = ris;
+
+			err = smp_call_function_any(&msc->accessibility,
+						    __ris_msmon_read, arg,
+						    true);
+			if (!err && arg->err)
+				err = arg->err;
+
+			/*
+			 * Save one error to be returned to the caller, but
+			 * keep reading counters so that get reprogrammed. On
+			 * platforms with NRDY this lets us wait once.
+			 */
+			if (err)
+				any_err = err;
+		}
+	}
+
+	return any_err;
+}
+
+int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
+		    enum mpam_device_features type, u64 *val)
+{
+	int err;
+	struct mon_read arg;
+	u64 wait_jiffies = 0;
+	struct mpam_props *cprops = &comp->class->props;
+
+	might_sleep();
+
+	if (!mpam_is_enabled())
+		return -EIO;
+
+	if (!mpam_has_feature(type, cprops))
+		return -EOPNOTSUPP;
+
+	arg = (struct mon_read) {
+		.ctx = ctx,
+		.type = type,
+		.val = val,
+	};
+	*val = 0;
+
+	err = _msmon_read(comp, &arg);
+	if (err == -EBUSY && comp->class->nrdy_usec)
+		wait_jiffies = usecs_to_jiffies(comp->class->nrdy_usec);
+
+	while (wait_jiffies)
+		wait_jiffies = schedule_timeout_uninterruptible(wait_jiffies);
+
+	if (err == -EBUSY) {
+		arg = (struct mon_read) {
+			.ctx = ctx,
+			.type = type,
+			.val = val,
+		};
+		*val = 0;
+
+		err = _msmon_read(comp, &arg);
+	}
+
+	return err;
+}
+
 static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
 {
 	u32 num_words, msb;
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e59c0f4d9ada..d8f8e29987e0 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -184,6 +184,22 @@ struct mpam_props {
 #define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
 #define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
 
+/* The values for MSMON_CFG_MBWU_FLT.RWBW */
+enum mon_filter_options {
+	COUNT_BOTH	= 0,
+	COUNT_WRITE	= 1,
+	COUNT_READ	= 2,
+};
+
+struct mon_cfg {
+	u16			mon;
+	u8			pmg;
+	bool			match_pmg;
+	bool			csu_exclude_clean;
+	u32			partid;
+	enum mon_filter_options opts;
+};
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
@@ -327,6 +343,9 @@ void mpam_disable(struct work_struct *work);
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg);
 
+int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
+		    enum mpam_device_features, u64 *val);
+
 int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
-- 
2.43.0


