Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4205FE8B369
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qexGLFHqX9ozUfa1fb61BCDcK4S7fTzR4ZTgsYIhbmg=; b=jS6ZX8lCQ/cDMxvxaVFTya6Wjc
	+ksiZqoDVOJC+AqGV+VBSO5WojGgUWbGQJhisJgz8Zcq2Xpt2Tv0LyvICHd6WqEbetsdQTol9h+YQ
	VLFXql9ZyUAVmmi+jACa6O6uRU8i3LzDZiUcgQXzQv2jUIIPYZl9xsvU9jHA4d0jjHT3pqN+0isqO
	VIGtEPusbqfGTKAcab/v7zqtAI2AX2dByLUZ7+p/etnrWrvUF0kaBKh5Srmmu/Vl4psoWPv8l7Kco
	pNnnE7TV7KPjMRCFwYWDU07D0E5JrRYRKTKrpBaWfhkUR1khv55iyIJY2y+DdJWjKwAiZ6Www7sfu
	YRZXQmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnODh-00000007PZp-2Mqk;
	Tue, 03 Feb 2026 21:46:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnODd-00000007PVD-440e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4F76497;
	Tue,  3 Feb 2026 13:45:50 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 982393F778;
	Tue,  3 Feb 2026 13:45:51 -0800 (PST)
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
Subject: [PATCH v4 20/41] arm_mpam: resctrl: Add CDP emulation
Date: Tue,  3 Feb 2026 21:43:21 +0000
Message-ID: <20260203214342.584712-21-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_134558_106677_80B16DFC 
X-CRM114-Status: GOOD (  24.42  )
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

Awkwardly, the MB controls don't implement CDP. To emulate this, the MPAM
equivalent needs programming twice by the resctrl glue, as resctrl expects
the bandwidth controls to be applied independently for both data and
instruction-fetch.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
CC: Dave Martin <Dave.Martin@arm.com>
CC: Amit Singh Tomar <amitsinght@marvell.com>
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
---
 arch/arm64/include/asm/mpam.h  |   1 +
 drivers/resctrl/mpam_resctrl.c | 117 +++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |   2 +
 3 files changed, 120 insertions(+)

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
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index cd52ca279651..12017264530a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -38,6 +38,10 @@ static DEFINE_MUTEX(domain_list_lock);
 static bool exposed_alloc_capable;
 static bool exposed_mon_capable;
 
+/*
+ * MPAM emulates CDP by setting different PARTID in the I/D fields of MPAM0_EL1.
+ * This applies globally to all traffic the CPU generates.
+ */
 static bool cdp_enabled;
 
 bool resctrl_arch_alloc_capable(void)
@@ -50,6 +54,72 @@ bool resctrl_arch_mon_capable(void)
 	return exposed_mon_capable;
 }
 
+bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
+{
+	switch (rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		return cdp_enabled;
+	case RDT_RESOURCE_MBA:
+	default:
+		/*
+		 * x86's MBA control doesn't support CDP, so user-space doesn't
+		 * expect it.
+		 */
+		return false;
+	}
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
+int resctrl_arch_set_cdp_enabled(enum resctrl_res_level ignored, bool enable)
+{
+	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
+	int cpu;
+
+	cdp_enabled = enable;
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
@@ -115,6 +185,30 @@ void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
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
@@ -246,6 +340,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
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
 
@@ -273,6 +375,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
+	int err;
 	u32 partid;
 	struct mpam_config cfg;
 	struct mpam_props *cprops;
@@ -312,6 +415,20 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
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


