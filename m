Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B621D374B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkzBeBm8I3T4GjvEBEQKWgFbszbzBKDoQtXCJknCo8U=; b=xjh/C5ta0+RfjFjwgBBGMgwu5y
	/MT1wPgidvxNxIoqkmkk1lFSpKdO3ce0A6H8/vCELS5Ak8BZ3K0TfK+H6xj9R9JTef2IEsMFVDh6e
	D+NtTVkFvBLx7o5s7XpaecNTXBx2vAUHb9D7LjWQvmWfEeR12WGB81mqAs6jnnR8eNY6uosl8HMRm
	IHyQxLjAmI/A7hx85j6oiS6Olk5zhMlr3H8oWgOXImWEVblKFf+37Qhg+4Etvuj+ieBJwe+BwL2hA
	j3hA9xmrQ6Izu5K+E8JT88lFCzRefGHIWVQNvIcpBGQSQZUzoV9eKptacE+dYE2G1Ey7WMI3UCIoe
	w1S8L8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrC-0000000A63o-06JP;
	Fri, 05 Dec 2025 22:00:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdr9-0000000A604-27wY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:00:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 840661BB0;
	Fri,  5 Dec 2025 14:00:42 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2363F3F740;
	Fri,  5 Dec 2025 14:00:46 -0800 (PST)
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
Subject: [RFC PATCH 20/38] arm_mpam: resctrl: Pre-allocate free running monitors
Date: Fri,  5 Dec 2025 21:58:43 +0000
Message-Id: <20251205215901.17772-21-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140051_819214_54DD7888 
X-CRM114-Status: GOOD (  19.19  )
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

When there are enough monitors, the resctrl mbm local and total
files can be exposed. These need all the monitors that resctrl
may use to be allocated up front.

Add helpers to do this.

If a different candidate class is discovered, the old array
should be free'd and the allocated monitors returned to the
driver.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_internal.h |  8 +++-
 drivers/resctrl/mpam_resctrl.c  | 84 ++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 0984ac32f303..b7c914febeb4 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -359,7 +359,13 @@ struct mpam_resctrl_res {
 struct mpam_resctrl_mon {
 	struct mpam_class	*class;
 
-	/* per-class data that resctrl needs will live here */
+	/*
+	 * Array of allocated MBWU monitors, indexed by (closid, rmid).
+	 * When ABMC is not in use, this array directly maps (closid, rmid)
+	 * to the allocated monitor. Otherwise this array is sparse, and
+	 * un-assigned (closid, rmid) are -1.
+	 */
+	int			*mbwu_idx_to_mon;
 };
 
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9978eb48c1f4..de5220fed97d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -559,10 +559,58 @@ static void mpam_resctrl_pick_mba(void)
 	}
 }
 
+static void __free_mbwu_mon(struct mpam_class *class, int *array,
+			    u16 num_mbwu_mon)
+{
+	for (int i = 0; i < num_mbwu_mon; i++) {
+		if (array[i] < 0)
+			continue;
+
+		mpam_free_mbwu_mon(class, array[i]);
+		array[i] = ~0;
+	}
+}
+
+static int __alloc_mbwu_mon(struct mpam_class *class, int *array,
+			    u16 num_mbwu_mon)
+{
+	for (int i = 0; i < num_mbwu_mon; i++) {
+		int mbwu_mon = mpam_alloc_mbwu_mon(class);
+
+		if (mbwu_mon < 0) {
+			__free_mbwu_mon(class, array, num_mbwu_mon);
+			return mbwu_mon;
+		}
+		array[i] = mbwu_mon;
+	}
+
+	return 0;
+}
+
+static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mon)
+{
+	int err;
+	size_t array_size = num_mbwu_mon * sizeof(int);
+	int *array __free(kfree) = kmalloc(array_size, GFP_KERNEL);
+
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	memset(array, -1, array_size);
+
+	err = __alloc_mbwu_mon(class, array, num_mbwu_mon);
+	if (err)
+		return ERR_PTR(err);
+	return_ptr(array);
+}
+
 static void counter_update_class(enum resctrl_event_id evt_id,
 				 struct mpam_class *class)
 {
-	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evt_id];
+	struct mpam_class *existing_class = mon->class;
+	u16 num_mbwu_mon = class->props.num_mbwu_mon;
+	int *existing_array = mon->mbwu_idx_to_mon;
 
 	if (existing_class) {
 		if (class->level == 3) {
@@ -575,8 +623,40 @@ static void counter_update_class(enum resctrl_event_id evt_id,
 		}
 	}
 
-	mpam_resctrl_counters[evt_id].class = class;
+	pr_debug("Updating event %u to use class %u\n", evt_id, class->level);
+	mon->class = class;
 	exposed_mon_capable = true;
+
+	if (evt_id == QOS_L3_OCCUP_EVENT_ID)
+		return;
+
+	/* Might not need all the monitors */
+	num_mbwu_mon = __mpam_monitors_free_running(num_mbwu_mon);
+	if (!num_mbwu_mon) {
+		pr_debug("Not pre-allocating free-running counters\n");
+		return;
+	}
+
+	/*
+	 * This is the pre-allocated free-running monitors path. It always
+	 * allocates one monitor per PARTID * PMG.
+	 */
+	WARN_ON_ONCE(num_mbwu_mon != resctrl_arch_system_num_rmid_idx());
+
+	mon->mbwu_idx_to_mon = __alloc_mbwu_array(class, num_mbwu_mon);
+	if (IS_ERR(mon->mbwu_idx_to_mon)) {
+		pr_debug("Failed to allocate MBWU array\n");
+		mon->class = existing_class;
+		mon->mbwu_idx_to_mon = existing_array;
+		return;
+	}
+
+	if (existing_array) {
+		pr_debug("Releasing previous class %u's monitors\n",
+			 existing_class->level);
+		__free_mbwu_mon(existing_class, existing_array, num_mbwu_mon);
+		kfree(existing_array);
+	}
 }
 
 static void mpam_resctrl_pick_counters(void)
-- 
2.39.5


