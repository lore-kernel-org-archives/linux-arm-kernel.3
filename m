Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA3CD374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7T/jWkXTRUSZSK9tuzWBYA4vIzcJnODWvXAs+7NvT0=; b=dZ18zHzD4Z/+qSO1k6lfY3VXiL
	jzVf7uBucUvDZSz5RfzUF4VZTIarf3k/HjBsLGUWHI5L8X6WbZEmtQRddd09y+LEiHDMMkt/UG/S+
	G2OmIPV1MaPUqiHfN2nPoazWgkEAsqtOa25oj7IbHwrXOOad87olKjAn1+3k5JuF9NWuUvmQrWzC4
	qFOJlDPlmXSkAjMaGDaIpyBsXFuDdeuLWHqyrKnGYDVjL4W/NvAPaCfrjb0aM/zEh3R5aJv+U+dZw
	/H0SaVvVxwyeRd4OwDPN15p3ZCZQIfsCSwyx0Vpne21YqQtMF84Opez/2bjw4ESNy1Tr40lzaekkb
	YgHX2bgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdru-0000000A6yQ-0fMS;
	Fri, 05 Dec 2025 22:01:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrq-0000000A6to-40y7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:01:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11AA31AED;
	Fri,  5 Dec 2025 14:01:27 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 925E53F740;
	Fri,  5 Dec 2025 14:01:30 -0800 (PST)
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
Subject: [RFC PATCH 31/38] arm_mpam: resctrl: Update the rmid reallocation limit
Date: Fri,  5 Dec 2025 21:58:54 +0000
Message-Id: <20251205215901.17772-32-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140135_109167_2473FDF0 
X-CRM114-Status: GOOD (  19.20  )
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

resctrl's limbo code needs to be told when the data left in a cache is
small enough for the partid+pmg value to be re-allocated.

x86 uses the cache size divided by the number of rmid users the cache
may have. Do the same, but for the smallest cache, and with the
number of partid-and-pmg users.

Querying the cache size can't happen until after cacheinfo_sysfs_init()
has run, so mpam_resctrl_setup() must wait until then.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 506063bd3348..ccdf8db742c9 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -16,6 +16,7 @@
 #include <linux/resctrl.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/wait.h>
 
 #include <asm/mpam.h>
 
@@ -58,6 +59,13 @@ static bool cdp_enabled;
  */
 static bool resctrl_enabled;
 
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
@@ -584,6 +592,38 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
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
@@ -1025,6 +1065,9 @@ static void mpam_resctrl_pick_counters(void)
 			/* CSU counters only make sense on a cache. */
 			switch (class->type) {
 			case MPAM_CLASS_CACHE:
+				if (update_rmid_limits(class))
+					continue;
+
 				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
 				return;
 			default:
@@ -1731,6 +1774,8 @@ int mpam_resctrl_setup(void)
 	struct mpam_resctrl_res *res;
 	struct mpam_resctrl_mon *mon;
 
+	wait_event(wait_cacheinfo_ready, cacheinfo_ready);
+
 	cpus_read_lock();
 	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
 		res = &mpam_resctrl_controls[i];
@@ -1854,6 +1899,15 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
 	}
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
2.39.5


