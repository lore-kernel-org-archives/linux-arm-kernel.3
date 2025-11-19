Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9EECF31B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTjaSQdJqXmRA3UlPuzhuKkcSZ+6NRccfmpkqUqGOjE=; b=Gv4NWv4h0kgr7arqhZibd99O9i
	pvmRUCkR/fYlxSetTX9t1z60sBW+E/4gg57AZALOpuk+m8V/Yho1wks0npyhJMM5kY8kYO4Y9OpIH
	SwYsfj5/czi7Kq/8CaWmIYdGeccHOPbnuKmhe0m/km6I+FhnJ3oZY9F49pE5eOP/Hq4RGOjlMr9Yd
	xqjaDlx0h1NoO2Y1bhGss/xFi623qX2/kXP6zRTbtrjidEl7LIcDE2dl7hJX1XU4UjfzTlvJfEIpG
	bU45YSrIPsDHeWUIdhKrkLFV59uahoyoIaIQEAjLD2JVZ1HRBvrIywOUE77OyugkgpyuTtY4DBM9Z
	B5YPv0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhFR-00000003833-1mYr;
	Wed, 19 Nov 2025 12:25:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhFJ-000000037uu-2oHP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:25:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 647D21BB0;
	Wed, 19 Nov 2025 04:25:05 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C11243F740;
	Wed, 19 Nov 2025 04:25:07 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	reinette.chatre@intel.com,
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH v6 19/34] arm_mpam: Add a helper to touch an MSC from any CPU
Date: Wed, 19 Nov 2025 12:22:49 +0000
Message-ID: <20251119122305.302149-20-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119122305.302149-1-ben.horgan@arm.com>
References: <20251119122305.302149-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_042514_620207_3655D44F 
X-CRM114-Status: GOOD (  14.84  )
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

Resetting RIS entries from the cpuhp callback is easy as the
callback occurs on the correct CPU. This won't be true for any other
caller that wants to reset or configure an MSC.

Add a helper that schedules the provided function if necessary.

Callers should take the cpuhp lock to prevent the cpuhp callbacks from
changing the MSC state.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 37 +++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 4bd4d57a3baa..7941b093396e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -806,20 +806,51 @@ static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid)
 	mutex_unlock(&msc->part_sel_lock);
 }
 
-static void mpam_reset_ris(struct mpam_msc_ris *ris)
+/*
+ * Called via smp_call_on_cpu() to prevent migration, while still being
+ * pre-emptible.
+ */
+static int mpam_reset_ris(void *arg)
 {
 	u16 partid, partid_max;
+	struct mpam_msc_ris *ris = arg;
 
 	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
 
 	if (ris->in_reset_state)
-		return;
+		return 0;
 
 	spin_lock(&partid_max_lock);
 	partid_max = mpam_partid_max;
 	spin_unlock(&partid_max_lock);
 	for (partid = 0; partid <= partid_max; partid++)
 		mpam_reset_ris_partid(ris, partid);
+
+	return 0;
+}
+
+/*
+ * Get the preferred CPU for this MSC. If it is accessible from this CPU,
+ * this CPU is preferred. This can be preempted/migrated, it will only result
+ * in more work.
+ */
+static int mpam_get_msc_preferred_cpu(struct mpam_msc *msc)
+{
+	int cpu = raw_smp_processor_id();
+
+	if (cpumask_test_cpu(cpu, &msc->accessibility))
+		return cpu;
+
+	return cpumask_first_and(&msc->accessibility, cpu_online_mask);
+}
+
+static int mpam_touch_msc(struct mpam_msc *msc, int (*fn)(void *a), void *arg)
+{
+	lockdep_assert_irqs_enabled();
+	lockdep_assert_cpus_held();
+	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
+
+	return smp_call_on_cpu(mpam_get_msc_preferred_cpu(msc), fn, arg, true);
 }
 
 static void mpam_reset_msc(struct mpam_msc *msc, bool online)
@@ -827,7 +858,7 @@ static void mpam_reset_msc(struct mpam_msc *msc, bool online)
 	struct mpam_msc_ris *ris;
 
 	list_for_each_entry_srcu(ris, &msc->ris, msc_list, srcu_read_lock_held(&mpam_srcu)) {
-		mpam_reset_ris(ris);
+		mpam_touch_msc(msc, &mpam_reset_ris, ris);
 
 		/*
 		 * Set in_reset_state when coming online. The reset state
-- 
2.43.0


