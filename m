Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8DED374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh2OGYi/yNjCMhYSwavzEO6CDFU65BThtG3ReFMZzto=; b=ilpBWujPUBbHUt204cCVG0112L
	viZuJzBugsYJf80mDPsyvi8/1jhtRB+nXyhwcYe4gCETtD5ARcz4DaqysSwzM+CReuS4oBoF4JdOX
	onigoc5b0AjzAybmPDIuzSMTJ26p/11e/6jKrUEsZswUm8Ml8p5t3KWllNxoFXNbk83HaunZtbHFr
	cIpu2buUsSKgS1hU1EoRvR9eQ4kxN0sqD8rAMGAQ9GPLSBJIqVerwdcQOv3mvuS+0gbOBpKiNiG77
	ReN6oWquWMm5/ljyrlmcwzkxcX1wb33tH5J7uXWVvjaWC40+Ff20DMBbgT+KEa5F1vLvIJxwf9pYy
	laXjZ/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrl-0000000A6mV-3Bnz;
	Fri, 05 Dec 2025 22:01:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrj-0000000A6jm-45nW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Xh2OGYi/yNjCMhYSwavzEO6CDFU65BThtG3ReFMZzto=; b=RoAfjGsO6TDMBRts5cIKFbG3iF
	sXH64ctD/wq3aaV9M5e0R5uc9fV/mmaAQZltF+zDPJy76JosahDraJFR2UumBgW1kLtjYM1lXpLAN
	mXh2EPS/OyR6cjBJozJ6LfmQt/CTnu3/lCquqYwtIQnMQNNtgD1yKISDimDDtuTXW8y1El2CaciQr
	2P3vWeDftO7Ia06xzjJSCqWtuRmzHnfx73oEldAd4+3LWVZQN5kTeq5dCBb4Zj3BFkdjMJlsk3z9o
	FDQvHYQXU9UjqmA7eWMCGkEm4RfotbBRoaXC8pnFc3BwH2JCvayHKzLS4x0ZkglJfvD+PxMD+o8YN
	36uJXEmg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRczs-00000006snb-1cWL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:06:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B28E21BA8;
	Fri,  5 Dec 2025 14:00:58 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E9B53F740;
	Fri,  5 Dec 2025 14:01:02 -0800 (PST)
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
Subject: [RFC PATCH 24/38] arm_mpam: resctrl: Allow resctrl to allocate monitors
Date: Fri,  5 Dec 2025 21:58:47 +0000
Message-Id: <20251205215901.17772-25-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210603_010112_942A8108 
X-CRM114-Status: GOOD (  16.93  )
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

When resctrl wants to read a domain's 'QOS_L3_OCCUP', it needs
to allocate a monitor on the corresponding resource. Monitors are
allocated by class instead of component.

MBM monitors are much more complicated, if there are enough monitors,
they will be pre-allocated and free-running. If ABMC is in use instead
then 'some' are pre-allocated in a different way, and need assigning.

Add helpers to allocate a CSU monitor. These helper return an out
of range value for MBM counters.

Allocating a montitor context is expected to block until hardware
resources become available. This only makes sense for QOS_L3_OCCUP
as unallocated MBM counters are losing data.

Signed-off-by: James Morse <james.morse@arm.com>
---
Since ABMC got merged it may be possible to remove the monitor alloc
call for MBM counters from resctrl as this work is now done by ABMC's
assign call.
---
 drivers/resctrl/mpam_internal.h | 14 ++++++-
 drivers/resctrl/mpam_resctrl.c  | 68 +++++++++++++++++++++++++++++++++
 include/linux/arm_mpam.h        |  4 ++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 05101186af17..3a68ebd498fa 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -32,6 +32,14 @@ DECLARE_STATIC_KEY_FALSE(mpam_enabled);
 #define PACKED_FOR_KUNIT
 #endif
 
+/*
+ * This 'mon' values must not alias an actual monitor, so must be larger than
+ * U16_MAX, but not be confused with an errno value, so smaller than
+ * (u32)-SZ_4K.
+ * USE_PRE_ALLOCATED is used to avoid confusion with an actual monitor.
+ */
+#define USE_PRE_ALLOCATED      (U16_MAX + 1)
+
 static inline bool mpam_is_enabled(void)
 {
 	return static_branch_likely(&mpam_enabled);
@@ -215,7 +223,11 @@ enum mon_filter_options {
 };
 
 struct mon_cfg {
-	u16			mon;
+	/*
+	 * mon must be large enough to hold out of range values like
+	 * USE_RMID_IDX
+	 */
+	u32                     mon;
 	u8			pmg;
 	bool			match_pmg;
 	bool			csu_exclude_clean;
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 22ad5dd3c383..a2b238d47117 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -21,6 +21,8 @@
 
 #include "mpam_internal.h"
 
+DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
+
 /*
  * The classes we've picked to map to resctrl resources, wrapped
  * in with their resctrl structure.
@@ -287,6 +289,72 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
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
+	arch_mon_ctx = NULL;
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
2.39.5


