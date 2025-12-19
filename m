Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D4FD7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDFyLZv0Qv0pg4FCJwQhBFTsQSTTESwHWHLVoINM/d8=; b=e9DEuI69KyELwHvmScKtOSVpzv
	NJlvPBM6NF6QcmtPm8MNPwxnjHc0uPo+tTQ1TiHfjK0AUHM25inwwN6Xx9cJ+46pnIEhnjJCdnIuP
	7Smk6bIsabuzgtcrZ+4CJHxDTBC8Hc73YcT7ayaZ6IKYV1mKt3d3I2SnHgSDRn2+dgkFCBqFHTKfd
	+5X8L1RuXY0F927bTRgDkwb2HulS3Y3pf0lGuQHuqn1FTBoe/gt5UmhGztR72FnuRVsUem0Nug7AS
	Cnb5TaNV4zwLhEoXoy7Yw22y51NJYOkdZTIYdjh841fvQe1I9UyE/w05CszHAxTZxWxQm33lc91Vy
	I4N3XPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeyj-0000000Alt9-2Eu7;
	Fri, 19 Dec 2025 18:13:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeyZ-0000000AlhZ-0Czb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:13:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 874A5106F;
	Fri, 19 Dec 2025 10:13:06 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3605B3F5CA;
	Fri, 19 Dec 2025 10:13:09 -0800 (PST)
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
	kvmarm@lists.linux.dev
Subject: [PATCH v2 15/45] arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation
Date: Fri, 19 Dec 2025 18:11:17 +0000
Message-ID: <20251219181147.3404071-16-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101315_225566_7CB60467 
X-CRM114-Status: GOOD (  32.62  )
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

resctrl has its own data structures to describe its resources. We can't use
these directly as we play tricks with the 'MBA' resource, picking the MPAM
controls or monitors that best apply. We may export the same component as
both L3 and MBA.

Add mpam_resctrl_exports[] as the array of class->resctrl mappings we are
exporting, and add the cpuhp hooks that allocated and free the resctrl
domain structures.

While we're here, plumb in a few other obvious things.

CONFIG_ARM_CPU_RESCTRL is used to allow this code to be built even though
it can't yet be linked against resctrl.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Domain list is an rcu list
Add synchronize_rcu() to free the deleted element
Code flow simplification (Jonathan)
---
 drivers/resctrl/Makefile        |   1 +
 drivers/resctrl/mpam_devices.c  |  12 ++
 drivers/resctrl/mpam_internal.h |  22 +++
 drivers/resctrl/mpam_resctrl.c  | 329 ++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h        |   3 +
 5 files changed, 367 insertions(+)
 create mode 100644 drivers/resctrl/mpam_resctrl.c

diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 898199dcf80d..40beaf999582 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
 mpam-y						+= mpam_devices.o
+mpam-$(CONFIG_ARM_CPU_RESCTRL)			+= mpam_resctrl.o
 
 ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 860181266b15..303aacfcb9d6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1628,6 +1628,9 @@ static int mpam_cpu_online(unsigned int cpu)
 			mpam_reprogram_msc(msc);
 	}
 
+	if (mpam_is_enabled())
+		mpam_resctrl_online_cpu(cpu);
+
 	return 0;
 }
 
