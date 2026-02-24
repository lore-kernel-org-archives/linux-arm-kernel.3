Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4885F4BB6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPoF4pfrKoJ0ozBk5UwTXMgaonSWuvg2GGCzpu5RmYA=; b=npUxvTluHjKKAPZ1n3P57LymeZ
	nR61IlG6LmFmTajpm0+RYTKnY4a8MV48XzJ4ChNhDnFyWG1p6Yltgff4Izmb4Vca2tveiu3a0Qjt6
	sYMEfwBrhSJC9MNfOID1mc9cNGK7vpD8rvBn9LsCJOymB5DKH0OSeeIU1ivnKd3gWMCFFEDXsu/fm
	Wyzrr1KOnYI2e1guZX7gGoF24kjdqZyowEXFkPhYxHhTsg40rgVUf4xj1vj+8vvDOQnea3QbLr+ox
	4dZzuMBdvBdp12Z8wicdLXUKqFvmIuFWG6ANkzlPcGM6XDwxd0wsiHKD8Z5l8BlIlTmnyxlqvrhKm
	621wOjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgv-00000002YJj-3KH6;
	Tue, 24 Feb 2026 17:59:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgq-00000002Y8W-0BXX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 17:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tPoF4pfrKoJ0ozBk5UwTXMgaonSWuvg2GGCzpu5RmYA=; b=LQ7PRGjdzxWjAJCmZYAQIrDMai
	+0qCHMbNwCmNZXWqAAE+THyVI4vOKiKNzeqfgt1FAlYdtvESmQ9fcSU4HSx11nDRzK0l17UwOqNra
	ytL+YSdQchVFGx10iousGupaYujiGp4YJlRGqELTejI8VaIHa7Q13AZKubAW1as4/5bsbhanSZhx2
	LewvY//xS+zJzV82ilZiMVzYcZVMPZONKhxsFB4F/lrep9y7qY6Z8AGqB2J2vswlVYQMRY91dqof0
	0pNiIV1SnFbg5NG/MNhmr+yGlmteOqGNAGuXwoeyMd4SsGgUki9ZmxtAevA1iSyoaxZy4AAedwGyw
	k/ByAAUg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgi-00000007dpq-0wIx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:59:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F403165C;
	Tue, 24 Feb 2026 09:59:04 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C25F13F59E;
	Tue, 24 Feb 2026 09:59:05 -0800 (PST)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Dave Martin <Dave.Martin@arm.com>
Subject: [PATCH v5 19/41] arm_mpam: resctrl: Add CDP emulation
Date: Tue, 24 Feb 2026 17:56:58 +0000
Message-ID: <20260224175720.2663924-20-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175913_550247_208FE542 
X-CRM114-Status: GOOD (  28.10  )
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

Intel RDT's CDP feature allows the cache to use a different control value
depending on whether the accesses was for instruction fetch or a data
access. MPAM's equivalent feature is the other way up: the CPU assigns a
different partid label to traffic depending on whether it was instruction
fetch or a data access, which causes the cache to use a different control
value based solely on the partid.

MPAM can emulate CDP, with the side effect that the alternative partid is
seen by all MSC, it can't be enabled per-MSC.

Add the resctrl hooks to turn this on or off. Add the helpers that match a
closid against a task, which need to be aware that the value written to
hardware is not the same as the one resctrl is using.

Update the 'arm64_mpam_global_default' variable the arch code uses during
context switch to know when the per-cpu value should be used instead. Also,
update these per-cpu values and sync the resulting mpam partid/pmg
configuration to hardware.

resctrl can enable CDP for L2 caches, L3 caches or both. When it is enabled
by one and not the other MPAM globally enabled CDP but hides the effect
on the other cache resource. This hiding is possible as CPOR is the only
supported cache control and that uses a resource bitmap; two partids with
the same bitmap act as one.

Awkwardly, the MB controls don't implement CDP and CDP can't be hidden as
the memory bandwidth control is a maximum per partid which can't be
modelled with more partids. If the total maximum is used for both the data
and instruction partids then then the maximum may be exceeded and if it is
split in two then the one using more bandwidth will hit a lower
limit. Hence, hide the MB controls completely if CDP is enabled for any
resource.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
CC: Dave Martin <Dave.Martin@arm.com>
CC: Amit Singh Tomar <amitsinght@marvell.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Fail cdp initialisation if there is only one partid
Correct data/code confusion

Changes since v2:
Don't include unused header

Changes since v3:
Update the per-cpu values and sync to h/w

Changes since v4:
Enable separately for L2 and L3
Disable MB controls if CDP enabled
Consider cdp hiding in resctrl_arch_update_one()
---
 arch/arm64/include/asm/mpam.h   |   1 +
 drivers/resctrl/mpam_internal.h |   1 +
 drivers/resctrl/mpam_resctrl.c  | 119 ++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h        |   2 +
 4 files changed, 123 insertions(+)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index 05aa71200f61..70d396e7b6da 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -4,6 +4,7 @@
 #ifndef __ASM__MPAM_H
 #define __ASM__MPAM_H
 
