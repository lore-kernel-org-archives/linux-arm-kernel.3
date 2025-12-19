Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD512D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+dmbUGzfgk8/P88ecfwgeblwGK0caqWrbNAyDz4pVw=; b=CvPafDdLLvQ8tliSD6JEuDDjRf
	2SZugRxtfrxzmseLryG7vp14D2iqwfxBNdOmAq1MKBE5aToIB8jD2fzI9I9pojVEU6hyauO/aO0Vz
	ODynzU+HGqn1P8vt2ghGDrjuhPk4MBMO96WCpTDOZpMgj6+0u+sDMgtgkJBFgbdJ9u0bVug8SwYIn
	2t/sJN7Qe+v0lW7FbEACaIrKLQccyHQGMAuOVsXY3w5uJM4hsOI6zAQmeQiIystHRfXEQyhJnh75Q
	kPA8Lec6Z0HPhfFD7Pn0as/z0ELvBdFBbHVpvz+SiMxL23sgaFGkJFrKYE/snVJfxkrMomC3971ud
	U+lTa8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf04-0000000AnLi-0yq4;
	Fri, 19 Dec 2025 18:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf01-0000000AnHB-09xo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 18:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3+dmbUGzfgk8/P88ecfwgeblwGK0caqWrbNAyDz4pVw=; b=ZS2nPUCctDGMRQt8Dn+5Wugg/1
	ZYW1kPvh8H//zbHKh7cdbC+EUCNJyZo5alx/exQXeQEKUdFVKmsFPRZx4Ep9ugL7MX7NebyVOSJYF
	B7CUZyPyNTBBhjwKfdGTrJqI71d2kyPILn9W7Hs2V0drPsWWnJa4EkgCxfnk4fCcQlo+UUVPMqkcv
	aNpj5814ly7FXerQsYg77iPfIlKNSkH9MpqMDl5Z7+GvPjFORA7X+LdXqIGwKlSaZZUz2mZrEzAsK
	tWu0CtPgDiWL+hZ8ezH4mpnwXCWI/jsZbm+Bgh8t9glnj3LQne/nX5rmoHC7MWoGXn114Dbus2070
	BJVL5zXA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe8V-0000000BPy7-3DoE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 17:19:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22C861684;
	Fri, 19 Dec 2025 10:14:33 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8AD23F5CA;
	Fri, 19 Dec 2025 10:14:35 -0800 (PST)
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
Subject: [PATCH v2 33/45] arm_mpam: resctrl: Allow resctrl to allocate monitors
Date: Fri, 19 Dec 2025 18:11:35 +0000
Message-ID: <20251219181147.3404071-34-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_171928_194014_1240D5CC 
X-CRM114-Status: GOOD (  16.10  )
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

When resctrl wants to read a domain's 'QOS_L3_OCCUP', it needs to allocate
a monitor on the corresponding resource. Monitors are allocated by class
instead of component.

MBM monitors are much more complicated, if there are enough monitors, they
will be pre-allocated and free-running. If ABMC is in use instead then
'some' are pre-allocated in a different way, and need assigning.

Add helpers to allocate a CSU monitor. These helper return an out of range
value for MBM counters.

Allocating a montitor context is expected to block until hardware resources
become available. This only makes sense for QOS_L3_OCCUP as unallocated MBM
counters are losing data.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
USE_RMID_IDX -> USE_PRE_ALLOCATED in comment
Remove unnecessary arch_mon_ctx = NULL
---
 drivers/resctrl/mpam_internal.h | 14 ++++++-
 drivers/resctrl/mpam_resctrl.c  | 67 +++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h        |  4 ++
 3 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index a2f6956d9236..b907bec96ba5 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -29,6 +29,14 @@ struct platform_device;
 #define PACKED_FOR_KUNIT
 #endif
 
+/*
+ * This 'mon' values must not alias an actual monitor, so must be larger than
+ * U16_MAX, but not be confused with an errno value, so smaller than
+ * (u32)-SZ_4K.
+ * USE_PRE_ALLOCATED is used to avoid confusion with an actual monitor.
+ */
+#define USE_PRE_ALLOCATED	(U16_MAX + 1)
+
 static inline bool mpam_is_enabled(void)
 {
 	return static_branch_likely(&mpam_enabled);
@@ -212,7 +220,11 @@ enum mon_filter_options {
 };
 
 struct mon_cfg {
-	u16			mon;
+	/*
+	 * mon must be large enough to hold out of range values like
+	 * USE_PRE_ALLOCATED
+	 */
+	u32			mon;
 	u8			pmg;
 	bool			match_pmg;
 	bool			csu_exclude_clean;
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 328a81ab68b4..638c84cdcfb6 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -21,6 +21,8 @@
 
 #include "mpam_internal.h"
 
+DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
+
 /*
  * The classes we've picked to map to resctrl resources, wrapped
  * in with their resctrl structure.
@@ -287,6 +289,71 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 	return &mpam_resctrl_controls[l].resctrl_res;
 }
 
+static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+
+	if (!mon->class)
+		return -EINVAL;
+
+	switch (evtid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+		/* With CDP, one monitor gets used for both code/data reads */
+		return mpam_alloc_csu_mon(mon->class);
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		return USE_PRE_ALLOCATED;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
+				 enum resctrl_event_id evtid)
+{
+	DEFINE_WAIT(wait);
+	int *ret;
+
+	ret = kmalloc(sizeof(*ret), GFP_KERNEL);
+	if (!ret)
+		return ERR_PTR(-ENOMEM);
+
+	do {
+		prepare_to_wait(&resctrl_mon_ctx_waiters, &wait,
+				TASK_INTERRUPTIBLE);
+		*ret = resctrl_arch_mon_ctx_alloc_no_wait(evtid);
+		if (*ret == -ENOSPC)
+			schedule();
+	} while (*ret == -ENOSPC && !signal_pending(current));
+	finish_wait(&resctrl_mon_ctx_waiters, &wait);
+
+	return ret;
+}
+
+static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
+					      u32 mon_idx)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
+
+	if (!mon->class)
+		return;
+
+	if (evtid == QOS_L3_OCCUP_EVENT_ID)
+		mpam_free_csu_mon(mon->class, mon_idx);
+
+	wake_up(&resctrl_mon_ctx_waiters);
+}
+
+void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
+			       enum resctrl_event_id evtid, void *arch_mon_ctx)
+{
+	u32 mon_idx = *(u32 *)arch_mon_ctx;
+
+	kfree(arch_mon_ctx);
+
+	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
+}
+
 static bool cache_has_usable_cpor(struct mpam_class *class)
 {
 	struct mpam_props *cprops = &class->props;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 385554ceb452..e1461e32af75 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -63,6 +63,10 @@ u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
 
+struct rdt_resource;
+void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
+void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
+
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
  * @partid_max:		The maximum PARTID value the requestor can generate.
-- 
2.43.0


