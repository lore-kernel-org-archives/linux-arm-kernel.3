Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914E3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fnq1kmBrTXxNgRbwhVNgfHY8TX/oUmOgRHDAM3AaE5M=; b=LdJpPUZ6T3blLTOIeXi0Wh/TOJ
	kwUt6lmR0BLh2tXWS7EQ3J89Cw1+tsp14RFw3aMmfZX7d897mROLzzzftry/Txv2N8kUXREZRq98v
	ajEkSF+m74I1RapokTr5a6+S94V/HDDOUBKQvqQnKvsavbAI+b0437Wg03vBKSF7fdBCcschPEVKU
	8J1cHAilMVmsevJVYJMQIliJCRX7VJoslcek73eWL+qqIpEI8L3b6FIjsA5OQFEsIODXYZCkY9Cn5
	rQWvR3qTTw9/lhQCAQi9Xy5roM4uH2hG1Tv8jzpCEENJ40ktb365JF8uqQGaSlKTkgYYEFZhkzFJh
	IJYXLvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploY-00000004f57-1HXF;
	Sat, 23 Aug 2025 10:49:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmD-0000000323v-3rtU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:34:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32CCE27B5;
	Fri, 22 Aug 2025 08:33:53 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26AD63F63F;
	Fri, 22 Aug 2025 08:33:56 -0700 (PDT)
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
Subject: [PATCH 31/33] arm_mpam: Add helper to reset saved mbwu state
Date: Fri, 22 Aug 2025 15:30:12 +0000
Message-Id: <20250822153048.2287-32-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_083402_037822_ABDB6C59 
X-CRM114-Status: GOOD (  19.12  )
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

resctrl expects to reset the bandwidth counters when the filesystem
is mounted.

To allow this, add a helper that clears the saved mbwu state. Instead
of cross calling to each CPU that can access the component MSC to
write to the counter, set a flag that causes it to be zero'd on the
the next read. This is easily done by forcing a configuration update.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 49 +++++++++++++++++++++++++++++++--
 drivers/resctrl/mpam_internal.h |  5 +++-
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 8fbcf6eb946a..65c30ebfe001 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1155,9 +1155,11 @@ static u64 mpam_msmon_overflow_val(struct mpam_msc_ris *ris)
 static void __ris_msmon_read(void *arg)
 {
 	bool nrdy = false;
+	bool config_mismatch;
 	struct mon_read *m = arg;
 	u64 now, overflow_val = 0;
 	struct mon_cfg *ctx = m->ctx;
+	bool reset_on_next_read = false;
 	struct mpam_msc_ris *ris = m->ris;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_props *rprops = &ris->props;
@@ -1172,6 +1174,14 @@ static void __ris_msmon_read(void *arg)
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
 
+	if (m->type == mpam_feat_msmon_mbwu) {
+		mbwu_state = &ris->mbwu_state[ctx->mon];
+		if (mbwu_state) {
+			reset_on_next_read = mbwu_state->reset_on_next_read;
+			mbwu_state->reset_on_next_read = false;
+		}
+	}
+
 	/*
 	 * Read the existing configuration to avoid re-writing the same values.
 	 * This saves waiting for 'nrdy' on subsequent reads.
@@ -1179,7 +1189,10 @@ static void __ris_msmon_read(void *arg)
 	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
 	clean_msmon_ctl_val(&cur_ctl);
 	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
-	if (cur_flt != flt_val || cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN))
+	config_mismatch = cur_flt != flt_val ||
+			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
+
+	if (config_mismatch || reset_on_next_read)
 		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
 
 	switch (m->type) {
@@ -1212,7 +1225,6 @@ static void __ris_msmon_read(void *arg)
 		if (nrdy)
 			break;
 
-		mbwu_state = &ris->mbwu_state[ctx->mon];
 		if (!mbwu_state)
 			break;
 
@@ -1314,6 +1326,39 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 	return err;
 }
 
+void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
+{
+	int idx;
+	struct mpam_msc *msc;
+	struct mpam_vmsc *vmsc;
+	struct mpam_msc_ris *ris;
+
+	if (!mpam_is_enabled())
+		return;
+
+	idx = srcu_read_lock(&mpam_srcu);
+	list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {
+		if (!mpam_has_feature(mpam_feat_msmon_mbwu, &vmsc->props))
+			continue;
+
+		msc = vmsc->msc;
+		mpam_mon_sel_outer_lock(msc);
+		list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
+			if (!mpam_has_feature(mpam_feat_msmon_mbwu, &ris->props))
+				continue;
+
+			if (WARN_ON_ONCE(!mpam_mon_sel_inner_lock(msc)))
+				continue;
+
+			ris->mbwu_state[ctx->mon].correction = 0;
+			ris->mbwu_state[ctx->mon].reset_on_next_read = true;
+			mpam_mon_sel_inner_unlock(msc);
+		}
+		mpam_mon_sel_outer_unlock(msc);
+	}
+	srcu_read_unlock(&mpam_srcu, idx);
+}
+
 static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
 {
 	u32 num_words, msb;
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 9f627b5f72a1..bbf0306abc82 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -297,10 +297,12 @@ struct mon_cfg {
 
 /*
  * Changes to enabled and cfg are protected by the msc->lock.
- * Changes to prev_val and correction are protected by the msc's mon_sel_lock.
+ * Changes to reset_on_next_read, prev_val and correction are protected by the
+ * msc's mon_sel_lock.
  */
 struct msmon_mbwu_state {
 	bool		enabled;
+	bool		reset_on_next_read;
 	struct mon_cfg	cfg;
 
 	/* The value last read from the hardware. Used to detect overflow. */
@@ -410,6 +412,7 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 
 int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
+void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 
 int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 				   cpumask_t *affinity);
-- 
2.20.1