@@ -1671,6 +1674,9 @@ static int mpam_cpu_offline(unsigned int cpu)
 {
 	struct mpam_msc *msc;
 
+	if (mpam_is_enabled())
+		mpam_resctrl_offline_cpu(cpu);
+
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
@@ -2517,6 +2523,12 @@ static void mpam_enable_once(void)
 	mutex_unlock(&mpam_list_lock);
 	cpus_read_unlock();
 
+	if (!err) {
+		err = mpam_resctrl_setup();
+		if (err)
+			pr_err("Failed to initialise resctrl: %d\n", err);
+	}
+
 	if (err) {
 		mpam_disable_reason = "Failed to enable.";
 		schedule_work(&mpam_broken_work);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e6e7ba4342d6..554e4887ba81 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -12,6 +12,7 @@
 #include <linux/jump_label.h>
 #include <linux/llist.h>
 #include <linux/mutex.h>
+#include <linux/resctrl.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
 #include <linux/types.h>
@@ -333,6 +334,17 @@ struct mpam_msc_ris {
 	struct mpam_garbage	garbage;
 };
 
+struct mpam_resctrl_dom {
+	struct mpam_component	*ctrl_comp;
+	struct rdt_ctrl_domain	resctrl_ctrl_dom;
+	struct rdt_mon_domain	resctrl_mon_dom;
+};
+
+struct mpam_resctrl_res {
+	struct mpam_class	*class;
+	struct rdt_resource	resctrl_res;
+};
+
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
 {
 	struct mpam_props *cprops = &class->props;
@@ -387,6 +399,16 @@ void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
+#ifdef CONFIG_RESCTRL_FS
+int mpam_resctrl_setup(void);
+int mpam_resctrl_online_cpu(unsigned int cpu);
+void mpam_resctrl_offline_cpu(unsigned int cpu);
+#else
+static inline int mpam_resctrl_setup(void) { return 0; }
+static inline int mpam_resctrl_online_cpu(unsigned int cpu) { return 0; }
+static inline void mpam_resctrl_offline_cpu(unsigned int cpu) { }
+#endif /* CONFIG_RESCTRL_FS */
+
 /*
  * MPAM MSCs have the following register layout. See:
  * Arm Memory System Resource Partitioning and Monitoring (MPAM) System
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
new file mode 100644
index 000000000000..4beeeded00ff
--- /dev/null
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Arm Ltd.
+
+#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
+
+#include <linux/arm_mpam.h>
+#include <linux/cacheinfo.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/errno.h>
+#include <linux/list.h>
+#include <linux/printk.h>
+#include <linux/rculist.h>
+#include <linux/resctrl.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <asm/mpam.h>
+
+#include "mpam_internal.h"
+
+/*
+ * The classes we've picked to map to resctrl resources, wrapped
+ * in with their resctrl structure.
+ * Class pointer may be NULL.
+ */
+static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
+
+/* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
+static DEFINE_MUTEX(domain_list_lock);
+
+static bool exposed_alloc_capable;
+static bool exposed_mon_capable;
+
+bool resctrl_arch_alloc_capable(void)
+{
+	return exposed_alloc_capable;
+}
+
+bool resctrl_arch_mon_capable(void)
+{
+	return exposed_mon_capable;
+}
+
+/*
+ * MSC may raise an error interrupt if it sees an out or range partid/pmg,
+ * and go on to truncate the value. Regardless of what the hardware supports,
+ * only the system wide safe value is safe to use.
+ */
+u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
+{
+	return mpam_partid_max + 1;
+}
+
+struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
+{
+	if (l >= RDT_NUM_RESOURCES)
+		return NULL;
+
+	return &mpam_resctrl_controls[l].resctrl_res;
+}
+
+static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
+				     enum resctrl_res_level type)
+{
+	/* TODO: initialise the resctrl resources */
+
+	return 0;
+}
+
+static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
+{
+	struct mpam_class *class = comp->class;
+
+	if (class->type == MPAM_CLASS_CACHE)
+		return comp->comp_id;
+
+	/* TODO: repaint domain ids to match the L3 domain ids */
+	/*
+	 * Otherwise, expose the ID used by the firmware table code.
+	 */
+	return comp->comp_id;
+}
+
+static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
+					 struct rdt_domain_hdr *hdr)
+{
+	lockdep_assert_cpus_held();
+
+	INIT_LIST_HEAD(&hdr->list);
+	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
+	cpumask_set_cpu(cpu, &hdr->cpu_mask);
+}
+
+/**
+ * mpam_resctrl_offline_domain_hdr() - Update the domain header to remove a CPU.
+ * @cpu:	The CPU to remove from the domain.
+ * @hdr:	The domain's header.
+ *
+ * Removes @cpu from the header mask. If this was the last CPU in the domain,
+ * the domain header is removed from its parent list and true is returned,
+ * indicating the parent structure can be freed.
+ * If there are other CPUs in the domain, returns false.
+ */
+static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
+					    struct rdt_domain_hdr *hdr)
+{
+	lockdep_assert_held(&domain_list_lock);
+
+	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
+	if (cpumask_empty(&hdr->cpu_mask)) {
+		list_del_rcu(&hdr->list);
+		synchronize_rcu();
+		return true;
+	}
+
+	return false;
+}
+
+static struct mpam_resctrl_dom *
+mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
+{
+	int err;
+	struct mpam_resctrl_dom *dom;
+	struct rdt_mon_domain *mon_d;
+	struct rdt_ctrl_domain *ctrl_d;
+	struct mpam_class *class = res->class;
+	struct mpam_component *comp_iter, *ctrl_comp;
+	struct rdt_resource *r = &res->resctrl_res;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	ctrl_comp = NULL;
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
+			ctrl_comp = comp_iter;
+			break;
+		}
+	}
+
+	/* class has no component for this CPU */
+	if (WARN_ON_ONCE(!ctrl_comp))
+		return ERR_PTR(-EINVAL);
+
+	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
+	if (!dom)
+		return ERR_PTR(-ENOMEM);
+
+	if (exposed_alloc_capable) {
+		dom->ctrl_comp = ctrl_comp;
+
+		ctrl_d = &dom->resctrl_ctrl_dom;
+		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &ctrl_d->hdr);
+		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
+		/* TODO: this list should be sorted */
+		list_add_tail_rcu(&ctrl_d->hdr.list, &r->ctrl_domains);
+		err = resctrl_online_ctrl_domain(r, ctrl_d);
+		if (err) {
+			dom = ERR_PTR(err);
+			goto offline_ctrl_domain;
+		}
+	} else {
+		pr_debug("Skipped control domain online - no controls\n");
+	}
+
+	if (exposed_mon_capable) {
+		mon_d = &dom->resctrl_mon_dom;
+		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &mon_d->hdr);
+		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
+		/* TODO: this list should be sorted */
+		list_add_tail_rcu(&mon_d->hdr.list, &r->mon_domains);
+		err = resctrl_online_mon_domain(r, mon_d);
+		if (err) {
+			dom = ERR_PTR(err);
+			goto offline_mon_hdr;
+		}
+	} else {
+		pr_debug("Skipped monitor domain online - no monitors\n");
+	}
+
+	return dom;
+
+offline_mon_hdr:
+	mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
+offline_ctrl_domain:
+	resctrl_offline_ctrl_domain(r, ctrl_d);
+
+	return dom;
+}
+
+static struct mpam_resctrl_dom *
+mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
+{
+	struct mpam_resctrl_dom *dom;
+	struct rdt_ctrl_domain *ctrl_d;
+	struct rdt_resource *r = &res->resctrl_res;
+
+	lockdep_assert_cpus_held();
+
+	list_for_each_entry_rcu(ctrl_d, &r->ctrl_domains, hdr.list) {
+		dom = container_of(ctrl_d, struct mpam_resctrl_dom,
+				   resctrl_ctrl_dom);
+
+		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
+			return dom;
+	}
+
+	return NULL;
+}
+
+int mpam_resctrl_online_cpu(unsigned int cpu)
+{
+	guard(mutex)(&domain_list_lock);
+	for (int i = 0; i < RDT_NUM_RESOURCES; i++) {
+		struct mpam_resctrl_dom *dom;
+		struct mpam_resctrl_res *res;
+
+		res = &mpam_resctrl_controls[i];
+		if (!res->class)
+			continue;	// dummy_resource;
+
+		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
+		if (!dom)
+			dom = mpam_resctrl_alloc_domain(cpu, res);
+		if (IS_ERR(dom))
+			return PTR_ERR(dom);
+	}
+
+	resctrl_online_cpu(cpu);
+
+	return 0;
+}
+
+void mpam_resctrl_offline_cpu(unsigned int cpu)
+{
+	resctrl_offline_cpu(cpu);
+
+	guard(mutex)(&domain_list_lock);
+	for (int i = 0; i < RDT_NUM_RESOURCES; i++) {
+		struct mpam_resctrl_res *res;
+		struct mpam_resctrl_dom *dom;
+		struct rdt_mon_domain *mon_d;
+		struct rdt_ctrl_domain *ctrl_d;
+		bool ctrl_dom_empty, mon_dom_empty;
+
+		res = &mpam_resctrl_controls[i];
+		if (!res->class)
+			continue;	// dummy resource
+
+		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
+		if (WARN_ON_ONCE(!dom))
+			continue;
+
+		ctrl_dom_empty = true;
+		if (exposed_alloc_capable) {
+			ctrl_d = &dom->resctrl_ctrl_dom;
+			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
+			if (ctrl_dom_empty)
+				resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl_d);
+		}
+
+		mon_dom_empty = true;
+		if (exposed_mon_capable) {
+			mon_d = &dom->resctrl_mon_dom;
+			mon_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
+			if (mon_dom_empty)
+				resctrl_offline_mon_domain(&res->resctrl_res, mon_d);
+		}
+
+		if (ctrl_dom_empty && mon_dom_empty)
+			kfree(dom);
+	}
+}
+
+int mpam_resctrl_setup(void)
+{
+	int err = 0;
+	struct mpam_resctrl_res *res;
+
+	cpus_read_lock();
+	for (enum resctrl_res_level i = 0; i < RDT_NUM_RESOURCES; i++) {
+		res = &mpam_resctrl_controls[i];
+		INIT_LIST_HEAD_RCU(&res->resctrl_res.ctrl_domains);
+		INIT_LIST_HEAD_RCU(&res->resctrl_res.mon_domains);
+		res->resctrl_res.rid = i;
+	}
+
+	/* TODO: pick MPAM classes to map to resctrl resources */
+
+	/* Initialise the resctrl structures from the classes */
+	for (enum resctrl_res_level i = 0; i < RDT_NUM_RESOURCES; i++) {
+		res = &mpam_resctrl_controls[i];
+		if (!res->class)
+			continue;	// dummy resource
+
+		err = mpam_resctrl_control_init(res, i);
+		if (err) {
+			pr_debug("Failed to initialise rid %u\n", i);
+			break;
+		}
+	}
+	cpus_read_unlock();
+
+	if (err) {
+		pr_debug("Internal error %d - resctrl not supported\n", err);
+		return err;
+	}
+
+	if (!exposed_alloc_capable && !exposed_mon_capable) {
+		pr_debug("No alloc(%u) or monitor(%u) found - resctrl not supported\n",
+			 exposed_alloc_capable, exposed_mon_capable);
+		return -EOPNOTSUPP;
+	}
+
+	if (!is_power_of_2(mpam_pmg_max + 1)) {
+		/*
+		 * If not all the partid*pmg values are valid indexes,
+		 * resctrl may allocate pmg that don't exist. This
+		 * should cause an error interrupt.
+		 */
+		pr_warn("Number of PMG is not a power of 2! resctrl may misbehave");
+	}
+
+	/* TODO: call resctrl_init() */
+
+	return err;
+}
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 7f00c5285a32..2c7d1413a401 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -49,6 +49,9 @@ static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
 }
 #endif
 
+bool resctrl_arch_alloc_capable(void);
+bool resctrl_arch_mon_capable(void);
+
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
  * @partid_max:		The maximum PARTID value the requestor can generate.
-- 
2.43.0


