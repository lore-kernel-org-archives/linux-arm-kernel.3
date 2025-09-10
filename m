Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F7ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfQRITpYAf0GpEkZNmh91U4TXknyRrcXsTo1GmV4eyM=; b=QMq+/JKYcPbpm3gQRjXGMGo+9a
	uFkbIA9EYfytNdp9/At/MAVeNu/ibWRknec4YPCp6HpheFBA1Iq+6sxE7nh+767tx7YniWPTA7ODE
	17GXitrIo+SyntycGiI2rjJYRwIjdPyh4jzptdJqgPzaMlz6biEn2ZHxMgP8zSHfQhgyh3TFUZVmU
	h2kmQw3VmAbaQrTF5RqiQAICgAEJ/7egWQ0Nd0vYMsTAoKGIBXUOPe/LkMszAtVqEYxARzU7EwzWo
	io4/O0fcPvk5y4IUzIvwFAQwEFD+SbjkeYYM5XhIqK+YxSCRlhLb0l4HgTa9zL8uzD59mwn8VXwWz
	gFcOLvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRgF-0000000GdYf-1nqI;
	Wed, 10 Sep 2025 20:44:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRg6-0000000GdNa-2JKE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:44:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1D991C0A;
	Wed, 10 Sep 2025 13:44:21 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BB463F63F;
	Wed, 10 Sep 2025 13:44:25 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
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
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 12/29] arm_mpam: Add helpers for managing the locking around the mon_sel registers
Date: Wed, 10 Sep 2025 20:42:52 +0000
Message-Id: <20250910204309.20751-13-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250910204309.20751-1-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_134430_687044_EA585019 
X-CRM114-Status: GOOD (  18.72  )
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

The MSC MON_SEL register needs to be accessed from hardirq for the overflow
interrupt, and when taking an IPI to access these registers on platforms
where MSC are not accesible from every CPU. This makes an irqsave
spinlock the obvious lock to protect these registers. On systems with SCMI
mailboxes it must be able to sleep, meaning a mutex must be used. The
SCMI platforms can't support an overflow interrupt.

Clearly these two can't exist for one MSC at the same time.

Add helpers for the MON_SEL locking. The outer lock must be taken in a
pre-emptible context before the inner lock can be taken. On systems with
SCMI mailboxes where the MON_SEL accesses must sleep - the inner lock
will fail to be 'taken' if the caller is unable to sleep. This will allow
callers to fail without having to explicitly check the interface type of
each MSC.

Signed-off-by: James Morse <james.morse@arm.com>
---
Change since v1:
 * Made accesses to outer_lock_held READ_ONCE() for torn values in the failure
   case.
---
 drivers/resctrl/mpam_devices.c  |  3 +--
 drivers/resctrl/mpam_internal.h | 37 +++++++++++++++++++++++++++++----
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 24dc81c15ec8..a26b012452e2 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -748,8 +748,7 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 
 		mutex_init(&msc->probe_lock);
 		mutex_init(&msc->part_sel_lock);
-		mutex_init(&msc->outer_mon_sel_lock);
-		raw_spin_lock_init(&msc->inner_mon_sel_lock);
+		mpam_mon_sel_lock_init(msc);
 		msc->id = pdev->id;
 		msc->pdev = pdev;
 		INIT_LIST_HEAD_RCU(&msc->all_msc_list);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 828ce93c95d5..4cc44d4e21c4 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -70,12 +70,17 @@ struct mpam_msc {
 
 	/*
 	 * mon_sel_lock protects access to the MSC hardware registers that are
-	 * affected by MPAMCFG_MON_SEL.
+	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
+	 * Access to mon_sel is needed from both process and interrupt contexts,
+	 * but is complicated by firmware-backed platforms that can't make any
+	 * access unless they can sleep.
+	 * Always use the mpam_mon_sel_lock() helpers.
+	 * Accessed to mon_sel need to be able to fail if they occur in the wrong
+	 * context.
 	 * If needed, take msc->probe_lock first.
 	 */
-	struct mutex		outer_mon_sel_lock;
-	raw_spinlock_t		inner_mon_sel_lock;
-	unsigned long		inner_mon_sel_flags;
+	raw_spinlock_t		_mon_sel_lock;
+	unsigned long		_mon_sel_flags;
 
 	void __iomem		*mapped_hwpage;
 	size_t			mapped_hwpage_sz;
@@ -83,6 +88,30 @@ struct mpam_msc {
 	struct mpam_garbage	garbage;
 };
 
+/* Returning false here means accesses to mon_sel must fail and report an error. */
+static inline bool __must_check mpam_mon_sel_lock(struct mpam_msc *msc)
+{
+	WARN_ON_ONCE(msc->iface != MPAM_IFACE_MMIO);
+
+	raw_spin_lock_irqsave(&msc->_mon_sel_lock, msc->_mon_sel_flags);
+	return true;
+}
+
+static inline void mpam_mon_sel_unlock(struct mpam_msc *msc)
+{
+	raw_spin_unlock_irqrestore(&msc->_mon_sel_lock, msc->_mon_sel_flags);
+}
+
+static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
+{
+	lockdep_assert_held_once(&msc->_mon_sel_lock);
+}
+
+static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
+{
+	raw_spin_lock_init(&msc->_mon_sel_lock);
+}
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
-- 
2.39.5


