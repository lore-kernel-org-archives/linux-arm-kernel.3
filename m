Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A437105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3iVJCrQuiE/fT0n3ZNi75PrcATjrN/i4euH/oVenuM=; b=X9BZzq1hCS4NH5xVm00QVLWVus
	WM8Nl+TwZcO7wJR7ubDOBbPs8cu1FYF/HlSz+MhJ3oLh8Y2lMJX2sidnOdGXM4iCQl2Km7TQJcnnn
	ohzJ9Q32OvMXKeTirkvpK8GEsG5X6n3QBIs3MCenA6sCYj3krVmT5Ht0uRSU/VWf2EAa7j29VxPGl
	D9vI8XHOUcmE4LpgYbBYP569G/l4BCbPdS9IJPi80ayjeFKcHjcjKyyaygdR7Of8Coarx8kOqyEEy
	LZXXEnlGnriJDIeG9WRZ8BIYp8UGvi1cRHhoQAwfO28DZSASX8Qf/2U90o2eMvxIfLpx51KUubvfz
	haeiDG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13oo-00000000SLi-2ROB;
	Fri, 13 Mar 2026 14:48:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13ol-00000000SGs-1yPs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i3iVJCrQuiE/fT0n3ZNi75PrcATjrN/i4euH/oVenuM=; b=JXIXX2aEiaWTWjNz14toilzDMV
	l6j/hYsy2LIlZ23yV5w6zOpurxgy8EuNXNDfzFyPhxWUbZoqBnEOKQzt9BYkvF3TN9G5Z70tQxMnB
	twjp4SRWeLta28iAPlN3XsFXv+Xxj+aS76fxQyWY25tMWzZVBF8Y22kY0x864X0xebycMOwvaAUYm
	6X1fk3by/6N3pzyY4gapl5X+q4mB6wZOAN3GA0mbFp7v+8YTDu8W2EB5eOx2NRi5iYx263f12LT3K
	RfB8wy11XvjkTllwPvuOMjRfgr+EJ8olW3xS5F72pngVuOKnd9NLBpY+gJ85cQ3przkV9Jr2+1bb2
	bhIUbGrw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13oh-00000003a9q-2fQI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:48:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BD872454;
	Fri, 13 Mar 2026 07:48:36 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFFA43F7BD;
	Fri, 13 Mar 2026 07:48:38 -0700 (PDT)
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
Subject: [PATCH v6 31/40] arm_mpam: resctrl: Update the rmid reallocation limit
Date: Fri, 13 Mar 2026 14:46:08 +0000
Message-ID: <20260313144617.3420416-32-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_144844_110497_DE5E851F 
X-CRM114-Status: GOOD (  14.28  )
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

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Move waiting for cache info into it's own patch

Changes since v3:
Move check class is csu higher (just kept to document intent)
continue -> break

to squash update rmid limits
use raw_smp_processor_id()
---
 drivers/resctrl/mpam_resctrl.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 4f6a53d1bd4f..3979808f7253 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -438,6 +438,42 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 				 closid, rmid, val);
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
+	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
+		return 0;
+
+	/*
+	 * Assume cache levels are the same size for all CPUs...
+	 * The check just requires any online CPU and it can't go offline as we
+	 * hold the cpu lock.
+	 */
+	ci = get_cpu_cacheinfo_level(raw_smp_processor_id(), class->level);
+	if (!ci || ci->size == 0) {
+		pr_debug("Could not read cache size for class %u\n",
+			 class->level);
+		return -EINVAL;
+	}
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
@@ -856,6 +892,9 @@ static void mpam_resctrl_pick_counters(void)
 			/* CSU counters only make sense on a cache. */
 			switch (class->type) {
 			case MPAM_CLASS_CACHE:
+				if (update_rmid_limits(class))
+					break;
+
 				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
 				break;
 			default:
-- 
2.43.0


