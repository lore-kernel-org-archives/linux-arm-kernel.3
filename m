Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EB7CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+o9ed2SSFfq8hwlhNB2JzyZYKAunthFTx7PiP1Rblk=; b=kRkmC9mhHcpGXi4Yy+u8o79hjg
	vbLGgQC6wDrvZ2Z6e5ri9yOs1KKwM9XrVeMU52weCJZqkTQ+gLGHV+356XTE6PO3liuvVAW6dX9Ix
	y4woUscR3+dt1fjBY3x4yMgBd4YaReefZTAExg5IoXRNBKI31hY+/voxRvP5npYzm2muy4lPIvsu5
	3e7uCTF6671oV1fdUYMh2vzM/VDgwNNq0jvGvFw9ceLM4qwoE1K1R5BKbtMw6FL/GSAQAFSEgr/gR
	gR3QkVLQNS2txvgRcedEzhEzm+vEy9Wql/JEFoLtyEBB/1T0wtSgxkQDhIKBXFbbOjHEh/nRkKxqo
	KMs40uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2cq-0000000GTxp-2Lla;
	Mon, 17 Nov 2025 17:02:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2co-0000000GTv3-0fUw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:02:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04FEBFEC;
	Mon, 17 Nov 2025 09:02:38 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 564403F66E;
	Mon, 17 Nov 2025 09:02:40 -0800 (PST)
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
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH v5 25/34] arm_mpam: Add helpers to allocate monitors
Date: Mon, 17 Nov 2025 17:00:04 +0000
Message-ID: <20251117170014.4113754-26-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117170014.4113754-1-ben.horgan@arm.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_090246_394168_96E5A943 
X-CRM114-Status: GOOD (  11.00  )
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

MPAM's MSC support a number of monitors, each of which supports
bandwidth counters, or cache-storage-utilisation counters. To use
a counter, a monitor needs to be configured. Add helpers to allocate
and free CSU or MBWU monitors.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c  |  2 ++
 drivers/resctrl/mpam_internal.h | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index fe51ede1a1a6..d2d12a94a071 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -305,6 +305,8 @@ mpam_class_alloc(u8 level_idx, enum mpam_class_types type)
 	class->level = level_idx;
 	class->type = type;
 	INIT_LIST_HEAD_RCU(&class->classes_list);
+	ida_init(&class->ida_csu_mon);
+	ida_init(&class->ida_mbwu_mon);
 
 	list_add_rcu(&class->classes_list, &mpam_classes);
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index b947f30fbf14..e59c0f4d9ada 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -198,6 +198,9 @@ struct mpam_class {
 	/* member of mpam_classes */
 	struct list_head	classes_list;
 
+	struct ida		ida_csu_mon;
+	struct ida		ida_mbwu_mon;
+
 	struct mpam_garbage	garbage;
 };
 
@@ -277,6 +280,38 @@ struct mpam_msc_ris {
 	struct mpam_garbage	garbage;
 };
 
+static inline int mpam_alloc_csu_mon(struct mpam_class *class)
+{
+	struct mpam_props *cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
+		return -EOPNOTSUPP;
+
+	return ida_alloc_max(&class->ida_csu_mon, cprops->num_csu_mon - 1,
+			     GFP_KERNEL);
+}
+
+static inline void mpam_free_csu_mon(struct mpam_class *class, int csu_mon)
+{
+	ida_free(&class->ida_csu_mon, csu_mon);
+}
+
+static inline int mpam_alloc_mbwu_mon(struct mpam_class *class)
+{
+	struct mpam_props *cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
+		return -EOPNOTSUPP;
+
+	return ida_alloc_max(&class->ida_mbwu_mon, cprops->num_mbwu_mon - 1,
+			     GFP_KERNEL);
+}
+
+static inline void mpam_free_mbwu_mon(struct mpam_class *class, int mbwu_mon)
+{
+	ida_free(&class->ida_mbwu_mon, mbwu_mon);
+}
+
 /* List of all classes - protected by srcu*/
 extern struct srcu_struct mpam_srcu;
 extern struct list_head mpam_classes;
-- 
2.43.0


