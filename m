Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9281CE66882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwu+qdn7p/IBVNXGYmSHs1TNPEjkEQ/920hDcIWLDCI=; b=URJwaBcUv99xJDqQWJWuSXjlxW
	mSAEefOcwDHQtpmZREkO/JzsCe4Ud8ElNTl4NV3yYZ7hK/aY5XTgqA4p0ViM6nCJpIqZp1XRCCuWx
	tVCzNJbVTEK/z+zYRFrEh3cAA6kbMmzvm+y/MN/YthurA9VneUPDUEIYs3mT4ypcg56dk+9KdFIl8
	gkJW1Y9Xxo8NzEAaBkQpI53lH0m/5RWI7X3C6QV0K3nd/EMdFvdvkwdezoFf+LdlB3GjTG0GdcZp6
	GkLbfxg1fmh60C6nc/psFB42uNZ3W2yC0NT6YbubtB5IYmGWkcHqVvaNcVKe7oTHYQ+R7/Pq9gNi1
	SY3IhBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf0K-0000000Ane7-172q;
	Fri, 19 Dec 2025 18:15:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf0B-0000000AnTX-26Qk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:15:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CF2C1691;
	Fri, 19 Dec 2025 10:14:47 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6E813F5CA;
	Fri, 19 Dec 2025 10:14:49 -0800 (PST)
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
Subject: [PATCH v2 36/45] arm_mpam: resctrl: Update the rmid reallocation limit
Date: Fri, 19 Dec 2025 18:11:38 +0000
Message-ID: <20251219181147.3404071-37-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101455_701009_350F99CD 
X-CRM114-Status: GOOD (  19.06  )
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

resctrl's limbo code needs to be told when the data left in a cache is
small enough for the partid+pmg value to be re-allocated.

x86 uses the cache size divided by the number of rmid users the cache may
have. Do the same, but for the smallest cache, and with the number of
partid-and-pmg users.

Querying the cache size can't happen until after cacheinfo_sysfs_init() has
run, so mpam_resctrl_setup() must wait until then.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ef60bc0c7bd8..84f517cb047a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -16,6 +16,7 @@
 #include <linux/resctrl.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/wait.h>
 
 #include <asm/mpam.h>
 
@@ -52,6 +53,13 @@ static bool exposed_mon_capable;
  */
 static bool cdp_enabled;
 
+/*
+ * mpam_resctrl_pick_caches() needs to know the size of the caches. cacheinfo
+ * populates this from a device_initcall(). mpam_resctrl_setup() must wait.
+ */
+static bool cacheinfo_ready;
+static DECLARE_WAIT_QUEUE_HEAD(wait_cacheinfo_ready);
+
 /*
  * L3 local/total may come from different classes - what is the number of MBWU
  * 'on L3'?
@@ -556,6 +564,38 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
 }
 
+/*
+ * The rmid realloc threshold should be for the smallest cache exposed to
+ * resctrl.
+ */
+static int update_rmid_limits(struct mpam_class *class)
+{
+	u32 num_unique_pmg = resctrl_arch_system_num_rmid_idx();
+	struct mpam_props *cprops = &class->props;
+	struct cacheinfo *ci;
+
+	lockdep_assert_cpus_held();
+
+	/* Assume cache levels are the same size for all CPUs... */
+	ci = get_cpu_cacheinfo_level(smp_processor_id(), class->level);
+	if (!ci || ci->size == 0) {
+		pr_debug("Could not read cache size for class %u\n",
+			 class->level);
+		return -EINVAL;
+	}
+
+	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
+		return 0;
+
+	if (!resctrl_rmid_realloc_limit ||
+	    ci->size < resctrl_rmid_realloc_limit) {
+		resctrl_rmid_realloc_limit = ci->size;
+		resctrl_rmid_realloc_threshold = ci->size / num_unique_pmg;
+	}
+
+	return 0;
+}
+
 static bool cache_has_usable_cpor(struct mpam_class *class)
 {
 	struct mpam_props *cprops = &class->props;
@@ -996,6 +1036,9 @@ static void mpam_resctrl_pick_counters(void)
 			/* CSU counters only make sense on a cache. */
 			switch (class->type) {
 			case MPAM_CLASS_CACHE:
+				if (update_rmid_limits(class))
+					continue;
+
 				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
 				return;
 			default:
@@ -1708,6 +1751,8 @@ int mpam_resctrl_setup(void)
 	int err = 0;
 	struct mpam_resctrl_res *res;
 
+	wait_event(wait_cacheinfo_ready, cacheinfo_ready);
+
 	cpus_read_lock();
 	for (enum resctrl_res_level i = 0; i < RDT_NUM_RESOURCES; i++) {
 		res = &mpam_resctrl_controls[i];
@@ -1773,6 +1818,15 @@ int mpam_resctrl_setup(void)
 	return err;
 }
 
+static int __init __cacheinfo_ready(void)
+{
+	cacheinfo_ready = true;
+	wake_up(&wait_cacheinfo_ready);
+
+	return 0;
+}
+device_initcall_sync(__cacheinfo_ready);
+
 #ifdef CONFIG_MPAM_KUNIT_TEST
 #include "test_mpam_resctrl.c"
 #endif
-- 
2.43.0


