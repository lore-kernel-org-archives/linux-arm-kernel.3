Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5CAD374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoZrfVQQ8vGYDMM+h0Bpv/Pg3V6Dr3iQmBHWdtOrGq8=; b=aR9z8kG8yJh6zLPJGLcz1Vm450
	WgpH2+MmA2S+yM3Fmjo32xl7q59yG6iU+46g0dZqkBbR9DdKvKeSO6odb5eqIqhBVDoMUpy+XQZzv
	djyIQF2EkwI9ba8HB24rzU4hELEZq+zOi/jfVLJJ1znCXsn2poLK2oySxJJAZUlwIpK9frbIN/IIF
	ybSRUTcGLdnuR3W5WbYqq4Xi+Gpa/3XktRS883ICikdZ4vtel456UahR/cWgQYpzWbN0sgv6zLFmD
	PdQLaH6uwSToLtTdzVm3Bsm5Wp2b9OsV2QMR3ei8K00AFA2UTNWVu7EEDVn5wHhdH+HQa6q1r4inL
	r1OEfBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqd-0000000A5Nj-3x9E;
	Fri, 05 Dec 2025 22:00:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqb-0000000A5Lp-2q2r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A038D1AED;
	Fri,  5 Dec 2025 14:00:09 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DCCB3F740;
	Fri,  5 Dec 2025 14:00:13 -0800 (PST)
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
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 12/38] arm_mpam: resctrl: Add plumbing against arm64 task and cpu hooks
Date: Fri,  5 Dec 2025 21:58:35 +0000
Message-Id: <20251205215901.17772-13-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140017_826723_F25753D1 
X-CRM114-Status: GOOD (  12.08  )
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

arm64 provides helpers for changing a tasks and a cpus mpam partid/pmg
values.

These are used to back a number of resctrl_arch_ functions. Connect them
up.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 58 ++++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |  5 +++
 2 files changed, 63 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ae0d17857b78..c2650abb99ec 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -8,6 +8,7 @@
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/errno.h>
+#include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
@@ -32,6 +33,8 @@ static DEFINE_MUTEX(domain_list_lock);
 static bool exposed_alloc_capable;
 static bool exposed_mon_capable;
 
+static bool cdp_enabled;
+
 bool resctrl_arch_alloc_capable(void)
 {
 	return exposed_alloc_capable;
@@ -52,6 +55,61 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 	return mpam_partid_max + 1;
 }
 
+void resctrl_arch_sched_in(struct task_struct *tsk)
+{
+	lockdep_assert_preemption_disabled();
+
+	mpam_thread_switch(tsk);
+}
+
+void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
+{
+	WARN_ON_ONCE(closid > U16_MAX);
+	WARN_ON_ONCE(rmid > U8_MAX);
+
+	if (!cdp_enabled) {
+		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
+	} else {
+		/*
+		 * When CDP is enabled, resctrl halves the closid range and we
+		 * use odd/even partid for one closid.
+		 */
+		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
+		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
+
+		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
+	}
+}
+
+void resctrl_arch_sync_cpu_closid_rmid(void *info)
+{
+	struct resctrl_cpu_defaults *r = info;
+
+	lockdep_assert_preemption_disabled();
+
+	if (r) {
+		resctrl_arch_set_cpu_default_closid_rmid(smp_processor_id(),
+							 r->closid, r->rmid);
+	}
+
+	resctrl_arch_sched_in(current);
+}
+
+void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
+{
+	WARN_ON_ONCE(closid > U16_MAX);
+	WARN_ON_ONCE(rmid > U8_MAX);
+
+	if (!cdp_enabled) {
+		mpam_set_task_partid_pmg(tsk, closid, closid, rmid, rmid);
+	} else {
+		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
+		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
+
+		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid, rmid);
+	}
+}
+
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 {
 	if (l >= RDT_NUM_RESOURCES)
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 2c7d1413a401..5a78299ec464 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -52,6 +52,11 @@ static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
 bool resctrl_arch_alloc_capable(void);
 bool resctrl_arch_mon_capable(void);
 
+void resctrl_arch_set_cpu_default_closid(int cpu, u32 closid);
+void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
+void resctrl_arch_sched_in(struct task_struct *tsk);
+
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
  * @partid_max:		The maximum PARTID value the requestor can generate.
-- 
2.39.5


