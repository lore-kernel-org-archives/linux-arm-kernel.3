Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B9105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQssV9erKqEwLaBm3RNmViG8WPTX5hWX3lj2p7GD2gg=; b=BRe+B61LZoE0WHcUBTSg4qWPr/
	huCKVjT+nJEe68HyOqOAbKdqV/kbSFz7XY38SHecUzPIk5KjH8sQ0OQDCwBhVkfkrFik2nYbvUkh+
	IzoWRgHR514az5wTTklsiwoblFzlNJkEZ9AZSQrKVAlN/zGlvjJh3w5QG9GELvFFPgC0BC/LE101V
	8HBfi0czSJm45SuRfXI5/VetkPZE0bOI2IOqtCAknKGefCwkssQ9EzKsDJwaM3yHLdPCJHQMei/5K
	XFnkb/8gDYMZJTC8+378mKTbqwwjpfWCokD22sKZ0OlsAGJ05blY5mzNqH9AA4mkwyluscU1SUgLp
	76Qc8lvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13on-00000000SKx-3vTw;
	Fri, 13 Mar 2026 14:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13oj-00000000SE1-1UhB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nQssV9erKqEwLaBm3RNmViG8WPTX5hWX3lj2p7GD2gg=; b=Dky5+EBZqXm9lNlxJbQceZU9fV
	JUGXfUgO6OXARO5hguGlE8v2ueZmdzv7r7sdlTl7rIgV9roDmCaytgg3DCr8KolBfk2uV6nrAXysP
	2+PcZ5n/tP3f19gIYdiIk51qkj9DD9HUE/BYph4oNKYIVQGM7Gsqu2nvT5YQ80IdCudn98iKTHUd8
	HMjS6ZG/orPxCdnTNoCzjWdEytPpbrzEOx08TVKy7Dbu/0ZyAugwhnfMAhOvcaTGiJrSaqrn3XW5Z
	3uIjrAPjuN8CmEDpAAiv9xYdbfoxJ1qh7oToXKTQp052USEUE3ZsEwbcmfWyrQQ5sRQrH2G5nN77i
	Xycd4Ebg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13oe-00000003a8n-3Zg0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D133244B;
	Fri, 13 Mar 2026 07:48:32 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D15D3F7BD;
	Fri, 13 Mar 2026 07:48:34 -0700 (PDT)
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
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v6 30/40] arm_mpam: resctrl: Add resctrl_arch_rmid_read()
Date: Fri, 13 Mar 2026 14:46:07 +0000
Message-ID: <20260313144617.3420416-31-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_144842_394335_474F7C57 
X-CRM114-Status: GOOD (  13.63  )
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
the counter may need reading in three different ways.

The helpers behind the resctrl_arch_ functions will be re-used for the ABMC
equivalent functions.

Add the rounding helper for checking monitor values while we're here.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
cfg initialisation style
code flow at end of read_mon_cdp_safe()

Changes since v2:
Whitespace changes

Changes since v3:
Update function signatures
Remove abmc check

Changes since v5:
don't read mbwu
remove reset code as only needed for mbwu
---
 drivers/resctrl/mpam_resctrl.c | 82 ++++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |  5 +++
 2 files changed, 87 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 383f67948a82..4f6a53d1bd4f 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -356,6 +356,88 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
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
+/* MBWU when not in ABMC mode (not supported), and CSU counters. */
+int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
+			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
+			   void *arch_priv, u64 *val, void *arch_mon_ctx)
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
+	l3_dom = container_of(hdr, struct mpam_resctrl_dom, resctrl_mon_dom.hdr);
+	mon_comp = l3_dom->mon_comp[eventid];
+
+	if (eventid != QOS_L3_OCCUP_EVENT_ID)
+		return -EINVAL;
+
+	mon_type = mpam_feat_msmon_csu;
+
+	return read_mon_cdp_safe(mon, mon_comp, mon_type, mon_idx,
+				 closid, rmid, val);
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


