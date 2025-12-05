Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B899D374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYu1421JPjYdkkjwFDrZABhO4BBeAn+YN5n486JNWB8=; b=Use84pI1LgdIGOKkrWmfKC+J/S
	DphZlOpvT5EKYArHzTPyGkx7j9PYU1BCIByXK2blAwoyHDYWP003u+iomL3LFwWHCFFTbdIhTDnV5
	jNG1uKnryobii8UJhkMcG+enUBv2NE5R5ol1c9TtHKsbW1OZMVrOBIvU8IqOQofFJPGkxuY8clmT/
	NgBUQtb1xeMi8ahNg/VinXLBhs45K6jEJ6YmXIl0QEREjMv4g8OCYQClgu4/yOD3kBVR87e0C7MTD
	zeHTwEUFSydGRr1Xuaeda0tJ5Dx3PrZfI3LLXxbGDjlrmX4i5NACgcUyf7mjW7neIWRrq2v4ijPUj
	52uivKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqj-0000000A5UM-23qc;
	Fri, 05 Dec 2025 22:00:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqg-0000000A5Q7-1ayH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:00:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA5E1BA8;
	Fri,  5 Dec 2025 14:00:13 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347833F7BD;
	Fri,  5 Dec 2025 14:00:17 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
	Dave Martin <Dave.Martin@arm.com>
Subject: [RFC PATCH 13/38] arm_mpam: resctrl: Add CDP emulation
Date: Fri,  5 Dec 2025 21:58:36 +0000
Message-Id: <20251205215901.17772-14-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140022_507309_FB3DA0D8 
X-CRM114-Status: GOOD (  25.08  )
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

Intel RDT's CDP feature allows the cache to use a different control value
depending on whether the accesses was for instruction fetch or a data
access. MPAM's equivalent feature is the other way up: the CPU assigns a
different partid label to traffic depending on whether it was instruction
fetch or a data access, which causes the cache to use a different control
value based solely on the partid.

MPAM can emulate CDP, with the side effect that the alternative partid is
seen by all MSC, it can't be enabled per-MSC.

Add the resctrl hooks to turn this on or off. Add the helpers that
match a closid against a task, which need to be aware that the value
written to hardware is not the same as the one resctrl is using.

Update the 'arm64_mpam_global_default' variable the arch code uses
during context switch to know when the per-cpu value should be used
instead.

Awkwardly, the MB controls don't implement CDP. To emulate this, the
MPAM equivalent needs programming twice by the resctrl glue, as
resctrl expects the bandwidth controls to be applied independently for
both data and isntruction-fetch.

CC: Dave Martin <Dave.Martin@arm.com>
CC: Ben Horgan <ben.horgan@arm.com>
CC: Amit Singh Tomar <amitsinght@marvell.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/include/asm/mpam.h  |   1 +
 drivers/resctrl/mpam_resctrl.c | 115 ++++++++++++++++++++++++++++++++-
 include/linux/arm_mpam.h       |   3 +
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index 2960ffaf6574..689285c4c61f 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -4,6 +4,7 @@
 #ifndef __ASM__MPAM_H
 #define __ASM__MPAM_H
 
+#include <linux/arm_mpam.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
 #include <linux/init.h>
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index c2650abb99ec..d5f75ed67e46 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -33,6 +33,10 @@ static DEFINE_MUTEX(domain_list_lock);
 static bool exposed_alloc_capable;
 static bool exposed_mon_capable;
 
+/*
+ * MPAM emulates CDP by setting different PARTID in the I/D fields of MPAM0_EL1.
+ * This applies globally to all traffic the CPU generates.
+ */
 static bool cdp_enabled;
 
 bool resctrl_arch_alloc_capable(void)
@@ -45,6 +49,67 @@ bool resctrl_arch_mon_capable(void)
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
+	u32 partid_i, partid_d;
+
+	cdp_enabled = enable;
+	partid_i = partid_d = RESCTRL_RESERVED_CLOSID;
+
+	if (enable) {
+		u32 partid = RESCTRL_RESERVED_CLOSID;
+
+		partid_d = resctrl_get_config_index(partid, CDP_CODE);
+		partid_i = resctrl_get_config_index(partid, CDP_DATA);
+	}
+
+	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
+	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
+
+	resctrl_reset_task_closids();
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
@@ -110,6 +175,30 @@ void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
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
@@ -245,6 +334,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
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
 
@@ -272,6 +369,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
+	int err;
 	u32 partid;
 	struct mpam_config cfg;
 	struct mpam_props *cprops;
@@ -311,7 +409,22 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return -EINVAL;
 	}
 
-	return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
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
+
+	} else {
+		return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+	}
 }
 
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 5a78299ec464..ba0312b55d9f 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -5,6 +5,7 @@
 #define __LINUX_ARM_MPAM_H
 
 #include <linux/acpi.h>
+#include <linux/resctrl_types.h>
 #include <linux/types.h>
 
 struct mpam_msc;
@@ -56,6 +57,8 @@ void resctrl_arch_set_cpu_default_closid(int cpu, u32 closid);
 void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
 void resctrl_arch_sched_in(struct task_struct *tsk);
+bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
+bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
-- 
2.39.5


