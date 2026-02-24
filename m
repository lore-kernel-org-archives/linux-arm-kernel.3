Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9430BF4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y06rZ7PfUacHxx+r+vPVHJoa+IFmqFEVZLRHNVGzSHI=; b=ijzSu06w/usGCIvAZUMqFAn0u4
	QPVlCQWmYTiJiDiBYhyub9bwFYhMVHo9TXGU77J2CHN90NASwe+TZmAEXWJZpl/6NIvc/lrf4//8j
	C+j2XgwB+cxHhgpMq2P1mLNRHFaDSQSj/itcOObXP3yfTbScrKAqYEQyN20P2uDasIxBPoVSYY+wq
	pm4G6aycuPm99Xav70RzRq6UFw6+WRvns9iojUJ9tu6ddkMBcUAWAB8df0usQsFiAKJFQr7gN5v8b
	3gkYR3dMDJ1TktHdUGHn3jgkgTpdg9lM1JQbO2FK7zPbUFFpvcGJxl7UoAmb4/C2furvJ9e3wXp33
	9B0U1xZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgn-00000002Y8y-499Z;
	Tue, 24 Feb 2026 17:59:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgk-00000002Y2t-3bNE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 17:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=y06rZ7PfUacHxx+r+vPVHJoa+IFmqFEVZLRHNVGzSHI=; b=Id9iobKLHtAe3L38dkAliEVBZO
	u/AlvF3W00Glv51HwhdodGHnmdu9QGV1f1InEH3n08v4UyLc/Oakp8+AT1l/L6lfJvBQQA+5zkB9t
	Z9sTNavnr11YNPxdci7IiQUS40tfRbdLuLMd0Ot9DnZzcvbfnO641SboMqbBwda+4T4y64nhC7KJ9
	ypLEngVuY5+JeTO+5kTX5JYv3v/7qsxCbRCcctXl2F3SZ6h4Ie2XwNN9gCOONoxsgrYfWZ3jZOZgt
	gQrs2IBRTtfS8wZGeuK8YrmaSQNIY+S21AvIhAR0KxvthM+JJIWoHDS0t0RcvJP2C78YTzHOU9BjZ
	82HALBVg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwgd-00000007dnT-0WEP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:59:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58D541595;
	Tue, 24 Feb 2026 09:58:59 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BAAD83F59E;
	Tue, 24 Feb 2026 09:59:00 -0800 (PST)
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
Subject: [PATCH v5 18/41] arm_mpam: resctrl: Add plumbing against arm64 task and cpu hooks
Date: Tue, 24 Feb 2026 17:56:57 +0000
Message-ID: <20260224175720.2663924-19-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175909_725215_B3B17A3F 
X-CRM114-Status: GOOD (  12.53  )
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

arm64 provides helpers for changing a task's and a cpu's mpam partid/pmg
values.

These are used to back a number of resctrl_arch_ functions. Connect them
up.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
apostrophes in commit message
---
 drivers/resctrl/mpam_resctrl.c | 58 ++++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |  5 +++
 2 files changed, 63 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 3ca762c3fae6..5551e5416620 100644
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
@@ -34,6 +35,8 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 /* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
 static DEFINE_MUTEX(domain_list_lock);
 
+static bool cdp_enabled;
+
 bool resctrl_arch_alloc_capable(void)
 {
 	struct mpam_resctrl_res *res;
@@ -57,6 +60,61 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
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
2.43.0