+#include <linux/arm_mpam.h>
 #include <linux/bitfield.h>
 #include <linux/jump_label.h>
 #include <linux/percpu.h>
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e2704f678af5..57c3d9b962b9 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -346,6 +346,7 @@ struct mpam_resctrl_dom {
 struct mpam_resctrl_res {
 	struct mpam_class	*class;
 	struct rdt_resource	resctrl_res;
+	bool			cdp_enabled;
 };
 
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5551e5416620..fa818ee5db18 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -35,6 +35,10 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
 static DEFINE_MUTEX(domain_list_lock);
 
+/*
+ * MPAM emulates CDP by setting different PARTID in the I/D fields of MPAM0_EL1.
+ * This applies globally to all traffic the CPU generates.
+ */
 static bool cdp_enabled;
 
 bool resctrl_arch_alloc_capable(void)
@@ -50,6 +54,71 @@ bool resctrl_arch_alloc_capable(void)
 	return false;
 }
 
+bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
+{
+	return mpam_resctrl_controls[rid].cdp_enabled;
+}
+
+/**
+ * resctrl_reset_task_closids() - Reset the PARTID/PMG values for all tasks.
+ *
+ * At boot, all existing tasks use partid zero for D and I.
+ * To enable/disable CDP emulation, all these tasks need relabelling.
+ */
+static void resctrl_reset_task_closids(void)
+{
+	struct task_struct *p, *t;
+
+	read_lock(&tasklist_lock);
+	for_each_process_thread(p, t) {
+		resctrl_arch_set_closid_rmid(t, RESCTRL_RESERVED_CLOSID,
+					     RESCTRL_RESERVED_RMID);
+	}
+	read_unlock(&tasklist_lock);
+}
+
+int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
+{
+	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
+	int cpu;
+
+	/* This resctrl hook is only called with enable set to false on error */
+	cdp_enabled = enable;
+	mpam_resctrl_controls[rid].cdp_enabled = enable;
+
+	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
+	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
+		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
+
+	if (mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled &&
+	    mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
+		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
+
+	if (enable) {
+		if (mpam_partid_max < 1)
+			return -EINVAL;
+
+		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
+		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
+	}
+
+	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
+	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
+
+	resctrl_reset_task_closids();
+
+	for_each_possible_cpu(cpu)
+		mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
+	on_each_cpu(resctrl_arch_sync_cpu_closid_rmid, NULL, 1);
+
+	return 0;
+}
+
+static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
+{
+	return cdp_enabled && !resctrl_arch_get_cdp_enabled(rid);
+}
+
 /*
  * MSC may raise an error interrupt if it sees an out or range partid/pmg,
  * and go on to truncate the value. Regardless of what the hardware supports,
@@ -115,6 +184,30 @@ void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 	}
 }
 
+bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
+{
+	u64 regval = mpam_get_regval(tsk);
+	u32 tsk_closid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
+
+	if (cdp_enabled)
+		tsk_closid >>= 1;
+
+	return tsk_closid == closid;
+}
+
+/* The task's pmg is not unique, the partid must be considered too */
+bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
+{
+	u64 regval = mpam_get_regval(tsk);
+	u32 tsk_closid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
+	u32 tsk_rmid = FIELD_GET(MPAM0_EL1_PMG_D, regval);
+
+	if (cdp_enabled)
+		tsk_closid >>= 1;
+
+	return (tsk_closid == closid) && (tsk_rmid == rmid);
+}
+
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 {
 	if (l >= RDT_NUM_RESOURCES)
@@ -245,6 +338,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
+	/*
+	 * When CDP is enabled, but the resource doesn't support it,
+	 * the control is cloned across both partids.
+	 * Pick one at random to read:
+	 */
+	if (mpam_resctrl_hide_cdp(r->rid))
+		type = CDP_DATA;
+
 	partid = resctrl_get_config_index(closid, type);
 	cfg = &dom->ctrl_comp->cfg[partid];
 
@@ -272,6 +373,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
+	int err;
 	u32 partid;
 	struct mpam_config cfg;
 	struct mpam_props *cprops;
@@ -289,6 +391,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
+	if (mpam_resctrl_hide_cdp(r->rid))
+		t = CDP_DATA;
+
 	partid = resctrl_get_config_index(closid, t);
 	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r)) {
 		pr_debug("Not alloc capable or computed PARTID out of range\n");
@@ -311,6 +416,20 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return -EINVAL;
 	}
 
+	/*
+	 * When CDP is enabled, but the resource doesn't support it, we need to
+	 * apply the same configuration to the other partid.
+	 */
+	if (mpam_resctrl_hide_cdp(r->rid)) {
+		partid = resctrl_get_config_index(closid, CDP_CODE);
+		err = mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+		if (err)
+			return err;
+
+		partid = resctrl_get_config_index(closid, CDP_DATA);
+		return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+	}
+
 	return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
 }
 
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 5a78299ec464..d329b1dc148b 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -56,6 +56,8 @@ void resctrl_arch_set_cpu_default_closid(int cpu, u32 closid);
 void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
 void resctrl_arch_sched_in(struct task_struct *tsk);
+bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
+bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
-- 
2.43.0


