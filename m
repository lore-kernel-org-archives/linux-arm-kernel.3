Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79FA105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd4dJh0IITSAEGp2NDoLdgntbPLTaNGVP+DG53wVqf8=; b=E4oLygPvQXR8SFN+czuqI3V4ty
	DNFkDIeTWgNDXEq+m4ZbB5VxDyoyYIOVL2F0/q7L42tRdil4EsaixbOsw77PC23+Td+RqSObEYdOC
	TMHewxFsa1Dc3JPCLFv5V0EMPOXOdftfGqCTSBiKfDIthWoI1UACQAAS5PAvXTAuvACdtULtWfOpV
	qkNVpJwBVyXi58nn+KlIj+90uSAsJB+qz/p+ETHUmzsOBZjx6XDnfWwqlwlJ+oRKuSakV+3a75sfD
	w/Kok4SQKZ0ZR5F7MUeHIQGavAbTO4JMS4VyIG6PYqITRomU7XMEW7KSOqc86D+4B06eoX/7Hcyze
	bj9FcOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13p1-00000000Saa-1wy2;
	Fri, 13 Mar 2026 14:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13ox-00000000SUP-0oqn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pd4dJh0IITSAEGp2NDoLdgntbPLTaNGVP+DG53wVqf8=; b=dC0khHlchxlcRkCH2PwK2msmzp
	GcTJvfKg8mbM1PDyC+cuDU4mY6p3H8xsWv/1DYQmFLjfpxDve6xkopbLI4NButG67qrjYHCIRKT1Y
	bam+jDxdgVgfUYR7mb7WDSk2Ra7etCV0Cwzfg8P+ujjPwXjlRwimykpMDaEZ/ekOcBAQTxuw9LBmd
	bDhH7fi3ZcpXLn8HGhGtc9pZ4CvbIE/eQb+PVa0ix6kx5GwtY94LOP7N6t+7Z7zrvUCSzfZR6Cpul
	VDHV/G4EHyXDSNT8j7CbVDBeiyKO6FYwiqssY20s/Y2Bqhpkt8MDTgFUResfU1Htrvcy+XpNWUKQS
	XLJToHcA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13om-00000003aBc-1yQQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:48:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D043824C0;
	Fri, 13 Mar 2026 07:48:40 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DDC83F7BD;
	Fri, 13 Mar 2026 07:48:42 -0700 (PDT)
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
Subject: [PATCH v6 32/40] arm_mpam: resctrl: Add empty definitions for assorted resctrl functions
Date: Fri, 13 Mar 2026 14:46:09 +0000
Message-ID: <20260313144617.3420416-33-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_144848_891181_B292554C 
X-CRM114-Status: GOOD (  11.42  )
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

A few resctrl features and hooks need to be provided, but aren't needed or
supported on MPAM platforms.

resctrl has individual hooks to separately enable and disable the
closid/partid and rmid/pmg context switching code. For MPAM this is all the
same thing, as the value in struct task_struct is used to cache the value
that should be written to hardware. arm64's context switching code is
enabled once MPAM is usable, but doesn't touch the hardware unless the
value has changed.

For now event configuration is not supported, and can be turned off by
returning 'false' from resctrl_arch_is_evt_configurable().

The new io_alloc feature is not supported either, always return false from
the enable helper to indicate and fail the enable.

Add this, and empty definitions for the other hooks.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Add resctrl_arch_pre_mount() {}
resctrl_arch_reset_rmid_all() signature update
add stubs for abmc
keep empty definitions together

Changes since v5:
Add resctrl_arch_reset_rmid() since mbwu will always use abmc
---
 drivers/resctrl/mpam_resctrl.c | 65 ++++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |  9 +++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 3979808f7253..0db147271b0c 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -91,6 +91,71 @@ bool resctrl_arch_mon_capable(void)
 	return l3->mon_capable;
 }
 
+bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
+{
+	return false;
+}
+
+void resctrl_arch_mon_event_config_read(void *info)
+{
+}
+
+void resctrl_arch_mon_event_config_write(void *info)
+{
+}
+
+void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
+{
+}
+
+void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			     u32 closid, u32 rmid, enum resctrl_event_id eventid)
+{
+}
+
+void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			     u32 closid, u32 rmid, int cntr_id,
+			     enum resctrl_event_id eventid)
+{
+}
+
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			      u32 cntr_id, bool assign)
+{
+}
+
+int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
+			   u32 unused, u32 rmid, int cntr_id,
+			   enum resctrl_event_id eventid, u64 *val)
+{
+	return -EOPNOTSUPP;
+}
+
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
+{
+	return false;
+}
+
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
+{
+	return -EINVAL;
+}
+
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
+{
+	return -EOPNOTSUPP;
+}
+
+bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
+{
+	return false;
+}
+
+void resctrl_arch_pre_mount(void)
+{
+}
+
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 {
 	return mpam_resctrl_controls[rid].cdp_enabled;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 86d5e326d2bd..f92a36187a52 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -67,6 +67,15 @@ struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
 void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
 
+/*
+ * The CPU configuration for MPAM is cheap to write, and is only written if it
+ * has changed. No need for fine grained enables.
+ */
+static inline void resctrl_arch_enable_mon(void) { }
+static inline void resctrl_arch_disable_mon(void) { }
+static inline void resctrl_arch_enable_alloc(void) { }
+static inline void resctrl_arch_disable_alloc(void) { }
+
 static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
 {
 	return val;
-- 
2.43.0


