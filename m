Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8503CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tjQU0JQHCJ39kZxTFNYb7Zihp8us5I/Dwv1taWvkLw=; b=p74CYc4jdOs3PtLYPKT8xRtsvs
	BkNtOAPU3J3EimgtKTITSpHi3fUse/EJYRLZaODiyTCVeR1oLVg2PR0E9grljLC+lmYoVu+LR9Y22
	8R5sXKrxHuxDhoIbFFnBl51aEVD8+AV5gXVRBB0R6qfIPcDtBzruDAyPgtf75hz2Do50aZuSRn1I+
	s0p1/5H/e6Il4ANVyvBF38zaZ2JQAh/OQ43mIsO+qSuTYVtKL7RciI7nqCiN5HbAeZX+mtvjW+V5p
	X8XtC4C1UdzLhebvdJC5JBfL3ZeX8VbaTj5PADSxonjfSS5fH4ejEL3Cm6PaLsZ9pDLVGPbv9C526
	GAcFUlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphtf-000000049rC-2zEc;
	Sat, 23 Aug 2025 06:38:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTp6-000000034eo-2Hmx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 15:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7tjQU0JQHCJ39kZxTFNYb7Zihp8us5I/Dwv1taWvkLw=; b=OtJsretfItnqJWIDYVdDqAlAlm
	0/TPI9OR4iKN6UPJEEM/gcTPS/gKMtoKASKK2h8B7p+8xK1uv+G9cNZrmNSsaT6PXgnDhO+57C9Bb
	G+WNKgnM0u0MDqT7hfEk7vhkCqQGkMse+pE6ArynYAqOSxsB56X0GvAvXy/ff+WA5XZWICVB8rWF7
	5JCkXjIiJhoaMX5HIgPnntULDygYi3CdUUBNIjxhxXk+23ff0zaKc4aqcO+EKnaJjRymbfE/Fp1ZN
	DxPvhNTOZD1FmDEosFSs90zN2e7mMkzzcpTPkdeLHlaH+CUPZPtnaXuKtCdl3bCmKn7wE9HdervfW
	QxqLZgpA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTox-00000000z5H-3x0m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:36:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E41E915A1;
	Fri, 22 Aug 2025 08:36:42 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C361A3F63F;
	Fri, 22 Aug 2025 08:36:45 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
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
	Rex Nie <rex.nie@jaguarmicro.com>,
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 27/33] arm_mpam: Add mpam_msmon_read() to read monitor value
Date: Fri, 22 Aug 2025 15:30:42 +0000
Message-Id: <20250822153048.2287-62-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_163652_371036_36562752 
X-CRM114-Status: GOOD (  20.21  )
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

Reading a monitor involves configuring what you want to monitor, and
reading the value. Components made up of multiple MSC may need values
from each MSC. MSCs may take time to configure, returning 'not ready'.
The maximum 'not ready' time should have been provided by firmware.

Add mpam_msmon_read() to hide all this. If (one of) the MSC returns
not ready, then wait the full timeout value before trying again.

CC: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 222 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h |  18 +++
 2 files changed, 240 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index e7e00c632512..9ce771aaf671 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -973,6 +973,228 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
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
+	switch (m->type) {
+	case mpam_feat_msmon_csu:
+		*ctl_val = MSMON_CFG_CSU_CTL_TYPE_CSU;
+		break;
+	case mpam_feat_msmon_mbwu:
+		*ctl_val = MSMON_CFG_MBWU_CTL_TYPE_MBWU;
+		break;
+	default:
+		return;
+	}
+
+	/*
+	 * For CSU counters its implementation-defined what happens when not
+	 * filtering by partid.
+	 */
+	*ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
+
+	*flt_val = FIELD_PREP(MSMON_CFG_MBWU_FLT_PARTID, ctx->partid);
+	if (m->ctx->match_pmg) {
+		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
+		*flt_val |= FIELD_PREP(MSMON_CFG_MBWU_FLT_PMG, ctx->pmg);
+	}
+
+	if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ris->props))
+		*flt_val |= FIELD_PREP(MSMON_CFG_MBWU_FLT_RWBW, ctx->opts);
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
+		break;
+	case mpam_feat_msmon_mbwu:
+		*ctl_val = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
+		*flt_val = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
+		break;
+	default:
+		return;
+	}
+}
+
+/* Remove values set by the hardware to prevent apparant mismatches. */
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
+		mpam_write_monsel_reg(msc, MBWU, 0);
+		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
+		break;
+	default:
+		return;
+	}
+}
+
+/* Call with MSC lock held */
+static void __ris_msmon_read(void *arg)
+{
+	u64 now;
+	bool nrdy = false;
+	struct mon_read *m = arg;
+	struct mon_cfg *ctx = m->ctx;
+	struct mpam_msc_ris *ris = m->ris;
+	struct mpam_props *rprops = &ris->props;
+	struct mpam_msc *msc = m->ris->vmsc->msc;
+	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
+
+	if (!mpam_mon_sel_inner_lock(msc)) {
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
+	if (cur_flt != flt_val || cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN))
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
+	mpam_mon_sel_inner_unlock(msc);
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
+	int err, idx;
+	struct mpam_msc *msc;
+	struct mpam_vmsc *vmsc;
+	struct mpam_msc_ris *ris;
+
+	idx = srcu_read_lock(&mpam_srcu);
+	list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {
+		msc = vmsc->msc;
+
+		mpam_mon_sel_outer_lock(msc);
+		list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
+			arg->ris = ris;
+
+			err = smp_call_function_any(&msc->accessibility,
+						    __ris_msmon_read, arg,
+						    true);
+			if (!err && arg->err)
+				err = arg->err;
+			if (err)
+				break;
+		}
+		mpam_mon_sel_outer_unlock(msc);
+		if (err)
+			break;
+	}
+	srcu_read_unlock(&mpam_srcu, idx);
+
+	return err;
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
+	memset(&arg, 0, sizeof(arg));
+	arg.ctx = ctx;
+	arg.type = type;
+	arg.val = val;
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
+		memset(&arg, 0, sizeof(arg));
+		arg.ctx = ctx;
+		arg.type = type;
+		arg.val = val;
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
index 4981de120869..76e406a2b0d1 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -309,6 +309,21 @@ struct mpam_msc_ris {
 	struct mpam_garbage	garbage;
 };
 
+/* The values for MSMON_CFG_MBWU_FLT.RWBW */
+enum mon_filter_options {
+	COUNT_BOTH	= 0,
+	COUNT_WRITE	= 1,
+	COUNT_READ	= 2,
+};
+
+struct mon_cfg {
+	u16                     mon;
+	u8                      pmg;
+	bool                    match_pmg;
+	u32                     partid;
+	enum mon_filter_options opts;
+};
+
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
 {
 	struct mpam_props *cprops = &class->props;
@@ -361,6 +376,9 @@ void mpam_disable(struct work_struct *work);
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg);
 
+int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
+		    enum mpam_device_features, u64 *val);
+
 int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
-- 
2.20.1


