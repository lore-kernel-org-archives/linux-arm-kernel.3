Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E704EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 19:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/yGhsELAKAJUNSM8mB/KvPZqZ0SRKM3hiF2dGHaZL8=; b=oDADO/ISrByCws37N7u2C0tnXp
	FyBSJQbvr9eXQ7kRXH5OamhUlHWppI4BqAFxrX9O8EKykNzRObY7dyUyzPW/4dst+HQFtjgJSmz6w
	f0nUDMvNahYbOP1LrJbV5FhHYN0BUJOB0my4R0ANYBv8Bzg58dffs7D7zCx08jeUM8eU5KY3ke9oE
	LUUwJ30UBrtnIWn8Byk+RvI1ufmj96c9jzn24NkQal/mATEHlrAw87BE4kTLWVJhDJkxVFoLV94Tf
	KHAVfJ8yHWm4wL1NgkR6EXEErEjwWzfYLvj+WP3m+QqHa4AMsZvFSdJKDr3EZnOjI9XRPfG4a8jLO
	aloSwtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJpO-0000000FjKM-1awd;
	Fri, 11 Jul 2025 19:54:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIdr-0000000FXc1-24cs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:38:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3E12247;
	Fri, 11 Jul 2025 11:38:28 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30A013F694;
	Fri, 11 Jul 2025 11:38:36 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 29/36] arm_mpam: Add helpers to allocate monitors
Date: Fri, 11 Jul 2025 18:36:41 +0000
Message-Id: <20250711183648.30766-30-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113839_659250_DFF1303D 
X-CRM114-Status: GOOD (  11.63  )
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

MPAM's MSC support a number of monitors, each of which supports
bandwidth counters, or cache-storage-utilisation counters. To use
a counter, a monitor needs to be configured. Add helpers to allocate
and free CSU or MBWU monitors.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c  |  2 ++
 drivers/platform/arm64/mpam/mpam_internal.h | 35 +++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 2cf081e7c4b2..b11503d8ef1b 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -338,6 +338,8 @@ mpam_class_alloc(u8 level_idx, enum mpam_class_types type, gfp_t gfp)
 	class->level = level_idx;
 	class->type = type;
 	INIT_LIST_HEAD_RCU(&class->classes_list);
+	ida_init(&class->ida_csu_mon);
+	ida_init(&class->ida_mbwu_mon);
 
 	list_add_rcu(&class->classes_list, &mpam_classes);
 
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index 1586d6bd12f0..aca91f7dfbf6 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -230,6 +230,9 @@ struct mpam_class {
 	/* member of mpam_classes */
 	struct list_head	classes_list;
 
+	struct ida		ida_csu_mon;
+	struct ida		ida_mbwu_mon;
+
 	struct mpam_garbage	garbage;
 };
 
@@ -305,6 +308,38 @@ struct mpam_msc_ris {
 	struct mpam_garbage	garbage;
 };
 
+static inline int mpam_alloc_csu_mon(struct mpam_class *class)
+{
+	struct mpam_props *cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
+		return -EOPNOTSUPP;
+
+	return ida_alloc_range(&class->ida_csu_mon, 0, cprops->num_csu_mon - 1,
+			       GFP_KERNEL);
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
+	return ida_alloc_range(&class->ida_mbwu_mon, 0,
+			       cprops->num_mbwu_mon - 1, GFP_KERNEL);
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
2.39.5


