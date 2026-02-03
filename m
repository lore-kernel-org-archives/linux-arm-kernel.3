Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2087E8B362
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otwASEoWGrr7uH9oaTiqUvVMyppjsim4lcnt0qXspWo=; b=0fkzmKwf4RVMfyfb4Z+v3RPiYl
	qSdaYJVEeMfzqP92IW9ou6t3tVbdyXOmclScqkF054VIiZvE/ur7bS+xxHc8Uw0yG9u9wErmFB71z
	Lzlmv3aOFoMsMgO819kNEDUbHIc0vZFEHspzfwGpFSeD4ysj/EEj522yxK2Kx3hDbdJfgAGC7fl/U
	mPh/Vt5hjeY4k4MtLrb3zFM6xVpet2f438AFJ6Ly3j2Ll0sG8Joye6OPzWStFHH7yM9Nns05zrYML
	lVTOpLGr6nXoth/7pwqpS5q7b4q6n+uUqgz9FeUE2w1p3fNba0Zj3eG8ZYersOfTjJwVJ6OZEoFSh
	F2qHaAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOEX-00000007QO1-320i;
	Tue, 03 Feb 2026 21:46:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOEV-00000007QLu-1lIj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:46:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAAB9339;
	Tue,  3 Feb 2026 13:46:43 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B05EC3F778;
	Tue,  3 Feb 2026 13:46:44 -0800 (PST)
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
Subject: [PATCH v4 29/41] arm_mpam: resctrl: Pre-allocate free running monitors
Date: Tue,  3 Feb 2026 21:43:30 +0000
Message-ID: <20260203214342.584712-30-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_134651_563518_405D334F 
X-CRM114-Status: GOOD (  18.68  )
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

When there are enough monitors, the resctrl mbm local and total files can
be exposed. These need all the monitors that resctrl may use to be
allocated up front.

Add helpers to do this.

If a different candidate class is discovered, the old array should be
free'd and the allocated monitors returned to the driver.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Code flow tidying (Jonathan)
---
 drivers/resctrl/mpam_internal.h |  3 +-
 drivers/resctrl/mpam_resctrl.c  | 81 ++++++++++++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index bab6eea60dae..5f4ac4fabc0d 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -356,7 +356,8 @@ struct mpam_resctrl_res {
 struct mpam_resctrl_mon {
 	struct mpam_class	*class;
 
-	/* per-class data that resctrl needs will live here */
+	/* Array of allocated MBWU monitors, indexed by (closid, rmid). */
+	int			*mbwu_idx_to_mon;
 };
 
 static inline int mpam_alloc_csu_mon(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index c96c434c9454..8c57fd48e560 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -645,10 +645,58 @@ static void mpam_resctrl_pick_mba(void)
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
+	int *new_array, *existing_array = mon->mbwu_idx_to_mon;
 
 	if (existing_class) {
 		if (class->level == 3) {
@@ -663,8 +711,37 @@ static void counter_update_class(enum resctrl_event_id evt_id,
 		}
 	}
 
-	mpam_resctrl_counters[evt_id].class = class;
+	pr_debug("Updating event %u to use class %u\n", evt_id, class->level);
+
+	/* Might not need all the monitors */
+	num_mbwu_mon = __mpam_monitors_free_running(num_mbwu_mon);
+
+	if (evt_id != QOS_L3_OCCUP_EVENT_ID && num_mbwu_mon) {
+		/*
+		 * This is the pre-allocated free-running monitors path. It always
+		 * allocates one monitor per PARTID * PMG.
+		 */
+		WARN_ON_ONCE(num_mbwu_mon != resctrl_arch_system_num_rmid_idx());
+
+		new_array = __alloc_mbwu_array(class, num_mbwu_mon);
+		if (IS_ERR(new_array)) {
+			pr_debug("Failed to allocate MBWU array\n");
+			return;
+		}
+		mon->mbwu_idx_to_mon = new_array;
+
+		if (existing_array) {
+			pr_debug("Releasing previous class %u's monitors\n",
+				 existing_class->level);
+			__free_mbwu_mon(existing_class, existing_array, num_mbwu_mon);
+			kfree(existing_array);
+		}
+	} else if (evt_id != QOS_L3_OCCUP_EVENT_ID) {
+		pr_debug("Not pre-allocating free-running counters\n");
+	}
+
 	exposed_mon_capable = true;
+	mon->class = class;
 }
 
 static void mpam_resctrl_pick_counters(void)
-- 
2.43.0


